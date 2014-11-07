Content-Type: multipart/mixed; boundary="===============3871415147567699565=="
MIME-Version: 1.0
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: lkp@lists.01.org
Subject: Re: [dmi] PANIC: early exception 0e rip 10:ffffffff81899e6b error 9 cr2 ffffffffff240000
Date: Fri, 07 Nov 2014 11:16:37 +0100
Message-ID: <CAKv+Gu8mPaeeBybH9cRJ2WyXvDPnf_TtDr40NxQ4A18yXHfE4g@mail.gmail.com>
In-Reply-To: <20141107101406.GG24745@yliu-dev.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3871415147567699565==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 7 November 2014 11:14, Yuanhan Liu <yuanhan.liu@linux.intel.com> wrote:
> On Fri, Nov 07, 2014 at 10:35:44AM +0100, Ard Biesheuvel wrote:
>> On 7 November 2014 10:26, Yuanhan Liu <yuanhan.liu@linux.intel.com> wr=
ote:
>> > On Fri, Nov 07, 2014 at 10:03:55AM +0100, Ard Biesheuvel wrote:
>> >> On 7 November 2014 09:46, Yuanhan Liu <yuanhan.liu@linux.intel.com>=
 wrote:
>> >> > On Fri, Nov 07, 2014 at 09:23:56AM +0100, Ard Biesheuvel wrote:
>> >> >> On 7 November 2014 09:13, Yuanhan Liu <yuanhan.liu@linux.intel.c=
om> wrote:
>> >> >> > On Fri, Nov 07, 2014 at 08:44:40AM +0100, Ard Biesheuvel wrote:
>> >> >> >> On 7 November 2014 08:37, Yuanhan Liu <yuanhan.liu@linux.inte=
l.com> wrote:
>> >> >> >> > On Fri, Nov 07, 2014 at 08:17:36AM +0100, Ard Biesheuvel wrot=
e:
>> >> >> >> >> On 7 November 2014 06:47, LKP <lkp@01.org> wrote:
>> >> >> >> >> > FYI, we noticed the below changes on
>> >> >> >> >> >
>> >> >> >> >> > https://git.linaro.org/people/ard.biesheuvel/linux-arm efi=
-for-3.19
>> >> >> >> >> > commit aacdce6e880894acb57d71dcb2e3fc61b4ed4e96 ("dmi: add=
 support for SMBIOS 3.0 64-bit entry point")
>> >> >> >> >> >
>> >> >> >> >> >
>> >> >> >> >> > +-----------------------+------------+------------+
>> >> >> >> >> > |                       | 2fa165a26c | aacdce6e88 |
>> >> >> >> >> > +-----------------------+------------+------------+
>> >> >> >> >> > | boot_successes        | 20         | 10         |
>> >> >> >> >> > | early-boot-hang       | 1          |            |
>> >> >> >> >> > | boot_failures         | 0          | 5          |
>> >> >> >> >> > | PANIC:early_exception | 0          | 5          |
>> >> >> >> >> > +-----------------------+------------+------------+
>> >> >> >> >> >
>> >> >> >> >> >
>> >> >> >> >> > [    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000=
036fffffff] usable
>> >> >> >> >> > [    0.000000] bootconsole [earlyser0] enabled
>> >> >> >> >> > [    0.000000] NX (Execute Disable) protection: active
>> >> >> >> >> > PANIC: early exception 0e rip 10:ffffffff81899e6b error 9 =
cr2 ffffffffff240000
>> >> >> >> >> > [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 3.1=
8.0-rc2-gc5221e6 #1
>> >> >> >> >> > [    0.000000]  0000000000000000 ffffffff82203d30 ffffffff=
819f0a6e 00000000000003f8
>> >> >> >> >> > [    0.000000]  ffffffffff240000 ffffffff82203e18 ffffffff=
823701b0 ffffffff82511401
>> >> >> >> >> > [    0.000000]  0000000000000000 0000000000000ba3 00000000=
00000000 ffffffffff240000
>> >> >> >> >> > [    0.000000] Call Trace:
>> >> >> >> >> > [    0.000000]  [<ffffffff819f0a6e>] dump_stack+0x4e/0x68
>> >> >> >> >> > [    0.000000]  [<ffffffff823701b0>] early_idt_handler+0x9=
0/0xb7
>> >> >> >> >> > [    0.000000]  [<ffffffff823c80da>] ? dmi_save_one_device=
+0x81/0x81
>> >> >> >> >> > [    0.000000]  [<ffffffff81899e6b>] ? dmi_table+0x3f/0x94
>> >> >> >> >> > [    0.000000]  [<ffffffff81899e42>] ? dmi_table+0x16/0x94
>> >> >> >> >> > [    0.000000]  [<ffffffff823c80da>] ? dmi_save_one_device=
+0x81/0x81
>> >> >> >> >> > [    0.000000]  [<ffffffff823c80da>] ? dmi_save_one_device=
+0x81/0x81
>> >> >> >> >> > [    0.000000]  [<ffffffff823c7eff>] dmi_walk_early+0x44/0=
x69
>> >> >> >> >> > [    0.000000]  [<ffffffff823c88a2>] dmi_present+0x180/0x1=
ff
>> >> >> >> >> > [    0.000000]  [<ffffffff823c8ab3>] dmi_scan_machine+0x14=
4/0x191
>> >> >> >> >> > [    0.000000]  [<ffffffff82370702>] ? loglevel+0x31/0x31
>> >> >> >> >> > [    0.000000]  [<ffffffff82377f52>] setup_arch+0x490/0xc73
>> >> >> >> >> > [    0.000000]  [<ffffffff819eef73>] ? printk+0x4d/0x4f
>> >> >> >> >> > [    0.000000]  [<ffffffff82370b90>] start_kernel+0x9c/0x4=
3f
>> >> >> >> >> > [    0.000000]  [<ffffffff82370120>] ? early_idt_handlers+=
0x120/0x120
>> >> >> >> >> > [    0.000000]  [<ffffffff823704a2>] x86_64_start_reservat=
ions+0x2a/0x2c
>> >> >> >> >> > [    0.000000]  [<ffffffff823705df>] x86_64_start_kernel+0=
x13b/0x14a
>> >> >> >> >> > [    0.000000] RIP 0x4
>> >> >> >> >> >
>> >> >> >> >>
>> >> >> >> >> This is most puzzling. Could anyone decode the exception?
>> >> >> >> >> This looks like the non-EFI path through dmi_scan_machine(),=
 which
>> >> >> >> >> calls dmi_present() /after/ calling dmi_smbios3_present(), w=
hich
>> >> >> >> >> apparently has not found the _SM3_ header tag. Or could the =
call stack
>> >> >> >> >> be inaccurate?
>> >> >> >> >>
>> >> >> >> >> Anyway, it would be good to know the exact type of the platf=
orm,
>> >> >> >> >
>> >> >> >> > It's a Nehalem-EP machine, wht 16 CPU and 12G memory.
>> >> >> >> >
>> >> >> >> >> and
>> >> >> >> >> perhaps we could find out if there is an inadvertent _SM3_ t=
ag
>> >> >> >> >> somewhere in the 0xF0000 - 0xFFFFF range?
>> >> >> >> >
>> >> >> >> > Sorry, how?
>> >> >> >> >
>> >> >> >>
>> >> >> >> That's not a brand new machine, so I suppose there wouldn't be a
>> >> >> >> SMBIOS 3.0 header lurking in there.
>> >> >> >>
>> >> >> >> Anyway, if you are in a position to try things, could you apply=
 this
>> >> >> >>
>> >> >> >> --- a/drivers/firmware/dmi_scan.c
>> >> >> >> +++ b/drivers/firmware/dmi_scan.c
>> >> >> >> @@ -617,7 +617,7 @@ void __init dmi_scan_machine(void)
>> >> >> >>                 memset(buf, 0, 16);
>> >> >> >>                 for (q =3D p; q < p + 0x10000; q +=3D 16) {
>> >> >> >>                         memcpy_fromio(buf + 16, q, 16);
>> >> >> >> -                       if (!dmi_smbios3_present(buf) || !dmi_p=
resent(buf)) {
>> >> >> >> +                       if (!dmi_present(buf)) {
>> >> >> >>                                 dmi_available =3D 1;
>> >> >> >>                                 dmi_early_unmap(p, 0x10000);
>> >> >> >>                                 goto out;
>> >> >> >>
>> >> >> >> and try again?
>> >> >> >


>> >> >> > kernel boots perfectly with this patch applied.
>> >> >> >
>> >> >> >         --yliu
>> >> >> >
>> >> >>
>> >> >> Thank you! Very useful to know
>> >> >>
>> >> >
>> >> > Sigh, I made a silly error, I speicified wrong commit while testing=
 your
>> >> > patch. Sorry for that.
>> >> >
>> >> > And I tested it again, with your former patch, sorry, the panic sti=
ll
>> >> > happens.
>> >> >
>> >> >         --yliu
>> >> >
>> >>
>> >> OK, no worries.
>> >>
>> >> Could you please try the attached patch? On my ARM system, it produces
>> >> something like this
>> >>
>> >>  =3D=3D=3D=3D=3D=3D Decoding _DMI_ header:
>> >> 5f 44 4d 49 5f 89 62 02 00 c0 8a fe 0c 00 27 cf
>> >> =3D=3D=3D=3D=3D=3D Remapped SMBIOS table 0xfe8ac000 at ffffff800001e0=
00, size 0x262, num 0xc
>> >> =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffff800001e000,=
 type 0x0, length 0x18
>> >> =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffff800001e043,=
 type 0x1, length 0x1b
>> >> =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffff800001e09d,=
 type 0x2, length 0x11
>> >> =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffff800001e105,=
 type 0x3, length 0x18
>> >> =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffff800001e155,=
 type 0x4, length 0x2a
>> >> =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffff800001e19a,=
 type 0x7, length 0x13
>> >> =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffff800001e1b5,=
 type 0x9, length 0x11
>> >> =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffff800001e1cf,=
 type 0x10, length 0x17
>> >> =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffff800001e1e8,=
 type 0x11, length 0x28
>> >> =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffff800001e22e,=
 type 0x13, length 0x1f
>> >> =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffff800001e24f,=
 type 0x20, length 0xb
>> >> =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffff800001e25c,=
 type 0x7f, length 0x4
>> >> SMBIOS 2.7 present.
>> >> DMI: ARM Arm Versatile Express/Arm Versatile Express, BIOS 16:20:46 O=
ct 28 2014
>> >>
>> >> That should help us pinpoint what is going on here.
>> >>
>> >
>> > Here is the output:
>> >
>> > [    0.000000] NX (Execute Disable) protection: active
>> > [    0.000000] =3D=3D=3D=3D=3D=3D Decoding _DMI_ header:
>> > [    0.000000] 5f 44 4d 49 5f 48 a3 0b 00 20 60 8f 3e 00 25 00
>> > [    0.000000] =3D=3D=3D=3D=3D=3D Remapped SMBIOS table 0xffffffff8f60=
2000 at ffffffffff240000, size 0xba3, num 0x3e
>>
>> OK, so that looks like more type promotion silliness.
>>
>> Could you apply this, and retry?
>
> Despites the long output like following, it fixes the hang: the kernel
> boots perfectly this time. Is that expected? ;)
>
> ....
> [   12.568459] =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffc9=
00018ee1a2, type 0x8, length 0x9
> [   12.577941] =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffc9=
00018ee1ba, type 0x8, length 0x9
> [   12.587433] =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffc9=
00018ee1cf, type 0x8, length 0x9
> [   12.596918] =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffc9=
00018ee1e4, type 0x8, length 0x9
> [   12.606400] =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffc9=
00018ee1f9, type 0x8, length 0x9
> [   12.615904] =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffc9=
00018ee20e, type 0x8, length 0x9
> [   12.625389] =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffc9=
00018ee22c, type 0x8, length 0x9
> [   12.634871] =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffc9=
00018ee24a, type 0x8, length 0x9
> [   12.644359] =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffc9=
00018ee268, type 0x8, length 0x9
> [   12.653842] =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffc9=
00018ee286, type 0x8, length 0x9
> [   12.663324] =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffc9=
00018ee2a4, type 0x8, length 0x9
> [   12.672821] =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffc9=
00018ee2c2, type 0x9, length 0xd
> [   12.682307] =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffc9=
00018ee2e1, type 0x9, length 0xd
> [   12.691788] =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffc9=
00018ee300, type 0x9, length 0xd
> [   12.701276] =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffc9=
00018ee31f, type 0x9, length 0xd
> [   12.710757] =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffc9=
00018ee33e, type 0xa, length 0x6
> [   12.720241] =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffc9=
00018ee35c, type 0xa, length 0x6
> [   12.729729] =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffc9=
00018ee37a, type 0xa, length 0x6
> [   12.739218] =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffc9=
00018ee3a2, type 0xb, length 0x5
> [   12.748705] =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffc9=
00018ee3b2, type 0xc, length 0x5
> [   12.758197] =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffc9=
00018ee3da, type 0xc, length 0x5
> [   12.767687] =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffc9=
00018ee401, type 0xc, length 0x5
> [   12.777173] =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffc9=
00018ee429, type 0xc, length 0x5
> [   12.786634] =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffc9=
00018ee458, type 0xd, length 0x16
> [   12.796220] =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffc9=
00018ee47f, type 0x18, length 0x5
> [   12.805800] =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffc9=
00018ee486, type 0x20, length 0x14
> [   12.815483] =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffc9=
00018ee49c, type 0x10, length 0xf
> [   12.825066] =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffc9=
00018ee4ad, type 0x13, length 0xf
> [   12.834630] =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffc9=
00018ee4be, type 0x11, length 0x1b
> [   12.844321] =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffc9=
00018ee527, type 0x14, length 0x13
> [   12.854000] =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffc9=
00018ee53c, type 0x11, length 0x1b
> [   12.863688] =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffc9=
00018ee598, type 0x11, length 0x1b
> [   12.873375] =3D=3D=3D=3D=3D=3D Processing SMBIOS table entry at ffffc9=
00018ee601, type 0x14, length 0x13
>
> ...
>
> And there are more of them .., if you need, I can attach the whole dmesg.
>

Yes, that is expected. Congratulations, we found the bug!

Thanks for helping me out here.

Regards,
Ard.

--===============3871415147567699565==--

