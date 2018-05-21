Content-Type: multipart/mixed; boundary="===============4707033632834916091=="
MIME-Version: 1.0
From: Boqun Feng <boqun.feng@gmail.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] b37d0497aa: WARNING:possible_irq_lock_inversion_dependency_detected
Date: Mon, 21 May 2018 15:38:08 +0800
Message-ID: <20180521073808.GA21726@localhost>
In-Reply-To: <20180521054022.GE19015@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============4707033632834916091==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

(Cc Peter, Will, Tejun and Paul)

On Mon, May 21, 2018 at 01:40:22PM +0800, kernel test robot wrote:
> =

> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: b37d0497aa25dea72628e6307b1abbca1e67cd00 ("WIP")
> https://git.kernel.org/cgit/linux/kernel/git/boqun/linux.git arr-rfc-wip
> =


FYI, this is my working in progress branch for recursive deadlock
detections. And that branch also has my proposal for better lockdep
annotation for queued rwlocks:

	https://marc.info/?l=3Dlinux-kernel&m=3D152483640529740&w=3D2k

, and with that change, the robot reported a deadlock.I put some of my
analysis below and hope to get your idea/opinions. Thanks!

[...]
> =

> =

> [   28.387571] WARNING: possible irq lock inversion dependency detected
> [   28.389198] 4.17.0-rc1-00027-gb37d049 #6 Not tainted
> [   28.390617] --------------------------------------------------------
> [   28.392205] systemd/1 just changed the state of lock:
> [   28.393627] 00000000fe57773b (css_set_lock){..-.}, at: cgroup_free+0xf=
2/0x12a
> [   28.395456] but this lock took another, SOFTIRQ-unsafe lock in the pas=
t:
> [   28.397152]  (tasklist_lock){.+.+}
> [   28.397155] =

> [   28.397155] =

> [   28.397155] and interrupts could create inverse lock ordering between =
them.
> [   28.397155] =

> [   28.402049] =

> [   28.402049] other info that might help us debug this:
> [   28.404203]  Possible interrupt unsafe locking scenario:
> [   28.404203] =

> [   28.406379]        CPU0                    CPU1
> [   28.407712]        ----                    ----
> [   28.409107]   lock(tasklist_lock);
> [   28.410207]                                local_irq_disable();
> [   28.411822]                                lock(css_set_lock);
> [   28.413423]                                lock(tasklist_lock);
> [   28.415094]   <Interrupt>
> [   28.416106]     lock(css_set_lock);
> [   28.417263] =

> [   28.417263]  *** DEADLOCK ***
> [   28.417263] =


The deadlock case is as follow:

	CPU 0			CPU 1			CPU 2
	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
	do_prlimit():
	  read_lock(&tasklist_lock); // get the lock
	  						de_thread():
							  write_lock_irq(&task_lock); // waiting for the lock
	  						=

				cgroup_mount():
				  cgroup_enable_task_cg_lists():
				    spin_lock_irq(&css_set_lock);
				    ...
				    read_lock(&tasklist_lock); // wait because of fairness =

	<in softirq>
	rcu_do_batch(): // someone enqueued a delayed_put_task_struct callback bef=
ore
	  delayed_put_task_struct():
	    put_task_struct():
	      cgroup_free():
	        spin_lock_irqsave(&css_set_lock,...)

For architectures use queued rwlocks, this is a deadlock because the
fairness of read/write locks.

I wonder whether I'm missing something subtle, if not, there is really a
deadlock possibility in the code that we need to fix.

Regards,
Boqun

> [   28.419722] 2 locks held by systemd/1:
> [   28.420929]  #0: 000000009581da17 (rcu_read_lock){....}, at: lookup_mn=
t+0x5/0x18b
> [   28.423235]  #1: 00000000825eaf8f (rcu_callback){....}, at: rcu_do_bat=
ch+0x465/0x9cf
> [   28.425711] =

