Content-Type: multipart/mixed; boundary="===============5055759455320485895=="
MIME-Version: 1.0
From: Catalin Marinas <catalin.marinas@arm.com>
To: lkp@lists.01.org
Subject: Re: [kmemleak] b751c52bb5: BUG:kernel_hang_in_boot_stage
Date: Wed, 10 Jun 2020 11:56:42 +0100
Message-ID: <20200610105640.GB26099@gaia>
In-Reply-To: <20200610075156.GE12456@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============5055759455320485895==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2020 at 03:51:56PM +0800, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: b751c52bb587ae66f773b15204ef7a147467f4c7 ("kmemleak: increase DEB=
UG_KMEMLEAK_EARLY_LOG_SIZE default to 16K")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: boot
> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 8G
[...]
> BUG: kernel hang in boot stage
> =

> To reproduce:
> =

>         # build kernel
> 	cd linux
> 	cp config-5.3.0-11789-gb751c52bb587a .config
> 	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Di386 olddefconfig prepare modules_=
prepare bzImage

I've never tried kmemleak on i386.

Anyway, I'm not sure what caused the hang (or whether it's a hang at
all) but I suspect prior to the above commit, kmemleak probably just
disabled itself (early log  buffer exceeded). So the bug may have been
there already, only that kmemleak started working and tripped over it
when the log buffer increased.

Is there a chance that the kernel got much slower with kmemleak enabled
and the test scripts timed out?

Does this problem still exist with the latest mainline?

Thanks.

-- =

Catalin
--===============5055759455320485895==--

