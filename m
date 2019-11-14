Content-Type: multipart/mixed; boundary="===============0692814338938950440=="
MIME-Version: 1.0
From: Andi Kleen <ak@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [perf evlist] 966c8c6f09: perf-sanity-tests.Merge_cpu_map.fail
Date: Thu, 14 Nov 2019 14:53:38 -0800
Message-ID: <20191114225338.GA22747@tassilo.jf.intel.com>
In-Reply-To: <20191111005354.GG29418@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============0692814338938950440==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2019 at 08:53:54AM +0800, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 966c8c6f09470a734ef8521d08b2a74c7f1378f7 ("perf evlist: Maintain =
evlist->all_cpus")
> https://git.kernel.org/cgit/linux/kernel/git/ak/linux-misc.git perf/stat-=
scale-8
> =

> in testcase: perf-sanity-tests
> with following parameters:
> =

> 	perf_compiler: gcc
> 	ucode: 0x27

This is a user space patch. So if it causes a change in behavior in the
kernel it was latent.
> =

> kern  :err   : [   62.167520] BUG: sleeping function called from invalid =
context at kernel/events/core.c:10702
> kern  :err   : [   62.178180] in_atomic(): 1, irqs_disabled(): 0, non_blo=
ck: 0, pid: 5841, name: perf
> kern  :warn  : [   62.186425] CPU: 3 PID: 5841 Comm: perf Not tainted 5.4=
.0-rc5-00152-g966c8c6f09470 #1
> kern  :warn  : [   62.194857] Hardware name: Dell Inc. OptiPlex 9020/0DNK=
MN, BIOS A05 12/05/2013
> kern  :warn  : [   62.202680] Call Trace:
> kern  :warn  : [   62.205702]  dump_stack+0x5c/0x7b
> kern  :warn  : [   62.209581]  ___might_sleep+0x102/0x120
> kern  :warn  : [   62.213984]  __might_fault+0x2b/0x30
> kern  :warn  : [   62.218091]  perf_copy_attr+0x33/0x300
> kern  :warn  : [   62.222369]  __do_sys_perf_event_open+0x87/0xcf0
> kern  :warn  : [   62.227542]  do_syscall_64+0x5b/0x1d0
> kern  :warn  : [   62.231742]  entry_SYSCALL_64_after_hwframe+0x44/0xa9

Also I can't really see how it could happen. The message should
happen for an user access while holding a lock or similar.

But perf_copy_attr doesn't have any locks, or anything else
that would forbid sleeping, and it's near the start of the
system call.

The only thing I could think of is that some previous syscall
leaked a preempt count.

I tried to reproduce it in a VM, but it didn't happen.

Likely a bogus bisect?

-Andi


> kern  :warn  : [   62.237306] RIP: 0033:0x7fabcdd88469
> kern  :warn  : [   62.241393] Code: 00 f3 c3 66 2e 0f 1f 84 00 00 00 00 0=
0 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4=
c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d ff 49 2b 00 f7 d8 64 89=
 01 48
> kern  :warn  : [   62.261291] RSP: 002b:00007fff5c52ead8 EFLAGS: 00000246=
 ORIG_RAX: 000000000000012a
> kern  :warn  : [   62.269401] RAX: ffffffffffffffda RBX: 000055b6def59a90=
 RCX: 00007fabcdd88469
> kern  :warn  : [   62.277083] RDX: 00000000ffffffff RSI: 00000000000016d2=
 RDI: 000055b6def59aa0
> kern  :warn  : [   62.284799] RBP: 00007fff5c52ebd0 R08: 0000000000000008=
 R09: 0000000000000008
> kern  :warn  : [   62.292517] R10: 00000000ffffffff R11: 0000000000000246=
 R12: 00000000ffffffff
> kern  :warn  : [   62.300194] R13: 00000000000016d2 R14: 00000000ffffffff=
 R15: 0000000000000008
> kern  :warn  : [   62.307901] ------------[ cut here ]------------
> kern  :warn  : [   62.313049] WARNING: CPU: 3 PID: 5841 at lib/usercopy.c=
:12 _copy_from_user+0x69/0xa0
> kern  :warn  : [   62.323020] Modules linked in: rpcsec_gss_krb5 auth_rpc=
gss nfsv4 dns_resolver binfmt_misc btrfs xor zstd_decompress zstd_compress =
raid6_pq libcrc32c sr_mod sd_mod cdrom snd_hda_codec_hdmi sg ata_generic pa=
ta_acpi intel_rapl_msr intel_rapl_common x86_pkg_temp_thermal intel_powercl=
amp coretemp i915 snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio=
 kvm_intel snd_hda_intel snd_intel_nhlt kvm irqbypass mei_wdt drm_kms_helpe=
r snd_hda_codec crct10dif_pclmul syscopyarea snd_hda_core crc32_pclmul dcdb=
as crc32c_intel sysfillrect snd_hwdep ghash_clmulni_intel sysimgblt fb_sys_=
fops snd_pcm ata_piix aesni_intel snd_timer crypto_simd mei_me cryptd snd g=
lue_helper pcspkr drm libata joydev i2c_i801 lpc_ich mei soundcore video ip=
_tables
> kern  :warn  : [   62.391150] CPU: 3 PID: 5841 Comm: perf Tainted: G     =
   W         5.4.0-rc5-00152-g966c8c6f09470 #1
> kern  :warn  : [   62.401013] Hardware name: Dell Inc. OptiPlex 9020/0DNK=
MN, BIOS A05 12/05/2013
> kern  :warn  : [   62.408867] RIP: 0010:_copy_from_user+0x69/0xa0
> kern  :warn  : [   62.414022] Code: 48 89 ea 65 48 8b 04 25 c0 6b 01 00 4=
8 01 da 48 8b 80 d8 22 00 00 72 30 48 39 c2 76 11 48 89 e8 48 85 c0 75 1a 5=
b 5d 41 5c c3 <0f> 0b eb d2 4c 89 e7 48 89 de 89 ea e8 96 85 5f 00 89 c0 eb=
 e1 48
> kern  :warn  : [   62.434109] RSP: 0018:ffffc90000f07e00 EFLAGS: 00010246
> kern  :warn  : [   62.439996] RAX: 0000000000000000 RBX: 000055b6def59aa0=
 RCX: 0000000000000001
> kern  :warn  : [   62.447787] RDX: 00000000fffc5214 RSI: 000000000000000b=
 RDI: ffffffff8233a790
> kern  :warn  : [   62.455590] RBP: 0000000000000070 R08: 000000000000092e=
 R09: 0000000000aaaaaa
> kern  :warn  : [   62.463353] R10: 0000000000000003 R11: 00000000ffffffff=
 R12: ffffc90000f07e90
> kern  :warn  : [   62.471121] R13: 0000000000000070 R14: 000055b6def59aa4=
 R15: 0000000000000070
> kern  :warn  : [   62.478904] FS:  00007fabd0b62000(0000) GS:ffff88821eac=
0000(0000) knlGS:0000000000000000
> kern  :warn  : [   62.487642] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080=
050033
> kern  :warn  : [   62.494030] CR2: 000055b6def590c0 CR3: 000000012c17e002=
 CR4: 00000000001606e0
> kern  :warn  : [   62.501814] Call Trace:
> kern  :warn  : [   62.504894]  perf_copy_attr+0xa5/0x300
> kern  :warn  : [   62.509241]  __do_sys_perf_event_open+0x87/0xcf0
> kern  :warn  : [   62.514449]  do_syscall_64+0x5b/0x1d0
> kern  :warn  : [   62.518742]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> kern  :warn  : [   62.524378] RIP: 0033:0x7fabcdd88469
> kern  :warn  : [   62.528555] Code: 00 f3 c3 66 2e 0f 1f 84 00 00 00 00 0=
0 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4=
c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d ff 49 2b 00 f7 d8 64 89=
 01 48
> kern  :warn  : [   62.548607] RSP: 002b:00007fff5c52ead8 EFLAGS: 00000246=
 ORIG_RAX: 000000000000012a
> kern  :warn  : [   62.556805] RAX: ffffffffffffffda RBX: 000055b6def59a90=
 RCX: 00007fabcdd88469
> kern  :warn  : [   62.564577] RDX: 00000000ffffffff RSI: 00000000000016d2=
 RDI: 000055b6def59aa0
> kern  :warn  : [   62.572330] RBP: 00007fff5c52ebd0 R08: 0000000000000008=
 R09: 0000000000000008
> kern  :warn  : [   62.580109] R10: 00000000ffffffff R11: 0000000000000246=
 R12: 00000000ffffffff
> kern  :warn  : [   62.587897] R13: 00000000000016d2 R14: 00000000ffffffff=
 R15: 0000000000000008
> kern  :warn  : [   62.595682] ---[ end trace bffdb806d5fd2a6a ]---
> =

> =

> To reproduce:
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
>=20
--===============0692814338938950440==--

