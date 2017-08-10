Content-Type: multipart/mixed; boundary="===============1647562588333989588=="
MIME-Version: 1.0
From: Minchan Kim <minchan@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm] 7674270022: will-it-scale.per_process_ops -19.3% regression
Date: Thu, 10 Aug 2017 13:20:40 +0900
Message-ID: <20170810042040.GA2249@bbox>
In-Reply-To: <80589593-6F0E-4421-9279-681D5B388100@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1647562588333989588==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 09, 2017 at 09:14:50PM -0700, Nadav Amit wrote:

Hi Nadav,

< snip >

> >>>>> According to the description it is "testcase:brk increase/decrease =
of one
> >>>>> page=E2=80=9D. According to the mode it spawns multiple processes, =
not threads.
> >>>>> =

> >>>>> Since a single page is unmapped each time, and the iTLB-loads incre=
ase
> >>>>> dramatically, I would suspect that for some reason a full TLB flush=
 is
> >>>>> caused during do_munmap().
> >>>>> =

> >>>>> If I find some free time, I=E2=80=99ll try to profile the workload =
- but feel free
> >>>>> to beat me to it.
> >>>> =

> >>>> The root-cause appears to be that tlb_finish_mmu() does not call
> >>>> dec_tlb_flush_pending() - as it should. Any chance you can take care=
 of it?
> >>> =

> >>> Oops, but with second looking, it seems it's not my fault. ;-)
> >>> https://marc.info/?l=3Dlinux-mm&m=3D150156699114088&w=3D2
> >>> =

> >>> Anyway, thanks for the pointing out.
> >>> xiaolong.ye, could you retest with this fix?
> >> =

> >> I've queued tests for 5 times and results show this patch (e8f682574e4=
 "mm:
> >> decrease tlb flush pending count in tlb_finish_mmu") does help recover=
 the
> >> performance back.
> >> =

> >> 378005bdbac0a2ec  76742700225cad9df49f053993  e8f682574e45b6406dadfffe=
b4  =

> >> ----------------  --------------------------  ------------------------=
--  =

> >>         %stddev      change         %stddev      change         %stddev
> >>             \          |                \          |                \  =

> >>   3405093             -19%    2747088              -2%    3348752     =
   will-it-scale.per_process_ops
> >>      1280 =C2=B1  3%        -2%       1257 =C2=B1  3%        -6%      =
 1207        vmstat.system.cs
> >>      2702 =C2=B1 18%        11%       3002 =C2=B1 19%        17%      =
 3156 =C2=B1 18%  numa-vmstat.node0.nr_mapped
> >>     10765 =C2=B1 18%        11%      11964 =C2=B1 19%        17%      =
12588 =C2=B1 18%  numa-meminfo.node0.Mapped
> >>      0.00 =C2=B1 47%       -40%       0.00 =C2=B1 45%       -84%      =
 0.00 =C2=B1 42%  mpstat.cpu.soft%
> >> =

> >> Thanks,
> >> Xiaolong
> > =

> > Thanks for the testing!
> =

> Sorry again for screwing your patch, Minchan.

Never mind! It always happens. :)
In this chance, I really appreciates your insight/testing/cooperation!

--===============1647562588333989588==--

