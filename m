Content-Type: multipart/mixed; boundary="===============8606679551042434291=="
MIME-Version: 1.0
From: Theodore Y. Ts'o <tytso@mit.edu>
To: lkp@lists.01.org
Subject: Re: [ext4] b1b4705d54: filebench.sum_bytes_mb/s -20.2% regression
Date: Tue, 07 Jan 2020 11:57:08 -0500
Message-ID: <20200107165708.GA3619@mit.edu>
In-Reply-To: <20200107134106.GD25547@quack2.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============8606679551042434291==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 07, 2020 at 02:41:06PM +0100, Jan Kara wrote:
> Hello,
> =

> On Tue 24-12-19 08:59:15, kernel test robot wrote:
> > FYI, we noticed a -20.2% regression of filebench.sum_bytes_mb/s due to =
commit:
> > =

> > =

> > commit: b1b4705d54abedfd69dcdf42779c521aa1e0fbd3 ("ext4: introduce dire=
ct I/O read using iomap infrastructure")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> > =

> > in testcase: filebench
> > on test machine: 8 threads Intel(R) Core(TM) i7-4770 CPU @ 3.40GHz with=
 8G memory
> > with following parameters:
> > =

> > 	disk: 1HDD
> > 	fs: ext4
> > 	test: fivestreamreaddirect.f
> > 	cpufreq_governor: performance
> > 	ucode: 0x27
> =

> I was trying to reproduce this but I failed with my test VM. I had SATA S=
SD
> as a backing store though so maybe that's what makes a difference. Maybe
> the new code results in somewhat more seeks because the five threads which
> compete in submitting sequential IO end up being more interleaved?

A "-20.2% regression" should be read as a "20.2% performance
improvement" is zero-day kernel speak.

Yeah, it's confusing.  I believe Dave Chinner has complianed about
this previously.

					- Ted
--===============8606679551042434291==--

