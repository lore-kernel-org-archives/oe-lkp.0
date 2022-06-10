Content-Type: multipart/mixed; boundary="===============8619279746419199711=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [btrfs] 62bd8124e2: WARNING:at_fs/btrfs/block-rsv.c:#btrfs_release_global_block_rsv[btrfs]
Date: Fri, 10 Jun 2022 09:26:59 +0800
Message-ID: <20220610012659.GA6844@xsang-OptiPlex-9020>
In-Reply-To: <20220609094652.GB3668047@falcondesktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============8619279746419199711==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hi, Filipe Manana,

On Thu, Jun 09, 2022 at 10:46:52AM +0100, Filipe Manana wrote:
> =

> I am unable to reproduce that on a 12 cores box.
> I also don't see anything wrong that could lead to that by manual inspect=
ion.
> =

> How easy is it for you to trigger it?

we reproduced this upon 62bd8124e2 4 times out of 6 runs.
but since the other 2 runs crash early due to other issues (below (1)), we
cannot say they are clean.
at the same time, the 6 runs for parent are clean.

7e2bb5b3f3bca223 62bd8124e2f17910fcd89568e50
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :6           67%           4:6     dmesg.RIP:btrfs_release_globa=
l_block_rsv[btrfs]
           :6           67%           4:6     dmesg.WARNING:at_fs/btrfs/blo=
ck-rsv.c:#btrfs_release_global_block_rsv[btrfs]
           :6           33%           2:6     dmesg.kernel_BUG_at_fs/xfs/xf=
s_message.c  <----- (1)


> =

> Can you also run it with CONFIG_BTRFS_ASSERT=3Dy set in the kernel config?

got it, we will enable this config and rerun tests, for both this commit and
parent.

--===============8619279746419199711==--

