Content-Type: multipart/mixed; boundary="===============2485797816927901196=="
MIME-Version: 1.0
From: Kirill A. Shutemov <kirill@shutemov.name>
To: lkp@lists.01.org
Subject: Re: [shmem] 071904e8df: meminfo.AnonHugePages +553.5% increase
Date: Thu, 04 Aug 2016 12:54:11 +0300
Message-ID: <20160804095411.GB12395@node.shutemov.name>
In-Reply-To: <20160804085409.GI19697@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============2485797816927901196==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 04, 2016 at 04:54:09PM +0800, kernel test robot wrote:
> =

> FYI, we noticed meminfo.AnonHugePages +553.5% increase due to commit:
> =

> commit 071904e8dfed9525f9da86523caf78b6da5f9e7e ("shmem: get_unmapped_are=
a align huge page")
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> =

> in testcase: vm-scalability
> on test machine: 128 threads 4 Sockets Haswell-EP with 512G memory
> with following parameters:
> =

> 	path_params: 300s-16G-shm-pread-rand-mt-performance
> 	run: =

> =

> =

> =

> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
> =

> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
> =

> =

> To reproduce:
> =

>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-t=
ests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/rootfs/runtime/size/tbox_group/test/tes=
tcase:
>   gcc-6/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/300s/16G/lkp=
-hsw-4ep1/shm-pread-rand-mt/vm-scalability
> =

> commit: =

>   6a028aa3ca ("shmem: prepare huge=3D mount option and sysfs knob")
>   071904e8df ("shmem: get_unmapped_area align huge page")
> =

> 6a028aa3ca32379e 071904e8dfed9525f9da86523c =

> ---------------- -------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>      20428 =C2=B1  9%    +553.5%     133500 =C2=B1  7%  meminfo.AnonHugeP=
ages
>      42717 =C2=B1  4%    +261.3%     154340 =C2=B1  6%  meminfo.AnonPages

Hm. That's strange. I didn't expect this commit change anything for anon
memory.

Do you see the same effect from the commit in Linus' tree?

-- =

 Kirill A. Shutemov

--===============2485797816927901196==--

