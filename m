Content-Type: multipart/mixed; boundary="===============8251767911436177613=="
MIME-Version: 1.0
From: Hans de Goede <hdegoede@redhat.com>
To: lkp@lists.01.org
Subject: Re: [ACPI: ac] 4d2a8410f1: BUG: KASAN: stack-out-of-bounds in __acpi_match_device at addr ffff880014147da0
Date: Sat, 08 Apr 2017 23:14:47 +0200
Message-ID: <68ed81a9-fc13-683f-d6d8-f9dc01ff4e5d@redhat.com>
In-Reply-To: <58e95082.VI3Z4PpnpES9+y4Y%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8251767911436177613==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On 08-04-17 23:05, kernel test robot wrote:
> Greetings,
>
> 0day kernel testing robot got the below dmesg and the first bad commit is
>
> https://github.com/0day-ci/linux/commits/Hans-de-Goede/ACPI-utils-Add-new=
-acpi_dev_present-helper/20170408-180740
>
> commit 4d2a8410f1bf8bf5cb7180f11429e02c96dd05a9
> Author:     Hans de Goede <hdegoede@redhat.com>
> AuthorDate: Fri Apr 7 12:43:45 2017 +0200
> Commit:     0day robot <fengguang.wu@intel.com>
> CommitDate: Sat Apr 8 18:07:46 2017 +0800
>
>     ACPI: ac: Add a blacklist with PMIC ACPI HIDs with a native charger d=
river
>
>     On some systems we have a native PMIC driver which provides Mains
>     monitoring, while the ACPI ac driver is broken on these systems
>     due to bad DSTDs or because we do not support the proprietary and
>     undocumented ACPI opregions these ACPI battery devices rely on
>     (e.g. BMOP opregion).
>
>     This leads for example to a ADP1 power_supply which reports
>     itself as always online even if no mains are connected.
>
>     This commit adds a blacklist with PMIC ACPI HIDs for which we've a
>     native charger or extcon driver and makes the ACPI ac driver not
>     register itself when a PMIC on this list is present.
>
>     Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>
> 4d3c75a57e  ACPI: battery: Add a blacklist with PMIC ACPI HIDs with a nat=
ive battery driver
> 4d2a8410f1  ACPI: ac: Add a blacklist with PMIC ACPI HIDs with a native c=
harger driver
> 4d2a8410f1  ACPI: ac: Add a blacklist with PMIC ACPI HIDs with a native c=
harger driver
> +-------------------------------+------------+------------+------------+
> |                               | 4d3c75a57e | 4d2a8410f1 | 4d2a8410f1 |
> +-------------------------------+------------+------------+------------+
> | boot_successes                | 31         | 0          | 0          |
> | boot_failures                 | 0          | 11         | 11         |
> | BUG:KASAN:stack-out-of-bounds | 0          | 11         | 11         |
> +-------------------------------+------------+------------+------------+
>
> [  192.817232] uvesafb: make sure that the v86d helper is installed and e=
xecutable
> [  192.818024] uvesafb: Getting VBE info block failed (eax=3D0x4f00, err=
=3D-2)
> [  192.818746] uvesafb: vbe_init() failed with -22
> [  192.819259] uvesafb: probe of uvesafb.0 failed with error -22
> [  192.819976] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [  192.820766] BUG: KASAN: stack-out-of-bounds in __acpi_match_device+0x3=
b7/0x440 at addr ffff880014147da0
> [  192.821757] Read of size 4 by task swapper/1
> [  192.822220] page:ffffea0000464788 count:0 mapcount:0 mapping:         =
 (null) index:0x0
