Content-Type: multipart/mixed; boundary="===============5338747470401762412=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [nand] BUG: unable to handle kernel NULL pointer dereference at 000005f4
Date: Mon, 14 Dec 2015 20:47:19 +0800
Message-ID: <20151214124719.GA27641@wfg-t540p.sh.intel.com>
In-Reply-To: <20151214114244.7f13d408@bbrezillon>
List-Id: <oe-lkp.lists.linux.dev>

--===============5338747470401762412==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 14, 2015 at 11:42:44AM +0100, Boris Brezillon wrote:
> Hi Fengguang,
> =

> On Mon, 14 Dec 2015 14:45:37 +0800
> Fengguang Wu <fengguang.wu@intel.com> wrote:
> =

> > Hi Boris,
> > =

> > On Sun, Dec 13, 2015 at 09:50:43PM +0100, Boris Brezillon wrote:
> > > Hi Fengguang,
> > > =

> > > On Sun, 13 Dec 2015 09:49:17 +0800
> > > Fengguang Wu <fengguang.wu@intel.com> wrote:
> > > =

> > > > Hi Boris,
> > > > =

> > > > FYI, this happened when merging your branch, which indicates possib=
le
> > > > conflicts with other developer's patches or the new RC release.
> > > =

> > > Is this boot test also run on my bbrezillon-0day/nand/layering-rework
> > > branch (before merging it into devel-spot), and if it is, do you see =
the
> > > same error?
> > =

> > The bisect tests bbrezillon-0day/nand/layering-rework, however it's
> > fine there.
> > =

> > > Is the devel-spot-201512102358 tag publicly accessible? If it's not,
> > =

> > Nope.
> > =

> > > could you push it somewhere (or give me a way to generate it by
> > > pulling the relevant branches), so that I can investigate on this bug=
? =

> > =

> > Or it may be more convenient to check linux-next first?
> > =

> > FYI, the merged branches in devel-spot-201512102358 are:
> > =

> > af8fc33 Merge 'bbrezillon-0day/nand/layering-rework' into devel-spot-20=
1512102358
> > acfc1de Merge 'linux-review/Maury-Markowitz/renaming-NTSC-file-because-=
it-doesnt-actually-use-8VSV-updating-channel-listings-add-channel-numbers/2=
0151210-210449' into devel-spot-201512102358
> > fb9daac Merge 'fdmanana/integration-4.4' into devel-spot-201512102358
> > 1b30725 Merge 'fdmanana/for-chris-4.4' into devel-spot-201512102358
> > 83f2246 Merge 'arm-integrator/realview-defconfig' into devel-spot-20151=
2102358
> > 03df745 Merge 'arm-integrator/realview-multiplatform-base' into devel-s=
pot-201512102358
> > d2aea29 Merge 'linux-review/Arnd-Bergmann/i2c-allow-building-emev2-with=
out-slave-mode-again/20151210-211642' into devel-spot-201512102358
> > e2f041d Merge 'arm-integrator/realview-base-armsoc' into devel-spot-201=
512102358
> > 5c46550 Merge 'linux-review/Bert-Kenward/sfc-only-use-RSS-filters-if-we=
-re-using-RSS/20151210-213247' into devel-spot-201512102358
> > d07f80f Merge 'sound/test/hdmi-jack' into devel-spot-201512102358
> > 540f8b7 Merge 'sound/topic/hdmi-jack' into devel-spot-201512102358
> > 9111fa0 Merge 'linux-review/matrandg-cisco-com/tc358743-Use-local-array=
-with-fixed-size-in-i2c-write/20151210-214154' into devel-spot-201512102358
> > 3d81ef9 Merge 'linux-review/matrandg-cisco-com/tc358743-Print-timings-o=
nly-when-debug-level-is-set/20151210-220321' into devel-spot-201512102358
> > 122e43c Merge 'bbrezillon-0day/nand/ecclayout-squashed' into devel-spot=
-201512102358
> > e0572f8 Merge 'wireless-drivers-next/pending' into devel-spot-201512102=
358
> > dc5d9c9 Merge 'linux-review/Geliang-Tang/list-introduce-list_is_first/2=
0151210-222552' into devel-spot-201512102358
> > 289e2a8 Merge 'linux-review/Arnd-Bergmann/staging-davinci_vfpe-allow-mo=
dular-build/20151210-223348' into devel-spot-201512102358
> > d74c50d Merge 'linux-review/Damien-Horsley/Add-driver-for-Pistachio-int=
ernal-DAC/20151210-224304' into devel-spot-201512102358
> > ee3c58b Merge 'cryptodev/master' into devel-spot-201512102358
> > d390f7d Merge 'linux-review/John-Garry/hisi_sas-use-platform_get_irq/20=
151210-224851' into devel-spot-201512102358
> > de31f5d Merge 'linux-review/Mike-Marciniszyn/staging-rdma-hfi1-add-defi=
nitions-for-OPA-traps/20151210-230158' into devel-spot-201512102358
> > 5618568 Merge 'linux-review/Andrei-Emeltchenko/Bluetooth-h5-Do-not-init=
ialize-Configuration-field/20151210-230440' into devel-spot-201512102358
> > 759aa32 Merge 'linux-review/Moritz-K-nig/staging-COMEDI-checkpatch-pl-c=
leanups-in-comedi-h/20151210-230707' into devel-spot-201512102358
> > 2edcbb4 Merge 'linux-review/Andy-Shevchenko/net-hns-annotate-IO-address=
-space-properly/20151210-232510' into devel-spot-201512102358
> > 0f51fdd Merge 'integrity/next-kexec' into devel-spot-201512102358
> > b32bcbc Merge 'dm/dm-4.5' into devel-spot-201512102358
> > ea297f5 Merge 'linux-review/Mathieu-Desnoyers/thread_local_abi-system-c=
all-caching-current-CPU-number-x86/20151210-234242' into devel-spot-2015121=
02358
> > 52bc163 Merge 'linux-review/yegorslists-googlemail-com/USB-serial-optio=
n-add-support-for-Quectel-UC20/20151210-234659' into devel-spot-201512102358
> > 797cc7c Merge 'linux-review/Andy-Shevchenko/staging-rtl8188eu-provide-a=
n-absolute-path-to-include-folder/20151210-234752' into devel-spot-20151210=
2358
> > 23d8b49 Merge 'omap-dss2/for-next' into devel-spot-201512102358
> > 88a768f 0day base guard for 'devel-spot-201512102358'
> > 527e931 Linux 4.4-rc4
> > =

> > > > =

> > > > linux-next/master also has the problem.
> > > =

> > > Okay. You mean linux-next/master alone, or after merging my branch in=
to
> > > linux-next/master?
> > =

> > It's stand alone linux-next/master as indicated by the bisect log.
> > Does it include any of your patches?
> =

> I tried to boot the next-20151214 build, before [1] and after [2]
> merging my nand/layering-rework branch merged into it, and both are
> booting fine.

Are you using the emailed kconfig? I'd not recommend try the below
step if cannot even reproduce the issue in linux-next.

Thanks,
Fengguang

> I'll try to recreate your devel-spot locally and see if I can reproduce
> the bug.
> =

> Best Regards,
> =

> Boris
> =

> [1]http://paste.debian.net/344112/
> [2]http://paste.debian.net/344125/
> =

> -- =

> Boris Brezillon, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

--===============5338747470401762412==--

