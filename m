Content-Type: multipart/mixed; boundary="===============2196230440580626485=="
MIME-Version: 1.0
From: Masami Hiramatsu <mhiramat@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [kprobes] e1ce3eee7d: BUG:using_smp_processor_id()in_preemptible
Date: Thu, 14 Sep 2017 17:12:01 -0700
Message-ID: <20170914171201.8c4e5c992b06896b595799dd@kernel.org>
In-Reply-To: <20170914042832.GB17166@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============2196230440580626485==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 14 Sep 2017 12:28:32 +0800
kernel test robot <xiaolong.ye@intel.com> wrote:

> =

> FYI, we noticed the following commit:
> =

> commit: e1ce3eee7dcda03f2b2f2d64e2cb2f3a993a3b34 ("kprobes: Use synchroni=
ze_rcu_tasks() for optprobe with CONFIG_PREEMPT")
> url: https://github.com/0day-ci/linux/commits/Masami-Hiramatsu/kprobes-Us=
e-synchronize_rcu_tasks-for-optprobe-with-CONFIG_PREEMPT/20170913-034557
> =

> =

> in testcase: boot
> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu Haswell,+smep,+smap =
-smp 2 -m 512M =

> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):

Hmm, I still couldn't reproduce this bug in my environment...
I found suspicious code, but it doesn't cause below BUG yet.
I've made a kernel with given config (but change all =3Dm to =3Dn, since kb=
uild builds modules even if I specify bzImage as the target, possibly a kbu=
ild bug?)
BTW, above test command seems not enough, since there is no kernel and kern=
el parameters specified. =


Thank you,

> =

> =

> +--------------------------------------------+------------+------------+
> |                                            | 80cee03bf1 | e1ce3eee7d |
> +--------------------------------------------+------------+------------+
> | boot_successes                             | 28         | 5          |
> | boot_failures                              | 0          | 23         |
> | BUG:using_smp_processor_id()in_preemptible | 0          | 23         |
> +--------------------------------------------+------------+------------+
> =

> =

> =

> [   14.675660] BUG: using smp_processor_id() in preemptible [00000000] co=
de: swapper/0/1
> [   14.700932] caller is debug_smp_processor_id+0x17/0x20
> [   14.725623] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 4.13.0-06467-ge1=
ce3ee #2
> [   14.729560] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.9.3-20161025_171302-gandalf 04/01/2014
> [   14.772244] Call Trace:
> [   14.772244]  dump_stack+0x65/0x87
> [   14.772244]  check_preemption_disabled+0xda/0xe0
> [   14.772244]  debug_smp_processor_id+0x17/0x20
> [   14.772244]  optimized_callback+0x1f/0xf0
> [   14.772244]  0xffffffffa0002370
> [   14.772244]  ? init_test_probes+0x2cf/0x530
> [   14.772244]  init_kprobes+0x1e6/0x1f1
> [   14.772244]  ? debugfs_kprobe_init+0xa5/0xa5
> [   14.772244]  do_one_initcall+0x4e/0x190
> [   14.772244]  kernel_init_freeable+0x113/0x194
> [   14.772244]  ? rest_init+0x130/0x130
> [   14.772244]  kernel_init+0x9/0xf2
> [   14.772244]  ret_from_fork+0x25/0x30
> [   16.007679] Kprobe smoke test: passed successfully
> [   16.025466] Initialise system trusted keyrings
> [   16.062596] workingset: timestamp_bits=3D46 max_order=3D17 bucket_orde=
r=3D0
> [   16.151965] efs: 1.0a - http://aeschi.ch.eu.org/efs/
> [   16.164959] fuse init (API version 7.26)
> [   16.183177] orangefs_debugfs_init: called with debug mask: :none: :0:
> [   16.196644] orangefs_init: module version upstream loaded
> [   16.209245] NILFS version 2 loaded
> [   16.226230] gfs2: GFS2 installed
> [   16.326266] NET: Registered protocol family 38
> [   16.344018] Key type asymmetric registered
> [   16.353442] Asymmetric key parser 'x509' registered
> [   16.364981] Block layer SCSI generic (bsg) driver version 0.4 loaded (=
major 249)
> [   16.382476] io scheduler noop registered
> [   16.392812] io scheduler cfq registered (default)
> [   16.405978] test_printf: all 260 tests passed
> [   16.432644] crc32: CRC_LE_BITS =3D 64, CRC_BE BITS =3D 64
> [   16.443171] crc32: self tests passed, processed 225944 bytes in 230745=
8 nsec
> [   16.456977] crc32c: CRC_LE_BITS =3D 64
> [   16.464432] crc32c: self tests passed, processed 225944 bytes in 62021=
4 nsec
> [   16.636881] crc32_combine: 8373 self tests passed
> [   16.770158] crc32c_combine: 8373 self tests passed
> [   16.784290] switchtec: loaded.
> [   16.791607] rivafb_setup START
> [   16.801335] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/in=
put/input0
> [   16.817701] ACPI: Power Button [PWRF]
> [   16.848025] HDLC line discipline maxframe=3D4096
> [   16.859952] N_HDLC line discipline registered.
> [   16.874756] r3964: Philips r3964 Driver $Revision: 1.10 $
> [   16.886652] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
> [   16.983539] 00:05: ttyS0 at I/O 0x3f8 (irq =3D 4, base_baud =3D 115200=
) is a 16550A
> [   17.114800] 00:06: ttyS1 at I/O 0x2f8 (irq =3D 3, base_baud =3D 115200=
) is a 16550A
> [   17.138674] MOXA Intellio family driver version 6.0k
> [   17.151640] SyncLink serial driver $Revision: 4.38 $
> [   17.232501] SyncLink serial driver $Revision: 4.38 $, tty major#244
> [   17.248116] Non-volatile memory driver v1.3
> [   17.258912] telclk_interrupt =3D 0xf non-mcpbl0010 hw.
> [   17.304320] Floppy drive(s): fd0 is 2.88M AMI BIOS
> [   17.309997] loop: module loaded
> [   17.344349] null: module loaded
> [   17.352804] dummy-irq: no IRQ given.  Use irq=3DN
> [   17.365157] Silicon Labs C2 port support v. 0.51.0 - (C) 2007 Rodolfo =
Giometti
> [   17.381691] FDC 0 is a S82078B
> [   17.395387] c2port c2port0: C2 port uc added
> [   17.405402] c2port c2port0: uc flash has 30 blocks x 512 bytes (15360 =
bytes total)
> [   17.425464] Uniform Multi-Platform E-IDE driver
> [   17.437073] Loading iSCSI transport class v2.0-870.
> [   17.455730] aic94xx: Adaptec aic94xx SAS/SATA driver version 1.0.3 loa=
ded
> [   17.478968] iscsi: registered transport (qla4xxx)
> [   17.492261] QLogic iSCSI HBA Driver
> [   17.502789] mpt3sas version 15.100.00.00 loaded
> [   17.516825] VMware PVSCSI driver - version 1.0.7.0-k
> [   17.568251] scsi host0: scsi_debug: version 1.86 [20160430]
> [   17.568251]   dev_size_mb=3D8, opts=3D0x0, submit_queues=3D1, statisti=
cs=3D0
> [   17.599319] scsi 0:0:0:0: Direct-Access     Linux    scsi_debug       =
0186 PQ: 0 ANSI: 7
> [   17.622753] scsi 0:0:0:0: Attached scsi generic sg0 type 0
> [   17.652924] platform physmap-flash.0: failed to claim resource 0: [mem=
 0x08000000-0x07ffffff]
