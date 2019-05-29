Content-Type: multipart/mixed; boundary="===============5374172945722269438=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [btrfs] c8eaeac7b7: aim7.jobs-per-min -11.7% regression
Date: Wed, 29 May 2019 16:42:22 +0800
Message-ID: <87blzl7itt.fsf@yhuang-dev.intel.com>
In-Reply-To: <20190513025004.GG31424@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============5374172945722269438==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Josef,

kernel test robot <rong.a.chen@intel.com> writes:

> Greeting,
>
> FYI, we noticed a -11.7% regression of aim7.jobs-per-min due to commit:
>
>
> commit: c8eaeac7b734347c3afba7008b7af62f37b9c140 ("btrfs: reserve delallo=
c metadata differently")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>
> in testcase: aim7
> on test machine: 40 threads Intel(R) Xeon(R) CPU E5-2690 v2 @ 3.00GHz wit=
h 384G memory
> with following parameters:
>
> 	disk: 4BRD_12G
> 	md: RAID0
> 	fs: btrfs
> 	test: disk_rr
> 	load: 1500
> 	cpufreq_governor: performance
>
> test-description: AIM7 is a traditional UNIX system level benchmark suite=
 which is used to test and measure the performance of multiuser system.
> test-url: https://sourceforge.net/projects/aimbench/files/aim-suite7/

Here's another regression, do you have time to take a look at this?

Best Regards,
Huang, Ying

--===============5374172945722269438==--

