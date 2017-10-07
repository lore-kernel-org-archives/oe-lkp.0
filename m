Content-Type: multipart/mixed; boundary="===============2099688648318253911=="
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
To: lkp@lists.01.org
Subject: Re: [Intel-gfx] [drm/i915] 202c1ca611: WARNING:at_drivers/gpu/drm/i915/intel_uncore.c:#intel_uncore_forcewake_for_reg[i915]
Date: Sat, 07 Oct 2017 09:36:07 +0100
Message-ID: <150736536721.17976.9193374191706907849@mail.alporthouse.com>
In-Reply-To: <20171007042508.4ewrka2aypnrwjgg@inn>
List-Id: <oe-lkp.lists.linux.dev>

--===============2099688648318253911==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Quoting kernel test robot (2017-10-07 05:25:09)
> FYI, we noticed the following commit (built with gcc-6):
> =

> commit: 202c1ca611488c621eed76cd63132a2c2838ee5f ("drm/i915: Move core Gu=
C functions into dedicated file")
> url: https://github.com/0day-ci/linux/commits/Michal-Wajdeczko/drm-i915-G=
uc-code-reorg/20171002-205241
> base: git://anongit.freedesktop.org/drm-intel for-linux-next
> =

> in testcase: aim9
> with following parameters:
> =

>         testtime: 300s
>         test: exec_test
>         cpufreq_governor: performance
> =

> test-description: Suite IX is the "AIM Independent Resource Benchmark:" t=
he famous synthetic benchmark.
> test-url: https://sourceforge.net/projects/aimbench/files/aim-suite9/
> =

> =

> on test machine: 4 threads Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz with 4=
G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +----------------+------------+------------+
> |                | 6691933020 | 202c1ca611 |
> +----------------+------------+------------+
> | boot_successes | 3          | 4          |
> +----------------+------------+------------+
> =

> =

> =

> kern  :warn  : [   72.000033] WARNING: CPU: 0 PID: 179 at drivers/gpu/drm=
/i915/intel_uncore.c:1839 intel_uncore_forcewake_for_reg+0x1bb/0x250 [i915]
> kern  :warn  : [   72.000037] Modules linked in: ppdev wmi_bmof kvm_intel=
(+) kvm irqbypass crct10dif_pclmul crc32_pclmul crc32c_intel snd_hda_intel =
i915(+) ahci(+) libahci ghash_clmulni_intel cryptd snd_hda_codec drm_kms_he=
lper snd_hda_core syscopyarea sysfillrect snd_hwdep sysimgblt fb_sys_fops s=
nd_pcm snd_timer libata snd soundcore pcspkr drm parport_pc shpchp wmi parp=
ort video ip_tables
> kern  :warn  : [   72.000052] CPU: 0 PID: 179 Comm: systemd-udevd Not tai=
nted 4.13.0-rc5-01377-g202c1ca #1
> kern  :warn  : [   72.000052] Hardware name: Hewlett-Packard HP Pro 3340 =
MT/17A1, BIOS 8.07 01/24/2013
> kern  :warn  : [   72.000053] task: ffff88011d7a8000 task.stack: ffffc900=
00b28000
> kern  :warn  : [   72.000080] RIP: 0010:intel_uncore_forcewake_for_reg+0x=
1bb/0x250 [i915]
> kern  :warn  : [   72.000080] RSP: 0018:ffffc90000b2ba78 EFLAGS: 00010296
> kern  :warn  : [   72.000081] RAX: 0000000000000032 RBX: ffff88011b810000=
 RCX: 0000000000000000
> kern  :warn  : [   72.000082] RDX: 0000000000000001 RSI: 0000000000000002=
 RDI: 0000000000000282
> kern  :warn  : [   72.000083] RBP: ffffc90000b2baa0 R08: 0000000000000032=
 R09: ffffffff823555c0
> kern  :warn  : [   72.000083] R10: 0000000000000010 R11: 0000000000000032=
 R12: 0000000000000001
> kern  :warn  : [   72.000084] R13: 000000000000c180 R14: ffff88011b810000=
 R15: ffffffffa030f5e0
> kern  :warn  : [   72.000085] FS:  00007f10e3fe68c0(0000) GS:ffff88011fa0=
0000(0000) knlGS:0000000000000000
> kern  :warn  : [   72.000086] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080=
050033
> kern  :warn  : [   72.000086] CR2: 00007fe13fa89010 CR3: 000000011d7a4000=
 CR4: 00000000001406f0
> kern  :warn  : [   72.000087] Call Trace:
> kern  :warn  : [   72.000115]  intel_guc_init_early+0x99/0xc0 [i915]
> kern  :warn  : [   72.000141]  intel_uc_init_early+0x15/0x20 [i915]
> kern  :warn  : [   72.000163]  i915_driver_load+0x2f2/0xe20 [i915]

Looks like you need intel_uncore_init() first, so
s/init_early/init_mmio/ ?
-Chris

--===============2099688648318253911==--

