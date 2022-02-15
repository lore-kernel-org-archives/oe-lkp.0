Content-Type: multipart/mixed; boundary="===============6062708693661854664=="
MIME-Version: 1.0
From: David Sterba <dsterba@suse.cz>
To: lkp@lists.01.org
Subject: Re: [btrfs] dae7bf275f: last_state.incomplete
Date: Tue, 15 Feb 2022 13:05:42 +0100
Message-ID: <20220215120541.GL12643@twin.jikos.cz>
In-Reply-To: <20220215072054.GD28159@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============6062708693661854664==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2022 at 03:20:54PM +0800, kernel test robot wrote:
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> =

> the test's last state 'incomplete' seems be caused by below error (detail
> in attached dmesg.xz)
> =

> [   49.293458][ T3822] BTRFS info (device sdb3): flagging fs with big met=
adata feature
> [   49.301630][ T3822] BTRFS info (device sdb3): disk space caching is en=
abled
> [   49.309039][ T3822] BTRFS info (device sdb3): has skinny extents
> [   49.320312][ T3822] BTRFS error (device sdb3): invalid number of strip=
es 0 in sys_array at offset 17
> [   49.329910][ T3822] BTRFS error (device sdb3): failed to read the syst=
em array: -5
> [   49.346302][ T3822] BTRFS error (device sdb3): open_ctree failed

Seems that your setup has some problems with creating/using valid
filesystems. It's reported on a patch that moves a sanity check from an
ASSERT, and your kernel is not built with asserts enabled so it actually
started to test more things.

> CONFIG_BTRFS_FS=3Dm
> CONFIG_BTRFS_FS_POSIX_ACL=3Dy
> # CONFIG_BTRFS_FS_CHECK_INTEGRITY is not set
> # CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
> # CONFIG_BTRFS_DEBUG is not set
> # CONFIG_BTRFS_ASSERT is not set

Not set before, now it is. You may want to enable this to see if there
are more problems reported. It can be one time or enabled for all
testing, the assertions should be lightweight enough for that (compared
to CONFIG_BTRFS_DEBUG).

> # CONFIG_BTRFS_FS_REF_VERIFY is not set
--===============6062708693661854664==--

