# workshop-kit

The template I start every API workshop from. Three hours, three exercises, and
a preflight script that catches the environment problems before they eat the
first hour of the session.

Nothing here is specific to one API. Swap the base URL in the exercises and the
structure holds.

## What is in here

| File | Purpose |
|---|---|
| [`AGENDA.md`](AGENDA.md) | Session plan with the timings I actually observe |
| [`setup.sh`](setup.sh) | Preflight check — run it before the session, not during |
| [`exercises/`](exercises) | Three exercises, each building on the previous one |

## For participants

Run this on the machine you will use during the workshop, ideally a day early:

```sh
./setup.sh
```

It changes nothing. It checks for Python 3.8+, Node 18+, `curl`, and `git`, and
confirms you can actually reach the demo API from your network. If it prints
`Ready`, you are done. If it fails, there is time to fix it — which is the entire
point of running it early.

## For facilitators

Read `AGENDA.md` first, then work through all three exercises yourself on the
machine you will present from. You will need a finished solution to show when
someone is stuck.

Two things that decide whether the session works:

- **The room's network.** Corporate TLS interception and proxies cause more
  workshop failures than anything in the material. `setup.sh` tests for this
  specifically.
- **Not rushing Exercise 1.** It looks trivial and it always runs long, because
  it is where every environment problem surfaces. The agenda gives it forty
  minutes on purpose.

## Adapting it

The exercises run against [JSONPlaceholder](https://jsonplaceholder.typicode.com)
so that nobody needs credentials on day one. To use your own API, change the base
URL in each exercise and add the authentication step as a short section between
the walkthrough and Exercise 1 — never inside Exercise 1 itself, or you will not
be able to tell an auth problem from a network problem.

## License

MIT — see [LICENSE](LICENSE).
