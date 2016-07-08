Content-Type: multipart/mixed; boundary="===============1179101507861377661=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [ASoC] 91c1832579: BUG: unable to handle kernel NULL pointer dereference
Date: Fri, 08 Jul 2016 10:37:41 +0800
Message-ID: <20160708023741.GF31459@yexl-desktop>
In-Reply-To: <1467940018.15837.23.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1179101507861377661==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 08, 2016 at 09:06:58AM +0800, Patel, Vedang wrote:
>Hi Xialong.=C2=A0
>
>Is it possible for you try the attached change and see if you are still
>able to reproduce the issue?
>

Hi, Patel

Tried 3-times boot test with your fix patch applied on 91c18325 ("ASoC: Int=
el:
Skylake: Increase loglevel of debug messages."), no kernel panic found.

Tested-by: Ye Xiaolong <xiaolong.ye@intel.com>

Thanks,
Xiaolong

>Thanks,
>Vedang
>
>On Wed, 2016-07-06 at 18:52 -0700, Patel, Vedang wrote:
>> Can you send me your test setup to reproduce the bug? In the command
>> you send, there seem to be some arguments pointing to files on the
>> subsystem. (like initrd.)
>> =

>> It will be helpful if I can replicate exactly what you did.
>> =

>> Thanks,
>> Vedang
>> =

>> On Thu, 2016-06-30 at 09:57 +0800, kernel test robot wrote:
>> > =

>> > FYI, we noticed the following commit:
>> > =

>> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>> > master
>> > commit 91c1832579700891747820862633f9a8d0d81fa4 ("ASoC: Intel:
>> > Skylake: Increase loglevel of debug messages.")
>> > =

>> > in testcase: boot
>> > =

>> > on test machine: 1 threads qemu-system-i386 -enable-kvm with 360M
>> > memory
>> > =

>> > caused below changes:
>> > =

>> > =

>> > +------------------------------------------------------------+-----
>> > --
>> > -----+------------+
>> > > =

>> > > =

>> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> > > ef06b6f391 | 91c1832579 |
>> > +------------------------------------------------------------+-----
>> > --
>> > -----+------------+
>> > > =

>> > > =

>> > > boot_successes=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> > > 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> > > boot_failures=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> > > 14=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 14=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> > > genirq:Flags_mismatch_irq##(serial)vs.#(goldfish_pdev_bus) |
>> > > 14=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> > > invoked_oom-killer:gfp_mask=3D0x=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> > > 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> > > Mem-Info=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0|
>> > > 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> > > Out_of_memory:Kill_process=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0|
>> > > 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> > > backtrace:do_writev=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> > > 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> > > backtrace:SyS_writev=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> > > 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> > > backtrace:vfs_write=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> > > 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> > > backtrace:SyS_write=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> > > 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> > > BUG:unable_to_handle_kernel=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0|
>> > > 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 14=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> > > Oops:#[##]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0|
>> > > 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 14=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> > > EIP_is_at_strlen=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> > > 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 14=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> > > Kernel_panic-not_syncing:Fatal_exception=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0|
>> > > 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 14=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> > > backtrace:dynamic_debug_init=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> > > 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 14=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> > > backtrace:kernel_init_freeable=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> > > 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 14=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> > +------------------------------------------------------------+-----
>> > --
>> > -----+------------+
>> > =

>> > =

>> > =

>> > [=C2=A0=C2=A0=C2=A0=C2=A00.291679] Performance Events:=C2=A0
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.291679] Performance Events: Broken PMU hard=
ware detected,
>> > using software events only.
>> > Broken PMU hardware detected, using software events only.
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.309122] BUG: unable to handle kernel=C2=A0
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.309122] BUG: unable to handle kernel NULL p=
ointer
>> > dereferenceNULL pointer dereference at=C2=A0=C2=A0=C2=A0(null)
>> > =C2=A0at=C2=A0=C2=A0=C2=A0(null)
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.310586] IP:
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.310586] IP: [<c131a701>] strlen+0xb/0x17
>> > =C2=A0[<c131a701>] strlen+0xb/0x17
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.311438] *pdpt =3D 0000000000000000=C2=A0
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.311438] *pdpt =3D 0000000000000000 *pde =3D=
 f000ff53f000ff53
