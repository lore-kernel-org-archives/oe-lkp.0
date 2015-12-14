Content-Type: multipart/mixed; boundary="===============2390127331255025487=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [nand] BUG: unable to handle kernel NULL pointer dereference at 000005f4
Date: Mon, 14 Dec 2015 21:44:37 +0800
Message-ID: <20151214134437.GA2003@wfg-t540p.sh.intel.com>
In-Reply-To: <20151214143613.68b08833@bbrezillon>
List-Id: <oe-lkp.lists.linux.dev>

--===============2390127331255025487==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 14, 2015 at 02:36:13PM +0100, Boris Brezillon wrote:
> On Mon, 14 Dec 2015 21:12:47 +0800
> Fengguang Wu <fengguang.wu@intel.com> wrote:
> =

> > On Mon, Dec 14, 2015 at 02:04:33PM +0100, Boris Brezillon wrote:
> > > On Mon, 14 Dec 2015 13:58:09 +0100
> > > Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
> > > =

> > > > On Mon, 14 Dec 2015 20:47:19 +0800
> > > > Fengguang Wu <fengguang.wu@intel.com> wrote:
> > > > =

> > > > > On Mon, Dec 14, 2015 at 11:42:44AM +0100, Boris Brezillon wrote:
> > > > > > Hi Fengguang,
> > > > > > =

> > > > > > On Mon, 14 Dec 2015 14:45:37 +0800
> > > > > > Fengguang Wu <fengguang.wu@intel.com> wrote:
> > > > > > =

> > > > > > > Hi Boris,
> > > > > > > =

> > > > > > > On Sun, Dec 13, 2015 at 09:50:43PM +0100, Boris Brezillon wro=
te:
> > > > > > > > Hi Fengguang,
> > > > > > > > =

> > > > > > > > On Sun, 13 Dec 2015 09:49:17 +0800
> > > > > > > > Fengguang Wu <fengguang.wu@intel.com> wrote:
> > > > > > > > =

> > > > > > > > > Hi Boris,
> > > > > > > > > =

> > > > > > > > > FYI, this happened when merging your branch, which indica=
tes possible
> > > > > > > > > conflicts with other developer's patches or the new RC re=
lease.
> > > > > > > > =

> > > > > > > > Is this boot test also run on my bbrezillon-0day/nand/layer=
ing-rework
> > > > > > > > branch (before merging it into devel-spot), and if it is, d=
o you see the
> > > > > > > > same error?
> > > > > > > =

> > > > > > > The bisect tests bbrezillon-0day/nand/layering-rework, howeve=
r it's
> > > > > > > fine there.
> > > > > > > =

> > > > > > > > Is the devel-spot-201512102358 tag publicly accessible? If =
it's not,
> > > > > > > =

> > > > > > > Nope.
> > > > > > > =

> > > > > > > > could you push it somewhere (or give me a way to generate i=
t by
> > > > > > > > pulling the relevant branches), so that I can investigate o=
n this bug? =

> > > > > > > =

> > > > > > > Or it may be more convenient to check linux-next first?
> > > > > > > =

> > > > > > > FYI, the merged branches in devel-spot-201512102358 are:
> > > > > > > =

