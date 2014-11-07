Content-Type: multipart/mixed; boundary="===============7300624330443114969=="
MIME-Version: 1.0
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: lkp@lists.01.org
Subject: Re: [dmi] PANIC: early exception 0e rip 10:ffffffff81899e6b error 9 cr2 ffffffffff240000
Date: Fri, 07 Nov 2014 09:23:56 +0100
Message-ID: <CAKv+Gu9u5ojSWarm2A5MeWOj1r1+W8U0d+icnx2rfAmiSaL8Ww@mail.gmail.com>
In-Reply-To: <20141107081344.GC24745@yliu-dev.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7300624330443114969==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 7 November 2014 09:13, Yuanhan Liu <yuanhan.liu@linux.intel.com> wrote:
> On Fri, Nov 07, 2014 at 08:44:40AM +0100, Ard Biesheuvel wrote:
>> On 7 November 2014 08:37, Yuanhan Liu <yuanhan.liu@linux.intel.com> wr=
ote:
>> > On Fri, Nov 07, 2014 at 08:17:36AM +0100, Ard Biesheuvel wrote:
>> >> On 7 November 2014 06:47, LKP <lkp@01.org> wrote:
>> >> > FYI, we noticed the below changes on
>> >> >
>> >> > https://git.linaro.org/people/ard.biesheuvel/linux-arm efi-for-3.19
>> >> > commit aacdce6e880894acb57d71dcb2e3fc61b4ed4e96 ("dmi: add support =
for SMBIOS 3.0 64-bit entry point")
>> >> >
>> >> >
>> >> > +-----------------------+------------+------------+
>> >> > |                       | 2fa165a26c | aacdce6e88 |
>> >> > +-----------------------+------------+------------+
>> >> > | boot_successes        | 20         | 10         |
>> >> > | early-boot-hang       | 1          |            |
>> >> > | boot_failures         | 0          | 5          |
>> >> > | PANIC:early_exception | 0          | 5          |
>> >> > +-----------------------+------------+------------+
>> >> >
>> >> >
>> >> > [    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000036ffffff=
f] usable
>> >> > [    0.000000] bootconsole [earlyser0] enabled
>> >> > [    0.000000] NX (Execute Disable) protection: active
>> >> > PANIC: early exception 0e rip 10:ffffffff81899e6b error 9 cr2 fffff=
fffff240000
>> >> > [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 3.18.0-rc2-g=
c5221e6 #1
>> >> > [    0.000000]  0000000000000000 ffffffff82203d30 ffffffff819f0a6e =
00000000000003f8
>> >> > [    0.000000]  ffffffffff240000 ffffffff82203e18 ffffffff823701b0 =
ffffffff82511401
>> >> > [    0.000000]  0000000000000000 0000000000000ba3 0000000000000000 =
ffffffffff240000
>> >> > [    0.000000] Call Trace:
>> >> > [    0.000000]  [<ffffffff819f0a6e>] dump_stack+0x4e/0x68
>> >> > [    0.000000]  [<ffffffff823701b0>] early_idt_handler+0x90/0xb7
>> >> > [    0.000000]  [<ffffffff823c80da>] ? dmi_save_one_device+0x81/0x81
>> >> > [    0.000000]  [<ffffffff81899e6b>] ? dmi_table+0x3f/0x94
>> >> > [    0.000000]  [<ffffffff81899e42>] ? dmi_table+0x16/0x94
>> >> > [    0.000000]  [<ffffffff823c80da>] ? dmi_save_one_device+0x81/0x81
>> >> > [    0.000000]  [<ffffffff823c80da>] ? dmi_save_one_device+0x81/0x81
>> >> > [    0.000000]  [<ffffffff823c7eff>] dmi_walk_early+0x44/0x69
>> >> > [    0.000000]  [<ffffffff823c88a2>] dmi_present+0x180/0x1ff
>> >> > [    0.000000]  [<ffffffff823c8ab3>] dmi_scan_machine+0x144/0x191
>> >> > [    0.000000]  [<ffffffff82370702>] ? loglevel+0x31/0x31
>> >> > [    0.000000]  [<ffffffff82377f52>] setup_arch+0x490/0xc73
>> >> > [    0.000000]  [<ffffffff819eef73>] ? printk+0x4d/0x4f
>> >> > [    0.000000]  [<ffffffff82370b90>] start_kernel+0x9c/0x43f
>> >> > [    0.000000]  [<ffffffff82370120>] ? early_idt_handlers+0x120/0x1=
20
>> >> > [    0.000000]  [<ffffffff823704a2>] x86_64_start_reservations+0x2a=
/0x2c
>> >> > [    0.000000]  [<ffffffff823705df>] x86_64_start_kernel+0x13b/0x14a
>> >> > [    0.000000] RIP 0x4
>> >> >
>> >>
>> >> This is most puzzling. Could anyone decode the exception?
>> >> This looks like the non-EFI path through dmi_scan_machine(), which
>> >> calls dmi_present() /after/ calling dmi_smbios3_present(), which
>> >> apparently has not found the _SM3_ header tag. Or could the call stack
>> >> be inaccurate?
>> >>
>> >> Anyway, it would be good to know the exact type of the platform,
>> >
>> > It's a Nehalem-EP machine, wht 16 CPU and 12G memory.
>> >
>> >> and
>> >> perhaps we could find out if there is an inadvertent _SM3_ tag
>> >> somewhere in the 0xF0000 - 0xFFFFF range?
>> >
>> > Sorry, how?
>> >
>>
>> That's not a brand new machine, so I suppose there wouldn't be a
>> SMBIOS 3.0 header lurking in there.
>>
>> Anyway, if you are in a position to try things, could you apply this
>>
>> --- a/drivers/firmware/dmi_scan.c
>> +++ b/drivers/firmware/dmi_scan.c
>> @@ -617,7 +617,7 @@ void __init dmi_scan_machine(void)
>>                 memset(buf, 0, 16);
>>                 for (q =3D p; q < p + 0x10000; q +=3D 16) {
>>                         memcpy_fromio(buf + 16, q, 16);
>> -                       if (!dmi_smbios3_present(buf) || !dmi_present(bu=
f)) {
>> +                       if (!dmi_present(buf)) {
>>                                 dmi_available =3D 1;
>>                                 dmi_early_unmap(p, 0x10000);
>>                                 goto out;
>>
>> and try again?
>
> kernel boots perfectly with this patch applied.
>
>         --yliu
>

Thank you! Very useful to know

Sorry to keep you busy, but could you please apply this on top of the
previous patch

--- a/drivers/firmware/dmi_scan.c
+++ b/drivers/firmware/dmi_scan.c
@@ -617,6 +617,8 @@ void __init dmi_scan_machine(void)
                memset(buf, 0, 16);
                for (q =3D p; q < p + 0x10000; q +=3D 16) {
                        memcpy_fromio(buf + 16, q, 16);
+                       if (memcmp(buf, "_SM3_", 5) =3D=3D 0)
+                               pr_warn("DMI: Ignoring SMBIOS 3.0
header@%p\n", buf);
                        if (!dmi_present(buf)) {
                                dmi_available =3D 1;
                                dmi_early_unmap(p, 0x10000);


and check if there is any output?

Thanks again,
Ard.

--===============7300624330443114969==--

