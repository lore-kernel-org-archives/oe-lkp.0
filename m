Content-Type: multipart/mixed; boundary="===============4576131469436845878=="
MIME-Version: 1.0
From: Kirill A. Shutemov <kirill@shutemov.name>
To: lkp@lists.01.org
Subject: Re: [mm, thp] 409ca714ac: INFO: possible circular locking dependency detected
Date: Thu, 05 May 2016 13:18:43 +0300
Message-ID: <20160505101843.GA13240@node.shutemov.name>
In-Reply-To: <20160505013245.GB10429@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============4576131469436845878==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, May 05, 2016 at 09:32:45AM +0800, kernel test robot wrote:
> FYI, we noticed the following commit:
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> commit 409ca714ac58768342cd39ca79c16f51e1825b3e ("mm, thp: avoid unnecess=
ary swapin in khugepaged")
> =

> on test machine: vm-kbuild-1G: 2 threads qemu-system-x86_64 -enable-kvm -=
cpu Haswell,+smep,+smap with 1G memory
> =

> caused below changes:
> =

<trying to dedup strings, it's really annoying>

> =

> [   21.116124] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   21.116124] [ INFO: possible circular locking dependency detected ]
> [   21.116127] 4.6.0-rc5-00302-g409ca71 #1 Not tainted
> [   21.116127] -------------------------------------------------------
> [   21.116128] udevadm/221 is trying to acquire lock:
> [   21.116138]  (&mm->mmap_sem){++++++}, at: [<ffffffff81262543>] __might=
_fault+0x83/0x150
> [   21.116138] =

