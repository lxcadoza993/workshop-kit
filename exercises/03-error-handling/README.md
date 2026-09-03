# Exercise 3 — Error handling

**Time:** 40 minutes
**Goal:** make your client fail in a way a colleague could debug from the log
line alone.

## The task

Take the script from Exercise 1 and make it survive four failure modes. For each
one, decide what your client should do and what it should say.

| # | How to trigger it | What you must decide |
|---|---|---|
| 1 | `GET /posts/9999` → 404 | Is a missing record an error, or a valid "not found" result? |
| 2 | Point the base URL at `https://jsonplaceholder.typicode.com:9999` | How long do you wait before giving up? |
| 3 | `GET /` and parse it as a post | What happens when the body is not the shape you expected? |
| 4 | Any request with the network turned off | Does the message tell you it was the network, or just "error"? |

## The rule for messages

Every failure message must answer three questions:

1. **What was being attempted?** (`GET /posts/9999`)
2. **What happened?** (`404 Not Found`)
3. **What should the reader do?** (`check the post id`)

A message that answers fewer than three is not finished.

Bad:

```
Error: request failed
```

Good:

```
GET /posts/9999 returned 404 Not Found — no post with that id exists
```

## Rules

- A 404 is usually not an exception. It is a legitimate answer to a legitimate
  question, and modelling it as a crash makes callers write `try` blocks around
  ordinary control flow.
- Never log the full request headers. That is how credentials end up in log
  aggregation systems.
- If you retry, retry only on timeouts and 5xx, wait longer between attempts,
  and cap the number of attempts. Retrying a 400 just sends the same bad request
  again, more often.

## Discussion

Compare messages across the room. The interesting question is not whose code is
shortest — it is whose message you would rather receive at 2am from a service
you have never read the source of.

Worth reading afterwards: **RFC 9457, Problem Details for HTTP APIs**, which
defines a standard JSON body for exactly this.
