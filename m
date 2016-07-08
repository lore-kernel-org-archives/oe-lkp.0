Content-Type: multipart/mixed; boundary="===============7495851439020452258=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [ASoC] 91c1832579: BUG: unable to handle kernel NULL pointer dereference
Date: Fri, 08 Jul 2016 10:42:33 +0800
Message-ID: <20160708024233.GG31459@yexl-desktop>
In-Reply-To: <20160708023741.GF31459@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============7495851439020452258==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 08, 2016 at 10:37:41AM +0800, Ye Xiaolong wrote:
>On Fri, Jul 08, 2016 at 09:06:58AM +0800, Patel, Vedang wrote:
>>Hi Xialong.=C2=A0
>>
>>Is it possible for you try the attached change and see if you are still
>>able to reproduce the issue?
>>
>
>Hi, Patel
>
>Tried 3-times boot test with your fix patch applied on 91c18325 ("ASoC: In=
tel:
>Skylake: Increase loglevel of debug messages."), no kernel panic found.
>

Attached the dmesg for the test.

>Tested-by: Ye Xiaolong <xiaolong.ye@intel.com>
>
>Thanks,
>Xiaolong
>
>>Thanks,
>>Vedang
>>
>>On Wed, 2016-07-06 at 18:52 -0700, Patel, Vedang wrote:
>>> Can you send me your test setup to reproduce the bug? In the command
>>> you send, there seem to be some arguments pointing to files on the
>>> subsystem. (like initrd.)
>>> =

>>> It will be helpful if I can replicate exactly what you did.
>>> =

>>> Thanks,
>>> Vedang
>>> =

>>> On Thu, 2016-06-30 at 09:57 +0800, kernel test robot wrote:
>>> > =

>>> > FYI, we noticed the following commit:
>>> > =

>>> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>>> > master
>>> > commit 91c1832579700891747820862633f9a8d0d81fa4 ("ASoC: Intel:
>>> > Skylake: Increase loglevel of debug messages.")
>>> > =

>>> > in testcase: boot
>>> > =

>>> > on test machine: 1 threads qemu-system-i386 -enable-kvm with 360M
>>> > memory
>>> > =

>>> > caused below changes:
>>> > =

>>> > =

>>> > +------------------------------------------------------------+-----
>>> > --
>>> > -----+------------+
>>> > > =

>>> > > =

>>> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>>> > > ef06b6f391 | 91c1832579 |
>>> > +------------------------------------------------------------+-----
>>> > --
>>> > -----+------------+
>>> > > =

>>> > > =

>>> > > boot_successes=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>>> > > 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>>> > > boot_failures=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>>> > > 14=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 14=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>>> > > genirq:Flags_mismatch_irq##(serial)vs.#(goldfish_pdev_bus) |
>>> > > 14=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>>> > > invoked_oom-killer:gfp_mask=3D0x=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>>> > > 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>>> > > Mem-Info=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0|
>>> > > 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>>> > > Out_of_memory:Kill_process=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0|
>>> > > 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>>> > > backtrace:do_writev=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>>> > > 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>>> > > backtrace:SyS_writev=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>>> > > 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>>> > > backtrace:vfs_write=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>>> > > 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>>> > > backtrace:SyS_write=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>>> > > 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>>> > > BUG:unable_to_handle_kernel=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0|
>>> > > 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 14=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>>> > > Oops:#[##]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0|
>>> > > 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 14=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>>> > > EIP_is_at_strlen=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>>> > > 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 14=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>>> > > Kernel_panic-not_syncing:Fatal_exception=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0|
>>> > > 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 14=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>>> > > backtrace:dynamic_debug_init=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>>> > > 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 14=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>>> > > backtrace:kernel_init_freeable=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>>> > > 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 14=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>>> > +------------------------------------------------------------+-----
>>> > --
>>> > -----+------------+
>>> > =

>>> > =

>>> > =

>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.291679] Performance Events:=C2=A0
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.291679] Performance Events: Broken PMU har=
dware detected,
>>> > using software events only.
>>> > Broken PMU hardware detected, using software events only.
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.309122] BUG: unable to handle kernel=C2=A0
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.309122] BUG: unable to handle kernel NULL =
pointer
>>> > dereferenceNULL pointer dereference at=C2=A0=C2=A0=C2=A0(null)
>>> > =C2=A0at=C2=A0=C2=A0=C2=A0(null)
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.310586] IP:
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.310586] IP: [<c131a701>] strlen+0xb/0x17
>>> > =C2=A0[<c131a701>] strlen+0xb/0x17
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.311438] *pdpt =3D 0000000000000000=C2=A0
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.311438] *pdpt =3D 0000000000000000 *pde =
=3D f000ff53f000ff53
>>> > *pde
>>> > =3D f000ff53f000ff53=C2=A0
>>> > =

