Content-Type: multipart/mixed; boundary="===============0597447597365105146=="
MIME-Version: 1.0
From: Jens Axboe <axboe@kernel.dk>
To: lkp@lists.01.org
Subject: Re: [io_uring] 584b0180f0: phoronix-test-suite.fio.SequentialWrite.IO_uring.Yes.Yes.1MB.DefaultTestDirectory.mb_s -10.2% regression
Date: Fri, 27 May 2022 07:50:27 -0600
Message-ID: <2085bfef-a91c-8adb-402b-242e8c5d5c55@kernel.dk>
In-Reply-To: <20220527092432.GE11731@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============0597447597365105146==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 5/27/22 3:24 AM, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed a -10.2% regression of phoronix-test-suite.fio.Sequential=
Write.IO_uring.Yes.Yes.1MB.DefaultTestDirectory.mb_s due to commit:
> =

> =

> commit: 584b0180f0f4d67d7145950fe68c625f06c88b10 ("io_uring: move read/wr=
ite file prep state into actual opcode handler")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: phoronix-test-suite
> on test machine: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2.=
10GHz with 512G memory
> with following parameters:
> =

> 	test: fio-1.14.1
> 	option_a: Sequential Write
> 	option_b: IO_uring
> 	option_c: Yes
> 	option_d: Yes
> 	option_e: 1MB
> 	option_f: Default Test Directory
> 	cpufreq_governor: performance
> 	ucode: 0x500320a
> =

> test-description: The Phoronix Test Suite is the most comprehensive testi=
ng and benchmarking platform available that provides an extensible framewor=
k for which new tests can be easily added.
> test-url: http://www.phoronix-test-suite.com/

I'm a bit skeptical on this, but I'd like to try and run the test case.
Since it's just a fio test case, why can't I find it somewhere? Seems
very convoluted to have to setup lkp-tests just for this. Besides, I
tried, but it doesn't work on aarch64...

-- =

Jens Axboe

--===============0597447597365105146==--