> > > > > > > af8fc33 Merge 'bbrezillon-0day/nand/layering-rework' into dev=
el-spot-201512102358
> > > > > > > acfc1de Merge 'linux-review/Maury-Markowitz/renaming-NTSC-fil=
e-because-it-doesnt-actually-use-8VSV-updating-channel-listings-add-channel=
-numbers/20151210-210449' into devel-spot-201512102358
> > > > > > > fb9daac Merge 'fdmanana/integration-4.4' into devel-spot-2015=
12102358
> > > > > > > 1b30725 Merge 'fdmanana/for-chris-4.4' into devel-spot-201512=
102358
> > > > > > > 83f2246 Merge 'arm-integrator/realview-defconfig' into devel-=
spot-201512102358
> > > > > > > 03df745 Merge 'arm-integrator/realview-multiplatform-base' in=
to devel-spot-201512102358
> > > > > > > d2aea29 Merge 'linux-review/Arnd-Bergmann/i2c-allow-building-=
emev2-without-slave-mode-again/20151210-211642' into devel-spot-201512102358
> > > > > > > e2f041d Merge 'arm-integrator/realview-base-armsoc' into deve=
l-spot-201512102358
> > > > > > > 5c46550 Merge 'linux-review/Bert-Kenward/sfc-only-use-RSS-fil=
ters-if-we-re-using-RSS/20151210-213247' into devel-spot-201512102358
> > > > > > > d07f80f Merge 'sound/test/hdmi-jack' into devel-spot-20151210=
2358
> > > > > > > 540f8b7 Merge 'sound/topic/hdmi-jack' into devel-spot-2015121=
02358
> > > > > > > 9111fa0 Merge 'linux-review/matrandg-cisco-com/tc358743-Use-l=
ocal-array-with-fixed-size-in-i2c-write/20151210-214154' into devel-spot-20=
1512102358
> > > > > > > 3d81ef9 Merge 'linux-review/matrandg-cisco-com/tc358743-Print=
-timings-only-when-debug-level-is-set/20151210-220321' into devel-spot-2015=
12102358
> > > > > > > 122e43c Merge 'bbrezillon-0day/nand/ecclayout-squashed' into =
devel-spot-201512102358
> > > > > > > e0572f8 Merge 'wireless-drivers-next/pending' into devel-spot=
-201512102358
> > > > > > > dc5d9c9 Merge 'linux-review/Geliang-Tang/list-introduce-list_=
is_first/20151210-222552' into devel-spot-201512102358
> > > > > > > 289e2a8 Merge 'linux-review/Arnd-Bergmann/staging-davinci_vfp=
e-allow-modular-build/20151210-223348' into devel-spot-201512102358
> > > > > > > d74c50d Merge 'linux-review/Damien-Horsley/Add-driver-for-Pis=
tachio-internal-DAC/20151210-224304' into devel-spot-201512102358
> > > > > > > ee3c58b Merge 'cryptodev/master' into devel-spot-201512102358
> > > > > > > d390f7d Merge 'linux-review/John-Garry/hisi_sas-use-platform_=
get_irq/20151210-224851' into devel-spot-201512102358
> > > > > > > de31f5d Merge 'linux-review/Mike-Marciniszyn/staging-rdma-hfi=
1-add-definitions-for-OPA-traps/20151210-230158' into devel-spot-2015121023=
58
> > > > > > > 5618568 Merge 'linux-review/Andrei-Emeltchenko/Bluetooth-h5-D=
o-not-initialize-Configuration-field/20151210-230440' into devel-spot-20151=
2102358
> > > > > > > 759aa32 Merge 'linux-review/Moritz-K-nig/staging-COMEDI-check=
patch-pl-cleanups-in-comedi-h/20151210-230707' into devel-spot-201512102358
> > > > > > > 2edcbb4 Merge 'linux-review/Andy-Shevchenko/net-hns-annotate-=
IO-address-space-properly/20151210-232510' into devel-spot-201512102358
> > > > > > > 0f51fdd Merge 'integrity/next-kexec' into devel-spot-20151210=
2358
> > > > > > > b32bcbc Merge 'dm/dm-4.5' into devel-spot-201512102358
> > > > > > > ea297f5 Merge 'linux-review/Mathieu-Desnoyers/thread_local_ab=
i-system-call-caching-current-CPU-number-x86/20151210-234242' into devel-sp=
ot-201512102358
> > > > > > > 52bc163 Merge 'linux-review/yegorslists-googlemail-com/USB-se=
rial-option-add-support-for-Quectel-UC20/20151210-234659' into devel-spot-2=
01512102358
> > > > > > > 797cc7c Merge 'linux-review/Andy-Shevchenko/staging-rtl8188eu=
-provide-an-absolute-path-to-include-folder/20151210-234752' into devel-spo=
t-201512102358
> > > > > > > 23d8b49 Merge 'omap-dss2/for-next' into devel-spot-2015121023=
58
> > > > > > > 88a768f 0day base guard for 'devel-spot-201512102358'
> > > > > > > 527e931 Linux 4.4-rc4
> > > > > > > =

> > > > > > > > > =

> > > > > > > > > linux-next/master also has the problem.
> > > > > > > > =

