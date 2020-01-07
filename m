Content-Type: multipart/mixed; boundary="===============6081219281462655879=="
MIME-Version: 1.0
From: Jan Kara <jack@suse.cz>
To: lkp@lists.01.org
Subject: Re: [ext4] b1b4705d54: filebench.sum_bytes_mb/s -20.2% regression
Date: Tue, 07 Jan 2020 18:28:24 +0100
Message-ID: <20200107172824.GK25547@quack2.suse.cz>
In-Reply-To: <20200107165708.GA3619@mit.edu>
List-Id: <oe-lkp.lists.linux.dev>

--===============6081219281462655879==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue 07-01-20 11:57:08, Theodore Y. Ts'o wrote:
> On Tue, Jan 07, 2020 at 02:41:06PM +0100, Jan Kara wrote:
> > Hello,
> > =

> > On Tue 24-12-19 08:59:15, kernel test robot wrote:
> > > FYI, we noticed a -20.2% regression of filebench.sum_bytes_mb/s due t=
o commit:
> > > =

> > > =

> > > commit: b1b4705d54abedfd69dcdf42779c521aa1e0fbd3 ("ext4: introduce di=
rect I/O read using iomap infrastructure")
> > > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> > > =

> > > in testcase: filebench
> > > on test machine: 8 threads Intel(R) Core(TM) i7-4770 CPU @ 3.40GHz wi=
th 8G memory
> > > with following parameters:
> > > =

> > > 	disk: 1HDD
> > > 	fs: ext4
> > > 	test: fivestreamreaddirect.f
> > > 	cpufreq_governor: performance
> > > 	ucode: 0x27
> > =

> > I was trying to reproduce this but I failed with my test VM. I had SATA=
 SSD
> > as a backing store though so maybe that's what makes a difference. Maybe
> > the new code results in somewhat more seeks because the five threads wh=
ich
> > compete in submitting sequential IO end up being more interleaved?
> =

> A "-20.2% regression" should be read as a "20.2% performance
> improvement" is zero-day kernel speak.

Are you sure? I can see:

     58.30 =C2=B1  2%     -20.2%      46.53        filebench.sum_bytes_mb/s

which implies to me previously the throughput was 58 MB/s and after the
commit it was 46 MB/s?

Anyway, in my testing that commit made no difference in that benchmark
whasoever (getting around 97 MB/s for each thread before and after the
commit).
 =

								Honza
-- =

Jan Kara <jack@suse.com>
SUSE Labs, CR
--===============6081219281462655879==--

