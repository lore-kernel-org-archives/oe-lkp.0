Content-Type: multipart/mixed; boundary="===============6048210979337691397=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [panic] [ BUG: bad unlock balance detected! ]
Date: Mon, 16 Nov 2015 16:43:00 -0800
Message-ID: <20151116164300.233add92c0f4b3990ecc3dd6@linux-foundation.org>
In-Reply-To: <871tbq8wnh.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6048210979337691397==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 16 Nov 2015 11:12:50 +0800 kernel test robot <ying.huang@linux.in=
tel.com> wrote:

> FYI, we noticed the below changes on
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> commit 08d78658f393fefaa2e6507ea052c6f8ef4002a2 ("panic: release stale co=
nsole lock to always get the logbuf printed out")
> =

> ...
>
> [   38.408623] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   38.408623] [ BUG: bad unlock balance detected! ]
> [   38.408627] 4.3.0-08150-g08d7865 #1 Not tainted
> [   38.408627] -------------------------------------
> [   38.408631] swapper/0/1 is trying to release lock (console_lock) at:
> [   38.408639] [<ffffffff811a3cb1>] panic+0x124/0x213
> [   38.408640] but there are no more locks to release!
> [   38.408641] =

> [   38.408641] other info that might help us debug this:
> [   38.408642] 2 locks held by swapper/0/1:
> [   38.408651]  #0:  (oom_lock){+.+...}, at: [<ffffffff811add45>] __alloc=
_pages_slowpath+0x5bd/0x68d
> [   38.408656]  #1:  (panic_lock){......}, at: [<ffffffff811a3bd9>] panic=
+0x4c/0x213
> [   38.408657] =

> [   38.408657] stack backtrace:
> [   38.408659] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.3.0-08150-g08d=
7865 #1
> [   38.408660] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S Debian-1.8.2-1 04/01/2014
> [   38.408665]  0000000000000000 ffff8800132bba78 ffffffff8173760d ffff88=
00132b4040
> [   38.408668]  ffff8800132bbaa0 ffffffff8111328c 00000000ffffffff ffff88=
00132b4040
> [   38.408670]  ffffffff8406a080 ffff8800132bbb18 ffffffff8111626c ffffff=
ff811139d1
> [   38.408671] Call Trace:
> [   38.408678]  [<ffffffff8173760d>] dump_stack+0x4b/0x63
> [   38.408682]  [<ffffffff8111328c>] print_unlock_imbalance_bug+0xc7/0xd0

Yup, we can't have this happen.

Can we instead do this?

	if (is_console_locked())
		console_unlock();

It's racy, but more accurate than what we have now?

--===============6048210979337691397==--

