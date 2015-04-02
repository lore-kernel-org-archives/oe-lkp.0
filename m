Content-Type: multipart/mixed; boundary="===============0032485238121826913=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [timer] 17cdf560f27: +4.0% boot-meminfo.VmallocUsed
Date: Thu, 02 Apr 2015 09:54:43 +0200
Message-ID: <20150402075443.GR23123@twins.programming.kicks-ass.net>
In-Reply-To: <1427936769.6726.2.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0032485238121826913==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 02, 2015 at 09:06:09AM +0800, Huang Ying wrote:
> FYI, we noticed the below changes on
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git timer/all=
oc_tvec_statically
> commit 17cdf560f2727f687ab159707d0aa591f8a2f82d ("timer: Allocate per-cpu=
 tvec_base's statically")
> =

> =

> testbox/testcase/testparams: lkp-sbx04/boot/performance-1
> =

> c5e77f5216abdd1d  17cdf560f2727f687ab159707d  =

> ----------------  --------------------------  =

>          %stddev     %change         %stddev
>              \          |                \  =

>     410996 =C2=B1  0%      +4.0%     427412 =C2=B1  0%  boot-meminfo.Vmal=
locUsed
> =

> testbox/testcase/testparams: wsm/boot/performance-1
> =

> c5e77f5216abdd1d  17cdf560f2727f687ab159707d  =

> ----------------  --------------------------  =

>      85712 =C2=B1  0%      +2.4%      87772 =C2=B1  0%  boot-meminfo.Vmal=
locUsed
> =

> testbox/testcase/testparams: lkp-snb01/boot/performance-1
> =

> c5e77f5216abdd1d  17cdf560f2727f687ab159707d  =

> ----------------  --------------------------  =

>     447001 =C2=B1  0%      -1.0%     442558 =C2=B1  0%  boot-slabinfo.num=
_objs
>     125616 =C2=B1  5%     -13.5%     108720 =C2=B1  4%  boot-meminfo.Dire=
ctMap4k
>     347196 =C2=B1  0%      +4.7%     363612 =C2=B1  0%  boot-meminfo.Vmal=
locUsed
> =


well, duh.. it changes a dynamic allocation into a static per-cpu one.
What did you expect?

--===============0032485238121826913==--

