Content-Type: multipart/mixed; boundary="===============4349911052176328884=="
MIME-Version: 1.0
From: Lyude Paul <lyude@redhat.com>
To: lkp@lists.01.org
Subject: Re: [drm/i915/dp] 4a8d79901d: WARNING:at_drivers/gpu/drm/i915/display/intel_display_power.c:#assert_can_disable_lcpll[i915]
Date: Fri, 05 Feb 2021 14:53:11 -0500
Message-ID: <b94a605ba4a44e7b45f1ce3d6071dcc7a449e7ac.camel@redhat.com>
In-Reply-To: <20210204090229.GH17757@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============4349911052176328884==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Am I right in assuming this is likely a very delayed test result from befor=
e:

fe7d52bccab6 ("drm/i915/dp: Don't use DPCD backlights that need PWM
enable/disable")

Made it into the kernel? I see that there's a PWM being left on, which was =
the
same issue we were seeing on fi-bdw-samus

On Thu, 2021-02-04 at 17:02 +0800, kernel test robot wrote:
> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 4a8d79901d5bed0812d272c372aa40282937b50f ("drm/i915/dp: Enable In=
tel's
> HDR backlight interface (only SDR for now)")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git=C2=A0mas=
ter
> =

> =

> in testcase: suspend-stress
> version: =

> with following parameters:
> =

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mode: freeze
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0iterations: 10
> =

> =

> =

> on test machine: 4 threads Broadwell-Y with 8G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire
> log/backtrace):
> =

> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> =

> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.137894] ------------[ cut here =
]------------
> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.137897] CPU PWM1 enabled
> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.137930] WARNING: CPU: 3 PID: 57=
5 at
> drivers/gpu/drm/i915/display/intel_display_power.c:4902
> assert_can_disable_lcpll+0x335/0x3c0 [i915]
> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138084] Modules linked in: sd_m=
od t10_pi sg
> x86_pkg_temp_thermal intel_powerclamp i915 hid_rmi rmi_core hid_multitouch
> coretemp intel_ra
> pl_msr crct10dif_pclmul wmi_bmof crc32_pclmul intel_gtt crc32c_intel
> ghash_clmulni_intel rapl drm_kms_helper intel_cstate ahci libahci serio_r=
aw
> mei_me proces
> sor_thermal_device intel_uncore processor_thermal_rfim syscopyarea sysfil=
lrect
> intel_soc_dts_iosf sysimgblt intel_pch_thermal hid_sensor_custom fb_sys_f=
ops
> li
> bata bcma processor_thermal_mbox joydev mei drm processor_thermal_rapl
> intel_rapl_common int340x_thermal_zone i2c_hid ideapad_laptop sparse_keym=
ap
> wmi rfkill
> video int3400_thermal acpi_thermal_rel i2c_designware_platform dw_dmac
> i2c_designware_core acpi_pad ip_tables
> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138148] CPU: 3 PID: 575 Comm: k=
worker/u8:6 Tainted:
> G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 W I=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 5.11.0-rc2-00745-g4a8d79901d5b #1
> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138153] Hardware name: LENOVO 8=
0HE/VIUU4, BIOS A6CN38WW
> 09/30/2014
> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138155] Workqueue: events_unbou=
nd async_run_entry_fn
> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138161] RIP: 0010:assert_can_di=
sable_lcpll+0x335/0x3c0
> [i915]
> kern=C2=A0 :info=C2=A0 : [=C2=A0=C2=A0 21.138263] ahci 0000:00:1f.2: pci_=
pm_suspend_late+0x0/0x40
> returned 0 after 0 usecs
> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138296] Code: c0 75 22 e8 8d 61=
 cb ff e9 f3 fd ff ff e8
> fd bc 6a c1 0f 0b e9 0c fd ff ff e8 f1 bc 6a c1 0f 0b e9 05 fe ff ff e8 e=
5 bc
> 6a c1 <0f> 0b e9 cf fd ff ff e8 d9 bc 6a c1 0f 0b e9 a2 fd ff ff e8 cd bc
> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138300] RSP: 0018:ffffc900006f3=
d58 EFLAGS: 00010282
> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138304] RAX: 0000000000000000 R=
BX: ffff8881451002e8 RCX:
> 0000000000000027
> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138307] RDX: 0000000000000027 R=
SI: 0000000000000002 RDI:
> ffff888249397cf8
> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138310] RBP: ffff888145100000 R=
08: ffff888249397cf0 R09:
> ffffc900006f3cf0
> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138313] R10: 0000000000000001 R=
11: 3030302035313969 R12:
> ffff8881451007f0
> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138316] R13: ffff888145106c60 R=
14: 0000000000000002 R15:
> 0000000000000000
> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138319] FS:=C2=A0 0000000000000=
000(0000)
> GS:ffff888249380000(0000) knlGS:0000000000000000
> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138322] CS:=C2=A0 0010 DS: 0000=
 ES: 0000 CR0:
> 0000000080050033
> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138325] CR2: 0000557c22ec68a0 C=
R3: 0000000004c0a003 CR4:
> 00000000003706e0
> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138329] Call Trace:
> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138334]=C2=A0 hsw_disable_lcpll=
+0x22/0x280 [i915]
> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138479]=C2=A0 i915_drm_suspend_=
late+0x5e/0x100 [i915]
> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138578]=C2=A0 ? pci_pm_poweroff=
_late+0x40/0x40
> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138582]=C2=A0 dpm_run_callback+=
0x4c/0x140
> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138590]=C2=A0 __device_suspend_=
late+0x98/0x1a0
> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138596]=C2=A0 async_suspend_lat=
e+0x1b/0xa0
> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138602]=C2=A0 async_run_entry_f=
n+0x39/0x160
> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138608]=C2=A0 process_one_work+=
0x1ed/0x3c0
> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138612]=C2=A0 worker_thread+0x5=
0/0x3c0
> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138617]=C2=A0 ? process_one_wor=
k+0x3c0/0x3c0
> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138620]=C2=A0 kthread+0x116/0x1=
60
> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138626]=C2=A0 ? kthread_park+0x=
a0/0xa0
> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138631]=C2=A0 ret_from_fork+0x2=
2/0x30
> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 21.138640] ---[ end trace a93fe4d4=
0a5a37bb ]---
> =

> =

> =

> To reproduce:
> =

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git clone https://github.com/i=
ntel/lkp-tests.git
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cd lkp-tests
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin/lkp install job.yaml=C2=A0=
 # job file is attached in this email
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin/lkp run=C2=A0=C2=A0=C2=A0=
=C2=A0 job.yaml
> =

> =

> =

> Thanks,
> Oliver Sang
> =


-- =

Sincerely,
   Lyude Paul (she/her)
   Software Engineer at Red Hat
   =

Note: I deal with a lot of emails and have a lot of bugs on my plate. If yo=
u've
asked me a question, are waiting for a review/merge on a patch, etc. and I
haven't responded in a while, please feel free to send me another email to =
check
on my status. I don't bite!

--===============4349911052176328884==--

