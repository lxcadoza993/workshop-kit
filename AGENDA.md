# Agenda — API Integration Workshop

**Duration:** 3 hours, one break
**Group size:** 8–16. Above 16 the exercise support does not scale without a second facilitator.
**Prerequisite:** participants ran `./setup.sh` and it printed `Ready`.

Timings are the ones I actually observe, not the ones I would like to observe.
The first exercise always runs long; budget for it rather than rushing it.

---

## 00:00 — 00:15 · Opening

- What the API does, in two sentences and one diagram.
- The shape of the session: three exercises, each building on the last.
- Confirm the room is set up. Anyone still fighting their environment gets
  paired with someone whose check passed. Do not let one broken laptop stall
  the group.

## 00:15 — 00:35 · Walkthrough: one request, end to end

Live-coded, no slides. A single `GET`, typed out:

- Base URL and path.
- Headers that matter, and why `Accept` is not optional.
- Reading the status code *before* parsing the body.
- What the response looks like when it goes wrong.

## 00:35 — 01:15 · Exercise 1 — First call

[`exercises/01-first-call`](exercises/01-first-call)

Participants fetch a resource and print two fields. The point is not difficulty;
it is confirming that every person in the room can make a request from their own
machine. Expect proxy and TLS problems here, and nowhere else.

## 01:15 — 01:30 · Break

Actual break. Do not use it for "just one more thing".

## 01:30 — 02:00 · Exercise 2 — Pagination

[`exercises/02-pagination`](exercises/02-pagination)

Collect a full result set across pages. Discussion afterwards: page-number
versus cursor pagination, and why the second one is what you want when records
are being written while you read.

## 02:00 — 02:40 · Exercise 3 — Error handling

[`exercises/03-error-handling`](exercises/03-error-handling)

Deliberately break things: a 404, a timeout, a malformed body. Participants make
their client fail in a way that a colleague could debug from the log line alone.
This is the exercise people remember.

## 02:40 — 03:00 · Wrap-up

- Where the reference documentation lives.
- How to report a documentation bug, and that it is genuinely wanted.
- Open questions. If nobody asks anything, ask them what surprised them — that
  question gets answers when "any questions?" does not.

---

## Facilitator notes

- Have the finished solution for every exercise on your own machine, working.
  You will need to show it when someone is stuck at minute 35.
- Announce the break time at the start. People check their phones less.
- If the room is remote, cut Exercise 2 rather than compressing all three.