> [   17.672329] slram: not enough parameters.
> [   17.687505] ftl_cs: FTL header not found.
> [   17.717310] vcan: Virtual CAN interface driver
> [   17.737307] slcan: serial line CAN interface driver
> [   17.753216] slcan: 10 dynamic interface channels.
> [   17.766066] CAN device driver interface
> [   17.781333] cc770: CAN netdevice driver
> [   17.793582] cc770_isa: insufficient parameters supplied
> [   17.811761] ena: Elastic Network Adapter (ENA) v1.2.0k
> [   17.838306] Intel(R) Ethernet Switch Host Interface Driver - version 0=
.21.7-k
> [   17.860645] Copyright(c) 2013 - 2017 Intel Corporation.
> [   17.883557] ns83820.c: National Semiconductor DP83820 10/100/1000 driv=
er.
> [   17.902174] nfp: NFP PCIe Driver, Copyright (C) 2014-2017 Netronome Sy=
stems
> [   17.923819] PPP generic driver version 2.4.2
> [   17.938243] PPP Deflate Compression module registered
> [   17.955252] PPP MPPE Compression module registered
> [   17.971135] Fusion MPT base driver 3.04.20
> [   17.983899] Copyright (c) 1999-2008 LSI Corporation
> [   17.999048] Fusion MPT SPI Host driver 3.04.20
> [   18.023653] Fusion MPT SAS Host driver 3.04.20
> [   18.052566] Fusion MPT misc device (ioctl) driver 3.04.20
> [   18.083344] mptctl: Registered with Fusion MPT base driver
> [   18.098123] mptctl: /dev/mptctl @ (major,minor=3D10,220)
> [   18.124512] aoe: AoE v85 initialised.
> [   18.137382] i8042: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU] at 0=
x60,0x64 irq 1,12
> [   18.170754] serio: i8042 KBD port at 0x60,0x64 irq 1
> =

> =

> To reproduce:
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script  # job-script is attached in=
 this email
> =

> =

> =

> Thanks,
> Xiaolong


-- =

Masami Hiramatsu <mhiramat@kernel.org>

--===============2196230440580626485==--