>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.312549] Oops: 0000 [#1]
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.312549] Oops: 0000 [#1]
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.313064] CPU: 0 PID: 1 Comm: swapper Not ta=
inted 4.7.0-rc1-
>>> > 00046-g91c1832 #1
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.313064] CPU: 0 PID: 1 Comm: swapper Not ta=
inted 4.7.0-rc1-
>>> > 00046-g91c1832 #1
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.314469] Hardware name: QEMU Standard PC (i=
440FX + PIIX,
>>> > 1996),
>>> > BIOS Debian-1.8.2-1 04/01/2014
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.314469] Hardware name: QEMU Standard PC (i=
440FX + PIIX,
>>> > 1996),
>>> > BIOS Debian-1.8.2-1 04/01/2014
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.316115] task: c0058040 ti: c004e000 task.t=
i: c004e000
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.316115] task: c0058040 ti: c004e000 task.t=
i: c004e000
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.317110] EIP: 0060:[<c131a701>] EFLAGS: 002=
10246 CPU: 0
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.317110] EIP: 0060:[<c131a701>] EFLAGS: 002=
10246 CPU: 0
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.318160] EIP is at strlen+0xb/0x17
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.318160] EIP is at strlen+0xb/0x17
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.318866] EAX: 00000000 EBX: c21facc0 ECX: f=
fffffff EDX:
>>> > c20bc808
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.318866] EAX: 00000000 EBX: c21facc0 ECX: f=
fffffff EDX:
>>> > c20bc808
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.320029] ESI: 00000004 EDI: 00000000 EBP: c=
004ff00 ESP:
>>> > c004fefc
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.320029] ESI: 00000004 EDI: 00000000 EBP: c=
004ff00 ESP:
>>> > c004fefc
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.321264]=C2=A0=C2=A0DS: 007b ES: 007b FS: 0=
000 GS: 00e0 SS: 0068
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.321264]=C2=A0=C2=A0DS: 007b ES: 007b FS: 0=
000 GS: 00e0 SS: 0068
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.322264] CR0: 80050033 CR2: 00000000 CR3: 0=
22a1000 CR4:
>>> > 000006b0
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.322264] CR0: 80050033 CR2: 00000000 CR3: 0=
22a1000 CR4:
>>> > 000006b0
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.323471] Stack:
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.323471] Stack:
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.323861]=C2=A0=C2=A00000003a
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.323861]=C2=A0=C2=A00000003a c004ff2c c004f=
f2c c2225b46 c2225b46
>>> > c20bc808
>>> > c20bc808 00000024 00000024 00001aa5 00001aa5 000adc33 000adc33
>>> > 00000256 00000256
>>> > =

>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.325492]=C2=A0=C2=A0c21fac60
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.325492]=C2=A0=C2=A0c21fac60 c2225abd c2225=
abd ffffffff ffffffff
>>> > 00000000
>>> > 00000000 c004ff8c c004ff8c c2201c4f c2201c4f 7fffffff 7fffffff
>>> > c2250884 c2250884
>>> > =

>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.327033]=C2=A0=C2=A0c0058000
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.327033]=C2=A0=C2=A0c0058000 7fffffff 7ffff=
fff c004ff4c c004ff4c
>>> > c1ad6a4b
>>> > c1ad6a4b c004ff80 c004ff80 c1ad4825 c1ad4825 00000000 00000000
>>> > c1ad61f2 c1ad61f2
>>> > =

