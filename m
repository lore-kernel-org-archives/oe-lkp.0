Content-Type: multipart/mixed; boundary="===============2601205659766418814=="
MIME-Version: 1.0
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
To: lkp@lists.01.org
Subject: Re: [x86/intel/quark] 8bbc2a135b6: WARNING: CPU: 0 PID: 1 at arch/x86/platform/intel-quark/imr.c:358 imr_add_range+0x2b4/0x370()
Date: Mon, 30 Mar 2015 15:39:22 +0100
Message-ID: <5519601A.9010504@nexus-software.ie>
In-Reply-To: <5519060A.3080909@nexus-software.ie>
List-Id: <oe-lkp.lists.linux.dev>

--===============2601205659766418814==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 30/03/15 09:15, Bryan O'Donoghue wrote:
>
>> [    0.752570]  [<c1ab0845>] dump_stack+0x16/0x18
>> [    0.752570]  [<c1ab0845>] dump_stack+0x16/0x18
>> [    0.753420]  [<c103bb27>] warn_slowpath_common+0x87/0xc0
>> [    0.753420]  [<c103bb27>] warn_slowpath_common+0x87/0xc0
>> [    0.754429]  [<c1038674>] ? imr_add_range+0x2b4/0x370
>> [    0.754429]  [<c1038674>] ? imr_add_range+0x2b4/0x370
>> [    0.755384]  [<c1038674>] ? imr_add_range+0x2b4/0x370
>> [    0.755384]  [<c1038674>] ? imr_add_range+0x2b4/0x370
>> [    0.756335]  [<c103bbc3>] warn_slowpath_fmt+0x33/0x40
>> [    0.756335]  [<c103bbc3>] warn_slowpath_fmt+0x33/0x40
>> [    0.757293]  [<c1038674>] imr_add_range+0x2b4/0x370
>> [    0.757293]  [<c1038674>] imr_add_range+0x2b4/0x370
>> [    0.758219]  [<c103057c>] ? slow_virt_to_phys+0x2c/0x90
>> [    0.758219]  [<c103057c>] ? slow_virt_to_phys+0x2c/0x90
>> [    0.759200]  [<c103209a>] ? __phys_addr+0x3a/0x90
>> [    0.759200]  [<c103209a>] ? __phys_addr+0x3a/0x90
>> [    0.760090]  [<c106e4de>] ? debug_check_no_locks_freed+0x9e/0x160
>> [    0.760090]  [<c106e4de>] ? debug_check_no_locks_freed+0x9e/0x160
>> [    0.761361]  [<c103057c>] ? slow_virt_to_phys+0x2c/0x90
>> [    0.761361]  [<c103057c>] ? slow_virt_to_phys+0x2c/0x90
>> [    0.762419]  [<c1fb836a>] imr_self_test_init+0x40/0x1d9
>> [    0.762419]  [<c1fb836a>] imr_self_test_init+0x40/0x1d9
>> [    0.763439]  [<c1fb832a>] ? imr_self_test_result+0x4e/0x4e
>> [    0.763439]  [<c1fb832a>] ? imr_self_test_result+0x4e/0x4e
>> [    0.764477]  [<c1fa7d03>] do_one_initcall+0x180/0x193
>> [    0.764477]  [<c1fa7d03>] do_one_initcall+0x180/0x193
>> [    0.765443]  [<c10568bb>] ? parse_args+0x25b/0x530
>> [    0.765443]  [<c10568bb>] ? parse_args+0x25b/0x530
>> [    0.766350]  [<c1fa7dec>] kernel_init_freeable+0xd6/0x153
>> [    0.766350]  [<c1fa7dec>] kernel_init_freeable+0xd6/0x153
>> [    0.767370]  [<c1fa7dec>] ? kernel_init_freeable+0xd6/0x153
>> [    0.767370]  [<c1fa7dec>] ? kernel_init_freeable+0xd6/0x153
>> [    0.768426]  [<c1aab7a0>] kernel_init+0x10/0xe0
>> [    0.768426]  [<c1aab7a0>] kernel_init+0x10/0xe0
>> [    0.769296]  [<c1061445>] ? schedule_tail+0x25/0x70
>> [    0.769296]  [<c1061445>] ? schedule_tail+0x25/0x70
>> [    0.770424]  [<c1abe060>] ret_from_kernel_thread+0x20/0x30
>> [    0.770424]  [<c1abe060>] ret_from_kernel_thread+0x20/0x30
>> [    0.771456]  [<c1aab790>] ? rest_init+0xb0/0xb0
>> [    0.771456]  [<c1aab790>] ? rest_init+0xb0/0xb0
>> [    0.772362] ---[ end trace e098947396137dbd ]---
>> [    0.772362] ---[ end trace e098947396137dbd ]---
>
> Well the self test fails like it should on hardware without IMR support :)
>
> Curious what the QEMU setup is like ?
>
> To get to the self test code we need to get past this
>
> static const struct x86_cpu_id imr_ids[] __initconst =3D {
>          { X86_VENDOR_INTEL, 5, 9 },     /* Intel Quark SoC X1000. */
>          {}
> };
> MODULE_DEVICE_TABLE(x86cpu, imr_ids);
>
> if (!x86_match_cpu(imr_ids) || !iosf_mbi_available())
>      return -ENODEV;
>
> Looks to me like a version of QEMU that reports iosf_mbi available,
> cpuid 5/9 but lacks full IMR support ?
>
> How do I replicate this setup ?

Hi.

Turns out uncle google is your friend...

I've found the LKP tests you guys have, and I have built the latest =

version of QEMU.

If you could give me the QEMU command line - I can take a quick look ....

Something like this ?
http://www.serverphorums.com/read.php?12,1097143


--===============2601205659766418814==--

