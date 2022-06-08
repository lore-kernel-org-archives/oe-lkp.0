Content-Type: multipart/mixed; boundary="===============7016461121010811680=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [io_uring] 584b0180f0: phoronix-test-suite.fio.SequentialWrite.IO_uring.Yes.Yes.1MB.DefaultTestDirectory.mb_s -10.2% regression
Date: Wed, 08 Jun 2022 16:00:54 +0800
Message-ID: <20220608080054.GB22428@xsang-OptiPlex-9020>
In-Reply-To: <2085bfef-a91c-8adb-402b-242e8c5d5c55@kernel.dk>
List-Id: <oe-lkp.lists.linux.dev>

--===============7016461121010811680==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Jens Axboe,

On Fri, May 27, 2022 at 07:50:27AM -0600, Jens Axboe wrote:
> On 5/27/22 3:24 AM, kernel test robot wrote:
> > =

> > =

> > Greeting,
> > =

> > FYI, we noticed a -10.2% regression of phoronix-test-suite.fio.Sequenti=
alWrite.IO_uring.Yes.Yes.1MB.DefaultTestDirectory.mb_s due to commit:
> > =

> > =

> > commit: 584b0180f0f4d67d7145950fe68c625f06c88b10 ("io_uring: move read/=
write file prep state into actual opcode handler")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> > =

> > in testcase: phoronix-test-suite
> > on test machine: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ =
2.10GHz with 512G memory
> > with following parameters:
> > =

> > 	test: fio-1.14.1
> > 	option_a: Sequential Write
> > 	option_b: IO_uring
> > 	option_c: Yes
> > 	option_d: Yes
> > 	option_e: 1MB
> > 	option_f: Default Test Directory
> > 	cpufreq_governor: performance
> > 	ucode: 0x500320a
> > =

> > test-description: The Phoronix Test Suite is the most comprehensive tes=
ting and benchmarking platform available that provides an extensible framew=
ork for which new tests can be easily added.
> > test-url: http://www.phoronix-test-suite.com/
> =

> I'm a bit skeptical on this, but I'd like to try and run the test case.
> Since it's just a fio test case, why can't I find it somewhere? Seems
> very convoluted to have to setup lkp-tests just for this. Besides, I
> tried, but it doesn't work on aarch64...

we just follow doc on http://www.phoronix-test-suite.com/ to run tests in P=
TS
framework, so you don't need to care about lkp-tests.

and for this fio test, the parameters we used just as:
	test: fio-1.14.1
	option_a: Sequential Write
	option_b: IO_uring
	option_c: Yes
	option_d: Yes
	option_e: 1MB
	option_f: Default Test Directory


and yeah, we most focus on x86_64 and don't support lkp-tests to run on
aarch64...


if you have some idea that we could run other tests, could you let us know?
it will be great pleasure to run more tests to check for us if we can suppo=
rt.

Thanks a lot!

> =

> -- =

> Jens Axboe
>=20
--===============7016461121010811680==--

