Content-Type: multipart/mixed; boundary="===============5071766131068523508=="
MIME-Version: 1.0
From: Michael Petlan <mpetlan@redhat.com>
To: lkp@lists.01.org
Subject: Re: [perf report] 977f739b71: perf-test.skid_test.round2.MEM_LOAD_L3_MISS_RETIRED.LOCAL_DRAM_dtlb_withou t_NMI_fixed_period.fail
Date: Wed, 30 Sep 2020 14:41:07 +0200
Message-ID: <alpine.LRH.2.20.2009301439250.12057@Diego>
In-Reply-To: <20200930091943.GB393@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============5071766131068523508==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello. To me, it looks rather a random failure. Is it actually reproducible
and proven that the patch has caused it? The patch doesn't seem to cause
the fails below.
Cheers,
Michael

On Wed, 30 Sep 2020, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 977f739b7126bf98b5202e243f60cbc0a1ec2c3b ("perf report: Disable o=
rdered_events for raw dump")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> =

> in testcase: perf-test
> version: perf-test-x86_64-git-1_20200717
> with following parameters:
> =

> 	type: lkp
> 	ucode: 0xd6
> =

> test-description: The internal Perf Test suite.
> =

> =

> on test machine: 4 threads Intel(R) Core(TM) i7-7567U CPU @ 3.50GHz with =
32G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <rong.a.chen@intel.com>
> =

> =

> 2020-09-28 17:02:40 ./skid_test/run.sh
> Mon Sep 28 17:02:58 UTC 2020
> 3 test cases pass for skid_test test. 3 test cases fail for skid_test tes=
t.
> Test Case BR_INST_RETIRED.ALL_BRANCHES_PEBS_triad_loop_with_NMI PASS!
> Test Case MEM_LOAD_RETIRED.L2_HIT_dtlb_with_NMI PASS!
> Test Case MEM_LOAD_L3_MISS_RETIRED.LOCAL_DRAM_dtlb_with_NMI FAILED!
> Test Case BR_INST_RETIRED.ALL_BRANCHES_PEBS_triad_loop_without_NMI_fixed_=
period PASS!
> Test Case MEM_LOAD_RETIRED.L2_HIT_dtlb_without_NMI_fixed_period FAILED!
> Test Case MEM_LOAD_L3_MISS_RETIRED.LOCAL_DRAM_dtlb_without_NMI_fixed_peri=
od FAILED!
> =

> =

> =

> To reproduce:
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
> =

> =

> =

> Thanks,
> Rong Chen
> =

>=20

--===============5071766131068523508==--