>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.328680] Call Trace:
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.328680] Call Trace:
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.329134]=C2=A0=C2=A0[<c2225b46>] dynamic_de=
bug_init+0x89/0x1ee
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.329134]=C2=A0=C2=A0[<c2225b46>] dynamic_de=
bug_init+0x89/0x1ee
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.330100]=C2=A0=C2=A0[<c2225abd>] ? dynamic_=
debug_init_debugfs+0x5f/0x5f
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.330100]=C2=A0=C2=A0[<c2225abd>] ? dynamic_=
debug_init_debugfs+0x5f/0x5f
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.331237]=C2=A0=C2=A0[<c2201c4f>] do_one_ini=
tcall+0x89/0x112
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.331237]=C2=A0=C2=A0[<c2201c4f>] do_one_ini=
tcall+0x89/0x112
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.332161]=C2=A0=C2=A0[<c1ad6a4b>] ? _raw_spi=
n_unlock_irq+0xd/0x15
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.332161]=C2=A0=C2=A0[<c1ad6a4b>] ? _raw_spi=
n_unlock_irq+0xd/0x15
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.333158]=C2=A0=C2=A0[<c1ad4825>] ? __wait_f=
or_common+0xed/0xf7
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.333158]=C2=A0=C2=A0[<c1ad4825>] ? __wait_f=
or_common+0xed/0xf7
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.334158]=C2=A0=C2=A0[<c1ad61f2>] ?
>>> > console_conditional_schedule+0x24/0x24
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.334158]=C2=A0=C2=A0[<c1ad61f2>] ?
>>> > console_conditional_schedule+0x24/0x24
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.335303]=C2=A0=C2=A0[<c2201d1e>] kernel_ini=
t_freeable+0x46/0x165
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.335303]=C2=A0=C2=A0[<c2201d1e>] kernel_ini=
t_freeable+0x46/0x165
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.336383]=C2=A0=C2=A0[<c1ad2e5d>] kernel_ini=
t+0x8/0xcb
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.336383]=C2=A0=C2=A0[<c1ad2e5d>] kernel_ini=
t+0x8/0xcb
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.337209]=C2=A0=C2=A0[<c1ad6c62>] ret_from_k=
ernel_thread+0xe/0x24
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.337209]=C2=A0=C2=A0[<c1ad6c62>] ret_from_k=
ernel_thread+0xe/0x24
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.338236]=C2=A0=C2=A0[<c1ad2e55>] ? rest_ini=
t+0x65/0x65
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.338236]=C2=A0=C2=A0[<c1ad2e55>] ? rest_ini=
t+0x65/0x65
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.339151] Code:
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.339151] Code: 5d 5d c3 c3 55 55 89 89 e5 e=
5 56 56 89 89 c6
>>> > c6
>>> > 89 89 d0 d0 88 88 c4 c4 ac ac 38 38 e0 e0 74 74 09 09 84 84 c0 c0
>>> > 75
>>> > 75 f7 f7 be be 01 01 00 00 00 00 00 00 89 89 f0 f0 48 48 5e 5e 5d
>>> > 5d
>>> > c3 c3 55 55 83 83 c9 c9 ff ff 89 89 e5 e5 57 57 89 89 c7 c7 31 31
>>> > c0
>>> > c0 <f2> <f2> ae ae 5f 5f b8 b8 fe fe ff ff ff ff ff ff 29 29 c8 c8
>>> > 5d
>>> > 5d c3 c3 85 85 c9 c9 74 74 16 16 55 55 89 89 e5 e5 57 57 89 89
>>> > =

>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.343525] EIP: [<c131a701>]=C2=A0
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.343525] EIP: [<c131a701>] strlen+0xb/0x17s=
trlen+0xb/0x17
>>> > SS:ESP 0068:c004fefc
>>> > =C2=A0SS:ESP 0068:c004fefc
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.344739] CR2: 0000000000000000
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.344739] CR2: 0000000000000000
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.345342] ---[ end trace 04f806a67a86eccc ]-=
--
>>> > [=C2=A0=C2=A0=C2=A0=C2=A00.345342] ---[ end trace 04f806a67a86eccc ]-=
--
>>> > =

>>> > =

>>> > FYI, raw QEMU command line is:
>>> > =

