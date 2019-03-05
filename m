Content-Type: multipart/mixed; boundary="===============5537313977306817630=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [uaccess] 780464aed0: WARNING:at_arch/x86/include/asm/uaccess.h:#strnlen_user/0x
Date: Tue, 05 Mar 2019 15:53:06 +0100
Message-ID: <20190305145306.GL32477@hirez.programming.kicks-ass.net>
In-Reply-To: <20190305225801.a63ac8712105ab2e673be1bc@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============5537313977306817630==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 05, 2019 at 10:58:01PM +0900, Masami Hiramatsu wrote:

> Could you tell me why WARN_ON_ONCE(!in_task()) is needed in access_ok()?

That came from here:

  lkml.kernel.org/r/20190225145240.GB32534(a)hirez.programming.kicks-ass.net

Because in-irq usage is dodgy, since we don't actually know what mm or
ds it loaded.

> > I dislike that whole KERNEL_DS thing, but obviously that's not something
> > that's going away.
> > =

> > Would something like:
> > =

> > 	WARN_ON_ONCE(!(in_task || segment_eq(get_fs(), USER_DS)))
> > =

> > Work? Then we allow KERNEL_DS in task context, but for interrupt and
> > others require USER_DS.
> =

> But what would this mean? I can't understand why we limit using
> access_ok() so strictly and narrow the cases.

Because it's been a source of bugs. Any sanity checking we can put in
seems like a good thing at this point.

--===============5537313977306817630==--

