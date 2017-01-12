Content-Type: multipart/mixed; boundary="===============1123332276369873212=="
MIME-Version: 1.0
From: Zheng, Lv <lv.zheng@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-developer] [ACPICA] 174cc7187e: kmsg.ACPI_Error:Mutex[ACPI_MTX_Tables]already_acquired_by_this_thread[#](#/utmutex-#)
Date: Thu, 12 Jan 2017 05:23:50 +0000
Message-ID: <1AE640813FDE7649BE1B193DEA596E886CE2AB9B@SHSMSX101.ccr.corp.intel.com>
In-Reply-To: <20170112015256.GB19308@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============1123332276369873212==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Xiaolong

I noticed the tested version in your the test dmesg: Linux version 4.9.0-rc5
While the commit bisected should be in v4.10-rc1.
Does that mean your test tree doesn't contain some basic lock fixes?

Thanks and best regards
Lv

> From: lkp-developer-request(a)eclists.intel.com [mailto:lkp-developer-req=
uest(a)eclists.intel.com] On
> Behalf Of Ye, Xiaolong
> Subject: [lkp-developer] [ACPICA] 174cc7187e:
> kmsg.ACPI_Error:Mutex[ACPI_MTX_Tables]already_acquired_by_this_thread[#](=
#/utmutex-#)
> =

> =

> FYI, we noticed the following commit:
> =

> commit: 174cc7187e6f088942c8e74daa7baff7b44b33c9 ("ACPICA: Tables: Back p=
ort acpi_get_table_with_size()
> and early_acpi_os_unmap_memory() from Linux kernel")
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: phoronix-test-suite
> with following parameters:
> =

> 	need_x: true
> 	test: jxrendermark-1.2.0
> 	cpufreq_governor: performance
> =

> test-description: The Phoronix Test Suite is the most comprehensive testi=
ng and benchmarking platform
> available that provides an extensible framework for which new tests can b=
e easily added.
> test-url: http://www.phoronix-test-suite.com/
> =

> =

> on test machine: 16 threads Nehalem-EP with 16G memory
> =

> caused below changes:
> =

> =

> [    2.043693] ACPI Error: Mutex [ACPI_MTX_Tables] already acquired by th=
is thread [497483776]
> (20160930/utmutex-254)
> [    2.054084] ACPI Error: Mutex [0x2] is not acquired, cannot release (2=
0160930/utmutex-326)
> =

> To reproduce:
> =

>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-t=
ests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
> =

> =

> =

> Thanks,
> Xiaolong

--===============1123332276369873212==--