> > > > > > > > Okay. You mean linux-next/master alone, or after merging my=
 branch into
> > > > > > > > linux-next/master?
> > > > > > > =

> > > > > > > It's stand alone linux-next/master as indicated by the bisect=
 log.
> > > > > > > Does it include any of your patches?
> > > > > > =

> > > > > > I tried to boot the next-20151214 build, before [1] and after [=
2]
> > > > > > merging my nand/layering-rework branch merged into it, and both=
 are
> > > > > > booting fine.
> > > > > =

> > > > > Are you using the emailed kconfig? I'd not recommend try the below
> > > > > step if cannot even reproduce the issue in linux-next.
> > > > =

> > > > Yes, I did use the config you attached in your email + the script y=
our
> > > > pasted to boot the kernel with qemu, and linux-next/master boots
> > > > correctly.
> > > > As answered in the other email I just sent, I managed to reproduce =
the
> > > > bug you're pointing after merging both
> > > > bbrezillon-0day/nand/ecclayout-squashed and
> > > > bbrezillon-0day/nand/layering-rework into linus' 4.4-rc4.
> > > > =

> > > > =

> > > =

> > > FYI, below is the patch I used to fix the bug, but I'd be interested =
in
> > > reproducing the problem you've seen on linux-next/master. Did you, by
> > > any chance, keep the branch/tag you used to trigger this bug on
> > > linux-next?
> > =

> > Yes. Bisect log shows that these 2 commits both have the bug:
> > =

> > # extra tests on tree/branch linus/master
> > git bisect  bad a80c47daa818ead2644917d72ff2a934dd64fd16  # 03:36      =
0-      1  Merge tag 'sound-4.4-rc5' of git://git.kernel.org/pub/scm/linux/=
kernel/git/tiwai/sound
> =

> I just tested this commit, and it works fine on my side...
> Could you test it again?

You are so quick! Yes sorry, it has an independent NULL pointer bug
which shows up occasionally:

