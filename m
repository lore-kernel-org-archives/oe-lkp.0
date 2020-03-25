Content-Type: multipart/mixed; boundary="===============3025683210375597499=="
MIME-Version: 1.0
From: Jan Kara <jack@suse.cz>
To: lkp@lists.01.org
Subject: Re: [ext4] b1b4705d54: filebench.sum_bytes_mb/s -20.2% regression
Date: Wed, 25 Mar 2020 15:31:02 +0100
Message-ID: <20200325143102.GJ28951@quack2.suse.cz>
In-Reply-To: <49a59199-53af-206f-d07c-5c8c45f498b3@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3025683210375597499==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed 25-03-20 13:50:09, Xing Zhengjun wrote:
> ping...
> The issue still exists in v5.6-rc7.

So I have tried again to reproduce this so that I can look into the
regression. When observing what is actually happening in the system I have
to say that this workfile (or actually its implementation in filebench) is
pretty dubious. The problem is that filebench first creates the files by
writing them through ordinary write(2). Then it immediately starts reading
the files with direct IO read. So what happens is that by the time direct
IO read is running, the system is still writing back the create files and
depending on how read vs writes get scheduled, you get different results.
Also direct IO read will first flush the range it is going to read from the
page cache so to some extent this is actually parallel small ranged
fsync(2) benchmark. Finally differences in how we achieve integrity of
direct IO reads with dirty page cache are going to impact this benchmark.

So overall can now see why this commit makes a difference but the workload
is IMHO largely irrelevant. What would make sense is to run filebench once,
then unmount & mount the fs to force files to disk and clear page cache and
then run it again. Filebench will reuse the files in this case and then
parallel direct IO readers without page cache are a sensible workload. But
I didn't see any difference in that (even with rotating disk) on my
machines.

								Honza
> =

> On 3/4/2020 4:15 PM, Xing Zhengjun wrote:
> > Hi Matthew,
> > =

> >  =C2=A0We test it in v5.6-rc4, the issue still exist, do you have time =
to
> > take a look at this? Thanks.
> > =

> > On 1/8/2020 10:31 AM, Rong Chen wrote:
> > > =

> > > =

> > > On 1/8/20 1:28 AM, Jan Kara wrote:
> > > > On Tue 07-01-20 11:57:08, Theodore Y. Ts'o wrote:
> > > > > On Tue, Jan 07, 2020 at 02:41:06PM +0100, Jan Kara wrote:
> > > > > > Hello,
> > > > > > =

> > > > > > On Tue 24-12-19 08:59:15, kernel test robot wrote:
> > > > > > > FYI, we noticed a -20.2% regression of
> > > > > > > filebench.sum_bytes_mb/s due to commit:
> > > > > > > =

> > > > > > > =

> > > > > > > commit: b1b4705d54abedfd69dcdf42779c521aa1e0fbd3
> > > > > > > ("ext4: introduce direct I/O read using iomap
> > > > > > > infrastructure")
> > > > > > > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.g=
it
> > > > > > > master
> > > > > > > =

> > > > > > > in testcase: filebench
> > > > > > > on test machine: 8 threads Intel(R) Core(TM) i7-4770
> > > > > > > CPU @ 3.40GHz with 8G memory
> > > > > > > with following parameters:
> > > > > > > =

> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0disk: 1HDD
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0fs: ext4
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0test: fivestreamreaddirect.f
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0cpufreq_governor: performance
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0ucode: 0x27
> > > > > > I was trying to reproduce this but I failed with my test
> > > > > > VM. I had SATA SSD
> > > > > > as a backing store though so maybe that's what makes a
> > > > > > difference. Maybe
> > > > > > the new code results in somewhat more seeks because the
> > > > > > five threads which
> > > > > > compete in submitting sequential IO end up being more interleav=
ed?
> > > > > A "-20.2% regression" should be read as a "20.2% performance
> > > > > improvement" is zero-day kernel speak.
> > > > Are you sure? I can see:
> > > > =

> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 58.30 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=
=A0=C2=A0 -20.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 46.53=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 filebench.sum_bytes_mb/s
> > > > =

> > > > which implies to me previously the throughput was 58 MB/s and after=
 the
> > > > commit it was 46 MB/s?
> > > > =

> > > > Anyway, in my testing that commit made no difference in that benchm=
ark
> > > > whasoever (getting around 97 MB/s for each thread before and after =
the
> > > > commit).
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Honza
> > > =

> > > We're sorry for the misunderstanding, "-20.2%" means the change of
> > > filebench.sum_bytes_mb/s,
> > > "regression" means the explanation of this change from LKP.
> > > =

> > > Best Regards,
> > > Rong Chen
> > > _______________________________________________
> > > LKP mailing list -- lkp(a)lists.01.org
> > > To unsubscribe send an email to lkp-leave(a)lists.01.org
> > =

> =

> -- =

> Zhengjun Xing
-- =

Jan Kara <jack@suse.com>
SUSE Labs, CR
--===============3025683210375597499==--

