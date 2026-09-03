# Exercise 2 — Pagination

**Time:** 30 minutes
**Goal:** collect a complete result set that the server will not give you in one
response.

## The task

The demo API supports page-number pagination through query parameters:

```
GET /posts?_page=1&_limit=10
```

Write a script that:

1. Requests the first page
2. Keeps requesting subsequent pages until a page comes back empty
3. Collects everything into one list
4. Prints the total count, then the first and last `id`

There are 100 posts in total, so with `_limit=10` you should make 11 requests —
ten with data, one empty page that stops the loop.

## Expected output

```
collected 100 posts
first id: 1
last id: 100
```

## Rules

- Put a hard cap on the loop — stop after 50 pages no matter what. A pagination
  bug on the server side should not turn your client into a load generator.
- Do not hardcode `100` or `11`. If you know the answer in advance, you are not
  writing a pagination loop.

## Discussion

Once the room has working loops:

- **What breaks if a record is deleted while you are on page 3?** With
  page-number pagination, one record shifts back and you never see it. This is
  not hypothetical; it is the standard failure of offset pagination.
- **Cursor pagination** avoids that by pointing at a record rather than a
  position. Check whether the API you actually use offers it.
- **The `Link` header.** Some APIs hand you the next page's URL instead of making
  you build one. This API is among them — run
  `curl -sI 'https://jsonplaceholder.typicode.com/posts?_page=1&_limit=10'` and
  look at the `link` header. Following a URL the server gave you is more robust
  than assembling one yourself.
