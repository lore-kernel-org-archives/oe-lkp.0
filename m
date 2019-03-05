Content-Type: multipart/mixed; boundary="===============4696342159264751949=="
MIME-Version: 1.0
From: Masami Hiramatsu <mhiramat@kernel.org>
To: lkp@lists.01.org
Subject: Re: [uaccess] 780464aed0: WARNING:at_arch/x86/include/asm/uaccess.h:#strnlen_user/0x
Date: Wed, 06 Mar 2019 00:18:11 +0900
Message-ID: <20190306001811.c7cf77cb26b9d816a7561e7b@kernel.org>
In-Reply-To: <20190305145306.GL32477@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============4696342159264751949==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 5 Mar 2019 15:53:06 +0100
Peter Zijlstra <peterz@infradead.org> wrote:

> On Tue, Mar 05, 2019 at 10:58:01PM +0900, Masami Hiramatsu wrote:
> =

> > Could you tell me why WARN_ON_ONCE(!in_task()) is needed in access_ok()?
> =

> That came from here:
> =

>   lkml.kernel.org/r/20190225145240.GB32534(a)hirez.programming.kicks-ass.=
net
> =

> Because in-irq usage is dodgy, since we don't actually know what mm or
> ds it loaded.

Yes, I would like to allow it only if setting pagefault-disable correctly.
(and setting ds too, it is good to me)

> =

> > > I dislike that whole KERNEL_DS thing, but obviously that's not someth=
ing
> > > that's going away.
> > > =

> > > Would something like:
> > > =

> > > 	WARN_ON_ONCE(!(in_task || segment_eq(get_fs(), USER_DS)))
> > > =

> > > Work? Then we allow KERNEL_DS in task context, but for interrupt and
> > > others require USER_DS.
> > =

> > But what would this mean? I can't understand why we limit using
> > access_ok() so strictly and narrow the cases.
> =

> Because it's been a source of bugs. Any sanity checking we can put in
> seems like a good thing at this point.

Hmm, I see yours is strict, fit with current code, but complicated rule.

 - strncpy_from_user() can access user memory with set_fs(USER_DS) =

   in task context

 - strncpy_from_user() can access kernel memory with set_fs(KERNEL_DS) =

   in task context

 - strncpy_from_user() can access user memory in IRQ context if
   pagefault is disabled and with set_fs(USER_DS). (but pagefault-disabled
   is not verified)

 - strncpy_from_user() never allowed to access kernel memory in IRQ context,
   even if pagefault is disabled and with set_fs(KERNEL_DS).


And mine is simple.

 - strncpy_from_user() can access user memory with set_fs(USER_DS)
   in task context

 - strncpy_from_user() can access kernel memory with set_fs(KERNEL_DS)
   in task context

 - strncpy_from_user() can access user/kernel memory (depends on DS)
   in IRQ context if pagefault is disabled. (both verified)


Thank you,

-- =

Masami Hiramatsu <mhiramat@kernel.org>

--===============4696342159264751949==--

