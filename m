Content-Type: multipart/mixed; boundary="===============8781089185644883759=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [nand] BUG: unable to handle kernel NULL pointer dereference at 000005f4
Date: Mon, 14 Dec 2015 14:45:37 +0800
Message-ID: <20151214064537.GA5341@wfg-t540p.sh.intel.com>
In-Reply-To: <20151213215043.15d864da@bbrezillon>
List-Id: <oe-lkp.lists.linux.dev>

--===============8781089185644883759==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Boris,

On Sun, Dec 13, 2015 at 09:50:43PM +0100, Boris Brezillon wrote:
> Hi Fengguang,
> =

> On Sun, 13 Dec 2015 09:49:17 +0800
> Fengguang Wu <fengguang.wu@intel.com> wrote:
> =

> > Hi Boris,
> > =

> > FYI, this happened when merging your branch, which indicates possible
> > conflicts with other developer's patches or the new RC release.
> =

> Is this boot test also run on my bbrezillon-0day/nand/layering-rework
> branch (before merging it into devel-spot), and if it is, do you see the
> same error?

The bisect tests bbrezillon-0day/nand/layering-rework, however it's
fine there.

> Is the devel-spot-201512102358 tag publicly accessible? If it's not,

Nope.

> could you push it somewhere (or give me a way to generate it by
> pulling the relevant branches), so that I can investigate on this bug? =


Or it may be more convenient to check linux-next first?

FYI, the merged branches in devel-spot-201512102358 are:

af8fc33 Merge 'bbrezillon-0day/nand/layering-rework' into devel-spot-201512=
102358
acfc1de Merge 'linux-review/Maury-Markowitz/renaming-NTSC-file-because-it-d=
oesnt-actually-use-8VSV-updating-channel-listings-add-channel-numbers/20151=
210-210449' into devel-spot-201512102358
fb9daac Merge 'fdmanana/integration-4.4' into devel-spot-201512102358
1b30725 Merge 'fdmanana/for-chris-4.4' into devel-spot-201512102358
83f2246 Merge 'arm-integrator/realview-defconfig' into devel-spot-201512102=
358
03df745 Merge 'arm-integrator/realview-multiplatform-base' into devel-spot-=
201512102358
d2aea29 Merge 'linux-review/Arnd-Bergmann/i2c-allow-building-emev2-without-=
slave-mode-again/20151210-211642' into devel-spot-201512102358
e2f041d Merge 'arm-integrator/realview-base-armsoc' into devel-spot-2015121=
02358
5c46550 Merge 'linux-review/Bert-Kenward/sfc-only-use-RSS-filters-if-we-re-=
using-RSS/20151210-213247' into devel-spot-201512102358
d07f80f Merge 'sound/test/hdmi-jack' into devel-spot-201512102358
540f8b7 Merge 'sound/topic/hdmi-jack' into devel-spot-201512102358
9111fa0 Merge 'linux-review/matrandg-cisco-com/tc358743-Use-local-array-wit=
h-fixed-size-in-i2c-write/20151210-214154' into devel-spot-201512102358
3d81ef9 Merge 'linux-review/matrandg-cisco-com/tc358743-Print-timings-only-=
when-debug-level-is-set/20151210-220321' into devel-spot-201512102358
122e43c Merge 'bbrezillon-0day/nand/ecclayout-squashed' into devel-spot-201=
512102358
e0572f8 Merge 'wireless-drivers-next/pending' into devel-spot-201512102358
dc5d9c9 Merge 'linux-review/Geliang-Tang/list-introduce-list_is_first/20151=
210-222552' into devel-spot-201512102358
289e2a8 Merge 'linux-review/Arnd-Bergmann/staging-davinci_vfpe-allow-modula=
r-build/20151210-223348' into devel-spot-201512102358
d74c50d Merge 'linux-review/Damien-Horsley/Add-driver-for-Pistachio-interna=
l-DAC/20151210-224304' into devel-spot-201512102358
ee3c58b Merge 'cryptodev/master' into devel-spot-201512102358
d390f7d Merge 'linux-review/John-Garry/hisi_sas-use-platform_get_irq/201512=
10-224851' into devel-spot-201512102358
de31f5d Merge 'linux-review/Mike-Marciniszyn/staging-rdma-hfi1-add-definiti=
ons-for-OPA-traps/20151210-230158' into devel-spot-201512102358
5618568 Merge 'linux-review/Andrei-Emeltchenko/Bluetooth-h5-Do-not-initiali=
ze-Configuration-field/20151210-230440' into devel-spot-201512102358
759aa32 Merge 'linux-review/Moritz-K-nig/staging-COMEDI-checkpatch-pl-clean=
ups-in-comedi-h/20151210-230707' into devel-spot-201512102358
2edcbb4 Merge 'linux-review/Andy-Shevchenko/net-hns-annotate-IO-address-spa=
ce-properly/20151210-232510' into devel-spot-201512102358
0f51fdd Merge 'integrity/next-kexec' into devel-spot-201512102358
b32bcbc Merge 'dm/dm-4.5' into devel-spot-201512102358
ea297f5 Merge 'linux-review/Mathieu-Desnoyers/thread_local_abi-system-call-=
caching-current-CPU-number-x86/20151210-234242' into devel-spot-201512102358
52bc163 Merge 'linux-review/yegorslists-googlemail-com/USB-serial-option-ad=
d-support-for-Quectel-UC20/20151210-234659' into devel-spot-201512102358
797cc7c Merge 'linux-review/Andy-Shevchenko/staging-rtl8188eu-provide-an-ab=
solute-path-to-include-folder/20151210-234752' into devel-spot-201512102358
23d8b49 Merge 'omap-dss2/for-next' into devel-spot-201512102358
88a768f 0day base guard for 'devel-spot-201512102358'
527e931 Linux 4.4-rc4

