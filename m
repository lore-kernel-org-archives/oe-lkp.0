Content-Type: multipart/mixed; boundary="===============7669230063102323953=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/entry/64] 11a1251e3a: hackbench.throughput -12.1% regression
Date: Wed, 03 Jan 2018 14:17:34 -0800
Message-ID: <CALCETrWRkoF6n9FzJ0HH1BxYdt=FvMykOtP7gMPG8VvkB3_FRw@mail.gmail.com>
In-Reply-To: <20180103025826.GB12392@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============7669230063102323953==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> On Jan 2, 2018, at 6:58 PM, kernel test robot <xiaolong.ye@intel.com> w=
rote:
>
>
> Greeting,
>
> We noticed a -12.1% regression of hackbench.throughput due to commit:
>
>
> commit: 11a1251e3a3cc9532f358c889deea63169bd2c65 ("x86/entry/64: Make cpu=
_entry_area.tss read-only")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>
> in testcase: hackbench
> on test machine: 256 threads Phi with 96G memory
> with following parameters:
>
>    nr_threads: 100%
>    mode: threads
>    ipc: pipe
>    cpufreq_governor: performance
>
> test-description: Hackbench is both a benchmark and a stress test for the=
 Linux kernel scheduler.
> test-url: https://github.com/linux-test-project/ltp/blob/master/testcases=
/kernel/sched/cfs-scheduler/hackbench.c
>
>
>
> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
>
>
> To reproduce:
>
>        git clone https://github.com/intel/lkp-tests.git
>        cd lkp-tests
>        bin/lkp install job.yaml  # job file is attached in this email
>        bin/lkp run     job.yaml
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/kconfig/rootfs/sleep/tbox_group/testcase:
>  gcc-7/x86_64-kexec/debian-x86_64-2016-08-31.cgz/1/vm-lkp-wsx03-2G/boot
>
> commit:
>  dff71e3c0e ("x86/entry: Clean up the SYSENTER_stack code")
>  11a1251e3a ("x86/entry/64: Make cpu_entry_area.tss read-only")

That's bizarre.  How confident are your that this is attributed to the
right patch?

--Andy

--===============7669230063102323953==--

