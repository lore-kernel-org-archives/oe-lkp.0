Content-Type: multipart/mixed; boundary="===============5954293294898402851=="
MIME-Version: 1.0
From: Dou Liyang <douly.fnst@cn.fujitsu.com>
To: lkp@lists.01.org
Subject: Re: [x86/time] f61a8e12b5: ACPI_Error:Table[DMAR]is_not_invalidated_during_early_boot_stage(#/tbxface-#)
Date: Wed, 12 Jul 2017 10:52:27 +0800
Message-ID: <955aa34f-f221-0de8-18d9-9c624092d172@cn.fujitsu.com>
In-Reply-To: <20170708034805.GA129853@inn.lkp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5954293294898402851==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Xiaolong

Thank you very much for testing. I have got the reason why the ACPI
error happened and will give a fix patch below.

Also cc ACPI maintainers..

At 07/08/2017 11:48 AM, kernel test robot wrote:
> FYI, we noticed the following commit:
>
> commit: f61a8e12b5972879f8decfe059e54c813dc4416b ("x86/time: Initialize i=
nterrupt mode behind timer init")
> url: https://github.com/0day-ci/linux/commits/Dou-Liyang/Unify-the-interr=
upt-delivery-mode-and-do-its-setup-in-advance/20170705-124610
>
>
> in testcase: will-it-scale
> with following parameters:
>
> 	nr_task: 50%
> 	mode: process
> 	test: writeseek3
> 	cpufreq_governor: performance
>
> test-description: Will It Scale takes a testcase and runs it from 1 throu=
gh to n parallel copies to see if the testcase will scale. It builds both a=
 process and threads based test in order to see any differences between the=
 two.
> test-url: https://github.com/antonblanchard/will-it-scale
>
>
> on test machine: 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz wit=
h 64G memory
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
> +------------------------------------------------------------------------=
-------+------------+------------+
> |                                                                        =
       | d021c73124 | f61a8e12b5 |
> +------------------------------------------------------------------------=
-------+------------+------------+
> | boot_successes                                                         =
       | 0          | 6          |
> | boot_failures                                                          =
       | 2          | 4          |
> | invoked_oom-killer:gfp_mask=3D0x                                       =
         | 2          |            |
> | Mem-Info                                                               =
       | 2          |            |
> | Kernel_panic-not_syncing:Out_of_memory_and_no_killable_processes       =
       | 2          |            |
> | ACPI_Error:Table[DMAR]is_not_invalidated_during_early_boot_stage(#/tbxf=
ace-#) | 0          | 4          |
> | WARNING:at_mm/early_ioremap.c:#check_early_ioremap_leak                =
       | 0          | 4          |
> +------------------------------------------------------------------------=
-------+------------+------------+
>
>
>
> kern  :info  : [    0.005000] tsc: Fast TSC calibration using PIT
> kern  :info  : [    0.006000] tsc: Detected 2194.957 MHz processor
> kern  :info  : [    0.007000] Calibrating delay loop (skipped), value cal=
culated using timer frequency.. 4389.91 BogoMIPS (lpj=3D2194957)
> kern  :info  : [    0.008002] pid_max: default: 90112 minimum: 704
> kern  :info  : [    0.009034] ACPI: Core revision 20170303
> kern  :err   : [    0.010002] ACPI Error: Table [DMAR] is not invalidated=
 during early boot stage (20170303/tbxface-193)

Here is the ACPI error.

The reason:
-----------

As we know, Linux divides the ACPI table management into two stages:
1) the early stage:
   the mapped ACPI tables is temporary and should be unmapped before the
early stage ends.

2) the late stage.
   the mapped ACPI tables is permanent.

And Linux uses *acpi_permanent_mmap* to distinguish the early stage and
the late stage. the default of *acpi_permanent_mmap* is false and will
be set to true in *acpi_early_init()*, which means that Linux regards
*acpi_early_init()* as the dividing line.

Linux maps the ACPI DMAR table in the late stage, But this patch make =

the mapping earlier in the early stage, so the ACPI error happened.

The solution:
-------------

There are two solution we can use:

1) After use the DMAR table, we unmap it, which likes following

  acpi_get_table();
  parse the DMAR table and use it...
  acpi_put_table();

2) Invoke the *acpi_early_init()* earlier.

The 1) has influence on the initialization of IOMMU, not work well.
The 2) is suitable, and it also can make the change of interrupt trigger =

type earlier than Linux enter into the final interrupt delivery
mode.

The patch:
----------
   it will be added in my next version.


diff --git a/init/main.c b/init/main.c
index df58a41..7a09467 100644
--- a/init/main.c
+++ b/init/main.c
@@ -654,12 +654,12 @@ asmlinkage __visible void __init start_kernel(void)
         kmemleak_init();
         setup_per_cpu_pageset();
         numa_policy_init();
+       acpi_early_init();
         if (late_time_init)
                 late_time_init();
         calibrate_delay();
         pidmap_init();
         anon_vma_init();
-       acpi_early_init();
  #ifdef CONFIG_X86
         if (efi_enabled(EFI_RUNTIME_SERVICES))
                 efi_enter_virtual_mode();

BTY, cc Lee

I try to invoke acpi_early_init() earlier before
timekeeping_init() for accessing ACPI TAD device to set system clock.
Now the testing is OK, but There are a lot of operations between them,
I think we need more investigation.


Thanks,

	dou.

> kern  :info  : [    0.125364] ACPI: 4 ACPI AML tables successfully acquir=
ed and loaded
> kern  :info  : [    0.126116] Security Framework initialized
> kern  :info  : [    0.127003] SELinux:  Initializing.
> kern  :debug : [    0.128012] SELinux:  Starting in permissive mode
> kern  :info  : [    0.131850] Dentry cache hash table entries: 8388608 (o=
rder: 14, 67108864 bytes)
>
>
> To reproduce:
>
>         git clone https://github.com/01org/lkp-tests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
>
>
>
> Thanks,
> Kernel Test Robot
>
>



--===============5954293294898402851==--

