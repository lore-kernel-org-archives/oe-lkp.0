Content-Type: multipart/mixed; boundary="===============3774308507870181844=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [kprobes/x86] a19b2e3d78: WARNING:at_kernel/locking/lockdep.c:#trace_hardirqs_off_caller
Date: Mon, 02 Oct 2017 09:19:10 -0700
Message-ID: <CA+55aFzNT9VcdbyLTffrYXV10yYAYnKa_taG+7gGdeRfa43CDg@mail.gmail.com>
In-Reply-To: <20171003004605.8da2be5a86be135f792d29bd@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============3774308507870181844==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 2, 2017 at 8:46 AM, Masami Hiramatsu <mhiramat@kernel.org> wr=
ote:
>
> I'm considering to remove disabling-irq itself from jprobe.
> (Frankly to say, I would like to remove jprobe itself...)

Please please please...

That would be lovely. The jprobe thing is really nasty, and despite
the thing having been around forever (looking at history, it does back
to 2004) there are very few users and they all look dubious to me.

I seriously doubt anybody uses them, and I suspect our current tracing
infrastructure is just *so* much better and more powerful than jprobes
was.

So I'd heartily recommend just getting rid of jprobes. Or at least
trying, and seeing if anybody actually even notices (and then
reverting the removal and looking at what the usage ends up actually
being).

                            Linus

--===============3774308507870181844==--

