Content-Type: multipart/mixed; boundary="===============5496934315705107153=="
MIME-Version: 1.0
From: David Hildenbrand <david@redhat.com>
To: lkp@lists.01.org
Subject: Re: 52335f0d68: ltp.madvise07.fail
Date: Mon, 28 Feb 2022 11:55:37 +0100
Message-ID: <1b5443e5-dd9a-6fa6-8a26-2c89752135ad@redhat.com>
In-Reply-To: <20220228060919.GD29932@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============5496934315705107153==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 28.02.22 07:09, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 52335f0d68798290c6b469c2c095aedd084d6a04 ("PageAnonExclusive")
> git://github.com/davidhildenbrand/linux cow_fixes_part_2a
> =

> in testcase: ltp
> version: ltp-x86_64-14c1f76-1_20220129
> with following parameters:
> =

> 	disk: 1HDD
> 	fs: xfs
> 	test: syscalls-05
> 	ucode: 0xec
> =

> test-description: The LTP testsuite contains a collection of tools for te=
sting the Linux kernel and related features.
> test-url: http://linux-test-project.github.io/
> =

> =

> on test machine: 4 threads Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz with 3=
2G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> =

> =

> <<<test_start>>>
> tag=3Dmadvise07 stime=3D1645700830
> cmdline=3D"madvise07"
> contacts=3D""
> analysis=3Dexit
> <<<test_output>>>
> tst_test.c:1433: TINFO: Timeout per run is 0h 25m 00s
> madvise07.c:45: TINFO: mmap(0, 4096, PROT_READ | PROT_WRITE, MAP_ANONYMOU=
S | MAP_PRIVATE, -1, 0)
> madvise07.c:54: TINFO: madvise(0x7f87c1430000, 4096, MADV_HWPOISON)
> madvise07.c:60: TFAIL: Could not poison memory: EBUSY (16)
> =


Not able to reproduce on the latest state (that commit is a bit old),
and looks like an unrelated/temporary issue with poisoning to me.


-- =

Thanks,

David / dhildenb

--===============5496934315705107153==--

