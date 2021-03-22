Content-Type: multipart/mixed; boundary="===============2446928480694760520=="
MIME-Version: 1.0
From: Dan Schatzberg <schatzberg.dan@gmail.com>
To: lkp@lists.01.org
Subject: Re: [loop] eaba742710: WARNING:at_kernel/workqueue.c:#check_flush_dependency
Date: Mon, 22 Mar 2021 09:47:25 -0400
Message-ID: <YFif7fEDAt6eaHDC@dschatzberg-fedora-PC0Y6AEN.dhcp.thefacebook.com>
In-Reply-To: <20210322060334.GD32426@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============2446928480694760520==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 22, 2021 at 02:03:34PM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: eaba7427107045752f7454f94a40839c0880cf02 ("[PATCH 1/3] loop: Use =
worker per cgroup instead of kworker")
> url: https://github.com/0day-ci/linux/commits/Dan-Schatzberg/Charge-loop-=
device-i-o-to-issuing-cgroup/20210316-233842
> base: https://git.kernel.org/cgit/linux/kernel/git/axboe/linux-block.git =
for-next
> =

> in testcase: xfstests
> version: xfstests-x86_64-73c0871-1_20210318
> with following parameters:
> =

> 	disk: 4HDD
> 	fs: xfs
> 	test: generic-group-18
> 	ucode: 0xe2
> =

> test-description: xfstests is a regression test suite for xfs and other f=
iles ystems.
> test-url: git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git
> =

> =

> on test machine: 4 threads Intel(R) Xeon(R) CPU E3-1225 v5 @ 3.30GHz with=
 16G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> ... =

> [   50.428387] WARNING: CPU: 0 PID: 35 at kernel/workqueue.c:2613 check_f=
lush_dependency (kbuild/src/consumer/kernel/workqueue.c:2613 (discriminator=
 9)) =

> [   50.450013] Modules linked in: loop xfs dm_mod btrfs blake2b_generic x=
or zstd_compress raid6_pq libcrc32c sd_mod t10_pi sg ipmi_devintf ipmi_msgh=
andler intel_rapl_msr intel_rapl_common x86_pkg_temp_thermal i915 intel_pow=
erclamp coretemp crct10dif_pclmul crc32_pclmul hp_wmi sparse_keymap intel_g=
tt crc32c_intel ghash_clmulni_intel mei_wdt rfkill wmi_bmof rapl drm_kms_he=
lper ahci intel_cstate syscopyarea mei_me libahci sysfillrect sysimgblt fb_=
sys_fops intel_uncore serio_raw mei drm libata intel_pch_thermal ie31200_ed=
ac wmi video tpm_infineon intel_pmc_core acpi_pad ip_tables
> [   50.500731] CPU: 0 PID: 35 Comm: kworker/u8:3 Not tainted 5.12.0-rc2-0=
0093-geaba74271070 #1
> [   50.509081] Hardware name: HP HP Z238 Microtower Workstation/8183, BIO=
S N51 Ver. 01.63 10/05/2017
> [   50.517963] Workqueue: loop0 loop_rootcg_workfn [loop]
> [   50.523109] RIP: 0010:check_flush_dependency (kbuild/src/consumer/kern=
el/workqueue.c:2613 (discriminator 9))
> ...
> [   50.625837] __flush_work (kbuild/src/consumer/kernel/workqueue.c:2669 =
kbuild/src/consumer/kernel/workqueue.c:3011 kbuild/src/consumer/kernel/work=
queue.c:3051) =

> [   50.629418] ? __queue_work (kbuild/src/consumer/arch/x86/include/asm/p=
aravirt.h:559 kbuild/src/consumer/arch/x86/include/asm/qspinlock.h:56 kbuil=
d/src/consumer/include/linux/spinlock.h:212 kbuild/src/consumer/include/lin=
ux/spinlock_api_smp.h:151 kbuild/src/consumer/kernel/workqueue.c:1500) =

> [   50.633261] xfs_file_buffered_write (kbuild/src/consumer/fs/xfs/xfs_fi=
le.c:761) xfs
> [   50.638468] do_iter_readv_writev (kbuild/src/consumer/fs/read_write.c:=
741) =

> [   50.642833] do_iter_write (kbuild/src/consumer/fs/read_write.c:866 kbu=
ild/src/consumer/fs/read_write.c:847) =

> [   50.646513] lo_write_bvec (kbuild/src/consumer/include/linux/fs.h:2903=
 kbuild/src/consumer/drivers/block/loop.c:286) loop
> [   50.650804] loop_process_work (kbuild/src/consumer/drivers/block/loop.=
c:307 kbuild/src/consumer/drivers/block/loop.c:630 kbuild/src/consumer/driv=
ers/block/loop.c:2129 kbuild/src/consumer/drivers/block/loop.c:2161) loop
> [   50.655543] ? newidle_balance (kbuild/src/consumer/kernel/sched/fair.c=
:10635) =

> [   50.659647] process_one_work (kbuild/src/consumer/arch/x86/include/asm=
/jump_label.h:25 kbuild/src/consumer/include/linux/jump_label.h:200 kbuild/=
src/consumer/include/trace/events/workqueue.h:108 kbuild/src/consumer/kerne=
l/workqueue.c:2280) =

> [   50.663696] worker_thread (kbuild/src/consumer/include/linux/list.h:28=
2 kbuild/src/consumer/kernel/workqueue.c:2422) =

> [   50.667365] ? process_one_work (kbuild/src/consumer/kernel/workqueue.c=
:2364) =

> [   50.671568] kthread (kbuild/src/consumer/kernel/kthread.c:292) =

> [   50.674813] ? kthread_park (kbuild/src/consumer/kernel/kthread.c:245) =

> [   50.678476] ret_from_fork (kbuild/src/consumer/arch/x86/entry/entry_64=
.S:300) =


My understanding is that this warning is firing because the loop
workqueue sets WQ_MEM_RECLAIM but the XFS workqueue (m_sync_workqueue)
does not. I believe that the WQ_MEM_RECLAIM on the loop device is
sensible because reclaim may flush dirty writes through the loop
device. I'm not familiar with xfs and its not clear why
m_sync_workqueue (flushed from xfs_flush_inodes) wouldn't have the
same reclaim dependency. I'll keep digging, but if anyone has
insights, please let me know.
--===============2446928480694760520==--