[   12.547319] IRQ15 -> 0:15
[   12.548468] .................................... done.
[   12.549756] Using IPI No-Shortcut mode
[   12.551116] page_owner is disabled
[   12.560504] Btrfs loaded, assert=3Don
[   12.561866] Key type encrypted registered
[   12.572811] hd: no drives specified - use hd=3Dcyl,head,sectors on kerne=
l command line
[   12.579517] BIOS EDD facility v0.16 2004-Jun-25, 6 devices found
[   12.581027] ALSA device list:
[   12.616063]   #0: Dummy 1
[   12.621496]   #1: Loopback 1
[   12.622959] Freeing unused kernel memory: 752K (c232b000 - c23e7000)
[   12.624537] Write protecting the kernel text: 13296k
[   12.626151] Write protecting the kernel read-only data: 5188k
[   12.773226] power_supply test_ac: uevent
[   12.774285] power_supply test_ac: POWER_SUPPLY_NAME=3Dtest_ac
[   12.775584] power_supply test_ac: prop ONLINE=3D1
[   12.779504] power_supply test_battery: uevent
[   12.992439] power_supply test_ac: uevent
[   13.001889] power_supply test_ac: POWER_SUPPLY_NAME=3Dtest_ac
[   13.005496] power_supply test_ac: prop ONLINE=3D1
[   13.006817] power_supply test_ac: uevent
[   13.007779] power_supply test_ac: POWER_SUPPLY_NAME=3Dtest_ac
[   13.009023] power_supply test_ac: prop ONLINE=3D1
[   13.060458] power_supply test_battery: POWER_SUPPLY_NAME=3Dtest_battery
[   13.061843] power_supply test_battery: prop STATUS=3DDischarging
[   13.098699] power_supply test_battery: prop CHARGE_TYPE=3DFast
[   13.102617] power_supply test_battery: prop HEALTH=3DGood
[   13.107691] VFS: could not find a valid V7 on nullb1.
[   13.109527] power_supply test_battery: prop PRESENT=3D1
[   13.110696] power_supply test_battery: prop TECHNOLOGY=3DLi-ion
[   13.111991] power_supply test_battery: prop CHARGE_FULL_DESIGN=3D100
[   13.132972] blk_update_request: I/O error, dev fd0, sector 0
[   13.134261] floppy: error -5 while reading block 0
[   13.136195] UDF-fs: warning (device nullb1): udf_fill_super: No partitio=
n found (2)
[   13.138224] Mount JFS Failure: -22
[   13.139195] befs: (nullb1): ---> befs_fill_super
[   13.145252] power_supply test_battery: prop CHARGE_FULL=3D100
[   13.147566] power_supply test_battery: prop CHARGE_NOW=3D50
[   13.148807] power_supply test_battery: prop CAPACITY=3D50
[   13.151282] VFS: could not find a valid V7 on nullb0.
[   13.152800] blk_update_request: I/O error, dev fd0, sector 0
[   13.154055] floppy: error -5 while reading block 0
[   13.156211] befs: (nullb1): No write support. Marking filesystem read-on=
ly
[   13.157672] befs: (nullb1): Using x86 superblock location
[   13.158891] befs: (nullb1): invalid magic header
[   13.160628] UDF-fs: warning (device nullb0): udf_fill_super: No partitio=
n found (2)
[   13.162562] Mount JFS Failure: -22
[   13.163492] power_supply test_battery: prop CAPACITY_LEVEL=3DNormal
[   13.164826] power_supply test_battery: prop TIME_TO_EMPTY_AVG=3D3600
[   13.168161] befs: (nullb0): ---> befs_fill_super
[   13.169263] befs: (nullb0): No write support. Marking filesystem read-on=
ly
[   13.170872] F2FS-fs (nullb1): Magic Mismatch, valid(0xf2f52010) - read(0=
x555507f7)
[   13.172681] F2FS-fs (nullb1): Can't find valid F2FS filesystem in 1th su=
perblock
[   13.174493] blk_update_request: I/O error, dev fd0, sector 0
[   13.175741] floppy: error -5 while reading block 0
[   13.177178] power_supply test_battery: prop TIME_TO_FULL_NOW=3D3600
[   13.178541] power_supply test_battery: prop MODEL_NAME=3DTest battery
[   13.181684] befs: (nullb0): Using x86 superblock location
[   13.182933] power_supply test_battery: prop MANUFACTURER=3DLinux
[   13.184219] power_supply test_battery: prop SERIAL_NUMBER=3D4.4.0-rc4-00=
093-ga80c47d
[   13.186005] power_supply test_battery: prop TEMP=3D26
[   13.188144] befs: (nullb0): invalid magic header
[   13.189285] F2FS-fs (nullb0): Magic Mismatch, valid(0xf2f52010) - read(0=
x0)
[   13.190819] F2FS-fs (nullb1): Magic Mismatch, valid(0xf2f52010) - read(0=
x0)
[   13.192306] F2FS-fs (nullb1): Can't find valid F2FS filesystem in 2th su=
perblock
[   13.195074] F2FS-fs (nullb0): Can't find valid F2FS filesystem in 1th su=
perblock
[   13.196900] blk_update_request: I/O error, dev fd0, sector 0
[   13.198190] floppy: error -5 while reading block 0
[   13.200371] F2FS-fs (nullb1): Magic Mismatch, valid(0xf2f52010) - read(0=
x555507f7)
[   13.202173] F2FS-fs (nullb1): Can't find valid F2FS filesystem in 1th su=
perblock
[   13.203960] power_supply test_battery: prop VOLTAGE_NOW=3D3300
[   13.207039] power_supply test_battery: uevent
[   13.208114] power_supply test_battery: POWER_SUPPLY_NAME=3Dtest_battery
[   13.209556] F2FS-fs (nullb0): Magic Mismatch, valid(0xf2f52010) - read(0=
x9)
[   13.211029] F2FS-fs (nullb0): Can't find valid F2FS filesystem in 2th su=
perblock
[   13.212873] power_supply test_usb: uevent
[   13.213861] power_supply test_usb: POWER_SUPPLY_NAME=3Dtest_usb
[   13.215144] power_supply test_usb: prop ONLINE=3D1
[   13.217515] power_supply test_battery: prop STATUS=3DDischarging
[   13.218807] power_supply test_battery: prop CHARGE_TYPE=3DFast
[   13.220095] blk_update_request: I/O error, dev fd0, sector 0
[   13.221346] floppy: error -5 while reading block 0
[   13.222782] F2FS-fs (nullb1): Magic Mismatch, valid(0xf2f52010) - read(0=
x0)
[   13.224266] F2FS-fs (nullb1): Can't find valid F2FS filesystem in 2th su=
perblock
[   13.226687] power_supply test_battery: prop HEALTH=3DGood
[   13.227924] power_supply test_battery: prop PRESENT=3D1
[   13.229229] power_supply test_battery: prop TECHNOLOGY=3DLi-ion
[   13.230547] F2FS-fs (nullb0): Magic Mismatch, valid(0xf2f52010) - read(0=
x0)
[   13.232039] F2FS-fs (nullb0): Can't find valid F2FS filesystem in 1th su=
perblock
[   13.242809] blk_update_request: I/O error, dev fd0, sector 0
[   13.244062] floppy: error -5 while reading block 0
[   13.245636] power_supply test_usb: uevent
[   13.263093] blk_update_request: I/O error, dev fd0, sector 0
[   13.264382] floppy: error -5 while reading block 0
[   13.271971] power_supply test_usb: POWER_SUPPLY_NAME=3Dtest_usb
[   13.297889] power_supply test_battery: prop CHARGE_FULL_DESIGN=3D100
[   13.337432] blk_update_request: I/O error, dev fd0, sector 0
[   13.338722] floppy: error -5 while reading block 0
[   13.347037] F2FS-fs (nullb0): Magic Mismatch, valid(0xf2f52010) - read(0=
x9)
[   13.348529] F2FS-fs (nullb0): Can't find valid F2FS filesystem in 2th su=
perblock
[   13.360630] blk_update_request: I/O error, dev fd0, sector 0
[   13.361898] floppy: error -5 while reading block 0
[   13.416467] blk_update_request: I/O error, dev fd0, sector 0
[   13.417755] floppy: error -5 while reading block 0
[   13.467319] power_supply test_usb: prop ONLINE=3D1
[   13.472666] power_supply test_battery: prop CHARGE_FULL=3D100
[   13.490142] floppy: error -5 while reading block 0
[   13.492079] power_supply test_battery: prop CHARGE_NOW=3D50
[   13.493350] power_supply test_battery: prop CAPACITY=3D50
[   13.494555] power_supply test_battery: prop CAPACITY_LEVEL=3DNormal
[   13.495902] power_supply test_battery: prop TIME_TO_EMPTY_AVG=3D3600
[   13.519334] floppy: error -5 while reading block 0
[   13.521736] power_supply test_battery: prop TIME_TO_FULL_NOW=3D3600
[   13.523549] power_supply test_battery: prop MODEL_NAME=3DTest battery
[   13.524917] power_supply test_battery: prop MANUFACTURER=3DLinux
[   13.539749] floppy: error -5 while reading block 0
[   13.542894] power_supply test_battery: prop SERIAL_NUMBER=3D4.4.0-rc4-00=
093-ga80c47d
[   13.544793] power_supply test_battery: prop TEMP=3D26
[   13.545943] power_supply test_battery: prop VOLTAGE_NOW=3D3300
[   13.572913] floppy: error -5 while reading block 0
[   13.597396] floppy: error -5 while reading block 0
[   13.616150] floppy: error -5 while reading block 0
[   13.636152] floppy: error -5 while reading block 0
[   13.656146] floppy: error -5 while reading block 0
[   13.676160] floppy: error -5 while reading block 0
[   13.696152] floppy: error -5 while reading block 0
[   13.716152] floppy: error -5 while reading block 0
[   13.736152] floppy: error -5 while reading block 0
[   13.758396] floppy: error -5 while reading block 0
[   13.784390] floppy: error -5 while reading block 0
[   13.806150] floppy: error -5 while reading block 0
[   13.850819] floppy: error -5 while reading block 0
[   13.851977] ------------[ cut here ]------------
[   13.853076] WARNING: CPU: 0 PID: 6 at kernel/locking/lockdep.c:3183 __lo=
ck_acquire+0x99e/0xd90()
[   13.855335] DEBUG_LOCKS_WARN_ON(id >=3D MAX_LOCKDEP_KEYS)
[   13.856230] CPU: 0 PID: 6 Comm: kworker/u2:0 Not tainted 4.4.0-rc4-00093=
-ga80c47d #2
[   13.871377] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
Debian-1.8.2-1 04/01/2014
[   13.873304] Workqueue: floppy fd_timer_workfn
[   13.874385]  00000000 00000000 cece7cb0 c1487672 cece7cf0 cece7ce0 c1051=
f4e c2085bed
[   13.876896]  cece7d0c 00000006 c208f2d4 00000c6f c1095e7e c1095e7e cece8=
52c 00000003
[   13.879403]  cece8000 cece7cf8 c1051fce 00000009 cece7cf0 c2085bed cece7=
d0c cece7d30
[   13.886926] Call Trace:
[   13.887623]  [<c1487672>] dump_stack+0x4b/0x79
[   13.888636]  [<c1051f4e>] warn_slowpath_common+0x7e/0xb0
[   13.889768]  [<c1095e7e>] ? __lock_acquire+0x99e/0xd90
[   13.890965]  [<c1095e7e>] ? __lock_acquire+0x99e/0xd90
[   13.892106]  [<c1051fce>] warn_slowpath_fmt+0x2e/0x30
[   13.893105]  [<c1095e7e>] __lock_acquire+0x99e/0xd90
[   13.894281]  [<c1096b37>] lock_acquire+0x77/0xa0
[   13.895313]  [<c108ac1b>] ? complete+0x1b/0x50
[   13.896319]  [<c1cf949f>] _raw_spin_lock_irqsave+0x4f/0x70
[   13.897484]  [<c108ac1b>] ? complete+0x1b/0x50
[   13.898459]  [<c108ac1b>] complete+0x1b/0x50
[   13.912483]  [<c17cd38e>] floppy_rb0_cb+0x1e/0x50
[   13.913609]  [<c14650c8>] bio_endio+0x38/0x70
[   13.914647]  [<c1469e95>] blk_update_request+0x85/0x2c0
[   13.915822]  [<c146a0e8>] blk_update_bidi_request+0x18/0x90
[   13.917091]  [<c146a300>] __blk_end_bidi_request+0x20/0x40
[   13.918352]  [<c146a462>] __blk_end_request+0x12/0x20
[   13.919551]  [<c17ccaeb>] floppy_end_request+0x5b/0x90
[   13.920757]  [<c17ccbd7>] request_done+0xb7/0x180
[   13.921860]  [<c17ca9f8>] ? disk_change+0xd8/0x340
[   13.940617]  [<c17cfbc3>] floppy_ready+0x5c3/0x6b0
[   13.941774]  [<c1065e1a>] ? process_one_work+0xfa/0x400
[   13.942984]  [<c17ca759>] fd_timer_workfn+0x9/0x10
[   13.944132]  [<c1065e95>] process_one_work+0x175/0x400
[   13.945314]  [<c1065e1a>] ? process_one_work+0xfa/0x400
[   13.946522]  [<c1066159>] worker_thread+0x39/0x430
[   13.947671]  [<c1066120>] ? process_one_work+0x400/0x400
[   13.948897]  [<c106b9ac>] kthread+0xac/0xc0
[   13.949925]  [<c107085b>] ? finish_task_switch+0xbb/0x290
[   13.951167]  [<c1cf9f29>] ret_from_kernel_thread+0x21/0x38
[   13.952412]  [<c106b900>] ? __kthread_unpark+0x70/0x70
[   13.953601] ---[ end trace 1e31e1e3e1c50347 ]---
[   13.954713] BUG: unable to handle kernel NULL pointer dereference at   (=
null)
[   13.956462] IP: [<  (null)>]   (null)
[   13.957508] *pde =3D 00000000
[   13.958424] Oops: 0010 [#1] PREEMPT SMP
[   13.959713] CPU: 0 PID: 6 Comm: kworker/u2:0 Tainted: G        W       4=
.4.0-rc4-00093-ga80c47d #2
[   13.961774] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
Debian-1.8.2-1 04/01/2014
[   13.963837] Workqueue: floppy fd_timer_workfn
[   13.965004] task: cece8000 ti: cece6000 task.ti: cece6000
[   13.966241] EIP: 0060:[<00000000>] EFLAGS: 00010002 CPU: 0
[   13.967487] EIP is at 0x0
[   13.968257] EAX: cd6a9674 EBX: cd6a9674 ECX: 00000000 EDX: 00000003
[   13.969646] ESI: fffffff4 EDI: 00000000 EBP: cece7d70 ESP: cece7d4c
[   13.971012]  DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068
[   13.972258] CR0: 80050033 CR2: 00000000 CR3: 0d752000 CR4: 00140690
[   13.973650] Stack:
[   13.974319]  c108a415 00000000 00000001 cd6dbd48 00000003 00000000 cd6db=
d28 cd6dbd24
[   13.976968]  00000092 cece7d80 c108a6ea 00000000 00000000 cece7d94 c108a=
c30 cd6dbd20
[   13.979653]  00000000 00001000 cece7dac c17cd38e c217ba9c fffffffb cd6db=
cd0 00001000
[   13.982339] Call Trace:
[   13.983074]  [<c108a415>] ? __wake_up_common+0x45/0x70
[   13.984183]  [<c108a6ea>] __wake_up_locked+0x1a/0x20
[   13.985325]  [<c108ac30>] complete+0x30/0x50
[   13.986368]  [<c17cd38e>] floppy_rb0_cb+0x1e/0x50
[   13.987490]  [<c14650c8>] bio_endio+0x38/0x70
[   13.988539]  [<c1469e95>] blk_update_request+0x85/0x2c0
[   13.989763]  [<c146a0e8>] blk_update_bidi_request+0x18/0x90
[   13.991043]  [<c146a300>] __blk_end_bidi_request+0x20/0x40
[   13.992311]  [<c146a462>] __blk_end_request+0x12/0x20
[   13.993497]  [<c17ccaeb>] floppy_end_request+0x5b/0x90
[   13.994701]  [<c17ccbd7>] request_done+0xb7/0x180
[   13.995830]  [<c17ca9f8>] ? disk_change+0xd8/0x340
[   13.996963]  [<c17cfbc3>] floppy_ready+0x5c3/0x6b0
[   13.998103]  [<c1065e1a>] ? process_one_work+0xfa/0x400
[   13.999312]  [<c17ca759>] fd_timer_workfn+0x9/0x10
[   14.000477]  [<c1065e95>] process_one_work+0x175/0x400
[   14.001643]  [<c1065e1a>] ? process_one_work+0xfa/0x400
[   14.002815]  [<c1066159>] worker_thread+0x39/0x430
[   14.004015]  [<c1066120>] ? process_one_work+0x400/0x400
[   14.005207]  [<c106b9ac>] kthread+0xac/0xc0
[   14.006222]  [<c107085b>] ? finish_task_switch+0xbb/0x290
[   14.007442]  [<c1cf9f29>] ret_from_kernel_thread+0x21/0x38
[   14.008679]  [<c106b900>] ? __kthread_unpark+0x70/0x70
[   14.009956] Code:  Bad EIP value.
[   14.011033] EIP: [<00000000>] 0x0 SS:ESP 0068:cece7d4c
[   14.012440] CR2: 0000000000000000
[   14.013384] ---[ end trace 1e31e1e3e1c50348 ]---
[   14.014494] Kernel panic - not syncing: Fatal exception
[   14.015702] Kernel Offset: disabled

> > # extra tests on tree/branch linux-next/master
> > git bisect  bad 8225f4e85cb03daea14661380745886ce01fd83a  # 03:42      =
0-      3  Add linux-next specific files for 20151210
> =

> Hm, unfortunately I can't checkout this commit (it comes from linux-next
> and it's been rebased/regenerated since then).

Sorry, that's one more independent NULL pointer bug.
There are so many noises!

[    9.918393] floppy: error -5 while reading block 0
[    9.938396] floppy: error -5 while reading block 0
Kernel tests: Boot OK!
[   10.649260] random: trinity urandom read with 53 bits of entropy availab=
le
[   20.702989] sock: process `trinity-main' is using obsolete setsockopt SO=
_BSDCOMPAT
[   20.825027] BUG: unable to handle kernel NULL pointer dereference at 000=
0019c
[   20.825033] IP: [<c10deef1>] perf_prepare_sample+0x271/0x3a0
[   20.825034] *pde =3D 00000000 =

[   20.825036] Oops: 0000 [#1] PREEMPT SMP =

[   20.825039] CPU: 0 PID: 686 Comm: trinity-main Not tainted 4.4.0-rc4-nex=
t-20151210 #1
[   20.825040] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
Debian-1.8.2-1 04/01/2014
[   20.825041] task: cd6bad00 ti: cd49e000 task.ti: cd49e000
[   20.825042] EIP: 0060:[<c10deef1>] EFLAGS: 00010006 CPU: 0
[   20.825043] EIP is at perf_prepare_sample+0x271/0x3a0
[   20.825044] EAX: 0000019c EBX: cd49fd54 ECX: cd49fe40 EDX: 0d64b000
[   20.825045] ESI: 0002e3e9 EDI: cd71d800 EBP: cd49fd3c ESP: cd49fd24
[   20.825046]  DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068
[   20.825046] CR0: 80050033 CR2: 0000019c CR3: 0db9e000 CR4: 00140690
[   20.825049] Stack:
[   20.825052]  00000000 00000000 cd49fe40 cd71d800 cd49fe40 cfa4da40 cd49f=
d80 c10df073
[   20.825059]  cfa4da40 00000000 00000000 c10df020 00000009 00500001 cd6ba=
d00 01000002
[   20.825062]  00000002 00000000 00000000 cd71d800 00000000 cd71d800 00000=
000 cd49fda8
[   20.825062] Call Trace:
[   20.825065]  [<c10df073>] perf_event_output+0x53/0xb0
[   20.825066]  [<c10df020>] ? perf_prepare_sample+0x3a0/0x3a0
[   20.825068]  [<c10df305>] __perf_event_overflow+0x235/0x260
[   20.825070]  [<c10dfb9f>] perf_swevent_overflow+0x4f/0x90
[   20.825071]  [<c10dfcad>] perf_swevent_event+0xcd/0x100
[   20.825073]  [<c10e0154>] ___perf_sw_event+0x1c4/0x220
[   20.825075]  [<c10dffb2>] ? ___perf_sw_event+0x22/0x220
[   20.825077]  [<c10945b6>] ? __lock_is_held+0x46/0x60
[   20.825080]  [<c1d0b8a2>] ? schedule+0x32/0x90
[   20.825082]  [<c10959b0>] ? __lock_acquire+0x4c0/0xd90
[   20.825083]  [<c10945b6>] ? __lock_is_held+0x46/0x60
[   20.825084]  [<c10945b6>] ? __lock_is_held+0x46/0x60
[   20.825085]  [<c1d0b381>] __schedule+0x511/0x9d0
[   20.825086]  [<c1d0b8a2>] schedule+0x32/0x90
[   20.825088]  [<c1000dd0>] exit_to_usermode_loop+0x70/0xa0
[   20.825090]  [<c1001047>] prepare_exit_to_usermode+0x27/0x30
[   20.825092]  [<c1d10e3a>] resume_userspace+0xe/0x14
[   20.825093]  [<c1d10000>] ? ldsem_down_read+0x10/0x90
[   20.825111] Code: 00 00 00 c7 41 3c 00 00 00 00 89 41 38 0f 84 0c fe ff =
ff 8b 55 08 89 f8 e8 6d 3e 00 00 8b 4d f0 85 c0 89 41 68 0f 84 ff 00 00 00 =
<8b> 00 8d 04 c5 08 00 00 00 0f b7 c0 66 01 43 06 e9 df fd ff ff
[   20.825113] EIP: [<c10deef1>] perf_prepare_sample+0x271/0x3a0 SS:ESP 006=
8:cd49fd24
[   20.825114] CR2: 000000000000019c
[   20.825116] ---[ end trace ea295fc74974f372 ]---
[   20.825117] Kernel panic - not syncing: Fatal exception

Thanks,
Fengguang

--===============2390127331255025487==--

