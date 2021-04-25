Content-Type: multipart/mixed; boundary="===============0956683970645376658=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [drm/i915/dp] 4a8d79901d: WARNING:at_drivers/gpu/drm/i915/display/intel_display_power.c:#assert_can_disable_lcpll[i915]
Date: Sun, 25 Apr 2021 08:56:17 +0800
Message-ID: <20210425005610.GA5251@xsang-OptiPlex-9020>
In-Reply-To: <3f97d13aab87ca8023f6607b419e3c0f3249871a.camel@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0956683970645376658==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hi, Lyude Paul,

On Fri, Apr 09, 2021 at 04:30:55PM -0400, Lyude Paul wrote:
> Could you retest this against the latest drm-tip? I pushed something that=
 I
> think might fix this

sorry for late.
we tested on the tip for drm-tip several days ago, confirmed the issue was =
gone.

the test commit is:
commit 0d733c1e940857595e3f647dd59bf98c126806c4
Author:     Ville Syrj<C3><A4>l<C3><A4> <ville.syrjala@linux.intel.com>
AuthorDate: Wed Apr 21 02:02:02 2021 +0300
Commit:     Ville Syrj<C3><A4>l<C3><A4> <ville.syrjala@linux.intel.com>
CommitDate: Wed Apr 21 02:02:02 2021 +0300

    drm-tip: 2021y-04m-20d-23h-01m-26s UTC integration manifest

on repo:
git://anongit.freedesktop.org/drm/drm-tip
branch: drm-tip

> =

> On Thu, 2021-03-25 at 21:53 +0800, Oliver Sang wrote:
> > Hi, Lyude,
> > =

> > On Tue, Mar 23, 2021 at 01:27:29PM -0400, Lyude Paul wrote:
> > > BTW Oliver - I'm still happy to look at this issue, I just need the e=
xtra
> > > logs I
> > > mentioned below in order to figure out what's going on here
> > =

> > I enabled "drm.debug=3D0x16 log_buf_len=3D5M" and got attached kmsg.xz =
for
> > 4a8d79901d.
> > hope it's useful.
> > =

> > > =

> > > On Thu, 2021-03-18 at 13:16 -0400, Lyude Paul wrote:
> > > > Well this is surprising, because I had been pretty sure we had asked
> > > > someone
> > > > at
> > > > Intel to test that this patch worked on samus and they had said tha=
t it
> > > > did. =

> > > > =

> > > > Is there any way you can get me the kernel messages from this failu=
re with
> > > > drm.debug=3D0x16 log_buf_len=3D5M added to the kernel commandline? =
It's hard
> > > > to
> > > > see
> > > > what's actually going on here that's causing this issue to still re=
occur.
> > > > =

> > > > Also adding Tomi P Sarvela onto this thread, since they were the on=
es who
> > > > originally tested this
> > > > =

> > > > On Thu, 2021-03-18 at 10:13 +0800, Oliver Sang wrote:
> > > > > Hi Lyude, sorry for later.
> > > > > =

> > > > > before we send out the report, we also tested fe7d52bccab6, the i=
ssue
> > > > > still
> > > > > exists on it.
> > > > > attached one kmsg-fe7d52bccab6.xz FYI.
> > > > > =

> > > > > we also tested on latest v5.12-rc3, also exists.
> > > > > attached kmsg-v5.12-rc3.xz FYI.
> > > > > =

> > > > > =

> > > > > =

> > > > > On Fri, Feb 05, 2021 at 02:53:11PM -0500, Lyude Paul wrote:
> > > > > > Am I right in assuming this is likely a very delayed test resul=
t from
> > > > > > before:
> > > > > > =

