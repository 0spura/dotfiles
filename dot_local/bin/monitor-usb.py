"""Control only the front USB port feeding the peripheral hub."""
import signal
import subprocess
import time

DDC = "/opt/homebrew/bin/betterdisplaycli"
USB = "/opt/homebrew/bin/uhubctl"
DISPLAY = "ASUS VG279Q1A"
HUBS = (("2-1", "05ac:800b"), ("2-2", "05ac:800c"))


def run(args):
    try:
        return subprocess.run(args, capture_output=True, text=True, timeout=5)
    except (OSError, subprocess.TimeoutExpired):
        return None


def monitor_state():
    result = run([DDC, "get", f"-name={DISPLAY}", "-ddc", "-vcp=0xD6", "-value"])
    if result is None:
        return "unknown"
    if result.returncode == 0 and result.stdout.strip() == "1":
        return "on"
    if result.returncode != 0 and (result.stdout + result.stderr).strip() == "Failed.":
        # A responsive app distinguishes a DDC failure from a missing CLI service.
        health = run([DDC, "get", "-identifiers"])
        if health is not None and health.returncode == 0 and health.stdout.strip():
            return "off"
    return "unknown"


def power(action, quiet=False):
    success = True
    for location, vendor in HUBS:
        result = run([USB, "-e", "-l", location, "-n", vendor, "-p", "2", "-a", action])
        success = success and result is not None and result.returncode == 0
    if success and not quiet:
        print(f"Peripheral USB power: {action}", flush=True)
    elif not success:
        print(f"Peripheral USB power command failed: {action}", flush=True)
    return success


def stop(signum, frame):
    raise SystemExit(0)


def main():
    signal.signal(signal.SIGTERM, stop)
    signal.signal(signal.SIGINT, stop)
    off_since = None
    applied = None
    print("Monitor USB service started; controlling front port 2 only", flush=True)
    try:
        while True:
            state = monitor_state()
            if state == "off":
                if off_since is None:
                    off_since = time.monotonic()
                desired = "off" if time.monotonic() - off_since >= 10 else "on"
            else:
                off_since = None
                # Unknown readings must not strand the keyboard without power.
                desired = "on"
            # macOS may re-enable a USB port; enforce off while the monitor stays off.
            if desired != applied or desired == "off":
                if power(desired, quiet=desired == applied):
                    applied = desired
                else:
                    power("on")
                    applied = None
                    off_since = None
            time.sleep(2)
    finally:
        power("on")


if __name__ == "__main__":
    main()