>>> > 	qemu-system-i386 -enable-kvm -kernel /pkg/linux/i386-
>>> > randconfig-c0-06280858/gcc-
>>> > 6/91c1832579700891747820862633f9a8d0d81fa4/vmlinuz-4.7.0-rc1-00046-
>>> > g91c1832 -append 'root=3D/dev/ram0 user=3Dlkp job=3D/lkp/scheduled/vm-
>>> > lkp-
>>> > wsx03-quantal-i386-3/rand_boot-1-quantal-core-i386.cgz-i386-
>>> > randconfig-c0-06280858-91c1832579700891747820862633f9a8d0d81fa4-
>>> > 20160628-92876-1qu8nei-0.yaml ARCH=3Di386 kconfig=3Di386-randconfig-c=
0-
>>> > 06280858 branch=3Dlinux-devel/devel-hourly-2016062804
>>> > commit=3D91c1832579700891747820862633f9a8d0d81fa4
>>> > BOOT_IMAGE=3D/pkg/linux/i386-randconfig-c0-06280858/gcc-
>>> > 6/91c1832579700891747820862633f9a8d0d81fa4/vmlinuz-4.7.0-rc1-00046-
>>> > g91c1832 max_uptime=3D600 RESULT_ROOT=3D/result/boot/1/vm-lkp-wsx03-
>>> > quantal-i386/quantal-core-i386.cgz/i386-randconfig-c0-06280858/gcc-
>>> > 6/91c1832579700891747820862633f9a8d0d81fa4/0 LKP_SERVER=3Dinn
>>> > earlyprintk=3DttyS0,115200 systemd.log_level=3Derr debug apic=3Ddebug
>>> > sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D100 panic=3D-1
>>> > softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic load_ramdisk=
=3D2
>>> > prompt_ramdisk=3D0 console=3DttyS0,115200 console=3Dtty0 vga=3Dnormal=
 rw
>>> > ip=3D::::vm-lkp-wsx03-quantal-i386-3::dhcp drbd.minor_count=3D8'=C2=
=A0=C2=A0-
>>> > initrd=C2=A0
>>> > /fs/sdc1/initrd-vm-lkp-wsx03-quantal-i386-3 -m 360 -smp 1 -device
>>> > e1000,netdev=3Dnet0 -netdev user,id=3Dnet0 -boot order=3Dnc -no-reboot
>>> > -watchdog i6300esb -rtc base=3Dlocaltime -pidfile /dev/shm/kboot/pid-
>>> > vm-lkp-wsx03-quantal-i386-3 -serial file:/dev/shm/kboot/serial-vm-
>>> > lkp-wsx03-quantal-i386-3 -daemonize -display none -monitor null=C2=A0
>>> > =

>>> > =

>>> > =

>>> > =

>>> > =

>>> > Thanks,
>>> > Xiaolong
>
>>From 8602d6c24a0159be050849aa934ac18f8d13fef3 Mon Sep 17 00:00:00 2001
>>From: Vedang Patel <vedang.patel@intel.com>
>>Date: Thu, 7 Jul 2016 17:38:44 -0700
>>Subject: [PATCH] ASoC: Intel: Skylake: Fix error while dynamic debug.
>>
>>Change-Id: I1e99896a0de5576d8eccdce4dbd666f05b4263ea
>>---
>> sound/soc/intel/skylake/skl-sst-ipc.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>>diff --git a/sound/soc/intel/skylake/skl-sst-ipc.c b/sound/soc/intel/skyl=
ake/skl-sst-ipc.c
>>index c141f24..96f2f68 100644
>>--- a/sound/soc/intel/skylake/skl-sst-ipc.c
>>+++ b/sound/soc/intel/skylake/skl-sst-ipc.c
>>@@ -692,7 +692,7 @@ int skl_ipc_init_instance(struct sst_generic_ipc *ipc,
>> 	 /* param_block_size must be in dwords */
>> 	u16 param_block_size =3D msg->param_data_size / sizeof(u32);
>> =

>>-	print_hex_dump_debug(NULL, DUMP_PREFIX_NONE,
>>+	print_hex_dump_debug("Param data:", DUMP_PREFIX_NONE,
>> 		16, 4, buffer, param_block_size, false);
>> =

>> 	header.primary =3D IPC_MSG_TARGET(IPC_MOD_MSG);
>>-- =

>>2.8.2
>>
>
>_______________________________________________
>LKP mailing list
>LKP(a)lists.01.org
>https://lists.01.org/mailman/listinfo/lkp

--===============7495851439020452258==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="dmesg.xz"

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
Z/sCAAAAAARZWg==
--===============7495851439020452258==--

