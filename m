Content-Type: multipart/mixed; boundary="===============0216700092041658837=="
MIME-Version: 1.0
From: Mel Gorman <mgorman@techsingularity.net>
To: lkp@lists.01.org
Subject: Re: [sched/numa] f6183ef98b: phoronix-test-suite.aom-av1.0.frames_per_second -25.0% regression
Date: Wed, 18 Mar 2020 10:53:40 +0000
Message-ID: <20200318105340.GB3818@techsingularity.net>
In-Reply-To: <74027441-8ae2-044e-7cdb-74be5e3e0ab2@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0216700092041658837==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> > Excellent. Now in your previous mail, the regression was reported based
> > on
> > =

> > commit:
> >    6d4d22468dae3d8757af9f8b81b848a76ef4409d ("sched/fair: Reorder enque=
ue/dequeue_task_fair path")
> >    6499b1b2dd1b8d404a16b9fbbf1af6b9b3c1d83d ("sched/numa: Replace runna=
ble_load_avg by load_avg")
> >    253e2b69ef8fda4d9345ff496b12058faaeeff6b ("sched/fair: fix statistic=
s for find_idlest_group()")
> > =

> > Can you confirm whether the report is based on just those commits or the
> > entire series? If it's not the entire series, can you give me the report
> > for the full series please? We know for a fact that this series is not
> > bisection safe in terms of performance.
> =

> Hi,
> =

> Sorry for the late, yes the report is based on the entire series, the res=
ult
> of head commit is 0.03:
> =

> commit:
> =C2=A0 a0f03b617c3b2644d3d47bf7d9e60aed01bd5b10 ("sched/numa: Stop an exh=
astive
> search if a reasonable swap candidate or idle CPU is found")
> =

> $ ag -A9 phoronix-test-suite.aom-av1.0.frames_per_second /result/phoronix=
-test-suite/performance-aom-av1-1.2.0-ucode=3D0x1d/lkp-nhm-2ep1/debian-x86_=
64-phoronix/x86_64-rhel-7.6/gcc-7/a0f03b617c3b2644d3d47bf7d9e60aed01bd5b10/=
matrix.json
> 2:=C2=A0 "phoronix-test-suite.aom-av1.0.frames_per_second": [
> 3-=C2=A0=C2=A0=C2=A0 0.03,
> 4-=C2=A0=C2=A0=C2=A0 0.03,
> 5-=C2=A0=C2=A0=C2=A0 0.03,
> 6-=C2=A0=C2=A0=C2=A0 0.03,
> 7-=C2=A0=C2=A0=C2=A0 0.03,
> 8-=C2=A0=C2=A0=C2=A0 0.03,
> 9-=C2=A0=C2=A0=C2=A0 0.03,
> 10-=C2=A0=C2=A0=C2=A0 0.03
> 11-=C2=A0 ],
> =


Ok, that is missing a bunch of fixes that have been merged since or are
in other branches of tip. I'll try reproduce this before the end of the
week but I need to get some other stuff off the table first.

-- =

Mel Gorman
SUSE Labs
--===============0216700092041658837==--