> > > > > > fe7d52bccab6 ("drm/i915/dp: Don't use DPCD backlights that need=
 PWM
> > > > > > enable/disable")
> > > > > > =

> > > > > > Made it into the kernel? I see that there's a PWM being left on=
, which
> > > > > > was
> > > > > > the
> > > > > > same issue we were seeing on fi-bdw-samus
> > > > > > =

> > > > > > On Thu, 2021-02-04 at 17:02 +0800, kernel test robot wrote:
> > > > > > > =

> > > > > > > Greeting,
> > > > > > > =

> > > > > > > FYI, we noticed the following commit (built with gcc-9):
> > > > > > > =

> > > > > > > commit: 4a8d79901d5bed0812d272c372aa40282937b50f ("drm/i915/d=
p:
> > > > > > > Enable
> > > > > > > Intel's
> > > > > > > HDR backlight interface (only SDR for now)")
> > > > > > > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.=
git=C2=A0mas
> > > > > > > ter
> > > > > > > =

> > > > > > > =

> > > > > > > in testcase: suspend-stress
> > > > > > > version: =

> > > > > > > with following parameters:
> > > > > > > =

> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mode: freeze
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0iterations: 10
> > > > > > > =

> > > > > > > =

> > > > > > > =

> > > > > > > on test machine: 4 threads Broadwell-Y with 8G memory
> > > > > > > =

> > > > > > > caused below changes (please refer to attached dmesg/kmsg for=
 entire
> > > > > > > log/backtrace):
> > > > > > > =

> > > > > > > =

> > > > > > > =

> > > > > > > If you fix the issue, kindly add following tag
> > > > > > > Reported-by: kernel test robot <oliver.sang@intel.com>
> > > > > > > =

> > > > > > > =

> > > > > > > kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.137894] -----------=
-[ cut here ]------------
> > > > > > > kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.137897] CPU PWM1 en=
abled
> > > > > > > kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.137930] WARNING: CP=
U: 3 PID: 575 at
> > > > > > > drivers/gpu/drm/i915/display/intel_display_power.c:4902
> > > > > > > assert_can_disable_lcpll+0x335/0x3c0 [i915]
> > > > > > > kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138084] Modules lin=
ked in: sd_mod t10_pi sg
> > > > > > > x86_pkg_temp_thermal intel_powerclamp i915 hid_rmi rmi_core
> > > > > > > hid_multitouch
> > > > > > > coretemp intel_ra
> > > > > > > pl_msr crct10dif_pclmul wmi_bmof crc32_pclmul intel_gtt crc32=
c_intel
> > > > > > > ghash_clmulni_intel rapl drm_kms_helper intel_cstate ahci lib=
ahci
> > > > > > > serio_raw
> > > > > > > mei_me proces
> > > > > > > sor_thermal_device intel_uncore processor_thermal_rfim syscop=
yarea
> > > > > > > sysfillrect
> > > > > > > intel_soc_dts_iosf sysimgblt intel_pch_thermal hid_sensor_cus=
tom
> > > > > > > fb_sys_fops
> > > > > > > li
> > > > > > > bata bcma processor_thermal_mbox joydev mei drm
> > > > > > > processor_thermal_rapl
> > > > > > > intel_rapl_common int340x_thermal_zone i2c_hid ideapad_laptop
> > > > > > > sparse_keymap
> > > > > > > wmi rfkill
> > > > > > > video int3400_thermal acpi_thermal_rel i2c_designware_platform
> > > > > > > dw_dmac
> > > > > > > i2c_designware_core acpi_pad ip_tables
> > > > > > > kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138148] CPU: 3 PID:=
 575 Comm: kworker/u8:6
> > > > > > > Tainted:
> > > > > > > G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 W I=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 5.11.0-rc2-00745-g4a8d79901d5b #1
> > > > > > > kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138153] Hardware na=
me: LENOVO 80HE/VIUU4, BIOS
> > > > > > > A6CN38WW
> > > > > > > 09/30/2014
> > > > > > > kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138155] Workqueue: =
events_unbound
> > > > > > > async_run_entry_fn
> > > > > > > kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138161] RIP:
> > > > > > > 0010:assert_can_disable_lcpll+0x335/0x3c0
> > > > > > > [i915]
> > > > > > > kern=C2=A0 :info=C2=A0 : [=C2=A0=C2=A0 21.138263] ahci 0000:0=
0:1f.2:
> > > > > > > pci_pm_suspend_late+0x0/0x40
> > > > > > > returned 0 after 0 usecs
> > > > > > > kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138296] Code: c0 75=
 22 e8 8d 61 cb ff e9 f3 fd
> > > > > > > ff
> > > > > > > ff
> > > > > > > e8
> > > > > > > fd bc 6a c1 0f 0b e9 0c fd ff ff e8 f1 bc 6a c1 0f 0b e9 05 f=
e ff ff
> > > > > > > e8
> > > > > > > e5
> > > > > > > bc
> > > > > > > 6a c1 <0f> 0b e9 cf fd ff ff e8 d9 bc 6a c1 0f 0b e9 a2 fd ff=
 ff e8
