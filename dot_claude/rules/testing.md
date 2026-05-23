# Testing Principles

## Test Quality

- Follow Arrange-Act-Assert structure
- Test names describe behavior: `returns empty list when query matches nothing`
- Each test is fully independent — no shared mutable state between tests
- Mock only external dependencies (network, filesystem, time, random)
- Test observable behavior, not internal implementation details

## Edge Cases to Always Cover

- Null, undefined, and empty inputs
- Boundary values
- Invalid types passed in
- Error conditions and propagation

## When Tests Fail

- Fix the implementation, not the test (unless the test itself is wrong)
- Check test isolation — shared state often causes flaky failures
- Verify mocks match actual external behavior
