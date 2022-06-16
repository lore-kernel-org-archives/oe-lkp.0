Content-Type: multipart/mixed; boundary="===============1332620694933061829=="
MIME-Version: 1.0
From: David Sterba <dsterba@suse.cz>
To: lkp@lists.01.org
Subject: Re: [btrfs] 66a7a2412f: xfstests.btrfs.131.fail
Date: Fri, 17 Jun 2022 00:00:36 +0200
Message-ID: <20220616220036.GF20633@twin.jikos.cz>
In-Reply-To: <Yqud1/SooVDamiuP@casper.infradead.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============1332620694933061829==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 16, 2022 at 10:17:11PM +0100, Matthew Wilcox wrote:
> On Thu, Jun 16, 2022 at 10:37:10PM +0800, kernel test robot wrote:
> > btrfs/131	- output mismatch (see /lkp/benchmarks/xfstests/results//btrf=
s/131.out.bad)
> >     --- tests/btrfs/131.out	2022-06-13 17:10:24.000000000 +0000
> >     +++ /lkp/benchmarks/xfstests/results//btrfs/131.out.bad	2022-06-15 =
18:54:06.505508542 +0000
> >     @@ -2,9 +2,9 @@
> >      Using free space cache
> >      free space tree is disabled
> >      Enabling free space tree
> >     -free space tree is enabled
> >     +free space tree is disabled
> =

> I think I know what's going on here:
> =

>         compat_ro=3D"$($BTRFS_UTIL_PROG inspect-internal dump-super "$SCR=
ATCH_DEV"
>  | \
>                      sed -rn 's/^compat_ro_flags\s+(.*)$/\1/p')"
>         if ((compat_ro & 0x1)); then
>                 echo "free space tree is enabled"
>         else
>                 echo "free space tree is disabled"
>         fi
> =

> dump-super is reading the super block out of the page cache, but this
> change makes the page cache incoherent with what's on disc.  We could
> fix that by invalidating the page out of the page cache, but it may be
> easier to just dump this patch and fix how we use the page cache to
> write back the superblocks?

The build bot picks up the branch with some delay, I've removed it from
the pushed branches. It's interesting to see that using the page cache
vs direct write does have effects in tests, so it would need to be
unified in kernel and user space.
--===============1332620694933061829==--

