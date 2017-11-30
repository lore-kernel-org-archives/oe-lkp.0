Content-Type: multipart/mixed; boundary="===============7219644789311207751=="
MIME-Version: 1.0
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: lkp@lists.01.org
Subject: Re: BUG: KASAN: slab-out-of-bounds in perf_callchain_user+0x494/0x530
Date: Thu, 30 Nov 2017 16:37:12 -0300
Message-ID: <20171130193712.GU3298@kernel.org>
In-Reply-To: <20171130082026.ih7esfpn4wfsfoge@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============7219644789311207751==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Em Thu, Nov 30, 2017 at 09:20:26AM +0100, Peter Zijlstra escreveu:
> On Thu, Nov 30, 2017 at 10:32:19AM +0800, Fengguang Wu wrote:
> > Hello,
> > =

> > FYI this happens in mainline kernel 4.15.0-rc1.
> > It looks like a new regression and hard to bisect.
> > =

> > It occurs in 1 out of 57 boots.
> > =

> > [   10.009610] chown (367) used greatest stack depth: 26944 bytes left
> > Kernel tests: Boot OK!
> > [   30.357729] trinity-main uses obsolete (PF_INET,SOCK_PACKET)
> > [   31.301433] sock: process `trinity-main' is using obsolete setsockop=
t SO_BSDCOMPAT
> > [   31.310289] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > [   31.311490] BUG: KASAN: slab-out-of-bounds in perf_callchain_user+0x=
494/0x530:
> > 						perf_callchain_store at include/linux/perf_event.h:1128
> > 						 (inlined by) perf_callchain_user at arch/x86/events/core.c:2485
> =

> I don't think we recently changed anything here...
> =

> But I do have vague memories of something being off here; I never quite
> could penetrate the max_stack / contexts_maxed stuff, and istr acme was
> going to have a peek.
 =

Sure, but I saw some backward ring buffer stuff in there as well, no?
IIRC that came after the max-stack code, Adding Wang to the CC list.

- Arnaldo

--===============7219644789311207751==--

