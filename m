Content-Type: multipart/mixed; boundary="===============0434541412159235782=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [timer] 17cdf560f27: +4.0% boot-meminfo.VmallocUsed
Date: Fri, 03 Apr 2015 16:23:20 +0200
Message-ID: <20150403142320.GI27490@worktop.programming.kicks-ass.net>
In-Reply-To: <CAC=cRTNjmJF6icPUrWdgJu8wcX-fKpgTo9V4o6wA5z-8sfncwA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0434541412159235782==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 03, 2015 at 09:03:48AM +0800, huang ying wrote:
> On Thu, Apr 2, 2015 at 3:54 PM, Peter Zijlstra <peterz@infradead.org> w=
rote:
> =

> > On Thu, Apr 02, 2015 at 09:06:09AM +0800, Huang Ying wrote:
> > > FYI, we noticed the below changes on
> > >
> > > git://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git
> > timer/alloc_tvec_statically
> > > commit 17cdf560f2727f687ab159707d0aa591f8a2f82d ("timer: Allocate
> > per-cpu tvec_base's statically")
> > >
> > >
> > > testbox/testcase/testparams: lkp-sbx04/boot/performance-1
> > >
> > > c5e77f5216abdd1d  17cdf560f2727f687ab159707d
> > > ----------------  --------------------------
> > >          %stddev     %change         %stddev
> > >              \          |                \
> > >     410996 =C2=B1  0%      +4.0%     427412 =C2=B1  0%  boot-meminfo.=
VmallocUsed
> > >
> > > testbox/testcase/testparams: wsm/boot/performance-1
> > >
> > > c5e77f5216abdd1d  17cdf560f2727f687ab159707d
> > > ----------------  --------------------------
> > >      85712 =C2=B1  0%      +2.4%      87772 =C2=B1  0%  boot-meminfo.=
VmallocUsed
> > >
> > > testbox/testcase/testparams: lkp-snb01/boot/performance-1
> > >
> > > c5e77f5216abdd1d  17cdf560f2727f687ab159707d
> > > ----------------  --------------------------
> > >     447001 =C2=B1  0%      -1.0%     442558 =C2=B1  0%  boot-slabinfo=
.num_objs
> > >     125616 =C2=B1  5%     -13.5%     108720 =C2=B1  4%  boot-meminfo.=
DirectMap4k
> > >     347196 =C2=B1  0%      +4.7%     363612 =C2=B1  0%  boot-meminfo.=
VmallocUsed
> > >
> >
> > well, duh.. it changes a dynamic allocation into a static per-cpu one.
> > What did you expect?
> >
> =

> Just FYI.  This may be the expected behavior.  If so, you have a third
> party test report.

Ah ok. I thought you thought it was a bug/regression.

Thanks

--===============0434541412159235782==--

