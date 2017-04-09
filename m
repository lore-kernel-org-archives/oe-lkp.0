Content-Type: multipart/mixed; boundary="===============3808607972439833672=="
MIME-Version: 1.0
From: Li, Aubrey <aubrey.li@intel.com>
To: lkp@lists.01.org
Subject: Re: LKP report for aubrey-fast_idle/4.8.x [job.yaml]
Date: Sun, 09 Apr 2017 01:15:12 +0000
Message-ID: <070BEF4AC20468458C22969097656CD94BFB595A@shsmsx102.ccr.corp.intel.com>
In-Reply-To: <58e987e8.Luqil0ayGRMlDrfI%philip.li@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3808607972439833672==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Philip,

It seems that I always encountered an error below so that the test is alway=
s incomplete.
Can you please take a look?

Thanks,
-Aubrey

aubrey(a)inn:/lkp/lkp$ lkp compare -at v4.8.8 ea899bd65fc285d5753d70a7879a7=
332821bbc02
tests: 1
testcase/path_params/tbox_group/run: fio-basic/1SSD-btrfs-300s-8-randwrite-=
4k-sync-512g-performance/lkp-bdw-ep2

          v4.8.8  ea899bd65fc285d5753d70a787  =

----------------  --------------------------  =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

           :1           67%           2:3     stderr.ERROR:use_the-f_option=
_to_force_overwrite_of/dev/nvme0n1p1
           :1           67%           2:3     last_state.incomplete
           :1          100%           3:3     last_state.is_incomplete_run



> -----Original Message-----
> From: Li, Philip
> Sent: Sunday, April 09, 2017 9:01 AM
> To: Li, Aubrey
> Subject: LKP report for aubrey-fast_idle/4.8.x [job.yaml]
> =

> QUEUED JOBS [3]
> /result/fio-basic/1SSD-btrfs-300s-8-randwrite-4k-sync-512g-performance/lk=
p-bd
> w-ep2/debian-x86_64-2016-08-31.cgz/x86_64-rhel-7.2/gcc-6/ea899bd65fc285d
> 5753d70a7879a7332821bbc02/0 INCOMPLETE
> /result/fio-basic/1SSD-btrfs-300s-8-randwrite-4k-sync-512g-performance/lk=
p-bd
> w-ep2/debian-x86_64-2016-08-31.cgz/x86_64-rhel-7.2/gcc-6/ea899bd65fc285d
> 5753d70a7879a7332821bbc02/1 INCOMPLETE
> /result/fio-basic/1SSD-btrfs-300s-8-randwrite-4k-sync-512g-performance/lk=
p-bd
> w-ep2/debian-x86_64-2016-08-31.cgz/x86_64-rhel-7.2/gcc-6/ea899bd65fc285d
> 5753d70a7879a7332821bbc02/2 INCOMPLETE
> =

> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
> =

> ---
> 0DAY/LKP kernel testing infrastructure          Open Source Technology
> Center
> https://lists.01.org/mailman/listinfo/lkp                   Intel
> Corporation


--===============3808607972439833672==--