> [   28.425711] the shortest dependencies between 2nd lock and 1st lock:
> [   28.440366]  -> (tasklist_lock){.+.+} ops: 6684 {
> [   28.441766]     HARDIRQ-ON-RR at:
> [   28.442922]                        _raw_read_lock+0x5e/0x8f
> [   28.444414]                        do_prlimit+0x6e/0x191
> [   28.445907]                        __se_sys_getrlimit+0x36/0x76
> [   28.447589]                        do_syscall_64+0x5d/0x165
> [   28.449065]                        entry_SYSCALL_64_after_hwframe+0x49=
/0xbe
> [   28.450812]     SOFTIRQ-ON-RR at:
> [   28.451938]                        _raw_read_lock+0x5e/0x8f
> [   28.453473]                        do_prlimit+0x6e/0x191
> [   28.454959]                        __se_sys_getrlimit+0x36/0x76
> [   28.456575]                        do_syscall_64+0x5d/0x165
> [   28.458031]                        entry_SYSCALL_64_after_hwframe+0x49=
/0xbe
> [   28.459703]     INITIAL USE at:
> [   28.460857]                      _raw_write_lock_irq+0x3c/0x6d
> [   28.462377]                      copy_process+0x135d/0x1b5f
> [   28.464070]                      _do_fork+0xcc/0x648
> [   28.465461]                      kernel_thread+0x25/0x26
> [   28.466913]                      rest_init+0x22/0x22e
> [   28.468289]                      start_kernel+0x4bf/0x4df
> [   28.469714]                      secondary_startup_64+0xa5/0xb0
> [   28.471255]   }
> [   28.472134]   ... key      at: [<ffffffff8fa05118>] tasklist_lock+0x18=
/0x80
> [   28.484347]   ... acquired at:
> [   28.485497]    _raw_read_lock+0x5e/0x8f
> [   28.486669]    cgroup_mount+0xc2/0x3a2
> [   28.487872]    mount_fs+0x15/0x73
> [   28.489023]    vfs_kern_mount+0x6b/0x151
> [   28.490313]    do_mount+0x914/0xb73
> [   28.491442]    ksys_mount+0x72/0x97
> [   28.492563]    __x64_sys_mount+0x21/0x24
> [   28.493791]    do_syscall_64+0x5d/0x165
> [   28.494992]    entry_SYSCALL_64_after_hwframe+0x49/0xbe
> [   28.496498] =

> [   28.497283] -> (css_set_lock){..-.} ops: 653 {
> [   28.498554]    IN-SOFTIRQ at:
> [   28.499603]                   _raw_spin_lock_irqsave+0x48/0x7f
> [   28.501153]                   cgroup_free+0xf2/0x12a
> [   28.502586]                   __put_task_struct+0x36/0xc7
> [   28.504025]                   rcu_do_batch+0x71d/0x9cf
> [   28.505506]                   rcu_process_callbacks+0x2c5/0x3f0
> [   28.507029]                   __do_softirq+0x1fe/0x416
> [   28.508453]                   irq_exit+0x59/0xa8
> [   28.509813]                   smp_apic_timer_interrupt+0x285/0x290
> [   28.511352]                   apic_timer_interrupt+0xf/0x20
> [   28.512878]                   lookup_mnt+0xe2/0x18b
> [   28.514255]                   follow_managed+0x75/0x213
> [   28.515797]                   lookup_fast+0x3cc/0x405
> [   28.517266]                   walk_component+0xc9/0x255
> [   28.518846]                   link_path_walk+0x111/0x44f
> [   28.520238]                   path_parentat+0x2d/0x74
> [   28.521655]                   filename_parentat+0x79/0x142
> [   28.523176]                   do_rmdir+0x51/0x16d
> [   28.524580]                   do_syscall_64+0x5d/0x165
> [   28.526000]                   entry_SYSCALL_64_after_hwframe+0x49/0xbe
> [   28.527675]    INITIAL USE at:
> [   28.528821]                    _raw_spin_lock_irq+0x3c/0x6d
> [   28.530266]                    cgroup_setup_root+0x2ce/0x3b4
> [   28.531808]                    cgroup_init+0xde/0x3f7
> [   28.533219]                    start_kernel+0x491/0x4df
> [   28.534702]                    secondary_startup_64+0xa5/0xb0
> [   28.536186]  }
> [   28.537054]  ... key      at: [<ffffffff8fa8f218>] css_set_lock+0x18/0=
x60
> [   28.538727]  ... acquired at:
> [   28.539741]    lock_acquire+0x19c/0x1ce
> [   28.540971]    _raw_spin_lock_irqsave+0x48/0x7f
> [   28.542278]    cgroup_free+0xf2/0x12a
> [   28.543452]    __put_task_struct+0x36/0xc7
> [   28.544674]    rcu_do_batch+0x71d/0x9cf
> [   28.545885]    rcu_process_callbacks+0x2c5/0x3f0
> =

> =

> To reproduce:
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script # job-script is attached in =
this email
> =

> =

> =

> Thanks,
> Xiaolong

[...]

--===============4707033632834916091==--

