Content-Type: multipart/mixed; boundary="===============5384788270280961380=="
MIME-Version: 1.0
From: Trond Myklebust <trondmy@primarydata.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [NFS] 14d1bbb0ca: BUG:scheduling_while_atomic
Date: Wed, 24 May 2017 11:44:27 +0000
Message-ID: <1495626265.8735.2.camel@primarydata.com>
In-Reply-To: <20170524023629.GK1795@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============5384788270280961380==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-05-24 at 10:36 +0800, kernel test robot wrote:
> FYI, we noticed the following commit:
> =

> commit: 14d1bbb0ca425c4fdd9a38eaac346c028661b752 ("NFS: Create a
> common nfs4_match_client() function")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git
> master
> =

> in testcase: boot
> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu host -smp 2 -m
> 4G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire
> log/backtrace):
> =

> =

> +-------------------------------+------------+------------+
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 5b6d3ff605 | 14d1bbb0ca |
> =

> +-------------------------------+------------+------------+
> > boot_successes=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 469=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0| 470=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
> > boot_failures=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 31=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0|
> > BUG:scheduling_while_atomic=C2=A0=C2=A0=C2=A0| 0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 31=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0|
> > BUG:spinlock_recursion_on_CPU | 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0| 30=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0|
> =

> +-------------------------------+------------+------------+
> =

> =

> =

> [=C2=A0=C2=A0299.158991] BUG: scheduling while atomic:
> mount.nfs/9387/0x00000002
> [=C2=A0=C2=A0299.169587] 2 locks held by mount.nfs/9387:
> [=C2=A0=C2=A0299.176165]=C2=A0=C2=A0#0:=C2=A0=C2=A0(nfs_clid_init_mutex){=
......}, at:
> [<ffffffff8130cc92>] nfs4_discover_server_trunking+0x47/0x1fc
> [=C2=A0=C2=A0299.201802]=C2=A0=C2=A0#1:=C2=A0=C2=A0(&(&nn->nfs_client_loc=
k)->rlock){......}, at:
> [<ffffffff813125fa>] nfs40_walk_client_list+0x2e9/0x338
> =


Oops. Anna, it looks as if that patch adds an incorrect call to
"spin_lock(&nn->nfs_client_lock)" for the "default:" case when
processing the result from the SETCLIENTID_CONFIRM call. I can send a
fix.

Thanks Xiaolong!

Cheers
  Trond

-- =

Trond Myklebust
Linux NFS client maintainer, PrimaryData
trond.myklebust(a)primarydata.com

--===============5384788270280961380==--

