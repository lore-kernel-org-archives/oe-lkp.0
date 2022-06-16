Content-Type: multipart/mixed; boundary="===============3968873735827989055=="
MIME-Version: 1.0
From: Matthew Wilcox <willy@infradead.org>
To: lkp@lists.01.org
Subject: Re: [btrfs] 66a7a2412f: xfstests.btrfs.131.fail
Date: Thu, 16 Jun 2022 22:17:11 +0100
Message-ID: <Yqud1/SooVDamiuP@casper.infradead.org>
In-Reply-To: <20220616143710.GF25633@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============3968873735827989055==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 16, 2022 at 10:37:10PM +0800, kernel test robot wrote:
> btrfs/131	- output mismatch (see /lkp/benchmarks/xfstests/results//btrfs/=
131.out.bad)
>     --- tests/btrfs/131.out	2022-06-13 17:10:24.000000000 +0000
>     +++ /lkp/benchmarks/xfstests/results//btrfs/131.out.bad	2022-06-15 18=
:54:06.505508542 +0000
>     @@ -2,9 +2,9 @@
>      Using free space cache
>      free space tree is disabled
>      Enabling free space tree
>     -free space tree is enabled
>     +free space tree is disabled

I think I know what's going on here:

        compat_ro=3D"$($BTRFS_UTIL_PROG inspect-internal dump-super "$SCRAT=
CH_DEV"
 | \
                     sed -rn 's/^compat_ro_flags\s+(.*)$/\1/p')"
        if ((compat_ro & 0x1)); then
                echo "free space tree is enabled"
        else
                echo "free space tree is disabled"
        fi

dump-super is reading the super block out of the page cache, but this
change makes the page cache incoherent with what's on disc.  We could
fix that by invalidating the page out of the page cache, but it may be
easier to just dump this patch and fix how we use the page cache to
write back the superblocks?

--===============3968873735827989055==--