> > > > > > > cd
> > > > > > > bc
> > > > > > > kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138300] RSP: 0018:f=
fffc900006f3d58 EFLAGS:
> > > > > > > 00010282
> > > > > > > kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138304] RAX: 000000=
0000000000 RBX:
> > > > > > > ffff8881451002e8
> > > > > > > RCX:
> > > > > > > 0000000000000027
> > > > > > > kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138307] RDX: 000000=
0000000027 RSI:
> > > > > > > 0000000000000002
> > > > > > > RDI:
> > > > > > > ffff888249397cf8
> > > > > > > kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138310] RBP: ffff88=
8145100000 R08:
> > > > > > > ffff888249397cf0
> > > > > > > R09:
> > > > > > > ffffc900006f3cf0
> > > > > > > kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138313] R10: 000000=
0000000001 R11:
> > > > > > > 3030302035313969
> > > > > > > R12:
> > > > > > > ffff8881451007f0
> > > > > > > kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138316] R13: ffff88=
8145106c60 R14:
> > > > > > > 0000000000000002
> > > > > > > R15:
> > > > > > > 0000000000000000
> > > > > > > kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138319] FS:=C2=A0 0=
000000000000000(0000)
> > > > > > > GS:ffff888249380000(0000) knlGS:0000000000000000
> > > > > > > kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138322] CS:=C2=A0 0=
010 DS: 0000 ES: 0000 CR0:
> > > > > > > 0000000080050033
> > > > > > > kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138325] CR2: 000055=
7c22ec68a0 CR3:
> > > > > > > 0000000004c0a003
> > > > > > > CR4:
> > > > > > > 00000000003706e0
> > > > > > > kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138329] Call Trace:
> > > > > > > kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138334]=C2=A0 hsw_d=
isable_lcpll+0x22/0x280 [i915]
> > > > > > > kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138479]=C2=A0 i915_=
drm_suspend_late+0x5e/0x100
> > > > > > > [i915]
> > > > > > > kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138578]=C2=A0 ? pci=
_pm_poweroff_late+0x40/0x40
> > > > > > > kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138582]=C2=A0 dpm_r=
un_callback+0x4c/0x140
> > > > > > > kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138590]=C2=A0 __dev=
ice_suspend_late+0x98/0x1a0
> > > > > > > kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138596]=C2=A0 async=
_suspend_late+0x1b/0xa0
> > > > > > > kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138602]=C2=A0 async=
_run_entry_fn+0x39/0x160
> > > > > > > kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138608]=C2=A0 proce=
ss_one_work+0x1ed/0x3c0
> > > > > > > kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138612]=C2=A0 worke=
r_thread+0x50/0x3c0
> > > > > > > kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138617]=C2=A0 ? pro=
cess_one_work+0x3c0/0x3c0
> > > > > > > kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138620]=C2=A0 kthre=
ad+0x116/0x160
> > > > > > > kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138626]=C2=A0 ? kth=
read_park+0xa0/0xa0
> > > > > > > kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138631]=C2=A0 ret_f=
rom_fork+0x22/0x30
> > > > > > > kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138640] ---[ end tr=
ace a93fe4d40a5a37bb ]---
> > > > > > > =

> > > > > > > =

> > > > > > > =

> > > > > > > To reproduce:
> > > > > > > =

> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git clone https://=
github.com/intel/lkp-tests.git
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cd lkp-tests
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin/lkp install jo=
b.yaml=C2=A0 # job file is attached in this
> > > > > > > email
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin/lkp run=C2=A0=
=C2=A0=C2=A0=C2=A0 job.yaml
> > > > > > > =

> > > > > > > =

> > > > > > > =

> > > > > > > Thanks,
> > > > > > > Oliver Sang
> > > > > > > =

> > > > > > =

> > > > > > -- =

> > > > > > Sincerely,
> > > > > > =C2=A0=C2=A0 Lyude Paul (she/her)
> > > > > > =C2=A0=C2=A0 Software Engineer at Red Hat
> > > > > > =C2=A0=C2=A0 =

> > > > > > Note: I deal with a lot of emails and have a lot of bugs on my =
plate.
> > > > > > If
> > > > > > you've
> > > > > > asked me a question, are waiting for a review/merge on a patch,=
 etc.
> > > > > > and I
> > > > > > haven't responded in a while, please feel free to send me anoth=
er
> > > > > > email to
> > > > > > check
> > > > > > on my status. I don't bite!
> > > > > > =

> > > > =

> > > =

> > > -- =

> > > Sincerely,
> > > =C2=A0=C2=A0 Lyude Paul (she/her)
> > > =C2=A0=C2=A0 Software Engineer at Red Hat
> > > =C2=A0=C2=A0 =

> > > Note: I deal with a lot of emails and have a lot of bugs on my plate.=
 If
> > > you've
> > > asked me a question, are waiting for a review/merge on a patch, etc. =
and I
> > > haven't responded in a while, please feel free to send me another ema=
il to
> > > check
> > > on my status. I don't bite!
> > > =

> =

> -- =

> Sincerely,
>    Lyude Paul (she/her)
>    Software Engineer at Red Hat
>    =

> Note: I deal with a lot of emails and have a lot of bugs on my plate. If =
you've
> asked me a question, are waiting for a review/merge on a patch, etc. and I
> haven't responded in a while, please feel free to send me another email t=
o check
> on my status. I don't bite!
>=20
--===============0956683970645376658==--

