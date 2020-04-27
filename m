Content-Type: multipart/mixed; boundary="===============8266073783568359308=="
MIME-Version: 1.0
From: Waiman Long <longman@redhat.com>
To: lkp@lists.01.org
Subject: Re: [KEYS] 4ea62d6823: WARNING:at_mm/page_alloc.c:#__alloc_pages_nodemask
Date: Sun, 26 Apr 2020 22:58:51 -0400
Message-ID: <5f5e59fd-1ba7-2634-6667-ecaca9c5c8e5@redhat.com>
In-Reply-To: <20200426104848.GB1247@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============8266073783568359308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 4/26/20 6:48 AM, kernel test robot wrote:
> Greeting,
>
> FYI, we noticed the following commit (built with gcc-7):
>
> commit: 4ea62d6823c55fb914ba1195349b86a50efe8597 ("KEYS: Don't write out =
to userspace while holding key semaphore")
> https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable-rc.git q=
ueue/5.6
>
> in testcase: trinity
> with following parameters:
>
> 	runtime: 300s
>
> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
>
>
> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 8G
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
> +----------------------------------------------------+------------+------=
------+
> |                                                    | 0f7bd4ba0b | 4ea62=
d6823 |
> +----------------------------------------------------+------------+------=
------+
> | boot_successes                                     | 5          | 2    =
      |
> | boot_failures                                      | 1          | 9    =
      |
> | BUG:kernel_hang_in_boot_stage                      | 1          |      =
      |
> | BUG:kernel_hang_in_early-boot_stage                | 0          | 1    =
      |
> | WARNING:at_mm/page_alloc.c:#__alloc_pages_nodemask | 0          | 8    =
      |
> | RIP:__alloc_pages_nodemask                         | 0          | 8    =
      |
> +----------------------------------------------------+------------+------=
------+
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <rong.a.chen@intel.com>
>
>
> [  387.389621] WARNING: CPU: 1 PID: 5301 at mm/page_alloc.c:4713 __alloc_=
pages_nodemask+0x1d1/0x340
> [  387.392619] Modules linked in: 8021q garp stp mrp llc dlci af_key ieee=
802154_socket ieee802154 mpls_router ip_tunnel vsock_loopback vmw_vsock_vir=
tio_transport_common vmw_vsock_vmci_transport vsock vmw_vmci hidp cmtp kern=
elcapi bnep rfcomm bluetooth ecdh_generic ecc rfkill can_bcm can_raw can pp=
tp gre l2tp_ppp l2tp_netlink l2tp_core ip6_udp_tunnel udp_tunnel pppoe pppo=
x ppp_generic slhc crypto_user nfnetlink scsi_transport_iscsi dccp_ipv6 atm=
 sctp libcrc32c dccp_ipv4 dccp sr_mod cdrom ata_generic pata_acpi bochs_drm=
 drm_vram_helper drm_ttm_helper ttm intel_rapl_msr intel_rapl_common drm_km=
s_helper snd_pcm syscopyarea crct10dif_pclmul crc32_pclmul crc32c_intel gha=
sh_clmulni_intel sysfillrect snd_timer ppdev snd sysimgblt fb_sys_fops aesn=
i_intel ata_piix soundcore crypto_simd parport_pc cryptd joydev drm glue_he=
lper serio_raw pcspkr libata i2c_piix4 parport floppy
> [  387.417621] CPU: 1 PID: 5301 Comm: trinity-c1 Not tainted 5.6.6-00162-=
g4ea62d6823c55 #1
> [  387.420344] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.12.0-1 04/01/2014
> [  387.423093] RIP: 0010:__alloc_pages_nodemask+0x1d1/0x340
> [  387.425419] Code: ff ff ff 65 48 8b 04 25 c0 8b 01 00 48 05 60 0c 00 0=
0 41 be 01 00 00 00 48 89 44 24 08 e9 02 ff ff ff 81 e7 00 20 00 00 75 02 <=
0f> 0b 45 31 f6 eb 95 44 8b 64 24 18 65 8b 05 fc 9f 39 5e 89 c0 48
> [  387.431026] RSP: 0018:ffff9ee900f27e60 EFLAGS: 00010246
> [  387.433373] RAX: 0000000000000000 RBX: fffffffffffffff4 RCX: 000000000=
0000000
> [  387.435902] RDX: 0000000000000000 RSI: 0000000000000034 RDI: 000000000=
0000000
> [  387.438438] RBP: 0000000000000034 R08: 0000000000000000 R09: fffffffff=
ffffff9
> [  387.440946] R10: 0000000000000000 R11: 0000000000000000 R12: 000000000=
0000cc0
> [  387.443369] R13: fffffffffffffffb R14: 0000000000000034 R15: 000000000=
0000000
> [  387.445759] FS:  0000000002a06880(0000) GS:ffff8dfd37d00000(0000) knlG=
S:0000000000000000
> [  387.448352] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  387.450614] CR2: 00007f6be3b0f47c CR3: 000000018f17c000 CR4: 000000000=
00406e0
> [  387.453073] DR0: 00007f6be1da7000 DR1: 0000000000000000 DR2: 000000000=
0000000
> [  387.455531] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000000000=
0030602
> [  387.457999] Call Trace:
> [  387.459933]  kmalloc_order+0x18/0x70
> [  387.461817]  kmalloc_order_trace+0x1d/0xb0
> [  387.463770]  keyctl_read_key+0xb6/0x140
> [  387.465697]  do_syscall_64+0x5b/0x1f0
> [  387.467572]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [  387.469596] RIP: 0033:0x463519
> [  387.471409] Code: 00 f3 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 4=
8 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <=
48> 3d 01 f0 ff ff 0f 83 db 59 00 00 c3 66 2e 0f 1f 84 00 00 00 00
> [  387.476350] RSP: 002b:00007ffde88f9338 EFLAGS: 00000246 ORIG_RAX: 0000=
0000000000fa
> [  387.479670] RAX: ffffffffffffffda RBX: 00000000000000fa RCX: 000000000=
0463519
> [  387.481811] RDX: fffffffffffffffb RSI: fffffffffffffffd RDI: 000000000=
000000b
> [  387.484045] RBP: 00007f6be26d4000 R08: ffffffffffffffe0 R09: fffffffff=
fffb1b1
> [  387.486279] R10: fffffffffffffff9 R11: 0000000000000246 R12: 000000000=
0000002
> [  387.488396] R13: 00007f6be26d4058 R14: 0000000002a06850 R15: 00007f6be=
26d4000
> [  387.490515] ---[ end trace 3c2d530d0a271c54 ]---
>
>
> To reproduce:
>
>          # build kernel
> 	cd linux
> 	cp config-5.6.6-00162-g4ea62d6823c55 .config
> 	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 olddefconfig prepare module=
s_prepare bzImage
>
>          git clone https://github.com/intel/lkp-tests.git
>          cd lkp-tests
>          bin/lkp qemu -k <bzImage> job-script # job-script is attached in=
 this email
>
>
>
> Thanks,
> Rong Chen (
>
To fix that, we have to backport the commit 4f0882491a14 ("KEYS: Avoid =

false positive ENOMEM error on key read") to 5.6-stable as well.

Cheers,
Longman

--===============8266073783568359308==--

