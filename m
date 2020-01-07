Content-Type: multipart/mixed; boundary="===============4725225351862959142=="
MIME-Version: 1.0
From: Jan Kara <jack@suse.cz>
To: lkp@lists.01.org
Subject: Re: [ext4] b1b4705d54: filebench.sum_bytes_mb/s -20.2% regression
Date: Tue, 07 Jan 2020 14:41:06 +0100
Message-ID: <20200107134106.GD25547@quack2.suse.cz>
In-Reply-To: <20191224005915.GW2760@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============4725225351862959142==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue 24-12-19 08:59:15, kernel test robot wrote:
> FYI, we noticed a -20.2% regression of filebench.sum_bytes_mb/s due to co=
mmit:
> =

> =

> commit: b1b4705d54abedfd69dcdf42779c521aa1e0fbd3 ("ext4: introduce direct=
 I/O read using iomap infrastructure")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: filebench
> on test machine: 8 threads Intel(R) Core(TM) i7-4770 CPU @ 3.40GHz with 8=
G memory
> with following parameters:
> =

> 	disk: 1HDD
> 	fs: ext4
> 	test: fivestreamreaddirect.f
> 	cpufreq_governor: performance
> 	ucode: 0x27

I was trying to reproduce this but I failed with my test VM. I had SATA SSD
as a backing store though so maybe that's what makes a difference. Maybe
the new code results in somewhat more seeks because the five threads which
compete in submitting sequential IO end up being more interleaved?

								Honza
-- =

Jan Kara <jack@suse.com>
SUSE Labs, CR
--===============4725225351862959142==--

