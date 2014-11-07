Content-Type: multipart/mixed; boundary="===============6299741526694428389=="
MIME-Version: 1.0
From: Yuanhan Liu <yuanhan.liu@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [dmi] PANIC: early exception 0e rip 10:ffffffff81899e6b error 9 cr2 ffffffffff240000
Date: Fri, 07 Nov 2014 17:26:51 +0800
Message-ID: <20141107092651.GE24745@yliu-dev.sh.intel.com>
In-Reply-To: <CAKv+Gu_Xx9aKzNU2CfP20WR1ojwjUEvTKyD7L-S9bR_C8EOogQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6299741526694428389==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 07, 2014 at 10:03:55AM +0100, Ard Biesheuvel wrote:
> On 7 November 2014 09:46, Yuanhan Liu <yuanhan.liu@linux.intel.com> wro=
te:
> > On Fri, Nov 07, 2014 at 09:23:56AM +0100, Ard Biesheuvel wrote:
> >> On 7 November 2014 09:13, Yuanhan Liu <yuanhan.liu@linux.intel.com> =
wrote:
> >> > On Fri, Nov 07, 2014 at 08:44:40AM +0100, Ard Biesheuvel wrote:
> >> >> On 7 November 2014 08:37, Yuanhan Liu <yuanhan.liu@linux.intel.co=
m> wrote:
> >> >> > On Fri, Nov 07, 2014 at 08:17:36AM +0100, Ard Biesheuvel wrote:
> >> >> >> On 7 November 2014 06:47, LKP <lkp@01.org> wrote:
> >> >> >> > FYI, we noticed the below changes on
> >> >> >> >
> >> >> >> > https://git.linaro.org/people/ard.biesheuvel/linux-arm efi-for=
-3.19
> >> >> >> > commit aacdce6e880894acb57d71dcb2e3fc61b4ed4e96 ("dmi: add sup=
port for SMBIOS 3.0 64-bit entry point")
> >> >> >> >
> >> >> >> >
> >> >> >> > +-----------------------+------------+------------+
> >> >> >> > |                       | 2fa165a26c | aacdce6e88 |
> >> >> >> > +-----------------------+------------+------------+
> >> >> >> > | boot_successes        | 20         | 10         |
> >> >> >> > | early-boot-hang       | 1          |            |
> >> >> >> > | boot_failures         | 0          | 5          |
> >> >> >> > | PANIC:early_exception | 0          | 5          |
> >> >> >> > +-----------------------+------------+------------+
> >> >> >> >
> >> >> >> >
> >> >> >> > [    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000036f=
ffffff] usable
> >> >> >> > [    0.000000] bootconsole [earlyser0] enabled
> >> >> >> > [    0.000000] NX (Execute Disable) protection: active
> >> >> >> > PANIC: early exception 0e rip 10:ffffffff81899e6b error 9 cr2 =
ffffffffff240000
> >> >> >> > [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 3.18.0-=
rc2-gc5221e6 #1
> >> >> >> > [    0.000000]  0000000000000000 ffffffff82203d30 ffffffff819f=
0a6e 00000000000003f8
> >> >> >> > [    0.000000]  ffffffffff240000 ffffffff82203e18 ffffffff8237=
01b0 ffffffff82511401
> >> >> >> > [    0.000000]  0000000000000000 0000000000000ba3 000000000000=
0000 ffffffffff240000
> >> >> >> > [    0.000000] Call Trace:
> >> >> >> > [    0.000000]  [<ffffffff819f0a6e>] dump_stack+0x4e/0x68
> >> >> >> > [    0.000000]  [<ffffffff823701b0>] early_idt_handler+0x90/0x=
b7
> >> >> >> > [    0.000000]  [<ffffffff823c80da>] ? dmi_save_one_device+0x8=
1/0x81
> >> >> >> > [    0.000000]  [<ffffffff81899e6b>] ? dmi_table+0x3f/0x94
> >> >> >> > [    0.000000]  [<ffffffff81899e42>] ? dmi_table+0x16/0x94
> >> >> >> > [    0.000000]  [<ffffffff823c80da>] ? dmi_save_one_device+0x8=
1/0x81
> >> >> >> > [    0.000000]  [<ffffffff823c80da>] ? dmi_save_one_device+0x8=
1/0x81
> >> >> >> > [    0.000000]  [<ffffffff823c7eff>] dmi_walk_early+0x44/0x69
> >> >> >> > [    0.000000]  [<ffffffff823c88a2>] dmi_present+0x180/0x1ff
> >> >> >> > [    0.000000]  [<ffffffff823c8ab3>] dmi_scan_machine+0x144/0x=
191
> >> >> >> > [    0.000000]  [<ffffffff82370702>] ? loglevel+0x31/0x31
> >> >> >> > [    0.000000]  [<ffffffff82377f52>] setup_arch+0x490/0xc73
> >> >> >> > [    0.000000]  [<ffffffff819eef73>] ? printk+0x4d/0x4f
> >> >> >> > [    0.000000]  [<ffffffff82370b90>] start_kernel+0x9c/0x43f
> >> >> >> > [    0.000000]  [<ffffffff82370120>] ? early_idt_handlers+0x12=
0/0x120
> >> >> >> > [    0.000000]  [<ffffffff823704a2>] x86_64_start_reservations=
+0x2a/0x2c
> >> >> >> > [    0.000000]  [<ffffffff823705df>] x86_64_start_kernel+0x13b=
/0x14a
> >> >> >> > [    0.000000] RIP 0x4
> >> >> >> >
> >> >> >>
> >> >> >> This is most puzzling. Could anyone decode the exception?
> >> >> >> This looks like the non-EFI path through dmi_scan_machine(), whi=
ch
> >> >> >> calls dmi_present() /after/ calling dmi_smbios3_present(), which
> >> >> >> apparently has not found the _SM3_ header tag. Or could the call=
 stack
> >> >> >> be inaccurate?
> >> >> >>
> >> >> >> Anyway, it would be good to know the exact type of the platform,
> >> >> >
> >> >> > It's a Nehalem-EP machine, wht 16 CPU and 12G memory.
> >> >> >
> >> >> >> and
> >> >> >> perhaps we could find out if there is an inadvertent _SM3_ tag
> >> >> >> somewhere in the 0xF0000 - 0xFFFFF range?
> >> >> >
> >> >> > Sorry, how?
> >> >> >
> >> >>
> >> >> That's not a brand new machine, so I suppose there wouldn't be a
> >> >> SMBIOS 3.0 header lurking in there.
> >> >>
> >> >> Anyway, if you are in a position to try things, could you apply this
> >> >>
> >> >> --- a/drivers/firmware/dmi_scan.c
> >> >> +++ b/drivers/firmware/dmi_scan.c
> >> >> @@ -617,7 +617,7 @@ void __init dmi_scan_machine(void)
> >> >>                 memset(buf, 0, 16);
> >> >>                 for (q =3D p; q < p + 0x10000; q +=3D 16) {
> >> >>                         memcpy_fromio(buf + 16, q, 16);
> >> >> -                       if (!dmi_smbios3_present(buf) || !dmi_prese=
nt(buf)) {
> >> >> +                       if (!dmi_present(buf)) {
> >> >>                                 dmi_available =3D 1;
> >> >>                                 dmi_early_unmap(p, 0x10000);
> >> >>                                 goto out;
> >> >>
> >> >> and try again?
> >> >
> >> > kernel boots perfectly with this patch applied.
> >> >
> >> >         --yliu
> >> >
> >>
> >> Thank you! Very useful to know
> >>
> >
> > Sigh, I made a silly error, I speicified wrong commit while testing your
> > patch. Sorry for that.
> >
> > And I tested it again, with your former patch, sorry, the panic still
> > happens.
> >
> >         --yliu
> >
> =

> OK, no worries.
> =

> Could you please try the attached patch? On my ARM system, it produces
> something like this
> =

>  =3D=3D=3D=3D=3D=3D Decoding _DMI_ header:
> 5f 44 4d 49 5f 89 62 02 00 c0 8a fe 0c 00 27 cf
> =3D=3D=3D=3D=3D=3D Remapped SMBIOS table 0xfe8ac000 at ffffff800001e000, =
size 0x262, num 0xc
> =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffff800001e000, typ=
e 0x0, length 0x18
> =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffff800001e043, typ=
e 0x1, length 0x1b
> =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffff800001e09d, typ=
e 0x2, length 0x11
> =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffff800001e105, typ=
e 0x3, length 0x18
> =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffff800001e155, typ=
e 0x4, length 0x2a
> =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffff800001e19a, typ=
e 0x7, length 0x13
> =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffff800001e1b5, typ=
e 0x9, length 0x11
> =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffff800001e1cf, typ=
e 0x10, length 0x17
> =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffff800001e1e8, typ=
e 0x11, length 0x28
> =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffff800001e22e, typ=
e 0x13, length 0x1f
> =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffff800001e24f, typ=
e 0x20, length 0xb
> =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffff800001e25c, typ=
e 0x7f, length 0x4
> SMBIOS 2.7 present.
> DMI: ARM Arm Versatile Express/Arm Versatile Express, BIOS 16:20:46 Oct 2=
8 2014
> =

> That should help us pinpoint what is going on here.
> =


Here is the output:

[    0.000000] NX (Execute Disable) protection: active
[    0.000000] =3D=3D=3D=3D=3D=3D Decoding _DMI_ header:
[    0.000000] 5f 44 4d 49 5f 48 a3 0b 00 20 60 8f 3e 00 25 00 =

[    0.000000] =3D=3D=3D=3D=3D=3D Remapped SMBIOS table 0xffffffff8f602000 =
at ffffffffff240000, size 0xba3, num 0x3e
PANIC: early exception 0e rip 10:ffffffff8167aa1a error 9 cr2 ffffffffff240=
001
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 3.18.0-rc2-00008-g4d=
3a0be #66
[    0.000000]  0000000000000ba3 ffffffff81bcfd10 ffffffff818010a4 00000000=
000003f8
[    0.000000]  000000000000003e ffffffff81bcfdf8 ffffffff81d801b0 61742053=
4f49424d
[    0.000000]  000000000000001f ffffffffff240000 0000000000000000 ffffffff=
ff240000
[    0.000000] Call Trace:
[    0.000000]  [<ffffffff818010a4>] dump_stack+0x46/0x58
[    0.000000]  [<ffffffff81d801b0>] early_idt_handler+0x90/0xb7
[    0.000000]  [<ffffffff81dd4cfc>] ? dmi_format_ids.constprop.9+0x13c/0x1=
3c
[    0.000000]  [<ffffffff8167aa1a>] ? dmi_table+0x4a/0xf0
[    0.000000]  [<ffffffff817fa71b>] ? printk+0x61/0x63
[    0.000000]  [<ffffffff81dd4cfc>] ? dmi_format_ids.constprop.9+0x13c/0x1=
3c
[    0.000000]  [<ffffffff81dd4cfc>] ? dmi_format_ids.constprop.9+0x13c/0x1=
3c
[    0.000000]  [<ffffffff81dd49dc>] dmi_walk_early+0x6b/0x90
[    0.000000]  [<ffffffff81dd52fc>] dmi_present+0x1b4/0x23f
[    0.000000]  [<ffffffff81dd55ab>] dmi_scan_machine+0x1d4/0x23a
[    0.000000]  [<ffffffff81d80120>] ? early_idt_handlers+0x120/0x120
[    0.000000]  [<ffffffff81d883a2>] setup_arch+0x462/0xcc6
[    0.000000]  [<ffffffff81d80120>] ? early_idt_handlers+0x120/0x120
[    0.000000]  [<ffffffff81d80167>] ? early_idt_handler+0x47/0xb7
[    0.000000]  [<ffffffff81d80120>] ? early_idt_handlers+0x120/0x120
[    0.000000]  [<ffffffff81d80cf0>] start_kernel+0x97/0x456
[    0.000000]  [<ffffffff81d80120>] ? early_idt_handlers+0x120/0x120
[    0.000000]  [<ffffffff81d80120>] ? early_idt_handlers+0x120/0x120
[    0.000000]  [<ffffffff81d805ee>] x86_64_start_reservations+0x2a/0x2c
[    0.000000]  [<ffffffff81d8072e>] x86_64_start_kernel+0x13e/0x14d
[    0.000000] RIP 0xba2


	--yliu

--===============6299741526694428389==--

