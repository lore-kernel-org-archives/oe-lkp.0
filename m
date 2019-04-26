Content-Type: multipart/mixed; boundary="===============2934563821502011909=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [btrfs] 302167c50b: fio.write_bw_MBps -12.4% regression
Date: Fri, 26 Apr 2019 14:14:11 +0800
Message-ID: <87h8alqong.fsf@yhuang-dev.intel.com>
In-Reply-To: <20190203081802.GD10498@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============2934563821502011909==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Josef,

kernel test robot <rong.a.chen@intel.com> writes:

> Greeting,
>
> FYI, we noticed a -12.4% regression of fio.write_bw_MBps due to commit:
>
>
> commit: 302167c50b32e7fccc98994a91d40ddbbab04e52 ("btrfs: don't end the t=
ransaction for delayed refs in throttle")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git pending-=
fixes
>
> in testcase: fio-basic
> on test machine: 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz wit=
h 64G memory
> with following parameters:
>
> 	runtime: 300s
> 	nr_task: 8t
> 	disk: 1SSD
> 	fs: btrfs
> 	rw: randwrite
> 	bs: 4k
> 	ioengine: sync
> 	test_size: 400g
> 	cpufreq_governor: performance
> 	ucode: 0xb00002e
>
> test-description: Fio is a tool that will spawn a number of threads or pr=
ocesses doing a particular type of I/O action as specified by the user.
> test-url: https://github.com/axboe/fio
>
>

Do you have time to take a look at this regression?

Best Regards,
Huang, Ying

--===============2934563821502011909==--