>> > *pde
>> > =3D f000ff53f000ff53=C2=A0
>> > =

>> > [=C2=A0=C2=A0=C2=A0=C2=A00.312549] Oops: 0000 [#1]
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.312549] Oops: 0000 [#1]
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.313064] CPU: 0 PID: 1 Comm: swapper Not tai=
nted 4.7.0-rc1-
>> > 00046-g91c1832 #1
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.313064] CPU: 0 PID: 1 Comm: swapper Not tai=
nted 4.7.0-rc1-
>> > 00046-g91c1832 #1
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.314469] Hardware name: QEMU Standard PC (i4=
40FX + PIIX,
>> > 1996),
>> > BIOS Debian-1.8.2-1 04/01/2014
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.314469] Hardware name: QEMU Standard PC (i4=
40FX + PIIX,
>> > 1996),
>> > BIOS Debian-1.8.2-1 04/01/2014
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.316115] task: c0058040 ti: c004e000 task.ti=
: c004e000
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.316115] task: c0058040 ti: c004e000 task.ti=
: c004e000
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.317110] EIP: 0060:[<c131a701>] EFLAGS: 0021=
0246 CPU: 0
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.317110] EIP: 0060:[<c131a701>] EFLAGS: 0021=
0246 CPU: 0
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.318160] EIP is at strlen+0xb/0x17
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.318160] EIP is at strlen+0xb/0x17
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.318866] EAX: 00000000 EBX: c21facc0 ECX: ff=
ffffff EDX:
>> > c20bc808
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.318866] EAX: 00000000 EBX: c21facc0 ECX: ff=
ffffff EDX:
>> > c20bc808
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.320029] ESI: 00000004 EDI: 00000000 EBP: c0=
04ff00 ESP:
>> > c004fefc
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.320029] ESI: 00000004 EDI: 00000000 EBP: c0=
04ff00 ESP:
>> > c004fefc
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.321264]=C2=A0=C2=A0DS: 007b ES: 007b FS: 00=
00 GS: 00e0 SS: 0068
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.321264]=C2=A0=C2=A0DS: 007b ES: 007b FS: 00=
00 GS: 00e0 SS: 0068
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.322264] CR0: 80050033 CR2: 00000000 CR3: 02=
2a1000 CR4:
>> > 000006b0
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.322264] CR0: 80050033 CR2: 00000000 CR3: 02=
2a1000 CR4:
>> > 000006b0
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.323471] Stack:
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.323471] Stack:
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.323861]=C2=A0=C2=A00000003a
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.323861]=C2=A0=C2=A00000003a c004ff2c c004ff=
2c c2225b46 c2225b46
>> > c20bc808
>> > c20bc808 00000024 00000024 00001aa5 00001aa5 000adc33 000adc33
>> > 00000256 00000256
>> > =

>> > [=C2=A0=C2=A0=C2=A0=C2=A00.325492]=C2=A0=C2=A0c21fac60
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.325492]=C2=A0=C2=A0c21fac60 c2225abd c2225a=
bd ffffffff ffffffff
>> > 00000000
>> > 00000000 c004ff8c c004ff8c c2201c4f c2201c4f 7fffffff 7fffffff
>> > c2250884 c2250884
>> > =

>> > [=C2=A0=C2=A0=C2=A0=C2=A00.327033]=C2=A0=C2=A0c0058000
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.327033]=C2=A0=C2=A0c0058000 7fffffff 7fffff=
ff c004ff4c c004ff4c
>> > c1ad6a4b
>> > c1ad6a4b c004ff80 c004ff80 c1ad4825 c1ad4825 00000000 00000000
>> > c1ad61f2 c1ad61f2
>> > =

