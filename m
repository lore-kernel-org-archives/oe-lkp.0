Content-Type: multipart/mixed; boundary="===============4284486795753428144=="
MIME-Version: 1.0
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: lkp@lists.01.org
Subject: Re: [drm/i915] 202c1ca611: WARNING:at_drivers/gpu/drm/i915/intel_uncore.c:#intel_uncore_forcewake_for_reg[i915]
Date: Sat, 07 Oct 2017 11:54:22 +0200
Message-ID: <op.y7qggwiuxaggs7@mwajdecz-mobl1.ger.corp.intel.com>
In-Reply-To: <20171007042508.4ewrka2aypnrwjgg@inn>
List-Id: <oe-lkp.lists.linux.dev>

--===============4284486795753428144==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, 07 Oct 2017 06:25:09 +0200, kernel test robot  =

<fengguang.wu@intel.com> wrote:

> FYI, we noticed the following commit (built with gcc-6):
>
> commit: 202c1ca611488c621eed76cd63132a2c2838ee5f ("drm/i915: Move core  =

> GuC functions into dedicated file")
> url:  =

> https://github.com/0day-ci/linux/commits/Michal-Wajdeczko/drm-i915-Guc-co=
de-reorg/20171002-205241
> base: git://anongit.freedesktop.org/drm-intel for-linux-next
>
> in testcase: aim9
> with following parameters:
>
> 	testtime: 300s
> 	test: exec_test
> 	cpufreq_governor: performance
>
> test-description: Suite IX is the "AIM Independent Resource Benchmark:"  =

> the famous synthetic benchmark.
> test-url: https://sourceforge.net/projects/aimbench/files/aim-suite9/
>
>
> on test machine: 4 threads Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz with  =

> 4G memory
>
> caused below changes (please refer to attached dmesg/kmsg for entire  =

> log/backtrace):
>
>
> +----------------+------------+------------+
> |                | 6691933020 | 202c1ca611 |
> +----------------+------------+------------+
> | boot_successes | 3          | 4          |
> +----------------+------------+------------+
>
>
>
> kern  :warn  : [   72.000033] WARNING: CPU: 0 PID: 179 at  =

> drivers/gpu/drm/i915/intel_uncore.c:1839  =

> intel_uncore_forcewake_for_reg+0x1bb/0x250 [i915]

This was fixed before merging series by moving part of the
initialization new into intel_uc_init_mmio()
See https://patchwork.freedesktop.org/patch/180608/

Thanks,
Michal

> kern  :warn  : [   72.000037] Modules linked in: ppdev wmi_bmof  =

> kvm_intel(+) kvm irqbypass crct10dif_pclmul crc32_pclmul crc32c_intel  =

> snd_hda_intel i915(+) ahci(+) libahci ghash_clmulni_intel cryptd  =

> snd_hda_codec drm_kms_helper snd_hda_core syscopyarea sysfillrect  =

> snd_hwdep sysimgblt fb_sys_fops snd_pcm snd_timer libata snd soundcore  =

> pcspkr drm parport_pc shpchp wmi parport video ip_tables
> kern  :warn  : [   72.000052] CPU: 0 PID: 179 Comm: systemd-udevd Not  =

> tainted 4.13.0-rc5-01377-g202c1ca #1
> kern  :warn  : [   72.000052] Hardware name: Hewlett-Packard HP Pro 3340  =

> MT/17A1, BIOS 8.07 01/24/2013
> kern  :warn  : [   72.000053] task: ffff88011d7a8000 task.stack:  =

> ffffc90000b28000
> kern  :warn  : [   72.000080] RIP:  =

> 0010:intel_uncore_forcewake_for_reg+0x1bb/0x250 [i915]
> kern  :warn  : [   72.000080] RSP: 0018:ffffc90000b2ba78 EFLAGS: 00010296
> kern  :warn  : [   72.000081] RAX: 0000000000000032 RBX:  =

> ffff88011b810000 RCX: 0000000000000000
> kern  :warn  : [   72.000082] RDX: 0000000000000001 RSI:  =

> 0000000000000002 RDI: 0000000000000282
> kern  :warn  : [   72.000083] RBP: ffffc90000b2baa0 R08:  =

> 0000000000000032 R09: ffffffff823555c0
> kern  :warn  : [   72.000083] R10: 0000000000000010 R11:  =

> 0000000000000032 R12: 0000000000000001
> kern  :warn  : [   72.000084] R13: 000000000000c180 R14:  =

> ffff88011b810000 R15: ffffffffa030f5e0
> kern  :warn  : [   72.000085] FS:  00007f10e3fe68c0(0000)  =

> GS:ffff88011fa00000(0000) knlGS:0000000000000000
> kern  :warn  : [   72.000086] CS:  0010 DS: 0000 ES: 0000 CR0:  =

> 0000000080050033
> kern  :warn  : [   72.000086] CR2: 00007fe13fa89010 CR3:  =

> 000000011d7a4000 CR4: 00000000001406f0
> kern  :warn  : [   72.000087] Call Trace:
> kern  :warn  : [   72.000115]  intel_guc_init_early+0x99/0xc0 [i915]
> kern  :warn  : [   72.000141]  intel_uc_init_early+0x15/0x20 [i915]
> kern  :warn  : [   72.000163]  i915_driver_load+0x2f2/0xe20 [i915]
> kern  :warn  : [   72.000166]  ? acpi_dev_found+0x64/0x70
> kern  :warn  : [   72.000188]  i915_pci_probe+0x4e/0x70 [i915]
> kern  :warn  : [   72.000190]  local_pci_probe+0x45/0xa0
> kern  :warn  : [   72.000191]  pci_device_probe+0x132/0x170
> kern  :warn  : [   72.000193]  driver_probe_device+0x29c/0x450
> kern  :warn  : [   72.000194]  __driver_attach+0xdf/0xf0
> kern  :warn  : [   72.000195]  ? driver_probe_device+0x450/0x450
> kern  :warn  : [   72.000196]  bus_for_each_dev+0x60/0xa0
> kern  :warn  : [   72.000197]  driver_attach+0x1e/0x20
> kern  :warn  : [   72.000198]  bus_add_driver+0x170/0x270
> kern  :warn  : [   72.000200]  driver_register+0x60/0xe0
> kern  :warn  : [   72.000201]  __pci_register_driver+0x4c/0x50
> kern  :warn  : [   72.000225]  i915_init+0x57/0x5a [i915]
> kern  :warn  : [   72.000226]  ? 0xffffffffa0386000
> kern  :warn  : [   72.000228]  do_one_initcall+0x43/0x170
> kern  :warn  : [   72.000229]  ? __might_sleep+0x4a/0x80
> kern  :warn  : [   72.000231]  ? kmem_cache_alloc_trace+0x163/0x1b0
> kern  :warn  : [   72.000233]  do_init_module+0x5f/0x1fe
> kern  :warn  : [   72.000235]  load_module+0x1564/0x1c70
> kern  :warn  : [   72.000236]  ? ima_post_read_file+0x7e/0xa0
> kern  :warn  : [   72.000238]  ? kernel_read_file+0x1a3/0x1c0
> kern  :warn  : [   72.000239]  SYSC_finit_module+0xbc/0xf0
> kern  :warn  : [   72.000241]  ? SYSC_finit_module+0xbc/0xf0
> kern  :warn  : [   72.000243]  SyS_finit_module+0xe/0x10
> kern  :warn  : [   72.000245]  entry_SYSCALL_64_fastpath+0x1a/0xa5
> kern  :warn  : [   72.000246] RIP: 0033:0x7f10e2e61d49
> kern  :warn  : [   72.000246] RSP: 002b:00007ffce4df5b58 EFLAGS:  =

> 00000246 ORIG_RAX: 0000000000000139
> kern  :warn  : [   72.000247] RAX: ffffffffffffffda RBX:  =

> 0000000000000014 RCX: 00007f10e2e61d49
> kern  :warn  : [   72.000248] RDX: 0000000000000000 RSI:  =

> 00007f10e377d525 RDI: 0000000000000014
> kern  :warn  : [   72.000248] RBP: 00007ffce4df4b50 R08:  =

> 0000000000000000 R09: 00007ffce4df60d0
> kern  :warn  : [   72.000249] R10: 0000000000000014 R11:  =

> 0000000000000246 R12: 0000000000000005
> kern  :warn  : [   72.000249] R13: 000000831cfee810 R14:  =

> 00007ffce4df4b30 R15: 0000000000000005
> kern  :warn  : [   72.000250] Code: dc 41 89 c4 8b 83 14 07 00 00 f7 d0  =

> 44 85 e0 0f 84 92 fe ff ff 48 c7 c6 98 7c 33 a0 48 c7 c7 bd 8b 32 a0 89  =

> 55 dc e8 56 e8 e3 e0 <0f> ff 8b 55 dc e9 72 fe ff ff a8 60 0f 85 72 ff  =

> ff ff 45 31 f6
> kern  :warn  : [   72.000266] ---[ end trace 53461f15f385117a ]---
>
>
> To reproduce:
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
>
>
>
> Thanks,
> lkp

--===============4284486795753428144==--