> [  192.823116] flags: 0x4000000000000000()
> [  192.823535] raw: 4000000000000000 0000000000000000 0000000000000000 00=
000000ffffffff
> [  192.824397] raw: ffffea00004647a8 ffffea00004647a8 0000000000000000
> [  192.825072] page dumped because: kasan: bad access detected
> [  192.825670] CPU: 0 PID: 1 Comm: swapper Not tainted 4.11.0-rc5-00069-g=
4d2a841 #1
> [  192.826779] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.9.3-20161025_171302-gandalf 04/01/2014
> [  192.827963] Call Trace:
> [  192.828240]  dump_stack+0x19/0x29
> [  192.828602]  kasan_report+0x4a2/0x4c0
> [  192.829009]  ? __acpi_match_device+0x3b7/0x440
> [  192.829488]  ? save_stack+0xb1/0xd0
> [  192.829876]  ? save_stack_trace+0x1a/0x20
> [  192.830308]  __asan_report_load4_noabort+0x19/0x20
> [  192.830892]  __acpi_match_device+0x3b7/0x440
> [  192.831349]  ? sb_notify_work+0xb0/0xb0
> [  192.831818]  ? klist_next+0x84/0x3b0
> [  192.832205]  acpi_match_device_ids+0x10/0x20
> [  192.832714]  acpi_dev_present_cb+0x7d/0x240
> [  192.833164]  ? acpi_evaluate_integer+0x230/0x230
> [  192.833705]  ? _raw_spin_unlock+0x27/0x30
> [  192.834138]  ? klist_next+0x198/0x3b0
> [  192.834593]  ? bus_uevent_store+0xe0/0xe0
> [  192.835054]  ? acpi_evaluate_integer+0x230/0x230
> [  192.835568]  bus_find_device+0x11a/0x1d0
> [  192.836019]  ? bus_for_each_dev+0x1c0/0x1c0
> [  192.836487]  ? memcpy+0x45/0x50
> [  192.836874]  ? strlcpy+0x96/0x120
> [  192.837236]  acpi_dev_present+0xa4/0xd0
> [  192.837701]  ? acpi_dev_found+0xc0/0xc0
> [  192.838384]  ? add_device_randomness+0x117/0x280
> [  192.838948]  ? driver_register+0x219/0x3b0
> [  192.839450]  ? ocfb_init+0x285/0x285
> [  192.839871]  ? acpi_initialize_objects+0x272/0x272
> [  192.840381]  acpi_ac_init+0xa7/0x173
> [  192.840811]  do_one_initcall+0x16b/0x304
> [  192.841232]  ? start_kernel+0x745/0x745
> [  192.841665]  ? __usermodehelper_set_disable_depth+0x42/0x50
> [  192.842261]  kernel_init_freeable+0x3ba/0x4ce
> [  192.842760]  ? rest_init+0x160/0x160
> [  192.843147]  kernel_init+0x13/0x110
> [  192.843528]  ? rest_init+0x160/0x160
> [  192.843957]  ret_from_fork+0x31/0x40
> [  192.844409] Memory state around the buggy address:
> [  192.845156]  ffff880014147c80: 00 00 f1 f1 f1 f1 00 00 f4 f4 f3 f3 f3 =
f3 00 00
> [  192.846251]  ffff880014147d00: 00 00 00 00 00 f1 f1 f1 f1 00 00 00 00 =
00 00 00
> [  192.847350] >ffff880014147d80: 00 00 00 f4 f4 f3 f3 f3 f3 00 00 00 00 =
00 00 00
> [  192.848448]                                ^


Right, this really is a bug in "ACPI: utils: Add new acpi_dev_present helpe=
r" v2

I was clearing acpi_device_id.id[0] but not acpi_device_id.cls. I will send=
 a
new version which just does a memset 0 on the whole thing.

Regards,

Hans


>
>                                                           # HH:MM RESULT =
GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> git bisect start de2d7478323217607625066a5d7f793568dd9d21 a71c9a1c779f249=
9fb2afc0553e543f18aff6edf --
> git bisect  bad 025c7da347f0b13b8fe984113cbba3345356ad03  # 00:22  B     =
 0     8   18   0  Merge 'linux-review/Johannes-Thumshirn/scsi-libfc-direct=
ly-call-ELS-request-handlers/20170408-061133' into devel-spot-201704082100
> git bisect  bad 35e2353ffe95cb0fa1c35a437b71c52237b252a7  # 00:34  B     =
 0    11   21   0  Merge 'linux-review/Andrew-Jeffery/gpio-aspeed-Add-debou=
nce-support/20170408-131727' into devel-spot-201704082100
> git bisect  bad 6b7a94d35d6ab1e34b88768024b2535c87107a7d  # 00:46  B     =
 0     1   11   0  Merge 'arm-platforms/timers/arm64-arch-timer-errata' int=
