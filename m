Content-Type: multipart/mixed; boundary="===============6355920290508599100=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/hotplug] e1056a25da: WARNING:at_arch/x86/kernel/apic/apic.c:#setup_local_APIC
Date: Fri, 28 Jun 2019 14:32:31 +0800
Message-ID: <20190628063231.GA7766@shbuild999.sh.intel.com>
In-Reply-To: <alpine.DEB.2.21.1906251330330.32342@nanos.tec.linutronix.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============6355920290508599100==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Tue, Jun 25, 2019 at 07:32:03PM +0800, Thomas Gleixner wrote:
> Rong,
> =

> On Tue, 25 Jun 2019, Rong Chen wrote:
> > On 6/25/19 2:24 PM, Thomas Gleixner wrote:
> > > > On 6/22/19 3:08 AM, Thomas Gleixner wrote:
> > > > > > on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridg=
e -smp
> > > > > > 2 -m
> > > > > > 2G
> > > > > I cannot reproduce that issue. What's the underlying hardware mac=
hine?
> > > > brand: Genuine Intel(R) CPU 000 @ 2.27GHz
> > > > model: Westmere-EX
> > > > memory: 256G
> > > > nr_node: 4
> > > > nr_cpu: 80
> > > Ok. I'll try to find something similar. Can please you rerun that tes=
t on
> > > that particular configuration with the updated branch?
> > > =

> > >     git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git WIP.x86=
/ipi
> > > =

> > I have tested commit e0b179bc1a ("x86/apic/x2apic: Add conditional IPI
> > shorthands support"), the problem is still exist.
> =

> the head of that branch is:
> =

>       4f3f6d6a7f8e ("x86/apic/x2apic: Add conditional IPI shorthands supp=
ort")
> =

> This is WIP and force pushed. There are no incremental changes. Could you
> please check again?

Since you can't reproduce it yet, we've added some debug hook to get more
info, like dmesg below:

[  288.865969] kvm-clock: cpu 0, msr 6d201001, secondary cpu clock
[  288.866069] IRR[7]: 0x1000
[  289.890274] WARNING: CPU: 0 PID: 0 at arch/x86/kernel/apic/apic.c:1502 s=
etup_local_APIC+0x2d1/0x4f0
[  289.911792] Modules linked in: locktorture torture sr_mod cdrom ata_gene=
ric pata_acpi bochs_drm ppdev ttm ata_piix drm_kms_helper snd_pcm libata sy=
scopyarea sysfillrect snd_timer snd sysimgblt soundcore fb_sys_fops joydev =
crc32c_intel drm serio_raw pcspkr parport_pc i2c_piix4 floppy parport
[  289.959629] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.2.0-rc5-00493-g1=
965704 #1
[  289.975340] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
1.10.2-1 04/01/2014
[  289.990568] RIP: 0010:setup_local_APIC+0x2d1/0x4f0
[  290.000361] Code: 7a 7d 01 85 c9 0f 84 a9 00 00 00 0f 31 c1 e1 0a 48 c1 =
e2 20 41 89 ce 4c 03 34 24 48 09 d0 49 29 c6 4d 85 f6 0f 8f a1 fe ff ff <0f=
> 0b 48 c7 c7 09 08 cc 8e 89 ea 44 89 ee bb 07 00 00 00 48 c7 c5
[  290.035653] RSP: 0000:ffffffff8f003ee0 EFLAGS: 00010086
[  290.044854] RAX: 0000009c7aa7aeb4 RBX: 0000000000000020 RCX: 000000008a0=
01800
[  290.057690] RDX: 0000009c00000000 RSI: 0000000000000020 RDI: ffffffff8f0=
03ef0
[  290.070711] RBP: 0000000000000000 R08: 0000000000000341 R09: 00000000000=
0001d
[  290.083680] R10: ffff943bcf49b740 R11: ffffffff8f003d90 R12: 00000000000=
000f0
[  290.096414] R13: 0000000000001000 R14: fffffffffffc581b R15: 00000000000=
00000
[  290.109369] FS:  0000000000000000(0000) GS:ffff943c32400000(0000) knlGS:=
0000000000000000
[  290.124123] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  290.134558] CR2: 00000000f7ec7710 CR3: 000000006c60a000 CR4: 00000000000=
006f0
[  290.147451] Call Trace:
[  290.152154]  apic_ap_setup+0xa/0x20
[  290.158663]  start_secondary+0x78/0x1e0
[  290.165411]  secondary_startup_64+0xb6/0xc0
[  290.173158] ---[ end trace bfefeb8bcdb1b9e3 ]---
[  290.182418] queued =3D 0x1000 acked =3D 0
[  290.189159] IRR[7]: 0x1000

Which shows the IRR[7] was set 0x1000, IIUC, it means vector
0xec, which is for LAPIC timer, and ISRs are all 0 before and
after the loop.


The debug code is as follows:
diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
index 197a150..38e0851 100644
--- a/arch/x86/kernel/apic/apic.c
+++ b/arch/x86/kernel/apic/apic.c
@@ -1447,6 +1447,22 @@ static void apic_pending_intr_clear(void)
 =

 	if (boot_cpu_has(X86_FEATURE_TSC))
 		tsc =3D rdtsc();
+
+	{
+		for (i =3D APIC_ISR_NR - 1; i >=3D 0; i--) {
+			queued =3D apic_read(APIC_IRR + i*0x10);
+
+			if (queued)
+				printk("IRR[%d]: 0x%x\n", i, queued);
+		}
+
+		for (i =3D APIC_ISR_NR - 1; i >=3D 0; i--) {
+			value =3D apic_read(APIC_ISR + i*0x10);
+			if (value)
+				printk("ISR[%d]: 0x%lx\n", i, value);
+		}
+	}
+
 	/*
 	 * After a crash, we no longer service the interrupts and a pending
 	 * interrupt from previous kernel might still have ISR bit set.
@@ -1484,6 +1500,25 @@ static void apic_pending_intr_clear(void)
 		}
 	} while (queued && max_loops > 0);
 	WARN_ON(max_loops <=3D 0);
+
+	if (max_loops <=3D 0) {
+		printk("queued =3D 0x%x acked =3D %d\n", queued, acked);
+
+		queued =3D 0;
+		for (i =3D APIC_ISR_NR - 1; i >=3D 0; i--) {
+			queued =3D apic_read(APIC_IRR + i*0x10);
+
+			if (queued)
+				printk("IRR[%d]: 0x%x\n", i, queued);
+		}
+
+		for (i =3D APIC_ISR_NR - 1; i >=3D 0; i--) {
+			value =3D apic_read(APIC_ISR + i*0x10);
+			if (value)
+				printk("ISR[%d]: 0x%lx\n", i, value);
+
+		}
+	}
 }
 =

 /**


Thanks,
Feng

--===============6355920290508599100==--

