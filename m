Content-Type: multipart/mixed; boundary="===============7985094580492248454=="
MIME-Version: 1.0
From: Tejun Heo <tj@kernel.org>
To: lkp@lists.01.org
Subject: Re: [AHCI] 18dcf433f3d: -3.3% fileio.requests_per_sec
Date: Mon, 27 Oct 2014 08:58:33 -0400
Message-ID: <20141027125833.GB4436@htj.dyndns.org>
In-Reply-To: <20141027021651.GF27038@yliu-dev.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7985094580492248454==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2014 at 10:16:51AM +0800, kernel test robot wrote:
> FYI, we noticed the below changes on
> =

> commit 18dcf433f3ded61eb140a55e7048ec2fef79e723 ("AHCI: Optimize single I=
RQ interrupt processing")
> =

> =

> 227dfb4dbf109596  18dcf433f3ded61eb140a55e70  testbox/testcase/testparams
> ----------------  --------------------------  ---------------------------
>          %stddev     %change         %stddev
>              \          |                \  =

>      61.60 =C2=B1  1%      -3.3%      59.56 =C2=B1  0%  bay/fileio/perfor=
mance-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
>      61.60            -3.3%      59.56        GEO-MEAN fileio.requests_pe=
r_sec

Just skimmed through it and it looks like we're getting lower IO rate
w/ way higher task switch rate.  Maybe this is more pronounced w/
btrfs because it also makes heavy use of worker threads.  Alexander,
can you please look into it?  It looks like we might have to revert
the commit, drop the threaded IRQ and do the split locking after that.

Thanks.

-- =

tejun

--===============7985094580492248454==--

