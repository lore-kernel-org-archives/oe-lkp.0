Content-Type: multipart/mixed; boundary="===============2905281196030659856=="
MIME-Version: 1.0
From: Mark Fasheh <mfasheh@suse.de>
To: lkp@lists.01.org
Subject: Re: [Btrfs] 02507c91c8: BUG: unable to handle kernel NULL pointer dereference at 00000018
Date: Mon, 09 Nov 2015 19:27:40 -0800
Message-ID: <20151110032740.GL15575@wotan.suse.de>
In-Reply-To: <87bnb2d2qt.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2905281196030659856==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 10, 2015 at 10:09:30AM +0800, kernel test robot wrote:
> FYI, we noticed the below changes on
> =

> https://github.com/0day-ci/linux Mark-Fasheh/btrfs-update-qgroups-in-drop=
-snapshot-V2/20151106-064051
> commit 02507c91c8944d71dae65bddc45b764be65069f8 ("Btrfs: use btrfs_get_fs=
_root in resolve_indirect_ref")

I browsed the repo above and didn't see this commit:

d9ee522 Btrfs: fix qgroup sanity tests

Which I believe would help your situation. Please let me know if I am
mistaken.

Thanks,
	--Mark

--
Mark Fasheh

--===============2905281196030659856==--

