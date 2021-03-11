Content-Type: multipart/mixed; boundary="===============5803439029941885309=="
MIME-Version: 1.0
From: Imre Deak <imre.deak@intel.com>
To: lkp@lists.01.org
Subject: Re: [drm/i915] 7962893ecb: WARNING:at_drivers/gpu/drm/i915/intel_runtime_pm.c:#intel_runtime_pm_driver_release[i915]
Date: Thu, 11 Mar 2021 16:57:00 +0200
Message-ID: <20210311145700.GA2970909@ideak-desk.fi.intel.com>
In-Reply-To: <9575be26-f9e5-814b-b24c-a2497847980e@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5803439029941885309==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Mar 11, 2021 at 09:32:04AM +0800, Xing Zhengjun wrote:
> On 3/4/2021 8:55 AM, Imre Deak wrote:
> > Hi Oliver,
> > =

> > On Wed, Mar 03, 2021 at 01:55:17PM +0800, kernel test robot wrote:
> > > =

> > > Greeting,
> > > =

> > > FYI, we noticed the following commit (built with gcc-9):
> > > =

> > > commit: 7962893ecb853aa7c8925ce237ab6c4274cfc1c7 ("drm/i915: Disable =
runtime power management during shutdown")
> > > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git mast=
er
> > > [...]
> > > If you fix the issue, kindly add following tag
> > > Reported-by: kernel test robot <oliver.sang@intel.com>
> > > =

> > > =

> > > [   49.686892] ------------[ cut here ]------------
> > > [   49.691510] i915 0000:00:02.0: i915 raw-wakerefs=3D1 wakelocks=3D1=
 on cleanup
> > =

> > =

> > THanks for the report. I couldn't reproduce this. Could you add the
> > following kconfig option for these tests (and if possible reproduce the
> > problem with that?):
> > =

> > CONFIG_DRM_I915_DEBUG_RUNTIME_PM=3Dy
> > =

> I add "CONFIG_DRM_I915_DEBUG_RUNTIME_PM=3Dy" to the kernel config, re-tes=
t it,
> the issue still happened. The kernel log is in the attachment.

thanks, the following should fix this:
https://patchwork.freedesktop.org/patch/423617/?series=3D87883&rev=3D1

The leaked wakeref was due to not handling the case where the DMC
firmware is missing:

[   20.316022] i915 0000:00:02.0: Direct firmware load for i915/skl_dmc_ver=
1_27.bin failed with error -2
[   20.338032] i915 0000:00:02.0: [drm] DMC firmware homepage: https://git.=
kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915

...

[   47.439434] i915 0000:00:02.0: i915 raw-wakerefs=3D1 wakelocks=3D1 on cl=
eanup
...
[   47.646836] Call Trace:
[   47.650215]  pci_device_shutdown+0x34/0x60
[   47.655264]  device_shutdown+0x162/0x1d0
[   47.660103]  kernel_restart+0xe/0x40
[   47.664615]  __do_sys_reboot+0x1d2/0x210
[   47.669445]  ? __check_object_size+0x136/0x150
[   47.674792]  ? rcu_nocb_try_bypass+0x1f2/0x340
[   47.680132]  ? get_max_files+0x10/0x10
[   47.684781]  ? exit_to_user_mode_prepare+0x112/0x150
[   47.690672]  do_syscall_64+0x33/0x40
...
[   47.831502] i915 Wakeref count: 1
[   47.835731] i915 Wakeref x1 taken at:
[   47.835731]    track_intel_runtime_pm_wakeref+0x19/0xa0 [i915]
[   47.835731]    intel_display_power_get+0x25/0x60 [i915]
[   47.835731]    intel_csr_runtime_pm_get+0x22/0x60 [i915]
[   47.835731]    intel_csr_ucode_init+0x49/0x270 [i915]
[   47.835731]    intel_modeset_init_noirq+0x65/0x280 [i915]
[   47.835731]    i915_driver_probe+0x518/0x990 [i915]
[   47.835731]    i915_pci_probe+0x54/0x140 [i915]
[   47.835731]    local_pci_probe+0x42/0x80

This could also be a real problem if the FW loading hadn't yet finished
by shutdown/reboot.

--Imre
--===============5803439029941885309==--

