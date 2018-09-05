Content-Type: multipart/mixed; boundary="===============4453286801010578387=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: 3f906ba236 [ 71.192813] WARNING: possible circular locking dependency detected
Date: Wed, 05 Sep 2018 15:02:40 +0200
Message-ID: <alpine.DEB.2.21.1809051459130.1416@nanos.tec.linutronix.de>
In-Reply-To: <20180905090553.GA6655@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============4453286801010578387==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 5 Sep 2018, kernel test robot wrote:

> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> =

> commit 3f906ba23689a3f824424c50f3ae937c2c70f676
> Author:     Thomas Gleixner <tglx@linutronix.de>
> AuthorDate: Mon Jul 10 15:50:09 2017 -0700
> Commit:     Linus Torvalds <torvalds@linux-foundation.org>
> CommitDate: Mon Jul 10 16:32:33 2017 -0700

So it identified a more than one year old commit. Great.

> vm86 returned ENOSYS, marking as inactive. 20044 iterations. [F:14867 S:5=
032 HI:3700] [ 57.651003] synth uevent: /module/pcmcia_core: unknown uevent=
 action string [ 71.189062] [ 71.191953] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [ 71.192813] WARNING=
: possible circular locking dependency detected [ 71.193664] 4.12.0-10480-g=
3f906ba #1 Not tainted [ 71.194355] ---------------------------------------=
--------------- [ 71.195211] trinity-c0/1666 is trying to acquire lock: [ 7=
1.195958] (mem_hotplug_lock.rw_sem){.+.+.+}, at: show_slab_objects+0x14b/0x=
440 [ 71.197284] [ 71.197284] but task is already holding lock:

along with completely unparseable information. What am I supposed to do
with this mail?

Thanks,

	tglx

--===============4453286801010578387==--

