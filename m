Content-Type: multipart/mixed; boundary="===============6479786943779516347=="
MIME-Version: 1.0
From: David Sterba <dsterba@suse.cz>
To: lkp@lists.01.org
Subject: Re: [btrfs] 6d01952397:
Date: Mon, 05 Jun 2017 14:03:16 +0200
Message-ID: <20170605120316.GS12135@suse.cz>
In-Reply-To: <20170605110432.GA124438@inn.lkp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6479786943779516347==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Adding linux-btrfs to CC.

On Mon, Jun 05, 2017 at 07:04:32PM +0800, kernel test robot wrote:
> FYI, we noticed the following commit:
> =

> commit: 6d01952397a3c0b2a5f2d60148ee70a7f0888d40 ("btrfs: scrub: inline h=
elper scrub_setup_wr_ctx")
> https://github.com/kdave/btrfs-devel.git misc-next
> =

> in testcase: xfstests
> with following parameters:
> =

> 	disk: 6HDD
> 	fs: btrfs
> 	test: btrfs-mid2
> =

> test-description: xfstests is a regression test suite for xfs and other f=
iles ystems.
> test-url: git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git

Thanks for the report. It's a harmless warning, so you can disregard it
until it'll get fixed.

In more detail:

* btrfs/100 attempts to do dev-replace and inject an EIO
* there are expected errors reported in dmesg
* there's also a stacktrace, caused by

fs/btrfs/dev-replace.c:413

409         ret =3D btrfs_dev_replace_finishing(fs_info, ret);
410         if (ret =3D=3D -EINPROGRESS) {
411                 ret =3D BTRFS_IOCTL_DEV_REPLACE_RESULT_SCRUB_INPROGRESS;
412         } else {
413                 WARN_ON(ret);
^^^
414         }

ie. an unexpected return code after dev-replace, but I don't see much
point reporting it with the stacktrace. The way the error codes get
reported back to userspace does not seem to be clean, as there are
-ERRNO codes returned and also positive values from
BTRFS_IOCTL_DEV_REPLACE_RESULT_* . I don't have a quick fix, this
touches the kernel/userspace interface, we'll have to be careful about
the backward compatibility.

--===============6479786943779516347==--

