Content-Type: multipart/mixed; boundary="===============8943838356104453989=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [Btrfs] 3a8b36f3780: -62.6% fileio.requests_per_sec
Date: Wed, 01 Apr 2015 12:59:07 +0800
Message-ID: <1427864347.17170.105.camel@intel.com>
In-Reply-To: <551AB664.4080303@suse.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8943838356104453989==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 2015-03-31 at 15:59 +0100, Filipe Manana wrote:

[snip]

> From: Filipe Manana <fdmanana@suse.com>
> Date: Tue, 31 Mar 2015 14:16:52 +0100
> Subject: [PATCH] Btrfs: avoid syncing log in the fast fsync path when not
>  necessary
> =

> Commit 3a8b36f37806 ("Btrfs: fix data loss in the fast fsync path") added
> a performance regression for that causes an unnecessary sync of the log
> trees (fs/subvol and root log trees) when 2 consecutive fsyncs are done
> against a file, without no writes or any metadata updates to the inode in
> between them and if a transaction is committed before the second fsync is
> called.
> =

> Huang Ying reported this to lkml after a test sysbench test that measured
> a -62% decrease of file io requests for that tests' workload.
> =

> The test is:
> =

>   echo performance > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
>   echo performance > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
>   echo performance > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
>   echo performance > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
>   mkfs -t btrfs /dev/sda2
>   mount -t btrfs /dev/sda2 /fs/sda2
>   cd /fs/sda2
>   for ((i =3D 0; i < 1024; i++)); do fallocate -l 67108864 testfile.$i; d=
one
>   sysbench --test=3Dfileio --max-requests=3D0 --num-threads=3D4 --max-tim=
e=3D600 \
>     --file-test-mode=3Drndwr --file-total-size=3D68719476736 --file-io-mo=
de=3Dsync \
>     --file-num=3D1024 run
> =

> A test on kvm guest, running a debug kernel gave me the following results:
> =

> Without 3a8b36f378060d:             16.01 reqs/sec
> With 3a8b36f378060d:                 3.39 reqs/sec
> With 3a8b36f378060d and this patch: 16.04 reqs/sec
> =

> Reported-by: Huang Ying <ying.huang@intel.com>

I have tested your patch, the regression restored in our test.  Thanks!

Tested-by: Huang, Ying <ying.huang@intel.com>

Best Regards,
Huang, Ying

[snip]



--===============8943838356104453989==--

