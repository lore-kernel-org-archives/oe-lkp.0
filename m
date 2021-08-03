Content-Type: multipart/mixed; boundary="===============7624277601731513666=="
MIME-Version: 1.0
From: Amir Goldstein <amir73il@gmail.com>
To: lkp@lists.01.org
Subject: Re: [fsnotify] 4c40d6efc8: unixbench.score -3.3% regression
Date: Tue, 03 Aug 2021 19:19:04 +0300
Message-ID: <CAOQ4uxisyDjVpWX1M6O4ugxBbcX+LWWf4NQJ+LQY1-3-9tN+BA@mail.gmail.com>
In-Reply-To: <20210803142225.GA28609@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============7624277601731513666==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> > Oliver,
> >
> > Would it be possible to request a re-test with the branch:
> > https://github.com/amir73il/linux fsnotify-perf
> >
> > The patch at the tip of that branch is the one this regression report
> > has blamed.
> >
> > My expectation is that the patch at fsnotify-perf^ ("fsnotify: optimize=
 the
> > case of no marks of any type") will improve performance of the test case
> > compared to baseline (v5.14-rc3) and that the patch at the tip of fsnot=
ify-perf
> > would not regress performance.
>
> we tested this branch and the results meet your expectation.
>
> fsnotify-perf^ improves performance comparing to v5.14-rc3. tip is a litt=
le worse
> than its parent (-3.3%), but still better than v5.14-rc3.
>
> below is detail data.
>
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/=
testcase/ucode:
>   gcc-9/performance/x86_64-rhel-8.3/1/debian-10.4-x86_64-20200603.cgz/300=
s/lkp-csl-2sp4/pipe/unixbench/0x4003006
>
> commit:
>   v5.14-rc3
>   23050d041 ("fsnotify: optimize the case of no marks of any type")
>   7446ba772 ("fsnotify: pass arguments of fsnotify() in struct fsnotify_e=
vent_info")
>
>        v5.14-rc3 23050d0419441a02185e4ed5170 7446ba772ae107ab937cd04e880
> ---------------- --------------------------- ---------------------------
>          %stddev     %change         %stddev     %change         %stddev
>              \          |                \          |                \
>       1562            +8.0%       1688            +4.5%       1633       =
 unixbench.score

Hi Oliver,

Thanks a lot for testing!

I don't know what to make of the (-3.3%) degradation because I was expecting
that fsnotify-perf^ would optimize out the calls to fsnotify() and fsnotify=
-perf
only changes code from fsnotify() and below.

But I guess it doesn't matter much as Gabriel said, its a cleanup patch and
we can drop it.

But now that I have this report I can post the fsnotify-perf^ patches :-)

Thanks,
Amir.
--===============7624277601731513666==--

