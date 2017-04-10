Content-Type: multipart/mixed; boundary="===============1969876619520808629=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: LKP report for aubrey-fast_idle/4.8.x [job.yaml]
Date: Mon, 10 Apr 2017 08:52:50 +0800
Message-ID: <87lgr95bj1.fsf@yhuang-dev.intel.com>
In-Reply-To: <070BEF4AC20468458C22969097656CD94BFB595A@shsmsx102.ccr.corp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1969876619520808629==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

"Li, Aubrey" <aubrey.li@intel.com> writes:

> Hi Philip,
>
> It seems that I always encountered an error below so that the test is alw=
ays incomplete.
> Can you please take a look?
>
> Thanks,
> -Aubrey
>
> aubrey(a)inn:/lkp/lkp$ lkp compare -at v4.8.8 ea899bd65fc285d5753d70a7879=
a7332821bbc02
> tests: 1
> testcase/path_params/tbox_group/run: fio-basic/1SSD-btrfs-300s-8-randwrit=
e-4k-sync-512g-performance/lkp-bdw-ep2
>
>           v4.8.8  ea899bd65fc285d5753d70a787  =

> ----------------  --------------------------  =

>        fail:runs  %reproduction    fail:runs
>            |             |             |    =

>            :1           67%           2:3     stderr.ERROR:use_the-f_opti=
on_to_force_overwrite_of/dev/nvme0n1p1
>            :1           67%           2:3     last_state.incomplete
>            :1          100%           3:3     last_state.is_incomplete_run

The base kernel runs well, so it is possible to be a kernel specific
problem.  I suggest you to test more times for both the base and head
kernel.  And you can get kernel dmesg to check whether it is kernel
specific.

Best Regards,
Huang, Ying

>
>
>> -----Original Message-----
>> From: Li, Philip
>> Sent: Sunday, April 09, 2017 9:01 AM
>> To: Li, Aubrey
>> Subject: LKP report for aubrey-fast_idle/4.8.x [job.yaml]
>> =

>> QUEUED JOBS [3]
>> /result/fio-basic/1SSD-btrfs-300s-8-randwrite-4k-sync-512g-performance/l=
kp-bd
>> w-ep2/debian-x86_64-2016-08-31.cgz/x86_64-rhel-7.2/gcc-6/ea899bd65fc285d
>> 5753d70a7879a7332821bbc02/0 INCOMPLETE
>> /result/fio-basic/1SSD-btrfs-300s-8-randwrite-4k-sync-512g-performance/l=
kp-bd
>> w-ep2/debian-x86_64-2016-08-31.cgz/x86_64-rhel-7.2/gcc-6/ea899bd65fc285d
>> 5753d70a7879a7332821bbc02/1 INCOMPLETE
>> /result/fio-basic/1SSD-btrfs-300s-8-randwrite-4k-sync-512g-performance/l=
kp-bd
>> w-ep2/debian-x86_64-2016-08-31.cgz/x86_64-rhel-7.2/gcc-6/ea899bd65fc285d
>> 5753d70a7879a7332821bbc02/2 INCOMPLETE
>> =

>> Disclaimer:
>> Results have been estimated based on internal Intel analysis and are pro=
vided
>> for informational purposes only. Any difference in system hardware or so=
ftware
>> design or configuration may affect actual performance.
>> =

>> ---
>> 0DAY/LKP kernel testing infrastructure          Open Source Technology
>> Center
>> https://lists.01.org/mailman/listinfo/lkp                   Intel
>> Corporation
>
> _______________________________________________
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp

--===============1969876619520808629==--