>> > [=C2=A0=C2=A0=C2=A0=C2=A00.328680] Call Trace:
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.328680] Call Trace:
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.329134]=C2=A0=C2=A0[<c2225b46>] dynamic_deb=
ug_init+0x89/0x1ee
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.329134]=C2=A0=C2=A0[<c2225b46>] dynamic_deb=
ug_init+0x89/0x1ee
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.330100]=C2=A0=C2=A0[<c2225abd>] ? dynamic_d=
ebug_init_debugfs+0x5f/0x5f
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.330100]=C2=A0=C2=A0[<c2225abd>] ? dynamic_d=
ebug_init_debugfs+0x5f/0x5f
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.331237]=C2=A0=C2=A0[<c2201c4f>] do_one_init=
call+0x89/0x112
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.331237]=C2=A0=C2=A0[<c2201c4f>] do_one_init=
call+0x89/0x112
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.332161]=C2=A0=C2=A0[<c1ad6a4b>] ? _raw_spin=
_unlock_irq+0xd/0x15
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.332161]=C2=A0=C2=A0[<c1ad6a4b>] ? _raw_spin=
_unlock_irq+0xd/0x15
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.333158]=C2=A0=C2=A0[<c1ad4825>] ? __wait_fo=
r_common+0xed/0xf7
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.333158]=C2=A0=C2=A0[<c1ad4825>] ? __wait_fo=
r_common+0xed/0xf7
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.334158]=C2=A0=C2=A0[<c1ad61f2>] ?
>> > console_conditional_schedule+0x24/0x24
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.334158]=C2=A0=C2=A0[<c1ad61f2>] ?
>> > console_conditional_schedule+0x24/0x24
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.335303]=C2=A0=C2=A0[<c2201d1e>] kernel_init=
_freeable+0x46/0x165
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.335303]=C2=A0=C2=A0[<c2201d1e>] kernel_init=
_freeable+0x46/0x165
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.336383]=C2=A0=C2=A0[<c1ad2e5d>] kernel_init=
+0x8/0xcb
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.336383]=C2=A0=C2=A0[<c1ad2e5d>] kernel_init=
+0x8/0xcb
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.337209]=C2=A0=C2=A0[<c1ad6c62>] ret_from_ke=
rnel_thread+0xe/0x24
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.337209]=C2=A0=C2=A0[<c1ad6c62>] ret_from_ke=
rnel_thread+0xe/0x24
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.338236]=C2=A0=C2=A0[<c1ad2e55>] ? rest_init=
+0x65/0x65
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.338236]=C2=A0=C2=A0[<c1ad2e55>] ? rest_init=
+0x65/0x65
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.339151] Code:
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.339151] Code: 5d 5d c3 c3 55 55 89 89 e5 e5=
 56 56 89 89 c6
>> > c6
>> > 89 89 d0 d0 88 88 c4 c4 ac ac 38 38 e0 e0 74 74 09 09 84 84 c0 c0
>> > 75
>> > 75 f7 f7 be be 01 01 00 00 00 00 00 00 89 89 f0 f0 48 48 5e 5e 5d
>> > 5d
>> > c3 c3 55 55 83 83 c9 c9 ff ff 89 89 e5 e5 57 57 89 89 c7 c7 31 31
>> > c0
>> > c0 <f2> <f2> ae ae 5f 5f b8 b8 fe fe ff ff ff ff ff ff 29 29 c8 c8
>> > 5d
>> > 5d c3 c3 85 85 c9 c9 74 74 16 16 55 55 89 89 e5 e5 57 57 89 89
>> > =

>> > [=C2=A0=C2=A0=C2=A0=C2=A00.343525] EIP: [<c131a701>]=C2=A0
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.343525] EIP: [<c131a701>] strlen+0xb/0x17st=
rlen+0xb/0x17
>> > SS:ESP 0068:c004fefc
>> > =C2=A0SS:ESP 0068:c004fefc
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.344739] CR2: 0000000000000000
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.344739] CR2: 0000000000000000
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.345342] ---[ end trace 04f806a67a86eccc ]---
>> > [=C2=A0=C2=A0=C2=A0=C2=A00.345342] ---[ end trace 04f806a67a86eccc ]---
>> > =

>> > =

>> > FYI, raw QEMU command line is:
>> > =

