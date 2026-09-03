# Exercise 1 — First call

**Time:** 40 minutes
**Goal:** make one successful request from your own machine and print two fields
from the response.

## The task

Write a script, in whatever language you brought, that:

1. Sends `GET https://jsonplaceholder.typicode.com/posts/1`
2. Checks the response status code before touching the body
3. Parses the JSON
4. Prints the `id` and the `title`, one per line

That is the whole exercise. It is small on purpose.

## Expected output

```
id: 1
title: sunt aut facere repellat provident occaecati excepturi optio reprehenderit
```

## Rules

- Set an explicit timeout. Ten seconds is fine. A request with no timeout can
  hang forever, and it will eventually pick the worst possible moment to do so.
- Do not use `try` around the whole script to make an error disappear. If it
  fails, we want to see how.

## If you get stuck

| Symptom | Usually means |
|---|---|
| Connection hangs, then times out | A proxy is required on this network |
| Certificate verification error | Corporate TLS interception — ask the facilitator, do not disable verification |
| `KeyError` / `undefined` on `title` | You parsed an error body as if it were a post; print the raw response |
| 403 with an HTML body | You are being served a captive portal, not the API |

## When you are done

Change the path to `/posts/9999` and run it again. Do not fix anything yet —
just look at what your script does. That behaviour is the subject of
[Exercise 3](../03-error-handling).
