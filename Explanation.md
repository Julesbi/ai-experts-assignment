# Explanation

## What was the bug?

The HttpClient did not refresh the OAuth2 token when the stored token was a plain JavaScript object instead of an instance of `OAuth2Token`. As a result, API requests were sent without an Authorization header.

## Why did it happen?

The refresh logic relied on a truthiness check combined with an `instanceof OAuth2Token` condition. A plain object token is truthy but not an instance of `OAuth2Token`, so the refresh logic was skipped even though the token was invalid.

## Why does the fix solve it?

The condition was updated to refresh the token whenever it is missing, not an `OAuth2Token` instance, or expired. This guarantees that only valid token instances are used and ensures the Authorization header is always set for API requests.

## Edge case not covered

The tests do not verify behavior when a token has a valid structure but contains an empty or malformed access token string. Additional validation could ensure such tokens are also refreshed.
