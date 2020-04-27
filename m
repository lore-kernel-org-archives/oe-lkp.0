Content-Type: multipart/mixed; boundary="===============5316513693227584538=="
MIME-Version: 1.0
From: Chen, Rong A <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [KEYS] 4ea62d6823: WARNING:at_mm/page_alloc.c:#__alloc_pages_nodemask
Date: Mon, 27 Apr 2020 16:55:36 +0800
Message-ID: <7231ea1a-70b2-c156-1724-2357ed10b20a@intel.com>
In-Reply-To: <5f5e59fd-1ba7-2634-6667-ecaca9c5c8e5@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5316513693227584538==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 4/27/2020 10:58 AM, Waiman Long wrote:
> On 4/26/20 6:48 AM, kernel test robot wrote:
>> Greeting,
>>
>> FYI, we noticed the following commit (built with gcc-7):
>>
>> commit: 4ea62d6823c55fb914ba1195349b86a50efe8597 ("KEYS: Don't write =

>> out to userspace while holding key semaphore")
>> https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable-rc.git =

>> queue/5.6
>>
>> in testcase: trinity
>> with following parameters:
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0runtime: 300s
>>
>> test-description: Trinity is a linux system call fuzz tester.
>> test-url: http://codemonkey.org.uk/projects/trinity/
>>
>>
>> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp =

>> 2 -m 8G
>>
>> caused below changes (please refer to attached dmesg/kmsg for entire =

>> log/backtrace):
>>
>>
>> +----------------------------------------------------+------------+-----=
-------+ =

>>
>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 0f7bd4ba0b | =

>> 4ea62d6823 |
>> +----------------------------------------------------+------------+-----=
-------+ =

>>
>> | boot_successes=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =

>> 2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> | boot_failures=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =

>> 9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> | BUG:kernel_hang_in_boot_stage=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =

>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> | BUG:kernel_hang_in_early-boot_stage=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =

>> 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> | WARNING:at_mm/page_alloc.c:#__alloc_pages_nodemask | 0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =

>> 8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> | RIP:__alloc_pages_nodemask=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | =

>> 8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> +----------------------------------------------------+------------+-----=
-------+ =

>>
>>
>>
>> If you fix the issue, kindly add following tag
>> Reported-by: kernel test robot <rong.a.chen@intel.com>
>>
>>
>> [=C2=A0 387.389621] WARNING: CPU: 1 PID: 5301 at mm/page_alloc.c:4713 =

>> __alloc_pages_nodemask+0x1d1/0x340
>> [=C2=A0 387.392619] Modules linked in: 8021q garp stp mrp llc dlci af_ke=
y =

>> ieee802154_socket ieee802154 mpls_router ip_tunnel vsock_loopback =

>> vmw_vsock_virtio_transport_common vmw_vsock_vmci_transport vsock =

>> vmw_vmci hidp cmtp kernelcapi bnep rfcomm bluetooth ecdh_generic ecc =

>> rfkill can_bcm can_raw can pptp gre l2tp_ppp l2tp_netlink l2tp_core =

>> ip6_udp_tunnel udp_tunnel pppoe pppox ppp_generic slhc crypto_user =

>> nfnetlink scsi_transport_iscsi dccp_ipv6 atm sctp libcrc32c dccp_ipv4 =

>> dccp sr_mod cdrom ata_generic pata_acpi bochs_drm drm_vram_helper =

>> drm_ttm_helper ttm intel_rapl_msr intel_rapl_common drm_kms_helper =

>> snd_pcm syscopyarea crct10dif_pclmul crc32_pclmul crc32c_intel =

>> ghash_clmulni_intel sysfillrect snd_timer ppdev snd sysimgblt =

>> fb_sys_fops aesni_intel ata_piix soundcore crypto_simd parport_pc =

>> cryptd joydev drm glue_helper serio_raw pcspkr libata i2c_piix4 =

>> parport floppy
>> [=C2=A0 387.417621] CPU: 1 PID: 5301 Comm: trinity-c1 Not tainted =

>> 5.6.6-00162-g4ea62d6823c55 #1
>> [=C2=A0 387.420344] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996=
), =

>> BIOS 1.12.0-1 04/01/2014
>> [=C2=A0 387.423093] RIP: 0010:__alloc_pages_nodemask+0x1d1/0x340
>> [=C2=A0 387.425419] Code: ff ff ff 65 48 8b 04 25 c0 8b 01 00 48 05 60 0=
c =

>> 00 00 41 be 01 00 00 00 48 89 44 24 08 e9 02 ff ff ff 81 e7 00 20 00 =