> [   21.116138] but task is already holding lock:
> [   21.116144]  (s_active#12){++++.+}, at: [<ffffffff813315ee>] kernfs_fo=
p_write+0x8e/0x250
> [   21.116144] =

> [   21.116144] which lock already depends on the new lock.
> [   21.116144] =

> [   21.116145] the existing dependency chain (in reverse order) is:
> [   21.116148] =

> [   21.116148] -> #2 (s_active#12){++++.+}:
> [   21.116152]        [<ffffffff8117da2c>] lock_acquire+0xac/0x180
> [   21.116155]        [<ffffffff8132f50a>] __kernfs_remove+0x2da/0x410
> [   21.116158]        [<ffffffff81330630>] kernfs_remove_by_name_ns+0x40/=
0x90
> [   21.116160]        [<ffffffff813339fb>] sysfs_remove_file_ns+0x2b/0x70
> [   21.116164]        [<ffffffff81ba8a16>] device_del+0x166/0x320
> [   21.116166]        [<ffffffff81ba943c>] device_destroy+0x3c/0x50
> [   21.116170]        [<ffffffff8105aa61>] cpuid_class_cpu_callback+0x51/=
0x70
> [   21.116173]        [<ffffffff81131ce9>] notifier_call_chain+0x59/0x190
> [   21.116177]        [<ffffffff81132749>] __raw_notifier_call_chain+0x9/=
0x10
> [   21.116180]        [<ffffffff810fe6b0>] __cpu_notify+0x40/0x90
> [   21.116182]        [<ffffffff810fe890>] cpu_notify_nofail+0x10/0x30
> [   21.116185]        [<ffffffff810fe8d7>] notify_dead+0x27/0x1e0
> [   21.116187]        [<ffffffff810fe273>] cpuhp_down_callbacks+0x93/0x190
> [   21.116192]        [<ffffffff82096062>] _cpu_down+0xc2/0x1e0
> [   21.116194]        [<ffffffff810ff727>] do_cpu_down+0x37/0x50
> [   21.116197]        [<ffffffff8110003b>] cpu_down+0xb/0x10
> [   21.116201]        [<ffffffff81038e4d>] _debug_hotplug_cpu+0x7d/0xd0
> [   21.116205]        [<ffffffff8435d6bb>] debug_hotplug_cpu+0xd/0x11
> [   21.116208]        [<ffffffff84352426>] do_one_initcall+0x138/0x1cf
> [   21.116211]        [<ffffffff8435270a>] kernel_init_freeable+0x24d/0x2=
de
> [   21.116214]        [<ffffffff8209533a>] kernel_init+0xa/0x120
> [   21.116217]        [<ffffffff820a7972>] ret_from_fork+0x22/0x50
> [   21.116221] =

> [   21.116221] -> #1 (cpu_hotplug.lock#2){+.+.+.}:
> [   21.116223]        [<ffffffff8117da2c>] lock_acquire+0xac/0x180
> [   21.116226]        [<ffffffff820a20d1>] mutex_lock_nested+0x71/0x4c0
> [   21.116228]        [<ffffffff810ff526>] get_online_cpus+0x66/0x80
> [   21.116232]        [<ffffffff81246fb3>] sum_vm_event+0x23/0x1b0
> [   21.116236]        [<ffffffff81293768>] collapse_huge_page+0x118/0x10b0
> [   21.116238]        [<ffffffff81294c5d>] khugepaged+0x55d/0xe80
> [   21.116240]        [<ffffffff81130304>] kthread+0x134/0x1a0
> [   21.116242]        [<ffffffff820a7972>] ret_from_fork+0x22/0x50
> [   21.116244] =

> [   21.116244] -> #0 (&mm->mmap_sem){++++++}:
> [   21.116246]        [<ffffffff8117bf61>] __lock_acquire+0x2861/0x31f0
> [   21.116248]        [<ffffffff8117da2c>] lock_acquire+0xac/0x180
> [   21.116251]        [<ffffffff8126257e>] __might_fault+0xbe/0x150
> [   21.116253]        [<ffffffff8133160f>] kernfs_fop_write+0xaf/0x250
> [   21.116256]        [<ffffffff812a8933>] __vfs_write+0x43/0x1a0
> [   21.116258]        [<ffffffff812a8d3a>] vfs_write+0xda/0x240
> [   21.116260]        [<ffffffff812a8f84>] SyS_write+0x44/0xa0
> [   21.116263]        [<ffffffff820a773c>] entry_SYSCALL_64_fastpath+0x1f=
/0xbd
> [   21.116264] =

> [   21.116264] other info that might help us debug this:
> [   21.116264] =

> [   21.116268] Chain exists of:
> [   21.116268]   &mm->mmap_sem --> cpu_hotplug.lock#2 --> s_active#12
> [   21.116268] =

> [   21.116268]  Possible unsafe locking scenario:
> [   21.116268] =

> [   21.116269]        CPU0                    CPU1
> [   21.116269]        ----                    ----
> [   21.116270]   lock(s_active#12);
> [   21.116271]                                lock(cpu_hotplug.lock#2);
> [   21.116272]                                lock(s_active#12);
> [   21.116273]   lock(&mm->mmap_sem);
> [   21.116274] =

> [   21.116274]  *** DEADLOCK ***
> [   21.116274] =

> [   21.116274]  *** DEADLOCK ***
> [   21.116274] =

> [   21.116274] 3 locks held by udevadm/221:
> [   21.116278]  #0:  (sb_writers#3){.+.+.+}, at: [<ffffffff812ad64d>] __s=
b_start_write+0x6d/0x120
> [   21.116280]  #1:  (&of->mutex){+.+.+.}, at: [<ffffffff813315e6>] kernf=
s_fop_write+0x86/0x250
> [   21.116282]  #2:  (s_active#12){++++.+}, at: [<ffffffff813315ee>] kern=
fs_fop_write+0x8e/0x250
> [   21.116283] =

> [   21.116283] stack backtrace:
> [   21.116283] =

> [   21.116283] stack backtrace:
> [   21.116284] CPU: 1 PID: 221 Comm: udevadm Not tainted 4.6.0-rc5-00302-=
g409ca71 #1
> [   21.116287]  ffff88003f698000 ffff88003f077bf0 ffffffff81444ef3 000000=
0000000011
> [   21.116288]  ffffffff84bdd8f0 ffffffff84bf2630 ffff88003f077c40 ffffff=
ff81173e91
> [   21.116290]  0000000000000000 ffffffff84fbdbc0 00ff88003f077c40 ffff88=
003f698bb8
> [   21.116290] Call Trace:
> [   21.116293]  [<ffffffff81444ef3>] dump_stack+0x86/0xd3
> [   21.116294]  [<ffffffff81173e91>] print_circular_bug+0x221/0x360
> [   21.116296]  [<ffffffff8117bf61>] __lock_acquire+0x2861/0x31f0
> [   21.116297]  [<ffffffff8117da2c>] lock_acquire+0xac/0x180
> [   21.116299]  [<ffffffff81262543>] ? __might_fault+0x83/0x150
> [   21.116300]  [<ffffffff8126257e>] __might_fault+0xbe/0x150
> [   21.116302]  [<ffffffff81262543>] ? __might_fault+0x83/0x150
> [   21.116303]  [<ffffffff8133160f>] kernfs_fop_write+0xaf/0x250
> [   21.116304]  [<ffffffff812a8933>] __vfs_write+0x43/0x1a0
> [   21.116306]  [<ffffffff8116fe0d>] ? update_fast_ctr+0x1d/0x80
> [   21.116308]  [<ffffffff8116ffe7>] ? percpu_down_read+0x57/0xa0
> [   21.116310]  [<ffffffff812ad64d>] ? __sb_start_write+0x6d/0x120
> [   21.116311]  [<ffffffff812ad64d>] ? __sb_start_write+0x6d/0x120
> [   21.116312]  [<ffffffff812a8d3a>] vfs_write+0xda/0x240
> [   21.116314]  [<ffffffff812a8f84>] SyS_write+0x44/0xa0
> [   21.116315]  [<ffffffff820a773c>] entry_SYSCALL_64_fastpath+0x1f/0xbd

If I read this correctly (I'm not sure about this), we shouldn't call
sum_vm_event() under mmap_sem.

BTW, we do need mmap_sem for swapin, but there's no need for exclusive
one. It can be too expensive to do I/O with down_write(mmap_sem).

Ebru, could look how to move sum_vm_event() outside mmap_sem and probably
have down_read(mmap_sem) during swapin? I don't have time for this right
now.

-- =

 Kirill A. Shutemov

--===============4576131469436845878==--