>> > 	qemu-system-i386 -enable-kvm -kernel /pkg/linux/i386-
>> > randconfig-c0-06280858/gcc-
>> > 6/91c1832579700891747820862633f9a8d0d81fa4/vmlinuz-4.7.0-rc1-00046-
>> > g91c1832 -append 'root=3D/dev/ram0 user=3Dlkp job=3D/lkp/scheduled/vm-
>> > lkp-
>> > wsx03-quantal-i386-3/rand_boot-1-quantal-core-i386.cgz-i386-
>> > randconfig-c0-06280858-91c1832579700891747820862633f9a8d0d81fa4-
>> > 20160628-92876-1qu8nei-0.yaml ARCH=3Di386 kconfig=3Di386-randconfig-c0-
>> > 06280858 branch=3Dlinux-devel/devel-hourly-2016062804
>> > commit=3D91c1832579700891747820862633f9a8d0d81fa4
>> > BOOT_IMAGE=3D/pkg/linux/i386-randconfig-c0-06280858/gcc-
>> > 6/91c1832579700891747820862633f9a8d0d81fa4/vmlinuz-4.7.0-rc1-00046-
>> > g91c1832 max_uptime=3D600 RESULT_ROOT=3D/result/boot/1/vm-lkp-wsx03-
>> > quantal-i386/quantal-core-i386.cgz/i386-randconfig-c0-06280858/gcc-
>> > 6/91c1832579700891747820862633f9a8d0d81fa4/0 LKP_SERVER=3Dinn
>> > earlyprintk=3DttyS0,115200 systemd.log_level=3Derr debug apic=3Ddebug
>> > sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D100 panic=3D-1
>> > softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic load_ramdisk=3D2
>> > prompt_ramdisk=3D0 console=3DttyS0,115200 console=3Dtty0 vga=3Dnormal =
rw
>> > ip=3D::::vm-lkp-wsx03-quantal-i386-3::dhcp drbd.minor_count=3D8'=C2=A0=
=C2=A0-
>> > initrd=C2=A0
>> > /fs/sdc1/initrd-vm-lkp-wsx03-quantal-i386-3 -m 360 -smp 1 -device
>> > e1000,netdev=3Dnet0 -netdev user,id=3Dnet0 -boot order=3Dnc -no-reboot
>> > -watchdog i6300esb -rtc base=3Dlocaltime -pidfile /dev/shm/kboot/pid-
>> > vm-lkp-wsx03-quantal-i386-3 -serial file:/dev/shm/kboot/serial-vm-
>> > lkp-wsx03-quantal-i386-3 -daemonize -display none -monitor null=C2=A0
>> > =

>> > =

>> > =

>> > =

>> > =

>> > Thanks,
>> > Xiaolong

>From 8602d6c24a0159be050849aa934ac18f8d13fef3 Mon Sep 17 00:00:00 2001
>From: Vedang Patel <vedang.patel@intel.com>
>Date: Thu, 7 Jul 2016 17:38:44 -0700
>Subject: [PATCH] ASoC: Intel: Skylake: Fix error while dynamic debug.
>
>Change-Id: I1e99896a0de5576d8eccdce4dbd666f05b4263ea
>---
> sound/soc/intel/skylake/skl-sst-ipc.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/sound/soc/intel/skylake/skl-sst-ipc.c b/sound/soc/intel/skyla=
ke/skl-sst-ipc.c
>index c141f24..96f2f68 100644
>--- a/sound/soc/intel/skylake/skl-sst-ipc.c
>+++ b/sound/soc/intel/skylake/skl-sst-ipc.c
>@@ -692,7 +692,7 @@ int skl_ipc_init_instance(struct sst_generic_ipc *ipc,
> 	 /* param_block_size must be in dwords */
> 	u16 param_block_size =3D msg->param_data_size / sizeof(u32);
> =

>-	print_hex_dump_debug(NULL, DUMP_PREFIX_NONE,
>+	print_hex_dump_debug("Param data:", DUMP_PREFIX_NONE,
> 		16, 4, buffer, param_block_size, false);
> =

> 	header.primary =3D IPC_MSG_TARGET(IPC_MOD_MSG);
>-- =

>2.8.2
>


--===============1179101507861377661==--

