Content-Type: multipart/mixed; boundary="===============6701618236893312011=="
MIME-Version: 1.0
From: Minchan Kim <minchan@kernel.org>
To: lkp@lists.01.org
Subject: Re: [mm] 8fd8d23ab1: WARNING:at_fs/buffer.c:#__brelse
Date: Fri, 19 Mar 2021 09:47:08 -0700
Message-ID: <YFTVjDIvnCyBmcZt@google.com>
In-Reply-To: <20210319140528.GB30349@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============6701618236893312011==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 19, 2021 at 10:05:28PM +0800, Oliver Sang wrote:
> Hi Minchan,
> =

> On Wed, Mar 17, 2021 at 09:29:38AM -0700, Minchan Kim wrote:
> > On Wed, Mar 17, 2021 at 10:37:57AM +0800, kernel test robot wrote:
> > > =

> > > =

> > > Greeting,
> > > =

> > > FYI, we noticed the following commit (built with gcc-9):
> > > =

> > > commit: 8fd8d23ab10cc2fceeac25ea7b0e2eaf98e78d64 ("[PATCH v3 3/3] mm:=
 fs: Invalidate BH LRU during page migration")
> > > url: https://github.com/0day-ci/linux/commits/Minchan-Kim/mm-replace-=
migrate_prep-with-lru_add_drain_all/20210311-001714
> > > base: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git=
 144c79ef33536b4ecb4951e07dbc1f2b7fa99d32
> > > =

> > > in testcase: blktests
> > > version: blktests-x86_64-a210761-1_20210124
> > > with following parameters:
> > > =

> > > 	test: nbd-group-01
> > > 	ucode: 0xe2
> > > =

> > > =

> > > =

> > > on test machine: 4 threads Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz wi=
th 32G memory
> > > =

> > > caused below changes (please refer to attached dmesg/kmsg for entire =
log/backtrace):
> > > =

> > > =

> > > =

> > > If you fix the issue, kindly add following tag
> > > Reported-by: kernel test robot <oliver.sang@intel.com>
> > > =

> > > =

> > > [   40.465061] WARNING: CPU: 2 PID: 5207 at fs/buffer.c:1177 __brelse=
 (kbuild/src/consumer/fs/buffer.c:1177 kbuild/src/consumer/fs/buffer.c:1171=
) =

> > > [   40.465066] Modules linked in: nbd loop xfs libcrc32c dm_multipath=
 dm_mod ipmi_devintf ipmi_msghandler sd_mod t10_pi sg intel_rapl_msr intel_=
rapl_common x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel kvm ir=
qbypass crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel rapl=
 i915 mei_wdt intel_cstate wmi_bmof intel_gtt drm_kms_helper syscopyarea ah=
ci intel_uncore sysfillrect sysimgblt libahci fb_sys_fops drm libata mei_me=
 mei intel_pch_thermal wmi video intel_pmc_core acpi_pad ip_tables
> > > [   40.465086] CPU: 2 PID: 5207 Comm: mount_clear_soc Tainted: G     =
     I       5.12.0-rc2-00062-g8fd8d23ab10c #1
> > > [   40.465088] Hardware name: Dell Inc. OptiPlex 7040/0Y7WYT, BIOS 1.=
1.1 10/07/2015
> > > [   40.465089] RIP: 0010:__brelse (kbuild/src/consumer/fs/buffer.c:11=
77 kbuild/src/consumer/fs/buffer.c:1171) =

> > > [ 40.465091] Code: 00 00 00 00 00 0f 1f 84 00 00 00 00 00 0f 1f 44 00=
 00 8b 47 60 85 c0 74 05 f0 ff 4f 60 c3 48 c7 c7 d8 99 57 82 e8 02 5d 80 00=
 <0f> 0b c3 0f 1f 44 00 00 55 65 ff 05 13 79 c8 7e 53 48 c7 c3 c0 89
> > =

> > Hi,
> > =

> > Unfortunately, I couldn't set the lkp test in my local mahcine
> > since installation failed(I guess my linux distribution is
> > very minor)
> > =

> > Do you mind testing this patch? (Please replace the original
> > patch with this one)
> =

> by replacing the original patch with below one, we confirmed the issue fi=
xed. Thanks

Hi Oliver,

Let me resend formal patch with following

Reported-by: kernel test robot <oliver.sang@intel.com>
Tested-by: Oliver Sang <oliver.sang@intel.com>

Thanks for the testing!
--===============6701618236893312011==--