> > =

> > linux-next/master also has the problem.
> =

> Okay. You mean linux-next/master alone, or after merging my branch into
> linux-next/master?

It's stand alone linux-next/master as indicated by the bisect log.
Does it include any of your patches?

> > commit af8fc334a121611474134e68e154fd9a6deea96a
> > Merge: acfc1de 8b402c3
> > Author:     0day robot <fengguang.wu@intel.com>
> > AuthorDate: Fri Dec 11 00:00:09 2015 +0800
> > Commit:     0day robot <fengguang.wu@intel.com>
> > CommitDate: Fri Dec 11 00:00:09 2015 +0800
> > =

> >     Merge 'bbrezillon-0day/nand/layering-rework' into devel-spot-201512=
102358
> > =

> > +------------------------------------------+------------+------------+-=
-----------+------------+
> > |                                          | acfc1de1e0 | 8b402c389e | =
af8fc334a1 | 2f36956512 |
> > +------------------------------------------+------------+------------+-=
-----------+------------+
> > | boot_successes                           | 88         | 63         | =
0          | 0          |
> > | boot_failures                            | 2          | 0          | =
26         | 19         |
> > | BUG:kernel_boot_hang                     | 2          | 0          | =
2          |            |
> > | BUG:unable_to_handle_kernel              | 0          | 0          | =
24         | 19         |
> > | Oops                                     | 0          | 0          | =
24         | 19         |
> > | EIP_is_at_nand_transfer_oob              | 0          | 0          | =
24         | 19         |
> > | Kernel_panic-not_syncing:Fatal_exception | 0          | 0          | =
24         | 19         |
> > | backtrace:nand_default_bbt               | 0          | 0          | =
24         | 19         |
> > | backtrace:ns_init_module                 | 0          | 0          | =
24         | 19         |
> > | backtrace:kernel_init_freeable           | 0          | 0          | =
24         | 19         |
> > +------------------------------------------+------------+------------+-=
-----------+------------+
> > =

> > [   14.253825] sector address bytes: 3
> > [   14.254636] options: 0x42
> > [   14.255940] Scanning device for bad blocks
> > [   14.256950] BUG: unable to handle kernel NULL pointer dereference at=
 000005f4
> > [   14.258509] IP: [<c18e4b9b>] nand_transfer_oob+0x3b/0x220
> > [   14.259810] *pde =3D 00000000 =

