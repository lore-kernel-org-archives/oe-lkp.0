Content-Type: multipart/mixed; boundary="===============5386538017040966270=="
MIME-Version: 1.0
From: Davidlohr Bueso <dave@stgolabs.net>
To: lkp@lists.01.org
Subject: Re: [mm] c8c06efa8b5: -7.6% unixbench.score
Date: Thu, 08 Jan 2015 18:47:53 -0800
Message-ID: <1420771673.12346.16.camel@stgolabs.net>
In-Reply-To: <1420684064.6201.86.camel@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5386538017040966270==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 2015-01-08 at 10:27 +0800, Huang Ying wrote:
> FYI, we noticed the below changes on
> =

> commit c8c06efa8b552608493b7066c234cfa82c47fcea ("mm: convert i_mmap_mute=
x to rwsem")
> =

> =

> testbox/testcase/testparams: lituya/unixbench/performance-execl
> =

> 83cde9e8ba95d180  c8c06efa8b552608493b7066c2  =

> ----------------  --------------------------  =

>          %stddev     %change         %stddev
>              \          |                \  =

>     721721 =C2=B1  1%    +303.6%    2913110 =C2=B1  3%  unixbench.time.vo=
luntary_context_switches
>      11767 =C2=B1  0%      -7.6%      10867 =C2=B1  1%  unixbench.score

I simply cannot reproduce this, not even on a large box.

mutex (83cde9e8ba95d180):
run1:
Execl Throughput                               3974.3 lps   (30.0 s, 2 samp=
les)
Voluntary context switches: 377039

run2:
Execl Throughput                               4115.5 lps   (30.0 s, 2 samp=
les)
Voluntary context switches: 391260

run3:
Execl Throughput                               4000.2 lps   (30.0 s, 2 samp=
les)
Voluntary context switches: 378674

rwsem (c8c06efa8b552608493b7066c2):
run1:
Execl Throughput                               4166.0 lps   (30.0 s, 2 samp=
les)
Voluntary context switches: 385740

run2:
Execl Throughput                               4115.5 lps   (30.0 s, 2 samp=
les)
Voluntary context switches: 391260

run3:
Execl Throughput                               4110.5 lps   (29.9 s, 2 samp=
les)
Voluntary context switches: 387053

Since throughput is in the ballpark, so is the benchmark score (in fact
the rwsem score is slightly better).

Is this a one time thing or can you observe it again? Any special things
you guys are doing when running the benchmark? Here are some things I've
done: cpu gov set to performance, Unixbench taken from
(http://byte-unixbench.googlecode.com/files/UnixBench5.1.3.tgz ), used
default compiler options from unixbench Makefile (that is using the
solaris 2 option). This pretty much matches the environment info you've
provided. We've done this lock type comparison exercise plenty of times
in the past, and I'm a bit surprised to see your numbers.

Thanks,
Davidlohr


--===============5386538017040966270==--