o devel-spot-201704082100
> git bisect  bad 61b9d98170eff38babd3607144ab64dafba9aff9  # 01:14  B     =
 0     7   17   0  Merge 'linux-review/Dmitry-Rogozhkin/drm-i915-add-slice-=
shutdown-debugfs-interface/20170408-185952' into devel-spot-201704082100
> git bisect good 854724e1ca4041fff029fd4572520555bac2711d  # 01:33  G     =
11     0    0   0  Merge 'djwong-xfs/djwong-wtf' into devel-spot-2017040821=
00
> git bisect good 9632859ca9f3dacede8856c87309246eb640410c  # 01:53  G     =
11     0    0   0  Merge 'robclark/msm-next' into devel-spot-201704082100
> git bisect  bad db2c442e4260606f5cdd9d4c2a529432e6ef9e2b  # 02:11  B     =
 0     1   11   0  Merge 'linux-review/Hans-de-Goede/ACPI-utils-Add-new-acp=
i_dev_present-helper/20170408-180740' into devel-spot-201704082100
> git bisect good 352ee594e4edac4ed6c54cca0e7ece713fb97496  # 02:32  G     =
11     0    0   0  Merge branches 'pm-cpufreq', 'pm-cpufreq-sched' and 'int=
el_pstate' into linux-next
> git bisect good e48174779440c79ff5dd75f0e6b169d4e184262d  # 02:50  G     =
11     0    0   0  device property: Read strings using string array reading=
 functions
> git bisect good f948620ffd6bb03dee0d0d7952629c7c250440cc  # 03:08  G     =
10     0    0   0  Merge branch 'pm-domains' into linux-next
> git bisect good bc3d898b0e5d44902a1d08522534615e07fae736  # 03:26  G     =
11     0    0   0  Merge branch 'pm-cpuidle' into linux-next
> git bisect good 180a1d7a542fe7a5dfdb84fcb51798abe3a1746d  # 03:44  G     =
11     0    0   0  ACPI: battery: Fix acpi_battery_exit on acpi_battery_ini=
t_async errors
> git bisect  bad 4d2a8410f1bf8bf5cb7180f11429e02c96dd05a9  # 03:57  B     =
 0    11   21   0  ACPI: ac: Add a blacklist with PMIC ACPI HIDs with a nat=
ive charger driver
> git bisect good 4d3c75a57e634e201b706628134dfb262379fc31  # 04:12  G     =
11     0    0   0  ACPI: battery: Add a blacklist with PMIC ACPI HIDs with =
a native battery driver
> # first bad commit: [4d2a8410f1bf8bf5cb7180f11429e02c96dd05a9] ACPI: ac: =
Add a blacklist with PMIC ACPI HIDs with a native charger driver
> git bisect good 4d3c75a57e634e201b706628134dfb262379fc31  # 04:21  G     =
31     0    0   0  ACPI: battery: Add a blacklist with PMIC ACPI HIDs with =
a native battery driver
> # extra tests with CONFIG_DEBUG_INFO_REDUCED
> git bisect  bad 4d2a8410f1bf8bf5cb7180f11429e02c96dd05a9  # 04:34  B     =
 0     7   17   0  ACPI: ac: Add a blacklist with PMIC ACPI HIDs with a nat=
ive charger driver
> # extra tests on HEAD of linux-devel/devel-spot-201704082100
> git bisect  bad de2d7478323217607625066a5d7f793568dd9d21  # 04:34  B     =
 0    15   28   0  0day head guard for 'devel-spot-201704082100'
> # extra tests on tree/branch linux-review/Hans-de-Goede/ACPI-utils-Add-ne=
w-acpi_dev_present-helper/20170408-180740
> git bisect  bad 4d2a8410f1bf8bf5cb7180f11429e02c96dd05a9  # 04:37  B     =
 0    11   21   0  ACPI: ac: Add a blacklist with PMIC ACPI HIDs with a nat=
ive charger driver
> # extra tests with first bad commit reverted
> git bisect good 7715319318413fc875b3180ee0e2468024db3ff5  # 05:04  G     =
11     0    0   0  Revert "ACPI: ac: Add a blacklist with PMIC ACPI HIDs wi=
th a native charger driver"
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/lkp                          Intel Corpora=
tion
>

--===============8251767911436177613==--

