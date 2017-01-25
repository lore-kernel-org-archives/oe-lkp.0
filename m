Content-Type: multipart/mixed; boundary="===============8387384852814092983=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm, vmscan] 5e56dfbd83: fsmark.files_per_sec -11.1% regression
Date: Wed, 25 Jan 2017 12:27:06 +0800
Message-ID: <20170125042706.GL17561@yexl-desktop>
In-Reply-To: <20170124134424.GL6867@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============8387384852814092983==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 01/24, Michal Hocko wrote:
>On Mon 23-01-17 09:26:44, kernel test robot wrote:
>> =

>> Greeting,
>> =

>> FYI, we noticed a -11.1% regression of fsmark.files_per_sec due to commi=
t:
>> =

>> =

>> commit: 5e56dfbd837421b7fa3c6c06018c6701e2704917 ("mm, vmscan: consider =
eligible zones in get_scan_count")
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git mast=
er
>
>This is more than unexpected. This patch should be basically noop for
>anything but CONFIG_HIGHMEM systems. And your config says this is 64b
>kernel. Are those results reproducible? And could you try to compare

Yes, the results are well reproducible, both the commit in question and its
parent have ran for 4 times.

>perf profiles before and after the patch.

Here is the perf profiles, =


Before the patch:
 "perf-profile.children.cycles-pp.verify_cpu"=3D>[70.92],
 "perf-profile.children.cycles-pp.cpu_startup_entry"=3D>[70.92],
 "perf-profile.children.cycles-pp.do_idle"=3D>[70.69],
 "perf-profile.children.cycles-pp.call_cpuidle"=3D>[69.18],
 "perf-profile.children.cycles-pp.cpuidle_enter"=3D>[69.14],
 "perf-profile.children.cycles-pp.cpuidle_enter_state"=3D>[68.63],
 "perf-profile.children.cycles-pp.start_secondary"=3D>[66.52],
 "perf-profile.children.cycles-pp.intel_idle"=3D>[39.82],
 "perf-profile.children.cycles-pp.ret_from_fork"=3D>[19.28],
 "perf-profile.children.cycles-pp.kthread"=3D>[19.26],
 "perf-profile.children.cycles-pp.md_thread"=3D>[16.0],
 "perf-profile.children.cycles-pp.raid5d"=3D>[15.98],
 "perf-profile.children.cycles-pp.handle_active_stripes"=3D>[15.68],
 "perf-profile.children.cycles-pp.handle_stripe"=3D>[15.62],
 "perf-profile.children.cycles-pp.__irqentry_text_start"=3D>[14.61],
 "perf-profile.children.cycles-pp.smp_apic_timer_interrupt"=3D>[14.41],
 "perf-profile.children.cycles-pp.raid_run_ops"=3D>[11.22],
 "perf-profile.children.cycles-pp.poll_idle"=3D>[10.53],
 "perf-profile.children.cycles-pp._raw_spin_lock"=3D>[9.31],
 "perf-profile.children.cycles-pp.entry_SYSCALL_64_fastpath"=3D>[9.17],
 "perf-profile.children.cycles-pp.irq_enter"=3D>[9.16],
 "perf-profile.children.cycles-pp.tick_irq_enter"=3D>[8.88],
 "perf-profile.children.cycles-pp.sys_write"=3D>[8.36],
 "perf-profile.children.cycles-pp.vfs_write"=3D>[8.29],
 "perf-profile.children.cycles-pp.__vfs_write"=3D>[8.15],
 "perf-profile.children.cycles-pp.btrfs_file_write_iter"=3D>[8.04],
 "perf-profile.children.cycles-pp.__btrfs_buffered_write"=3D>[7.87],
 "perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath"=3D>[7.4=
2],
 "perf-profile.children.cycles-pp.async_copy_data"=3D>[7.02],
 "perf-profile.children.cycles-pp.tick_do_update_jiffies64"=3D>[6.86],
 "perf-profile.children.cycles-pp.irq_exit"=3D>[4.53],
 "perf-profile.children.cycles-pp.x86_64_start_kernel"=3D>[4.4],
 "perf-profile.children.cycles-pp.x86_64_start_reservations"=3D>[4.4],
 "perf-profile.children.cycles-pp.start_kernel"=3D>[4.4],
 "perf-profile.children.cycles-pp.rest_init"=3D>[4.4],
 "perf-profile.children.cycles-pp.generic_make_request"=3D>[3.87],
 "perf-profile.children.cycles-pp.memcpy_erms"=3D>[3.85],
 "perf-profile.children.cycles-pp.__softirqentry_text_start"=3D>[3.15],
 "perf-profile.children.cycles-pp.worker_thread"=3D>[3.01],
 "perf-profile.children.cycles-pp.btrfs_copy_from_user"=3D>[2.96],
 "perf-profile.children.cycles-pp.process_one_work"=3D>[2.89],
 "perf-profile.children.cycles-pp.local_apic_timer_interrupt"=3D>[2.87],
 "perf-profile.children.cycles-pp.copy_user_enhanced_fast_string"=3D>[2.82],
 "perf-profile.children.cycles-pp.hrtimer_interrupt"=3D>[2.67],
 "perf-profile.children.cycles-pp.ops_run_io"=3D>[2.54],
 "perf-profile.children.cycles-pp.ret_from_intr"=3D>[2.5],
 "perf-profile.children.cycles-pp.do_IRQ"=3D>[2.5],
 "perf-profile.children.cycles-pp.btrfs_scrubparity_helper"=3D>[2.47],
 "perf-profile.children.cycles-pp.btrfs_submit_helper"=3D>[2.27],
 "perf-profile.children.cycles-pp.pending_bios_fn"=3D>[2.27],
 "perf-profile.children.cycles-pp.run_scheduled_bios"=3D>[2.27],
 "perf-profile.children.cycles-pp.submit_bio"=3D>[2.27],
 "perf-profile.children.cycles-pp.md_make_request"=3D>[2.27],
 "perf-profile.children.cycles-pp.raid5_make_request"=3D>[2.21],
 "perf-profile.children.cycles-pp.blk_done_softirq"=3D>[2.19],
 "perf-profile.children.cycles-pp.scsi_softirq_done"=3D>[2.19],
 "perf-profile.children.cycles-pp.scsi_finish_command"=3D>[2.16],
 "perf-profile.children.cycles-pp.scsi_io_completion"=3D>[2.13],
 "perf-profile.children.cycles-pp.scsi_end_request"=3D>[2.13],
 "perf-profile.children.cycles-pp.irq_work_run"=3D>[1.97],
 "perf-profile.children.cycles-pp.irq_work_run_list"=3D>[1.97],
 "perf-profile.children.cycles-pp.irq_work_interrupt"=3D>[1.96],
 "perf-profile.children.cycles-pp.smp_irq_work_interrupt"=3D>[1.96],
 "perf-profile.children.cycles-pp.perf_duration_warn"=3D>[1.96],
 "perf-profile.children.cycles-pp.printk"=3D>[1.96],
 "perf-profile.children.cycles-pp.vprintk_default"=3D>[1.96],
 "perf-profile.children.cycles-pp.vprintk_emit"=3D>[1.96],
 "perf-profile.children.cycles-pp.console_unlock"=3D>[1.96],


After the patch:

 "perf-profile.children.cycles-pp.verify_cpu"=3D>[78.74],
 "perf-profile.children.cycles-pp.cpu_startup_entry"=3D>[78.74],
 "perf-profile.children.cycles-pp.do_idle"=3D>[78.5],
 "perf-profile.children.cycles-pp.start_secondary"=3D>[76.96],
 "perf-profile.children.cycles-pp.call_cpuidle"=3D>[76.44],
 "perf-profile.children.cycles-pp.cpuidle_enter"=3D>[76.36],
 "perf-profile.children.cycles-pp.cpuidle_enter_state"=3D>[75.89],
 "perf-profile.children.cycles-pp.intel_idle"=3D>[46.78],
 "perf-profile.children.cycles-pp.__irqentry_text_start"=3D>[17.15],
 "perf-profile.children.cycles-pp.smp_apic_timer_interrupt"=3D>[16.95],
 "perf-profile.children.cycles-pp._raw_spin_lock"=3D>[11.27],
 "perf-profile.children.cycles-pp.irq_enter"=3D>[10.85],
 "perf-profile.children.cycles-pp.tick_irq_enter"=3D>[10.4],
 "perf-profile.children.cycles-pp.entry_SYSCALL_64_fastpath"=3D>[10.4],
 "perf-profile.children.cycles-pp.ret_from_fork"=3D>[10.16],
 "perf-profile.children.cycles-pp.kthread"=3D>[10.16],
 "perf-profile.children.cycles-pp.sys_write"=3D>[9.72],
 "perf-profile.children.cycles-pp.vfs_write"=3D>[9.66],
 "perf-profile.children.cycles-pp.__vfs_write"=3D>[9.59],
 "perf-profile.children.cycles-pp.btrfs_file_write_iter"=3D>[9.45],
 "perf-profile.children.cycles-pp.__btrfs_buffered_write"=3D>[9.35],
 "perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath"=3D>[8.9=
3],
 "perf-profile.children.cycles-pp.poll_idle"=3D>[8.43],
 "perf-profile.children.cycles-pp.tick_do_update_jiffies64"=3D>[7.91],
 "perf-profile.children.cycles-pp.md_thread"=3D>[7.57],
 "perf-profile.children.cycles-pp.raid5d"=3D>[7.57],
 "perf-profile.children.cycles-pp.handle_active_stripes"=3D>[7.38],
 "perf-profile.children.cycles-pp.handle_stripe"=3D>[7.37],
 "perf-profile.children.cycles-pp.raid_run_ops"=3D>[5.03],
 "perf-profile.children.cycles-pp.irq_exit"=3D>[3.59],
 "perf-profile.children.cycles-pp.async_copy_data"=3D>[3.41],
 "perf-profile.children.cycles-pp.btrfs_copy_from_user"=3D>[3.36],
 "perf-profile.children.cycles-pp.local_apic_timer_interrupt"=3D>[3.29],
 "perf-profile.children.cycles-pp.copy_user_enhanced_fast_string"=3D>[3.22],
 "perf-profile.children.cycles-pp.hrtimer_interrupt"=3D>[3.15],
 "perf-profile.children.cycles-pp.memcpy_erms"=3D>[2.37],
 "perf-profile.children.cycles-pp.worker_thread"=3D>[2.33],
 "perf-profile.children.cycles-pp.process_one_work"=3D>[2.22],
 "perf-profile.children.cycles-pp.generic_make_request"=3D>[2.15],
 "perf-profile.children.cycles-pp.btrfs_delalloc_reserve_metadata"=3D>[2.0],
 "perf-profile.children.cycles-pp.__hrtimer_run_queues"=3D>[1.93],
 "perf-profile.children.cycles-pp.prepare_pages"=3D>[1.8],
 "perf-profile.children.cycles-pp.x86_64_start_kernel"=3D>[1.78],
 "perf-profile.children.cycles-pp.x86_64_start_reservations"=3D>[1.78],
 "perf-profile.children.cycles-pp.start_kernel"=3D>[1.78],
 "perf-profile.children.cycles-pp.rest_init"=3D>[1.78],
 "perf-profile.children.cycles-pp.pagecache_get_page"=3D>[1.76],
 "perf-profile.children.cycles-pp.__tick_nohz_idle_enter"=3D>[1.73],
 "perf-profile.children.cycles-pp.btrfs_scrubparity_helper"=3D>[1.7],
 "perf-profile.children.cycles-pp.tick_nohz_irq_exit"=3D>[1.63],
 "perf-profile.children.cycles-pp.__softirqentry_text_start"=3D>[1.62],
 "perf-profile.children.cycles-pp.btrfs_submit_helper"=3D>[1.46],
 "perf-profile.children.cycles-pp.pending_bios_fn"=3D>[1.46],
 "perf-profile.children.cycles-pp.run_scheduled_bios"=3D>[1.46],
 "perf-profile.children.cycles-pp.submit_bio"=3D>[1.45],
 "perf-profile.children.cycles-pp.md_make_request"=3D>[1.45],
 "perf-profile.children.cycles-pp.raid5_make_request"=3D>[1.42],
 "perf-profile.children.cycles-pp.irq_work_interrupt"=3D>[1.36],
 "perf-profile.children.cycles-pp.smp_irq_work_interrupt"=3D>[1.36],
 "perf-profile.children.cycles-pp.irq_work_run"=3D>[1.36],
 "perf-profile.children.cycles-pp.irq_work_run_list"=3D>[1.36],
 "perf-profile.children.cycles-pp.perf_duration_warn"=3D>[1.36],
 "perf-profile.children.cycles-pp.printk"=3D>[1.36],
 "perf-profile.children.cycles-pp.vprintk_default"=3D>[1.36],
 "perf-profile.children.cycles-pp.vprintk_emit"=3D>[1.36],
 "perf-profile.children.cycles-pp.console_unlock"=3D>[1.36],


Thanks,
Xiaolong

>-- =

>Michal Hocko
>SUSE Labs

--===============8387384852814092983==--

