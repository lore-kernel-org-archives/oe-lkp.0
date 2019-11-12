Content-Type: multipart/mixed; boundary="===============6732032316832974879=="
MIME-Version: 1.0
From: Frederic Weisbecker <frederic@kernel.org>
To: lkp@lists.01.org
Subject: Re: [irq_work] feb4a51323: BUG:soft_lockup-CPU##stuck_for#s
Date: Tue, 12 Nov 2019 15:49:55 +0100
Message-ID: <20191112144954.GD27917@lenoir>
In-Reply-To: <20191112090357.GB30590@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============6732032316832974879==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2019 at 05:03:57PM +0800, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: feb4a51323babe13315c3b783ea7f1cf25368918 ("irq_work: Slightly sim=
plify IRQ_WORK_PENDING clearing")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =

> in testcase: blktests
> with following parameters:
> =

> 	disk: 1SSD
> 	test: block-group1
> =

> =

> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 8G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +------------------------------------------------+------------+----------=
--+
> |                                                | 25269871db | feb4a5132=
3 |
> +------------------------------------------------+------------+----------=
--+
> | boot_successes                                 | 5          | 0        =
  |
> | boot_failures                                  | 0          | 10       =
  |
> | BUG:soft_lockup-CPU##stuck_for#s               | 0          | 10       =
  |
> | RIP:irq_work_sync                              | 0          | 10       =
  |
> | Kernel_panic-not_syncing:softlockup:hung_tasks | 0          | 10       =
  |
> +------------------------------------------------+------------+----------=
--+
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <rong.a.chen@intel.com>
> =

> =

> [   81.049506] watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [blktrac=
e:4948]

Duh! Of course we are dealing with the value of flags before we cleared IRQ=
_WORK_PENDING
so later clearing IRQ_WORK_BUZY can't work.

That would be the fix (cooking one with proper changelog):

diff --git a/kernel/irq_work.c b/kernel/irq_work.c
index 49c53f80a13a..8ee907eb4d83 100644
--- a/kernel/irq_work.c
+++ b/kernel/irq_work.c
@@ -158,6 +158,7 @@ static void irq_work_run_list(struct llist_head *list)
 		 * Clear the BUSY bit and return to the free state if
 		 * no-one else claimed it meanwhile.
 		 */
+		flags ~=3D IRQ_WORK_PENDING;
 		(void)atomic_cmpxchg(&work->flags, flags, flags & ~IRQ_WORK_BUSY);
 	}
 }


> [   81.055602] Modules linked in: scsi_debug loop intel_rapl_msr intel_ra=
pl_common sr_mod cdrom crct10dif_pclmul crc32_pclmul bochs_drm crc32c_intel=
 sd_mod sg ghash_clmulni_intel drm_vram_helper ata_generic pata_acpi ttm pp=
dev drm_kms_helper snd_pcm syscopyarea sysfillrect snd_timer aesni_intel sn=
d sysimgblt fb_sys_fops ata_piix crypto_simd drm cryptd glue_helper libata =
soundcore pcspkr joydev serio_raw virtio_scsi i2c_piix4 parport_pc floppy p=
arport ip_tables [last unloaded: scsi_debug]
> [   81.071683] CPU: 0 PID: 4948 Comm: blktrace Not tainted 5.4.0-rc7-0000=
3-gfeb4a51323bab #1
> [   81.075435] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [   81.079031] RIP: 0010:irq_work_sync+0x4/0x10
--===============6732032316832974879==--

