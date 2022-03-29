Content-Type: multipart/mixed; boundary="===============1365709011800564581=="
MIME-Version: 1.0
From: David Sterba <dsterba@suse.cz>
To: lkp@lists.01.org
Subject: Re: [fs] 37da949345: xfstests.generic.374.fail
Date: Tue, 29 Mar 2022 18:28:07 +0200
Message-ID: <20220329162806.GY2237@suse.cz>
In-Reply-To: <CA+QYu4osuzA+V5Th29SOsS1FnAZgdsaTc_qNPyPp=GH+q1LZYQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1365709011800564581==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 29, 2022 at 12:26:43PM +0200, Bruno Goncalves wrote:
> On Fri, Mar 11, 2022 at 4:23 AM kernel test robot <oliver.sang@intel.co=
m> wrote:
> >      Mount otherdir
> >      Create file
> >      Dedupe one file to another
> >     -XFS_IOC_FILE_EXTENT_SAME: Invalid cross-device link
> >     +deduped 65536/65536 bytes at offset 0
> >     +64 KiB, 1 ops; 0.0018 sec (33.967 MiB/sec and 543.4783 ops/sec)
> >      Check output
> >     ...
> >     (Run 'diff -u /lkp/benchmarks/xfstests/tests/generic/374.out /lkp/b=
enchmarks/xfstests/results//generic/374.out.bad'  to see the entire diff)
> > generic/375      1s
> > generic/376      2s
> > generic/377      1s
> > generic/378      1s
> > generic/379     [not run] disk quotas not supported by this filesystem =
type: btrfs
> > Ran: generic/360 generic/361 generic/362 generic/363 generic/364 generi=
c/365 generic/366 generic/367 generic/368 generic/369 generic/370 generic/3=
71 generic/372 generic/373 generic/374 generic/375 generic/376 generic/377 =
generic/378 generic/379
> > Not run: generic/362 generic/363 generic/364 generic/365 generic/366 ge=
neric/367 generic/368 generic/369 generic/370 generic/372 generic/379
> > Failures: generic/373 generic/374
> > Failed 2 of 20 tests
> >
> >
> =

> We are also able to reproduce this on mainline kernel with gcc12, the
> problem seems to have been introduced by [1].
> =

> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/?id=3D5191290407668028179f2544a11ae9b57f0bcf07

I think you need to update fstests once the patches from
https://lore.kernel.org/linux-btrfs/bad40a464e1728309e185a031e8d3652c22b68c=
f.1648153387.git.josef(a)toxicpanda.com/
are merged.
--===============1365709011800564581==--