>> 00 75 02 <0f> 0b 45 31 f6 eb 95 44 8b 64 24 18 65 8b 05 fc 9f 39 5e =

>> 89 c0 48
>> [=C2=A0 387.431026] RSP: 0018:ffff9ee900f27e60 EFLAGS: 00010246
>> [=C2=A0 387.433373] RAX: 0000000000000000 RBX: fffffffffffffff4 RCX: =

>> 0000000000000000
>> [=C2=A0 387.435902] RDX: 0000000000000000 RSI: 0000000000000034 RDI: =

>> 0000000000000000
>> [=C2=A0 387.438438] RBP: 0000000000000034 R08: 0000000000000000 R09: =

>> fffffffffffffff9
>> [=C2=A0 387.440946] R10: 0000000000000000 R11: 0000000000000000 R12: =

>> 0000000000000cc0
>> [=C2=A0 387.443369] R13: fffffffffffffffb R14: 0000000000000034 R15: =

>> 0000000000000000
>> [=C2=A0 387.445759] FS:=C2=A0 0000000002a06880(0000) GS:ffff8dfd37d00000=
(0000) =

>> knlGS:0000000000000000
>> [=C2=A0 387.448352] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 00000000800500=
33
>> [=C2=A0 387.450614] CR2: 00007f6be3b0f47c CR3: 000000018f17c000 CR4: =

>> 00000000000406e0
>> [=C2=A0 387.453073] DR0: 00007f6be1da7000 DR1: 0000000000000000 DR2: =

>> 0000000000000000
>> [=C2=A0 387.455531] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: =

>> 0000000000030602
>> [=C2=A0 387.457999] Call Trace:
>> [=C2=A0 387.459933]=C2=A0 kmalloc_order+0x18/0x70
>> [=C2=A0 387.461817]=C2=A0 kmalloc_order_trace+0x1d/0xb0
>> [=C2=A0 387.463770]=C2=A0 keyctl_read_key+0xb6/0x140
>> [=C2=A0 387.465697]=C2=A0 do_syscall_64+0x5b/0x1f0
>> [=C2=A0 387.467572]=C2=A0 entry_SYSCALL_64_after_hwframe+0x44/0xa9
>> [=C2=A0 387.469596] RIP: 0033:0x463519
>> [=C2=A0 387.471409] Code: 00 f3 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 4=
0 =

>> 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 =

>> 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 db 59 00 00 c3 66 2e 0f 1f 84 00 =

>> 00 00 00
>> [=C2=A0 387.476350] RSP: 002b:00007ffde88f9338 EFLAGS: 00000246 ORIG_RAX=
: =

>> 00000000000000fa
>> [=C2=A0 387.479670] RAX: ffffffffffffffda RBX: 00000000000000fa RCX: =

>> 0000000000463519
>> [=C2=A0 387.481811] RDX: fffffffffffffffb RSI: fffffffffffffffd RDI: =

>> 000000000000000b
>> [=C2=A0 387.484045] RBP: 00007f6be26d4000 R08: ffffffffffffffe0 R09: =

>> ffffffffffffb1b1
>> [=C2=A0 387.486279] R10: fffffffffffffff9 R11: 0000000000000246 R12: =

>> 0000000000000002
>> [=C2=A0 387.488396] R13: 00007f6be26d4058 R14: 0000000002a06850 R15: =

>> 00007f6be26d4000
>> [=C2=A0 387.490515] ---[ end trace 3c2d530d0a271c54 ]---
>>
>>
>> To reproduce:
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # build kernel
>> =C2=A0=C2=A0=C2=A0=C2=A0cd linux
>> =C2=A0=C2=A0=C2=A0=C2=A0cp config-5.6.6-00162-g4ea62d6823c55 .config
>> =C2=A0=C2=A0=C2=A0=C2=A0make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 old=
defconfig prepare =

>> modules_prepare bzImage
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git clone https://githu=
b.com/intel/lkp-tests.git
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cd lkp-tests
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin/lkp qemu -k <bzImag=
e> job-script # job-script is =

>> attached in this email
>>
>>
>>
>> Thanks,
>> Rong Chen (
>>
> To fix that, we have to backport the commit 4f0882491a14 ("KEYS: Avoid =

> false positive ENOMEM error on key read") to 5.6-stable as well.
>
> Cheers,
> Longman

Thanks a lot, cc stable(a)vger.kernel.org

Best Regards,
Rong Chen
--===============5316513693227584538==--

