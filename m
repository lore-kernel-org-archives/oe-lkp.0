Content-Type: multipart/mixed; boundary="===============9006767602628807047=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [lockdep] b09be676e0 BUG: unable to handle kernel NULL pointer dereference at 000001f2
Date: Mon, 09 Oct 2017 14:54:04 +0200
Message-ID: <20171009125404.nxo5zke62cv42x2s@hirez.programming.kicks-ass.net>
In-Reply-To: <20171009122113.nj2tn22mt2oxptvr@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9006767602628807047==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 09, 2017 at 08:21:13PM +0800, Fengguang Wu wrote:
> > > From e7840ad76515f0b5061fcdd098b57b7c01b61482 Mon Sep 17 00:00:00 2001
> > > Message-Id: <e7840ad76515f0b5061fcdd098b57b7c01b61482.1507215196.git.=
jpoimboe@redhat.com>
> > > From: Josh Poimboeuf <jpoimboe@redhat.com>
> > > Date: Thu, 5 Oct 2017 09:43:59 -0500
> > > Subject: [PATCH 1/2] unwinder fixes
> > > =

> > > ---
> > >  arch/x86/kernel/unwind_frame.c | 33 ++++++++++++++++++++++++++++++---
> =

> I just test 316 boots and see 7 WARNINGs:
> =

> [  404.948035] WARNING: kernel stack frame pointer at c6ea3ecd in init:21=
2 has bad value   (null)
> [  298.118383] WARNING: kernel stack frame pointer at cde07dad in init:1 =
has bad value bc000000
> [  112.848677] WARNING: kernel stack frame pointer at cde07dbd in swapper=
/0:1 has bad value c2000000
> [  127.942417] WARNING: kernel stack frame pointer at cf95de71 in rb_prod=
ucer:50 has bad value 03cf95de
> [    4.736938] WARNING: kernel stack frame pointer at bf643d59 in kworker=
/0:1:15 has bad value b5000000
> [  308.260066] WARNING: kernel stack frame pointer at bde07da5 in udevd:1=
55 has bad value b5bfa17b
> =

> [  277.473596] WARNING: CPU: 0 PID: 520 at kernel/locking/lockdep.c:3841 =
check_flags+0x119/0x1b0

That's much better than NULL pointer derefs. Is there any chance I could
get your userspace image such that I can try and repro?

It appears to run trinity..

And you're still using the same .config from the original report?

--===============9006767602628807047==--

