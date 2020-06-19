Content-Type: multipart/mixed; boundary="===============6133279940987752548=="
MIME-Version: 1.0
From: Steven Rostedt <rostedt@goodmis.org>
To: lkp@lists.01.org
Subject: Re: e6caa20fbd ("sched: Remove struct sched_class::next field"): BUG: kernel reboot-without-warning in early-boot stage, last printk: early console in setup code
Date: Fri, 19 Jun 2020 10:17:13 -0400
Message-ID: <20200619101713.0fee85b4@oasis.local.home>
In-Reply-To: <20200618092016.GE576905@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============6133279940987752548==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 18 Jun 2020 11:20:16 +0200
Peter Zijlstra <peterz@infradead.org> wrote:

> > early console in setup code
> > BUG: kernel reboot-without-warning in early-boot stage, last printk: ea=
rly console in setup code  =

> =

> Weird, I can indeed reproduce this.. a kernel with this patch on booted
> on my test box just fine, but even when I converted to given config to
> x86_64 it stops dead after that initial print.
> =

> Attaching GDB to qemu also provided nothing useful, it says it just
> exited.
> =

> Weird... I'll poke a little more.

My machine locks up hard with this config. Then when I tried to test it
without the patch, I realized I never had it applied. Thus, I don't
reproduce the issue with the patch, but the config given doesn't boot
on my machine without this suspected patch.

-- Steve
--===============6133279940987752548==--

