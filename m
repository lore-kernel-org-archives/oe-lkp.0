Content-Type: multipart/mixed; boundary="===============0105875096208144935=="
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
To: lkp@lists.01.org
Subject: Re: [Intel-gfx] [drm/i915] 202c1ca611: WARNING:at_drivers/gpu/drm/i915/intel_uncore.c:#intel_uncore_forcewake_for_reg[i915]
Date: Sat, 07 Oct 2017 09:38:22 +0100
Message-ID: <150736550282.17976.672305742686039162@mail.alporthouse.com>
In-Reply-To: <150736536721.17976.9193374191706907849@mail.alporthouse.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0105875096208144935==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Quoting Chris Wilson (2017-10-07 09:36:07)
> Quoting kernel test robot (2017-10-07 05:25:09)
> > kern  :warn  : [   72.000033] WARNING: CPU: 0 PID: 179 at drivers/gpu/d=
rm/i915/intel_uncore.c:1839 intel_uncore_forcewake_for_reg+0x1bb/0x250 [i91=
5]
> > kern  :warn  : [   72.000037] Modules linked in: ppdev wmi_bmof kvm_int=
el(+) kvm irqbypass crct10dif_pclmul crc32_pclmul crc32c_intel snd_hda_inte=
l i915(+) ahci(+) libahci ghash_clmulni_intel cryptd snd_hda_codec drm_kms_=
helper snd_hda_core syscopyarea sysfillrect snd_hwdep sysimgblt fb_sys_fops=
 snd_pcm snd_timer libata snd soundcore pcspkr drm parport_pc shpchp wmi pa=
rport video ip_tables
> > kern  :warn  : [   72.000052] CPU: 0 PID: 179 Comm: systemd-udevd Not t=
ainted 4.13.0-rc5-01377-g202c1ca #1
> > kern  :warn  : [   72.000052] Hardware name: Hewlett-Packard HP Pro 334=
0 MT/17A1, BIOS 8.07 01/24/2013
> > kern  :warn  : [   72.000053] task: ffff88011d7a8000 task.stack: ffffc9=
0000b28000
> > kern  :warn  : [   72.000080] RIP: 0010:intel_uncore_forcewake_for_reg+=
0x1bb/0x250 [i915]
> > kern  :warn  : [   72.000080] RSP: 0018:ffffc90000b2ba78 EFLAGS: 000102=
96
> > kern  :warn  : [   72.000081] RAX: 0000000000000032 RBX: ffff88011b8100=
00 RCX: 0000000000000000
> > kern  :warn  : [   72.000082] RDX: 0000000000000001 RSI: 00000000000000=
02 RDI: 0000000000000282
> > kern  :warn  : [   72.000083] RBP: ffffc90000b2baa0 R08: 00000000000000=
32 R09: ffffffff823555c0
> > kern  :warn  : [   72.000083] R10: 0000000000000010 R11: 00000000000000=
32 R12: 0000000000000001
> > kern  :warn  : [   72.000084] R13: 000000000000c180 R14: ffff88011b8100=
00 R15: ffffffffa030f5e0
> > kern  :warn  : [   72.000085] FS:  00007f10e3fe68c0(0000) GS:ffff88011f=
a00000(0000) knlGS:0000000000000000
> > kern  :warn  : [   72.000086] CS:  0010 DS: 0000 ES: 0000 CR0: 00000000=
80050033
> > kern  :warn  : [   72.000086] CR2: 00007fe13fa89010 CR3: 000000011d7a40=
00 CR4: 00000000001406f0
> > kern  :warn  : [   72.000087] Call Trace:
> > kern  :warn  : [   72.000115]  intel_guc_init_early+0x99/0xc0 [i915]
> > kern  :warn  : [   72.000141]  intel_uc_init_early+0x15/0x20 [i915]
> > kern  :warn  : [   72.000163]  i915_driver_load+0x2f2/0xe20 [i915]
> =

> Looks like you need intel_uncore_init() first, so
> s/init_early/init_mmio/ ?

Ah, looks like we should split intel_uncore_init() instead. The vfunc
setup is init_early stuff (though we still need to rearrange
intel_uc_init_early).
-Chris

--===============0105875096208144935==--