> > [   14.260629] Oops: 0000 [#1] PREEMPT SMP =

> > [   14.261767] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 4.4.0-rc4-0218=
5-gaf8fc33 #2
> > [   14.263387] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), B=
IOS Debian-1.8.2-1 04/01/2014
> > [   14.284272] task: d05d0000 ti: d05d8000 task.ti: d05d8000
> > [   14.285392] EIP: 0060:[<c18e4b9b>] EFLAGS: 00010297 CPU: 1
> > [   14.303080] EIP is at nand_transfer_oob+0x3b/0x220
> > [   14.304251] EAX: d05d9e74 EBX: d05d9e60 ECX: 00000010 EDX: 00000000
> > [   14.305527] ESI: 00000000 EDI: 00000010 EBP: d05d9dc4 ESP: d05d9da0
> > [   14.313613]  DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068
> > [   14.314765] CR0: 8005003b CR2: 000005f4 CR3: 023f6000 CR4: 00000690
> > [   14.316041] Stack:
> > [   14.330028]  00000000 d04fa000 d04fa000 d1d3cc2c d05d9dc4 c18e2931 d=
05d9e60 d04fa000
> > [   14.332796]  00000010 d05d9e10 c18e5dd9 d05d9e74 00000010 00000000 0=
0000000 00000000
> > [   14.335580]  00000010 d05d9e74 d1d3cc2c 00000000 00000010 00000000 0=
0000000 00000000
> > [   14.340054] Call Trace:
> > [   14.340806]  [<c18e2931>] ? nand_read_oob_std+0x31/0x40
> > [   14.342115]  [<c18e5dd9>] nand_read_oob+0x239/0x350
> > [   14.343337]  [<c18e5ba0>] ? nand_do_read_ops+0x610/0x610
> > [   14.344621]  [<c18c412e>] mtd_read_oob+0x2e/0x70
> > [   14.345788]  [<c18e8692>] create_bbt+0x122/0x260
> > [   14.346952]  [<c1078671>] ? __might_sleep+0x31/0xa0
> > [   14.348217]  [<c18ea508>] nand_default_bbt+0x678/0x760
> > [   14.370976]  [<c105229a>] ? put_online_cpus+0x3a/0x80
> > [   14.372219]  [<c2367661>] ? ns_init_module+0xc0d/0xd22
> > [   14.373483]  [<c23676a3>] ns_init_module+0xc4f/0xd22
> > [   14.374725]  [<c2366a54>] ? inftl_scan_bbt+0x49a/0x49a
> > [   14.375984]  [<c232fc65>] do_one_initcall+0x15f/0x16e
> > [   14.377222]  [<c106b59f>] ? parse_args+0x25f/0x420
> > [   14.380154]  [<c232fd70>] kernel_init_freeable+0xfc/0x179
> > [   14.381531]  [<c1cf39ab>] kernel_init+0xb/0xe0
> > [   14.382727]  [<c1074520>] ? schedule_tail+0x20/0x80
> > [   14.384002]  [<c1cfd129>] ret_from_kernel_thread+0x21/0x38
> > [   14.385370]  [<c1cf39a0>] ? rest_init+0xb0/0xb0
> > [   14.386330] Code: 80 ec 00 00 00 89 55 e8 89 45 dc 74 4b 72 11 83 f9=
 02 74 0c 0f 0b 8d 76 00 8d bc 27 00 00 00 00 8b 45 08 8b 55 dc 8b 4d 0c 8b=
 30 <8b> 9a f4 05 00 00 8b 45 e8 01 de 83 f9 08 89 c7 0f 83 47 01 00
> > [   14.395572] EIP: [<c18e4b9b>] nand_transfer_oob+0x3b/0x220 SS:ESP 00=
68:d05d9da0
> > [   14.397476] CR2: 00000000000005f4
> > [   14.398286] ---[ end trace 515ef95ee551d435 ]---
> > [   14.399461] Kernel panic - not syncing: Fatal exception
> =

> =

> I had a quick look at the changes made in my patchset, and I didn't
> find any obvious errors. I'll try to test the nandsim driver tomorrow.

OK. If the script in the original email can help you reproduce the
problem, it'd be great.

> BTW, the backtrace looks a bit weird to me, it mixes nandsim functions
> (ns_init_module()) with diskonchip functions (inftl_scan_bbt()), which,
> AFAIK, is not supposed to happen.

Thanks,
Fengguang

--===============8781089185644883759==--

