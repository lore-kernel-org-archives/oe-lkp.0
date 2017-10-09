Content-Type: multipart/mixed; boundary="===============2566784644558942640=="
MIME-Version: 1.0
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lockdep] b09be676e0 BUG: unable to handle kernel NULL pointer dereference at 000001f2
Date: Mon, 09 Oct 2017 08:03:24 -0500
Message-ID: <20171009130324.jxcv6bceforwvhfr@treble>
In-Reply-To: <20171009125404.nxo5zke62cv42x2s@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============2566784644558942640==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 09, 2017 at 02:54:04PM +0200, Peter Zijlstra wrote:
> On Mon, Oct 09, 2017 at 08:21:13PM +0800, Fengguang Wu wrote:
> > > > From e7840ad76515f0b5061fcdd098b57b7c01b61482 Mon Sep 17 00:00:00 2=
001
> > > > Message-Id: <e7840ad76515f0b5061fcdd098b57b7c01b61482.1507215196.gi=
t.jpoimboe@redhat.com>
> > > > From: Josh Poimboeuf <jpoimboe@redhat.com>
> > > > Date: Thu, 5 Oct 2017 09:43:59 -0500
> > > > Subject: [PATCH 1/2] unwinder fixes
> > > > =

> > > > ---
> > > >  arch/x86/kernel/unwind_frame.c | 33 ++++++++++++++++++++++++++++++=
---
> > =

> > I just test 316 boots and see 7 WARNINGs:
> > =

> > [  404.948035] WARNING: kernel stack frame pointer at c6ea3ecd in init:=
212 has bad value   (null)
> > [  298.118383] WARNING: kernel stack frame pointer at cde07dad in init:=
1 has bad value bc000000
> > [  112.848677] WARNING: kernel stack frame pointer at cde07dbd in swapp=
er/0:1 has bad value c2000000
> > [  127.942417] WARNING: kernel stack frame pointer at cf95de71 in rb_pr=
oducer:50 has bad value 03cf95de
> > [    4.736938] WARNING: kernel stack frame pointer at bf643d59 in kwork=
er/0:1:15 has bad value b5000000
> > [  308.260066] WARNING: kernel stack frame pointer at bde07da5 in udevd=
:155 has bad value b5bfa17b

These unwinder warnings can be ignored.  I meant to disable them on
32-bit with the patch, but obviously failed to do so.

-- =

Josh

--===============2566784644558942640==--

