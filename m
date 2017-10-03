Content-Type: multipart/mixed; boundary="===============0216254405918563221=="
MIME-Version: 1.0
From: Masami Hiramatsu <mhiramat@kernel.org>
To: lkp@lists.01.org
Subject: Re: [kprobes/x86] a19b2e3d78: WARNING:at_kernel/locking/lockdep.c:#trace_hardirqs_off_caller
Date: Tue, 03 Oct 2017 11:26:28 +0900
Message-ID: <20171003112628.932b9c9737a609de5ea7772d@kernel.org>
In-Reply-To: <CA+55aFzNT9VcdbyLTffrYXV10yYAYnKa_taG+7gGdeRfa43CDg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0216254405918563221==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 2 Oct 2017 09:19:10 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Mon, Oct 2, 2017 at 8:46 AM, Masami Hiramatsu <mhiramat@kernel.org> =
wrote:
> >
> > I'm considering to remove disabling-irq itself from jprobe.
> > (Frankly to say, I would like to remove jprobe itself...)
> =

> Please please please...
> =

> That would be lovely. The jprobe thing is really nasty, and despite
> the thing having been around forever (looking at history, it does back
> to 2004) there are very few users and they all look dubious to me.
> =

> I seriously doubt anybody uses them, and I suspect our current tracing
> infrastructure is just *so* much better and more powerful than jprobes
> was.

I completely agree. Moreover, jprobe can not handle the functions
which is optimized and modified function type by compiler nowadays.

> So I'd heartily recommend just getting rid of jprobes. Or at least
> trying, and seeing if anybody actually even notices (and then
> reverting the removal and looking at what the usage ends up actually
> being).

OK, should I just make a series to remove jprobes and its few users,
or mark APIs obsolete and remove it after next version?

Thank you,

> =

>                             Linus


-- =

Masami Hiramatsu <mhiramat@kernel.org>

--===============0216254405918563221==--

