Content-Type: multipart/mixed; boundary="===============3884469753596366400=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: lkp@lists.01.org
Subject: Re: [EXP rcutorture] cd7bd64af5: BUG:workqueue_lockup-pool
Date: Fri, 04 Feb 2022 07:20:45 -0800
Message-ID: <20220204152045.GV4285@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20220204134023.GC4077@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============3884469753596366400==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 04, 2022 at 09:40:23PM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: cd7bd64af59fd15e0760a42f343c0fbb87121219 ("EXP rcutorture: Test p=
olled expedited grace-period primitives")
> https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/dev.2022.02.=
01a
> =

> in testcase: rcutorture
> version: =

> with following parameters:
> =

> 	runtime: 300s
> 	test: default
> 	torture_type: rcu
> =

> test-description: rcutorture is rcutorture kernel module load/unload test.
> test-url: https://www.kernel.org/doc/Documentation/RCU/torture.txt
> =

> =

> on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m =
4G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +--------------------------------------------------+------------+--------=
----+
> |                                                  | dd896a86ae | cd7bd64=
af5 |
> +--------------------------------------------------+------------+--------=
----+
> | boot_failures                                    | 0          | 12     =
    |
> | BUG:workqueue_lockup-pool                        | 0          | 12     =
    |
> | INFO:task_blocked_for_more_than#seconds          | 0          | 12     =
    |
> | Kernel_panic-not_syncing:hung_task:blocked_tasks | 0          | 12     =
    |
> +--------------------------------------------------+------------+--------=
----+
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>

A number of bugs were fixed in the new version at 25c0b105b7ba ("EXP rcu:
Add polled expedited grace-period primitives"), perhaps even including
this one.  Could you please check this newer commit?

							Thanx, Paul

> [  404.769244][    C1] BUG: workqueue lockup - pool cpus=3D1 node=3D0 fla=
gs=3D0x0 nice=3D0 stuck for 344s!
> [  404.769899][    C1] Showing busy workqueues and worker pools:
> [  404.770236][    C1] workqueue events: flags=3D0x0
> [  404.770466][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D14/256 refcnt=3D15
> [  404.770471][    C1]     pending: vmstat_shepherd, regulator_init_compl=
ete_work_function, e1000_watchdog, kfree_rcu_monitor, netstamp_clear, relea=
se_one_tty, release_one_tty, release_one_tty, release_one_tty, cgroup1_rele=
ase_agent, cgroup1_release_agent, release_one_tty, release_one_tty, cgroup1=
_release_agent
> [  404.770510][    C1] workqueue events_unbound: flags=3D0x2
> [  404.772331][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
1/512 refcnt=3D4
> [  404.772335][    C1]     in-flight: 42:fsnotify_mark_destroy_workfn BAR=
(1)
> [  404.772341][    C1] workqueue events_power_efficient: flags=3D0x82
> [  404.773307][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
1/256 refcnt=3D3
> [  404.773310][    C1]     pending: do_cache_clean
> [  404.773315][    C1] workqueue rcu_gp: flags=3D0x8
> [  404.774075][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D3/256 refcnt=3D4
> [  404.774077][    C1]     in-flight: 20:sync_rcu_do_polled_gp
> [  404.774080][    C1]     pending: sync_rcu_do_polled_gp, process_srcu
> [  404.774086][    C1] workqueue mm_percpu_wq: flags=3D0x8
> [  404.775196][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/256 refcnt=3D2
> [  404.775199][    C1]     pending: vmstat_update
> [  404.775205][    C1] workqueue cgroup_destroy: flags=3D0x0
> [  404.776139][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  404.776144][    C1]     pending: css_release_work_fn
> [  404.776150][    C1] workqueue cgroup_pidlist_destroy: flags=3D0x0
> [  404.777034][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D5
> [  404.777038][    C1]     pending: cgroup_pidlist_destroy_work_fn
> [  404.777042][    C1]     inactive: cgroup_pidlist_destroy_work_fn, cgro=
up_pidlist_destroy_work_fn, cgroup_pidlist_destroy_work_fn
> [  404.777074][    C1] workqueue ipv6_addrconf: flags=3D0x40008
> [  404.778358][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  404.778360][    C1]     pending: addrconf_verify_work
> [  404.778367][    C1] pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hun=
g=3D344s workers=3D3 idle: 66 349
> [  404.778375][    C1] pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s =
workers=3D3 idle: 38 46
> [  435.489212][    C1] BUG: workqueue lockup - pool cpus=3D1 node=3D0 fla=
gs=3D0x0 nice=3D0 stuck for 375s!
> [  435.489739][    C1] Showing busy workqueues and worker pools:
> [  435.490044][    C1] workqueue events: flags=3D0x0
> [  435.490319][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D14/256 refcnt=3D15
> [  435.490326][    C1]     pending: vmstat_shepherd, regulator_init_compl=
ete_work_function, e1000_watchdog, kfree_rcu_monitor, netstamp_clear, relea=
se_one_tty, release_one_tty, release_one_tty, release_one_tty, cgroup1_rele=
ase_agent, cgroup1_release_agent, release_one_tty, release_one_tty, cgroup1=
_release_agent
> [  435.490377][    C1] workqueue events_unbound: flags=3D0x2
> [  435.492869][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
1/512 refcnt=3D4
> [  435.492876][    C1]     in-flight: 42:fsnotify_mark_destroy_workfn BAR=
(1)
> [  435.492884][    C1] workqueue events_power_efficient: flags=3D0x82
> [  435.493972][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
1/256 refcnt=3D3
> [  435.493975][    C1]     pending: do_cache_clean
> [  435.493981][    C1] workqueue rcu_gp: flags=3D0x8
> [  435.495173][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D3/256 refcnt=3D4
> [  435.495179][    C1]     in-flight: 20:sync_rcu_do_polled_gp
> [  435.495185][    C1]     pending: sync_rcu_do_polled_gp, process_srcu
> [  435.495198][    C1] workqueue mm_percpu_wq: flags=3D0x8
> [  435.497174][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/256 refcnt=3D2
> [  435.497182][    C1]     pending: vmstat_update
> [  435.497858][    C1] workqueue cgroup_destroy: flags=3D0x0
> [  435.498136][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  435.498139][    C1]     pending: css_release_work_fn
> [  435.498144][    C1] workqueue cgroup_pidlist_destroy: flags=3D0x0
> [  435.499472][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D5
> [  435.499480][    C1]     pending: cgroup_pidlist_destroy_work_fn
> [  435.499486][    C1]     inactive: cgroup_pidlist_destroy_work_fn, cgro=
up_pidlist_destroy_work_fn, cgroup_pidlist_destroy_work_fn
> [  435.499504][    C1] workqueue ipv6_addrconf: flags=3D0x40008
> [  435.501230][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  435.501235][    C1]     pending: addrconf_verify_work
> [  435.501242][    C1] pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hun=
g=3D375s workers=3D3 idle: 66 349
> [  435.501248][    C1] pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s =
workers=3D3 idle: 38 46
> [  466.209199][    C1] BUG: workqueue lockup - pool cpus=3D1 node=3D0 fla=
gs=3D0x0 nice=3D0 stuck for 406s!
> [  466.209619][    C1] Showing busy workqueues and worker pools:
> [  466.209862][    C1] workqueue events: flags=3D0x0
> [  466.210066][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D14/256 refcnt=3D15
> [  466.210071][    C1]     pending: vmstat_shepherd, regulator_init_compl=
ete_work_function, e1000_watchdog, kfree_rcu_monitor, netstamp_clear, relea=
se_one_tty, release_one_tty, release_one_tty, release_one_tty, cgroup1_rele=
ase_agent, cgroup1_release_agent, release_one_tty, release_one_tty, cgroup1=
_release_agent
> [  466.210109][    C1] workqueue events_unbound: flags=3D0x2
> [  466.211716][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
1/512 refcnt=3D4
> [  466.211719][    C1]     in-flight: 42:fsnotify_mark_destroy_workfn BAR=
(1)
> [  466.211724][    C1] workqueue events_power_efficient: flags=3D0x82
> [  466.212536][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
1/256 refcnt=3D3
> [  466.212537][    C1]     pending: do_cache_clean
> [  466.212542][    C1] workqueue rcu_gp: flags=3D0x8
> [  466.213249][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D3/256 refcnt=3D4
> [  466.213251][    C1]     in-flight: 20:sync_rcu_do_polled_gp
> [  466.213254][    C1]     pending: sync_rcu_do_polled_gp, process_srcu
> [  466.213259][    C1] workqueue mm_percpu_wq: flags=3D0x8
> [  466.214273][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/256 refcnt=3D2
> [  466.214275][    C1]     pending: vmstat_update
> [  466.214278][    C1] workqueue cgroup_destroy: flags=3D0x0
> [  466.214986][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  466.214988][    C1]     pending: css_release_work_fn
> [  466.214992][    C1] workqueue cgroup_pidlist_destroy: flags=3D0x0
> [  466.215756][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D5
> [  466.215758][    C1]     pending: cgroup_pidlist_destroy_work_fn
> [  466.215760][    C1]     inactive: cgroup_pidlist_destroy_work_fn, cgro=
up_pidlist_destroy_work_fn, cgroup_pidlist_destroy_work_fn
> [  466.215777][    C1] workqueue ipv6_addrconf: flags=3D0x40008
> [  466.217010][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  466.217012][    C1]     pending: addrconf_verify_work
> [  466.217016][    C1] pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hun=
g=3D406s workers=3D3 idle: 66 349
> [  466.217023][    C1] pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s =
workers=3D3 idle: 38 46
> [  496.929236][    C1] BUG: workqueue lockup - pool cpus=3D1 node=3D0 fla=
gs=3D0x0 nice=3D0 stuck for 436s!
> [  496.929938][    C1] Showing busy workqueues and worker pools:
> [  496.930319][    C1] workqueue events: flags=3D0x0
> [  496.930621][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D14/256 refcnt=3D15
> [  496.930628][    C1]     pending: vmstat_shepherd, regulator_init_compl=
ete_work_function, e1000_watchdog, kfree_rcu_monitor, netstamp_clear, relea=
se_one_tty, release_one_tty, release_one_tty, release_one_tty, cgroup1_rele=
ase_agent, cgroup1_release_agent, release_one_tty, release_one_tty, cgroup1=
_release_agent
> [  496.930682][    C1] workqueue events_unbound: flags=3D0x2
> [  496.932520][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
1/512 refcnt=3D4
> [  496.932523][    C1]     in-flight: 42:fsnotify_mark_destroy_workfn BAR=
(1)
> [  496.932530][    C1] workqueue events_power_efficient: flags=3D0x82
> [  496.933496][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
1/256 refcnt=3D3
> [  496.933498][    C1]     pending: do_cache_clean
> [  496.933504][    C1] workqueue rcu_gp: flags=3D0x8
> [  496.934266][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D3/256 refcnt=3D4
> [  496.934268][    C1]     in-flight: 20:sync_rcu_do_polled_gp
> [  496.934271][    C1]     pending: sync_rcu_do_polled_gp, process_srcu
> [  496.934277][    C1] workqueue mm_percpu_wq: flags=3D0x8
> [  496.935517][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/256 refcnt=3D2
> [  496.935520][    C1]     pending: vmstat_update
> [  496.935526][    C1] workqueue cgroup_destroy: flags=3D0x0
> [  496.936304][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  496.936307][    C1]     pending: css_release_work_fn
> [  496.936311][    C1] workqueue cgroup_pidlist_destroy: flags=3D0x0
> [  496.937170][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D5
> [  496.937173][    C1]     pending: cgroup_pidlist_destroy_work_fn
> [  496.937176][    C1]     inactive: cgroup_pidlist_destroy_work_fn, cgro=
up_pidlist_destroy_work_fn, cgroup_pidlist_destroy_work_fn
> [  496.938374][    C1] workqueue ipv6_addrconf: flags=3D0x40008
> [  496.938629][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  496.938631][    C1]     pending: addrconf_verify_work
> [  496.938638][    C1] pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hun=
g=3D436s workers=3D3 idle: 66 349
> [  496.938643][    C1] pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s =
workers=3D3 idle: 38 46
> [  527.649241][    C1] BUG: workqueue lockup - pool cpus=3D1 node=3D0 fla=
gs=3D0x0 nice=3D0 stuck for 467s!
> [  527.649968][    C1] Showing busy workqueues and worker pools:
> [  527.650363][    C1] workqueue events: flags=3D0x0
> [  527.650680][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D14/256 refcnt=3D15
> [  527.650688][    C1]     pending: vmstat_shepherd, regulator_init_compl=
ete_work_function, e1000_watchdog, kfree_rcu_monitor, netstamp_clear, relea=
se_one_tty, release_one_tty, release_one_tty, release_one_tty, cgroup1_rele=
ase_agent, cgroup1_release_agent, release_one_tty, release_one_tty, cgroup1=
_release_agent
> [  527.650741][    C1] workqueue events_unbound: flags=3D0x2
> [  527.653473][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
1/512 refcnt=3D4
> [  527.653479][    C1]     in-flight: 42:fsnotify_mark_destroy_workfn BAR=
(1)
> [  527.653491][    C1] workqueue events_power_efficient: flags=3D0x82
> [  527.654878][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
1/256 refcnt=3D3
> [  527.654884][    C1]     pending: do_cache_clean
> [  527.654892][    C1] workqueue rcu_gp: flags=3D0x8
> [  527.655990][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D3/256 refcnt=3D4
> [  527.655996][    C1]     in-flight: 20:sync_rcu_do_polled_gp
> [  527.656003][    C1]     pending: sync_rcu_do_polled_gp, process_srcu
> [  527.656015][    C1] workqueue mm_percpu_wq: flags=3D0x8
> [  527.657742][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/256 refcnt=3D2
> [  527.657749][    C1]     pending: vmstat_update
> [  527.657760][    C1] workqueue cgroup_destroy: flags=3D0x0
> [  527.658930][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  527.658936][    C1]     pending: css_release_work_fn
> [  527.658942][    C1] workqueue cgroup_pidlist_destroy: flags=3D0x0
> [  527.660220][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D5
> [  527.660226][    C1]     pending: cgroup_pidlist_destroy_work_fn
> [  527.660232][    C1]     inactive: cgroup_pidlist_destroy_work_fn, cgro=
up_pidlist_destroy_work_fn, cgroup_pidlist_destroy_work_fn
> [  527.660251][    C1] workqueue ipv6_addrconf: flags=3D0x40008
> [  527.662464][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  527.662472][    C1]     pending: addrconf_verify_work
> [  527.662481][    C1] pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hun=
g=3D467s workers=3D3 idle: 66 349
> [  527.662490][    C1] pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s =
workers=3D3 idle: 38 46
> [  558.369243][    C1] BUG: workqueue lockup - pool cpus=3D1 node=3D0 fla=
gs=3D0x0 nice=3D0 stuck for 498s!
> [  558.369866][    C1] Showing busy workqueues and worker pools:
> [  558.370230][    C1] workqueue events: flags=3D0x0
> [  558.370529][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D14/256 refcnt=3D15
> [  558.370535][    C1]     pending: vmstat_shepherd, regulator_init_compl=
ete_work_function, e1000_watchdog, kfree_rcu_monitor, netstamp_clear, relea=
se_one_tty, release_one_tty, release_one_tty, release_one_tty, cgroup1_rele=
ase_agent, cgroup1_release_agent, release_one_tty, release_one_tty, cgroup1=
_release_agent
> [  558.370577][    C1] workqueue events_unbound: flags=3D0x2
> [  558.373065][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
1/512 refcnt=3D4
> [  558.373070][    C1]     in-flight: 42:fsnotify_mark_destroy_workfn BAR=
(1)
> [  558.373079][    C1] workqueue events_power_efficient: flags=3D0x82
> [  558.374425][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
1/256 refcnt=3D3
> [  558.374430][    C1]     pending: do_cache_clean
> [  558.374435][    C1] workqueue rcu_gp: flags=3D0x8
> [  558.375465][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D3/256 refcnt=3D4
> [  558.375470][    C1]     in-flight: 20:sync_rcu_do_polled_gp
> [  558.375476][    C1]     pending: sync_rcu_do_polled_gp, process_srcu
> [  558.375487][    C1] workqueue mm_percpu_wq: flags=3D0x8
> [  558.377063][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/256 refcnt=3D2
> [  558.377068][    C1]     pending: vmstat_update
> [  558.377075][    C1] workqueue cgroup_destroy: flags=3D0x0
> [  558.378207][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  558.378211][    C1]     pending: css_release_work_fn
> [  558.378217][    C1] workqueue cgroup_pidlist_destroy: flags=3D0x0
> [  558.379364][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D5
> [  558.379368][    C1]     pending: cgroup_pidlist_destroy_work_fn
> [  558.379373][    C1]     inactive: cgroup_pidlist_destroy_work_fn, cgro=
up_pidlist_destroy_work_fn, cgroup_pidlist_destroy_work_fn
> [  558.379405][    C1] workqueue ipv6_addrconf: flags=3D0x40008
> [  558.381353][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  558.381359][    C1]     pending: addrconf_verify_work
> [  558.381368][    C1] pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hun=
g=3D498s workers=3D3 idle: 66 349
> [  558.381383][    C1] pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s =
workers=3D3 idle: 38 46
> [  589.089225][    C1] BUG: workqueue lockup - pool cpus=3D1 node=3D0 fla=
gs=3D0x0 nice=3D0 stuck for 529s!
> [  589.089813][    C1] Showing busy workqueues and worker pools:
> [  589.090168][    C1] workqueue events: flags=3D0x0
> [  589.090430][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D14/256 refcnt=3D15
> [  589.090436][    C1]     pending: vmstat_shepherd, regulator_init_compl=
ete_work_function, e1000_watchdog, kfree_rcu_monitor, netstamp_clear, relea=
se_one_tty, release_one_tty, release_one_tty, release_one_tty, cgroup1_rele=
ase_agent, cgroup1_release_agent, release_one_tty, release_one_tty, cgroup1=
_release_agent
> [  589.090477][    C1] workqueue events_unbound: flags=3D0x2
> [  589.092851][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
1/512 refcnt=3D4
> [  589.092858][    C1]     in-flight: 42:fsnotify_mark_destroy_workfn BAR=
(1)
> [  589.092867][    C1] workqueue events_power_efficient: flags=3D0x82
> [  589.094171][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
1/256 refcnt=3D3
> [  589.094178][    C1]     pending: do_cache_clean
> [  589.094184][    C1] workqueue rcu_gp: flags=3D0x8
> [  589.095196][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D3/256 refcnt=3D4
> [  589.095202][    C1]     in-flight: 20:sync_rcu_do_polled_gp
> [  589.095208][    C1]     pending: sync_rcu_do_polled_gp, process_srcu
> [  589.095218][    C1] workqueue mm_percpu_wq: flags=3D0x8
> [  589.096731][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/256 refcnt=3D2
> [  589.096737][    C1]     pending: vmstat_update
> [  589.096747][    C1] workqueue cgroup_destroy: flags=3D0x0
> [  589.097860][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  589.097866][    C1]     pending: css_release_work_fn
> [  589.097873][    C1] workqueue cgroup_pidlist_destroy: flags=3D0x0
> [  589.099002][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D5
> [  589.099007][    C1]     pending: cgroup_pidlist_destroy_work_fn
> [  589.099012][    C1]     inactive: cgroup_pidlist_destroy_work_fn, cgro=
up_pidlist_destroy_work_fn, cgroup_pidlist_destroy_work_fn
> [  589.099027][    C1] workqueue ipv6_addrconf: flags=3D0x40008
> [  589.100896][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  589.100902][    C1]     pending: addrconf_verify_work
> [  589.100910][    C1] pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hun=
g=3D529s workers=3D3 idle: 66 349
> [  589.100916][    C1] pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s =
workers=3D3 idle: 38 46
> [  619.809197][    C1] BUG: workqueue lockup - pool cpus=3D1 node=3D0 fla=
gs=3D0x0 nice=3D0 stuck for 559s!
> [  619.809634][    C1] Showing busy workqueues and worker pools:
> [  619.809877][    C1] workqueue events: flags=3D0x0
> [  619.810130][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D14/256 refcnt=3D15
> [  619.810136][    C1]     pending: vmstat_shepherd, regulator_init_compl=
ete_work_function, e1000_watchdog, kfree_rcu_monitor, netstamp_clear, relea=
se_one_tty, release_one_tty, release_one_tty, release_one_tty, cgroup1_rele=
ase_agent, cgroup1_release_agent, release_one_tty, release_one_tty, cgroup1=
_release_agent
> [  619.810180][    C1] workqueue events_unbound: flags=3D0x2
> [  619.812557][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
1/512 refcnt=3D4
> [  619.812564][    C1]     in-flight: 42:fsnotify_mark_destroy_workfn BAR=
(1)
> [  619.812573][    C1] workqueue events_power_efficient: flags=3D0x82
> [  619.813896][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
1/256 refcnt=3D3
> [  619.813902][    C1]     pending: do_cache_clean
> [  619.813907][    C1] workqueue rcu_gp: flags=3D0x8
> [  619.814968][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D3/256 refcnt=3D4
> [  619.814974][    C1]     in-flight: 20:sync_rcu_do_polled_gp
> [  619.814981][    C1]     pending: sync_rcu_do_polled_gp, process_srcu
> [  619.814991][    C1] workqueue mm_percpu_wq: flags=3D0x8
> [  619.816548][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/256 refcnt=3D2
> [  619.816553][    C1]     pending: vmstat_update
> [  619.816562][    C1] workqueue cgroup_destroy: flags=3D0x0
> [  619.817653][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  619.817658][    C1]     pending: css_release_work_fn
> [  619.817664][    C1] workqueue cgroup_pidlist_destroy: flags=3D0x0
> [  619.818796][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D5
> [  619.818799][    C1]     pending: cgroup_pidlist_destroy_work_fn
> [  619.818804][    C1]     inactive: cgroup_pidlist_destroy_work_fn, cgro=
up_pidlist_destroy_work_fn, cgroup_pidlist_destroy_work_fn
> [  619.818818][    C1] workqueue ipv6_addrconf: flags=3D0x40008
> [  619.820619][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  619.820623][    C1]     pending: addrconf_verify_work
> [  619.820630][    C1] pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hun=
g=3D559s workers=3D3 idle: 66 349
> [  619.820635][    C1] pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s =
workers=3D3 idle: 46 38
> [  650.529205][    C1] BUG: workqueue lockup - pool cpus=3D1 node=3D0 fla=
gs=3D0x0 nice=3D0 stuck for 590s!
> [  650.529754][    C1] Showing busy workqueues and worker pools:
> [  650.530069][    C1] workqueue events: flags=3D0x0
> [  650.530325][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D14/256 refcnt=3D15
> [  650.530330][    C1]     pending: vmstat_shepherd, regulator_init_compl=
ete_work_function, e1000_watchdog, kfree_rcu_monitor, netstamp_clear, relea=
se_one_tty, release_one_tty, release_one_tty, release_one_tty, cgroup1_rele=
ase_agent, cgroup1_release_agent, release_one_tty, release_one_tty, cgroup1=
_release_agent
> [  650.530367][    C1] workqueue events_unbound: flags=3D0x2
> [  650.532510][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
1/512 refcnt=3D4
> [  650.532513][    C1]     in-flight: 42:fsnotify_mark_destroy_workfn BAR=
(1)
> [  650.532518][    C1] workqueue events_power_efficient: flags=3D0x82
> [  650.533633][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
1/256 refcnt=3D3
> [  650.533636][    C1]     pending: do_cache_clean
> [  650.533640][    C1] workqueue rcu_gp: flags=3D0x8
> [  650.534533][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D3/256 refcnt=3D4
> [  650.534535][    C1]     in-flight: 20:sync_rcu_do_polled_gp
> [  650.534538][    C1]     pending: sync_rcu_do_polled_gp, process_srcu
> [  650.534544][    C1] workqueue mm_percpu_wq: flags=3D0x8
> [  650.535876][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/256 refcnt=3D2
> [  650.535879][    C1]     pending: vmstat_update
> [  650.535883][    C1] workqueue cgroup_destroy: flags=3D0x0
> [  650.536811][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  650.536814][    C1]     pending: css_release_work_fn
> [  650.536819][    C1] workqueue cgroup_pidlist_destroy: flags=3D0x0
> [  650.537912][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D5
> [  650.537916][    C1]     pending: cgroup_pidlist_destroy_work_fn
> [  650.537918][    C1]     inactive: cgroup_pidlist_destroy_work_fn, cgro=
up_pidlist_destroy_work_fn, cgroup_pidlist_destroy_work_fn
> [  650.537932][    C1] workqueue ipv6_addrconf: flags=3D0x40008
> [  650.539682][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  650.539685][    C1]     pending: addrconf_verify_work
> [  650.539690][    C1] pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hun=
g=3D590s workers=3D3 idle: 66 349
> [  650.539696][    C1] pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s =
workers=3D3 idle: 46 38
> [  681.249194][    C1] BUG: workqueue lockup - pool cpus=3D1 node=3D0 fla=
gs=3D0x0 nice=3D0 stuck for 621s!
> [  681.249593][    C1] Showing busy workqueues and worker pools:
> [  681.249828][    C1] workqueue events: flags=3D0x0
> [  681.250017][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D14/256 refcnt=3D15
> [  681.250021][    C1]     pending: vmstat_shepherd, regulator_init_compl=
ete_work_function, e1000_watchdog, kfree_rcu_monitor, netstamp_clear, relea=
se_one_tty, release_one_tty, release_one_tty, release_one_tty, cgroup1_rele=
ase_agent, cgroup1_release_agent, release_one_tty, release_one_tty, cgroup1=
_release_agent
> [  681.250055][    C1] workqueue events_unbound: flags=3D0x2
> [  681.251631][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
1/512 refcnt=3D4
> [  681.251634][    C1]     in-flight: 42:fsnotify_mark_destroy_workfn BAR=
(1)
> [  681.251639][    C1] workqueue events_power_efficient: flags=3D0x82
> [  681.252448][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
1/256 refcnt=3D3
> [  681.252450][    C1]     pending: do_cache_clean
> [  681.252454][    C1] workqueue rcu_gp: flags=3D0x8
> [  681.253111][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D3/256 refcnt=3D4
> [  681.253113][    C1]     in-flight: 20:sync_rcu_do_polled_gp
> [  681.253116][    C1]     pending: sync_rcu_do_polled_gp, process_srcu
> [  681.253121][    C1] workqueue mm_percpu_wq: flags=3D0x8
> [  681.254141][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/256 refcnt=3D2
> [  681.254143][    C1]     pending: vmstat_update
> [  681.254147][    C1] workqueue cgroup_destroy: flags=3D0x0
> [  681.254854][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  681.254856][    C1]     pending: css_release_work_fn
> [  681.254861][    C1] workqueue cgroup_pidlist_destroy: flags=3D0x0
> [  681.255601][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D5
> [  681.255603][    C1]     pending: cgroup_pidlist_destroy_work_fn
> [  681.255605][    C1]     inactive: cgroup_pidlist_destroy_work_fn, cgro=
up_pidlist_destroy_work_fn, cgroup_pidlist_destroy_work_fn
> [  681.255618][    C1] workqueue ipv6_addrconf: flags=3D0x40008
> [  681.256831][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  681.256833][    C1]     pending: addrconf_verify_work
> [  681.256837][    C1] pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hun=
g=3D621s workers=3D3 idle: 66 349
> [  681.256843][    C1] pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s =
workers=3D3 idle: 46 38
> [  711.969200][    C1] BUG: workqueue lockup - pool cpus=3D1 node=3D0 fla=
gs=3D0x0 nice=3D0 stuck for 651s!
> [  711.969594][    C1] Showing busy workqueues and worker pools:
> [  711.969830][    C1] workqueue events: flags=3D0x0
> [  711.970027][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D14/256 refcnt=3D15
> [  711.970031][    C1]     pending: vmstat_shepherd, regulator_init_compl=
ete_work_function, e1000_watchdog, kfree_rcu_monitor, netstamp_clear, relea=
se_one_tty, release_one_tty, release_one_tty, release_one_tty, cgroup1_rele=
ase_agent, cgroup1_release_agent, release_one_tty, release_one_tty, cgroup1=
_release_agent
> [  711.970065][    C1] workqueue events_unbound: flags=3D0x2
> [  711.971645][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
1/512 refcnt=3D4
> [  711.971647][    C1]     in-flight: 42:fsnotify_mark_destroy_workfn BAR=
(1)
> [  711.971652][    C1] workqueue events_power_efficient: flags=3D0x82
> [  711.972452][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
1/256 refcnt=3D3
> [  711.972454][    C1]     pending: do_cache_clean
> [  711.972458][    C1] workqueue rcu_gp: flags=3D0x8
> [  711.973118][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D3/256 refcnt=3D4
> [  711.973120][    C1]     in-flight: 20:sync_rcu_do_polled_gp
> [  711.973123][    C1]     pending: sync_rcu_do_polled_gp, process_srcu
> [  711.973127][    C1] workqueue mm_percpu_wq: flags=3D0x8
> [  711.974145][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/256 refcnt=3D2
> [  711.974147][    C1]     pending: vmstat_update
> [  711.974150][    C1] workqueue cgroup_destroy: flags=3D0x0
> [  711.974848][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  711.974851][    C1]     pending: css_release_work_fn
> [  711.974855][    C1] workqueue cgroup_pidlist_destroy: flags=3D0x0
> [  711.975595][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D5
> [  711.975597][    C1]     pending: cgroup_pidlist_destroy_work_fn
> [  711.975598][    C1]     inactive: cgroup_pidlist_destroy_work_fn, cgro=
up_pidlist_destroy_work_fn, cgroup_pidlist_destroy_work_fn
> [  711.975609][    C1] workqueue ipv6_addrconf: flags=3D0x40008
> [  711.976827][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  711.976829][    C1]     pending: addrconf_verify_work
> [  711.976833][    C1] pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hun=
g=3D651s workers=3D3 idle: 66 349
> [  711.976837][    C1] pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s =
workers=3D3 idle: 46 38
> [  742.689211][    C1] BUG: workqueue lockup - pool cpus=3D1 node=3D0 fla=
gs=3D0x0 nice=3D0 stuck for 682s!
> [  742.689860][    C1] Showing busy workqueues and worker pools:
> [  742.690172][    C1] workqueue events: flags=3D0x0
> [  742.690451][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D14/256 refcnt=3D15
> [  742.690459][    C1]     pending: vmstat_shepherd, regulator_init_compl=
ete_work_function, e1000_watchdog, kfree_rcu_monitor, netstamp_clear, relea=
se_one_tty, release_one_tty, release_one_tty, release_one_tty, cgroup1_rele=
ase_agent, cgroup1_release_agent, release_one_tty, release_one_tty, cgroup1=
_release_agent
> [  742.690530][    C1] workqueue events_unbound: flags=3D0x2
> [  742.693439][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
1/512 refcnt=3D4
> [  742.693446][    C1]     in-flight: 42:fsnotify_mark_destroy_workfn BAR=
(1)
> [  742.693457][    C1] workqueue events_power_efficient: flags=3D0x82
> [  742.694791][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
1/256 refcnt=3D3
> [  742.694797][    C1]     pending: do_cache_clean
> [  742.694804][    C1] workqueue rcu_gp: flags=3D0x8
> [  742.695888][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D3/256 refcnt=3D4
> [  742.695893][    C1]     in-flight: 20:sync_rcu_do_polled_gp
> [  742.695899][    C1]     pending: sync_rcu_do_polled_gp, process_srcu
> [  742.695913][    C1] workqueue mm_percpu_wq: flags=3D0x8
> [  742.697403][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/256 refcnt=3D2
> [  742.697408][    C1]     pending: vmstat_update
> [  742.697417][    C1] workqueue cgroup_destroy: flags=3D0x0
> [  742.698357][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  742.698360][    C1]     pending: css_release_work_fn
> [  742.698365][    C1] workqueue cgroup_pidlist_destroy: flags=3D0x0
> [  742.699349][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D5
> [  742.699353][    C1]     pending: cgroup_pidlist_destroy_work_fn
> [  742.699356][    C1]     inactive: cgroup_pidlist_destroy_work_fn, cgro=
up_pidlist_destroy_work_fn, cgroup_pidlist_destroy_work_fn
> [  742.699424][    C1] workqueue ipv6_addrconf: flags=3D0x40008
> [  742.701768][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  742.701778][    C1]     pending: addrconf_verify_work
> [  742.701788][    C1] pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hun=
g=3D682s workers=3D3 idle: 66 349
> [  742.701811][    C1] pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s =
workers=3D3 idle: 46 38
> [  773.409208][    C1] BUG: workqueue lockup - pool cpus=3D1 node=3D0 fla=
gs=3D0x0 nice=3D0 stuck for 713s!
> [  773.409749][    C1] Showing busy workqueues and worker pools:
> [  773.410077][    C1] workqueue events: flags=3D0x0
> [  773.410353][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D14/256 refcnt=3D15
> [  773.410361][    C1]     pending: vmstat_shepherd, regulator_init_compl=
ete_work_function, e1000_watchdog, kfree_rcu_monitor, netstamp_clear, relea=
se_one_tty, release_one_tty, release_one_tty, release_one_tty, cgroup1_rele=
ase_agent, cgroup1_release_agent, release_one_tty, release_one_tty, cgroup1=
_release_agent
> [  773.410418][    C1] workqueue events_unbound: flags=3D0x2
> [  773.412394][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
1/512 refcnt=3D4
> [  773.412398][    C1]     in-flight: 42:fsnotify_mark_destroy_workfn BAR=
(1)
> [  773.412405][    C1] workqueue events_power_efficient: flags=3D0x82
> [  773.413293][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
1/256 refcnt=3D3
> [  773.413296][    C1]     pending: do_cache_clean
> [  773.413300][    C1] workqueue rcu_gp: flags=3D0x8
> [  773.414018][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D3/256 refcnt=3D4
> [  773.414021][    C1]     in-flight: 20:sync_rcu_do_polled_gp
> [  773.414025][    C1]     pending: sync_rcu_do_polled_gp, process_srcu
> [  773.414033][    C1] workqueue mm_percpu_wq: flags=3D0x8
> [  773.415053][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/256 refcnt=3D2
> [  773.415055][    C1]     pending: vmstat_update
> [  773.415060][    C1] workqueue cgroup_destroy: flags=3D0x0
> [  773.415771][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  773.415773][    C1]     pending: css_release_work_fn
> [  773.415777][    C1] workqueue cgroup_pidlist_destroy: flags=3D0x0
> [  773.416542][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D5
> [  773.416544][    C1]     pending: cgroup_pidlist_destroy_work_fn
> [  773.416547][    C1]     inactive: cgroup_pidlist_destroy_work_fn, cgro=
up_pidlist_destroy_work_fn, cgroup_pidlist_destroy_work_fn
> [  773.416571][    C1] workqueue ipv6_addrconf: flags=3D0x40008
> [  773.417849][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  773.417851][    C1]     pending: addrconf_verify_work
> [  773.417857][    C1] pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hun=
g=3D713s workers=3D3 idle: 66 349
> [  773.417869][    C1] pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s =
workers=3D3 idle: 46 38
> [  804.129239][    C1] BUG: workqueue lockup - pool cpus=3D1 node=3D0 fla=
gs=3D0x0 nice=3D0 stuck for 744s!
> [  804.129874][    C1] Showing busy workqueues and worker pools:
> [  804.130228][    C1] workqueue events: flags=3D0x0
> [  804.130514][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D14/256 refcnt=3D15
> [  804.130521][    C1]     pending: vmstat_shepherd, regulator_init_compl=
ete_work_function, e1000_watchdog, kfree_rcu_monitor, netstamp_clear, relea=
se_one_tty, release_one_tty, release_one_tty, release_one_tty, cgroup1_rele=
ase_agent, cgroup1_release_agent, release_one_tty, release_one_tty, cgroup1=
_release_agent
> [  804.130565][    C1] workqueue events_unbound: flags=3D0x2
> [  804.132974][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
1/512 refcnt=3D4
> [  804.132981][    C1]     in-flight: 42:fsnotify_mark_destroy_workfn BAR=
(1)
> [  804.132991][    C1] workqueue events_power_efficient: flags=3D0x82
> [  804.134298][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
1/256 refcnt=3D3
> [  804.134304][    C1]     pending: do_cache_clean
> [  804.134311][    C1] workqueue rcu_gp: flags=3D0x8
> [  804.135314][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D3/256 refcnt=3D4
> [  804.135320][    C1]     in-flight: 20:sync_rcu_do_polled_gp
> [  804.135326][    C1]     pending: sync_rcu_do_polled_gp, process_srcu
> [  804.135337][    C1] workqueue mm_percpu_wq: flags=3D0x8
> [  804.136834][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/256 refcnt=3D2
> [  804.136841][    C1]     pending: vmstat_update
> [  804.136852][    C1] workqueue cgroup_destroy: flags=3D0x0
> [  804.137935][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  804.137941][    C1]     pending: css_release_work_fn
> [  804.137949][    C1] workqueue cgroup_pidlist_destroy: flags=3D0x0
> [  804.139045][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D5
> [  804.139052][    C1]     pending: cgroup_pidlist_destroy_work_fn
> [  804.139057][    C1]     inactive: cgroup_pidlist_destroy_work_fn, cgro=
up_pidlist_destroy_work_fn, cgroup_pidlist_destroy_work_fn
> [  804.139105][    C1] workqueue ipv6_addrconf: flags=3D0x40008
> [  804.140937][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  804.140945][    C1]     pending: addrconf_verify_work
> [  804.140954][    C1] pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hun=
g=3D744s workers=3D3 idle: 66 349
> [  804.140977][    C1] pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s =
workers=3D3 idle: 46 38
> [  834.849233][    C1] BUG: workqueue lockup - pool cpus=3D1 node=3D0 fla=
gs=3D0x0 nice=3D0 stuck for 774s!
> [  834.849818][    C1] Showing busy workqueues and worker pools:
> [  834.850168][    C1] workqueue events: flags=3D0x0
> [  834.850447][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D14/256 refcnt=3D15
> [  834.850453][    C1]     pending: vmstat_shepherd, regulator_init_compl=
ete_work_function, e1000_watchdog, kfree_rcu_monitor, netstamp_clear, relea=
se_one_tty, release_one_tty, release_one_tty, release_one_tty, cgroup1_rele=
ase_agent, cgroup1_release_agent, release_one_tty, release_one_tty, cgroup1=
_release_agent
> [  834.850501][    C1] workqueue events_unbound: flags=3D0x2
> [  834.852932][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
1/512 refcnt=3D4
> [  834.852937][    C1]     in-flight: 42:fsnotify_mark_destroy_workfn BAR=
(1)
> [  834.852946][    C1] workqueue events_power_efficient: flags=3D0x82
> [  834.854116][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
1/256 refcnt=3D3
> [  834.854121][    C1]     pending: do_cache_clean
> [  834.854127][    C1] workqueue rcu_gp: flags=3D0x8
> [  834.854983][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D3/256 refcnt=3D4
> [  834.854987][    C1]     in-flight: 20:sync_rcu_do_polled_gp
> [  834.854992][    C1]     pending: sync_rcu_do_polled_gp, process_srcu
> [  834.855003][    C1] workqueue mm_percpu_wq: flags=3D0x8
> [  834.856394][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/256 refcnt=3D2
> [  834.856398][    C1]     pending: vmstat_update
> [  834.856406][    C1] workqueue cgroup_destroy: flags=3D0x0
> [  834.857399][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  834.857404][    C1]     pending: css_release_work_fn
> [  834.857410][    C1] workqueue cgroup_pidlist_destroy: flags=3D0x0
> [  834.858368][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D5
> [  834.858373][    C1]     pending: cgroup_pidlist_destroy_work_fn
> [  834.858377][    C1]     inactive: cgroup_pidlist_destroy_work_fn, cgro=
up_pidlist_destroy_work_fn, cgroup_pidlist_destroy_work_fn
> [  834.858390][    C1] workqueue ipv6_addrconf: flags=3D0x40008
> [  834.859672][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  834.859675][    C1]     pending: addrconf_verify_work
> [  834.859681][    C1] pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hun=
g=3D774s workers=3D3 idle: 66 349
> [  834.859685][    C1] pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s =
workers=3D3 idle: 46 38
> [  865.569243][    C1] BUG: workqueue lockup - pool cpus=3D1 node=3D0 fla=
gs=3D0x0 nice=3D0 stuck for 805s!
> [  865.569924][    C1] Showing busy workqueues and worker pools:
> [  865.570299][    C1] workqueue events: flags=3D0x0
> [  865.570607][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D14/256 refcnt=3D15
> [  865.570615][    C1]     pending: vmstat_shepherd, regulator_init_compl=
ete_work_function, e1000_watchdog, kfree_rcu_monitor, netstamp_clear, relea=
se_one_tty, release_one_tty, release_one_tty, release_one_tty, cgroup1_rele=
ase_agent, cgroup1_release_agent, release_one_tty, release_one_tty, cgroup1=
_release_agent
> [  865.570668][    C1] workqueue events_unbound: flags=3D0x2
> [  865.573348][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
1/512 refcnt=3D4
> [  865.573357][    C1]     in-flight: 42:fsnotify_mark_destroy_workfn BAR=
(1)
> [  865.573368][    C1] workqueue events_power_efficient: flags=3D0x82
> [  865.574708][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
1/256 refcnt=3D3
> [  865.574715][    C1]     pending: do_cache_clean
> [  865.574725][    C1] workqueue rcu_gp: flags=3D0x8
> [  865.575836][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D3/256 refcnt=3D4
> [  865.575843][    C1]     in-flight: 20:sync_rcu_do_polled_gp
> [  865.575850][    C1]     pending: sync_rcu_do_polled_gp, process_srcu
> [  865.575863][    C1] workqueue mm_percpu_wq: flags=3D0x8
> [  865.577456][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/256 refcnt=3D2
> [  865.577462][    C1]     pending: vmstat_update
> [  865.577474][    C1] workqueue cgroup_destroy: flags=3D0x0
> [  865.578530][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  865.578536][    C1]     pending: css_release_work_fn
> [  865.578544][    C1] workqueue cgroup_pidlist_destroy: flags=3D0x0
> [  865.579692][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D5
> [  865.579699][    C1]     pending: cgroup_pidlist_destroy_work_fn
> [  865.579704][    C1]     inactive: cgroup_pidlist_destroy_work_fn, cgro=
up_pidlist_destroy_work_fn, cgroup_pidlist_destroy_work_fn
> [  865.579723][    C1] workqueue ipv6_addrconf: flags=3D0x40008
> [  865.581659][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  865.581667][    C1]     pending: addrconf_verify_work
> [  865.581678][    C1] pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hun=
g=3D805s workers=3D3 idle: 66 349
> [  865.581687][    C1] pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s =
workers=3D3 idle: 46 38
> [  896.289222][    C1] BUG: workqueue lockup - pool cpus=3D1 node=3D0 fla=
gs=3D0x0 nice=3D0 stuck for 836s!
> [  896.289808][    C1] Showing busy workqueues and worker pools:
> [  896.290127][    C1] workqueue events: flags=3D0x0
> [  896.290395][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D14/256 refcnt=3D15
> [  896.290401][    C1]     pending: vmstat_shepherd, regulator_init_compl=
ete_work_function, e1000_watchdog, kfree_rcu_monitor, netstamp_clear, relea=
se_one_tty, release_one_tty, release_one_tty, release_one_tty, cgroup1_rele=
ase_agent, cgroup1_release_agent, release_one_tty, release_one_tty, cgroup1=
_release_agent
> [  896.290445][    C1] workqueue events_unbound: flags=3D0x2
> [  896.292298][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
1/512 refcnt=3D4
> [  896.292302][    C1]     in-flight: 42:fsnotify_mark_destroy_workfn BAR=
(1)
> [  896.292309][    C1] workqueue rcu_gp: flags=3D0x8
> [  896.293480][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D3/256 refcnt=3D4
> [  896.293484][    C1]     in-flight: 20:sync_rcu_do_polled_gp
> [  896.293491][    C1]     pending: sync_rcu_do_polled_gp, process_srcu
> [  896.293502][    C1] workqueue mm_percpu_wq: flags=3D0x8
> [  896.294824][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/256 refcnt=3D2
> [  896.294829][    C1]     pending: vmstat_update
> [  896.294840][    C1] workqueue cgroup_destroy: flags=3D0x0
> [  896.295891][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  896.295895][    C1]     pending: css_release_work_fn
> [  896.295903][    C1] workqueue cgroup_pidlist_destroy: flags=3D0x0
> [  896.297028][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D5
> [  896.297034][    C1]     pending: cgroup_pidlist_destroy_work_fn
> [  896.297039][    C1]     inactive: cgroup_pidlist_destroy_work_fn, cgro=
up_pidlist_destroy_work_fn, cgroup_pidlist_destroy_work_fn
> [  896.297084][    C1] workqueue ipv6_addrconf: flags=3D0x40008
> [  896.298709][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  896.298715][    C1]     pending: addrconf_verify_work
> [  896.298723][    C1] pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hun=
g=3D836s workers=3D3 idle: 66 349
> [  896.298740][    C1] pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s =
workers=3D3 idle: 46 38
> [  927.009259][    C1] BUG: workqueue lockup - pool cpus=3D1 node=3D0 fla=
gs=3D0x0 nice=3D0 stuck for 867s!
> [  927.009875][    C1] Showing busy workqueues and worker pools:
> [  927.010226][    C1] workqueue events: flags=3D0x0
> [  927.010530][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D14/256 refcnt=3D15
> [  927.010537][    C1]     pending: vmstat_shepherd, regulator_init_compl=
ete_work_function, e1000_watchdog, kfree_rcu_monitor, netstamp_clear, relea=
se_one_tty, release_one_tty, release_one_tty, release_one_tty, cgroup1_rele=
ase_agent, cgroup1_release_agent, release_one_tty, release_one_tty, cgroup1=
_release_agent
> [  927.010586][    C1] workqueue events_unbound: flags=3D0x2
> [  927.013092][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
1/512 refcnt=3D4
> [  927.013099][    C1]     in-flight: 42:fsnotify_mark_destroy_workfn BAR=
(1)
> [  927.013108][    C1] workqueue rcu_gp: flags=3D0x8
> [  927.014386][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D3/256 refcnt=3D4
> [  927.014391][    C1]     in-flight: 20:sync_rcu_do_polled_gp
> [  927.014398][    C1]     pending: sync_rcu_do_polled_gp, process_srcu
> [  927.014408][    C1] workqueue mm_percpu_wq: flags=3D0x8
> [  927.015995][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/256 refcnt=3D2
> [  927.016000][    C1]     pending: vmstat_update
> [  927.016008][    C1] workqueue cgroup_destroy: flags=3D0x0
> [  927.017130][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  927.017134][    C1]     pending: css_release_work_fn
> [  927.017140][    C1] workqueue cgroup_pidlist_destroy: flags=3D0x0
> [  927.018372][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D5
> [  927.018376][    C1]     pending: cgroup_pidlist_destroy_work_fn
> [  927.018380][    C1]     inactive: cgroup_pidlist_destroy_work_fn, cgro=
up_pidlist_destroy_work_fn, cgroup_pidlist_destroy_work_fn
> [  927.018398][    C1] workqueue ipv6_addrconf: flags=3D0x40008
> [  927.020331][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  927.020337][    C1]     pending: addrconf_verify_work
> [  927.020346][    C1] pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hun=
g=3D867s workers=3D3 idle: 66 349
> [  927.020353][    C1] pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s =
workers=3D3 idle: 46 38
> [  957.729235][    C1] BUG: workqueue lockup - pool cpus=3D1 node=3D0 fla=
gs=3D0x0 nice=3D0 stuck for 897s!
> [  957.729876][    C1] Showing busy workqueues and worker pools:
> [  957.730232][    C1] workqueue events: flags=3D0x0
> [  957.730523][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D14/256 refcnt=3D15
> [  957.730530][    C1]     pending: vmstat_shepherd, regulator_init_compl=
ete_work_function, e1000_watchdog, kfree_rcu_monitor, netstamp_clear, relea=
se_one_tty, release_one_tty, release_one_tty, release_one_tty, cgroup1_rele=
ase_agent, cgroup1_release_agent, release_one_tty, release_one_tty, cgroup1=
_release_agent
> [  957.730577][    C1] workqueue events_unbound: flags=3D0x2
> [  957.733003][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
1/512 refcnt=3D4
> [  957.733009][    C1]     in-flight: 42:fsnotify_mark_destroy_workfn BAR=
(1)
> [  957.733019][    C1] workqueue rcu_gp: flags=3D0x8
> [  957.734272][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D3/256 refcnt=3D4
> [  957.734278][    C1]     in-flight: 20:sync_rcu_do_polled_gp
> [  957.734284][    C1]     pending: sync_rcu_do_polled_gp, process_srcu
> [  957.734296][    C1] workqueue mm_percpu_wq: flags=3D0x8
> [  957.735840][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/256 refcnt=3D2
> [  957.735847][    C1]     pending: vmstat_update
> [  957.735859][    C1] workqueue cgroup_destroy: flags=3D0x0
> [  957.736961][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  957.736967][    C1]     pending: css_release_work_fn
> [  957.736973][    C1] workqueue cgroup_pidlist_destroy: flags=3D0x0
> [  957.738198][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D5
> [  957.738205][    C1]     pending: cgroup_pidlist_destroy_work_fn
> [  957.738210][    C1]     inactive: cgroup_pidlist_destroy_work_fn, cgro=
up_pidlist_destroy_work_fn, cgroup_pidlist_destroy_work_fn
> [  957.738225][    C1] workqueue ipv6_addrconf: flags=3D0x40008
> [  957.740126][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  957.740133][    C1]     pending: addrconf_verify_work
> [  957.740144][    C1] pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hun=
g=3D897s workers=3D3 idle: 66 349
> [  957.740151][    C1] pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s =
workers=3D3 idle: 46 38
> [  972.065254][   T24] INFO: task systemd:1 blocked for more than 491 sec=
onds.
> [  972.065793][   T24]       Not tainted 5.17.0-rc1-00102-gcd7bd64af59f #1
> [  972.066212][   T24] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"=
 disables this message.
> [  972.066751][   T24] task:systemd         state:D stack:    0 pid:    1=
 ppid:     0 flags:0x00004000
> [  972.067323][   T24] Call Trace:
> [ 972.067538][ T24] ? __schedule (kernel/sched/core.c:4989 kernel/sched/c=
ore.c:6296) =

> [ 972.067818][ T24] ? schedule (arch/x86/include/asm/preempt.h:85 (discri=
minator 1) kernel/sched/core.c:6370 (discriminator 1)) =

> [ 972.068088][ T24] ? schedule_timeout (kernel/time/timer.c:1858) =

> [ 972.068401][ T24] ? find_held_lock (kernel/locking/lockdep.c:5130) =

> [ 972.068677][ T24] ? lock_release (kernel/locking/lockdep.c:5315 kernel/=
locking/lockdep.c:5659) =

> [ 972.068964][ T24] ? _raw_spin_unlock_irq (arch/x86/include/asm/irqflags=
.h:45 arch/x86/include/asm/irqflags.h:80 include/linux/spinlock_api_smp.h:1=
59 kernel/locking/spinlock.c:202) =

> [ 972.069359][ T24] ? trace_hardirqs_on (kernel/trace/trace_preemptirq.c:=
50 (discriminator 19)) =

> [ 972.069717][ T24] ? wait_for_completion (kernel/sched/completion.c:85 k=
ernel/sched/completion.c:106 kernel/sched/completion.c:117 kernel/sched/com=
pletion.c:138) =

> [ 972.070036][ T24] ? __flush_work (kernel/workqueue.c:524 kernel/workque=
ue.c:3094) =

> [ 972.070325][ T24] ? flush_workqueue_prep_pwqs (kernel/workqueue.c:2660) =

> [ 972.070684][ T24] ? flush_delayed_work (kernel/workqueue.c:3239) =

> [ 972.070997][ T24] ? fsnotify_wait_marks_destroyed (fs/notify/mark.c:876=
) =

> [ 972.071388][ T24] ? fsnotify_destroy_group (fs/notify/group.c:84 (discr=
iminator 1)) =

> [ 972.071722][ T24] ? inotify_release (fs/notify/inotify/inotify_user.c:2=
97) =

> [ 972.072027][ T24] ? __fput (fs/file_table.c:312) =

> [ 972.072278][ T24] ? _raw_spin_unlock_irq (arch/x86/include/asm/irqflags=
.h:45 arch/x86/include/asm/irqflags.h:80 include/linux/spinlock_api_smp.h:1=
59 kernel/locking/spinlock.c:202) =

> [ 972.072594][ T24] ? ____fput (fs/file_table.c:345) =

> [ 972.072834][ T24] ? task_work_run (kernel/task_work.c:166 (discriminato=
r 1)) =

> [ 972.073119][ T24] ? exit_to_user_mode_prepare (include/linux/tracehook.=
h:188 kernel/entry/common.c:175 kernel/entry/common.c:207) =

> [ 972.073535][ T24] ? syscall_exit_to_user_mode (kernel/entry/common.c:12=
6 kernel/entry/common.c:302) =

> [ 972.073856][ T24] ? __do_fast_syscall_32 (arch/x86/entry/common.c:183) =

> [ 972.074091][ T24] ? __do_fast_syscall_32 (arch/x86/entry/common.c:183) =

> [ 972.074399][ T24] ? trace_irq_enable (include/trace/events/preemptirq.h=
:40) =

> [ 972.074704][ T24] ? irqentry_exit_to_user_mode (kernel/entry/common.c:3=
16) =

> [ 972.075074][ T24] ? do_fast_syscall_32 (arch/x86/entry/common.c:203) =

> [ 972.075392][ T24] ? do_SYSENTER_32 (arch/x86/entry/common.c:247) =

> [ 972.075696][ T24] ? entry_SYSENTER_32 (arch/x86/entry/entry_32.S:869) =

> [  972.076023][   T24] INFO: task kworker/u4:2:42 blocked for more than 4=
91 seconds.
> [  972.076506][   T24]       Not tainted 5.17.0-rc1-00102-gcd7bd64af59f #1
> [  972.076929][   T24] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"=
 disables this message.
> [  972.077486][   T24] task:kworker/u4:2    state:D stack:    0 pid:   42=
 ppid:     2 flags:0x00004000
> [  972.078061][   T24] Workqueue: events_unbound fsnotify_mark_destroy_wo=
rkfn
> [  972.078488][   T24] Call Trace:
> [ 972.078695][ T24] ? __schedule (kernel/sched/core.c:4989 kernel/sched/c=
ore.c:6296) =

> [ 972.078988][ T24] ? schedule (arch/x86/include/asm/preempt.h:85 (discri=
minator 1) kernel/sched/core.c:6370 (discriminator 1)) =

> [ 972.079243][ T24] ? schedule_timeout (kernel/time/timer.c:1858) =

> [ 972.079537][ T24] ? mark_held_locks (kernel/locking/lockdep.c:4206) =

> [ 972.079818][ T24] ? wait_for_completion (kernel/sched/completion.c:85 k=
ernel/sched/completion.c:106 kernel/sched/completion.c:117 kernel/sched/com=
pletion.c:138) =

> [ 972.080115][ T24] ? _raw_spin_unlock_irq (arch/x86/include/asm/irqflags=
.h:45 arch/x86/include/asm/irqflags.h:80 include/linux/spinlock_api_smp.h:1=
59 kernel/locking/spinlock.c:202) =

> [ 972.080415][ T24] ? trace_hardirqs_on (kernel/trace/trace_preemptirq.c:=
50 (discriminator 19)) =

> [ 972.080712][ T24] ? wait_for_completion (kernel/sched/completion.c:85 k=
ernel/sched/completion.c:106 kernel/sched/completion.c:117 kernel/sched/com=
pletion.c:138) =

> [ 972.081025][ T24] ? __synchronize_srcu (kernel/rcu/srcutree.c:1138) =

> [ 972.081380][ T24] ? rcu_tasks_pregp_step (kernel/rcu/update.c:363) =

> [ 972.081725][ T24] ? synchronize_srcu (kernel/rcu/srcutree.c:1210) =

> [ 972.082025][ T24] ? fsnotify_mark_destroy_workfn (fs/notify/mark.c:866) =

> [ 972.082393][ T24] ? process_one_work (arch/x86/include/asm/jump_label.h=
:41 include/linux/jump_label.h:212 include/trace/events/workqueue.h:108 ker=
nel/workqueue.c:2312) =

> [ 972.082711][ T24] ? worker_thread (include/linux/list.h:292 kernel/work=
queue.c:2455) =

> [ 972.083006][ T24] ? kthread (kernel/kthread.c:377) =

> [ 972.083256][ T24] ? process_one_work (kernel/workqueue.c:2397) =

> [ 972.083564][ T24] ? kthread_complete_and_exit (kernel/kthread.c:332) =

> [ 972.083918][ T24] ? ret_from_fork (arch/x86/entry/entry_32.S:772) =

> [  972.084290][   T24] INFO: task rmmod:1018 blocked for more than 491 se=
conds.
> [  972.084755][   T24]       Not tainted 5.17.0-rc1-00102-gcd7bd64af59f #1
> [  972.085227][   T24] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"=
 disables this message.
> [  972.085793][   T24] task:rmmod           state:D stack:    0 pid: 1018=
 ppid:   618 flags:0x00004000
> [  972.086362][   T24] Call Trace:
> [ 972.086575][ T24] ? __schedule (kernel/sched/core.c:4989 kernel/sched/c=
ore.c:6296) =

> [ 972.086872][ T24] ? schedule (arch/x86/include/asm/preempt.h:85 (discri=
minator 1) kernel/sched/core.c:6370 (discriminator 1)) =

> [ 972.087140][ T24] ? schedule_timeout (kernel/time/timer.c:1858) =

> [ 972.087454][ T24] ? find_held_lock (kernel/locking/lockdep.c:5130) =

> [ 972.087760][ T24] ? lock_release (kernel/locking/lockdep.c:5315 kernel/=
locking/lockdep.c:5659) =

> [ 972.088061][ T24] ? _raw_spin_unlock_irq (arch/x86/include/asm/irqflags=
.h:45 arch/x86/include/asm/irqflags.h:80 include/linux/spinlock_api_smp.h:1=
59 kernel/locking/spinlock.c:202) =

> [ 972.088391][ T24] ? trace_hardirqs_on (kernel/trace/trace_preemptirq.c:=
50 (discriminator 19)) =

> [ 972.088732][ T24] ? wait_for_completion (kernel/sched/completion.c:85 k=
ernel/sched/completion.c:106 kernel/sched/completion.c:117 kernel/sched/com=
pletion.c:138) =

> [ 972.089075][ T24] ? kthread_stop (kernel/kthread.c:710) =

> [ 972.089438][ T24] ? _torture_stop_kthread (kernel/torture.c:956 (discri=
minator 3)) torture
> [ 972.089850][ T24] ? rcu_torture_cleanup (kernel/rcu/rcutorture.c:2995) =
rcutorture
> [ 972.090220][ T24] ? finish_wait (kernel/sched/wait.c:415) =

> [ 972.090489][ T24] ? __ia32_sys_delete_module (kernel/module.c:969 kerne=
l/module.c:912 kernel/module.c:912) =

> [ 972.090840][ T24] ? lock_release (kernel/locking/lockdep.c:5315 kernel/=
locking/lockdep.c:5659) =

> [ 972.091124][ T24] ? __might_fault (mm/memory.c:5272 mm/memory.c:5257) =

> [ 972.091400][ T24] ? __do_fast_syscall_32 (arch/x86/entry/common.c:112 a=
rch/x86/entry/common.c:178) =

> [ 972.091731][ T24] ? __do_fast_syscall_32 (arch/x86/entry/common.c:183) =

> [ 972.092052][ T24] ? vfs_read (fs/read_write.c:401 fs/read_write.c:481) =

> [ 972.092320][ T24] ? rcu_read_lock_sched_held (include/linux/lockdep.h:2=
83 kernel/rcu/update.c:125) =

> [ 972.092654][ T24] ? trace_irq_enable (include/trace/events/preemptirq.h=
:40) =

> [ 972.092972][ T24] ? syscall_exit_to_user_mode (kernel/entry/common.c:30=
3) =

> [ 972.093356][ T24] ? __do_fast_syscall_32 (arch/x86/entry/common.c:183) =

> [ 972.093682][ T24] ? trace_irq_enable (include/trace/events/preemptirq.h=
:40) =

> [ 972.094007][ T24] ? syscall_exit_to_user_mode (kernel/entry/common.c:30=
3) =

> [ 972.094346][ T24] ? __do_fast_syscall_32 (arch/x86/entry/common.c:183) =

> [ 972.094666][ T24] ? __do_fast_syscall_32 (arch/x86/entry/common.c:183) =

> [ 972.094992][ T24] ? trace_irq_enable (include/trace/events/preemptirq.h=
:40) =

> [ 972.095326][ T24] ? irqentry_exit_to_user_mode (kernel/entry/common.c:3=
16) =

> [ 972.095695][ T24] ? do_fast_syscall_32 (arch/x86/entry/common.c:203) =

> [ 972.096005][ T24] ? do_SYSENTER_32 (arch/x86/entry/common.c:247) =

> [ 972.096289][ T24] ? entry_SYSENTER_32 (arch/x86/entry/entry_32.S:869) =

> [  972.096608][   T24]
> [  972.096608][   T24] Showing all locks held in the system:
> [  972.097111][   T24] 2 locks held by kworker/1:0/20:
> [  972.097463][   T24] 1 lock held by khungtaskd/24:
> [ 972.097794][ T24] #0: 42eed778 (rcu_read_lock){....}-{1:2}, at: rcu_loc=
k_acquire+0x0/0x30 =

> [  972.098396][   T24] 2 locks held by kworker/u4:2/42:
> [ 972.098736][ T24] #0: 43dbd340 ((wq_completion)events_unbound){+.+.}-{0=
:0}, at: process_one_work (include/linux/workqueue.h:207 kernel/workqueue.c=
:631 kernel/workqueue.c:658 kernel/workqueue.c:2278) =

> [ 972.099405][ T24] #1: 44115f40 ((reaper_work).work){+.+.}-{0:0}, at: pr=
ocess_one_work (include/linux/workqueue.h:207 kernel/workqueue.c:631 kernel=
/workqueue.c:658 kernel/workqueue.c:2278) =

> [  972.100006][   T24] 1 lock held by in:imklog/639:
> [  972.100318][   T24] 1 lock held by dmesg/550:
> [  972.100608][   T24]
> [  972.100763][   T24] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> [  972.100763][   T24]
> [  972.101349][   T24] Kernel panic - not syncing: hung_task: blocked tas=
ks
> [  972.101820][   T24] CPU: 1 PID: 24 Comm: khungtaskd Not tainted 5.17.0=
-rc1-00102-gcd7bd64af59f #1
> [  972.102384][   T24] Call Trace:
> [ 972.102614][ T24] ? dump_stack_lvl (lib/dump_stack.c:107) =

> [ 972.102919][ T24] ? dump_stack (lib/dump_stack.c:114) =

> [ 972.103189][ T24] ? panic (kernel/panic.c:251) =

> [ 972.103445][ T24] ? watchdog.cold (kernel/watchdog.c:444) =

> [ 972.103740][ T24] ? kthread (kernel/kthread.c:377) =

> [ 972.104007][ T24] ? proc_dohung_task_timeout_secs (kernel/hung_task.c:3=
52) =

> [ 972.104405][ T24] ? kthread_complete_and_exit (kernel/kthread.c:332) =

> [ 972.104766][ T24] ? ret_from_fork (arch/x86/entry/entry_32.S:772) =

> [  972.105199][   T24] Kernel Offset: disabled
> =

> Kboot worker: lkp-worker65
> Elapsed time: 1020
> =

> kvm=3D(
> qemu-system-i386
> -enable-kvm
> -cpu SandyBridge
> -kernel $kernel
> -initrd initrd-vm-snb-i386-109.cgz
> -m 4096
> -smp 2
> -device e1000,netdev=3Dnet0
> -netdev user,id=3Dnet0,hostfwd=3Dtcp::32032-:22
> -boot order=3Dnc
> -no-reboot
> -watchdog i6300esb
> -watchdog-action debug
> -rtc base=3Dlocaltime
> -serial stdio
> -display none
> -monitor null
> )
> =

> append=3D(
> ip=3D::::vm-snb-i386-109::dhcp
> root=3D/dev/ram0
> RESULT_ROOT=3D/result/rcutorture/300s-default-rcu/vm-snb-i386/debian-i386=
-20191205.cgz/i386-randconfig-a004-20211220/gcc-9/cd7bd64af59fd15e0760a42f3=
43c0fbb87121219/3
> BOOT_IMAGE=3D/pkg/linux/i386-randconfig-a004-20211220/gcc-9/cd7bd64af59fd=
15e0760a42f343c0fbb87121219/vmlinuz-5.17.0-rc1-00102-gcd7bd64af59f
> branch=3Dammarfaizi2-block/paulmck/linux-rcu/dev.2022.02.01a
> job=3D/job-script
> user=3Dlkp
> ARCH=3Di386
> kconfig=3Di386-randconfig-a004-20211220
> commit=3Dcd7bd64af59fd15e0760a42f343c0fbb87121219
> vmalloc=3D128M
> initramfs_async=3D0
> page_owner=3Don
> max_uptime=3D2100
> result_service=3Dtmpfs
> =

> =

> To reproduce:
> =

>         # build kernel
> 	cd linux
> 	cp config-5.17.0-rc1-00102-gcd7bd64af59f .config
> 	make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Di386 olddefconfig prepare modules_=
prepare bzImage modules
> 	make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Di386 INSTALL_MOD_PATH=3D<mod-insta=
ll-dir> modules_install
> 	cd <mod-install-dir>
> 	find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz
> =

> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-script =
is attached in this email
> =

>         # if come across any failure that blocks the test,
>         # please remove ~/.lkp and /lkp dir to run from a clean state.
> =

> =

> =

> ---
> 0DAY/LKP+ Test Infrastructure                   Open Source Technology Ce=
nter
> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel Corpo=
ration
> =

> Thanks,
> Oliver Sang
> =


> #
> # Automatically generated file; DO NOT EDIT.
> # Linux/i386 5.17.0-rc1 Kernel Configuration
> #
> CONFIG_CC_VERSION_TEXT=3D"gcc-9 (Debian 9.3.0-22) 9.3.0"
> CONFIG_CC_IS_GCC=3Dy
> CONFIG_GCC_VERSION=3D90300
> CONFIG_CLANG_VERSION=3D0
> CONFIG_AS_IS_GNU=3Dy
> CONFIG_AS_VERSION=3D23502
> CONFIG_LD_IS_BFD=3Dy
> CONFIG_LD_VERSION=3D23502
> CONFIG_LLD_VERSION=3D0
> CONFIG_CC_CAN_LINK=3Dy
> CONFIG_CC_CAN_LINK_STATIC=3Dy
> CONFIG_CC_HAS_ASM_GOTO=3Dy
> CONFIG_CC_HAS_ASM_INLINE=3Dy
> CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=3Dy
> CONFIG_CONSTRUCTORS=3Dy
> CONFIG_IRQ_WORK=3Dy
> CONFIG_BUILDTIME_TABLE_SORT=3Dy
> CONFIG_THREAD_INFO_IN_TASK=3Dy
> =

> #
> # General setup
> #
> CONFIG_INIT_ENV_ARG_LIMIT=3D32
> # CONFIG_COMPILE_TEST is not set
> # CONFIG_WERROR is not set
> CONFIG_LOCALVERSION=3D""
> CONFIG_LOCALVERSION_AUTO=3Dy
> CONFIG_BUILD_SALT=3D""
> CONFIG_HAVE_KERNEL_GZIP=3Dy
> CONFIG_HAVE_KERNEL_BZIP2=3Dy
> CONFIG_HAVE_KERNEL_LZMA=3Dy
> CONFIG_HAVE_KERNEL_XZ=3Dy
> CONFIG_HAVE_KERNEL_LZO=3Dy
> CONFIG_HAVE_KERNEL_LZ4=3Dy
> CONFIG_HAVE_KERNEL_ZSTD=3Dy
> # CONFIG_KERNEL_GZIP is not set
> CONFIG_KERNEL_BZIP2=3Dy
> # CONFIG_KERNEL_LZMA is not set
> # CONFIG_KERNEL_XZ is not set
> # CONFIG_KERNEL_LZO is not set
> # CONFIG_KERNEL_LZ4 is not set
> # CONFIG_KERNEL_ZSTD is not set
> CONFIG_DEFAULT_INIT=3D""
> CONFIG_DEFAULT_HOSTNAME=3D"(none)"
> CONFIG_SWAP=3Dy
> # CONFIG_SYSVIPC is not set
> # CONFIG_POSIX_MQUEUE is not set
> # CONFIG_WATCH_QUEUE is not set
> # CONFIG_CROSS_MEMORY_ATTACH is not set
> # CONFIG_USELIB is not set
> # CONFIG_AUDIT is not set
> CONFIG_HAVE_ARCH_AUDITSYSCALL=3Dy
> =

> #
> # IRQ subsystem
> #
> CONFIG_GENERIC_IRQ_PROBE=3Dy
> CONFIG_GENERIC_IRQ_SHOW=3Dy
> CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=3Dy
> CONFIG_GENERIC_PENDING_IRQ=3Dy
> CONFIG_GENERIC_IRQ_MIGRATION=3Dy
> CONFIG_GENERIC_IRQ_INJECTION=3Dy
> CONFIG_HARDIRQS_SW_RESEND=3Dy
> CONFIG_GENERIC_IRQ_CHIP=3Dy
> CONFIG_IRQ_DOMAIN=3Dy
> CONFIG_IRQ_SIM=3Dy
> CONFIG_IRQ_DOMAIN_HIERARCHY=3Dy
> CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=3Dy
> CONFIG_GENERIC_IRQ_RESERVATION_MODE=3Dy
> CONFIG_IRQ_FORCED_THREADING=3Dy
> CONFIG_SPARSE_IRQ=3Dy
> CONFIG_GENERIC_IRQ_DEBUGFS=3Dy
> # end of IRQ subsystem
> =

> CONFIG_CLOCKSOURCE_WATCHDOG=3Dy
> CONFIG_ARCH_CLOCKSOURCE_INIT=3Dy
> CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=3Dy
> CONFIG_GENERIC_TIME_VSYSCALL=3Dy
> CONFIG_GENERIC_CLOCKEVENTS=3Dy
> CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=3Dy
> CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=3Dy
> CONFIG_GENERIC_CMOS_UPDATE=3Dy
> CONFIG_HAVE_POSIX_CPU_TIMERS_TASK_WORK=3Dy
> CONFIG_TIME_KUNIT_TEST=3Dy
> =

> #
> # Timers subsystem
> #
> CONFIG_TICK_ONESHOT=3Dy
> CONFIG_NO_HZ_COMMON=3Dy
> # CONFIG_HZ_PERIODIC is not set
> CONFIG_NO_HZ_IDLE=3Dy
> # CONFIG_NO_HZ is not set
> # CONFIG_HIGH_RES_TIMERS is not set
> CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US=3D100
> # end of Timers subsystem
> =

> CONFIG_BPF=3Dy
> CONFIG_HAVE_EBPF_JIT=3Dy
> =

> #
> # BPF subsystem
> #
> CONFIG_BPF_SYSCALL=3Dy
> # CONFIG_BPF_JIT is not set
> CONFIG_BPF_UNPRIV_DEFAULT_OFF=3Dy
> CONFIG_USERMODE_DRIVER=3Dy
> CONFIG_BPF_PRELOAD=3Dy
> # CONFIG_BPF_PRELOAD_UMD is not set
> # end of BPF subsystem
> =

> CONFIG_PREEMPT_VOLUNTARY_BUILD=3Dy
> # CONFIG_PREEMPT_NONE is not set
> CONFIG_PREEMPT_VOLUNTARY=3Dy
> # CONFIG_PREEMPT is not set
> CONFIG_PREEMPT_COUNT=3Dy
> # CONFIG_PREEMPT_DYNAMIC is not set
> CONFIG_SCHED_CORE=3Dy
> =

> #
> # CPU/Task time and stats accounting
> #
> CONFIG_TICK_CPU_ACCOUNTING=3Dy
> # CONFIG_IRQ_TIME_ACCOUNTING is not set
> # CONFIG_BSD_PROCESS_ACCT is not set
> # CONFIG_TASKSTATS is not set
> # CONFIG_PSI is not set
> # end of CPU/Task time and stats accounting
> =

> CONFIG_CPU_ISOLATION=3Dy
> =

> #
> # RCU Subsystem
> #
> CONFIG_TREE_RCU=3Dy
> CONFIG_RCU_EXPERT=3Dy
> CONFIG_SRCU=3Dy
> CONFIG_TREE_SRCU=3Dy
> CONFIG_TASKS_RCU_GENERIC=3Dy
> CONFIG_TASKS_RCU=3Dy
> CONFIG_TASKS_RUDE_RCU=3Dy
> CONFIG_TASKS_TRACE_RCU=3Dy
> CONFIG_RCU_STALL_COMMON=3Dy
> CONFIG_RCU_NEED_SEGCBLIST=3Dy
> CONFIG_RCU_FANOUT=3D32
> CONFIG_RCU_FANOUT_LEAF=3D16
> # CONFIG_RCU_NOCB_CPU is not set
> # CONFIG_TASKS_TRACE_RCU_READ_MB is not set
> # end of RCU Subsystem
> =

> CONFIG_IKCONFIG=3Dy
> CONFIG_IKCONFIG_PROC=3Dy
> CONFIG_IKHEADERS=3Dy
> CONFIG_LOG_BUF_SHIFT=3D20
> CONFIG_LOG_CPU_MAX_BUF_SHIFT=3D12
> CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=3D13
> # CONFIG_PRINTK_INDEX is not set
> CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
> =

> #
> # Scheduler features
> #
> # end of Scheduler features
> =

> CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=3Dy
> CONFIG_CC_IMPLICIT_FALLTHROUGH=3D"-Wimplicit-fallthrough=3D5"
> CONFIG_CGROUPS=3Dy
> CONFIG_PAGE_COUNTER=3Dy
> CONFIG_MEMCG=3Dy
> CONFIG_MEMCG_SWAP=3Dy
> # CONFIG_BLK_CGROUP is not set
> # CONFIG_CGROUP_SCHED is not set
> # CONFIG_CGROUP_PIDS is not set
> # CONFIG_CGROUP_RDMA is not set
> CONFIG_CGROUP_FREEZER=3Dy
> CONFIG_CGROUP_HUGETLB=3Dy
> CONFIG_CPUSETS=3Dy
> # CONFIG_PROC_PID_CPUSET is not set
> CONFIG_CGROUP_DEVICE=3Dy
> CONFIG_CGROUP_CPUACCT=3Dy
> # CONFIG_CGROUP_PERF is not set
> # CONFIG_CGROUP_BPF is not set
> CONFIG_CGROUP_MISC=3Dy
> # CONFIG_CGROUP_DEBUG is not set
> # CONFIG_NAMESPACES is not set
> # CONFIG_CHECKPOINT_RESTORE is not set
> # CONFIG_SCHED_AUTOGROUP is not set
> # CONFIG_SYSFS_DEPRECATED is not set
> CONFIG_RELAY=3Dy
> CONFIG_BLK_DEV_INITRD=3Dy
> CONFIG_INITRAMFS_SOURCE=3D""
> CONFIG_RD_GZIP=3Dy
> # CONFIG_RD_BZIP2 is not set
> # CONFIG_RD_LZMA is not set
> CONFIG_RD_XZ=3Dy
> # CONFIG_RD_LZO is not set
> # CONFIG_RD_LZ4 is not set
> # CONFIG_RD_ZSTD is not set
> # CONFIG_BOOT_CONFIG is not set
> CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=3Dy
> # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
> CONFIG_LD_ORPHAN_WARN=3Dy
> CONFIG_SYSCTL=3Dy
> CONFIG_HAVE_UID16=3Dy
> CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
> CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
> CONFIG_EXPERT=3Dy
> CONFIG_UID16=3Dy
> CONFIG_MULTIUSER=3Dy
> # CONFIG_SGETMASK_SYSCALL is not set
> CONFIG_SYSFS_SYSCALL=3Dy
> CONFIG_FHANDLE=3Dy
> # CONFIG_POSIX_TIMERS is not set
> CONFIG_PRINTK=3Dy
> CONFIG_BUG=3Dy
> # CONFIG_ELF_CORE is not set
> # CONFIG_PCSPKR_PLATFORM is not set
> CONFIG_BASE_FULL=3Dy
> CONFIG_FUTEX=3Dy
> CONFIG_FUTEX_PI=3Dy
> CONFIG_EPOLL=3Dy
> CONFIG_SIGNALFD=3Dy
> CONFIG_TIMERFD=3Dy
> CONFIG_EVENTFD=3Dy
> CONFIG_SHMEM=3Dy
> CONFIG_AIO=3Dy
> # CONFIG_IO_URING is not set
> # CONFIG_ADVISE_SYSCALLS is not set
> CONFIG_MEMBARRIER=3Dy
> CONFIG_KALLSYMS=3Dy
> CONFIG_KALLSYMS_ALL=3Dy
> CONFIG_KALLSYMS_BASE_RELATIVE=3Dy
> CONFIG_USERFAULTFD=3Dy
> CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=3Dy
> # CONFIG_KCMP is not set
> # CONFIG_RSEQ is not set
> # CONFIG_EMBEDDED is not set
> CONFIG_HAVE_PERF_EVENTS=3Dy
> CONFIG_PC104=3Dy
> =

> #
> # Kernel Performance Events And Counters
> #
> CONFIG_PERF_EVENTS=3Dy
> # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
> # end of Kernel Performance Events And Counters
> =

> # CONFIG_VM_EVENT_COUNTERS is not set
> # CONFIG_COMPAT_BRK is not set
> # CONFIG_SLAB is not set
> # CONFIG_SLUB is not set
> CONFIG_SLOB=3Dy
> # CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
> CONFIG_SYSTEM_DATA_VERIFICATION=3Dy
> # CONFIG_PROFILING is not set
> CONFIG_TRACEPOINTS=3Dy
> # end of General setup
> =

> CONFIG_X86_32=3Dy
> CONFIG_X86=3Dy
> CONFIG_INSTRUCTION_DECODER=3Dy
> CONFIG_OUTPUT_FORMAT=3D"elf32-i386"
> CONFIG_LOCKDEP_SUPPORT=3Dy
> CONFIG_STACKTRACE_SUPPORT=3Dy
> CONFIG_MMU=3Dy
> CONFIG_ARCH_MMAP_RND_BITS_MIN=3D8
> CONFIG_ARCH_MMAP_RND_BITS_MAX=3D16
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=3D8
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=3D16
> CONFIG_GENERIC_ISA_DMA=3Dy
> CONFIG_GENERIC_BUG=3Dy
> CONFIG_ARCH_MAY_HAVE_PC_FDC=3Dy
> CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
> CONFIG_ARCH_HAS_CPU_RELAX=3Dy
> CONFIG_ARCH_HAS_FILTER_PGPROT=3Dy
> CONFIG_ARCH_HIBERNATION_POSSIBLE=3Dy
> CONFIG_ARCH_NR_GPIO=3D512
> CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
> CONFIG_ARCH_WANT_GENERAL_HUGETLB=3Dy
> CONFIG_X86_32_SMP=3Dy
> CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
> CONFIG_FIX_EARLYCON_MEM=3Dy
> CONFIG_PGTABLE_LEVELS=3D2
> CONFIG_CC_HAS_SANE_STACKPROTECTOR=3Dy
> =

> #
> # Processor type and features
> #
> CONFIG_SMP=3Dy
> CONFIG_X86_FEATURE_NAMES=3Dy
> CONFIG_X86_MPPARSE=3Dy
> # CONFIG_GOLDFISH is not set
> CONFIG_RETPOLINE=3Dy
> CONFIG_X86_CPU_RESCTRL=3Dy
> # CONFIG_X86_BIGSMP is not set
> CONFIG_X86_EXTENDED_PLATFORM=3Dy
> # CONFIG_X86_GOLDFISH is not set
> # CONFIG_X86_INTEL_LPSS is not set
> # CONFIG_X86_AMD_PLATFORM_DEVICE is not set
> CONFIG_IOSF_MBI=3Dy
> # CONFIG_IOSF_MBI_DEBUG is not set
> CONFIG_X86_RDC321X=3Dy
> # CONFIG_X86_32_NON_STANDARD is not set
> # CONFIG_X86_32_IRIS is not set
> # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
> CONFIG_HYPERVISOR_GUEST=3Dy
> CONFIG_PARAVIRT=3Dy
> # CONFIG_PARAVIRT_DEBUG is not set
> # CONFIG_PARAVIRT_SPINLOCKS is not set
> CONFIG_X86_HV_CALLBACK_VECTOR=3Dy
> CONFIG_KVM_GUEST=3Dy
> CONFIG_ARCH_CPUIDLE_HALTPOLL=3Dy
> # CONFIG_PVH is not set
> # CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
> CONFIG_PARAVIRT_CLOCK=3Dy
> # CONFIG_M486SX is not set
> # CONFIG_M486 is not set
> # CONFIG_M586 is not set
> # CONFIG_M586TSC is not set
> # CONFIG_M586MMX is not set
> CONFIG_M686=3Dy
> # CONFIG_MPENTIUMII is not set
> # CONFIG_MPENTIUMIII is not set
> # CONFIG_MPENTIUMM is not set
> # CONFIG_MPENTIUM4 is not set
> # CONFIG_MK6 is not set
> # CONFIG_MK7 is not set
> # CONFIG_MK8 is not set
> # CONFIG_MCRUSOE is not set
> # CONFIG_MEFFICEON is not set
> # CONFIG_MWINCHIPC6 is not set
> # CONFIG_MWINCHIP3D is not set
> # CONFIG_MELAN is not set
> # CONFIG_MGEODEGX1 is not set
> # CONFIG_MGEODE_LX is not set
> # CONFIG_MCYRIXIII is not set
> # CONFIG_MVIAC3_2 is not set
> # CONFIG_MVIAC7 is not set
> # CONFIG_MCORE2 is not set
> # CONFIG_MATOM is not set
> CONFIG_X86_GENERIC=3Dy
> CONFIG_X86_INTERNODE_CACHE_SHIFT=3D6
> CONFIG_X86_L1_CACHE_SHIFT=3D6
> CONFIG_X86_INTEL_USERCOPY=3Dy
> CONFIG_X86_USE_PPRO_CHECKSUM=3Dy
> CONFIG_X86_TSC=3Dy
> CONFIG_X86_CMPXCHG64=3Dy
> CONFIG_X86_CMOV=3Dy
> CONFIG_X86_MINIMUM_CPU_FAMILY=3D6
> CONFIG_X86_DEBUGCTLMSR=3Dy
> CONFIG_IA32_FEAT_CTL=3Dy
> CONFIG_X86_VMX_FEATURE_NAMES=3Dy
> # CONFIG_PROCESSOR_SELECT is not set
> CONFIG_CPU_SUP_INTEL=3Dy
> CONFIG_CPU_SUP_CYRIX_32=3Dy
> CONFIG_CPU_SUP_AMD=3Dy
> CONFIG_CPU_SUP_HYGON=3Dy
> CONFIG_CPU_SUP_CENTAUR=3Dy
> CONFIG_CPU_SUP_TRANSMETA_32=3Dy
> CONFIG_CPU_SUP_UMC_32=3Dy
> CONFIG_CPU_SUP_ZHAOXIN=3Dy
> CONFIG_CPU_SUP_VORTEX_32=3Dy
> CONFIG_HPET_TIMER=3Dy
> # CONFIG_DMI is not set
> CONFIG_NR_CPUS_RANGE_BEGIN=3D2
> CONFIG_NR_CPUS_RANGE_END=3D8
> CONFIG_NR_CPUS_DEFAULT=3D8
> CONFIG_NR_CPUS=3D8
> # CONFIG_SCHED_CLUSTER is not set
> CONFIG_SCHED_SMT=3Dy
> # CONFIG_SCHED_MC is not set
> CONFIG_X86_LOCAL_APIC=3Dy
> CONFIG_X86_IO_APIC=3Dy
> CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=3Dy
> # CONFIG_X86_MCE is not set
> =

> #
> # Performance monitoring
> #
> # CONFIG_PERF_EVENTS_INTEL_UNCORE is not set
> CONFIG_PERF_EVENTS_INTEL_RAPL=3Dy
> CONFIG_PERF_EVENTS_INTEL_CSTATE=3Dy
> # CONFIG_PERF_EVENTS_AMD_POWER is not set
> CONFIG_PERF_EVENTS_AMD_UNCORE=3Dy
> # end of Performance monitoring
> =

> # CONFIG_X86_LEGACY_VM86 is not set
> CONFIG_X86_IOPL_IOPERM=3Dy
> CONFIG_TOSHIBA=3Dy
> # CONFIG_I8K is not set
> CONFIG_X86_REBOOTFIXUPS=3Dy
> CONFIG_MICROCODE=3Dy
> CONFIG_MICROCODE_INTEL=3Dy
> # CONFIG_MICROCODE_AMD is not set
> CONFIG_MICROCODE_OLD_INTERFACE=3Dy
> CONFIG_X86_MSR=3Dy
> CONFIG_X86_CPUID=3Dy
> # CONFIG_NOHIGHMEM is not set
> CONFIG_HIGHMEM4G=3Dy
> # CONFIG_HIGHMEM64G is not set
> # CONFIG_VMSPLIT_3G is not set
> # CONFIG_VMSPLIT_3G_OPT is not set
> # CONFIG_VMSPLIT_2G is not set
> # CONFIG_VMSPLIT_2G_OPT is not set
> CONFIG_VMSPLIT_1G=3Dy
> CONFIG_PAGE_OFFSET=3D0x40000000
> CONFIG_HIGHMEM=3Dy
> CONFIG_X86_CPA_STATISTICS=3Dy
> CONFIG_ARCH_FLATMEM_ENABLE=3Dy
> CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
> CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
> CONFIG_ILLEGAL_POINTER_VALUE=3D0
> # CONFIG_HIGHPTE is not set
> # CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
> CONFIG_MTRR=3Dy
> CONFIG_MTRR_SANITIZER=3Dy
> CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=3D0
> CONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=3D1
> # CONFIG_X86_PAT is not set
> CONFIG_ARCH_RANDOM=3Dy
> CONFIG_X86_SMAP=3Dy
> # CONFIG_X86_UMIP is not set
> # CONFIG_X86_INTEL_TSX_MODE_OFF is not set
> # CONFIG_X86_INTEL_TSX_MODE_ON is not set
> CONFIG_X86_INTEL_TSX_MODE_AUTO=3Dy
> # CONFIG_EFI is not set
> # CONFIG_HZ_100 is not set
> CONFIG_HZ_250=3Dy
> # CONFIG_HZ_300 is not set
> # CONFIG_HZ_1000 is not set
> CONFIG_HZ=3D250
> CONFIG_KEXEC=3Dy
> # CONFIG_CRASH_DUMP is not set
> CONFIG_KEXEC_JUMP=3Dy
> CONFIG_PHYSICAL_START=3D0x1000000
> # CONFIG_RELOCATABLE is not set
> CONFIG_PHYSICAL_ALIGN=3D0x200000
> CONFIG_HOTPLUG_CPU=3Dy
> CONFIG_BOOTPARAM_HOTPLUG_CPU0=3Dy
> CONFIG_DEBUG_HOTPLUG_CPU0=3Dy
> # CONFIG_COMPAT_VDSO is not set
> # CONFIG_CMDLINE_BOOL is not set
> # CONFIG_MODIFY_LDT_SYSCALL is not set
> # CONFIG_STRICT_SIGALTSTACK_SIZE is not set
> # end of Processor type and features
> =

> CONFIG_ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE=3Dy
> =

> #
> # Power management and ACPI options
> #
> CONFIG_ARCH_HIBERNATION_HEADER=3Dy
> # CONFIG_SUSPEND is not set
> CONFIG_HIBERNATE_CALLBACKS=3Dy
> CONFIG_HIBERNATION=3Dy
> CONFIG_HIBERNATION_SNAPSHOT_DEV=3Dy
> CONFIG_PM_STD_PARTITION=3D""
> CONFIG_PM_SLEEP=3Dy
> CONFIG_PM_SLEEP_SMP=3Dy
> CONFIG_PM_AUTOSLEEP=3Dy
> CONFIG_PM_WAKELOCKS=3Dy
> CONFIG_PM_WAKELOCKS_LIMIT=3D100
> # CONFIG_PM_WAKELOCKS_GC is not set
> CONFIG_PM=3Dy
> CONFIG_PM_DEBUG=3Dy
> # CONFIG_PM_ADVANCED_DEBUG is not set
> CONFIG_PM_SLEEP_DEBUG=3Dy
> # CONFIG_PM_TRACE_RTC is not set
> CONFIG_PM_CLK=3Dy
> CONFIG_WQ_POWER_EFFICIENT_DEFAULT=3Dy
> CONFIG_ARCH_SUPPORTS_ACPI=3Dy
> CONFIG_ACPI=3Dy
> CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy
> CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=3Dy
> CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=3Dy
> CONFIG_ACPI_TABLE_LIB=3Dy
> # CONFIG_ACPI_DEBUGGER is not set
> CONFIG_ACPI_SPCR_TABLE=3Dy
> CONFIG_ACPI_SLEEP=3Dy
> CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=3Dy
> # CONFIG_ACPI_EC_DEBUGFS is not set
> CONFIG_ACPI_AC=3Dy
> CONFIG_ACPI_BATTERY=3Dy
> CONFIG_ACPI_BUTTON=3Dy
> # CONFIG_ACPI_VIDEO is not set
> CONFIG_ACPI_FAN=3Dy
> # CONFIG_ACPI_TAD is not set
> # CONFIG_ACPI_DOCK is not set
> CONFIG_ACPI_CPU_FREQ_PSS=3Dy
> CONFIG_ACPI_PROCESSOR_CSTATE=3Dy
> CONFIG_ACPI_PROCESSOR_IDLE=3Dy
> CONFIG_ACPI_PROCESSOR=3Dy
> # CONFIG_ACPI_IPMI is not set
> CONFIG_ACPI_HOTPLUG_CPU=3Dy
> # CONFIG_ACPI_PROCESSOR_AGGREGATOR is not set
> CONFIG_ACPI_THERMAL=3Dy
> CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=3Dy
> CONFIG_ACPI_TABLE_UPGRADE=3Dy
> # CONFIG_ACPI_DEBUG is not set
> # CONFIG_ACPI_PCI_SLOT is not set
> CONFIG_ACPI_CONTAINER=3Dy
> CONFIG_ACPI_HOTPLUG_IOAPIC=3Dy
> # CONFIG_ACPI_SBS is not set
> # CONFIG_ACPI_HED is not set
> # CONFIG_ACPI_CUSTOM_METHOD is not set
> # CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
> CONFIG_HAVE_ACPI_APEI=3Dy
> CONFIG_HAVE_ACPI_APEI_NMI=3Dy
> # CONFIG_ACPI_APEI is not set
> # CONFIG_ACPI_DPTF is not set
> # CONFIG_ACPI_CONFIGFS is not set
> # CONFIG_PMIC_OPREGION is not set
> CONFIG_X86_PM_TIMER=3Dy
> CONFIG_X86_APM_BOOT=3Dy
> CONFIG_APM=3Dy
> CONFIG_APM_IGNORE_USER_SUSPEND=3Dy
> # CONFIG_APM_DO_ENABLE is not set
> # CONFIG_APM_CPU_IDLE is not set
> CONFIG_APM_DISPLAY_BLANK=3Dy
> # CONFIG_APM_ALLOW_INTS is not set
> =

> #
> # CPU Frequency scaling
> #
> # CONFIG_CPU_FREQ is not set
> # end of CPU Frequency scaling
> =

> #
> # CPU Idle
> #
> CONFIG_CPU_IDLE=3Dy
> # CONFIG_CPU_IDLE_GOV_LADDER is not set
> CONFIG_CPU_IDLE_GOV_MENU=3Dy
> # CONFIG_CPU_IDLE_GOV_TEO is not set
> # CONFIG_CPU_IDLE_GOV_HALTPOLL is not set
> CONFIG_HALTPOLL_CPUIDLE=3Dy
> # end of CPU Idle
> =

> # CONFIG_INTEL_IDLE is not set
> # end of Power management and ACPI options
> =

> #
> # Bus options (PCI etc.)
> #
> # CONFIG_PCI_GOBIOS is not set
> CONFIG_PCI_GOMMCONFIG=3Dy
> # CONFIG_PCI_GODIRECT is not set
> # CONFIG_PCI_GOANY is not set
> CONFIG_PCI_DIRECT=3Dy
> CONFIG_PCI_MMCONFIG=3Dy
> # CONFIG_PCI_CNB20LE_QUIRK is not set
> # CONFIG_ISA_BUS is not set
> CONFIG_ISA_DMA_API=3Dy
> CONFIG_ISA=3Dy
> CONFIG_SCx200=3Dy
> # CONFIG_SCx200HR_TIMER is not set
> # CONFIG_OLPC is not set
> CONFIG_ALIX=3Dy
> CONFIG_NET5501=3Dy
> CONFIG_AMD_NB=3Dy
> # end of Bus options (PCI etc.)
> =

> #
> # Binary Emulations
> #
> CONFIG_COMPAT_32=3Dy
> # end of Binary Emulations
> =

> CONFIG_HAVE_ATOMIC_IOMAP=3Dy
> CONFIG_HAVE_KVM=3Dy
> CONFIG_VIRTUALIZATION=3Dy
> CONFIG_AS_AVX512=3Dy
> CONFIG_AS_SHA1_NI=3Dy
> CONFIG_AS_SHA256_NI=3Dy
> CONFIG_AS_TPAUSE=3Dy
> =

> #
> # General architecture-dependent options
> #
> CONFIG_CRASH_CORE=3Dy
> CONFIG_KEXEC_CORE=3Dy
> CONFIG_HOTPLUG_SMT=3Dy
> CONFIG_GENERIC_ENTRY=3Dy
> # CONFIG_KPROBES is not set
> CONFIG_JUMP_LABEL=3Dy
> # CONFIG_STATIC_KEYS_SELFTEST is not set
> # CONFIG_STATIC_CALL_SELFTEST is not set
> CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dy
> CONFIG_ARCH_USE_BUILTIN_BSWAP=3Dy
> CONFIG_HAVE_IOREMAP_PROT=3Dy
> CONFIG_HAVE_KPROBES=3Dy
> CONFIG_HAVE_KRETPROBES=3Dy
> CONFIG_HAVE_OPTPROBES=3Dy
> CONFIG_HAVE_KPROBES_ON_FTRACE=3Dy
> CONFIG_ARCH_CORRECT_STACKTRACE_ON_KRETPROBE=3Dy
> CONFIG_HAVE_FUNCTION_ERROR_INJECTION=3Dy
> CONFIG_HAVE_NMI=3Dy
> CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
> CONFIG_HAVE_ARCH_TRACEHOOK=3Dy
> CONFIG_HAVE_DMA_CONTIGUOUS=3Dy
> CONFIG_GENERIC_SMP_IDLE_THREAD=3Dy
> CONFIG_ARCH_HAS_FORTIFY_SOURCE=3Dy
> CONFIG_ARCH_HAS_SET_MEMORY=3Dy
> CONFIG_ARCH_HAS_SET_DIRECT_MAP=3Dy
> CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=3Dy
> CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=3Dy
> CONFIG_ARCH_WANTS_NO_INSTR=3Dy
> CONFIG_ARCH_32BIT_OFF_T=3Dy
> CONFIG_HAVE_ASM_MODVERSIONS=3Dy
> CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=3Dy
> CONFIG_HAVE_RSEQ=3Dy
> CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=3Dy
> CONFIG_HAVE_HW_BREAKPOINT=3Dy
> CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=3Dy
> CONFIG_HAVE_USER_RETURN_NOTIFIER=3Dy
> CONFIG_HAVE_PERF_EVENTS_NMI=3Dy
> CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=3Dy
> CONFIG_HAVE_PERF_REGS=3Dy
> CONFIG_HAVE_PERF_USER_STACK_DUMP=3Dy
> CONFIG_HAVE_ARCH_JUMP_LABEL=3Dy
> CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=3Dy
> CONFIG_MMU_GATHER_TABLE_FREE=3Dy
> CONFIG_MMU_GATHER_RCU_TABLE_FREE=3Dy
> CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=3Dy
> CONFIG_HAVE_CMPXCHG_LOCAL=3Dy
> CONFIG_HAVE_CMPXCHG_DOUBLE=3Dy
> CONFIG_ARCH_WANT_IPC_PARSE_VERSION=3Dy
> CONFIG_HAVE_ARCH_SECCOMP=3Dy
> CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
> # CONFIG_SECCOMP is not set
> CONFIG_HAVE_ARCH_STACKLEAK=3Dy
> CONFIG_HAVE_STACKPROTECTOR=3Dy
> CONFIG_STACKPROTECTOR=3Dy
> CONFIG_STACKPROTECTOR_STRONG=3Dy
> CONFIG_ARCH_SUPPORTS_LTO_CLANG=3Dy
> CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=3Dy
> CONFIG_LTO_NONE=3Dy
> CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=3Dy
> CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
> CONFIG_HAVE_MOVE_PUD=3Dy
> CONFIG_HAVE_MOVE_PMD=3Dy
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
> CONFIG_ARCH_WANT_HUGE_PMD_SHARE=3Dy
> CONFIG_HAVE_MOD_ARCH_SPECIFIC=3Dy
> CONFIG_MODULES_USE_ELF_REL=3Dy
> CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=3Dy
> CONFIG_ARCH_HAS_ELF_RANDOMIZE=3Dy
> CONFIG_HAVE_ARCH_MMAP_RND_BITS=3Dy
> CONFIG_HAVE_EXIT_THREAD=3Dy
> CONFIG_ARCH_MMAP_RND_BITS=3D8
> CONFIG_PAGE_SIZE_LESS_THAN_64KB=3Dy
> CONFIG_PAGE_SIZE_LESS_THAN_256KB=3Dy
> CONFIG_ISA_BUS_API=3Dy
> CONFIG_CLONE_BACKWARDS=3Dy
> CONFIG_OLD_SIGSUSPEND3=3Dy
> CONFIG_OLD_SIGACTION=3Dy
> CONFIG_COMPAT_32BIT_TIME=3Dy
> CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=3Dy
> CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT=3Dy
> CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=3Dy
> CONFIG_STRICT_KERNEL_RWX=3Dy
> CONFIG_ARCH_HAS_STRICT_MODULE_RWX=3Dy
> CONFIG_STRICT_MODULE_RWX=3Dy
> CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=3Dy
> # CONFIG_LOCK_EVENT_COUNTS is not set
> CONFIG_ARCH_HAS_MEM_ENCRYPT=3Dy
> CONFIG_HAVE_STATIC_CALL=3Dy
> CONFIG_HAVE_PREEMPT_DYNAMIC=3Dy
> CONFIG_ARCH_WANT_LD_ORPHAN_WARN=3Dy
> CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy
> CONFIG_ARCH_SPLIT_ARG64=3Dy
> CONFIG_ARCH_HAS_PARANOID_L1D_FLUSH=3Dy
> CONFIG_DYNAMIC_SIGFRAME=3Dy
> =

> #
> # GCOV-based kernel profiling
> #
> CONFIG_GCOV_KERNEL=3Dy
> CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
> # CONFIG_GCOV_PROFILE_ALL is not set
> # end of GCOV-based kernel profiling
> =

> CONFIG_HAVE_GCC_PLUGINS=3Dy
> # end of General architecture-dependent options
> =

> CONFIG_RT_MUTEXES=3Dy
> CONFIG_BASE_SMALL=3D0
> CONFIG_MODULES=3Dy
> # CONFIG_MODULE_FORCE_LOAD is not set
> CONFIG_MODULE_UNLOAD=3Dy
> # CONFIG_MODULE_FORCE_UNLOAD is not set
> # CONFIG_MODVERSIONS is not set
> # CONFIG_MODULE_SRCVERSION_ALL is not set
> # CONFIG_MODULE_SIG is not set
> CONFIG_MODULE_COMPRESS_NONE=3Dy
> # CONFIG_MODULE_COMPRESS_GZIP is not set
> # CONFIG_MODULE_COMPRESS_XZ is not set
> # CONFIG_MODULE_COMPRESS_ZSTD is not set
> # CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
> CONFIG_MODPROBE_PATH=3D"/sbin/modprobe"
> # CONFIG_TRIM_UNUSED_KSYMS is not set
> CONFIG_MODULES_TREE_LOOKUP=3Dy
> CONFIG_BLOCK=3Dy
> CONFIG_BLK_DEV_BSG_COMMON=3Dy
> CONFIG_BLK_ICQ=3Dy
> CONFIG_BLK_DEV_BSGLIB=3Dy
> CONFIG_BLK_DEV_INTEGRITY=3Dy
> CONFIG_BLK_DEV_INTEGRITY_T10=3Dy
> # CONFIG_BLK_DEV_ZONED is not set
> # CONFIG_BLK_WBT is not set
> CONFIG_BLK_DEBUG_FS=3Dy
> CONFIG_BLK_SED_OPAL=3Dy
> CONFIG_BLK_INLINE_ENCRYPTION=3Dy
> CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK=3Dy
> =

> #
> # Partition Types
> #
> # CONFIG_PARTITION_ADVANCED is not set
> CONFIG_MSDOS_PARTITION=3Dy
> CONFIG_EFI_PARTITION=3Dy
> # end of Partition Types
> =

> CONFIG_BLK_MQ_PCI=3Dy
> CONFIG_BLK_MQ_VIRTIO=3Dy
> CONFIG_BLK_PM=3Dy
> CONFIG_BLOCK_HOLDER_DEPRECATED=3Dy
> =

> #
> # IO Schedulers
> #
> CONFIG_MQ_IOSCHED_DEADLINE=3Dy
> CONFIG_MQ_IOSCHED_KYBER=3Dy
> CONFIG_IOSCHED_BFQ=3Dy
> # end of IO Schedulers
> =

> CONFIG_ASN1=3Dy
> CONFIG_UNINLINE_SPIN_UNLOCK=3Dy
> CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=3Dy
> CONFIG_MUTEX_SPIN_ON_OWNER=3Dy
> CONFIG_RWSEM_SPIN_ON_OWNER=3Dy
> CONFIG_LOCK_SPIN_ON_OWNER=3Dy
> CONFIG_ARCH_USE_QUEUED_SPINLOCKS=3Dy
> CONFIG_QUEUED_SPINLOCKS=3Dy
> CONFIG_ARCH_USE_QUEUED_RWLOCKS=3Dy
> CONFIG_QUEUED_RWLOCKS=3Dy
> CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=3Dy
> CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=3Dy
> CONFIG_ARCH_HAS_SYSCALL_WRAPPER=3Dy
> CONFIG_FREEZER=3Dy
> =

> #
> # Executable file formats
> #
> CONFIG_BINFMT_ELF=3Dy
> CONFIG_ELFCORE=3Dy
> CONFIG_BINFMT_SCRIPT=3Dy
> CONFIG_BINFMT_MISC=3Dy
> CONFIG_COREDUMP=3Dy
> # end of Executable file formats
> =

> #
> # Memory Management options
> #
> CONFIG_SELECT_MEMORY_MODEL=3Dy
> CONFIG_FLATMEM_MANUAL=3Dy
> # CONFIG_SPARSEMEM_MANUAL is not set
> CONFIG_FLATMEM=3Dy
> CONFIG_SPARSEMEM_STATIC=3Dy
> CONFIG_HAVE_FAST_GUP=3Dy
> CONFIG_EXCLUSIVE_SYSTEM_RAM=3Dy
> CONFIG_SPLIT_PTLOCK_CPUS=3D4
> CONFIG_COMPACTION=3Dy
> # CONFIG_PAGE_REPORTING is not set
> CONFIG_MIGRATION=3Dy
> CONFIG_BOUNCE=3Dy
> CONFIG_VIRT_TO_BUS=3Dy
> # CONFIG_KSM is not set
> CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
> CONFIG_TRANSPARENT_HUGEPAGE=3Dy
> # CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS is not set
> CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=3Dy
> CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=3Dy
> CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=3Dy
> CONFIG_HAVE_SETUP_PER_CPU_AREA=3Dy
> # CONFIG_CMA is not set
> # CONFIG_ZSWAP is not set
> CONFIG_ZPOOL=3Dy
> CONFIG_ZBUD=3Dy
> # CONFIG_Z3FOLD is not set
> CONFIG_ZSMALLOC=3Dy
> CONFIG_ZSMALLOC_STAT=3Dy
> CONFIG_GENERIC_EARLY_IOREMAP=3Dy
> # CONFIG_IDLE_PAGE_TRACKING is not set
> CONFIG_ARCH_HAS_CACHE_LINE_SIZE=3Dy
> CONFIG_ARCH_HAS_ZONE_DMA_SET=3Dy
> CONFIG_ZONE_DMA=3Dy
> # CONFIG_PERCPU_STATS is not set
> # CONFIG_GUP_TEST is not set
> # CONFIG_READ_ONLY_THP_FOR_FS is not set
> CONFIG_ARCH_HAS_PTE_SPECIAL=3Dy
> CONFIG_KMAP_LOCAL=3Dy
> CONFIG_SECRETMEM=3Dy
> =

> #
> # Data Access Monitoring
> #
> # CONFIG_DAMON is not set
> # end of Data Access Monitoring
> # end of Memory Management options
> =

> CONFIG_NET=3Dy
> =

> #
> # Networking options
> #
> CONFIG_PACKET=3Dy
> # CONFIG_PACKET_DIAG is not set
> CONFIG_UNIX=3Dy
> CONFIG_UNIX_SCM=3Dy
> CONFIG_AF_UNIX_OOB=3Dy
> # CONFIG_UNIX_DIAG is not set
> # CONFIG_TLS is not set
> # CONFIG_XFRM_USER is not set
> # CONFIG_NET_KEY is not set
> # CONFIG_XDP_SOCKETS is not set
> CONFIG_INET=3Dy
> # CONFIG_IP_MULTICAST is not set
> # CONFIG_IP_ADVANCED_ROUTER is not set
> CONFIG_IP_PNP=3Dy
> CONFIG_IP_PNP_DHCP=3Dy
> # CONFIG_IP_PNP_BOOTP is not set
> # CONFIG_IP_PNP_RARP is not set
> # CONFIG_NET_IPIP is not set
> # CONFIG_NET_IPGRE_DEMUX is not set
> CONFIG_NET_IP_TUNNEL=3Dy
> # CONFIG_SYN_COOKIES is not set
> # CONFIG_NET_IPVTI is not set
> # CONFIG_NET_FOU is not set
> # CONFIG_NET_FOU_IP_TUNNELS is not set
> # CONFIG_INET_AH is not set
> # CONFIG_INET_ESP is not set
> # CONFIG_INET_IPCOMP is not set
> CONFIG_INET_TUNNEL=3Dy
> CONFIG_INET_DIAG=3Dy
> CONFIG_INET_TCP_DIAG=3Dy
> # CONFIG_INET_UDP_DIAG is not set
> # CONFIG_INET_RAW_DIAG is not set
> # CONFIG_INET_DIAG_DESTROY is not set
> # CONFIG_TCP_CONG_ADVANCED is not set
> CONFIG_TCP_CONG_CUBIC=3Dy
> CONFIG_DEFAULT_TCP_CONG=3D"cubic"
> # CONFIG_TCP_MD5SIG is not set
> CONFIG_IPV6=3Dy
> # CONFIG_IPV6_ROUTER_PREF is not set
> # CONFIG_IPV6_OPTIMISTIC_DAD is not set
> # CONFIG_INET6_AH is not set
> # CONFIG_INET6_ESP is not set
> # CONFIG_INET6_IPCOMP is not set
> # CONFIG_IPV6_MIP6 is not set
> # CONFIG_IPV6_VTI is not set
> CONFIG_IPV6_SIT=3Dy
> # CONFIG_IPV6_SIT_6RD is not set
> CONFIG_IPV6_NDISC_NODETYPE=3Dy
> # CONFIG_IPV6_TUNNEL is not set
> # CONFIG_IPV6_MULTIPLE_TABLES is not set
> # CONFIG_IPV6_MROUTE is not set
> # CONFIG_IPV6_SEG6_LWTUNNEL is not set
> # CONFIG_IPV6_SEG6_HMAC is not set
> # CONFIG_IPV6_RPL_LWTUNNEL is not set
> # CONFIG_IPV6_IOAM6_LWTUNNEL is not set
> # CONFIG_NETLABEL is not set
> # CONFIG_MPTCP is not set
> # CONFIG_NETWORK_SECMARK is not set
> # CONFIG_NETWORK_PHY_TIMESTAMPING is not set
> # CONFIG_NETFILTER is not set
> # CONFIG_BPFILTER is not set
> # CONFIG_IP_DCCP is not set
> # CONFIG_IP_SCTP is not set
> # CONFIG_RDS is not set
> # CONFIG_TIPC is not set
> # CONFIG_ATM is not set
> # CONFIG_L2TP is not set
> # CONFIG_BRIDGE is not set
> # CONFIG_NET_DSA is not set
> # CONFIG_VLAN_8021Q is not set
> # CONFIG_DECNET is not set
> # CONFIG_LLC2 is not set
> # CONFIG_ATALK is not set
> # CONFIG_X25 is not set
> # CONFIG_LAPB is not set
> # CONFIG_PHONET is not set
> # CONFIG_6LOWPAN is not set
> # CONFIG_IEEE802154 is not set
> # CONFIG_NET_SCHED is not set
> # CONFIG_DCB is not set
> CONFIG_DNS_RESOLVER=3Dm
> # CONFIG_BATMAN_ADV is not set
> # CONFIG_OPENVSWITCH is not set
> # CONFIG_VSOCKETS is not set
> # CONFIG_NETLINK_DIAG is not set
> # CONFIG_MPLS is not set
> # CONFIG_NET_NSH is not set
> # CONFIG_HSR is not set
> # CONFIG_NET_SWITCHDEV is not set
> # CONFIG_NET_L3_MASTER_DEV is not set
> # CONFIG_QRTR is not set
> # CONFIG_NET_NCSI is not set
> CONFIG_PCPU_DEV_REFCNT=3Dy
> CONFIG_RPS=3Dy
> CONFIG_RFS_ACCEL=3Dy
> CONFIG_SOCK_RX_QUEUE_MAPPING=3Dy
> CONFIG_XPS=3Dy
> # CONFIG_CGROUP_NET_PRIO is not set
> # CONFIG_CGROUP_NET_CLASSID is not set
> CONFIG_NET_RX_BUSY_POLL=3Dy
> CONFIG_BQL=3Dy
> CONFIG_NET_FLOW_LIMIT=3Dy
> =

> #
> # Network testing
> #
> # CONFIG_NET_PKTGEN is not set
> # CONFIG_NET_DROP_MONITOR is not set
> # end of Network testing
> # end of Networking options
> =

> # CONFIG_HAMRADIO is not set
> # CONFIG_CAN is not set
> # CONFIG_BT is not set
> # CONFIG_AF_RXRPC is not set
> # CONFIG_AF_KCM is not set
> # CONFIG_MCTP is not set
> CONFIG_WIRELESS=3Dy
> # CONFIG_CFG80211 is not set
> =

> #
> # CFG80211 needs to be enabled for MAC80211
> #
> CONFIG_MAC80211_STA_HASH_MAX_SIZE=3D0
> # CONFIG_RFKILL is not set
> CONFIG_NET_9P=3Dy
> CONFIG_NET_9P_FD=3Dy
> CONFIG_NET_9P_VIRTIO=3Dy
> # CONFIG_NET_9P_DEBUG is not set
> # CONFIG_CAIF is not set
> # CONFIG_CEPH_LIB is not set
> # CONFIG_NFC is not set
> # CONFIG_PSAMPLE is not set
> # CONFIG_NET_IFE is not set
> # CONFIG_LWTUNNEL is not set
> CONFIG_DST_CACHE=3Dy
> CONFIG_GRO_CELLS=3Dy
> CONFIG_NET_SOCK_MSG=3Dy
> CONFIG_FAILOVER=3Dm
> CONFIG_ETHTOOL_NETLINK=3Dy
> # CONFIG_NETDEV_ADDR_LIST_TEST is not set
> =

> #
> # Device Drivers
> #
> CONFIG_HAVE_EISA=3Dy
> CONFIG_EISA=3Dy
> CONFIG_EISA_VLB_PRIMING=3Dy
> # CONFIG_EISA_PCI_EISA is not set
> # CONFIG_EISA_VIRTUAL_ROOT is not set
> # CONFIG_EISA_NAMES is not set
> CONFIG_HAVE_PCI=3Dy
> CONFIG_PCI=3Dy
> CONFIG_PCI_DOMAINS=3Dy
> # CONFIG_PCIEPORTBUS is not set
> CONFIG_PCIEASPM=3Dy
> # CONFIG_PCIEASPM_DEFAULT is not set
> # CONFIG_PCIEASPM_POWERSAVE is not set
> # CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
> CONFIG_PCIEASPM_PERFORMANCE=3Dy
> # CONFIG_PCIE_PTM is not set
> # CONFIG_PCI_MSI is not set
> CONFIG_PCI_QUIRKS=3Dy
> # CONFIG_PCI_DEBUG is not set
> # CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
> # CONFIG_PCI_STUB is not set
> CONFIG_PCI_PF_STUB=3Dy
> CONFIG_PCI_ATS=3Dy
> CONFIG_PCI_ECAM=3Dy
> CONFIG_PCI_LOCKLESS_CONFIG=3Dy
> CONFIG_PCI_IOV=3Dy
> # CONFIG_PCI_PRI is not set
> CONFIG_PCI_PASID=3Dy
> CONFIG_PCI_LABEL=3Dy
> # CONFIG_PCIE_BUS_TUNE_OFF is not set
> # CONFIG_PCIE_BUS_DEFAULT is not set
> CONFIG_PCIE_BUS_SAFE=3Dy
> # CONFIG_PCIE_BUS_PERFORMANCE is not set
> # CONFIG_PCIE_BUS_PEER2PEER is not set
> # CONFIG_HOTPLUG_PCI is not set
> =

> #
> # PCI controller drivers
> #
> # CONFIG_PCI_FTPCI100 is not set
> CONFIG_PCI_HOST_COMMON=3Dy
> CONFIG_PCI_HOST_GENERIC=3Dy
> =

> #
> # DesignWare PCI Core Support
> #
> # end of DesignWare PCI Core Support
> =

> #
> # Mobiveil PCIe Core Support
> #
> # end of Mobiveil PCIe Core Support
> =

> #
> # Cadence PCIe controllers support
> #
> CONFIG_PCIE_CADENCE=3Dy
> CONFIG_PCIE_CADENCE_EP=3Dy
> # CONFIG_PCIE_CADENCE_PLAT_HOST is not set
> # CONFIG_PCIE_CADENCE_PLAT_EP is not set
> CONFIG_PCI_J721E=3Dy
> # CONFIG_PCI_J721E_HOST is not set
> CONFIG_PCI_J721E_EP=3Dy
> # end of Cadence PCIe controllers support
> # end of PCI controller drivers
> =

> #
> # PCI Endpoint
> #
> CONFIG_PCI_ENDPOINT=3Dy
> # CONFIG_PCI_ENDPOINT_CONFIGFS is not set
> # CONFIG_PCI_EPF_TEST is not set
> CONFIG_PCI_EPF_NTB=3Dy
> # end of PCI Endpoint
> =

> #
> # PCI switch controller drivers
> #
> CONFIG_PCI_SW_SWITCHTEC=3Dy
> # end of PCI switch controller drivers
> =

> CONFIG_CXL_BUS=3Dy
> # CONFIG_CXL_MEM is not set
> CONFIG_CXL_ACPI=3Dy
> CONFIG_PCCARD=3Dy
> CONFIG_PCMCIA=3Dy
> CONFIG_PCMCIA_LOAD_CIS=3Dy
> # CONFIG_CARDBUS is not set
> =

> #
> # PC-card bridges
> #
> CONFIG_YENTA=3Dy
> # CONFIG_YENTA_O2 is not set
> # CONFIG_YENTA_RICOH is not set
> # CONFIG_YENTA_TI is not set
> CONFIG_YENTA_TOSHIBA=3Dy
> CONFIG_PD6729=3Dy
> # CONFIG_I82092 is not set
> # CONFIG_I82365 is not set
> CONFIG_TCIC=3Dy
> CONFIG_PCMCIA_PROBE=3Dy
> CONFIG_PCCARD_NONSTATIC=3Dy
> CONFIG_RAPIDIO=3Dy
> CONFIG_RAPIDIO_DISC_TIMEOUT=3D30
> # CONFIG_RAPIDIO_ENABLE_RX_TX_PORTS is not set
> # CONFIG_RAPIDIO_DMA_ENGINE is not set
> CONFIG_RAPIDIO_DEBUG=3Dy
> CONFIG_RAPIDIO_ENUM_BASIC=3Dy
> CONFIG_RAPIDIO_CHMAN=3Dy
> CONFIG_RAPIDIO_MPORT_CDEV=3Dy
> =

> #
> # RapidIO Switch drivers
> #
> # CONFIG_RAPIDIO_CPS_XX is not set
> CONFIG_RAPIDIO_CPS_GEN2=3Dy
> # CONFIG_RAPIDIO_RXS_GEN3 is not set
> # end of RapidIO Switch drivers
> =

> #
> # Generic Driver Options
> #
> CONFIG_UEVENT_HELPER=3Dy
> CONFIG_UEVENT_HELPER_PATH=3D""
> CONFIG_DEVTMPFS=3Dy
> CONFIG_DEVTMPFS_MOUNT=3Dy
> # CONFIG_DEVTMPFS_SAFE is not set
> CONFIG_STANDALONE=3Dy
> CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
> =

> #
> # Firmware loader
> #
> CONFIG_FW_LOADER=3Dy
> CONFIG_FW_LOADER_PAGED_BUF=3Dy
> CONFIG_EXTRA_FIRMWARE=3D""
> CONFIG_FW_LOADER_USER_HELPER=3Dy
> # CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
> CONFIG_FW_LOADER_COMPRESS=3Dy
> CONFIG_FW_CACHE=3Dy
> # end of Firmware loader
> =

> CONFIG_ALLOW_DEV_COREDUMP=3Dy
> # CONFIG_DEBUG_DRIVER is not set
> CONFIG_DEBUG_DEVRES=3Dy
> # CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
> CONFIG_PM_QOS_KUNIT_TEST=3Dy
> # CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
> CONFIG_DRIVER_PE_KUNIT_TEST=3Dy
> CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
> CONFIG_GENERIC_CPU_VULNERABILITIES=3Dy
> CONFIG_REGMAP=3Dy
> CONFIG_REGMAP_I2C=3Dy
> CONFIG_REGMAP_SPI=3Dy
> CONFIG_REGMAP_SPMI=3Dy
> CONFIG_REGMAP_MMIO=3Dy
> CONFIG_REGMAP_IRQ=3Dy
> CONFIG_REGMAP_I3C=3Dy
> CONFIG_REGMAP_SPI_AVMM=3Dy
> CONFIG_DMA_SHARED_BUFFER=3Dy
> # CONFIG_DMA_FENCE_TRACE is not set
> # end of Generic Driver Options
> =

> #
> # Bus devices
> #
> # CONFIG_MOXTET is not set
> # CONFIG_MHI_BUS is not set
> # end of Bus devices
> =

> # CONFIG_CONNECTOR is not set
> =

> #
> # Firmware Drivers
> #
> =

> #
> # ARM System Control and Management Interface Protocol
> #
> # end of ARM System Control and Management Interface Protocol
> =

> CONFIG_EDD=3Dy
> # CONFIG_EDD_OFF is not set
> CONFIG_FIRMWARE_MEMMAP=3Dy
> CONFIG_FW_CFG_SYSFS=3Dy
> CONFIG_FW_CFG_SYSFS_CMDLINE=3Dy
> CONFIG_SYSFB=3Dy
> CONFIG_SYSFB_SIMPLEFB=3Dy
> # CONFIG_GOOGLE_FIRMWARE is not set
> =

> #
> # Tegra firmware driver
> #
> # end of Tegra firmware driver
> # end of Firmware Drivers
> =

> CONFIG_GNSS=3Dy
> CONFIG_MTD=3Dy
> # CONFIG_MTD_TESTS is not set
> =

> #
> # Partition parsers
> #
> # CONFIG_MTD_AR7_PARTS is not set
> # CONFIG_MTD_CMDLINE_PARTS is not set
> # CONFIG_MTD_OF_PARTS is not set
> CONFIG_MTD_REDBOOT_PARTS=3Dy
> CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=3D-1
> CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED=3Dy
> # CONFIG_MTD_REDBOOT_PARTS_READONLY is not set
> # end of Partition parsers
> =

> #
> # User Modules And Translation Layers
> #
> CONFIG_MTD_BLKDEVS=3Dy
> CONFIG_MTD_BLOCK=3Dy
> =

> #
> # Note that in some cases UBI block is preferred. See MTD_UBI_BLOCK.
> #
> CONFIG_FTL=3Dy
> CONFIG_NFTL=3Dy
> CONFIG_NFTL_RW=3Dy
> CONFIG_INFTL=3Dy
> CONFIG_RFD_FTL=3Dy
> CONFIG_SSFDC=3Dy
> CONFIG_SM_FTL=3Dy
> CONFIG_MTD_OOPS=3Dy
> CONFIG_MTD_SWAP=3Dy
> # CONFIG_MTD_PARTITIONED_MASTER is not set
> =

> #
> # RAM/ROM/Flash chip drivers
> #
> CONFIG_MTD_CFI=3Dy
> CONFIG_MTD_JEDECPROBE=3Dy
> CONFIG_MTD_GEN_PROBE=3Dy
> # CONFIG_MTD_CFI_ADV_OPTIONS is not set
> CONFIG_MTD_MAP_BANK_WIDTH_1=3Dy
> CONFIG_MTD_MAP_BANK_WIDTH_2=3Dy
> CONFIG_MTD_MAP_BANK_WIDTH_4=3Dy
> CONFIG_MTD_CFI_I1=3Dy
> CONFIG_MTD_CFI_I2=3Dy
> CONFIG_MTD_CFI_INTELEXT=3Dy
> CONFIG_MTD_CFI_AMDSTD=3Dy
> # CONFIG_MTD_CFI_STAA is not set
> CONFIG_MTD_CFI_UTIL=3Dy
> CONFIG_MTD_RAM=3Dy
> CONFIG_MTD_ROM=3Dy
> CONFIG_MTD_ABSENT=3Dy
> # end of RAM/ROM/Flash chip drivers
> =

> #
> # Mapping drivers for chip access
> #
> CONFIG_MTD_COMPLEX_MAPPINGS=3Dy
> # CONFIG_MTD_PHYSMAP is not set
> # CONFIG_MTD_SBC_GXX is not set
> CONFIG_MTD_SCx200_DOCFLASH=3Dy
> CONFIG_MTD_AMD76XROM=3Dy
> CONFIG_MTD_ICHXROM=3Dy
> CONFIG_MTD_ESB2ROM=3Dy
> CONFIG_MTD_CK804XROM=3Dy
> # CONFIG_MTD_SCB2_FLASH is not set
> # CONFIG_MTD_NETtel is not set
> CONFIG_MTD_L440GX=3Dy
> # CONFIG_MTD_PCI is not set
> # CONFIG_MTD_PCMCIA is not set
> CONFIG_MTD_INTEL_VR_NOR=3Dy
> # CONFIG_MTD_PLATRAM is not set
> # end of Mapping drivers for chip access
> =

> #
> # Self-contained MTD device drivers
> #
> # CONFIG_MTD_PMC551 is not set
> CONFIG_MTD_DATAFLASH=3Dy
> CONFIG_MTD_DATAFLASH_WRITE_VERIFY=3Dy
> # CONFIG_MTD_DATAFLASH_OTP is not set
> # CONFIG_MTD_MCHP23K256 is not set
> # CONFIG_MTD_MCHP48L640 is not set
> CONFIG_MTD_SST25L=3Dy
> # CONFIG_MTD_SLRAM is not set
> CONFIG_MTD_PHRAM=3Dy
> CONFIG_MTD_MTDRAM=3Dy
> CONFIG_MTDRAM_TOTAL_SIZE=3D4096
> CONFIG_MTDRAM_ERASE_SIZE=3D128
> # CONFIG_MTD_BLOCK2MTD is not set
> =

> #
> # Disk-On-Chip Device Drivers
> #
> CONFIG_MTD_DOCG3=3Dy
> CONFIG_BCH_CONST_M=3D14
> CONFIG_BCH_CONST_T=3D4
> # end of Self-contained MTD device drivers
> =

> #
> # NAND
> #
> CONFIG_MTD_NAND_CORE=3Dy
> CONFIG_MTD_ONENAND=3Dy
> # CONFIG_MTD_ONENAND_VERIFY_WRITE is not set
> CONFIG_MTD_ONENAND_GENERIC=3Dy
> # CONFIG_MTD_ONENAND_OTP is not set
> CONFIG_MTD_ONENAND_2X_PROGRAM=3Dy
> CONFIG_MTD_RAW_NAND=3Dy
> =

> #
> # Raw/parallel NAND flash controllers
> #
> CONFIG_MTD_NAND_DENALI=3Dy
> CONFIG_MTD_NAND_DENALI_PCI=3Dy
> # CONFIG_MTD_NAND_DENALI_DT is not set
> # CONFIG_MTD_NAND_CAFE is not set
> CONFIG_MTD_NAND_CS553X=3Dy
> CONFIG_MTD_NAND_MXIC=3Dy
> CONFIG_MTD_NAND_GPIO=3Dy
> # CONFIG_MTD_NAND_PLATFORM is not set
> CONFIG_MTD_NAND_CADENCE=3Dy
> CONFIG_MTD_NAND_ARASAN=3Dy
> CONFIG_MTD_NAND_INTEL_LGM=3Dy
> =

> #
> # Misc
> #
> CONFIG_MTD_SM_COMMON=3Dy
> CONFIG_MTD_NAND_NANDSIM=3Dy
> CONFIG_MTD_NAND_RICOH=3Dy
> CONFIG_MTD_NAND_DISKONCHIP=3Dy
> CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADVANCED=3Dy
> CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS=3D0
> CONFIG_MTD_NAND_DISKONCHIP_PROBE_HIGH=3Dy
> CONFIG_MTD_NAND_DISKONCHIP_BBTWRITE=3Dy
> CONFIG_MTD_SPI_NAND=3Dy
> =

> #
> # ECC engine support
> #
> CONFIG_MTD_NAND_ECC=3Dy
> CONFIG_MTD_NAND_ECC_SW_HAMMING=3Dy
> CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC=3Dy
> CONFIG_MTD_NAND_ECC_SW_BCH=3Dy
> # end of ECC engine support
> # end of NAND
> =

> #
> # LPDDR & LPDDR2 PCM memory drivers
> #
> CONFIG_MTD_LPDDR=3Dy
> CONFIG_MTD_QINFO_PROBE=3Dy
> # end of LPDDR & LPDDR2 PCM memory drivers
> =

> # CONFIG_MTD_SPI_NOR is not set
> # CONFIG_MTD_UBI is not set
> CONFIG_MTD_HYPERBUS=3Dy
> CONFIG_DTC=3Dy
> CONFIG_OF=3Dy
> # CONFIG_OF_UNITTEST is not set
> CONFIG_OF_FLATTREE=3Dy
> CONFIG_OF_EARLY_FLATTREE=3Dy
> CONFIG_OF_KOBJ=3Dy
> CONFIG_OF_DYNAMIC=3Dy
> CONFIG_OF_ADDRESS=3Dy
> CONFIG_OF_IRQ=3Dy
> CONFIG_OF_RESERVED_MEM=3Dy
> CONFIG_OF_RESOLVE=3Dy
> CONFIG_OF_OVERLAY=3Dy
> CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
> CONFIG_PARPORT=3Dy
> CONFIG_PARPORT_PC=3Dy
> # CONFIG_PARPORT_SERIAL is not set
> CONFIG_PARPORT_PC_FIFO=3Dy
> # CONFIG_PARPORT_PC_SUPERIO is not set
> CONFIG_PARPORT_PC_PCMCIA=3Dy
> # CONFIG_PARPORT_AX88796 is not set
> CONFIG_PARPORT_1284=3Dy
> CONFIG_PNP=3Dy
> # CONFIG_PNP_DEBUG_MESSAGES is not set
> =

> #
> # Protocols
> #
> # CONFIG_ISAPNP is not set
> CONFIG_PNPBIOS=3Dy
> # CONFIG_PNPBIOS_PROC_FS is not set
> CONFIG_PNPACPI=3Dy
> CONFIG_BLK_DEV=3Dy
> CONFIG_BLK_DEV_NULL_BLK=3Dy
> # CONFIG_BLK_DEV_NULL_BLK_FAULT_INJECTION is not set
> # CONFIG_BLK_DEV_FD is not set
> CONFIG_CDROM=3Dy
> # CONFIG_PARIDE is not set
> CONFIG_BLK_DEV_PCIESSD_MTIP32XX=3Dy
> # CONFIG_ZRAM is not set
> CONFIG_BLK_DEV_LOOP=3Dy
> CONFIG_BLK_DEV_LOOP_MIN_COUNT=3D8
> # CONFIG_BLK_DEV_DRBD is not set
> # CONFIG_BLK_DEV_NBD is not set
> CONFIG_BLK_DEV_SX8=3Dy
> CONFIG_BLK_DEV_RAM=3Dy
> CONFIG_BLK_DEV_RAM_COUNT=3D16
> CONFIG_BLK_DEV_RAM_SIZE=3D4096
> # CONFIG_CDROM_PKTCDVD is not set
> # CONFIG_ATA_OVER_ETH is not set
> CONFIG_VIRTIO_BLK=3Dy
> # CONFIG_BLK_DEV_RBD is not set
> =

> #
> # NVME Support
> #
> CONFIG_NVME_CORE=3Dy
> # CONFIG_BLK_DEV_NVME is not set
> # CONFIG_NVME_MULTIPATH is not set
> # CONFIG_NVME_HWMON is not set
> CONFIG_NVME_FABRICS=3Dy
> CONFIG_NVME_FC=3Dy
> # CONFIG_NVME_TCP is not set
> # CONFIG_NVME_TARGET is not set
> # end of NVME Support
> =

> #
> # Misc devices
> #
> CONFIG_AD525X_DPOT=3Dy
> CONFIG_AD525X_DPOT_I2C=3Dy
> # CONFIG_AD525X_DPOT_SPI is not set
> CONFIG_DUMMY_IRQ=3Dy
> # CONFIG_IBM_ASM is not set
> CONFIG_PHANTOM=3Dy
> CONFIG_TIFM_CORE=3Dy
> CONFIG_TIFM_7XX1=3Dy
> CONFIG_ICS932S401=3Dy
> CONFIG_ENCLOSURE_SERVICES=3Dy
> # CONFIG_CS5535_MFGPT is not set
> CONFIG_HI6421V600_IRQ=3Dy
> # CONFIG_HP_ILO is not set
> CONFIG_APDS9802ALS=3Dy
> # CONFIG_ISL29003 is not set
> # CONFIG_ISL29020 is not set
> CONFIG_SENSORS_TSL2550=3Dy
> # CONFIG_SENSORS_BH1770 is not set
> CONFIG_SENSORS_APDS990X=3Dy
> CONFIG_HMC6352=3Dy
> # CONFIG_DS1682 is not set
> # CONFIG_VMWARE_BALLOON is not set
> # CONFIG_PCH_PHUB is not set
> CONFIG_LATTICE_ECP3_CONFIG=3Dy
> CONFIG_SRAM=3Dy
> CONFIG_DW_XDATA_PCIE=3Dy
> CONFIG_PCI_ENDPOINT_TEST=3Dy
> # CONFIG_XILINX_SDFEC is not set
> CONFIG_MISC_RTSX=3Dy
> CONFIG_C2PORT=3Dy
> # CONFIG_C2PORT_DURAMAR_2150 is not set
> =

> #
> # EEPROM support
> #
> CONFIG_EEPROM_AT24=3Dy
> CONFIG_EEPROM_AT25=3Dy
> CONFIG_EEPROM_LEGACY=3Dy
> # CONFIG_EEPROM_MAX6875 is not set
> # CONFIG_EEPROM_93CX6 is not set
> # CONFIG_EEPROM_93XX46 is not set
> CONFIG_EEPROM_IDT_89HPESX=3Dy
> # CONFIG_EEPROM_EE1004 is not set
> # end of EEPROM support
> =

> CONFIG_CB710_CORE=3Dy
> CONFIG_CB710_DEBUG=3Dy
> CONFIG_CB710_DEBUG_ASSUMPTIONS=3Dy
> =

> #
> # Texas Instruments shared transport line discipline
> #
> # CONFIG_TI_ST is not set
> # end of Texas Instruments shared transport line discipline
> =

> # CONFIG_SENSORS_LIS3_I2C is not set
> # CONFIG_ALTERA_STAPL is not set
> CONFIG_INTEL_MEI=3Dy
> # CONFIG_INTEL_MEI_ME is not set
> CONFIG_INTEL_MEI_TXE=3Dy
> CONFIG_VMWARE_VMCI=3Dy
> CONFIG_ECHO=3Dy
> CONFIG_MISC_ALCOR_PCI=3Dy
> CONFIG_MISC_RTSX_PCI=3Dy
> # CONFIG_HABANA_AI is not set
> CONFIG_UACCE=3Dy
> CONFIG_PVPANIC=3Dy
> # CONFIG_PVPANIC_MMIO is not set
> CONFIG_PVPANIC_PCI=3Dy
> # end of Misc devices
> =

> #
> # SCSI device support
> #
> CONFIG_SCSI_MOD=3Dy
> CONFIG_RAID_ATTRS=3Dy
> CONFIG_SCSI_COMMON=3Dy
> CONFIG_SCSI=3Dy
> CONFIG_SCSI_DMA=3Dy
> CONFIG_SCSI_PROC_FS=3Dy
> =

> #
> # SCSI support type (disk, tape, CD-ROM)
> #
> # CONFIG_BLK_DEV_SD is not set
> # CONFIG_CHR_DEV_ST is not set
> CONFIG_BLK_DEV_SR=3Dy
> CONFIG_CHR_DEV_SG=3Dy
> # CONFIG_BLK_DEV_BSG is not set
> CONFIG_CHR_DEV_SCH=3Dy
> CONFIG_SCSI_ENCLOSURE=3Dy
> # CONFIG_SCSI_CONSTANTS is not set
> CONFIG_SCSI_LOGGING=3Dy
> # CONFIG_SCSI_SCAN_ASYNC is not set
> =

> #
> # SCSI Transports
> #
> CONFIG_SCSI_SPI_ATTRS=3Dy
> # CONFIG_SCSI_FC_ATTRS is not set
> # CONFIG_SCSI_ISCSI_ATTRS is not set
> CONFIG_SCSI_SAS_ATTRS=3Dy
> CONFIG_SCSI_SAS_LIBSAS=3Dy
> # CONFIG_SCSI_SAS_ATA is not set
> CONFIG_SCSI_SAS_HOST_SMP=3Dy
> # CONFIG_SCSI_SRP_ATTRS is not set
> # end of SCSI Transports
> =

> # CONFIG_SCSI_LOWLEVEL is not set
> CONFIG_SCSI_DH=3Dy
> CONFIG_SCSI_DH_RDAC=3Dy
> CONFIG_SCSI_DH_HP_SW=3Dy
> # CONFIG_SCSI_DH_EMC is not set
> CONFIG_SCSI_DH_ALUA=3Dy
> # end of SCSI device support
> =

> CONFIG_ATA=3Dy
> CONFIG_SATA_HOST=3Dy
> CONFIG_PATA_TIMINGS=3Dy
> CONFIG_ATA_VERBOSE_ERROR=3Dy
> CONFIG_ATA_FORCE=3Dy
> CONFIG_ATA_ACPI=3Dy
> # CONFIG_SATA_ZPODD is not set
> CONFIG_SATA_PMP=3Dy
> =

> #
> # Controllers with non-SFF native interface
> #
> CONFIG_SATA_AHCI=3Dy
> CONFIG_SATA_MOBILE_LPM_POLICY=3D0
> CONFIG_SATA_AHCI_PLATFORM=3Dy
> CONFIG_AHCI_CEVA=3Dy
> CONFIG_AHCI_QORIQ=3Dy
> # CONFIG_SATA_INIC162X is not set
> # CONFIG_SATA_ACARD_AHCI is not set
> # CONFIG_SATA_SIL24 is not set
> CONFIG_ATA_SFF=3Dy
> =

> #
> # SFF controllers with custom DMA interface
> #
> CONFIG_PDC_ADMA=3Dy
> CONFIG_SATA_QSTOR=3Dy
> # CONFIG_SATA_SX4 is not set
> # CONFIG_ATA_BMDMA is not set
> =

> #
> # PIO-only SFF controllers
> #
> CONFIG_PATA_CMD640_PCI=3Dy
> # CONFIG_PATA_MPIIX is not set
> CONFIG_PATA_NS87410=3Dy
> CONFIG_PATA_OPTI=3Dy
> # CONFIG_PATA_PCMCIA is not set
> CONFIG_PATA_PLATFORM=3Dy
> # CONFIG_PATA_OF_PLATFORM is not set
> # CONFIG_PATA_QDI is not set
> CONFIG_PATA_RZ1000=3Dy
> CONFIG_PATA_WINBOND_VLB=3Dy
> =

> #
> # Generic fallback / legacy drivers
> #
> CONFIG_PATA_LEGACY=3Dy
> CONFIG_MD=3Dy
> CONFIG_BLK_DEV_MD=3Dy
> # CONFIG_MD_AUTODETECT is not set
> CONFIG_MD_LINEAR=3Dy
> # CONFIG_MD_RAID0 is not set
> CONFIG_MD_RAID1=3Dy
> # CONFIG_MD_RAID10 is not set
> CONFIG_MD_RAID456=3Dy
> # CONFIG_MD_MULTIPATH is not set
> CONFIG_MD_FAULTY=3Dy
> CONFIG_BCACHE=3Dy
> # CONFIG_BCACHE_DEBUG is not set
> CONFIG_BCACHE_CLOSURES_DEBUG=3Dy
> # CONFIG_BCACHE_ASYNC_REGISTRATION is not set
> # CONFIG_BLK_DEV_DM is not set
> # CONFIG_TARGET_CORE is not set
> CONFIG_FUSION=3Dy
> CONFIG_FUSION_SPI=3Dy
> # CONFIG_FUSION_SAS is not set
> CONFIG_FUSION_MAX_SGE=3D128
> # CONFIG_FUSION_CTL is not set
> # CONFIG_FUSION_LOGGING is not set
> =

> #
> # IEEE 1394 (FireWire) support
> #
> # CONFIG_FIREWIRE is not set
> CONFIG_FIREWIRE_NOSY=3Dy
> # end of IEEE 1394 (FireWire) support
> =

> CONFIG_MACINTOSH_DRIVERS=3Dy
> # CONFIG_MAC_EMUMOUSEBTN is not set
> CONFIG_NETDEVICES=3Dy
> CONFIG_NET_CORE=3Dy
> # CONFIG_BONDING is not set
> # CONFIG_DUMMY is not set
> # CONFIG_WIREGUARD is not set
> # CONFIG_EQUALIZER is not set
> # CONFIG_NET_FC is not set
> # CONFIG_NET_TEAM is not set
> # CONFIG_MACVLAN is not set
> # CONFIG_IPVLAN is not set
> # CONFIG_VXLAN is not set
> # CONFIG_GENEVE is not set
> # CONFIG_BAREUDP is not set
> # CONFIG_GTP is not set
> # CONFIG_MACSEC is not set
> # CONFIG_NETCONSOLE is not set
> # CONFIG_RIONET is not set
> # CONFIG_TUN is not set
> # CONFIG_TUN_VNET_CROSS_LE is not set
> # CONFIG_VETH is not set
> CONFIG_VIRTIO_NET=3Dm
> # CONFIG_NLMON is not set
> # CONFIG_ARCNET is not set
> CONFIG_ETHERNET=3Dy
> CONFIG_NET_VENDOR_3COM=3Dy
> # CONFIG_EL3 is not set
> # CONFIG_3C515 is not set
> # CONFIG_PCMCIA_3C574 is not set
> # CONFIG_PCMCIA_3C589 is not set
> # CONFIG_VORTEX is not set
> # CONFIG_TYPHOON is not set
> CONFIG_NET_VENDOR_ADAPTEC=3Dy
> # CONFIG_ADAPTEC_STARFIRE is not set
> CONFIG_NET_VENDOR_AGERE=3Dy
> # CONFIG_ET131X is not set
> CONFIG_NET_VENDOR_ALACRITECH=3Dy
> # CONFIG_SLICOSS is not set
> CONFIG_NET_VENDOR_ALTEON=3Dy
> # CONFIG_ACENIC is not set
> # CONFIG_ALTERA_TSE is not set
> CONFIG_NET_VENDOR_AMAZON=3Dy
> CONFIG_NET_VENDOR_AMD=3Dy
> # CONFIG_AMD8111_ETH is not set
> # CONFIG_LANCE is not set
> # CONFIG_PCNET32 is not set
> # CONFIG_PCMCIA_NMCLAN is not set
> # CONFIG_NI65 is not set
> # CONFIG_AMD_XGBE is not set
> CONFIG_NET_VENDOR_AQUANTIA=3Dy
> # CONFIG_AQTION is not set
> CONFIG_NET_VENDOR_ARC=3Dy
> CONFIG_NET_VENDOR_ASIX=3Dy
> # CONFIG_SPI_AX88796C is not set
> CONFIG_NET_VENDOR_ATHEROS=3Dy
> # CONFIG_ATL2 is not set
> # CONFIG_ATL1 is not set
> # CONFIG_ATL1E is not set
> # CONFIG_ATL1C is not set
> # CONFIG_ALX is not set
> CONFIG_NET_VENDOR_BROADCOM=3Dy
> # CONFIG_B44 is not set
> # CONFIG_BCMGENET is not set
> # CONFIG_BNX2 is not set
> # CONFIG_CNIC is not set
> # CONFIG_TIGON3 is not set
> # CONFIG_BNX2X is not set
> # CONFIG_SYSTEMPORT is not set
> # CONFIG_BNXT is not set
> CONFIG_NET_VENDOR_BROCADE=3Dy
> # CONFIG_BNA is not set
> CONFIG_NET_VENDOR_CADENCE=3Dy
> # CONFIG_MACB is not set
> CONFIG_NET_VENDOR_CAVIUM=3Dy
> CONFIG_NET_VENDOR_CHELSIO=3Dy
> # CONFIG_CHELSIO_T1 is not set
> # CONFIG_CHELSIO_T3 is not set
> # CONFIG_CHELSIO_T4 is not set
> # CONFIG_CHELSIO_T4VF is not set
> CONFIG_NET_VENDOR_CIRRUS=3Dy
> # CONFIG_CS89x0_ISA is not set
> CONFIG_NET_VENDOR_CISCO=3Dy
> # CONFIG_ENIC is not set
> CONFIG_NET_VENDOR_CORTINA=3Dy
> # CONFIG_GEMINI_ETHERNET is not set
> # CONFIG_CX_ECAT is not set
> # CONFIG_DNET is not set
> CONFIG_NET_VENDOR_DEC=3Dy
> # CONFIG_NET_TULIP is not set
> CONFIG_NET_VENDOR_DLINK=3Dy
> # CONFIG_DL2K is not set
> # CONFIG_SUNDANCE is not set
> CONFIG_NET_VENDOR_EMULEX=3Dy
> # CONFIG_BE2NET is not set
> CONFIG_NET_VENDOR_ENGLEDER=3Dy
> # CONFIG_TSNEP is not set
> CONFIG_NET_VENDOR_EZCHIP=3Dy
> # CONFIG_EZCHIP_NPS_MANAGEMENT_ENET is not set
> CONFIG_NET_VENDOR_FUJITSU=3Dy
> # CONFIG_PCMCIA_FMVJ18X is not set
> CONFIG_NET_VENDOR_GOOGLE=3Dy
> CONFIG_NET_VENDOR_HUAWEI=3Dy
> CONFIG_NET_VENDOR_I825XX=3Dy
> CONFIG_NET_VENDOR_INTEL=3Dy
> # CONFIG_E100 is not set
> CONFIG_E1000=3Dy
> # CONFIG_E1000E is not set
> # CONFIG_IGB is not set
> # CONFIG_IGBVF is not set
> # CONFIG_IXGB is not set
> # CONFIG_IXGBE is not set
> # CONFIG_I40E is not set
> # CONFIG_IGC is not set
> CONFIG_NET_VENDOR_MICROSOFT=3Dy
> # CONFIG_JME is not set
> CONFIG_NET_VENDOR_LITEX=3Dy
> # CONFIG_LITEX_LITEETH is not set
> CONFIG_NET_VENDOR_MARVELL=3Dy
> # CONFIG_MVMDIO is not set
> # CONFIG_SKGE is not set
> # CONFIG_SKY2 is not set
> CONFIG_NET_VENDOR_MELLANOX=3Dy
> # CONFIG_MLX4_EN is not set
> # CONFIG_MLX5_CORE is not set
> # CONFIG_MLXSW_CORE is not set
> # CONFIG_MLXFW is not set
> CONFIG_NET_VENDOR_MICREL=3Dy
> # CONFIG_KS8842 is not set
> # CONFIG_KS8851 is not set
> # CONFIG_KS8851_MLL is not set
> # CONFIG_KSZ884X_PCI is not set
> CONFIG_NET_VENDOR_MICROCHIP=3Dy
> # CONFIG_ENC28J60 is not set
> # CONFIG_ENCX24J600 is not set
> # CONFIG_LAN743X is not set
> CONFIG_NET_VENDOR_MICROSEMI=3Dy
> CONFIG_NET_VENDOR_MYRI=3Dy
> # CONFIG_MYRI10GE is not set
> # CONFIG_FEALNX is not set
> CONFIG_NET_VENDOR_NATSEMI=3Dy
> # CONFIG_NATSEMI is not set
> # CONFIG_NS83820 is not set
> CONFIG_NET_VENDOR_NETERION=3Dy
> # CONFIG_S2IO is not set
> # CONFIG_VXGE is not set
> CONFIG_NET_VENDOR_NETRONOME=3Dy
> CONFIG_NET_VENDOR_NI=3Dy
> # CONFIG_NI_XGE_MANAGEMENT_ENET is not set
> CONFIG_NET_VENDOR_8390=3Dy
> # CONFIG_PCMCIA_AXNET is not set
> # CONFIG_NE2000 is not set
> # CONFIG_NE2K_PCI is not set
> # CONFIG_PCMCIA_PCNET is not set
> # CONFIG_ULTRA is not set
> # CONFIG_WD80x3 is not set
> CONFIG_NET_VENDOR_NVIDIA=3Dy
> # CONFIG_FORCEDETH is not set
> CONFIG_NET_VENDOR_OKI=3Dy
> # CONFIG_ETHOC is not set
> CONFIG_NET_VENDOR_PACKET_ENGINES=3Dy
> # CONFIG_HAMACHI is not set
> # CONFIG_YELLOWFIN is not set
> CONFIG_NET_VENDOR_PENSANDO=3Dy
> CONFIG_NET_VENDOR_QLOGIC=3Dy
> # CONFIG_QLA3XXX is not set
> # CONFIG_QLCNIC is not set
> # CONFIG_NETXEN_NIC is not set
> # CONFIG_QED is not set
> CONFIG_NET_VENDOR_QUALCOMM=3Dy
> # CONFIG_QCA7000_SPI is not set
> # CONFIG_QCOM_EMAC is not set
> # CONFIG_RMNET is not set
> CONFIG_NET_VENDOR_RDC=3Dy
> # CONFIG_R6040 is not set
> CONFIG_NET_VENDOR_REALTEK=3Dy
> # CONFIG_ATP is not set
> # CONFIG_8139CP is not set
> # CONFIG_8139TOO is not set
> # CONFIG_R8169 is not set
> CONFIG_NET_VENDOR_RENESAS=3Dy
> CONFIG_NET_VENDOR_ROCKER=3Dy
> CONFIG_NET_VENDOR_SAMSUNG=3Dy
> # CONFIG_SXGBE_ETH is not set
> CONFIG_NET_VENDOR_SEEQ=3Dy
> CONFIG_NET_VENDOR_SOLARFLARE=3Dy
> # CONFIG_SFC is not set
> # CONFIG_SFC_FALCON is not set
> CONFIG_NET_VENDOR_SILAN=3Dy
> # CONFIG_SC92031 is not set
> CONFIG_NET_VENDOR_SIS=3Dy
> # CONFIG_SIS900 is not set
> # CONFIG_SIS190 is not set
> CONFIG_NET_VENDOR_SMSC=3Dy
> # CONFIG_SMC9194 is not set
> # CONFIG_PCMCIA_SMC91C92 is not set
> # CONFIG_EPIC100 is not set
> # CONFIG_SMSC911X is not set
> # CONFIG_SMSC9420 is not set
> CONFIG_NET_VENDOR_SOCIONEXT=3Dy
> CONFIG_NET_VENDOR_STMICRO=3Dy
> # CONFIG_STMMAC_ETH is not set
> CONFIG_NET_VENDOR_SUN=3Dy
> # CONFIG_HAPPYMEAL is not set
> # CONFIG_SUNGEM is not set
> # CONFIG_CASSINI is not set
> # CONFIG_NIU is not set
> CONFIG_NET_VENDOR_SYNOPSYS=3Dy
> # CONFIG_DWC_XLGMAC is not set
> CONFIG_NET_VENDOR_TEHUTI=3Dy
> # CONFIG_TEHUTI is not set
> CONFIG_NET_VENDOR_TI=3Dy
> # CONFIG_TI_CPSW_PHY_SEL is not set
> # CONFIG_TLAN is not set
> CONFIG_NET_VENDOR_VERTEXCOM=3Dy
> # CONFIG_MSE102X is not set
> CONFIG_NET_VENDOR_VIA=3Dy
> # CONFIG_VIA_RHINE is not set
> # CONFIG_VIA_VELOCITY is not set
> CONFIG_NET_VENDOR_WIZNET=3Dy
> # CONFIG_WIZNET_W5100 is not set
> # CONFIG_WIZNET_W5300 is not set
> CONFIG_NET_VENDOR_XILINX=3Dy
> # CONFIG_XILINX_EMACLITE is not set
> # CONFIG_XILINX_AXI_EMAC is not set
> # CONFIG_XILINX_LL_TEMAC is not set
> CONFIG_NET_VENDOR_XIRCOM=3Dy
> # CONFIG_PCMCIA_XIRC2PS is not set
> # CONFIG_FDDI is not set
> # CONFIG_HIPPI is not set
> # CONFIG_NET_SB1000 is not set
> # CONFIG_PHYLIB is not set
> # CONFIG_MICREL_KS8995MA is not set
> # CONFIG_MDIO_DEVICE is not set
> =

> #
> # PCS device drivers
> #
> # end of PCS device drivers
> =

> # CONFIG_PLIP is not set
> # CONFIG_PPP is not set
> # CONFIG_SLIP is not set
> =

> #
> # Host-side USB support is needed for USB Network Adapter support
> #
> CONFIG_WLAN=3Dy
> CONFIG_WLAN_VENDOR_ADMTEK=3Dy
> CONFIG_WLAN_VENDOR_ATH=3Dy
> # CONFIG_ATH_DEBUG is not set
> # CONFIG_ATH5K_PCI is not set
> CONFIG_WLAN_VENDOR_ATMEL=3Dy
> CONFIG_WLAN_VENDOR_BROADCOM=3Dy
> CONFIG_WLAN_VENDOR_CISCO=3Dy
> CONFIG_WLAN_VENDOR_INTEL=3Dy
> # CONFIG_IWLMEI is not set
> CONFIG_WLAN_VENDOR_INTERSIL=3Dy
> # CONFIG_HOSTAP is not set
> CONFIG_WLAN_VENDOR_MARVELL=3Dy
> CONFIG_WLAN_VENDOR_MEDIATEK=3Dy
> CONFIG_WLAN_VENDOR_MICROCHIP=3Dy
> CONFIG_WLAN_VENDOR_RALINK=3Dy
> CONFIG_WLAN_VENDOR_REALTEK=3Dy
> CONFIG_WLAN_VENDOR_RSI=3Dy
> CONFIG_WLAN_VENDOR_ST=3Dy
> CONFIG_WLAN_VENDOR_TI=3Dy
> CONFIG_WLAN_VENDOR_ZYDAS=3Dy
> CONFIG_WLAN_VENDOR_QUANTENNA=3Dy
> # CONFIG_PCMCIA_RAYCS is not set
> # CONFIG_WAN is not set
> =

> #
> # Wireless WAN
> #
> # CONFIG_WWAN is not set
> # end of Wireless WAN
> =

> # CONFIG_VMXNET3 is not set
> # CONFIG_FUJITSU_ES is not set
> # CONFIG_USB4_NET is not set
> # CONFIG_NETDEVSIM is not set
> CONFIG_NET_FAILOVER=3Dm
> # CONFIG_ISDN is not set
> =

> #
> # Input device support
> #
> CONFIG_INPUT=3Dy
> CONFIG_INPUT_LEDS=3Dy
> # CONFIG_INPUT_FF_MEMLESS is not set
> # CONFIG_INPUT_SPARSEKMAP is not set
> # CONFIG_INPUT_MATRIXKMAP is not set
> =

> #
> # Userland interfaces
> #
> # CONFIG_INPUT_MOUSEDEV is not set
> # CONFIG_INPUT_JOYDEV is not set
> # CONFIG_INPUT_EVDEV is not set
> # CONFIG_INPUT_EVBUG is not set
> =

> #
> # Input Device Drivers
> #
> CONFIG_INPUT_KEYBOARD=3Dy
> # CONFIG_KEYBOARD_ADC is not set
> # CONFIG_KEYBOARD_ADP5520 is not set
> # CONFIG_KEYBOARD_ADP5588 is not set
> # CONFIG_KEYBOARD_ADP5589 is not set
> CONFIG_KEYBOARD_ATKBD=3Dy
> # CONFIG_KEYBOARD_QT1050 is not set
> # CONFIG_KEYBOARD_QT1070 is not set
> # CONFIG_KEYBOARD_QT2160 is not set
> # CONFIG_KEYBOARD_DLINK_DIR685 is not set
> # CONFIG_KEYBOARD_LKKBD is not set
> # CONFIG_KEYBOARD_GPIO is not set
> # CONFIG_KEYBOARD_GPIO_POLLED is not set
> # CONFIG_KEYBOARD_TCA6416 is not set
> # CONFIG_KEYBOARD_TCA8418 is not set
> # CONFIG_KEYBOARD_MATRIX is not set
> # CONFIG_KEYBOARD_LM8323 is not set
> # CONFIG_KEYBOARD_LM8333 is not set
> # CONFIG_KEYBOARD_MAX7359 is not set
> # CONFIG_KEYBOARD_MCS is not set
> # CONFIG_KEYBOARD_MPR121 is not set
> # CONFIG_KEYBOARD_NEWTON is not set
> # CONFIG_KEYBOARD_OPENCORES is not set
> # CONFIG_KEYBOARD_SAMSUNG is not set
> # CONFIG_KEYBOARD_STOWAWAY is not set
> # CONFIG_KEYBOARD_SUNKBD is not set
> # CONFIG_KEYBOARD_STMPE is not set
> # CONFIG_KEYBOARD_IQS62X is not set
> # CONFIG_KEYBOARD_OMAP4 is not set
> # CONFIG_KEYBOARD_TC3589X is not set
> # CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
> # CONFIG_KEYBOARD_XTKBD is not set
> # CONFIG_KEYBOARD_CAP11XX is not set
> # CONFIG_KEYBOARD_BCM is not set
> # CONFIG_KEYBOARD_MTK_PMIC is not set
> # CONFIG_KEYBOARD_CYPRESS_SF is not set
> CONFIG_INPUT_MOUSE=3Dy
> CONFIG_MOUSE_PS2=3Dy
> CONFIG_MOUSE_PS2_ALPS=3Dy
> CONFIG_MOUSE_PS2_BYD=3Dy
> CONFIG_MOUSE_PS2_LOGIPS2PP=3Dy
> CONFIG_MOUSE_PS2_SYNAPTICS=3Dy
> CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=3Dy
> CONFIG_MOUSE_PS2_CYPRESS=3Dy
> CONFIG_MOUSE_PS2_TRACKPOINT=3Dy
> # CONFIG_MOUSE_PS2_ELANTECH is not set
> # CONFIG_MOUSE_PS2_SENTELIC is not set
> # CONFIG_MOUSE_PS2_TOUCHKIT is not set
> CONFIG_MOUSE_PS2_FOCALTECH=3Dy
> # CONFIG_MOUSE_PS2_VMMOUSE is not set
> CONFIG_MOUSE_PS2_SMBUS=3Dy
> # CONFIG_MOUSE_SERIAL is not set
> # CONFIG_MOUSE_APPLETOUCH is not set
> # CONFIG_MOUSE_BCM5974 is not set
> # CONFIG_MOUSE_CYAPA is not set
> # CONFIG_MOUSE_ELAN_I2C is not set
> # CONFIG_MOUSE_INPORT is not set
> # CONFIG_MOUSE_LOGIBM is not set
> # CONFIG_MOUSE_PC110PAD is not set
> # CONFIG_MOUSE_VSXXXAA is not set
> # CONFIG_MOUSE_GPIO is not set
> # CONFIG_MOUSE_SYNAPTICS_I2C is not set
> # CONFIG_MOUSE_SYNAPTICS_USB is not set
> # CONFIG_INPUT_JOYSTICK is not set
> # CONFIG_INPUT_TABLET is not set
> # CONFIG_INPUT_TOUCHSCREEN is not set
> # CONFIG_INPUT_MISC is not set
> # CONFIG_RMI4_CORE is not set
> =

> #
> # Hardware I/O ports
> #
> CONFIG_SERIO=3Dy
> CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=3Dy
> CONFIG_SERIO_I8042=3Dy
> CONFIG_SERIO_SERPORT=3Dy
> CONFIG_SERIO_CT82C710=3Dy
> CONFIG_SERIO_PARKBD=3Dy
> CONFIG_SERIO_PCIPS2=3Dy
> CONFIG_SERIO_LIBPS2=3Dy
> CONFIG_SERIO_RAW=3Dy
> CONFIG_SERIO_ALTERA_PS2=3Dy
> CONFIG_SERIO_PS2MULT=3Dy
> CONFIG_SERIO_ARC_PS2=3Dy
> # CONFIG_SERIO_APBPS2 is not set
> CONFIG_SERIO_GPIO_PS2=3Dy
> # CONFIG_USERIO is not set
> # CONFIG_GAMEPORT is not set
> # end of Hardware I/O ports
> # end of Input device support
> =

> #
> # Character devices
> #
> CONFIG_TTY=3Dy
> # CONFIG_VT is not set
> CONFIG_UNIX98_PTYS=3Dy
> CONFIG_LEGACY_PTYS=3Dy
> CONFIG_LEGACY_PTY_COUNT=3D256
> CONFIG_LDISC_AUTOLOAD=3Dy
> =

> #
> # Serial drivers
> #
> CONFIG_SERIAL_EARLYCON=3Dy
> CONFIG_SERIAL_8250=3Dy
> CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=3Dy
> CONFIG_SERIAL_8250_PNP=3Dy
> # CONFIG_SERIAL_8250_16550A_VARIANTS is not set
> # CONFIG_SERIAL_8250_FINTEK is not set
> CONFIG_SERIAL_8250_CONSOLE=3Dy
> CONFIG_SERIAL_8250_DMA=3Dy
> CONFIG_SERIAL_8250_PCI=3Dy
> CONFIG_SERIAL_8250_EXAR=3Dy
> # CONFIG_SERIAL_8250_CS is not set
> CONFIG_SERIAL_8250_NR_UARTS=3D4
> CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> # CONFIG_SERIAL_8250_EXTENDED is not set
> # CONFIG_SERIAL_8250_ASPEED_VUART is not set
> CONFIG_SERIAL_8250_DWLIB=3Dy
> # CONFIG_SERIAL_8250_DW is not set
> # CONFIG_SERIAL_8250_RT288X is not set
> CONFIG_SERIAL_8250_LPSS=3Dy
> CONFIG_SERIAL_8250_MID=3Dy
> CONFIG_SERIAL_8250_PERICOM=3Dy
> # CONFIG_SERIAL_OF_PLATFORM is not set
> =

> #
> # Non-8250 serial port support
> #
> # CONFIG_SERIAL_MAX3100 is not set
> # CONFIG_SERIAL_MAX310X is not set
> # CONFIG_SERIAL_UARTLITE is not set
> CONFIG_SERIAL_CORE=3Dy
> CONFIG_SERIAL_CORE_CONSOLE=3Dy
> # CONFIG_SERIAL_JSM is not set
> # CONFIG_SERIAL_SIFIVE is not set
> # CONFIG_SERIAL_LANTIQ is not set
> # CONFIG_SERIAL_SCCNXP is not set
> # CONFIG_SERIAL_SC16IS7XX is not set
> # CONFIG_SERIAL_TIMBERDALE is not set
> # CONFIG_SERIAL_BCM63XX is not set
> # CONFIG_SERIAL_ALTERA_JTAGUART is not set
> # CONFIG_SERIAL_ALTERA_UART is not set
> # CONFIG_SERIAL_PCH_UART is not set
> # CONFIG_SERIAL_XILINX_PS_UART is not set
> # CONFIG_SERIAL_ARC is not set
> # CONFIG_SERIAL_RP2 is not set
> # CONFIG_SERIAL_FSL_LPUART is not set
> # CONFIG_SERIAL_FSL_LINFLEXUART is not set
> # CONFIG_SERIAL_CONEXANT_DIGICOLOR is not set
> # CONFIG_SERIAL_SPRD is not set
> # CONFIG_SERIAL_LITEUART is not set
> # end of Serial drivers
> =

> CONFIG_SERIAL_MCTRL_GPIO=3Dy
> # CONFIG_SERIAL_NONSTANDARD is not set
> # CONFIG_N_GSM is not set
> # CONFIG_NOZOMI is not set
> # CONFIG_NULL_TTY is not set
> # CONFIG_RPMSG_TTY is not set
> # CONFIG_SERIAL_DEV_BUS is not set
> # CONFIG_TTY_PRINTK is not set
> CONFIG_PRINTER=3Dy
> # CONFIG_LP_CONSOLE is not set
> CONFIG_PPDEV=3Dy
> # CONFIG_VIRTIO_CONSOLE is not set
> CONFIG_IPMI_HANDLER=3Dy
> CONFIG_IPMI_PLAT_DATA=3Dy
> # CONFIG_IPMI_PANIC_EVENT is not set
> CONFIG_IPMI_DEVICE_INTERFACE=3Dy
> CONFIG_IPMI_SI=3Dy
> CONFIG_IPMI_SSIF=3Dy
> CONFIG_IPMI_WATCHDOG=3Dy
> # CONFIG_IPMI_POWEROFF is not set
> # CONFIG_HW_RANDOM is not set
> CONFIG_DTLK=3Dy
> CONFIG_APPLICOM=3Dy
> # CONFIG_SONYPI is not set
> =

> #
> # PCMCIA character devices
> #
> # CONFIG_SYNCLINK_CS is not set
> CONFIG_CARDMAN_4000=3Dy
> CONFIG_CARDMAN_4040=3Dy
> # CONFIG_SCR24X is not set
> # CONFIG_IPWIRELESS is not set
> # end of PCMCIA character devices
> =

> # CONFIG_MWAVE is not set
> # CONFIG_SCx200_GPIO is not set
> CONFIG_PC8736x_GPIO=3Dy
> CONFIG_NSC_GPIO=3Dy
> # CONFIG_DEVMEM is not set
> CONFIG_NVRAM=3Dy
> # CONFIG_DEVPORT is not set
> # CONFIG_HPET is not set
> # CONFIG_HANGCHECK_TIMER is not set
> CONFIG_TCG_TPM=3Dy
> CONFIG_TCG_TIS_CORE=3Dy
> CONFIG_TCG_TIS=3Dy
> CONFIG_TCG_TIS_SPI=3Dy
> # CONFIG_TCG_TIS_SPI_CR50 is not set
> CONFIG_TCG_TIS_I2C_CR50=3Dy
> # CONFIG_TCG_TIS_I2C_ATMEL is not set
> CONFIG_TCG_TIS_I2C_INFINEON=3Dy
> CONFIG_TCG_TIS_I2C_NUVOTON=3Dy
> CONFIG_TCG_NSC=3Dy
> CONFIG_TCG_ATMEL=3Dy
> # CONFIG_TCG_INFINEON is not set
> # CONFIG_TCG_CRB is not set
> # CONFIG_TCG_VTPM_PROXY is not set
> CONFIG_TCG_TIS_ST33ZP24=3Dy
> # CONFIG_TCG_TIS_ST33ZP24_I2C is not set
> CONFIG_TCG_TIS_ST33ZP24_SPI=3Dy
> CONFIG_TELCLOCK=3Dy
> # CONFIG_XILLYBUS is not set
> CONFIG_RANDOM_TRUST_CPU=3Dy
> CONFIG_RANDOM_TRUST_BOOTLOADER=3Dy
> # end of Character devices
> =

> #
> # I2C support
> #
> CONFIG_I2C=3Dy
> CONFIG_ACPI_I2C_OPREGION=3Dy
> CONFIG_I2C_BOARDINFO=3Dy
> # CONFIG_I2C_COMPAT is not set
> # CONFIG_I2C_CHARDEV is not set
> CONFIG_I2C_MUX=3Dy
> =

> #
> # Multiplexer I2C Chip support
> #
> CONFIG_I2C_ARB_GPIO_CHALLENGE=3Dy
> # CONFIG_I2C_MUX_GPIO is not set
> CONFIG_I2C_MUX_GPMUX=3Dy
> CONFIG_I2C_MUX_LTC4306=3Dy
> # CONFIG_I2C_MUX_PCA9541 is not set
> CONFIG_I2C_MUX_PCA954x=3Dy
> CONFIG_I2C_MUX_REG=3Dy
> # CONFIG_I2C_MUX_MLXCPLD is not set
> # end of Multiplexer I2C Chip support
> =

> # CONFIG_I2C_HELPER_AUTO is not set
> CONFIG_I2C_SMBUS=3Dy
> =

> #
> # I2C Algorithms
> #
> CONFIG_I2C_ALGOBIT=3Dy
> CONFIG_I2C_ALGOPCF=3Dy
> CONFIG_I2C_ALGOPCA=3Dy
> # end of I2C Algorithms
> =

> #
> # I2C Hardware Bus support
> #
> =

> #
> # PC SMBus host controller drivers
> #
> CONFIG_I2C_ALI1535=3Dy
> # CONFIG_I2C_ALI1563 is not set
> # CONFIG_I2C_ALI15X3 is not set
> # CONFIG_I2C_AMD756 is not set
> CONFIG_I2C_AMD8111=3Dy
> # CONFIG_I2C_AMD_MP2 is not set
> CONFIG_I2C_I801=3Dy
> CONFIG_I2C_ISCH=3Dy
> # CONFIG_I2C_ISMT is not set
> CONFIG_I2C_PIIX4=3Dy
> CONFIG_I2C_NFORCE2=3Dy
> CONFIG_I2C_NFORCE2_S4985=3Dy
> CONFIG_I2C_NVIDIA_GPU=3Dy
> CONFIG_I2C_SIS5595=3Dy
> # CONFIG_I2C_SIS630 is not set
> CONFIG_I2C_SIS96X=3Dy
> CONFIG_I2C_VIA=3Dy
> CONFIG_I2C_VIAPRO=3Dy
> =

> #
> # ACPI drivers
> #
> # CONFIG_I2C_SCMI is not set
> =

> #
> # I2C system bus drivers (mostly embedded / system-on-chip)
> #
> # CONFIG_I2C_CBUS_GPIO is not set
> CONFIG_I2C_DESIGNWARE_CORE=3Dy
> # CONFIG_I2C_DESIGNWARE_SLAVE is not set
> # CONFIG_I2C_DESIGNWARE_PLATFORM is not set
> CONFIG_I2C_DESIGNWARE_PCI=3Dy
> # CONFIG_I2C_EG20T is not set
> # CONFIG_I2C_EMEV2 is not set
> CONFIG_I2C_GPIO=3Dy
> # CONFIG_I2C_GPIO_FAULT_INJECTOR is not set
> # CONFIG_I2C_KEMPLD is not set
> # CONFIG_I2C_OCORES is not set
> CONFIG_I2C_PCA_PLATFORM=3Dy
> CONFIG_I2C_PXA=3Dy
> CONFIG_I2C_PXA_PCI=3Dy
> CONFIG_I2C_RK3X=3Dy
> # CONFIG_I2C_SIMTEC is not set
> # CONFIG_I2C_XILINX is not set
> =

> #
> # External I2C/SMBus adapter drivers
> #
> # CONFIG_I2C_PARPORT is not set
> # CONFIG_I2C_TAOS_EVM is not set
> =

> #
> # Other I2C/SMBus bus drivers
> #
> # CONFIG_I2C_PCA_ISA is not set
> CONFIG_SCx200_ACB=3Dy
> # CONFIG_I2C_VIRTIO is not set
> # end of I2C Hardware Bus support
> =

> # CONFIG_I2C_STUB is not set
> # CONFIG_I2C_SLAVE is not set
> # CONFIG_I2C_DEBUG_CORE is not set
> # CONFIG_I2C_DEBUG_ALGO is not set
> # CONFIG_I2C_DEBUG_BUS is not set
> # end of I2C support
> =

> CONFIG_I3C=3Dy
> CONFIG_CDNS_I3C_MASTER=3Dy
> CONFIG_DW_I3C_MASTER=3Dy
> CONFIG_SVC_I3C_MASTER=3Dy
> CONFIG_MIPI_I3C_HCI=3Dy
> CONFIG_SPI=3Dy
> # CONFIG_SPI_DEBUG is not set
> CONFIG_SPI_MASTER=3Dy
> CONFIG_SPI_MEM=3Dy
> =

> #
> # SPI Master Controller Drivers
> #
> # CONFIG_SPI_ALTERA is not set
> CONFIG_SPI_AXI_SPI_ENGINE=3Dy
> CONFIG_SPI_BITBANG=3Dy
> CONFIG_SPI_BUTTERFLY=3Dy
> # CONFIG_SPI_CADENCE is not set
> CONFIG_SPI_CADENCE_QUADSPI=3Dy
> # CONFIG_SPI_CADENCE_XSPI is not set
> CONFIG_SPI_DESIGNWARE=3Dy
> # CONFIG_SPI_DW_DMA is not set
> CONFIG_SPI_DW_PCI=3Dy
> CONFIG_SPI_DW_MMIO=3Dy
> # CONFIG_SPI_NXP_FLEXSPI is not set
> # CONFIG_SPI_GPIO is not set
> CONFIG_SPI_LM70_LLP=3Dy
> # CONFIG_SPI_FSL_SPI is not set
> # CONFIG_SPI_LANTIQ_SSC is not set
> CONFIG_SPI_OC_TINY=3Dy
> # CONFIG_SPI_PXA2XX is not set
> # CONFIG_SPI_ROCKCHIP is not set
> CONFIG_SPI_SC18IS602=3Dy
> # CONFIG_SPI_SIFIVE is not set
> # CONFIG_SPI_MXIC is not set
> CONFIG_SPI_TOPCLIFF_PCH=3Dy
> # CONFIG_SPI_XCOMM is not set
> CONFIG_SPI_XILINX=3Dy
> CONFIG_SPI_ZYNQMP_GQSPI=3Dy
> # CONFIG_SPI_AMD is not set
> =

> #
> # SPI Multiplexer support
> #
> CONFIG_SPI_MUX=3Dy
> =

> #
> # SPI Protocol Masters
> #
> CONFIG_SPI_SPIDEV=3Dy
> # CONFIG_SPI_LOOPBACK_TEST is not set
> CONFIG_SPI_TLE62X0=3Dy
> # CONFIG_SPI_SLAVE is not set
> CONFIG_SPI_DYNAMIC=3Dy
> CONFIG_SPMI=3Dy
> CONFIG_SPMI_HISI3670=3Dy
> CONFIG_HSI=3Dy
> CONFIG_HSI_BOARDINFO=3Dy
> =

> #
> # HSI controllers
> #
> =

> #
> # HSI clients
> #
> CONFIG_HSI_CHAR=3Dy
> # CONFIG_PPS is not set
> =

> #
> # PTP clock support
> #
> CONFIG_PTP_1588_CLOCK_OPTIONAL=3Dy
> =

> #
> # Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
> #
> # end of PTP clock support
> =

> # CONFIG_PINCTRL is not set
> CONFIG_GPIOLIB=3Dy
> CONFIG_GPIOLIB_FASTPATH_LIMIT=3D512
> CONFIG_OF_GPIO=3Dy
> CONFIG_GPIO_ACPI=3Dy
> CONFIG_GPIOLIB_IRQCHIP=3Dy
> CONFIG_DEBUG_GPIO=3Dy
> # CONFIG_GPIO_SYSFS is not set
> CONFIG_GPIO_CDEV=3Dy
> CONFIG_GPIO_CDEV_V1=3Dy
> CONFIG_GPIO_GENERIC=3Dy
> CONFIG_GPIO_MAX730X=3Dy
> =

> #
> # Memory mapped GPIO drivers
> #
> CONFIG_GPIO_74XX_MMIO=3Dy
> CONFIG_GPIO_ALTERA=3Dy
> # CONFIG_GPIO_AMDPT is not set
> # CONFIG_GPIO_CADENCE is not set
> CONFIG_GPIO_DWAPB=3Dy
> # CONFIG_GPIO_EXAR is not set
> # CONFIG_GPIO_FTGPIO010 is not set
> CONFIG_GPIO_GENERIC_PLATFORM=3Dy
> # CONFIG_GPIO_GRGPIO is not set
> # CONFIG_GPIO_HLWD is not set
> # CONFIG_GPIO_ICH is not set
> # CONFIG_GPIO_LOGICVC is not set
> CONFIG_GPIO_MB86S7X=3Dy
> CONFIG_GPIO_SAMA5D2_PIOBU=3Dy
> # CONFIG_GPIO_SIFIVE is not set
> CONFIG_GPIO_SIOX=3Dy
> CONFIG_GPIO_SYSCON=3Dy
> CONFIG_GPIO_VX855=3Dy
> # CONFIG_GPIO_XILINX is not set
> CONFIG_GPIO_AMD_FCH=3Dy
> # end of Memory mapped GPIO drivers
> =

> #
> # Port-mapped I/O GPIO drivers
> #
> CONFIG_GPIO_104_DIO_48E=3Dy
> CONFIG_GPIO_104_IDIO_16=3Dy
> CONFIG_GPIO_104_IDI_48=3Dy
> CONFIG_GPIO_F7188X=3Dy
> CONFIG_GPIO_GPIO_MM=3Dy
> # CONFIG_GPIO_IT87 is not set
> # CONFIG_GPIO_SCH is not set
> CONFIG_GPIO_SCH311X=3Dy
> CONFIG_GPIO_WINBOND=3Dy
> CONFIG_GPIO_WS16C48=3Dy
> # end of Port-mapped I/O GPIO drivers
> =

> #
> # I2C GPIO expanders
> #
> # CONFIG_GPIO_ADP5588 is not set
> CONFIG_GPIO_ADNP=3Dy
> CONFIG_GPIO_GW_PLD=3Dy
> CONFIG_GPIO_MAX7300=3Dy
> # CONFIG_GPIO_MAX732X is not set
> CONFIG_GPIO_PCA953X=3Dy
> # CONFIG_GPIO_PCA953X_IRQ is not set
> CONFIG_GPIO_PCA9570=3Dy
> CONFIG_GPIO_PCF857X=3Dy
> CONFIG_GPIO_TPIC2810=3Dy
> # end of I2C GPIO expanders
> =

> #
> # MFD GPIO expanders
> #
> CONFIG_GPIO_ADP5520=3Dy
> # CONFIG_GPIO_ARIZONA is not set
> CONFIG_GPIO_BD71815=3Dy
> CONFIG_GPIO_BD71828=3Dy
> # CONFIG_GPIO_CS5535 is not set
> # CONFIG_GPIO_DA9052 is not set
> CONFIG_GPIO_JANZ_TTL=3Dy
> # CONFIG_GPIO_KEMPLD is not set
> CONFIG_GPIO_LP3943=3Dy
> # CONFIG_GPIO_MAX77620 is not set
> # CONFIG_GPIO_RC5T583 is not set
> CONFIG_GPIO_STMPE=3Dy
> CONFIG_GPIO_TC3589X=3Dy
> CONFIG_GPIO_TIMBERDALE=3Dy
> CONFIG_GPIO_TPS65086=3Dy
> CONFIG_GPIO_TPS65218=3Dy
> # CONFIG_GPIO_TPS6586X is not set
> # CONFIG_GPIO_TPS65910 is not set
> CONFIG_GPIO_TPS65912=3Dy
> CONFIG_GPIO_TQMX86=3Dy
> CONFIG_GPIO_TWL6040=3Dy
> CONFIG_GPIO_WM831X=3Dy
> # CONFIG_GPIO_WM8350 is not set
> CONFIG_GPIO_WM8994=3Dy
> # end of MFD GPIO expanders
> =

> #
> # PCI GPIO expanders
> #
> CONFIG_GPIO_AMD8111=3Dy
> # CONFIG_GPIO_BT8XX is not set
> # CONFIG_GPIO_ML_IOH is not set
> CONFIG_GPIO_PCH=3Dy
> # CONFIG_GPIO_PCI_IDIO_16 is not set
> CONFIG_GPIO_PCIE_IDIO_24=3Dy
> # CONFIG_GPIO_RDC321X is not set
> CONFIG_GPIO_SODAVILLE=3Dy
> # end of PCI GPIO expanders
> =

> #
> # SPI GPIO expanders
> #
> CONFIG_GPIO_74X164=3Dy
> # CONFIG_GPIO_MAX3191X is not set
> # CONFIG_GPIO_MAX7301 is not set
> # CONFIG_GPIO_MC33880 is not set
> CONFIG_GPIO_PISOSR=3Dy
> # CONFIG_GPIO_XRA1403 is not set
> # end of SPI GPIO expanders
> =

> #
> # Virtual GPIO drivers
> #
> CONFIG_GPIO_AGGREGATOR=3Dy
> CONFIG_GPIO_MOCKUP=3Dy
> CONFIG_GPIO_VIRTIO=3Dy
> # CONFIG_GPIO_SIM is not set
> # end of Virtual GPIO drivers
> =

> CONFIG_W1=3Dy
> =

> #
> # 1-wire Bus Masters
> #
> CONFIG_W1_MASTER_MATROX=3Dy
> CONFIG_W1_MASTER_DS2482=3Dy
> CONFIG_W1_MASTER_DS1WM=3Dy
> CONFIG_W1_MASTER_GPIO=3Dy
> CONFIG_W1_MASTER_SGI=3Dy
> # end of 1-wire Bus Masters
> =

> #
> # 1-wire Slaves
> #
> CONFIG_W1_SLAVE_THERM=3Dy
> # CONFIG_W1_SLAVE_SMEM is not set
> CONFIG_W1_SLAVE_DS2405=3Dy
> CONFIG_W1_SLAVE_DS2408=3Dy
> CONFIG_W1_SLAVE_DS2408_READBACK=3Dy
> CONFIG_W1_SLAVE_DS2413=3Dy
> # CONFIG_W1_SLAVE_DS2406 is not set
> CONFIG_W1_SLAVE_DS2423=3Dy
> CONFIG_W1_SLAVE_DS2805=3Dy
> # CONFIG_W1_SLAVE_DS2430 is not set
> # CONFIG_W1_SLAVE_DS2431 is not set
> CONFIG_W1_SLAVE_DS2433=3Dy
> # CONFIG_W1_SLAVE_DS2433_CRC is not set
> CONFIG_W1_SLAVE_DS2438=3Dy
> CONFIG_W1_SLAVE_DS250X=3Dy
> # CONFIG_W1_SLAVE_DS2780 is not set
> CONFIG_W1_SLAVE_DS2781=3Dy
> CONFIG_W1_SLAVE_DS28E04=3Dy
> CONFIG_W1_SLAVE_DS28E17=3Dy
> # end of 1-wire Slaves
> =

> CONFIG_POWER_RESET=3Dy
> CONFIG_POWER_RESET_ATC260X=3Dy
> CONFIG_POWER_RESET_GPIO=3Dy
> # CONFIG_POWER_RESET_GPIO_RESTART is not set
> # CONFIG_POWER_RESET_LTC2952 is not set
> CONFIG_POWER_RESET_MT6323=3Dy
> # CONFIG_POWER_RESET_REGULATOR is not set
> # CONFIG_POWER_RESET_RESTART is not set
> CONFIG_POWER_RESET_TPS65086=3Dy
> CONFIG_POWER_RESET_SYSCON=3Dy
> # CONFIG_POWER_RESET_SYSCON_POWEROFF is not set
> CONFIG_REBOOT_MODE=3Dy
> CONFIG_SYSCON_REBOOT_MODE=3Dy
> CONFIG_NVMEM_REBOOT_MODE=3Dy
> CONFIG_POWER_SUPPLY=3Dy
> # CONFIG_POWER_SUPPLY_DEBUG is not set
> CONFIG_POWER_SUPPLY_HWMON=3Dy
> # CONFIG_PDA_POWER is not set
> # CONFIG_GENERIC_ADC_BATTERY is not set
> # CONFIG_WM831X_BACKUP is not set
> # CONFIG_WM831X_POWER is not set
> # CONFIG_WM8350_POWER is not set
> # CONFIG_TEST_POWER is not set
> # CONFIG_CHARGER_ADP5061 is not set
> # CONFIG_BATTERY_ACT8945A is not set
> # CONFIG_BATTERY_CW2015 is not set
> # CONFIG_BATTERY_DS2760 is not set
> # CONFIG_BATTERY_DS2780 is not set
> # CONFIG_BATTERY_DS2781 is not set
> # CONFIG_BATTERY_DS2782 is not set
> # CONFIG_BATTERY_SBS is not set
> # CONFIG_CHARGER_SBS is not set
> # CONFIG_MANAGER_SBS is not set
> # CONFIG_BATTERY_BQ27XXX is not set
> # CONFIG_BATTERY_DA9030 is not set
> # CONFIG_BATTERY_DA9052 is not set
> # CONFIG_CHARGER_DA9150 is not set
> # CONFIG_BATTERY_DA9150 is not set
> # CONFIG_AXP20X_POWER is not set
> # CONFIG_AXP288_FUEL_GAUGE is not set
> # CONFIG_BATTERY_MAX17040 is not set
> # CONFIG_BATTERY_MAX17042 is not set
> # CONFIG_BATTERY_MAX1721X is not set
> # CONFIG_CHARGER_PCF50633 is not set
> # CONFIG_CHARGER_MAX8903 is not set
> # CONFIG_CHARGER_LP8727 is not set
> # CONFIG_CHARGER_GPIO is not set
> # CONFIG_CHARGER_MANAGER is not set
> # CONFIG_CHARGER_LT3651 is not set
> # CONFIG_CHARGER_LTC4162L is not set
> # CONFIG_CHARGER_MAX14577 is not set
> # CONFIG_CHARGER_DETECTOR_MAX14656 is not set
> # CONFIG_CHARGER_MAX77693 is not set
> # CONFIG_CHARGER_MAX77976 is not set
> # CONFIG_CHARGER_MT6360 is not set
> # CONFIG_CHARGER_BQ2415X is not set
> # CONFIG_CHARGER_BQ24190 is not set
> # CONFIG_CHARGER_BQ24257 is not set
> # CONFIG_CHARGER_BQ24735 is not set
> # CONFIG_CHARGER_BQ2515X is not set
> # CONFIG_CHARGER_BQ25890 is not set
> # CONFIG_CHARGER_BQ25980 is not set
> # CONFIG_CHARGER_BQ256XX is not set
> # CONFIG_CHARGER_SMB347 is not set
> # CONFIG_CHARGER_TPS65217 is not set
> # CONFIG_BATTERY_GAUGE_LTC2941 is not set
> # CONFIG_BATTERY_GOLDFISH is not set
> # CONFIG_BATTERY_RT5033 is not set
> # CONFIG_CHARGER_RT9455 is not set
> # CONFIG_CHARGER_UCS1002 is not set
> # CONFIG_CHARGER_BD99954 is not set
> CONFIG_HWMON=3Dy
> CONFIG_HWMON_VID=3Dy
> CONFIG_HWMON_DEBUG_CHIP=3Dy
> =

> #
> # Native drivers
> #
> # CONFIG_SENSORS_AD7314 is not set
> CONFIG_SENSORS_AD7414=3Dy
> # CONFIG_SENSORS_AD7418 is not set
> CONFIG_SENSORS_ADM1021=3Dy
> CONFIG_SENSORS_ADM1025=3Dy
> CONFIG_SENSORS_ADM1026=3Dy
> # CONFIG_SENSORS_ADM1029 is not set
> CONFIG_SENSORS_ADM1031=3Dy
> CONFIG_SENSORS_ADM1177=3Dy
> CONFIG_SENSORS_ADM9240=3Dy
> CONFIG_SENSORS_ADT7X10=3Dy
> CONFIG_SENSORS_ADT7310=3Dy
> # CONFIG_SENSORS_ADT7410 is not set
> CONFIG_SENSORS_ADT7411=3Dy
> CONFIG_SENSORS_ADT7462=3Dy
> # CONFIG_SENSORS_ADT7470 is not set
> CONFIG_SENSORS_ADT7475=3Dy
> # CONFIG_SENSORS_AHT10 is not set
> # CONFIG_SENSORS_AS370 is not set
> CONFIG_SENSORS_ASC7621=3Dy
> CONFIG_SENSORS_AXI_FAN_CONTROL=3Dy
> # CONFIG_SENSORS_K8TEMP is not set
> CONFIG_SENSORS_K10TEMP=3Dy
> # CONFIG_SENSORS_FAM15H_POWER is not set
> # CONFIG_SENSORS_APPLESMC is not set
> CONFIG_SENSORS_ASB100=3Dy
> # CONFIG_SENSORS_ASPEED is not set
> CONFIG_SENSORS_ATXP1=3Dy
> # CONFIG_SENSORS_CORSAIR_CPRO is not set
> # CONFIG_SENSORS_CORSAIR_PSU is not set
> CONFIG_SENSORS_DRIVETEMP=3Dy
> CONFIG_SENSORS_DS620=3Dy
> CONFIG_SENSORS_DS1621=3Dy
> # CONFIG_SENSORS_DELL_SMM is not set
> CONFIG_SENSORS_DA9052_ADC=3Dy
> CONFIG_SENSORS_I5K_AMB=3Dy
> # CONFIG_SENSORS_F71805F is not set
> CONFIG_SENSORS_F71882FG=3Dy
> CONFIG_SENSORS_F75375S=3Dy
> CONFIG_SENSORS_GSC=3Dy
> CONFIG_SENSORS_MC13783_ADC=3Dy
> # CONFIG_SENSORS_FSCHMD is not set
> CONFIG_SENSORS_GL518SM=3Dy
> # CONFIG_SENSORS_GL520SM is not set
> CONFIG_SENSORS_G760A=3Dy
> CONFIG_SENSORS_G762=3Dy
> CONFIG_SENSORS_GPIO_FAN=3Dy
> # CONFIG_SENSORS_HIH6130 is not set
> CONFIG_SENSORS_IBMAEM=3Dy
> CONFIG_SENSORS_IBMPEX=3Dy
> CONFIG_SENSORS_IIO_HWMON=3Dy
> # CONFIG_SENSORS_I5500 is not set
> CONFIG_SENSORS_CORETEMP=3Dy
> # CONFIG_SENSORS_IT87 is not set
> CONFIG_SENSORS_JC42=3Dy
> # CONFIG_SENSORS_POWR1220 is not set
> # CONFIG_SENSORS_LINEAGE is not set
> CONFIG_SENSORS_LTC2945=3Dy
> CONFIG_SENSORS_LTC2947=3Dy
> CONFIG_SENSORS_LTC2947_I2C=3Dy
> # CONFIG_SENSORS_LTC2947_SPI is not set
> CONFIG_SENSORS_LTC2990=3Dy
> CONFIG_SENSORS_LTC2992=3Dy
> # CONFIG_SENSORS_LTC4151 is not set
> CONFIG_SENSORS_LTC4215=3Dy
> CONFIG_SENSORS_LTC4222=3Dy
> # CONFIG_SENSORS_LTC4245 is not set
> CONFIG_SENSORS_LTC4260=3Dy
> CONFIG_SENSORS_LTC4261=3Dy
> # CONFIG_SENSORS_MAX1111 is not set
> CONFIG_SENSORS_MAX127=3Dy
> # CONFIG_SENSORS_MAX16065 is not set
> CONFIG_SENSORS_MAX1619=3Dy
> CONFIG_SENSORS_MAX1668=3Dy
> # CONFIG_SENSORS_MAX197 is not set
> # CONFIG_SENSORS_MAX31722 is not set
> CONFIG_SENSORS_MAX31730=3Dy
> CONFIG_SENSORS_MAX6620=3Dy
> CONFIG_SENSORS_MAX6621=3Dy
> # CONFIG_SENSORS_MAX6639 is not set
> CONFIG_SENSORS_MAX6642=3Dy
> CONFIG_SENSORS_MAX6650=3Dy
> CONFIG_SENSORS_MAX6697=3Dy
> # CONFIG_SENSORS_MAX31790 is not set
> CONFIG_SENSORS_MCP3021=3Dy
> CONFIG_SENSORS_TC654=3Dy
> # CONFIG_SENSORS_TPS23861 is not set
> CONFIG_SENSORS_MR75203=3Dy
> # CONFIG_SENSORS_ADCXX is not set
> CONFIG_SENSORS_LM63=3Dy
> CONFIG_SENSORS_LM70=3Dy
> CONFIG_SENSORS_LM73=3Dy
> # CONFIG_SENSORS_LM75 is not set
> # CONFIG_SENSORS_LM77 is not set
> CONFIG_SENSORS_LM78=3Dy
> # CONFIG_SENSORS_LM80 is not set
> CONFIG_SENSORS_LM83=3Dy
> CONFIG_SENSORS_LM85=3Dy
> # CONFIG_SENSORS_LM87 is not set
> # CONFIG_SENSORS_LM90 is not set
> # CONFIG_SENSORS_LM92 is not set
> # CONFIG_SENSORS_LM93 is not set
> CONFIG_SENSORS_LM95234=3Dy
> CONFIG_SENSORS_LM95241=3Dy
> # CONFIG_SENSORS_LM95245 is not set
> CONFIG_SENSORS_PC87360=3Dy
> CONFIG_SENSORS_PC87427=3Dy
> # CONFIG_SENSORS_NTC_THERMISTOR is not set
> CONFIG_SENSORS_NCT6683=3Dy
> # CONFIG_SENSORS_NCT6775 is not set
> CONFIG_SENSORS_NCT7802=3Dy
> CONFIG_SENSORS_NPCM7XX=3Dy
> # CONFIG_SENSORS_PCF8591 is not set
> CONFIG_PMBUS=3Dy
> CONFIG_SENSORS_PMBUS=3Dy
> CONFIG_SENSORS_ADM1266=3Dy
> # CONFIG_SENSORS_ADM1275 is not set
> # CONFIG_SENSORS_BEL_PFE is not set
> CONFIG_SENSORS_BPA_RS600=3Dy
> # CONFIG_SENSORS_DELTA_AHE50DC_FAN is not set
> CONFIG_SENSORS_FSP_3Y=3Dy
> CONFIG_SENSORS_IBM_CFFPS=3Dy
> # CONFIG_SENSORS_DPS920AB is not set
> CONFIG_SENSORS_INSPUR_IPSPS=3Dy
> CONFIG_SENSORS_IR35221=3Dy
> # CONFIG_SENSORS_IR36021 is not set
> CONFIG_SENSORS_IR38064=3Dy
> # CONFIG_SENSORS_IR38064_REGULATOR is not set
> CONFIG_SENSORS_IRPS5401=3Dy
> CONFIG_SENSORS_ISL68137=3Dy
> CONFIG_SENSORS_LM25066=3Dy
> CONFIG_SENSORS_LTC2978=3Dy
> # CONFIG_SENSORS_LTC2978_REGULATOR is not set
> CONFIG_SENSORS_LTC3815=3Dy
> CONFIG_SENSORS_MAX15301=3Dy
> CONFIG_SENSORS_MAX16064=3Dy
> CONFIG_SENSORS_MAX16601=3Dy
> # CONFIG_SENSORS_MAX20730 is not set
> # CONFIG_SENSORS_MAX20751 is not set
> # CONFIG_SENSORS_MAX31785 is not set
> CONFIG_SENSORS_MAX34440=3Dy
> CONFIG_SENSORS_MAX8688=3Dy
> CONFIG_SENSORS_MP2888=3Dy
> CONFIG_SENSORS_MP2975=3Dy
> # CONFIG_SENSORS_MP5023 is not set
> CONFIG_SENSORS_PIM4328=3Dy
> CONFIG_SENSORS_PM6764TR=3Dy
> # CONFIG_SENSORS_PXE1610 is not set
> # CONFIG_SENSORS_Q54SJ108A2 is not set
> CONFIG_SENSORS_STPDDC60=3Dy
> # CONFIG_SENSORS_TPS40422 is not set
> CONFIG_SENSORS_TPS53679=3Dy
> CONFIG_SENSORS_UCD9000=3Dy
> CONFIG_SENSORS_UCD9200=3Dy
> # CONFIG_SENSORS_XDPE122 is not set
> CONFIG_SENSORS_ZL6100=3Dy
> CONFIG_SENSORS_SBTSI=3Dy
> CONFIG_SENSORS_SBRMI=3Dy
> CONFIG_SENSORS_SHT15=3Dy
> # CONFIG_SENSORS_SHT21 is not set
> CONFIG_SENSORS_SHT3x=3Dy
> CONFIG_SENSORS_SHT4x=3Dy
> # CONFIG_SENSORS_SHTC1 is not set
> # CONFIG_SENSORS_SIS5595 is not set
> # CONFIG_SENSORS_DME1737 is not set
> # CONFIG_SENSORS_EMC1403 is not set
> CONFIG_SENSORS_EMC2103=3Dy
> # CONFIG_SENSORS_EMC6W201 is not set
> CONFIG_SENSORS_SMSC47M1=3Dy
> # CONFIG_SENSORS_SMSC47M192 is not set
> # CONFIG_SENSORS_SMSC47B397 is not set
> CONFIG_SENSORS_STTS751=3Dy
> CONFIG_SENSORS_SMM665=3Dy
> # CONFIG_SENSORS_ADC128D818 is not set
> CONFIG_SENSORS_ADS7828=3Dy
> CONFIG_SENSORS_ADS7871=3Dy
> # CONFIG_SENSORS_AMC6821 is not set
> CONFIG_SENSORS_INA209=3Dy
> CONFIG_SENSORS_INA2XX=3Dy
> # CONFIG_SENSORS_INA238 is not set
> # CONFIG_SENSORS_INA3221 is not set
> CONFIG_SENSORS_TC74=3Dy
> # CONFIG_SENSORS_THMC50 is not set
> # CONFIG_SENSORS_TMP102 is not set
> # CONFIG_SENSORS_TMP103 is not set
> # CONFIG_SENSORS_TMP108 is not set
> CONFIG_SENSORS_TMP401=3Dy
> CONFIG_SENSORS_TMP421=3Dy
> CONFIG_SENSORS_TMP513=3Dy
> # CONFIG_SENSORS_VIA_CPUTEMP is not set
> # CONFIG_SENSORS_VIA686A is not set
> CONFIG_SENSORS_VT1211=3Dy
> # CONFIG_SENSORS_VT8231 is not set
> CONFIG_SENSORS_W83773G=3Dy
> # CONFIG_SENSORS_W83781D is not set
> CONFIG_SENSORS_W83791D=3Dy
> CONFIG_SENSORS_W83792D=3Dy
> CONFIG_SENSORS_W83793=3Dy
> CONFIG_SENSORS_W83795=3Dy
> # CONFIG_SENSORS_W83795_FANCTRL is not set
> # CONFIG_SENSORS_W83L785TS is not set
> CONFIG_SENSORS_W83L786NG=3Dy
> CONFIG_SENSORS_W83627HF=3Dy
> CONFIG_SENSORS_W83627EHF=3Dy
> # CONFIG_SENSORS_WM831X is not set
> CONFIG_SENSORS_WM8350=3Dy
> CONFIG_SENSORS_INTEL_M10_BMC_HWMON=3Dy
> =

> #
> # ACPI drivers
> #
> # CONFIG_SENSORS_ACPI_POWER is not set
> # CONFIG_SENSORS_ATK0110 is not set
> CONFIG_THERMAL=3Dy
> # CONFIG_THERMAL_NETLINK is not set
> # CONFIG_THERMAL_STATISTICS is not set
> CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=3D0
> CONFIG_THERMAL_HWMON=3Dy
> # CONFIG_THERMAL_OF is not set
> # CONFIG_THERMAL_WRITABLE_TRIPS is not set
> CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=3Dy
> # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
> # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
> # CONFIG_THERMAL_GOV_FAIR_SHARE is not set
> CONFIG_THERMAL_GOV_STEP_WISE=3Dy
> CONFIG_THERMAL_GOV_BANG_BANG=3Dy
> # CONFIG_THERMAL_GOV_USER_SPACE is not set
> CONFIG_DEVFREQ_THERMAL=3Dy
> CONFIG_THERMAL_EMULATION=3Dy
> CONFIG_THERMAL_MMIO=3Dy
> CONFIG_MAX77620_THERMAL=3Dy
> =

> #
> # Intel thermal drivers
> #
> # CONFIG_INTEL_POWERCLAMP is not set
> CONFIG_X86_THERMAL_VECTOR=3Dy
> # CONFIG_X86_PKG_TEMP_THERMAL is not set
> # CONFIG_INTEL_SOC_DTS_THERMAL is not set
> =

> #
> # ACPI INT340X thermal drivers
> #
> # end of ACPI INT340X thermal drivers
> =

> CONFIG_INTEL_PCH_THERMAL=3Dy
> CONFIG_INTEL_TCC_COOLING=3Dy
> # CONFIG_INTEL_MENLOW is not set
> # end of Intel thermal drivers
> =

> CONFIG_GENERIC_ADC_THERMAL=3Dy
> # CONFIG_WATCHDOG is not set
> CONFIG_SSB_POSSIBLE=3Dy
> # CONFIG_SSB is not set
> CONFIG_BCMA_POSSIBLE=3Dy
> CONFIG_BCMA=3Dy
> CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
> CONFIG_BCMA_HOST_PCI=3Dy
> CONFIG_BCMA_HOST_SOC=3Dy
> CONFIG_BCMA_DRIVER_PCI=3Dy
> # CONFIG_BCMA_SFLASH is not set
> # CONFIG_BCMA_DRIVER_GMAC_CMN is not set
> # CONFIG_BCMA_DRIVER_GPIO is not set
> # CONFIG_BCMA_DEBUG is not set
> =

> #
> # Multifunction device drivers
> #
> CONFIG_MFD_CORE=3Dy
> CONFIG_MFD_CS5535=3Dy
> CONFIG_MFD_ACT8945A=3Dy
> CONFIG_MFD_AS3711=3Dy
> # CONFIG_MFD_AS3722 is not set
> CONFIG_PMIC_ADP5520=3Dy
> # CONFIG_MFD_AAT2870_CORE is not set
> CONFIG_MFD_ATMEL_FLEXCOM=3Dy
> CONFIG_MFD_ATMEL_HLCDC=3Dy
> CONFIG_MFD_BCM590XX=3Dy
> # CONFIG_MFD_BD9571MWV is not set
> CONFIG_MFD_AXP20X=3Dy
> CONFIG_MFD_AXP20X_I2C=3Dy
> # CONFIG_MFD_MADERA is not set
> CONFIG_PMIC_DA903X=3Dy
> CONFIG_PMIC_DA9052=3Dy
> CONFIG_MFD_DA9052_SPI=3Dy
> CONFIG_MFD_DA9052_I2C=3Dy
> # CONFIG_MFD_DA9055 is not set
> # CONFIG_MFD_DA9062 is not set
> CONFIG_MFD_DA9063=3Dy
> CONFIG_MFD_DA9150=3Dy
> CONFIG_MFD_GATEWORKS_GSC=3Dy
> CONFIG_MFD_MC13XXX=3Dy
> CONFIG_MFD_MC13XXX_SPI=3Dy
> CONFIG_MFD_MC13XXX_I2C=3Dy
> # CONFIG_MFD_MP2629 is not set
> CONFIG_MFD_HI6421_PMIC=3Dy
> CONFIG_MFD_HI6421_SPMI=3Dy
> CONFIG_HTC_PASIC3=3Dy
> # CONFIG_HTC_I2CPLD is not set
> CONFIG_MFD_INTEL_QUARK_I2C_GPIO=3Dy
> CONFIG_LPC_ICH=3Dy
> CONFIG_LPC_SCH=3Dy
> CONFIG_MFD_INTEL_LPSS=3Dy
> # CONFIG_MFD_INTEL_LPSS_ACPI is not set
> CONFIG_MFD_INTEL_LPSS_PCI=3Dy
> # CONFIG_MFD_INTEL_PMC_BXT is not set
> CONFIG_MFD_IQS62X=3Dy
> CONFIG_MFD_JANZ_CMODIO=3Dy
> CONFIG_MFD_KEMPLD=3Dy
> CONFIG_MFD_88PM800=3Dy
> CONFIG_MFD_88PM805=3Dy
> # CONFIG_MFD_88PM860X is not set
> CONFIG_MFD_MAX14577=3Dy
> CONFIG_MFD_MAX77620=3Dy
> # CONFIG_MFD_MAX77650 is not set
> CONFIG_MFD_MAX77686=3Dy
> CONFIG_MFD_MAX77693=3Dy
> # CONFIG_MFD_MAX77843 is not set
> CONFIG_MFD_MAX8907=3Dy
> # CONFIG_MFD_MAX8925 is not set
> # CONFIG_MFD_MAX8997 is not set
> CONFIG_MFD_MAX8998=3Dy
> CONFIG_MFD_MT6360=3Dy
> CONFIG_MFD_MT6397=3Dy
> # CONFIG_MFD_MENF21BMC is not set
> # CONFIG_EZX_PCAP is not set
> # CONFIG_MFD_CPCAP is not set
> CONFIG_MFD_NTXEC=3Dy
> CONFIG_MFD_RETU=3Dy
> CONFIG_MFD_PCF50633=3Dy
> CONFIG_PCF50633_ADC=3Dy
> # CONFIG_PCF50633_GPIO is not set
> # CONFIG_MFD_RDC321X is not set
> # CONFIG_MFD_RT4831 is not set
> # CONFIG_MFD_RT5033 is not set
> CONFIG_MFD_RC5T583=3Dy
> CONFIG_MFD_RK808=3Dy
> # CONFIG_MFD_RN5T618 is not set
> # CONFIG_MFD_SEC_CORE is not set
> CONFIG_MFD_SI476X_CORE=3Dy
> CONFIG_MFD_SM501=3Dy
> # CONFIG_MFD_SM501_GPIO is not set
> # CONFIG_MFD_SKY81452 is not set
> CONFIG_MFD_STMPE=3Dy
> =

> #
> # STMicroelectronics STMPE Interface Drivers
> #
> CONFIG_STMPE_I2C=3Dy
> CONFIG_STMPE_SPI=3Dy
> # end of STMicroelectronics STMPE Interface Drivers
> =

> CONFIG_MFD_SYSCON=3Dy
> CONFIG_MFD_TI_AM335X_TSCADC=3Dy
> CONFIG_MFD_LP3943=3Dy
> # CONFIG_MFD_LP8788 is not set
> CONFIG_MFD_TI_LMU=3Dy
> # CONFIG_MFD_PALMAS is not set
> CONFIG_TPS6105X=3Dy
> # CONFIG_TPS65010 is not set
> CONFIG_TPS6507X=3Dy
> CONFIG_MFD_TPS65086=3Dy
> # CONFIG_MFD_TPS65090 is not set
> CONFIG_MFD_TPS65217=3Dy
> # CONFIG_MFD_TI_LP873X is not set
> # CONFIG_MFD_TI_LP87565 is not set
> CONFIG_MFD_TPS65218=3Dy
> CONFIG_MFD_TPS6586X=3Dy
> CONFIG_MFD_TPS65910=3Dy
> CONFIG_MFD_TPS65912=3Dy
> CONFIG_MFD_TPS65912_I2C=3Dy
> # CONFIG_MFD_TPS65912_SPI is not set
> # CONFIG_TWL4030_CORE is not set
> CONFIG_TWL6040_CORE=3Dy
> CONFIG_MFD_WL1273_CORE=3Dy
> # CONFIG_MFD_LM3533 is not set
> CONFIG_MFD_TIMBERDALE=3Dy
> CONFIG_MFD_TC3589X=3Dy
> CONFIG_MFD_TQMX86=3Dy
> CONFIG_MFD_VX855=3Dy
> # CONFIG_MFD_LOCHNAGAR is not set
> CONFIG_MFD_ARIZONA=3Dy
> CONFIG_MFD_ARIZONA_I2C=3Dy
> # CONFIG_MFD_ARIZONA_SPI is not set
> CONFIG_MFD_CS47L24=3Dy
> # CONFIG_MFD_WM5102 is not set
> # CONFIG_MFD_WM5110 is not set
> # CONFIG_MFD_WM8997 is not set
> CONFIG_MFD_WM8998=3Dy
> # CONFIG_MFD_WM8400 is not set
> CONFIG_MFD_WM831X=3Dy
> # CONFIG_MFD_WM831X_I2C is not set
> CONFIG_MFD_WM831X_SPI=3Dy
> CONFIG_MFD_WM8350=3Dy
> CONFIG_MFD_WM8350_I2C=3Dy
> CONFIG_MFD_WM8994=3Dy
> CONFIG_MFD_ROHM_BD718XX=3Dy
> CONFIG_MFD_ROHM_BD71828=3Dy
> # CONFIG_MFD_ROHM_BD957XMUF is not set
> # CONFIG_MFD_STPMIC1 is not set
> CONFIG_MFD_STMFX=3Dy
> # CONFIG_MFD_WCD934X is not set
> CONFIG_MFD_ATC260X=3Dy
> CONFIG_MFD_ATC260X_I2C=3Dy
> CONFIG_MFD_QCOM_PM8008=3Dy
> CONFIG_MFD_INTEL_M10_BMC=3Dy
> CONFIG_MFD_RSMU_I2C=3Dy
> # CONFIG_MFD_RSMU_SPI is not set
> # end of Multifunction device drivers
> =

> CONFIG_REGULATOR=3Dy
> CONFIG_REGULATOR_DEBUG=3Dy
> CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
> CONFIG_REGULATOR_VIRTUAL_CONSUMER=3Dy
> # CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
> # CONFIG_REGULATOR_88PG86X is not set
> CONFIG_REGULATOR_88PM800=3Dy
> # CONFIG_REGULATOR_ACT8865 is not set
> CONFIG_REGULATOR_ACT8945A=3Dy
> CONFIG_REGULATOR_AD5398=3Dy
> CONFIG_REGULATOR_AS3711=3Dy
> CONFIG_REGULATOR_ATC260X=3Dy
> CONFIG_REGULATOR_AXP20X=3Dy
> CONFIG_REGULATOR_BCM590XX=3Dy
> # CONFIG_REGULATOR_BD71815 is not set
> CONFIG_REGULATOR_BD71828=3Dy
> CONFIG_REGULATOR_BD718XX=3Dy
> CONFIG_REGULATOR_DA903X=3Dy
> CONFIG_REGULATOR_DA9052=3Dy
> # CONFIG_REGULATOR_DA9063 is not set
> CONFIG_REGULATOR_DA9121=3Dy
> CONFIG_REGULATOR_DA9210=3Dy
> CONFIG_REGULATOR_DA9211=3Dy
> CONFIG_REGULATOR_FAN53555=3Dy
> CONFIG_REGULATOR_FAN53880=3Dy
> CONFIG_REGULATOR_GPIO=3Dy
> CONFIG_REGULATOR_HI6421=3Dy
> CONFIG_REGULATOR_HI6421V530=3Dy
> CONFIG_REGULATOR_HI6421V600=3Dy
> CONFIG_REGULATOR_ISL9305=3Dy
> # CONFIG_REGULATOR_ISL6271A is not set
> CONFIG_REGULATOR_LM363X=3Dy
> # CONFIG_REGULATOR_LP3971 is not set
> # CONFIG_REGULATOR_LP3972 is not set
> # CONFIG_REGULATOR_LP872X is not set
> CONFIG_REGULATOR_LP8755=3Dy
> # CONFIG_REGULATOR_LTC3589 is not set
> # CONFIG_REGULATOR_LTC3676 is not set
> CONFIG_REGULATOR_MAX14577=3Dy
> CONFIG_REGULATOR_MAX1586=3Dy
> CONFIG_REGULATOR_MAX77620=3Dy
> CONFIG_REGULATOR_MAX8649=3Dy
> # CONFIG_REGULATOR_MAX8660 is not set
> CONFIG_REGULATOR_MAX8893=3Dy
> # CONFIG_REGULATOR_MAX8907 is not set
> CONFIG_REGULATOR_MAX8952=3Dy
> # CONFIG_REGULATOR_MAX8998 is not set
> # CONFIG_REGULATOR_MAX20086 is not set
> # CONFIG_REGULATOR_MAX77686 is not set
> # CONFIG_REGULATOR_MAX77693 is not set
> # CONFIG_REGULATOR_MAX77802 is not set
> CONFIG_REGULATOR_MAX77826=3Dy
> CONFIG_REGULATOR_MC13XXX_CORE=3Dy
> # CONFIG_REGULATOR_MC13783 is not set
> CONFIG_REGULATOR_MC13892=3Dy
> CONFIG_REGULATOR_MCP16502=3Dy
> CONFIG_REGULATOR_MP5416=3Dy
> # CONFIG_REGULATOR_MP8859 is not set
> CONFIG_REGULATOR_MP886X=3Dy
> CONFIG_REGULATOR_MPQ7920=3Dy
> CONFIG_REGULATOR_MT6311=3Dy
> CONFIG_REGULATOR_MT6315=3Dy
> CONFIG_REGULATOR_MT6323=3Dy
> CONFIG_REGULATOR_MT6358=3Dy
> # CONFIG_REGULATOR_MT6359 is not set
> CONFIG_REGULATOR_MT6360=3Dy
> # CONFIG_REGULATOR_MT6397 is not set
> CONFIG_REGULATOR_PCA9450=3Dy
> # CONFIG_REGULATOR_PCF50633 is not set
> CONFIG_REGULATOR_PF8X00=3Dy
> CONFIG_REGULATOR_PFUZE100=3Dy
> CONFIG_REGULATOR_PV88060=3Dy
> CONFIG_REGULATOR_PV88080=3Dy
> CONFIG_REGULATOR_PV88090=3Dy
> CONFIG_REGULATOR_QCOM_SPMI=3Dy
> # CONFIG_REGULATOR_QCOM_USB_VBUS is not set
> CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY=3Dy
> # CONFIG_REGULATOR_RC5T583 is not set
> CONFIG_REGULATOR_RK808=3Dy
> CONFIG_REGULATOR_ROHM=3Dy
> # CONFIG_REGULATOR_RT4801 is not set
> CONFIG_REGULATOR_RT6160=3Dy
> CONFIG_REGULATOR_RT6245=3Dy
> # CONFIG_REGULATOR_RTQ2134 is not set
> # CONFIG_REGULATOR_RTMV20 is not set
> CONFIG_REGULATOR_RTQ6752=3Dy
> CONFIG_REGULATOR_SLG51000=3Dy
> CONFIG_REGULATOR_SY8106A=3Dy
> CONFIG_REGULATOR_SY8824X=3Dy
> CONFIG_REGULATOR_SY8827N=3Dy
> CONFIG_REGULATOR_TPS51632=3Dy
> CONFIG_REGULATOR_TPS6105X=3Dy
> CONFIG_REGULATOR_TPS62360=3Dy
> CONFIG_REGULATOR_TPS65023=3Dy
> # CONFIG_REGULATOR_TPS6507X is not set
> # CONFIG_REGULATOR_TPS65086 is not set
> CONFIG_REGULATOR_TPS65132=3Dy
> CONFIG_REGULATOR_TPS65217=3Dy
> # CONFIG_REGULATOR_TPS65218 is not set
> CONFIG_REGULATOR_TPS6524X=3Dy
> # CONFIG_REGULATOR_TPS6586X is not set
> CONFIG_REGULATOR_TPS65910=3Dy
> CONFIG_REGULATOR_TPS65912=3Dy
> # CONFIG_REGULATOR_VCTRL is not set
> CONFIG_REGULATOR_WM831X=3Dy
> # CONFIG_REGULATOR_WM8350 is not set
> # CONFIG_REGULATOR_WM8994 is not set
> # CONFIG_REGULATOR_QCOM_LABIBB is not set
> # CONFIG_RC_CORE is not set
> =

> #
> # CEC support
> #
> # CONFIG_MEDIA_CEC_SUPPORT is not set
> # end of CEC support
> =

> # CONFIG_MEDIA_SUPPORT is not set
> =

> #
> # Graphics support
> #
> # CONFIG_AGP is not set
> CONFIG_VGA_ARB=3Dy
> CONFIG_VGA_ARB_MAX_GPUS=3D16
> # CONFIG_VGA_SWITCHEROO is not set
> # CONFIG_DRM is not set
> CONFIG_DRM_DEBUG_MODESET_LOCK=3Dy
> =

> #
> # ARM devices
> #
> # end of ARM devices
> =

> #
> # Frame buffer Devices
> #
> # CONFIG_FB is not set
> # end of Frame buffer Devices
> =

> #
> # Backlight & LCD device support
> #
> CONFIG_LCD_CLASS_DEVICE=3Dy
> CONFIG_LCD_L4F00242T03=3Dy
> # CONFIG_LCD_LMS283GF05 is not set
> CONFIG_LCD_LTV350QV=3Dy
> # CONFIG_LCD_ILI922X is not set
> CONFIG_LCD_ILI9320=3Dy
> CONFIG_LCD_TDO24M=3Dy
> CONFIG_LCD_VGG2432A4=3Dy
> CONFIG_LCD_PLATFORM=3Dy
> CONFIG_LCD_AMS369FG06=3Dy
> # CONFIG_LCD_LMS501KF03 is not set
> CONFIG_LCD_HX8357=3Dy
> CONFIG_LCD_OTM3225A=3Dy
> CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
> CONFIG_BACKLIGHT_KTD253=3Dy
> # CONFIG_BACKLIGHT_DA903X is not set
> CONFIG_BACKLIGHT_DA9052=3Dy
> # CONFIG_BACKLIGHT_APPLE is not set
> CONFIG_BACKLIGHT_QCOM_WLED=3Dy
> CONFIG_BACKLIGHT_SAHARA=3Dy
> # CONFIG_BACKLIGHT_WM831X is not set
> CONFIG_BACKLIGHT_ADP5520=3Dy
> CONFIG_BACKLIGHT_ADP8860=3Dy
> CONFIG_BACKLIGHT_ADP8870=3Dy
> CONFIG_BACKLIGHT_PCF50633=3Dy
> # CONFIG_BACKLIGHT_LM3639 is not set
> # CONFIG_BACKLIGHT_TPS65217 is not set
> # CONFIG_BACKLIGHT_AS3711 is not set
> CONFIG_BACKLIGHT_GPIO=3Dy
> CONFIG_BACKLIGHT_LV5207LP=3Dy
> # CONFIG_BACKLIGHT_BD6107 is not set
> CONFIG_BACKLIGHT_ARCXCNN=3Dy
> CONFIG_BACKLIGHT_LED=3Dy
> # end of Backlight & LCD device support
> # end of Graphics support
> =

> # CONFIG_SOUND is not set
> =

> #
> # HID support
> #
> CONFIG_HID=3Dy
> # CONFIG_HID_BATTERY_STRENGTH is not set
> # CONFIG_HIDRAW is not set
> # CONFIG_UHID is not set
> CONFIG_HID_GENERIC=3Dy
> =

> #
> # Special HID drivers
> #
> # CONFIG_HID_A4TECH is not set
> # CONFIG_HID_ACRUX is not set
> # CONFIG_HID_APPLE is not set
> # CONFIG_HID_AUREAL is not set
> # CONFIG_HID_BELKIN is not set
> # CONFIG_HID_CHERRY is not set
> # CONFIG_HID_COUGAR is not set
> # CONFIG_HID_MACALLY is not set
> # CONFIG_HID_CMEDIA is not set
> # CONFIG_HID_CYPRESS is not set
> # CONFIG_HID_DRAGONRISE is not set
> # CONFIG_HID_EMS_FF is not set
> # CONFIG_HID_ELECOM is not set
> # CONFIG_HID_EZKEY is not set
> # CONFIG_HID_GEMBIRD is not set
> # CONFIG_HID_GFRM is not set
> # CONFIG_HID_GLORIOUS is not set
> # CONFIG_HID_VIVALDI is not set
> # CONFIG_HID_KEYTOUCH is not set
> # CONFIG_HID_KYE is not set
> # CONFIG_HID_WALTOP is not set
> # CONFIG_HID_VIEWSONIC is not set
> # CONFIG_HID_XIAOMI is not set
> # CONFIG_HID_GYRATION is not set
> # CONFIG_HID_ICADE is not set
> # CONFIG_HID_ITE is not set
> # CONFIG_HID_JABRA is not set
> # CONFIG_HID_TWINHAN is not set
> # CONFIG_HID_KENSINGTON is not set
> # CONFIG_HID_LCPOWER is not set
> # CONFIG_HID_LED is not set
> # CONFIG_HID_LENOVO is not set
> # CONFIG_HID_MAGICMOUSE is not set
> # CONFIG_HID_MALTRON is not set
> # CONFIG_HID_MAYFLASH is not set
> # CONFIG_HID_REDRAGON is not set
> # CONFIG_HID_MICROSOFT is not set
> # CONFIG_HID_MONTEREY is not set
> # CONFIG_HID_MULTITOUCH is not set
> # CONFIG_HID_NINTENDO is not set
> # CONFIG_HID_NTI is not set
> # CONFIG_HID_ORTEK is not set
> # CONFIG_HID_PANTHERLORD is not set
> # CONFIG_HID_PETALYNX is not set
> # CONFIG_HID_PICOLCD is not set
> # CONFIG_HID_PLANTRONICS is not set
> # CONFIG_HID_PLAYSTATION is not set
> # CONFIG_HID_PRIMAX is not set
> # CONFIG_HID_SAITEK is not set
> # CONFIG_HID_SEMITEK is not set
> # CONFIG_HID_SPEEDLINK is not set
> # CONFIG_HID_STEAM is not set
> # CONFIG_HID_STEELSERIES is not set
> # CONFIG_HID_SUNPLUS is not set
> # CONFIG_HID_RMI is not set
> # CONFIG_HID_GREENASIA is not set
> # CONFIG_HID_SMARTJOYPLUS is not set
> # CONFIG_HID_TIVO is not set
> # CONFIG_HID_TOPSEED is not set
> # CONFIG_HID_THINGM is not set
> # CONFIG_HID_UDRAW_PS3 is not set
> # CONFIG_HID_WIIMOTE is not set
> # CONFIG_HID_XINMO is not set
> # CONFIG_HID_ZEROPLUS is not set
> # CONFIG_HID_ZYDACRON is not set
> # CONFIG_HID_SENSOR_HUB is not set
> # CONFIG_HID_ALPS is not set
> # end of Special HID drivers
> =

> #
> # I2C HID support
> #
> # CONFIG_I2C_HID_ACPI is not set
> # CONFIG_I2C_HID_OF is not set
> # CONFIG_I2C_HID_OF_GOODIX is not set
> # end of I2C HID support
> # end of HID support
> =

> CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
> CONFIG_USB_SUPPORT=3Dy
> # CONFIG_USB_ULPI_BUS is not set
> # CONFIG_USB_CONN_GPIO is not set
> CONFIG_USB_ARCH_HAS_HCD=3Dy
> # CONFIG_USB is not set
> CONFIG_USB_PCI=3Dy
> =

> #
> # USB port drivers
> #
> =

> #
> # USB Physical Layer drivers
> #
> # CONFIG_NOP_USB_XCEIV is not set
> # CONFIG_USB_GPIO_VBUS is not set
> # CONFIG_TAHVO_USB is not set
> # end of USB Physical Layer drivers
> =

> # CONFIG_USB_GADGET is not set
> # CONFIG_TYPEC is not set
> # CONFIG_USB_ROLE_SWITCH is not set
> CONFIG_MMC=3Dy
> # CONFIG_PWRSEQ_EMMC is not set
> CONFIG_PWRSEQ_SIMPLE=3Dy
> CONFIG_MMC_BLOCK=3Dy
> CONFIG_MMC_BLOCK_MINORS=3D8
> # CONFIG_SDIO_UART is not set
> # CONFIG_MMC_TEST is not set
> # CONFIG_MMC_CRYPTO is not set
> =

> #
> # MMC/SD/SDIO Host Controller Drivers
> #
> # CONFIG_MMC_DEBUG is not set
> CONFIG_MMC_SDHCI=3Dy
> CONFIG_MMC_SDHCI_IO_ACCESSORS=3Dy
> CONFIG_MMC_SDHCI_PCI=3Dy
> CONFIG_MMC_RICOH_MMC=3Dy
> # CONFIG_MMC_SDHCI_ACPI is not set
> # CONFIG_MMC_SDHCI_PLTFM is not set
> CONFIG_MMC_WBSD=3Dy
> CONFIG_MMC_ALCOR=3Dy
> CONFIG_MMC_TIFM_SD=3Dy
> CONFIG_MMC_SPI=3Dy
> CONFIG_MMC_SDRICOH_CS=3Dy
> CONFIG_MMC_CB710=3Dy
> CONFIG_MMC_VIA_SDMMC=3Dy
> CONFIG_MMC_USDHI6ROL0=3Dy
> CONFIG_MMC_REALTEK_PCI=3Dy
> CONFIG_MMC_CQHCI=3Dy
> # CONFIG_MMC_HSQ is not set
> # CONFIG_MMC_TOSHIBA_PCI is not set
> CONFIG_MMC_MTK=3Dy
> CONFIG_MEMSTICK=3Dy
> CONFIG_MEMSTICK_DEBUG=3Dy
> =

> #
> # MemoryStick drivers
> #
> CONFIG_MEMSTICK_UNSAFE_RESUME=3Dy
> CONFIG_MSPRO_BLOCK=3Dy
> CONFIG_MS_BLOCK=3Dy
> =

> #
> # MemoryStick Host Controller Drivers
> #
> CONFIG_MEMSTICK_TIFM_MS=3Dy
> # CONFIG_MEMSTICK_JMICRON_38X is not set
> CONFIG_MEMSTICK_R592=3Dy
> CONFIG_MEMSTICK_REALTEK_PCI=3Dy
> CONFIG_NEW_LEDS=3Dy
> CONFIG_LEDS_CLASS=3Dy
> # CONFIG_LEDS_CLASS_FLASH is not set
> CONFIG_LEDS_CLASS_MULTICOLOR=3Dy
> CONFIG_LEDS_BRIGHTNESS_HW_CHANGED=3Dy
> =

> #
> # LED drivers
> #
> # CONFIG_LEDS_AN30259A is not set
> # CONFIG_LEDS_AW2013 is not set
> # CONFIG_LEDS_BCM6328 is not set
> # CONFIG_LEDS_BCM6358 is not set
> CONFIG_LEDS_CR0014114=3Dy
> CONFIG_LEDS_EL15203000=3Dy
> CONFIG_LEDS_LM3530=3Dy
> CONFIG_LEDS_LM3532=3Dy
> # CONFIG_LEDS_LM3642 is not set
> CONFIG_LEDS_LM3692X=3Dy
> CONFIG_LEDS_MT6323=3Dy
> # CONFIG_LEDS_PCA9532 is not set
> CONFIG_LEDS_GPIO=3Dy
> # CONFIG_LEDS_LP3944 is not set
> # CONFIG_LEDS_LP3952 is not set
> CONFIG_LEDS_LP50XX=3Dy
> CONFIG_LEDS_LP55XX_COMMON=3Dy
> CONFIG_LEDS_LP5521=3Dy
> # CONFIG_LEDS_LP5523 is not set
> # CONFIG_LEDS_LP5562 is not set
> CONFIG_LEDS_LP8501=3Dy
> CONFIG_LEDS_LP8860=3Dy
> # CONFIG_LEDS_PCA955X is not set
> CONFIG_LEDS_PCA963X=3Dy
> CONFIG_LEDS_WM831X_STATUS=3Dy
> CONFIG_LEDS_WM8350=3Dy
> CONFIG_LEDS_DA903X=3Dy
> CONFIG_LEDS_DA9052=3Dy
> CONFIG_LEDS_DAC124S085=3Dy
> # CONFIG_LEDS_REGULATOR is not set
> CONFIG_LEDS_BD2802=3Dy
> CONFIG_LEDS_LT3593=3Dy
> CONFIG_LEDS_ADP5520=3Dy
> CONFIG_LEDS_MC13783=3Dy
> # CONFIG_LEDS_TCA6507 is not set
> CONFIG_LEDS_TLC591XX=3Dy
> # CONFIG_LEDS_LM355x is not set
> # CONFIG_LEDS_OT200 is not set
> # CONFIG_LEDS_IS31FL319X is not set
> CONFIG_LEDS_IS31FL32XX=3Dy
> =

> #
> # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_T=
HINGM)
> #
> CONFIG_LEDS_BLINKM=3Dy
> CONFIG_LEDS_SYSCON=3Dy
> CONFIG_LEDS_MLXREG=3Dy
> # CONFIG_LEDS_USER is not set
> # CONFIG_LEDS_NIC78BX is not set
> CONFIG_LEDS_SPI_BYTE=3Dy
> CONFIG_LEDS_TI_LMU_COMMON=3Dy
> CONFIG_LEDS_LM3697=3Dy
> CONFIG_LEDS_LM36274=3Dy
> CONFIG_LEDS_TPS6105X=3Dy
> CONFIG_LEDS_LGM=3Dy
> =

> #
> # Flash and Torch LED drivers
> #
> =

> #
> # LED Triggers
> #
> # CONFIG_LEDS_TRIGGERS is not set
> =

> #
> # Simple LED drivers
> #
> CONFIG_ACCESSIBILITY=3Dy
> =

> #
> # Speakup console speech
> #
> # end of Speakup console speech
> =

> # CONFIG_INFINIBAND is not set
> CONFIG_EDAC_ATOMIC_SCRUB=3Dy
> CONFIG_EDAC_SUPPORT=3Dy
> # CONFIG_EDAC is not set
> CONFIG_RTC_LIB=3Dy
> CONFIG_RTC_MC146818_LIB=3Dy
> CONFIG_RTC_CLASS=3Dy
> CONFIG_RTC_HCTOSYS=3Dy
> CONFIG_RTC_HCTOSYS_DEVICE=3D"rtc0"
> CONFIG_RTC_SYSTOHC=3Dy
> CONFIG_RTC_SYSTOHC_DEVICE=3D"rtc0"
> # CONFIG_RTC_DEBUG is not set
> CONFIG_RTC_LIB_KUNIT_TEST=3Dy
> CONFIG_RTC_NVMEM=3Dy
> =

> #
> # RTC interfaces
> #
> # CONFIG_RTC_INTF_SYSFS is not set
> CONFIG_RTC_INTF_PROC=3Dy
> CONFIG_RTC_INTF_DEV=3Dy
> CONFIG_RTC_INTF_DEV_UIE_EMUL=3Dy
> CONFIG_RTC_DRV_TEST=3Dy
> =

> #
> # I2C RTC drivers
> #
> # CONFIG_RTC_DRV_88PM80X is not set
> # CONFIG_RTC_DRV_ABB5ZES3 is not set
> CONFIG_RTC_DRV_ABEOZ9=3Dy
> CONFIG_RTC_DRV_ABX80X=3Dy
> CONFIG_RTC_DRV_DS1307=3Dy
> # CONFIG_RTC_DRV_DS1307_CENTURY is not set
> CONFIG_RTC_DRV_DS1374=3Dy
> # CONFIG_RTC_DRV_DS1672 is not set
> # CONFIG_RTC_DRV_HYM8563 is not set
> CONFIG_RTC_DRV_MAX6900=3Dy
> # CONFIG_RTC_DRV_MAX8907 is not set
> CONFIG_RTC_DRV_MAX8998=3Dy
> # CONFIG_RTC_DRV_MAX77686 is not set
> CONFIG_RTC_DRV_RK808=3Dy
> # CONFIG_RTC_DRV_RS5C372 is not set
> CONFIG_RTC_DRV_ISL1208=3Dy
> CONFIG_RTC_DRV_ISL12022=3Dy
> CONFIG_RTC_DRV_ISL12026=3Dy
> CONFIG_RTC_DRV_X1205=3Dy
> CONFIG_RTC_DRV_PCF8523=3Dy
> CONFIG_RTC_DRV_PCF85063=3Dy
> # CONFIG_RTC_DRV_PCF85363 is not set
> # CONFIG_RTC_DRV_PCF8563 is not set
> CONFIG_RTC_DRV_PCF8583=3Dy
> CONFIG_RTC_DRV_M41T80=3Dy
> # CONFIG_RTC_DRV_M41T80_WDT is not set
> # CONFIG_RTC_DRV_BD70528 is not set
> CONFIG_RTC_DRV_BQ32K=3Dy
> CONFIG_RTC_DRV_TPS6586X=3Dy
> # CONFIG_RTC_DRV_TPS65910 is not set
> CONFIG_RTC_DRV_RC5T583=3Dy
> CONFIG_RTC_DRV_S35390A=3Dy
> # CONFIG_RTC_DRV_FM3130 is not set
> # CONFIG_RTC_DRV_RX8010 is not set
> CONFIG_RTC_DRV_RX8581=3Dy
> CONFIG_RTC_DRV_RX8025=3Dy
> # CONFIG_RTC_DRV_EM3027 is not set
> CONFIG_RTC_DRV_RV3028=3Dy
> CONFIG_RTC_DRV_RV3032=3Dy
> CONFIG_RTC_DRV_RV8803=3Dy
> # CONFIG_RTC_DRV_SD3078 is not set
> =

> #
> # SPI RTC drivers
> #
> CONFIG_RTC_DRV_M41T93=3Dy
> CONFIG_RTC_DRV_M41T94=3Dy
> CONFIG_RTC_DRV_DS1302=3Dy
> CONFIG_RTC_DRV_DS1305=3Dy
> CONFIG_RTC_DRV_DS1343=3Dy
> # CONFIG_RTC_DRV_DS1347 is not set
> CONFIG_RTC_DRV_DS1390=3Dy
> # CONFIG_RTC_DRV_MAX6916 is not set
> # CONFIG_RTC_DRV_R9701 is not set
> # CONFIG_RTC_DRV_RX4581 is not set
> # CONFIG_RTC_DRV_RS5C348 is not set
> CONFIG_RTC_DRV_MAX6902=3Dy
> # CONFIG_RTC_DRV_PCF2123 is not set
> # CONFIG_RTC_DRV_MCP795 is not set
> CONFIG_RTC_I2C_AND_SPI=3Dy
> =

> #
> # SPI and I2C RTC drivers
> #
> CONFIG_RTC_DRV_DS3232=3Dy
> CONFIG_RTC_DRV_DS3232_HWMON=3Dy
> CONFIG_RTC_DRV_PCF2127=3Dy
> # CONFIG_RTC_DRV_RV3029C2 is not set
> CONFIG_RTC_DRV_RX6110=3Dy
> =

> #
> # Platform RTC drivers
> #
> # CONFIG_RTC_DRV_CMOS is not set
> CONFIG_RTC_DRV_DS1286=3Dy
> # CONFIG_RTC_DRV_DS1511 is not set
> CONFIG_RTC_DRV_DS1553=3Dy
> CONFIG_RTC_DRV_DS1685_FAMILY=3Dy
> # CONFIG_RTC_DRV_DS1685 is not set
> # CONFIG_RTC_DRV_DS1689 is not set
> CONFIG_RTC_DRV_DS17285=3Dy
> # CONFIG_RTC_DRV_DS17485 is not set
> # CONFIG_RTC_DRV_DS17885 is not set
> CONFIG_RTC_DRV_DS1742=3Dy
> CONFIG_RTC_DRV_DS2404=3Dy
> CONFIG_RTC_DRV_DA9052=3Dy
> CONFIG_RTC_DRV_DA9063=3Dy
> CONFIG_RTC_DRV_STK17TA8=3Dy
> # CONFIG_RTC_DRV_M48T86 is not set
> CONFIG_RTC_DRV_M48T35=3Dy
> CONFIG_RTC_DRV_M48T59=3Dy
> CONFIG_RTC_DRV_MSM6242=3Dy
> # CONFIG_RTC_DRV_BQ4802 is not set
> # CONFIG_RTC_DRV_RP5C01 is not set
> CONFIG_RTC_DRV_V3020=3Dy
> # CONFIG_RTC_DRV_WM831X is not set
> CONFIG_RTC_DRV_WM8350=3Dy
> CONFIG_RTC_DRV_PCF50633=3Dy
> CONFIG_RTC_DRV_ZYNQMP=3Dy
> # CONFIG_RTC_DRV_NTXEC is not set
> =

> #
> # on-CPU RTC drivers
> #
> CONFIG_RTC_DRV_CADENCE=3Dy
> CONFIG_RTC_DRV_FTRTC010=3Dy
> CONFIG_RTC_DRV_MC13XXX=3Dy
> CONFIG_RTC_DRV_MT6397=3Dy
> CONFIG_RTC_DRV_R7301=3Dy
> =

> #
> # HID Sensor RTC drivers
> #
> CONFIG_RTC_DRV_GOLDFISH=3Dy
> CONFIG_DMADEVICES=3Dy
> # CONFIG_DMADEVICES_DEBUG is not set
> =

> #
> # DMA Devices
> #
> CONFIG_DMA_ENGINE=3Dy
> CONFIG_DMA_VIRTUAL_CHANNELS=3Dy
> CONFIG_DMA_ACPI=3Dy
> CONFIG_DMA_OF=3Dy
> CONFIG_ALTERA_MSGDMA=3Dy
> CONFIG_DW_AXI_DMAC=3Dy
> # CONFIG_FSL_EDMA is not set
> CONFIG_INTEL_IDMA64=3Dy
> CONFIG_PCH_DMA=3Dy
> CONFIG_PLX_DMA=3Dy
> CONFIG_TIMB_DMA=3Dy
> CONFIG_XILINX_ZYNQMP_DPDMA=3Dy
> CONFIG_QCOM_HIDMA_MGMT=3Dy
> CONFIG_QCOM_HIDMA=3Dy
> CONFIG_DW_DMAC_CORE=3Dy
> CONFIG_DW_DMAC=3Dy
> CONFIG_DW_DMAC_PCI=3Dy
> CONFIG_HSU_DMA=3Dy
> CONFIG_SF_PDMA=3Dy
> # CONFIG_INTEL_LDMA is not set
> =

> #
> # DMA Clients
> #
> CONFIG_ASYNC_TX_DMA=3Dy
> # CONFIG_DMATEST is not set
> =

> #
> # DMABUF options
> #
> # CONFIG_SYNC_FILE is not set
> CONFIG_UDMABUF=3Dy
> # CONFIG_DMABUF_MOVE_NOTIFY is not set
> # CONFIG_DMABUF_DEBUG is not set
> # CONFIG_DMABUF_SELFTESTS is not set
> # CONFIG_DMABUF_HEAPS is not set
> CONFIG_DMABUF_SYSFS_STATS=3Dy
> # end of DMABUF options
> =

> CONFIG_AUXDISPLAY=3Dy
> CONFIG_CHARLCD=3Dy
> CONFIG_HD44780_COMMON=3Dy
> CONFIG_HD44780=3Dy
> # CONFIG_KS0108 is not set
> # CONFIG_IMG_ASCII_LCD is not set
> CONFIG_LCD2S=3Dy
> CONFIG_PARPORT_PANEL=3Dy
> CONFIG_PANEL_PARPORT=3D0
> CONFIG_PANEL_PROFILE=3D5
> # CONFIG_PANEL_CHANGE_MESSAGE is not set
> # CONFIG_CHARLCD_BL_OFF is not set
> # CONFIG_CHARLCD_BL_ON is not set
> CONFIG_CHARLCD_BL_FLASH=3Dy
> CONFIG_PANEL=3Dy
> CONFIG_UIO=3Dy
> CONFIG_UIO_CIF=3Dy
> # CONFIG_UIO_PDRV_GENIRQ is not set
> CONFIG_UIO_DMEM_GENIRQ=3Dy
> # CONFIG_UIO_AEC is not set
> # CONFIG_UIO_SERCOS3 is not set
> # CONFIG_UIO_PCI_GENERIC is not set
> CONFIG_UIO_NETX=3Dy
> CONFIG_UIO_PRUSS=3Dy
> CONFIG_UIO_MF624=3Dy
> CONFIG_VFIO=3Dy
> CONFIG_VFIO_IOMMU_TYPE1=3Dy
> CONFIG_VFIO_NOIOMMU=3Dy
> CONFIG_VFIO_PCI_MMAP=3Dy
> CONFIG_VFIO_PCI_INTX=3Dy
> # CONFIG_VFIO_PCI is not set
> CONFIG_VFIO_MDEV=3Dy
> CONFIG_VIRT_DRIVERS=3Dy
> # CONFIG_VBOXGUEST is not set
> CONFIG_NITRO_ENCLAVES=3Dy
> # CONFIG_NITRO_ENCLAVES_MISC_DEV_TEST is not set
> CONFIG_VIRTIO=3Dy
> CONFIG_VIRTIO_MENU=3Dy
> # CONFIG_VIRTIO_PCI is not set
> # CONFIG_VIRTIO_BALLOON is not set
> # CONFIG_VIRTIO_INPUT is not set
> CONFIG_VIRTIO_MMIO=3Dy
> # CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES is not set
> # CONFIG_VDPA is not set
> CONFIG_VHOST_MENU=3Dy
> # CONFIG_VHOST_NET is not set
> # CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set
> =

> #
> # Microsoft Hyper-V guest support
> #
> # CONFIG_HYPERV is not set
> # end of Microsoft Hyper-V guest support
> =

> CONFIG_GREYBUS=3Dy
> CONFIG_COMEDI=3Dy
> CONFIG_COMEDI_DEBUG=3Dy
> CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=3D2048
> CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=3D20480
> CONFIG_COMEDI_MISC_DRIVERS=3Dy
> CONFIG_COMEDI_BOND=3Dy
> CONFIG_COMEDI_TEST=3Dy
> CONFIG_COMEDI_PARPORT=3Dy
> CONFIG_COMEDI_SSV_DNP=3Dy
> # CONFIG_COMEDI_ISA_DRIVERS is not set
> CONFIG_COMEDI_PCI_DRIVERS=3Dy
> CONFIG_COMEDI_8255_PCI=3Dy
> CONFIG_COMEDI_ADDI_WATCHDOG=3Dy
> CONFIG_COMEDI_ADDI_APCI_1032=3Dy
> # CONFIG_COMEDI_ADDI_APCI_1500 is not set
> CONFIG_COMEDI_ADDI_APCI_1516=3Dy
> # CONFIG_COMEDI_ADDI_APCI_1564 is not set
> CONFIG_COMEDI_ADDI_APCI_16XX=3Dy
> CONFIG_COMEDI_ADDI_APCI_2032=3Dy
> CONFIG_COMEDI_ADDI_APCI_2200=3Dy
> # CONFIG_COMEDI_ADDI_APCI_3120 is not set
> CONFIG_COMEDI_ADDI_APCI_3501=3Dy
> CONFIG_COMEDI_ADDI_APCI_3XXX=3Dy
> # CONFIG_COMEDI_ADL_PCI6208 is not set
> CONFIG_COMEDI_ADL_PCI7X3X=3Dy
> CONFIG_COMEDI_ADL_PCI8164=3Dy
> CONFIG_COMEDI_ADL_PCI9111=3Dy
> CONFIG_COMEDI_ADL_PCI9118=3Dy
> CONFIG_COMEDI_ADV_PCI1710=3Dy
> # CONFIG_COMEDI_ADV_PCI1720 is not set
> # CONFIG_COMEDI_ADV_PCI1723 is not set
> CONFIG_COMEDI_ADV_PCI1724=3Dy
> # CONFIG_COMEDI_ADV_PCI1760 is not set
> # CONFIG_COMEDI_ADV_PCI_DIO is not set
> CONFIG_COMEDI_AMPLC_DIO200_PCI=3Dy
> CONFIG_COMEDI_AMPLC_PC236_PCI=3Dy
> CONFIG_COMEDI_AMPLC_PC263_PCI=3Dy
> CONFIG_COMEDI_AMPLC_PCI224=3Dy
> CONFIG_COMEDI_AMPLC_PCI230=3Dy
> CONFIG_COMEDI_CONTEC_PCI_DIO=3Dy
> # CONFIG_COMEDI_DAS08_PCI is not set
> CONFIG_COMEDI_DT3000=3Dy
> CONFIG_COMEDI_DYNA_PCI10XX=3Dy
> CONFIG_COMEDI_GSC_HPDI=3Dy
> CONFIG_COMEDI_MF6X4=3Dy
> CONFIG_COMEDI_ICP_MULTI=3Dy
> CONFIG_COMEDI_DAQBOARD2000=3Dy
> CONFIG_COMEDI_JR3_PCI=3Dy
> # CONFIG_COMEDI_KE_COUNTER is not set
> # CONFIG_COMEDI_CB_PCIDAS64 is not set
> CONFIG_COMEDI_CB_PCIDAS=3Dy
> CONFIG_COMEDI_CB_PCIDDA=3Dy
> # CONFIG_COMEDI_CB_PCIMDAS is not set
> CONFIG_COMEDI_CB_PCIMDDA=3Dy
> CONFIG_COMEDI_ME4000=3Dy
> CONFIG_COMEDI_ME_DAQ=3Dy
> CONFIG_COMEDI_NI_6527=3Dy
> # CONFIG_COMEDI_NI_65XX is not set
> CONFIG_COMEDI_NI_660X=3Dy
> # CONFIG_COMEDI_NI_670X is not set
> CONFIG_COMEDI_NI_LABPC_PCI=3Dy
> # CONFIG_COMEDI_NI_PCIDIO is not set
> # CONFIG_COMEDI_NI_PCIMIO is not set
> # CONFIG_COMEDI_RTD520 is not set
> CONFIG_COMEDI_S626=3Dy
> CONFIG_COMEDI_MITE=3Dy
> CONFIG_COMEDI_NI_TIOCMD=3Dy
> # CONFIG_COMEDI_PCMCIA_DRIVERS is not set
> CONFIG_COMEDI_8254=3Dy
> CONFIG_COMEDI_8255=3Dy
> CONFIG_COMEDI_8255_SA=3Dy
> CONFIG_COMEDI_KCOMEDILIB=3Dy
> CONFIG_COMEDI_AMPLC_DIO200=3Dy
> CONFIG_COMEDI_AMPLC_PC236=3Dy
> CONFIG_COMEDI_NI_LABPC=3Dy
> CONFIG_COMEDI_NI_TIO=3Dy
> CONFIG_COMEDI_NI_ROUTING=3Dy
> # CONFIG_COMEDI_TESTS is not set
> CONFIG_STAGING=3Dy
> # CONFIG_RTLLIB is not set
> CONFIG_RTS5208=3Dy
> =

> #
> # IIO staging drivers
> #
> =

> #
> # Accelerometers
> #
> CONFIG_ADIS16203=3Dy
> CONFIG_ADIS16240=3Dy
> # end of Accelerometers
> =

> #
> # Analog to digital converters
> #
> # CONFIG_AD7816 is not set
> CONFIG_AD7280=3Dy
> # end of Analog to digital converters
> =

> #
> # Analog digital bi-direction converters
> #
> # CONFIG_ADT7316 is not set
> # end of Analog digital bi-direction converters
> =

> #
> # Capacitance to digital converters
> #
> CONFIG_AD7746=3Dy
> # end of Capacitance to digital converters
> =

> #
> # Direct Digital Synthesis
> #
> CONFIG_AD9832=3Dy
> CONFIG_AD9834=3Dy
> # end of Direct Digital Synthesis
> =

> #
> # Network Analyzer, Impedance Converters
> #
> CONFIG_AD5933=3Dy
> # end of Network Analyzer, Impedance Converters
> =

> #
> # Active energy metering IC
> #
> CONFIG_ADE7854=3Dy
> # CONFIG_ADE7854_I2C is not set
> CONFIG_ADE7854_SPI=3Dy
> # end of Active energy metering IC
> =

> #
> # Resolver to digital converters
> #
> CONFIG_AD2S1210=3Dy
> # end of Resolver to digital converters
> # end of IIO staging drivers
> =

> CONFIG_STAGING_MEDIA=3Dy
> =

> #
> # Android
> #
> # end of Android
> =

> CONFIG_STAGING_BOARD=3Dy
> CONFIG_GS_FPGABOOT=3Dy
> # CONFIG_UNISYSSPAR is not set
> # CONFIG_COMMON_CLK_XLNX_CLKWZRD is not set
> # CONFIG_KS7010 is not set
> # CONFIG_GREYBUS_BOOTROM is not set
> # CONFIG_GREYBUS_FIRMWARE is not set
> # CONFIG_GREYBUS_HID is not set
> # CONFIG_GREYBUS_LIGHT is not set
> # CONFIG_GREYBUS_LOG is not set
> CONFIG_GREYBUS_LOOPBACK=3Dy
> # CONFIG_GREYBUS_POWER is not set
> # CONFIG_GREYBUS_RAW is not set
> # CONFIG_GREYBUS_VIBRATOR is not set
> CONFIG_GREYBUS_BRIDGED_PHY=3Dy
> # CONFIG_GREYBUS_GPIO is not set
> # CONFIG_GREYBUS_I2C is not set
> # CONFIG_GREYBUS_SDIO is not set
> CONFIG_GREYBUS_SPI=3Dy
> # CONFIG_GREYBUS_UART is not set
> # CONFIG_PI433 is not set
> # CONFIG_XIL_AXIS_FIFO is not set
> # CONFIG_FIELDBUS_DEV is not set
> # CONFIG_QLGE is not set
> CONFIG_X86_PLATFORM_DEVICES=3Dy
> # CONFIG_ACPI_WMI is not set
> # CONFIG_ACERHDF is not set
> # CONFIG_ACER_WIRELESS is not set
> # CONFIG_AMD_PMC is not set
> # CONFIG_ADV_SWBUTTON is not set
> # CONFIG_APPLE_GMUX is not set
> # CONFIG_ASUS_LAPTOP is not set
> # CONFIG_ASUS_WIRELESS is not set
> # CONFIG_ASUS_TF103C_DOCK is not set
> CONFIG_X86_PLATFORM_DRIVERS_DELL=3Dy
> CONFIG_DCDBAS=3Dy
> CONFIG_DELL_RBU=3Dy
> CONFIG_DELL_SMBIOS=3Dy
> # CONFIG_DELL_SMBIOS_SMM is not set
> CONFIG_DELL_SMO8800=3Dm
> # CONFIG_FUJITSU_LAPTOP is not set
> # CONFIG_FUJITSU_TABLET is not set
> # CONFIG_GPD_POCKET_FAN is not set
> # CONFIG_HP_ACCEL is not set
> # CONFIG_WIRELESS_HOTKEY is not set
> CONFIG_IBM_RTL=3Dy
> # CONFIG_SENSORS_HDAPS is not set
> CONFIG_INTEL_ATOMISP2_PDX86=3Dy
> # CONFIG_INTEL_ATOMISP2_LED is not set
> CONFIG_INTEL_ATOMISP2_PM=3Dy
> # CONFIG_INTEL_SAR_INT1092 is not set
> # CONFIG_INTEL_SKL_INT3472 is not set
> # CONFIG_INTEL_PMC_CORE is not set
> # CONFIG_INTEL_HID_EVENT is not set
> # CONFIG_INTEL_VBTN is not set
> # CONFIG_INTEL_INT0002_VGPIO is not set
> CONFIG_INTEL_PUNIT_IPC=3Dy
> # CONFIG_INTEL_RST is not set
> # CONFIG_INTEL_SMARTCONNECT is not set
> # CONFIG_INTEL_VSEC is not set
> # CONFIG_PCENGINES_APU2 is not set
> # CONFIG_BARCO_P50_GPIO is not set
> CONFIG_SAMSUNG_LAPTOP=3Dy
> # CONFIG_SAMSUNG_Q10 is not set
> # CONFIG_TOSHIBA_BT_RFKILL is not set
> # CONFIG_TOSHIBA_HAPS is not set
> # CONFIG_ACPI_CMPC is not set
> # CONFIG_PANASONIC_LAPTOP is not set
> # CONFIG_SYSTEM76_ACPI is not set
> # CONFIG_TOPSTAR_LAPTOP is not set
> # CONFIG_I2C_MULTI_INSTANTIATE is not set
> CONFIG_MLX_PLATFORM=3Dy
> # CONFIG_INTEL_IPS is not set
> # CONFIG_INTEL_SCU_PCI is not set
> # CONFIG_INTEL_SCU_PLATFORM is not set
> # CONFIG_SIEMENS_SIMATIC_IPC is not set
> CONFIG_PMC_ATOM=3Dy
> # CONFIG_CHROME_PLATFORMS is not set
> # CONFIG_MELLANOX_PLATFORM is not set
> CONFIG_SURFACE_PLATFORMS=3Dy
> # CONFIG_SURFACE_3_POWER_OPREGION is not set
> # CONFIG_SURFACE_HOTPLUG is not set
> # CONFIG_SURFACE_PRO3_BUTTON is not set
> CONFIG_HAVE_CLK=3Dy
> CONFIG_HAVE_CLK_PREPARE=3Dy
> CONFIG_COMMON_CLK=3Dy
> CONFIG_COMMON_CLK_WM831X=3Dy
> CONFIG_LMK04832=3Dy
> CONFIG_COMMON_CLK_MAX77686=3Dy
> # CONFIG_COMMON_CLK_MAX9485 is not set
> CONFIG_COMMON_CLK_RK808=3Dy
> CONFIG_COMMON_CLK_SI5341=3Dy
> CONFIG_COMMON_CLK_SI5351=3Dy
> CONFIG_COMMON_CLK_SI514=3Dy
> CONFIG_COMMON_CLK_SI544=3Dy
> # CONFIG_COMMON_CLK_SI570 is not set
> CONFIG_COMMON_CLK_CDCE706=3Dy
> # CONFIG_COMMON_CLK_CDCE925 is not set
> # CONFIG_COMMON_CLK_CS2000_CP is not set
> # CONFIG_COMMON_CLK_LAN966X is not set
> # CONFIG_CLK_TWL6040 is not set
> CONFIG_COMMON_CLK_AXI_CLKGEN=3Dy
> # CONFIG_COMMON_CLK_VC5 is not set
> # CONFIG_COMMON_CLK_BD718XX is not set
> # CONFIG_COMMON_CLK_FIXED_MMIO is not set
> CONFIG_CLK_LGM_CGU=3Dy
> # CONFIG_XILINX_VCU is not set
> CONFIG_HWSPINLOCK=3Dy
> =

> #
> # Clock Source drivers
> #
> CONFIG_CLKSRC_I8253=3Dy
> CONFIG_CLKEVT_I8253=3Dy
> CONFIG_CLKBLD_I8253=3Dy
> # CONFIG_MICROCHIP_PIT64B is not set
> # end of Clock Source drivers
> =

> CONFIG_MAILBOX=3Dy
> CONFIG_PLATFORM_MHU=3Dy
> # CONFIG_PCC is not set
> CONFIG_ALTERA_MBOX=3Dy
> # CONFIG_MAILBOX_TEST is not set
> CONFIG_IOMMU_API=3Dy
> CONFIG_IOMMU_SUPPORT=3Dy
> =

> #
> # Generic IOMMU Pagetable Support
> #
> # end of Generic IOMMU Pagetable Support
> =

> # CONFIG_IOMMU_DEBUGFS is not set
> # CONFIG_IOMMU_DEFAULT_DMA_STRICT is not set
> CONFIG_IOMMU_DEFAULT_DMA_LAZY=3Dy
> # CONFIG_IOMMU_DEFAULT_PASSTHROUGH is not set
> CONFIG_OF_IOMMU=3Dy
> # CONFIG_VIRTIO_IOMMU is not set
> =

> #
> # Remoteproc drivers
> #
> # CONFIG_REMOTEPROC is not set
> # end of Remoteproc drivers
> =

> #
> # Rpmsg drivers
> #
> CONFIG_RPMSG=3Dy
> # CONFIG_RPMSG_CHAR is not set
> CONFIG_RPMSG_NS=3Dy
> CONFIG_RPMSG_QCOM_GLINK=3Dy
> CONFIG_RPMSG_QCOM_GLINK_RPM=3Dy
> CONFIG_RPMSG_VIRTIO=3Dy
> # end of Rpmsg drivers
> =

> CONFIG_SOUNDWIRE=3Dy
> =

> #
> # SoundWire Devices
> #
> =

> #
> # SOC (System On Chip) specific Drivers
> #
> =

> #
> # Amlogic SoC drivers
> #
> # end of Amlogic SoC drivers
> =

> #
> # Broadcom SoC drivers
> #
> # end of Broadcom SoC drivers
> =

> #
> # NXP/Freescale QorIQ SoC drivers
> #
> # end of NXP/Freescale QorIQ SoC drivers
> =

> #
> # i.MX SoC drivers
> #
> # end of i.MX SoC drivers
> =

> #
> # Enable LiteX SoC Builder specific drivers
> #
> CONFIG_LITEX=3Dy
> CONFIG_LITEX_SOC_CONTROLLER=3Dy
> # end of Enable LiteX SoC Builder specific drivers
> =

> #
> # Qualcomm SoC drivers
> #
> # end of Qualcomm SoC drivers
> =

> # CONFIG_SOC_TI is not set
> =

> #
> # Xilinx SoC drivers
> #
> # end of Xilinx SoC drivers
> # end of SOC (System On Chip) specific Drivers
> =

> CONFIG_PM_DEVFREQ=3Dy
> =

> #
> # DEVFREQ Governors
> #
> CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=3Dy
> CONFIG_DEVFREQ_GOV_PERFORMANCE=3Dy
> # CONFIG_DEVFREQ_GOV_POWERSAVE is not set
> # CONFIG_DEVFREQ_GOV_USERSPACE is not set
> # CONFIG_DEVFREQ_GOV_PASSIVE is not set
> =

> #
> # DEVFREQ Drivers
> #
> # CONFIG_PM_DEVFREQ_EVENT is not set
> CONFIG_EXTCON=3Dy
> =

> #
> # Extcon Device Drivers
> #
> # CONFIG_EXTCON_ADC_JACK is not set
> # CONFIG_EXTCON_AXP288 is not set
> # CONFIG_EXTCON_FSA9480 is not set
> # CONFIG_EXTCON_GPIO is not set
> # CONFIG_EXTCON_INTEL_INT3496 is not set
> CONFIG_EXTCON_MAX14577=3Dy
> CONFIG_EXTCON_MAX3355=3Dy
> # CONFIG_EXTCON_MAX77693 is not set
> CONFIG_EXTCON_PTN5150=3Dy
> CONFIG_EXTCON_RT8973A=3Dy
> CONFIG_EXTCON_SM5502=3Dy
> # CONFIG_EXTCON_USB_GPIO is not set
> CONFIG_EXTCON_USBC_TUSB320=3Dy
> # CONFIG_MEMORY is not set
> CONFIG_IIO=3Dy
> CONFIG_IIO_BUFFER=3Dy
> CONFIG_IIO_BUFFER_CB=3Dy
> CONFIG_IIO_BUFFER_DMA=3Dy
> CONFIG_IIO_BUFFER_DMAENGINE=3Dy
> CONFIG_IIO_BUFFER_HW_CONSUMER=3Dy
> CONFIG_IIO_KFIFO_BUF=3Dy
> CONFIG_IIO_TRIGGERED_BUFFER=3Dy
> CONFIG_IIO_CONFIGFS=3Dy
> CONFIG_IIO_TRIGGER=3Dy
> CONFIG_IIO_CONSUMERS_PER_TRIGGER=3D2
> CONFIG_IIO_SW_DEVICE=3Dy
> # CONFIG_IIO_SW_TRIGGER is not set
> # CONFIG_IIO_TRIGGERED_EVENT is not set
> =

> #
> # Accelerometers
> #
> CONFIG_ADIS16201=3Dy
> CONFIG_ADIS16209=3Dy
> CONFIG_ADXL313=3Dy
> CONFIG_ADXL313_I2C=3Dy
> CONFIG_ADXL313_SPI=3Dy
> CONFIG_ADXL345=3Dy
> CONFIG_ADXL345_I2C=3Dy
> CONFIG_ADXL345_SPI=3Dy
> CONFIG_ADXL355=3Dy
> CONFIG_ADXL355_I2C=3Dy
> CONFIG_ADXL355_SPI=3Dy
> CONFIG_ADXL372=3Dy
> # CONFIG_ADXL372_SPI is not set
> CONFIG_ADXL372_I2C=3Dy
> CONFIG_BMA180=3Dy
> CONFIG_BMA220=3Dy
> # CONFIG_BMA400 is not set
> # CONFIG_BMC150_ACCEL is not set
> # CONFIG_BMI088_ACCEL is not set
> CONFIG_DA280=3Dy
> CONFIG_DA311=3Dy
> # CONFIG_DMARD06 is not set
> # CONFIG_DMARD09 is not set
> CONFIG_DMARD10=3Dy
> CONFIG_FXLS8962AF=3Dy
> # CONFIG_FXLS8962AF_I2C is not set
> CONFIG_FXLS8962AF_SPI=3Dy
> CONFIG_IIO_ST_ACCEL_3AXIS=3Dy
> CONFIG_IIO_ST_ACCEL_I2C_3AXIS=3Dy
> CONFIG_IIO_ST_ACCEL_SPI_3AXIS=3Dy
> CONFIG_KXSD9=3Dy
> CONFIG_KXSD9_SPI=3Dy
> CONFIG_KXSD9_I2C=3Dy
> CONFIG_KXCJK1013=3Dy
> CONFIG_MC3230=3Dy
> CONFIG_MMA7455=3Dy
> CONFIG_MMA7455_I2C=3Dy
> CONFIG_MMA7455_SPI=3Dy
> # CONFIG_MMA7660 is not set
> CONFIG_MMA8452=3Dy
> CONFIG_MMA9551_CORE=3Dy
> CONFIG_MMA9551=3Dy
> # CONFIG_MMA9553 is not set
> CONFIG_MXC4005=3Dy
> # CONFIG_MXC6255 is not set
> CONFIG_SCA3000=3Dy
> CONFIG_SCA3300=3Dy
> CONFIG_STK8312=3Dy
> # CONFIG_STK8BA50 is not set
> # end of Accelerometers
> =

> #
> # Analog to digital converters
> #
> CONFIG_AD_SIGMA_DELTA=3Dy
> # CONFIG_AD7091R5 is not set
> CONFIG_AD7124=3Dy
> CONFIG_AD7192=3Dy
> # CONFIG_AD7266 is not set
> CONFIG_AD7291=3Dy
> CONFIG_AD7292=3Dy
> # CONFIG_AD7298 is not set
> # CONFIG_AD7476 is not set
> CONFIG_AD7606=3Dy
> CONFIG_AD7606_IFACE_PARALLEL=3Dy
> CONFIG_AD7606_IFACE_SPI=3Dy
> CONFIG_AD7766=3Dy
> CONFIG_AD7768_1=3Dy
> CONFIG_AD7780=3Dy
> CONFIG_AD7791=3Dy
> # CONFIG_AD7793 is not set
> CONFIG_AD7887=3Dy
> CONFIG_AD7923=3Dy
> CONFIG_AD7949=3Dy
> CONFIG_AD799X=3Dy
> CONFIG_AD9467=3Dy
> CONFIG_ADI_AXI_ADC=3Dy
> # CONFIG_AXP20X_ADC is not set
> CONFIG_AXP288_ADC=3Dy
> CONFIG_CC10001_ADC=3Dy
> CONFIG_DA9150_GPADC=3Dy
> CONFIG_ENVELOPE_DETECTOR=3Dy
> # CONFIG_HI8435 is not set
> CONFIG_HX711=3Dy
> CONFIG_LTC2471=3Dy
> # CONFIG_LTC2485 is not set
> CONFIG_LTC2496=3Dy
> # CONFIG_LTC2497 is not set
> CONFIG_MAX1027=3Dy
> CONFIG_MAX11100=3Dy
> CONFIG_MAX1118=3Dy
> # CONFIG_MAX1241 is not set
> CONFIG_MAX1363=3Dy
> CONFIG_MAX9611=3Dy
> CONFIG_MCP320X=3Dy
> CONFIG_MCP3422=3Dy
> CONFIG_MCP3911=3Dy
> # CONFIG_MEDIATEK_MT6360_ADC is not set
> CONFIG_NAU7802=3Dy
> CONFIG_QCOM_VADC_COMMON=3Dy
> # CONFIG_QCOM_SPMI_IADC is not set
> CONFIG_QCOM_SPMI_VADC=3Dy
> CONFIG_QCOM_SPMI_ADC5=3Dy
> # CONFIG_SD_ADC_MODULATOR is not set
> CONFIG_STMPE_ADC=3Dy
> CONFIG_STX104=3Dy
> CONFIG_TI_ADC081C=3Dy
> # CONFIG_TI_ADC0832 is not set
> CONFIG_TI_ADC084S021=3Dy
> CONFIG_TI_ADC12138=3Dy
> # CONFIG_TI_ADC108S102 is not set
> CONFIG_TI_ADC128S052=3Dy
> CONFIG_TI_ADC161S626=3Dy
> CONFIG_TI_ADS1015=3Dy
> # CONFIG_TI_ADS7950 is not set
> # CONFIG_TI_ADS8344 is not set
> CONFIG_TI_ADS8688=3Dy
> CONFIG_TI_ADS124S08=3Dy
> CONFIG_TI_ADS131E08=3Dy
> # CONFIG_TI_AM335X_ADC is not set
> CONFIG_TI_TLC4541=3Dy
> # CONFIG_TI_TSC2046 is not set
> CONFIG_VF610_ADC=3Dy
> CONFIG_XILINX_XADC=3Dy
> # end of Analog to digital converters
> =

> #
> # Analog to digital and digital to analog converters
> #
> # CONFIG_AD74413R is not set
> # end of Analog to digital and digital to analog converters
> =

> #
> # Analog Front Ends
> #
> CONFIG_IIO_RESCALE=3Dy
> # end of Analog Front Ends
> =

> #
> # Amplifiers
> #
> # CONFIG_AD8366 is not set
> # CONFIG_HMC425 is not set
> # end of Amplifiers
> =

> #
> # Capacitance to digital converters
> #
> CONFIG_AD7150=3Dy
> # end of Capacitance to digital converters
> =

> #
> # Chemical Sensors
> #
> CONFIG_ATLAS_PH_SENSOR=3Dy
> CONFIG_ATLAS_EZO_SENSOR=3Dy
> CONFIG_BME680=3Dy
> CONFIG_BME680_I2C=3Dy
> CONFIG_BME680_SPI=3Dy
> CONFIG_CCS811=3Dy
> CONFIG_IAQCORE=3Dy
> CONFIG_SCD30_CORE=3Dy
> CONFIG_SCD30_I2C=3Dy
> CONFIG_SCD4X=3Dy
> CONFIG_SENSIRION_SGP30=3Dy
> # CONFIG_SENSIRION_SGP40 is not set
> CONFIG_SPS30=3Dy
> CONFIG_SPS30_I2C=3Dy
> # CONFIG_SENSEAIR_SUNRISE_CO2 is not set
> CONFIG_VZ89X=3Dy
> # end of Chemical Sensors
> =

> #
> # Hid Sensor IIO Common
> #
> # end of Hid Sensor IIO Common
> =

> CONFIG_IIO_MS_SENSORS_I2C=3Dy
> =

> #
> # IIO SCMI Sensors
> #
> # end of IIO SCMI Sensors
> =

> #
> # SSP Sensor Common
> #
> # CONFIG_IIO_SSP_SENSORHUB is not set
> # end of SSP Sensor Common
> =

> CONFIG_IIO_ST_SENSORS_I2C=3Dy
> CONFIG_IIO_ST_SENSORS_SPI=3Dy
> CONFIG_IIO_ST_SENSORS_CORE=3Dy
> =

> #
> # Digital to analog converters
> #
> # CONFIG_AD3552R is not set
> CONFIG_AD5064=3Dy
> CONFIG_AD5360=3Dy
> CONFIG_AD5380=3Dy
> CONFIG_AD5421=3Dy
> CONFIG_AD5446=3Dy
> # CONFIG_AD5449 is not set
> CONFIG_AD5592R_BASE=3Dy
> CONFIG_AD5592R=3Dy
> CONFIG_AD5593R=3Dy
> CONFIG_AD5504=3Dy
> # CONFIG_AD5624R_SPI is not set
> CONFIG_AD5686=3Dy
> CONFIG_AD5686_SPI=3Dy
> CONFIG_AD5696_I2C=3Dy
> CONFIG_AD5755=3Dy
> CONFIG_AD5758=3Dy
> CONFIG_AD5761=3Dy
> CONFIG_AD5764=3Dy
> # CONFIG_AD5766 is not set
> # CONFIG_AD5770R is not set
> # CONFIG_AD5791 is not set
> # CONFIG_AD7293 is not set
> CONFIG_AD7303=3Dy
> CONFIG_AD8801=3Dy
> CONFIG_CIO_DAC=3Dy
> CONFIG_DPOT_DAC=3Dy
> CONFIG_DS4424=3Dy
> CONFIG_LTC1660=3Dy
> # CONFIG_LTC2632 is not set
> CONFIG_M62332=3Dy
> # CONFIG_MAX517 is not set
> CONFIG_MAX5821=3Dy
> CONFIG_MCP4725=3Dy
> # CONFIG_MCP4922 is not set
> CONFIG_TI_DAC082S085=3Dy
> CONFIG_TI_DAC5571=3Dy
> CONFIG_TI_DAC7311=3Dy
> # CONFIG_TI_DAC7612 is not set
> CONFIG_VF610_DAC=3Dy
> # end of Digital to analog converters
> =

> #
> # IIO dummy driver
> #
> CONFIG_IIO_DUMMY_EVGEN=3Dy
> CONFIG_IIO_SIMPLE_DUMMY=3Dy
> CONFIG_IIO_SIMPLE_DUMMY_EVENTS=3Dy
> # CONFIG_IIO_SIMPLE_DUMMY_BUFFER is not set
> # end of IIO dummy driver
> =

> #
> # Filters
> #
> # end of Filters
> =

> #
> # Frequency Synthesizers DDS/PLL
> #
> =

> #
> # Clock Generator/Distribution
> #
> CONFIG_AD9523=3Dy
> # end of Clock Generator/Distribution
> =

> #
> # Phase-Locked Loop (PLL) frequency synthesizers
> #
> # CONFIG_ADF4350 is not set
> CONFIG_ADF4371=3Dy
> # CONFIG_ADMV1013 is not set
> # CONFIG_ADRF6780 is not set
> # end of Phase-Locked Loop (PLL) frequency synthesizers
> # end of Frequency Synthesizers DDS/PLL
> =

> #
> # Digital gyroscope sensors
> #
> CONFIG_ADIS16080=3Dy
> CONFIG_ADIS16130=3Dy
> CONFIG_ADIS16136=3Dy
> CONFIG_ADIS16260=3Dy
> CONFIG_ADXRS290=3Dy
> # CONFIG_ADXRS450 is not set
> CONFIG_BMG160=3Dy
> CONFIG_BMG160_I2C=3Dy
> CONFIG_BMG160_SPI=3Dy
> CONFIG_FXAS21002C=3Dy
> CONFIG_FXAS21002C_I2C=3Dy
> CONFIG_FXAS21002C_SPI=3Dy
> # CONFIG_MPU3050_I2C is not set
> CONFIG_IIO_ST_GYRO_3AXIS=3Dy
> CONFIG_IIO_ST_GYRO_I2C_3AXIS=3Dy
> CONFIG_IIO_ST_GYRO_SPI_3AXIS=3Dy
> CONFIG_ITG3200=3Dy
> # end of Digital gyroscope sensors
> =

> #
> # Health Sensors
> #
> =

> #
> # Heart Rate Monitors
> #
> CONFIG_AFE4403=3Dy
> CONFIG_AFE4404=3Dy
> CONFIG_MAX30100=3Dy
> # CONFIG_MAX30102 is not set
> # end of Heart Rate Monitors
> # end of Health Sensors
> =

> #
> # Humidity sensors
> #
> CONFIG_AM2315=3Dy
> CONFIG_DHT11=3Dy
> CONFIG_HDC100X=3Dy
> # CONFIG_HDC2010 is not set
> CONFIG_HTS221=3Dy
> CONFIG_HTS221_I2C=3Dy
> CONFIG_HTS221_SPI=3Dy
> CONFIG_HTU21=3Dy
> CONFIG_SI7005=3Dy
> CONFIG_SI7020=3Dy
> # end of Humidity sensors
> =

> #
> # Inertial measurement units
> #
> # CONFIG_ADIS16400 is not set
> # CONFIG_ADIS16460 is not set
> CONFIG_ADIS16475=3Dy
> CONFIG_ADIS16480=3Dy
> CONFIG_BMI160=3Dy
> CONFIG_BMI160_I2C=3Dy
> CONFIG_BMI160_SPI=3Dy
> CONFIG_FXOS8700=3Dy
> CONFIG_FXOS8700_I2C=3Dy
> # CONFIG_FXOS8700_SPI is not set
> CONFIG_KMX61=3Dy
> # CONFIG_INV_ICM42600_I2C is not set
> # CONFIG_INV_ICM42600_SPI is not set
> CONFIG_INV_MPU6050_IIO=3Dy
> CONFIG_INV_MPU6050_I2C=3Dy
> # CONFIG_INV_MPU6050_SPI is not set
> CONFIG_IIO_ST_LSM6DSX=3Dy
> CONFIG_IIO_ST_LSM6DSX_I2C=3Dy
> CONFIG_IIO_ST_LSM6DSX_SPI=3Dy
> CONFIG_IIO_ST_LSM6DSX_I3C=3Dy
> CONFIG_IIO_ST_LSM9DS0=3Dy
> CONFIG_IIO_ST_LSM9DS0_I2C=3Dy
> CONFIG_IIO_ST_LSM9DS0_SPI=3Dy
> # end of Inertial measurement units
> =

> CONFIG_IIO_ADIS_LIB=3Dy
> CONFIG_IIO_ADIS_LIB_BUFFER=3Dy
> =

> #
> # Light sensors
> #
> # CONFIG_ACPI_ALS is not set
> CONFIG_ADJD_S311=3Dy
> CONFIG_ADUX1020=3Dy
> CONFIG_AL3010=3Dy
> CONFIG_AL3320A=3Dy
> CONFIG_APDS9300=3Dy
> CONFIG_APDS9960=3Dy
> # CONFIG_AS73211 is not set
> CONFIG_BH1750=3Dy
> # CONFIG_BH1780 is not set
> # CONFIG_CM32181 is not set
> # CONFIG_CM3232 is not set
> CONFIG_CM3323=3Dy
> CONFIG_CM3605=3Dy
> CONFIG_CM36651=3Dy
> CONFIG_GP2AP002=3Dy
> CONFIG_GP2AP020A00F=3Dy
> CONFIG_IQS621_ALS=3Dy
> CONFIG_SENSORS_ISL29018=3Dy
> CONFIG_SENSORS_ISL29028=3Dy
> # CONFIG_ISL29125 is not set
> CONFIG_JSA1212=3Dy
> # CONFIG_RPR0521 is not set
> CONFIG_LTR501=3Dy
> # CONFIG_LV0104CS is not set
> CONFIG_MAX44000=3Dy
> CONFIG_MAX44009=3Dy
> CONFIG_NOA1305=3Dy
> CONFIG_OPT3001=3Dy
> CONFIG_PA12203001=3Dy
> CONFIG_SI1133=3Dy
> # CONFIG_SI1145 is not set
> # CONFIG_STK3310 is not set
> # CONFIG_ST_UVIS25 is not set
> # CONFIG_TCS3414 is not set
> CONFIG_TCS3472=3Dy
> CONFIG_SENSORS_TSL2563=3Dy
> # CONFIG_TSL2583 is not set
> # CONFIG_TSL2591 is not set
> CONFIG_TSL2772=3Dy
> CONFIG_TSL4531=3Dy
> # CONFIG_US5182D is not set
> # CONFIG_VCNL4000 is not set
> CONFIG_VCNL4035=3Dy
> CONFIG_VEML6030=3Dy
> CONFIG_VEML6070=3Dy
> # CONFIG_VL6180 is not set
> CONFIG_ZOPT2201=3Dy
> # end of Light sensors
> =

> #
> # Magnetometer sensors
> #
> CONFIG_AK8974=3Dy
> CONFIG_AK8975=3Dy
> # CONFIG_AK09911 is not set
> # CONFIG_BMC150_MAGN_I2C is not set
> # CONFIG_BMC150_MAGN_SPI is not set
> # CONFIG_MAG3110 is not set
> CONFIG_MMC35240=3Dy
> CONFIG_IIO_ST_MAGN_3AXIS=3Dy
> CONFIG_IIO_ST_MAGN_I2C_3AXIS=3Dy
> CONFIG_IIO_ST_MAGN_SPI_3AXIS=3Dy
> CONFIG_SENSORS_HMC5843=3Dy
> CONFIG_SENSORS_HMC5843_I2C=3Dy
> CONFIG_SENSORS_HMC5843_SPI=3Dy
> # CONFIG_SENSORS_RM3100_I2C is not set
> # CONFIG_SENSORS_RM3100_SPI is not set
> # CONFIG_YAMAHA_YAS530 is not set
> # end of Magnetometer sensors
> =

> #
> # Multiplexers
> #
> # CONFIG_IIO_MUX is not set
> # end of Multiplexers
> =

> #
> # Inclinometer sensors
> #
> # end of Inclinometer sensors
> =

> # CONFIG_IIO_TEST_FORMAT is not set
> =

> #
> # Triggers - standalone
> #
> CONFIG_IIO_INTERRUPT_TRIGGER=3Dy
> # CONFIG_IIO_SYSFS_TRIGGER is not set
> # end of Triggers - standalone
> =

> #
> # Linear and angular position sensors
> #
> # CONFIG_IQS624_POS is not set
> # end of Linear and angular position sensors
> =

> #
> # Digital potentiometers
> #
> CONFIG_AD5110=3Dy
> CONFIG_AD5272=3Dy
> CONFIG_DS1803=3Dy
> # CONFIG_MAX5432 is not set
> CONFIG_MAX5481=3Dy
> CONFIG_MAX5487=3Dy
> CONFIG_MCP4018=3Dy
> CONFIG_MCP4131=3Dy
> CONFIG_MCP4531=3Dy
> CONFIG_MCP41010=3Dy
> # CONFIG_TPL0102 is not set
> # end of Digital potentiometers
> =

> #
> # Digital potentiostats
> #
> # CONFIG_LMP91000 is not set
> # end of Digital potentiostats
> =

> #
> # Pressure sensors
> #
> CONFIG_ABP060MG=3Dy
> CONFIG_BMP280=3Dy
> CONFIG_BMP280_I2C=3Dy
> CONFIG_BMP280_SPI=3Dy
> # CONFIG_DLHL60D is not set
> CONFIG_DPS310=3Dy
> # CONFIG_HP03 is not set
> CONFIG_ICP10100=3Dy
> CONFIG_MPL115=3Dy
> CONFIG_MPL115_I2C=3Dy
> # CONFIG_MPL115_SPI is not set
> CONFIG_MPL3115=3Dy
> CONFIG_MS5611=3Dy
> CONFIG_MS5611_I2C=3Dy
> # CONFIG_MS5611_SPI is not set
> CONFIG_MS5637=3Dy
> # CONFIG_IIO_ST_PRESS is not set
> CONFIG_T5403=3Dy
> CONFIG_HP206C=3Dy
> # CONFIG_ZPA2326 is not set
> # end of Pressure sensors
> =

> #
> # Lightning sensors
> #
> CONFIG_AS3935=3Dy
> # end of Lightning sensors
> =

> #
> # Proximity and distance sensors
> #
> CONFIG_ISL29501=3Dy
> CONFIG_LIDAR_LITE_V2=3Dy
> # CONFIG_MB1232 is not set
> CONFIG_PING=3Dy
> CONFIG_RFD77402=3Dy
> CONFIG_SRF04=3Dy
> CONFIG_SX9310=3Dy
> # CONFIG_SX9500 is not set
> CONFIG_SRF08=3Dy
> CONFIG_VCNL3020=3Dy
> CONFIG_VL53L0X_I2C=3Dy
> # end of Proximity and distance sensors
> =

> #
> # Resolver to digital converters
> #
> CONFIG_AD2S90=3Dy
> # CONFIG_AD2S1200 is not set
> # end of Resolver to digital converters
> =

> #
> # Temperature sensors
> #
> # CONFIG_IQS620AT_TEMP is not set
> # CONFIG_LTC2983 is not set
> # CONFIG_MAXIM_THERMOCOUPLE is not set
> CONFIG_MLX90614=3Dy
> # CONFIG_MLX90632 is not set
> CONFIG_TMP006=3Dy
> CONFIG_TMP007=3Dy
> # CONFIG_TMP117 is not set
> CONFIG_TSYS01=3Dy
> CONFIG_TSYS02D=3Dy
> CONFIG_MAX31856=3Dy
> CONFIG_MAX31865=3Dy
> # end of Temperature sensors
> =

> # CONFIG_NTB is not set
> CONFIG_VME_BUS=3Dy
> =

> #
> # VME Bridge Drivers
> #
> # CONFIG_VME_CA91CX42 is not set
> CONFIG_VME_TSI148=3Dy
> # CONFIG_VME_FAKE is not set
> =

> #
> # VME Board Drivers
> #
> # CONFIG_VMIVME_7805 is not set
> =

> #
> # VME Device Drivers
> #
> CONFIG_VME_USER=3Dy
> # CONFIG_PWM is not set
> =

> #
> # IRQ chip support
> #
> CONFIG_IRQCHIP=3Dy
> CONFIG_AL_FIC=3Dy
> # end of IRQ chip support
> =

> CONFIG_IPACK_BUS=3Dy
> # CONFIG_BOARD_TPCI200 is not set
> # CONFIG_SERIAL_IPOCTAL is not set
> CONFIG_RESET_CONTROLLER=3Dy
> CONFIG_RESET_INTEL_GW=3Dy
> CONFIG_RESET_TI_SYSCON=3Dy
> =

> #
> # PHY Subsystem
> #
> CONFIG_GENERIC_PHY=3Dy
> CONFIG_GENERIC_PHY_MIPI_DPHY=3Dy
> # CONFIG_USB_LGM_PHY is not set
> CONFIG_PHY_CAN_TRANSCEIVER=3Dy
> =

> #
> # PHY drivers for Broadcom platforms
> #
> # CONFIG_BCM_KONA_USB2_PHY is not set
> # end of PHY drivers for Broadcom platforms
> =

> # CONFIG_PHY_CADENCE_TORRENT is not set
> CONFIG_PHY_CADENCE_DPHY=3Dy
> CONFIG_PHY_CADENCE_SIERRA=3Dy
> CONFIG_PHY_CADENCE_SALVO=3Dy
> CONFIG_PHY_FSL_IMX8MQ_USB=3Dy
> CONFIG_PHY_MIXEL_MIPI_DPHY=3Dy
> # CONFIG_PHY_FSL_IMX8M_PCIE is not set
> CONFIG_PHY_PXA_28NM_HSIC=3Dy
> # CONFIG_PHY_PXA_28NM_USB2 is not set
> # CONFIG_PHY_LAN966X_SERDES is not set
> # CONFIG_PHY_CPCAP_USB is not set
> # CONFIG_PHY_MAPPHONE_MDM6600 is not set
> CONFIG_PHY_OCELOT_SERDES=3Dy
> CONFIG_PHY_INTEL_LGM_COMBO=3Dy
> CONFIG_PHY_INTEL_LGM_EMMC=3Dy
> # end of PHY Subsystem
> =

> # CONFIG_POWERCAP is not set
> # CONFIG_MCB is not set
> =

> #
> # Performance monitor support
> #
> # end of Performance monitor support
> =

> CONFIG_RAS=3Dy
> CONFIG_USB4=3Dy
> # CONFIG_USB4_DEBUGFS_WRITE is not set
> # CONFIG_USB4_KUNIT_TEST is not set
> CONFIG_USB4_DMA_TEST=3Dy
> =

> #
> # Android
> #
> # CONFIG_ANDROID is not set
> # end of Android
> =

> CONFIG_DAX=3Dy
> CONFIG_DEV_DAX=3Dy
> CONFIG_NVMEM=3Dy
> CONFIG_NVMEM_SYSFS=3Dy
> # CONFIG_NVMEM_SPMI_SDAM is not set
> # CONFIG_NVMEM_RMEM is not set
> =

> #
> # HW tracing support
> #
> CONFIG_STM=3Dy
> CONFIG_STM_PROTO_BASIC=3Dy
> CONFIG_STM_PROTO_SYS_T=3Dy
> # CONFIG_STM_DUMMY is not set
> # CONFIG_STM_SOURCE_CONSOLE is not set
> CONFIG_STM_SOURCE_HEARTBEAT=3Dy
> # CONFIG_STM_SOURCE_FTRACE is not set
> CONFIG_INTEL_TH=3Dy
> CONFIG_INTEL_TH_PCI=3Dy
> # CONFIG_INTEL_TH_ACPI is not set
> CONFIG_INTEL_TH_GTH=3Dy
> CONFIG_INTEL_TH_STH=3Dy
> CONFIG_INTEL_TH_MSU=3Dy
> CONFIG_INTEL_TH_PTI=3Dy
> # CONFIG_INTEL_TH_DEBUG is not set
> # end of HW tracing support
> =

> # CONFIG_FPGA is not set
> # CONFIG_FSI is not set
> CONFIG_TEE=3Dy
> =

> #
> # TEE drivers
> #
> # end of TEE drivers
> =

> CONFIG_MULTIPLEXER=3Dy
> =

> #
> # Multiplexer drivers
> #
> CONFIG_MUX_ADG792A=3Dy
> CONFIG_MUX_ADGS1408=3Dy
> # CONFIG_MUX_GPIO is not set
> CONFIG_MUX_MMIO=3Dy
> # end of Multiplexer drivers
> =

> CONFIG_PM_OPP=3Dy
> CONFIG_SIOX=3Dy
> # CONFIG_SIOX_BUS_GPIO is not set
> CONFIG_SLIMBUS=3Dy
> # CONFIG_SLIM_QCOM_CTRL is not set
> # CONFIG_INTERCONNECT is not set
> CONFIG_COUNTER=3Dy
> CONFIG_104_QUAD_8=3Dy
> # CONFIG_INTERRUPT_CNT is not set
> # CONFIG_FTM_QUADDEC is not set
> CONFIG_MICROCHIP_TCB_CAPTURE=3Dy
> CONFIG_INTEL_QEP=3Dy
> # CONFIG_MOST is not set
> # end of Device Drivers
> =

> #
> # File systems
> #
> CONFIG_DCACHE_WORD_ACCESS=3Dy
> CONFIG_VALIDATE_FS_PARSER=3Dy
> CONFIG_FS_IOMAP=3Dy
> CONFIG_EXT2_FS=3Dy
> CONFIG_EXT2_FS_XATTR=3Dy
> # CONFIG_EXT2_FS_POSIX_ACL is not set
> # CONFIG_EXT2_FS_SECURITY is not set
> # CONFIG_EXT3_FS is not set
> CONFIG_EXT4_FS=3Dy
> CONFIG_EXT4_FS_POSIX_ACL=3Dy
> CONFIG_EXT4_FS_SECURITY=3Dy
> CONFIG_EXT4_DEBUG=3Dy
> CONFIG_EXT4_KUNIT_TESTS=3Dy
> CONFIG_JBD2=3Dy
> CONFIG_JBD2_DEBUG=3Dy
> CONFIG_FS_MBCACHE=3Dy
> CONFIG_REISERFS_FS=3Dy
> # CONFIG_REISERFS_CHECK is not set
> # CONFIG_REISERFS_PROC_INFO is not set
> CONFIG_REISERFS_FS_XATTR=3Dy
> CONFIG_REISERFS_FS_POSIX_ACL=3Dy
> CONFIG_REISERFS_FS_SECURITY=3Dy
> # CONFIG_JFS_FS is not set
> CONFIG_XFS_FS=3Dy
> CONFIG_XFS_SUPPORT_V4=3Dy
> # CONFIG_XFS_QUOTA is not set
> # CONFIG_XFS_POSIX_ACL is not set
> CONFIG_XFS_RT=3Dy
> # CONFIG_XFS_ONLINE_SCRUB is not set
> CONFIG_XFS_DEBUG=3Dy
> # CONFIG_XFS_ASSERT_FATAL is not set
> CONFIG_GFS2_FS=3Dy
> # CONFIG_OCFS2_FS is not set
> # CONFIG_BTRFS_FS is not set
> CONFIG_NILFS2_FS=3Dy
> CONFIG_F2FS_FS=3Dy
> # CONFIG_F2FS_STAT_FS is not set
> # CONFIG_F2FS_FS_XATTR is not set
> CONFIG_F2FS_CHECK_FS=3Dy
> # CONFIG_F2FS_FAULT_INJECTION is not set
> CONFIG_F2FS_FS_COMPRESSION=3Dy
> CONFIG_F2FS_FS_LZO=3Dy
> CONFIG_F2FS_FS_LZORLE=3Dy
> CONFIG_F2FS_FS_LZ4=3Dy
> CONFIG_F2FS_FS_LZ4HC=3Dy
> CONFIG_F2FS_FS_ZSTD=3Dy
> # CONFIG_F2FS_IOSTAT is not set
> # CONFIG_FS_DAX is not set
> CONFIG_FS_POSIX_ACL=3Dy
> CONFIG_EXPORTFS=3Dy
> CONFIG_EXPORTFS_BLOCK_OPS=3Dy
> CONFIG_FILE_LOCKING=3Dy
> # CONFIG_FS_ENCRYPTION is not set
> CONFIG_FS_VERITY=3Dy
> # CONFIG_FS_VERITY_DEBUG is not set
> CONFIG_FS_VERITY_BUILTIN_SIGNATURES=3Dy
> CONFIG_FSNOTIFY=3Dy
> CONFIG_DNOTIFY=3Dy
> CONFIG_INOTIFY_USER=3Dy
> CONFIG_FANOTIFY=3Dy
> # CONFIG_FANOTIFY_ACCESS_PERMISSIONS is not set
> CONFIG_QUOTA=3Dy
> # CONFIG_QUOTA_NETLINK_INTERFACE is not set
> CONFIG_PRINT_QUOTA_WARNING=3Dy
> # CONFIG_QUOTA_DEBUG is not set
> CONFIG_QUOTA_TREE=3Dy
> # CONFIG_QFMT_V1 is not set
> CONFIG_QFMT_V2=3Dy
> CONFIG_QUOTACTL=3Dy
> CONFIG_AUTOFS4_FS=3Dy
> CONFIG_AUTOFS_FS=3Dy
> CONFIG_FUSE_FS=3Dy
> CONFIG_CUSE=3Dy
> CONFIG_VIRTIO_FS=3Dy
> # CONFIG_OVERLAY_FS is not set
> =

> #
> # Caches
> #
> CONFIG_NETFS_SUPPORT=3Dy
> # CONFIG_NETFS_STATS is not set
> CONFIG_FSCACHE=3Dy
> # CONFIG_FSCACHE_STATS is not set
> CONFIG_FSCACHE_DEBUG=3Dy
> # CONFIG_CACHEFILES is not set
> # end of Caches
> =

> #
> # CD-ROM/DVD Filesystems
> #
> CONFIG_ISO9660_FS=3Dy
> CONFIG_JOLIET=3Dy
> CONFIG_ZISOFS=3Dy
> # CONFIG_UDF_FS is not set
> # end of CD-ROM/DVD Filesystems
> =

> #
> # DOS/FAT/EXFAT/NT Filesystems
> #
> CONFIG_FAT_FS=3Dy
> CONFIG_MSDOS_FS=3Dy
> CONFIG_VFAT_FS=3Dy
> CONFIG_FAT_DEFAULT_CODEPAGE=3D437
> CONFIG_FAT_DEFAULT_IOCHARSET=3D"iso8859-1"
> # CONFIG_FAT_DEFAULT_UTF8 is not set
> CONFIG_FAT_KUNIT_TEST=3Dy
> CONFIG_EXFAT_FS=3Dy
> CONFIG_EXFAT_DEFAULT_IOCHARSET=3D"utf8"
> CONFIG_NTFS_FS=3Dy
> # CONFIG_NTFS_DEBUG is not set
> CONFIG_NTFS_RW=3Dy
> # CONFIG_NTFS3_FS is not set
> # end of DOS/FAT/EXFAT/NT Filesystems
> =

> #
> # Pseudo filesystems
> #
> CONFIG_PROC_FS=3Dy
> # CONFIG_PROC_KCORE is not set
> CONFIG_PROC_SYSCTL=3Dy
> CONFIG_PROC_PAGE_MONITOR=3Dy
> CONFIG_PROC_CHILDREN=3Dy
> CONFIG_PROC_PID_ARCH_STATUS=3Dy
> CONFIG_PROC_CPU_RESCTRL=3Dy
> CONFIG_KERNFS=3Dy
> CONFIG_SYSFS=3Dy
> CONFIG_TMPFS=3Dy
> # CONFIG_TMPFS_POSIX_ACL is not set
> # CONFIG_TMPFS_XATTR is not set
> CONFIG_HUGETLBFS=3Dy
> CONFIG_HUGETLB_PAGE=3Dy
> CONFIG_MEMFD_CREATE=3Dy
> CONFIG_CONFIGFS_FS=3Dy
> # end of Pseudo filesystems
> =

> CONFIG_MISC_FILESYSTEMS=3Dy
> CONFIG_ORANGEFS_FS=3Dy
> CONFIG_ADFS_FS=3Dy
> # CONFIG_ADFS_FS_RW is not set
> # CONFIG_AFFS_FS is not set
> # CONFIG_ECRYPT_FS is not set
> CONFIG_HFS_FS=3Dy
> # CONFIG_HFSPLUS_FS is not set
> # CONFIG_BEFS_FS is not set
> CONFIG_BFS_FS=3Dy
> CONFIG_EFS_FS=3Dy
> CONFIG_JFFS2_FS=3Dy
> CONFIG_JFFS2_FS_DEBUG=3D0
> # CONFIG_JFFS2_FS_WRITEBUFFER is not set
> CONFIG_JFFS2_SUMMARY=3Dy
> CONFIG_JFFS2_FS_XATTR=3Dy
> # CONFIG_JFFS2_FS_POSIX_ACL is not set
> CONFIG_JFFS2_FS_SECURITY=3Dy
> # CONFIG_JFFS2_COMPRESSION_OPTIONS is not set
> CONFIG_JFFS2_ZLIB=3Dy
> CONFIG_JFFS2_RTIME=3Dy
> CONFIG_CRAMFS=3Dy
> # CONFIG_CRAMFS_BLOCKDEV is not set
> # CONFIG_CRAMFS_MTD is not set
> CONFIG_SQUASHFS=3Dy
> # CONFIG_SQUASHFS_FILE_CACHE is not set
> CONFIG_SQUASHFS_FILE_DIRECT=3Dy
> # CONFIG_SQUASHFS_DECOMP_SINGLE is not set
> # CONFIG_SQUASHFS_DECOMP_MULTI is not set
> CONFIG_SQUASHFS_DECOMP_MULTI_PERCPU=3Dy
> # CONFIG_SQUASHFS_XATTR is not set
> # CONFIG_SQUASHFS_ZLIB is not set
> # CONFIG_SQUASHFS_LZ4 is not set
> CONFIG_SQUASHFS_LZO=3Dy
> CONFIG_SQUASHFS_XZ=3Dy
> # CONFIG_SQUASHFS_ZSTD is not set
> CONFIG_SQUASHFS_4K_DEVBLK_SIZE=3Dy
> # CONFIG_SQUASHFS_EMBEDDED is not set
> CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3D3
> CONFIG_VXFS_FS=3Dy
> # CONFIG_MINIX_FS is not set
> CONFIG_OMFS_FS=3Dy
> CONFIG_HPFS_FS=3Dy
> CONFIG_QNX4FS_FS=3Dy
> # CONFIG_QNX6FS_FS is not set
> CONFIG_ROMFS_FS=3Dy
> CONFIG_ROMFS_BACKED_BY_BLOCK=3Dy
> # CONFIG_ROMFS_BACKED_BY_MTD is not set
> # CONFIG_ROMFS_BACKED_BY_BOTH is not set
> CONFIG_ROMFS_ON_BLOCK=3Dy
> # CONFIG_PSTORE is not set
> CONFIG_SYSV_FS=3Dy
> CONFIG_UFS_FS=3Dy
> # CONFIG_UFS_FS_WRITE is not set
> CONFIG_UFS_DEBUG=3Dy
> # CONFIG_EROFS_FS is not set
> CONFIG_NETWORK_FILESYSTEMS=3Dy
> CONFIG_NFS_FS=3Dy
> CONFIG_NFS_V2=3Dy
> CONFIG_NFS_V3=3Dy
> # CONFIG_NFS_V3_ACL is not set
> CONFIG_NFS_V4=3Dm
> # CONFIG_NFS_SWAP is not set
> # CONFIG_NFS_V4_1 is not set
> # CONFIG_ROOT_NFS is not set
> # CONFIG_NFS_FSCACHE is not set
> # CONFIG_NFS_USE_LEGACY_DNS is not set
> CONFIG_NFS_USE_KERNEL_DNS=3Dy
> CONFIG_NFS_DISABLE_UDP_SUPPORT=3Dy
> # CONFIG_NFSD is not set
> CONFIG_GRACE_PERIOD=3Dy
> CONFIG_LOCKD=3Dy
> CONFIG_LOCKD_V4=3Dy
> CONFIG_NFS_COMMON=3Dy
> CONFIG_SUNRPC=3Dy
> CONFIG_SUNRPC_GSS=3Dm
> # CONFIG_SUNRPC_DEBUG is not set
> # CONFIG_CEPH_FS is not set
> CONFIG_CIFS=3Dm
> CONFIG_CIFS_STATS2=3Dy
> CONFIG_CIFS_ALLOW_INSECURE_LEGACY=3Dy
> # CONFIG_CIFS_UPCALL is not set
> # CONFIG_CIFS_XATTR is not set
> CONFIG_CIFS_DEBUG=3Dy
> # CONFIG_CIFS_DEBUG2 is not set
> # CONFIG_CIFS_DEBUG_DUMP_KEYS is not set
> # CONFIG_CIFS_DFS_UPCALL is not set
> # CONFIG_CIFS_SWN_UPCALL is not set
> # CONFIG_CIFS_FSCACHE is not set
> # CONFIG_SMB_SERVER is not set
> CONFIG_SMBFS_COMMON=3Dm
> # CONFIG_CODA_FS is not set
> # CONFIG_AFS_FS is not set
> # CONFIG_9P_FS is not set
> CONFIG_NLS=3Dy
> CONFIG_NLS_DEFAULT=3D"iso8859-1"
> CONFIG_NLS_CODEPAGE_437=3Dy
> CONFIG_NLS_CODEPAGE_737=3Dy
> # CONFIG_NLS_CODEPAGE_775 is not set
> # CONFIG_NLS_CODEPAGE_850 is not set
> # CONFIG_NLS_CODEPAGE_852 is not set
> CONFIG_NLS_CODEPAGE_855=3Dy
> CONFIG_NLS_CODEPAGE_857=3Dy
> CONFIG_NLS_CODEPAGE_860=3Dy
> CONFIG_NLS_CODEPAGE_861=3Dy
> # CONFIG_NLS_CODEPAGE_862 is not set
> CONFIG_NLS_CODEPAGE_863=3Dy
> # CONFIG_NLS_CODEPAGE_864 is not set
> CONFIG_NLS_CODEPAGE_865=3Dy
> # CONFIG_NLS_CODEPAGE_866 is not set
> # CONFIG_NLS_CODEPAGE_869 is not set
> # CONFIG_NLS_CODEPAGE_936 is not set
> CONFIG_NLS_CODEPAGE_950=3Dy
> # CONFIG_NLS_CODEPAGE_932 is not set
> CONFIG_NLS_CODEPAGE_949=3Dy
> # CONFIG_NLS_CODEPAGE_874 is not set
> # CONFIG_NLS_ISO8859_8 is not set
> CONFIG_NLS_CODEPAGE_1250=3Dy
> CONFIG_NLS_CODEPAGE_1251=3Dy
> # CONFIG_NLS_ASCII is not set
> CONFIG_NLS_ISO8859_1=3Dy
> CONFIG_NLS_ISO8859_2=3Dy
> CONFIG_NLS_ISO8859_3=3Dy
> CONFIG_NLS_ISO8859_4=3Dy
> CONFIG_NLS_ISO8859_5=3Dy
> CONFIG_NLS_ISO8859_6=3Dy
> # CONFIG_NLS_ISO8859_7 is not set
> # CONFIG_NLS_ISO8859_9 is not set
> CONFIG_NLS_ISO8859_13=3Dy
> CONFIG_NLS_ISO8859_14=3Dy
> CONFIG_NLS_ISO8859_15=3Dy
> CONFIG_NLS_KOI8_R=3Dy
> CONFIG_NLS_KOI8_U=3Dy
> CONFIG_NLS_MAC_ROMAN=3Dy
> CONFIG_NLS_MAC_CELTIC=3Dy
> CONFIG_NLS_MAC_CENTEURO=3Dy
> CONFIG_NLS_MAC_CROATIAN=3Dy
> # CONFIG_NLS_MAC_CYRILLIC is not set
> # CONFIG_NLS_MAC_GAELIC is not set
> # CONFIG_NLS_MAC_GREEK is not set
> # CONFIG_NLS_MAC_ICELAND is not set
> CONFIG_NLS_MAC_INUIT=3Dy
> # CONFIG_NLS_MAC_ROMANIAN is not set
> CONFIG_NLS_MAC_TURKISH=3Dy
> CONFIG_NLS_UTF8=3Dy
> # CONFIG_DLM is not set
> # CONFIG_UNICODE is not set
> # end of File systems
> =

> #
> # Security options
> #
> CONFIG_KEYS=3Dy
> # CONFIG_KEYS_REQUEST_CACHE is not set
> # CONFIG_PERSISTENT_KEYRINGS is not set
> CONFIG_TRUSTED_KEYS=3Dy
> CONFIG_ENCRYPTED_KEYS=3Dy
> CONFIG_KEY_DH_OPERATIONS=3Dy
> # CONFIG_SECURITY_DMESG_RESTRICT is not set
> CONFIG_SECURITY=3Dy
> # CONFIG_SECURITYFS is not set
> # CONFIG_SECURITY_NETWORK is not set
> # CONFIG_SECURITY_PATH is not set
> CONFIG_FORTIFY_SOURCE=3Dy
> # CONFIG_STATIC_USERMODEHELPER is not set
> # CONFIG_SECURITY_SMACK is not set
> # CONFIG_SECURITY_TOMOYO is not set
> # CONFIG_SECURITY_APPARMOR is not set
> # CONFIG_SECURITY_LOADPIN is not set
> # CONFIG_SECURITY_YAMA is not set
> # CONFIG_SECURITY_SAFESETID is not set
> # CONFIG_SECURITY_LOCKDOWN_LSM is not set
> # CONFIG_SECURITY_LANDLOCK is not set
> CONFIG_INTEGRITY=3Dy
> # CONFIG_INTEGRITY_SIGNATURE is not set
> # CONFIG_IMA is not set
> # CONFIG_EVM is not set
> CONFIG_DEFAULT_SECURITY_DAC=3Dy
> CONFIG_LSM=3D"landlock,lockdown,yama,loadpin,safesetid,integrity,bpf"
> =

> #
> # Kernel hardening options
> #
> =

> #
> # Memory initialization
> #
> CONFIG_INIT_STACK_NONE=3Dy
> # CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
> # CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
> # end of Memory initialization
> # end of Kernel hardening options
> # end of Security options
> =

> CONFIG_XOR_BLOCKS=3Dy
> CONFIG_ASYNC_CORE=3Dy
> CONFIG_ASYNC_MEMCPY=3Dy
> CONFIG_ASYNC_XOR=3Dy
> CONFIG_ASYNC_PQ=3Dy
> CONFIG_ASYNC_RAID6_RECOV=3Dy
> CONFIG_CRYPTO=3Dy
> =

> #
> # Crypto core or helper
> #
> CONFIG_CRYPTO_ALGAPI=3Dy
> CONFIG_CRYPTO_ALGAPI2=3Dy
> CONFIG_CRYPTO_AEAD=3Dy
> CONFIG_CRYPTO_AEAD2=3Dy
> CONFIG_CRYPTO_SKCIPHER=3Dy
> CONFIG_CRYPTO_SKCIPHER2=3Dy
> CONFIG_CRYPTO_HASH=3Dy
> CONFIG_CRYPTO_HASH2=3Dy
> CONFIG_CRYPTO_RNG=3Dy
> CONFIG_CRYPTO_RNG2=3Dy
> CONFIG_CRYPTO_RNG_DEFAULT=3Dy
> CONFIG_CRYPTO_AKCIPHER2=3Dy
> CONFIG_CRYPTO_AKCIPHER=3Dy
> CONFIG_CRYPTO_KPP2=3Dy
> CONFIG_CRYPTO_KPP=3Dy
> CONFIG_CRYPTO_ACOMP2=3Dy
> CONFIG_CRYPTO_MANAGER=3Dy
> CONFIG_CRYPTO_MANAGER2=3Dy
> # CONFIG_CRYPTO_USER is not set
> CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
> CONFIG_CRYPTO_GF128MUL=3Dy
> CONFIG_CRYPTO_NULL=3Dy
> CONFIG_CRYPTO_NULL2=3Dy
> # CONFIG_CRYPTO_PCRYPT is not set
> CONFIG_CRYPTO_CRYPTD=3Dy
> CONFIG_CRYPTO_AUTHENC=3Dy
> CONFIG_CRYPTO_TEST=3Dy
> CONFIG_CRYPTO_SIMD=3Dy
> =

> #
> # Public-key cryptography
> #
> CONFIG_CRYPTO_RSA=3Dy
> CONFIG_CRYPTO_DH=3Dy
> CONFIG_CRYPTO_ECC=3Dy
> # CONFIG_CRYPTO_ECDH is not set
> # CONFIG_CRYPTO_ECDSA is not set
> CONFIG_CRYPTO_ECRDSA=3Dy
> CONFIG_CRYPTO_SM2=3Dy
> # CONFIG_CRYPTO_CURVE25519 is not set
> =

> #
> # Authenticated Encryption with Associated Data
> #
> CONFIG_CRYPTO_CCM=3Dm
> CONFIG_CRYPTO_GCM=3Dy
> # CONFIG_CRYPTO_CHACHA20POLY1305 is not set
> # CONFIG_CRYPTO_AEGIS128 is not set
> # CONFIG_CRYPTO_SEQIV is not set
> CONFIG_CRYPTO_ECHAINIV=3Dy
> =

> #
> # Block modes
> #
> CONFIG_CRYPTO_CBC=3Dy
> CONFIG_CRYPTO_CFB=3Dy
> CONFIG_CRYPTO_CTR=3Dy
> CONFIG_CRYPTO_CTS=3Dy
> CONFIG_CRYPTO_ECB=3Dy
> CONFIG_CRYPTO_LRW=3Dy
> CONFIG_CRYPTO_OFB=3Dy
> CONFIG_CRYPTO_PCBC=3Dy
> CONFIG_CRYPTO_XTS=3Dy
> # CONFIG_CRYPTO_KEYWRAP is not set
> CONFIG_CRYPTO_NHPOLY1305=3Dy
> CONFIG_CRYPTO_ADIANTUM=3Dy
> CONFIG_CRYPTO_ESSIV=3Dy
> =

> #
> # Hash modes
> #
> CONFIG_CRYPTO_CMAC=3Dy
> CONFIG_CRYPTO_HMAC=3Dy
> CONFIG_CRYPTO_XCBC=3Dy
> CONFIG_CRYPTO_VMAC=3Dy
> =

> #
> # Digest
> #
> CONFIG_CRYPTO_CRC32C=3Dy
> # CONFIG_CRYPTO_CRC32C_INTEL is not set
> CONFIG_CRYPTO_CRC32=3Dy
> # CONFIG_CRYPTO_CRC32_PCLMUL is not set
> CONFIG_CRYPTO_XXHASH=3Dy
> CONFIG_CRYPTO_BLAKE2B=3Dy
> CONFIG_CRYPTO_BLAKE2S=3Dy
> CONFIG_CRYPTO_CRCT10DIF=3Dy
> CONFIG_CRYPTO_GHASH=3Dy
> # CONFIG_CRYPTO_POLY1305 is not set
> CONFIG_CRYPTO_MD4=3Dy
> CONFIG_CRYPTO_MD5=3Dy
> # CONFIG_CRYPTO_MICHAEL_MIC is not set
> CONFIG_CRYPTO_RMD160=3Dy
> CONFIG_CRYPTO_SHA1=3Dy
> CONFIG_CRYPTO_SHA256=3Dy
> CONFIG_CRYPTO_SHA512=3Dy
> # CONFIG_CRYPTO_SHA3 is not set
> CONFIG_CRYPTO_SM3=3Dy
> CONFIG_CRYPTO_STREEBOG=3Dy
> CONFIG_CRYPTO_WP512=3Dy
> =

> #
> # Ciphers
> #
> CONFIG_CRYPTO_AES=3Dy
> CONFIG_CRYPTO_AES_TI=3Dy
> # CONFIG_CRYPTO_AES_NI_INTEL is not set
> CONFIG_CRYPTO_BLOWFISH=3Dy
> CONFIG_CRYPTO_BLOWFISH_COMMON=3Dy
> CONFIG_CRYPTO_CAMELLIA=3Dy
> CONFIG_CRYPTO_CAST_COMMON=3Dy
> # CONFIG_CRYPTO_CAST5 is not set
> CONFIG_CRYPTO_CAST6=3Dy
> # CONFIG_CRYPTO_DES is not set
> CONFIG_CRYPTO_FCRYPT=3Dy
> CONFIG_CRYPTO_CHACHA20=3Dy
> CONFIG_CRYPTO_SERPENT=3Dy
> CONFIG_CRYPTO_SERPENT_SSE2_586=3Dy
> CONFIG_CRYPTO_SM4=3Dy
> CONFIG_CRYPTO_TWOFISH=3Dy
> CONFIG_CRYPTO_TWOFISH_COMMON=3Dy
> CONFIG_CRYPTO_TWOFISH_586=3Dy
> =

> #
> # Compression
> #
> CONFIG_CRYPTO_DEFLATE=3Dy
> CONFIG_CRYPTO_LZO=3Dy
> # CONFIG_CRYPTO_842 is not set
> # CONFIG_CRYPTO_LZ4 is not set
> CONFIG_CRYPTO_LZ4HC=3Dy
> # CONFIG_CRYPTO_ZSTD is not set
> =

> #
> # Random Number Generation
> #
> # CONFIG_CRYPTO_ANSI_CPRNG is not set
> CONFIG_CRYPTO_DRBG_MENU=3Dy
> CONFIG_CRYPTO_DRBG_HMAC=3Dy
> CONFIG_CRYPTO_DRBG_HASH=3Dy
> # CONFIG_CRYPTO_DRBG_CTR is not set
> CONFIG_CRYPTO_DRBG=3Dy
> CONFIG_CRYPTO_JITTERENTROPY=3Dy
> CONFIG_CRYPTO_KDF800108_CTR=3Dy
> # CONFIG_CRYPTO_USER_API_HASH is not set
> # CONFIG_CRYPTO_USER_API_SKCIPHER is not set
> # CONFIG_CRYPTO_USER_API_RNG is not set
> # CONFIG_CRYPTO_USER_API_AEAD is not set
> CONFIG_CRYPTO_HASH_INFO=3Dy
> # CONFIG_CRYPTO_HW is not set
> CONFIG_ASYMMETRIC_KEY_TYPE=3Dy
> CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=3Dy
> CONFIG_ASYMMETRIC_TPM_KEY_SUBTYPE=3Dy
> CONFIG_X509_CERTIFICATE_PARSER=3Dy
> CONFIG_PKCS8_PRIVATE_KEY_PARSER=3Dy
> CONFIG_TPM_KEY_PARSER=3Dy
> CONFIG_PKCS7_MESSAGE_PARSER=3Dy
> # CONFIG_PKCS7_TEST_KEY is not set
> # CONFIG_SIGNED_PE_FILE_VERIFICATION is not set
> =

> #
> # Certificates for signature checking
> #
> CONFIG_SYSTEM_TRUSTED_KEYRING=3Dy
> CONFIG_SYSTEM_TRUSTED_KEYS=3D""
> CONFIG_SYSTEM_EXTRA_CERTIFICATE=3Dy
> CONFIG_SYSTEM_EXTRA_CERTIFICATE_SIZE=3D4096
> CONFIG_SECONDARY_TRUSTED_KEYRING=3Dy
> # CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
> # end of Certificates for signature checking
> =

> CONFIG_BINARY_PRINTF=3Dy
> =

> #
> # Library routines
> #
> CONFIG_RAID6_PQ=3Dy
> # CONFIG_RAID6_PQ_BENCHMARK is not set
> CONFIG_LINEAR_RANGES=3Dy
> # CONFIG_PACKING is not set
> CONFIG_BITREVERSE=3Dy
> CONFIG_GENERIC_STRNCPY_FROM_USER=3Dy
> CONFIG_GENERIC_STRNLEN_USER=3Dy
> CONFIG_GENERIC_NET_UTILS=3Dy
> # CONFIG_CORDIC is not set
> CONFIG_PRIME_NUMBERS=3Dy
> CONFIG_RATIONAL=3Dy
> CONFIG_GENERIC_PCI_IOMAP=3Dy
> CONFIG_GENERIC_IOMAP=3Dy
> CONFIG_ARCH_HAS_FAST_MULTIPLIER=3Dy
> CONFIG_ARCH_USE_SYM_ANNOTATIONS=3Dy
> =

> #
> # Crypto library routines
> #
> CONFIG_CRYPTO_LIB_AES=3Dy
> CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=3Dy
> CONFIG_CRYPTO_LIB_CHACHA_GENERIC=3Dy
> CONFIG_CRYPTO_LIB_CHACHA=3Dy
> CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=3Dy
> CONFIG_CRYPTO_LIB_CURVE25519=3Dy
> CONFIG_CRYPTO_LIB_POLY1305_RSIZE=3D1
> CONFIG_CRYPTO_LIB_POLY1305_GENERIC=3Dy
> # CONFIG_CRYPTO_LIB_POLY1305 is not set
> # CONFIG_CRYPTO_LIB_CHACHA20POLY1305 is not set
> CONFIG_CRYPTO_LIB_SHA256=3Dy
> CONFIG_CRYPTO_LIB_SM4=3Dy
> # end of Crypto library routines
> =

> CONFIG_CRC_CCITT=3Dy
> CONFIG_CRC16=3Dy
> CONFIG_CRC_T10DIF=3Dy
> CONFIG_CRC_ITU_T=3Dy
> CONFIG_CRC32=3Dy
> CONFIG_CRC32_SELFTEST=3Dy
> CONFIG_CRC32_SLICEBY8=3Dy
> # CONFIG_CRC32_SLICEBY4 is not set
> # CONFIG_CRC32_SARWATE is not set
> # CONFIG_CRC32_BIT is not set
> CONFIG_CRC64=3Dy
> # CONFIG_CRC4 is not set
> CONFIG_CRC7=3Dy
> CONFIG_LIBCRC32C=3Dy
> CONFIG_CRC8=3Dy
> CONFIG_XXHASH=3Dy
> CONFIG_RANDOM32_SELFTEST=3Dy
> CONFIG_ZLIB_INFLATE=3Dy
> CONFIG_ZLIB_DEFLATE=3Dy
> CONFIG_LZO_COMPRESS=3Dy
> CONFIG_LZO_DECOMPRESS=3Dy
> CONFIG_LZ4_COMPRESS=3Dy
> CONFIG_LZ4HC_COMPRESS=3Dy
> CONFIG_LZ4_DECOMPRESS=3Dy
> CONFIG_ZSTD_COMPRESS=3Dy
> CONFIG_ZSTD_DECOMPRESS=3Dy
> CONFIG_XZ_DEC=3Dy
> # CONFIG_XZ_DEC_X86 is not set
> CONFIG_XZ_DEC_POWERPC=3Dy
> # CONFIG_XZ_DEC_IA64 is not set
> # CONFIG_XZ_DEC_ARM is not set
> # CONFIG_XZ_DEC_ARMTHUMB is not set
> # CONFIG_XZ_DEC_SPARC is not set
> # CONFIG_XZ_DEC_MICROLZMA is not set
> CONFIG_XZ_DEC_BCJ=3Dy
> # CONFIG_XZ_DEC_TEST is not set
> CONFIG_DECOMPRESS_GZIP=3Dy
> CONFIG_DECOMPRESS_XZ=3Dy
> CONFIG_GENERIC_ALLOCATOR=3Dy
> CONFIG_REED_SOLOMON=3Dy
> CONFIG_REED_SOLOMON_DEC16=3Dy
> CONFIG_BCH=3Dy
> CONFIG_XARRAY_MULTI=3Dy
> CONFIG_ASSOCIATIVE_ARRAY=3Dy
> CONFIG_HAS_IOMEM=3Dy
> CONFIG_HAS_IOPORT_MAP=3Dy
> CONFIG_HAS_DMA=3Dy
> CONFIG_NEED_SG_DMA_LENGTH=3Dy
> CONFIG_DMA_DECLARE_COHERENT=3Dy
> # CONFIG_DMA_API_DEBUG is not set
> CONFIG_DMA_MAP_BENCHMARK=3Dy
> CONFIG_SGL_ALLOC=3Dy
> # CONFIG_CPUMASK_OFFSTACK is not set
> CONFIG_CPU_RMAP=3Dy
> CONFIG_DQL=3Dy
> CONFIG_GLOB=3Dy
> # CONFIG_GLOB_SELFTEST is not set
> CONFIG_NLATTR=3Dy
> CONFIG_CLZ_TAB=3Dy
> CONFIG_IRQ_POLL=3Dy
> CONFIG_MPILIB=3Dy
> CONFIG_LIBFDT=3Dy
> CONFIG_OID_REGISTRY=3Dy
> CONFIG_HAVE_GENERIC_VDSO=3Dy
> CONFIG_GENERIC_GETTIMEOFDAY=3Dy
> CONFIG_GENERIC_VDSO_32=3Dy
> CONFIG_GENERIC_VDSO_TIME_NS=3Dy
> CONFIG_SG_POOL=3Dy
> CONFIG_ARCH_STACKWALK=3Dy
> CONFIG_STACKDEPOT=3Dy
> CONFIG_STACK_HASH_ORDER=3D20
> CONFIG_SBITMAP=3Dy
> # end of Library routines
> =

> CONFIG_ASN1_ENCODER=3Dy
> =

> #
> # Kernel hacking
> #
> =

> #
> # printk and dmesg options
> #
> CONFIG_PRINTK_TIME=3Dy
> CONFIG_PRINTK_CALLER=3Dy
> # CONFIG_STACKTRACE_BUILD_ID is not set
> CONFIG_CONSOLE_LOGLEVEL_DEFAULT=3D7
> CONFIG_CONSOLE_LOGLEVEL_QUIET=3D4
> CONFIG_MESSAGE_LOGLEVEL_DEFAULT=3D4
> # CONFIG_BOOT_PRINTK_DELAY is not set
> # CONFIG_DYNAMIC_DEBUG is not set
> # CONFIG_DYNAMIC_DEBUG_CORE is not set
> # CONFIG_SYMBOLIC_ERRNAME is not set
> CONFIG_DEBUG_BUGVERBOSE=3Dy
> # end of printk and dmesg options
> =

> #
> # Compile-time checks and compiler options
> #
> CONFIG_DEBUG_INFO=3Dy
> CONFIG_DEBUG_INFO_REDUCED=3Dy
> # CONFIG_DEBUG_INFO_COMPRESSED is not set
> # CONFIG_DEBUG_INFO_SPLIT is not set
> CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=3Dy
> # CONFIG_DEBUG_INFO_DWARF4 is not set
> # CONFIG_DEBUG_INFO_DWARF5 is not set
> CONFIG_PAHOLE_HAS_SPLIT_BTF=3Dy
> # CONFIG_GDB_SCRIPTS is not set
> CONFIG_FRAME_WARN=3D1024
> CONFIG_STRIP_ASM_SYMS=3Dy
> # CONFIG_READABLE_ASM is not set
> # CONFIG_HEADERS_INSTALL is not set
> CONFIG_DEBUG_SECTION_MISMATCH=3Dy
> CONFIG_SECTION_MISMATCH_WARN_ONLY=3Dy
> # CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_64B is not set
> CONFIG_FRAME_POINTER=3Dy
> # CONFIG_VMLINUX_MAP is not set
> CONFIG_DEBUG_FORCE_WEAK_PER_CPU=3Dy
> # end of Compile-time checks and compiler options
> =

> #
> # Generic Kernel Debugging Instruments
> #
> CONFIG_MAGIC_SYSRQ=3Dy
> CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=3D0x1
> CONFIG_MAGIC_SYSRQ_SERIAL=3Dy
> CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=3D""
> CONFIG_DEBUG_FS=3Dy
> # CONFIG_DEBUG_FS_ALLOW_ALL is not set
> # CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
> CONFIG_DEBUG_FS_ALLOW_NONE=3Dy
> CONFIG_HAVE_ARCH_KGDB=3Dy
> # CONFIG_KGDB is not set
> CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=3Dy
> CONFIG_UBSAN=3Dy
> # CONFIG_UBSAN_TRAP is not set
> CONFIG_CC_HAS_UBSAN_BOUNDS=3Dy
> CONFIG_UBSAN_BOUNDS=3Dy
> CONFIG_UBSAN_ONLY_BOUNDS=3Dy
> CONFIG_UBSAN_SHIFT=3Dy
> # CONFIG_UBSAN_DIV_ZERO is not set
> # CONFIG_UBSAN_UNREACHABLE is not set
> # CONFIG_UBSAN_BOOL is not set
> # CONFIG_UBSAN_ENUM is not set
> # CONFIG_UBSAN_ALIGNMENT is not set
> CONFIG_UBSAN_SANITIZE_ALL=3Dy
> # CONFIG_TEST_UBSAN is not set
> # end of Generic Kernel Debugging Instruments
> =

> CONFIG_DEBUG_KERNEL=3Dy
> # CONFIG_DEBUG_MISC is not set
> =

> #
> # Networking Debugging
> #
> # CONFIG_NET_DEV_REFCNT_TRACKER is not set
> # CONFIG_NET_NS_REFCNT_TRACKER is not set
> # end of Networking Debugging
> =

> #
> # Memory Debugging
> #
> CONFIG_PAGE_EXTENSION=3Dy
> # CONFIG_DEBUG_PAGEALLOC is not set
> # CONFIG_PAGE_OWNER is not set
> CONFIG_PAGE_POISONING=3Dy
> CONFIG_DEBUG_PAGE_REF=3Dy
> CONFIG_DEBUG_RODATA_TEST=3Dy
> CONFIG_ARCH_HAS_DEBUG_WX=3Dy
> # CONFIG_DEBUG_WX is not set
> CONFIG_GENERIC_PTDUMP=3Dy
> CONFIG_PTDUMP_CORE=3Dy
> CONFIG_PTDUMP_DEBUGFS=3Dy
> CONFIG_DEBUG_OBJECTS=3Dy
> CONFIG_DEBUG_OBJECTS_SELFTEST=3Dy
> CONFIG_DEBUG_OBJECTS_FREE=3Dy
> # CONFIG_DEBUG_OBJECTS_TIMERS is not set
> CONFIG_DEBUG_OBJECTS_WORK=3Dy
> # CONFIG_DEBUG_OBJECTS_RCU_HEAD is not set
> CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER=3Dy
> CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=3D1
> CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
> # CONFIG_DEBUG_KMEMLEAK is not set
> # CONFIG_DEBUG_STACK_USAGE is not set
> # CONFIG_SCHED_STACK_END_CHECK is not set
> CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=3Dy
> CONFIG_DEBUG_VM=3Dy
> # CONFIG_DEBUG_VM_VMACACHE is not set
> CONFIG_DEBUG_VM_RB=3Dy
> CONFIG_DEBUG_VM_PGFLAGS=3Dy
> CONFIG_DEBUG_VM_PGTABLE=3Dy
> CONFIG_ARCH_HAS_DEBUG_VIRTUAL=3Dy
> # CONFIG_DEBUG_VIRTUAL is not set
> # CONFIG_DEBUG_MEMORY_INIT is not set
> CONFIG_DEBUG_PER_CPU_MAPS=3Dy
> CONFIG_DEBUG_KMAP_LOCAL=3Dy
> CONFIG_ARCH_SUPPORTS_KMAP_LOCAL_FORCE_MAP=3Dy
> # CONFIG_DEBUG_KMAP_LOCAL_FORCE_MAP is not set
> # CONFIG_DEBUG_HIGHMEM is not set
> CONFIG_HAVE_DEBUG_STACKOVERFLOW=3Dy
> # CONFIG_DEBUG_STACKOVERFLOW is not set
> CONFIG_CC_HAS_KASAN_GENERIC=3Dy
> CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=3Dy
> CONFIG_HAVE_ARCH_KFENCE=3Dy
> # end of Memory Debugging
> =

> # CONFIG_DEBUG_SHIRQ is not set
> =

> #
> # Debug Oops, Lockups and Hangs
> #
> CONFIG_PANIC_ON_OOPS=3Dy
> CONFIG_PANIC_ON_OOPS_VALUE=3D1
> CONFIG_PANIC_TIMEOUT=3D0
> CONFIG_LOCKUP_DETECTOR=3Dy
> CONFIG_SOFTLOCKUP_DETECTOR=3Dy
> CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=3Dy
> CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=3D1
> CONFIG_HARDLOCKUP_DETECTOR_PERF=3Dy
> CONFIG_HARDLOCKUP_DETECTOR=3Dy
> # CONFIG_BOOTPARAM_HARDLOCKUP_PANIC is not set
> CONFIG_BOOTPARAM_HARDLOCKUP_PANIC_VALUE=3D0
> CONFIG_DETECT_HUNG_TASK=3Dy
> CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=3D480
> CONFIG_BOOTPARAM_HUNG_TASK_PANIC=3Dy
> CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=3D1
> CONFIG_WQ_WATCHDOG=3Dy
> # CONFIG_TEST_LOCKUP is not set
> # end of Debug Oops, Lockups and Hangs
> =

> #
> # Scheduler Debugging
> #
> CONFIG_SCHED_DEBUG=3Dy
> CONFIG_SCHED_INFO=3Dy
> CONFIG_SCHEDSTATS=3Dy
> # end of Scheduler Debugging
> =

> CONFIG_DEBUG_TIMEKEEPING=3Dy
> =

> #
> # Lock Debugging (spinlocks, mutexes, etc...)
> #
> CONFIG_LOCK_DEBUGGING_SUPPORT=3Dy
> CONFIG_PROVE_LOCKING=3Dy
> # CONFIG_PROVE_RAW_LOCK_NESTING is not set
> # CONFIG_LOCK_STAT is not set
> CONFIG_DEBUG_RT_MUTEXES=3Dy
> CONFIG_DEBUG_SPINLOCK=3Dy
> CONFIG_DEBUG_MUTEXES=3Dy
> CONFIG_DEBUG_WW_MUTEX_SLOWPATH=3Dy
> CONFIG_DEBUG_RWSEMS=3Dy
> CONFIG_DEBUG_LOCK_ALLOC=3Dy
> CONFIG_LOCKDEP=3Dy
> CONFIG_LOCKDEP_BITS=3D15
> CONFIG_LOCKDEP_CHAINS_BITS=3D16
> CONFIG_LOCKDEP_STACK_TRACE_BITS=3D19
> CONFIG_LOCKDEP_STACK_TRACE_HASH_BITS=3D14
> CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=3D12
> # CONFIG_DEBUG_LOCKDEP is not set
> CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
> # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
> CONFIG_LOCK_TORTURE_TEST=3Dm
> CONFIG_WW_MUTEX_SELFTEST=3Dy
> # CONFIG_SCF_TORTURE_TEST is not set
> # end of Lock Debugging (spinlocks, mutexes, etc...)
> =

> CONFIG_TRACE_IRQFLAGS=3Dy
> CONFIG_TRACE_IRQFLAGS_NMI=3Dy
> # CONFIG_DEBUG_IRQFLAGS is not set
> CONFIG_STACKTRACE=3Dy
> # CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
> # CONFIG_DEBUG_KOBJECT is not set
> =

> #
> # Debug kernel data structures
> #
> CONFIG_DEBUG_LIST=3Dy
> # CONFIG_DEBUG_PLIST is not set
> CONFIG_DEBUG_SG=3Dy
> CONFIG_DEBUG_NOTIFIERS=3Dy
> CONFIG_BUG_ON_DATA_CORRUPTION=3Dy
> # end of Debug kernel data structures
> =

> CONFIG_DEBUG_CREDENTIALS=3Dy
> =

> #
> # RCU Debugging
> #
> CONFIG_PROVE_RCU=3Dy
> # CONFIG_PROVE_RCU_LIST is not set
> CONFIG_TORTURE_TEST=3Dm
> CONFIG_RCU_SCALE_TEST=3Dm
> CONFIG_RCU_TORTURE_TEST=3Dm
> # CONFIG_RCU_REF_SCALE_TEST is not set
> CONFIG_RCU_CPU_STALL_TIMEOUT=3D21
> # CONFIG_RCU_TRACE is not set
> CONFIG_RCU_EQS_DEBUG=3Dy
> # end of RCU Debugging
> =

> CONFIG_DEBUG_WQ_FORCE_RR_CPU=3Dy
> CONFIG_CPU_HOTPLUG_STATE_CONTROL=3Dy
> CONFIG_LATENCYTOP=3Dy
> CONFIG_USER_STACKTRACE_SUPPORT=3Dy
> CONFIG_NOP_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=3Dy
> CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
> CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy
> CONFIG_HAVE_C_RECORDMCOUNT=3Dy
> CONFIG_BUILDTIME_MCOUNT_SORT=3Dy
> CONFIG_TRACER_MAX_TRACE=3Dy
> CONFIG_TRACE_CLOCK=3Dy
> CONFIG_RING_BUFFER=3Dy
> CONFIG_EVENT_TRACING=3Dy
> CONFIG_CONTEXT_SWITCH_TRACER=3Dy
> CONFIG_RING_BUFFER_ALLOW_SWAP=3Dy
> CONFIG_PREEMPTIRQ_TRACEPOINTS=3Dy
> CONFIG_TRACING=3Dy
> CONFIG_GENERIC_TRACER=3Dy
> CONFIG_TRACING_SUPPORT=3Dy
> CONFIG_FTRACE=3Dy
> # CONFIG_BOOTTIME_TRACING is not set
> # CONFIG_FUNCTION_TRACER is not set
> # CONFIG_STACK_TRACER is not set
> CONFIG_IRQSOFF_TRACER=3Dy
> CONFIG_SCHED_TRACER=3Dy
> # CONFIG_HWLAT_TRACER is not set
> CONFIG_OSNOISE_TRACER=3Dy
> CONFIG_TIMERLAT_TRACER=3Dy
> CONFIG_MMIOTRACE=3Dy
> # CONFIG_FTRACE_SYSCALLS is not set
> CONFIG_TRACER_SNAPSHOT=3Dy
> CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP=3Dy
> CONFIG_BRANCH_PROFILE_NONE=3Dy
> # CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
> # CONFIG_BLK_DEV_IO_TRACE is not set
> # CONFIG_UPROBE_EVENTS is not set
> CONFIG_DYNAMIC_EVENTS=3Dy
> CONFIG_TRACING_MAP=3Dy
> CONFIG_SYNTH_EVENTS=3Dy
> CONFIG_HIST_TRIGGERS=3Dy
> # CONFIG_TRACE_EVENT_INJECT is not set
> # CONFIG_TRACEPOINT_BENCHMARK is not set
> CONFIG_RING_BUFFER_BENCHMARK=3Dy
> CONFIG_TRACE_EVAL_MAP_FILE=3Dy
> CONFIG_GCOV_PROFILE_FTRACE=3Dy
> # CONFIG_FTRACE_STARTUP_TEST is not set
> # CONFIG_RING_BUFFER_STARTUP_TEST is not set
> # CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS is not set
> # CONFIG_MMIOTRACE_TEST is not set
> # CONFIG_PREEMPTIRQ_DELAY_TEST is not set
> CONFIG_SYNTH_EVENT_GEN_TEST=3Dy
> CONFIG_HIST_TRIGGERS_DEBUG=3Dy
> # CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
> CONFIG_SAMPLES=3Dy
> CONFIG_SAMPLE_AUXDISPLAY=3Dy
> # CONFIG_SAMPLE_TRACE_EVENTS is not set
> # CONFIG_SAMPLE_TRACE_PRINTK is not set
> # CONFIG_SAMPLE_TRACE_ARRAY is not set
> # CONFIG_SAMPLE_KOBJECT is not set
> # CONFIG_SAMPLE_HW_BREAKPOINT is not set
> # CONFIG_SAMPLE_KFIFO is not set
> # CONFIG_SAMPLE_RPMSG_CLIENT is not set
> # CONFIG_SAMPLE_CONFIGFS is not set
> # CONFIG_SAMPLE_VFIO_MDEV_MTTY is not set
> # CONFIG_SAMPLE_VFIO_MDEV_MDPY is not set
> # CONFIG_SAMPLE_VFIO_MDEV_MBOCHS is not set
> # CONFIG_SAMPLE_WATCHDOG is not set
> CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=3Dy
> =

> #
> # x86 Debugging
> #
> CONFIG_TRACE_IRQFLAGS_NMI_SUPPORT=3Dy
> CONFIG_EARLY_PRINTK_USB=3Dy
> CONFIG_X86_VERBOSE_BOOTUP=3Dy
> CONFIG_EARLY_PRINTK=3Dy
> CONFIG_EARLY_PRINTK_DBGP=3Dy
> CONFIG_EARLY_PRINTK_USB_XDBC=3Dy
> CONFIG_DEBUG_TLBFLUSH=3Dy
> CONFIG_HAVE_MMIOTRACE_SUPPORT=3Dy
> # CONFIG_X86_DECODER_SELFTEST is not set
> CONFIG_IO_DELAY_0X80=3Dy
> # CONFIG_IO_DELAY_0XED is not set
> # CONFIG_IO_DELAY_UDELAY is not set
> # CONFIG_IO_DELAY_NONE is not set
> # CONFIG_DEBUG_BOOT_PARAMS is not set
> # CONFIG_CPA_DEBUG is not set
> CONFIG_DEBUG_ENTRY=3Dy
> # CONFIG_DEBUG_NMI_SELFTEST is not set
> # CONFIG_X86_DEBUG_FPU is not set
> CONFIG_PUNIT_ATOM_DEBUG=3Dy
> CONFIG_UNWINDER_FRAME_POINTER=3Dy
> # end of x86 Debugging
> =

> #
> # Kernel Testing and Coverage
> #
> CONFIG_KUNIT=3Dy
> # CONFIG_KUNIT_DEBUGFS is not set
> CONFIG_KUNIT_TEST=3Dy
> CONFIG_KUNIT_EXAMPLE_TEST=3Dy
> # CONFIG_KUNIT_ALL_TESTS is not set
> CONFIG_NOTIFIER_ERROR_INJECTION=3Dy
> CONFIG_PM_NOTIFIER_ERROR_INJECT=3Dy
> CONFIG_OF_RECONFIG_NOTIFIER_ERROR_INJECT=3Dy
> # CONFIG_NETDEV_NOTIFIER_ERROR_INJECT is not set
> CONFIG_FAULT_INJECTION=3Dy
> CONFIG_FAIL_PAGE_ALLOC=3Dy
> # CONFIG_FAULT_INJECTION_USERCOPY is not set
> CONFIG_FAIL_MAKE_REQUEST=3Dy
> CONFIG_FAIL_IO_TIMEOUT=3Dy
> CONFIG_FAIL_FUTEX=3Dy
> # CONFIG_FAULT_INJECTION_DEBUG_FS is not set
> CONFIG_CC_HAS_SANCOV_TRACE_PC=3Dy
> CONFIG_RUNTIME_TESTING_MENU=3Dy
> # CONFIG_LKDTM is not set
> # CONFIG_TEST_LIST_SORT is not set
> # CONFIG_TEST_MIN_HEAP is not set
> # CONFIG_TEST_SORT is not set
> CONFIG_TEST_DIV64=3Dy
> # CONFIG_BACKTRACE_SELF_TEST is not set
> # CONFIG_TEST_REF_TRACKER is not set
> # CONFIG_RBTREE_TEST is not set
> # CONFIG_REED_SOLOMON_TEST is not set
> # CONFIG_INTERVAL_TREE_TEST is not set
> # CONFIG_PERCPU_TEST is not set
> # CONFIG_ATOMIC64_SELFTEST is not set
> # CONFIG_ASYNC_RAID6_TEST is not set
> # CONFIG_TEST_HEXDUMP is not set
> CONFIG_STRING_SELFTEST=3Dy
> # CONFIG_TEST_STRING_HELPERS is not set
> CONFIG_TEST_STRSCPY=3Dy
> # CONFIG_TEST_KSTRTOX is not set
> # CONFIG_TEST_PRINTF is not set
> CONFIG_TEST_SCANF=3Dy
> CONFIG_TEST_BITMAP=3Dy
> # CONFIG_TEST_UUID is not set
> # CONFIG_TEST_XARRAY is not set
> # CONFIG_TEST_OVERFLOW is not set
> # CONFIG_TEST_RHASHTABLE is not set
> # CONFIG_TEST_SIPHASH is not set
> # CONFIG_TEST_IDA is not set
> # CONFIG_TEST_LKM is not set
> # CONFIG_TEST_BITOPS is not set
> # CONFIG_TEST_VMALLOC is not set
> # CONFIG_TEST_USER_COPY is not set
> # CONFIG_TEST_BPF is not set
> # CONFIG_TEST_BLACKHOLE_DEV is not set
> # CONFIG_FIND_BIT_BENCHMARK is not set
> # CONFIG_TEST_FIRMWARE is not set
> # CONFIG_TEST_SYSCTL is not set
> # CONFIG_BITFIELD_KUNIT is not set
> # CONFIG_HASH_KUNIT_TEST is not set
> # CONFIG_RESOURCE_KUNIT_TEST is not set
> # CONFIG_SYSCTL_KUNIT_TEST is not set
> CONFIG_LIST_KUNIT_TEST=3Dy
> CONFIG_LINEAR_RANGES_TEST=3Dy
> CONFIG_CMDLINE_KUNIT_TEST=3Dy
> CONFIG_BITS_TEST=3Dy
> CONFIG_RATIONAL_KUNIT_TEST=3Dy
> CONFIG_MEMCPY_KUNIT_TEST=3Dy
> # CONFIG_TEST_UDELAY is not set
> # CONFIG_TEST_STATIC_KEYS is not set
> # CONFIG_TEST_KMOD is not set
> # CONFIG_TEST_MEMCAT_P is not set
> CONFIG_TEST_STACKINIT=3Dy
> # CONFIG_TEST_MEMINIT is not set
> CONFIG_TEST_FREE_PAGES=3Dy
> # CONFIG_TEST_FPU is not set
> # CONFIG_TEST_CLOCKSOURCE_WATCHDOG is not set
> CONFIG_ARCH_USE_MEMTEST=3Dy
> # CONFIG_MEMTEST is not set
> # end of Kernel Testing and Coverage
> # end of Kernel hacking

> #!/bin/sh
> =

> export_top_env()
> {
> 	export suite=3D'rcutorture'
> 	export testcase=3D'rcutorture'
> 	export category=3D'functional'
> 	export need_memory=3D'300MB'
> 	export runtime=3D300
> 	export job_origin=3D'rcutorture.yaml'
> 	export queue_cmdline_keys=3D'branch
> commit'
> 	export queue=3D'validate'
> 	export testbox=3D'vm-snb-i386-109'
> 	export tbox_group=3D'vm-snb-i386'
> 	export branch=3D'ammarfaizi2-block/paulmck/linux-rcu/dev.2022.02.01a'
> 	export commit=3D'cd7bd64af59fd15e0760a42f343c0fbb87121219'
> 	export kconfig=3D'i386-randconfig-a004-20211220'
> 	export repeat_to=3D6
> 	export nr_vm=3D160
> 	export submit_id=3D'61fb6025db12e66ab84e4b93'
> 	export job_file=3D'/lkp/jobs/scheduled/vm-snb-i386-109/rcutorture-300s-d=
efault-rcu-debian-i386-20191205.cgz-cd7bd64af59fd15e0760a42f343c0fbb8712121=
9-20220203-27320-o08ooz-5.yaml'
> 	export id=3D'01458bb03f389a56ebe77c14af5e813bce50b68c'
> 	export queuer_version=3D'/lkp-src'
> 	export model=3D'qemu-system-i386 -enable-kvm -cpu SandyBridge'
> 	export nr_cpu=3D2
> 	export memory=3D'4G'
> 	export need_kconfig=3D\{\"RCU_TORTURE_TEST\"\=3D\>\"m\"\}'
> '\{\"SECURITY_LOADPIN_ENABLED\"\=3D\>\"n,\ \<\=3D\ v4.19\"\}'
> '\{\"SECURITY_LOADPIN_ENFORCE\"\=3D\>\"n,\ v4.20\"\}'
> '\{\"MODULE_UNLOAD\"\=3D\>\"y\"\}'
> '\{\"KVM_GUEST\"\=3D\>\"y\"\}
> 	export ssh_base_port=3D23400
> 	export kernel_cmdline=3D'vmalloc=3D128M initramfs_async=3D0 page_owner=
=3Don'
> 	export rootfs=3D'debian-i386-20191205.cgz'
> 	export compiler=3D'gcc-9'
> 	export enqueue_time=3D'2022-02-03 12:55:02 +0800'
> 	export _id=3D'61fb603adb12e66ab84e4b95'
> 	export _rt=3D'/result/rcutorture/300s-default-rcu/vm-snb-i386/debian-i38=
6-20191205.cgz/i386-randconfig-a004-20211220/gcc-9/cd7bd64af59fd15e0760a42f=
343c0fbb87121219'
> 	export user=3D'lkp'
> 	export LKP_SERVER=3D'internal-lkp-server'
> 	export result_root=3D'/result/rcutorture/300s-default-rcu/vm-snb-i386/de=
bian-i386-20191205.cgz/i386-randconfig-a004-20211220/gcc-9/cd7bd64af59fd15e=
0760a42f343c0fbb87121219/3'
> 	export scheduler_version=3D'/lkp/lkp/.src-20220131-222029'
> 	export arch=3D'i386'
> 	export max_uptime=3D2100
> 	export initrd=3D'/osimage/debian/debian-i386-20191205.cgz'
> 	export bootloader_append=3D'root=3D/dev/ram0
> RESULT_ROOT=3D/result/rcutorture/300s-default-rcu/vm-snb-i386/debian-i386=
-20191205.cgz/i386-randconfig-a004-20211220/gcc-9/cd7bd64af59fd15e0760a42f3=
43c0fbb87121219/3
> BOOT_IMAGE=3D/pkg/linux/i386-randconfig-a004-20211220/gcc-9/cd7bd64af59fd=
15e0760a42f343c0fbb87121219/vmlinuz-5.17.0-rc1-00102-gcd7bd64af59f
> branch=3Dammarfaizi2-block/paulmck/linux-rcu/dev.2022.02.01a
> job=3D/lkp/jobs/scheduled/vm-snb-i386-109/rcutorture-300s-default-rcu-deb=
ian-i386-20191205.cgz-cd7bd64af59fd15e0760a42f343c0fbb87121219-20220203-273=
20-o08ooz-5.yaml
> user=3Dlkp
> ARCH=3Di386
> kconfig=3Di386-randconfig-a004-20211220
> commit=3Dcd7bd64af59fd15e0760a42f343c0fbb87121219
> vmalloc=3D128M initramfs_async=3D0 page_owner=3Don
> max_uptime=3D2100
> LKP_SERVER=3Dinternal-lkp-server
> selinux=3D0
> debug
> apic=3Ddebug
> sysrq_always_enabled
> rcupdate.rcu_cpu_stall_timeout=3D100
> net.ifnames=3D0
> printk.devkmsg=3Don
> panic=3D-1
> softlockup_panic=3D1
> nmi_watchdog=3Dpanic
> oops=3Dpanic
> load_ramdisk=3D2
> prompt_ramdisk=3D0
> drbd.minor_count=3D8
> systemd.log_level=3Derr
> ignore_loglevel
> console=3Dtty0
> earlyprintk=3DttyS0,115200
> console=3DttyS0,115200
> vga=3Dnormal
> rw'
> 	export modules_initrd=3D'/pkg/linux/i386-randconfig-a004-20211220/gcc-9/=
cd7bd64af59fd15e0760a42f343c0fbb87121219/modules.cgz'
> 	export bm_initrd=3D'/osimage/deps/debian-i386-20191205.cgz/lkp_20201203.=
cgz'
> 	export lkp_initrd=3D'/osimage/user/lkp/lkp-i386.cgz'
> 	export site=3D'inn'
> 	export LKP_CGI_PORT=3D80
> 	export LKP_CIFS_PORT=3D139
> 	export schedule_notify_address=3D
> 	export kernel=3D'/pkg/linux/i386-randconfig-a004-20211220/gcc-9/cd7bd64a=
f59fd15e0760a42f343c0fbb87121219/vmlinuz-5.17.0-rc1-00102-gcd7bd64af59f'
> 	export dequeue_time=3D'2022-02-03 12:55:50 +0800'
> 	export job_initrd=3D'/lkp/jobs/scheduled/vm-snb-i386-109/rcutorture-300s=
-default-rcu-debian-i386-20191205.cgz-cd7bd64af59fd15e0760a42f343c0fbb87121=
219-20220203-27320-o08ooz-5.cgz'
> =

> 	[ -n "$LKP_SRC" ] ||
> 	export LKP_SRC=3D/lkp/${user:-lkp}/src
> }
> =

> run_job()
> {
> 	echo $$ > $TMP/run-job.pid
> =

> 	. $LKP_SRC/lib/http.sh
> 	. $LKP_SRC/lib/job.sh
> 	. $LKP_SRC/lib/env.sh
> =

> 	export_top_env
> =

> 	run_monitor $LKP_SRC/monitors/wrapper kmsg
> 	run_monitor $LKP_SRC/monitors/wrapper heartbeat
> 	run_monitor $LKP_SRC/monitors/wrapper meminfo
> 	run_monitor $LKP_SRC/monitors/wrapper oom-killer
> 	run_monitor $LKP_SRC/monitors/plain/watchdog
> =

> 	run_test test=3D'default' torture_type=3D'rcu' $LKP_SRC/tests/wrapper rc=
utorture
> }
> =

> extract_stats()
> {
> 	export stats_part_begin=3D
> 	export stats_part_end=3D
> =

> 	env test=3D'default' torture_type=3D'rcu' $LKP_SRC/stats/wrapper rcutort=
ure
> 	$LKP_SRC/stats/wrapper kmsg
> 	$LKP_SRC/stats/wrapper meminfo
> =

> 	$LKP_SRC/stats/wrapper time rcutorture.time
> 	$LKP_SRC/stats/wrapper dmesg
> 	$LKP_SRC/stats/wrapper kmsg
> 	$LKP_SRC/stats/wrapper last_state
> 	$LKP_SRC/stats/wrapper stderr
> 	$LKP_SRC/stats/wrapper time
> }
> =

> "$@"


> early console in setup code
> Probing EDD (edd=3Doff to disable)... ok
> early console in extract_kernel
> input_data: 0x029fd079
> input_len: 0x00f67d56
> output: 0x01000000
> output_len: 0x0224a5bc
> kernel_total_size: 0x02d6a000
> needed_size: 0x02d6a000
> =

> Decompressing Linux... Parsing ELF... done.
> Booting the kernel.
> Linux version 5.17.0-rc1-00102-gcd7bd64af59f (kbuild(a)cc53c7069db2) (gcc=
-9 (Debian 9.3.0-22) 9.3.0, GNU ld (GNU Binutils for Debian) 2.35.2) #1 SMP=
 Thu Feb 3 11:57:16 CST 2022
> x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
> x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
> x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
> x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
> x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using 's=
tandard' format.
> signal: max sigframe size: 1760
> BIOS-provided physical RAM map:
> BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
> BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reserved
> BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] reserved
> BIOS-e820: [mem 0x0000000000100000-0x00000000bffdffff] usable
> BIOS-e820: [mem 0x00000000bffe0000-0x00000000bfffffff] reserved
> BIOS-e820: [mem 0x00000000feffc000-0x00000000feffffff] reserved
> BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] reserved
> BIOS-e820: [mem 0x0000000100000000-0x000000013fffffff] usable
> printk: debug: ignoring loglevel setting.
> printk: bootconsole [earlyser0] enabled
> Notice: NX (Execute Disable) protection cannot be enabled: non-PAE kernel!
> Hypervisor detected: KVM
> kvm-clock: Using msrs 4b564d01 and 4b564d00
> kvm-clock: using sched offset of 5497965097 cycles
> clocksource: kvm-clock: mask: 0xffffffffffffffff max_cycles: 0x1cd42e4dff=
b, max_idle_ns: 881590591483 ns
> tsc: Detected 2593.904 MHz processor
> e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> reserved
> e820: remove [mem 0x000a0000-0x000fffff] usable
> last_pfn =3D 0xbffe0 max_arch_pfn =3D 0x100000
> x86/PAT: PAT support disabled because CONFIG_X86_PAT is disabled in the k=
ernel.
> x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WB  WT  UC- UC  =

> Scan for SMP in [mem 0x00000000-0x000003ff]
> Scan for SMP in [mem 0x0009fc00-0x0009ffff]
> Scan for SMP in [mem 0x000f0000-0x000fffff]
> found SMP MP-table at [mem 0x000f5a80-0x000f5a8f]
> mpc: f5a90-f5b74
> initial memory mapped: [mem 0x00000000-0x043fffff]
> RAMDISK: [mem 0x78d97000-0x7fffffff]
> ACPI: Early table checksum verification disabled
> ACPI: RSDP 0x00000000000F5850 000014 (v00 BOCHS )
> ACPI: RSDT 0x00000000BFFE15C9 000030 (v01 BOCHS  BXPCRSDT 00000001 BXPC 0=
0000001)
> ACPI: FACP 0x00000000BFFE149D 000074 (v01 BOCHS  BXPCFACP 00000001 BXPC 0=
0000001)
> ACPI: DSDT 0x00000000BFFE0040 00145D (v01 BOCHS  BXPCDSDT 00000001 BXPC 0=
0000001)
> ACPI: FACS 0x00000000BFFE0000 000040
> ACPI: APIC 0x00000000BFFE1511 000080 (v01 BOCHS  BXPCAPIC 00000001 BXPC 0=
0000001)
> ACPI: HPET 0x00000000BFFE1591 000038 (v01 BOCHS  BXPCHPET 00000001 BXPC 0=
0000001)
> ACPI: Reserving FACP table memory at [mem 0xbffe149d-0xbffe1510]
> ACPI: Reserving DSDT table memory at [mem 0xbffe0040-0xbffe149c]
> ACPI: Reserving FACS table memory at [mem 0xbffe0000-0xbffe003f]
> ACPI: Reserving APIC table memory at [mem 0xbffe1511-0xbffe1590]
> ACPI: Reserving HPET table memory at [mem 0xbffe1591-0xbffe15c8]
> mapped APIC to         ffffc000 (        fee00000)
> 151MB HIGHMEM available.
> 2919MB LOWMEM available.
> mapped low ram: 0 - b67fe000
> low ram: 0 - b67fe000
> Zone ranges:
> DMA      [mem 0x0000000000001000-0x0000000000ffffff]
> Normal   [mem 0x0000000001000000-0x00000000b67fdfff]
> HighMem  [mem 0x00000000b67fe000-0x00000000bffdffff]
> Movable zone start for each node
> Early memory node ranges
> node   0: [mem 0x0000000000001000-0x000000000009efff]
> node   0: [mem 0x0000000000100000-0x00000000bffdffff]
> Initmem setup node 0 [mem 0x0000000000001000-0x00000000bffdffff]
> On node 0, zone DMA: 1 pages in unavailable ranges
> On node 0, zone DMA: 97 pages in unavailable ranges
> Using APIC driver default
> ACPI: PM-Timer IO Port: 0x608
> ACPI: LAPIC_NMI (acpi_id[0xff] dfl dfl lint[0x1])
> IOAPIC[0]: apic_id 0, version 17, address 0xfec00000, GSI 0-23
> ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
> Int: type 0, pol 0, trig 0, bus 00, IRQ 00, APIC ID 0, APIC INT 02
> ACPI: INT_SRC_OVR (bus 0 bus_irq 5 global_irq 5 high level)
> Int: type 0, pol 1, trig 3, bus 00, IRQ 05, APIC ID 0, APIC INT 05
> ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
> Int: type 0, pol 1, trig 3, bus 00, IRQ 09, APIC ID 0, APIC INT 09
> ACPI: INT_SRC_OVR (bus 0 bus_irq 10 global_irq 10 high level)
> Int: type 0, pol 1, trig 3, bus 00, IRQ 0a, APIC ID 0, APIC INT 0a
> ACPI: INT_SRC_OVR (bus 0 bus_irq 11 global_irq 11 high level)
> Int: type 0, pol 1, trig 3, bus 00, IRQ 0b, APIC ID 0, APIC INT 0b
> Int: type 0, pol 0, trig 0, bus 00, IRQ 01, APIC ID 0, APIC INT 01
> Int: type 0, pol 0, trig 0, bus 00, IRQ 03, APIC ID 0, APIC INT 03
> Int: type 0, pol 0, trig 0, bus 00, IRQ 04, APIC ID 0, APIC INT 04
> Int: type 0, pol 0, trig 0, bus 00, IRQ 06, APIC ID 0, APIC INT 06
> Int: type 0, pol 0, trig 0, bus 00, IRQ 07, APIC ID 0, APIC INT 07
> Int: type 0, pol 0, trig 0, bus 00, IRQ 08, APIC ID 0, APIC INT 08
> Int: type 0, pol 0, trig 0, bus 00, IRQ 0c, APIC ID 0, APIC INT 0c
> Int: type 0, pol 0, trig 0, bus 00, IRQ 0d, APIC ID 0, APIC INT 0d
> Int: type 0, pol 0, trig 0, bus 00, IRQ 0e, APIC ID 0, APIC INT 0e
> Int: type 0, pol 0, trig 0, bus 00, IRQ 0f, APIC ID 0, APIC INT 0f
> ACPI: Using ACPI (MADT) for SMP configuration information
> ACPI: HPET id: 0x8086a201 base: 0xfed00000
> TSC deadline timer available
> smpboot: Allowing 2 CPUs, 0 hotplug CPUs
> mapped IOAPIC to ffffb000 (fec00000)
> PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
> PM: hibernation: Registered nosave memory: [mem 0x0009f000-0x0009ffff]
> PM: hibernation: Registered nosave memory: [mem 0x000a0000-0x000effff]
> PM: hibernation: Registered nosave memory: [mem 0x000f0000-0x000fffff]
> [mem 0xc0000000-0xfeffbfff] available for PCI devices
> Booting paravirtualized kernel on KVM
> clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, ma=
x_idle_ns: 7645519600211568 ns
> setup_percpu: NR_CPUS:8 nr_cpumask_bits:8 nr_cpu_ids:2 nr_node_ids:1
> percpu: Embedded 32 pages/cpu s100588 r0 d30484 u131072
> pcpu-alloc: s100588 r0 d30484 u131072 alloc=3D32*4096
> pcpu-alloc: [0] 0 [0] 1 =

> Built 1 zonelists, mobility grouping on.  Total pages: 779732
> Kernel command line: ip=3D::::vm-snb-i386-109::dhcp root=3D/dev/ram0 RESU=
LT_ROOT=3D/result/rcutorture/300s-default-rcu/vm-snb-i386/debian-i386-20191=
205.cgz/i386-randconfig-a004-20211220/gcc-9/cd7bd64af59fd15e0760a42f343c0fb=
b87121219/3 BOOT_IMAGE=3D/pkg/linux/i386-randconfig-a004-20211220/gcc-9/cd7=
bd64af59fd15e0760a42f343c0fbb87121219/vmlinuz-5.17.0-rc1-00102-gcd7bd64af59=
f branch=3Dammarfaizi2-block/paulmck/linux-rcu/dev.2022.02.01a job=3D/lkp/j=
obs/scheduled/vm-snb-i386-109/rcutorture-300s-default-rcu-debian-i386-20191=
205.cgz-cd7bd64af59fd15e0760a42f343c0fbb87121219-20220203-27320-o08ooz-5.ya=
ml user=3Dlkp ARCH=3Di386 kconfig=3Di386-randconfig-a004-20211220 commit=3D=
cd7bd64af59fd15e0760a42f343c0fbb87121219 vmalloc=3D128M initramfs_async=3D0=
 page_owner=3Don max_uptime=3D2100 LKP_SERVER=3Dinternal-lkp-server selinux=
=3D0 debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=
=3D100 net.ifnames=3D0 printk.devkmsg=3Don panic=3D-1 softlockup_panic=3D1 =
nmi_watchdog=3Dpanic oops=3Dpanic load_ramdisk=3D2
> sysrq: sysrq always enabled.
> ignoring the deprecated load_ramdisk=3D option
> ignoring the deprecated prompt_ramdisk=3D option
> Unknown kernel command line parameters "RESULT_ROOT=3D/result/rcutorture/=
300s-default-rcu/vm-snb-i386/debian-i386-20191205.cgz/i386-randconfig-a004-=
20211220/gcc-9/cd7bd64af59fd15e0760a42f343c0fbb87121219/3 BOOT_IMAGE=3D/pkg=
/linux/i386-randconfig-a004-20211220/gcc-9/cd7bd64af59fd15e0760a42f343c0fbb=
87121219/vmlinuz-5.17.0-rc1-00102-gcd7bd64af59f branch=3Dammarfaizi2-block/=
paulmck/linux-rcu/dev.2022.02.01a job=3D/lkp/jobs/scheduled/vm-snb-i386-109=
/rcutorture-300s-default-rcu-debian-i386-20191205.cgz-cd7bd64af59fd15e0760a=
42f343c0fbb87121219-20220203-27320-o08ooz-5.yaml user=3Dlkp ARCH=3Di386 kco=
nfig=3Di386-randconfig-a004-20211220 commit=3Dcd7bd64af59fd15e0760a42f343c0=
fbb87121219 page_owner=3Don max_uptime=3D2100 LKP_SERVER=3Dinternal-lkp-ser=
ver selinux=3D0 softlockup_panic=3D1 vga=3Dnormal", will be passed to user =
space.
> Dentry cache hash table entries: 524288 (order: 9, 2097152 bytes, linear)
> Inode-cache hash table entries: 262144 (order: 8, 1048576 bytes, linear)
> mem auto-init: stack:off, heap alloc:off, heap free:off
> Initializing HighMem for node 0 (000b67fe:000bffe0)
> Initializing Movable for node 0 (00000000:00000000)
> Checking if this processor honours the WP bit even in supervisor mode...O=
k.
> Memory: 2953000K/3145208K available (16946K kernel code, 5884K rwdata, 11=
148K rodata, 840K init, 8236K bss, 192208K reserved, 0K cma-reserved, 15552=
8K highmem)
> ODEBUG: selftest passed
> =

> **********************************************************
> **   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
> **                                                      **
> ** trace_printk() being used. Allocating extra memory.  **
> **                                                      **
> ** This means that this is a DEBUG kernel and it is     **
> ** unsafe for production use.                           **
> **                                                      **
> ** If you see this message and you are not debugging    **
> ** the kernel, report this immediately to your vendor!  **
> **                                                      **
> **   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
> **********************************************************
> trace event string verifier disabled
> Running RCU self tests
> rcu: Hierarchical RCU implementation.
> rcu: 	RCU lockdep checking is enabled.
> rcu: 	RCU restricting CPUs from NR_CPUS=3D8 to nr_cpu_ids=3D2.
> rcu: 	RCU debug extended QS entry/exit.
> 	RCU CPU stall warnings timeout set to 100 (rcu_cpu_stall_timeout).
> 	Trampoline variant of Tasks RCU enabled.
> 	Rude variant of Tasks RCU enabled.
> 	Tracing variant of Tasks RCU enabled.
> rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
> rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=3D2
> NR_IRQS: 2304, nr_irqs: 56, preallocated irqs: 16
> rcu: srcu_init: Setting srcu_struct sizes based on contention.
> random: get_random_bytes called from start_kernel+0x3dc/0x553 with crng_i=
nit=3D0
> printk: console [ttyS0] enabled
> printk: bootconsole [earlyser0] disabled
> Lock dependency validator: Copyright (c) 2006 Red Hat, Inc., Ingo Molnar
> ... MAX_LOCKDEP_SUBCLASSES:  8
> ... MAX_LOCK_DEPTH:          48
> ... MAX_LOCKDEP_KEYS:        8192
> ... CLASSHASH_SIZE:          4096
> ... MAX_LOCKDEP_ENTRIES:     32768
> ... MAX_LOCKDEP_CHAINS:      65536
> ... CHAINHASH_SIZE:          32768
> memory used by lock dependency info: 3805 kB
> memory used for stack traces: 2112 kB
> per task-struct memory footprint: 1344 bytes
> ACPI: Core revision 20211217
> clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: =
19112604467 ns
> APIC: Switch to symmetric I/O mode setup
> Enabling APIC mode:  Flat.  Using 1 I/O APICs
> masked ExtINT on CPU#0
> ENABLING IO-APIC IRQs
> init IO_APIC IRQs
> apic 0 pin 0 not connected
> IOAPIC[0]: Preconfigured routing entry (0-1 -> IRQ 1 Level:0 ActiveLow:0)
> IOAPIC[0]: Preconfigured routing entry (0-2 -> IRQ 0 Level:0 ActiveLow:0)
> IOAPIC[0]: Preconfigured routing entry (0-3 -> IRQ 3 Level:0 ActiveLow:0)
> IOAPIC[0]: Preconfigured routing entry (0-4 -> IRQ 4 Level:0 ActiveLow:0)
> IOAPIC[0]: Preconfigured routing entry (0-5 -> IRQ 5 Level:1 ActiveLow:0)
> IOAPIC[0]: Preconfigured routing entry (0-6 -> IRQ 6 Level:0 ActiveLow:0)
> IOAPIC[0]: Preconfigured routing entry (0-7 -> IRQ 7 Level:0 ActiveLow:0)
> IOAPIC[0]: Preconfigured routing entry (0-8 -> IRQ 8 Level:0 ActiveLow:0)
> IOAPIC[0]: Preconfigured routing entry (0-9 -> IRQ 9 Level:1 ActiveLow:0)
> IOAPIC[0]: Preconfigured routing entry (0-10 -> IRQ 10 Level:1 ActiveLow:=
0)
> IOAPIC[0]: Preconfigured routing entry (0-11 -> IRQ 11 Level:1 ActiveLow:=
0)
> IOAPIC[0]: Preconfigured routing entry (0-12 -> IRQ 12 Level:0 ActiveLow:=
0)
> IOAPIC[0]: Preconfigured routing entry (0-13 -> IRQ 13 Level:0 ActiveLow:=
0)
> IOAPIC[0]: Preconfigured routing entry (0-14 -> IRQ 14 Level:0 ActiveLow:=
0)
> IOAPIC[0]: Preconfigured routing entry (0-15 -> IRQ 15 Level:0 ActiveLow:=
0)
> apic 0 pin 16 not connected
> apic 0 pin 17 not connected
> apic 0 pin 18 not connected
> apic 0 pin 19 not connected
> apic 0 pin 20 not connected
> apic 0 pin 21 not connected
> apic 0 pin 22 not connected
> apic 0 pin 23 not connected
> ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D-1
> clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x2563bd843d=
f, max_idle_ns: 440795257314 ns
> Calibrating delay loop (skipped) preset value.. 5187.80 BogoMIPS (lpj=3D1=
0375616)
> pid_max: default: 32768 minimum: 301
> LSM: Security Framework initializing
> Mount-cache hash table entries: 8192 (order: 3, 32768 bytes, linear)
> Mountpoint-cache hash table entries: 8192 (order: 3, 32768 bytes, linear)
> Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
> Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
> Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sani=
tization
> Spectre V2 : Mitigation: Full generic retpoline
> Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context s=
witch
> Speculative Store Bypass: Vulnerable
> L1TF: Kernel not compiled for PAE. No mitigation for L1TF
> MDS: Vulnerable: Clear CPU buffers attempted, no microcode
> Freeing SMP alternatives memory: 48K
> smpboot: CPU0: Intel Xeon E312xx (Sandy Bridge) (family: 0x6, model: 0x2a=
, stepping: 0x1)
> cblist_init_generic: Setting adjustable number of callback queues.
> cblist_init_generic: Setting shift to 1 and lim to 1.
> Running RCU-tasks wait API self tests
> Performance Events: unsupported p6 CPU model 42 no PMU driver, software e=
vents only.
> rcu: Hierarchical SRCU implementation.
> NMI watchdog: Perf NMI watchdog permanently disabled
> smp: Bringing up secondary CPUs ...
> x86: Booting SMP configuration:
> .... node  #0, CPUs:      #1
> masked ExtINT on CPU#1
> smpboot: CPU 1 Converting physical 0 to logical die 1
> smp: Brought up 1 node, 2 CPUs
> smpboot: Max logical packages: 2
> smpboot: Total of 2 processors activated (10375.61 BogoMIPS)
> devtmpfs: initialized
> version magic: 0x4139332a
> Callback from call_rcu_tasks_trace() invoked.
> clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_n=
s: 7645041785100000 ns
> futex hash table entries: 512 (order: 3, 32768 bytes, linear)
> prandom: seed boundary self test passed
> prandom: 100 self tests passed
> prandom32: self test passed (less than 6 bits correlated)
> regulator-dummy: no parameters, enabled
> NET: Registered PF_NETLINK/PF_ROUTE protocol family
> thermal_sys: Registered thermal governor 'bang_bang'
> thermal_sys: Registered thermal governor 'step_wise'
> EISA bus registered
> cpuidle: using governor menu
> PCI: Using configuration type 1 for base access
> HugeTLB registered 4.00 MiB page size, pre-allocated 0 pages
> cryptd: max_cpu_qlen set to 1000
> raid6: skipped pq benchmark and selected sse2x2
> raid6: using ssse3x1 recovery algorithm
> gpio-f7188x: Not a Fintek device at 0x0000002e
> gpio-f7188x: Not a Fintek device at 0x0000004e
> ACPI: Added _OSI(Module Device)
> ACPI: Added _OSI(Processor Device)
> ACPI: Added _OSI(3.0 _SCP Extensions)
> ACPI: Added _OSI(Processor Aggregator Device)
> ACPI: Added _OSI(Linux-Dell-Video)
> ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
> ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
> ACPI: 1 ACPI AML tables successfully acquired and loaded
> ACPI: Interpreter enabled
> ACPI: PM: (supports S0 S4 S5)
> ACPI: Using IOAPIC for interrupt routing
> PCI: Using host bridge windows from ACPI; if necessary, use "pci=3Dnocrs"=
 and report a bug
> ACPI: Enabled 2 GPEs in block 00 to 0F
> ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
> acpi PNP0A03:00: _OSC: OS supports [ASPM ClockPM Segments HPX-Type3]
> acpi PNP0A03:00: PCIe port services disabled; not requesting _OSC control
> acpi PNP0A03:00: fail to add MMCONFIG information, can't access extended =
PCI configuration space under this bridge.
> acpi resource window ([0x140000000-0x1bfffffff] ignored, not CPU addressa=
ble)
> PCI host bridge to bus 0000:00
> pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
> pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
> pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
> pci_bus 0000:00: root bus resource [mem 0xc0000000-0xfebfffff window]
> pci_bus 0000:00: root bus resource [bus 00-ff]
> pci 0000:00:00.0: [8086:1237] type 00 class 0x060000
> Callback from call_rcu_tasks_rude() invoked.
> pci 0000:00:01.0: [8086:7000] type 00 class 0x060100
> pci 0000:00:01.1: [8086:7010] type 00 class 0x010180
> pci 0000:00:01.1: reg 0x20: [io  0xc040-0xc04f]
> pci 0000:00:01.1: legacy IDE quirk: reg 0x10: [io  0x01f0-0x01f7]
> pci 0000:00:01.1: legacy IDE quirk: reg 0x14: [io  0x03f6]
> pci 0000:00:01.1: legacy IDE quirk: reg 0x18: [io  0x0170-0x0177]
> pci 0000:00:01.1: legacy IDE quirk: reg 0x1c: [io  0x0376]
> pci 0000:00:01.3: [8086:7113] type 00 class 0x068000
> pci 0000:00:01.3: quirk: [io  0x0600-0x063f] claimed by PIIX4 ACPI
> pci 0000:00:01.3: quirk: [io  0x0700-0x070f] claimed by PIIX4 SMB
> pci 0000:00:02.0: [1234:1111] type 00 class 0x030000
> pci 0000:00:02.0: reg 0x10: [mem 0xfd000000-0xfdffffff pref]
> pci 0000:00:02.0: reg 0x18: [mem 0xfebf0000-0xfebf0fff]
> pci 0000:00:02.0: reg 0x30: [mem 0xfebe0000-0xfebeffff pref]
> pci 0000:00:03.0: [8086:100e] type 00 class 0x020000
> pci 0000:00:03.0: reg 0x10: [mem 0xfebc0000-0xfebdffff]
> pci 0000:00:03.0: reg 0x14: [io  0xc000-0xc03f]
> pci 0000:00:03.0: reg 0x30: [mem 0xfeb80000-0xfebbffff pref]
> pci 0000:00:04.0: [8086:25ab] type 00 class 0x088000
> pci 0000:00:04.0: reg 0x10: [mem 0xfebf1000-0xfebf100f]
> pci_bus 0000:00: on NUMA node 0
> ACPI: PCI: Interrupt link LNKA configured for IRQ 10
> ACPI: PCI: Interrupt link LNKB configured for IRQ 10
> ACPI: PCI: Interrupt link LNKC configured for IRQ 11
> ACPI: PCI: Interrupt link LNKD configured for IRQ 11
> ACPI: PCI: Interrupt link LNKS configured for IRQ 9
> iommu: Default domain type: Translated =

> iommu: DMA domain TLB invalidation policy: lazy mode =

> pci 0000:00:02.0: vgaarb: setting as boot VGA device
> pci 0000:00:02.0: vgaarb: VGA device added: decodes=3Dio+mem,owns=3Dio+me=
m,locks=3Dnone
> pci 0000:00:02.0: vgaarb: bridge control possible
> vgaarb: loaded
> SCSI subsystem initialized
> libata version 3.00 loaded.
> PCI: Using ACPI for IRQ routing
> PCI: pci_cache_line_size set to 64 bytes
> e820: reserve RAM buffer [mem 0x0009fc00-0x0009ffff]
> e820: reserve RAM buffer [mem 0xbffe0000-0xbfffffff]
> dcdbas dcdbas: Dell Systems Management Base Driver (version 5.6.0-3.4)
> clocksource: Switched to clocksource kvm-clock
> Callback from call_rcu_tasks() invoked.
> workqueue: round-robin CPU selection forced, expect performance impact
> VFS: Disk quotas dquot_6.6.0
> VFS: Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
> FS-Cache: Loaded
> pnp: PnP ACPI init
> pnp 00:03: [dma 2]
> pnp: PnP ACPI: found 7 devices
> PnPBIOS: Disabled
> clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2=
085701024 ns
> NET: Registered PF_INET protocol family
> IP idents hash table entries: 65536 (order: 7, 524288 bytes, linear)
> tcp_listen_portaddr_hash hash table entries: 2048 (order: 4, 90112 bytes,=
 linear)
> TCP established hash table entries: 32768 (order: 5, 131072 bytes, linear)
> TCP bind hash table entries: 32768 (order: 8, 1310720 bytes, linear)
> TCP: Hash tables configured (established 32768 bind 32768)
> UDP hash table entries: 2048 (order: 5, 196608 bytes, linear)
> UDP-Lite hash table entries: 2048 (order: 5, 196608 bytes, linear)
> NET: Registered PF_UNIX/PF_LOCAL protocol family
> RPC: Registered named UNIX socket transport module.
> RPC: Registered udp transport module.
> RPC: Registered tcp transport module.
> RPC: Registered tcp NFSv4.1 backchannel transport module.
> pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
> pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
> pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
> pci_bus 0000:00: resource 7 [mem 0xc0000000-0xfebfffff window]
> pci 0000:00:01.0: PIIX3: Enabling Passive Release
> pci 0000:00:00.0: Limiting direct PCI/PCI transfers
> pci 0000:00:01.0: Activating ISA DMA hang workarounds
> pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x000c0000-0x000=
dffff]
> PCI: CLS 0 bytes, default 64
> Trying to unpack rootfs image as initramfs...
> Freeing initrd memory: 117156K
> ACPI: bus type thunderbolt registered
> RAPL PMU: API unit is 2^-32 Joules, 0 fixed counters, 10737418240 ms ovfl=
 timer
> clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x2563bd843df, max=
_idle_ns: 440795257314 ns
> apm: BIOS version 1.2 Flags 0x03 (Driver version 1.16ac)
> apm: disabled - APM is not SMP safe.
> NatSemi SCx200 Driver
> Beginning ww mutex selftests
> All ww mutex selftests passed
> Initialise system trusted keyrings
> workingset: timestamp_bits=3D14 max_order=3D20 bucket_order=3D6
> zbud: loaded
> zsmalloc: debugfs not available, stat dir not created
> squashfs: version 4.0 (2009/01/31) Phillip Lougher
> ntfs: driver 2.1.32 [Flags: R/W].
> efs: 1.0a - http://aeschi.ch.eu.org/efs/
> romfs: ROMFS MTD (C) 2007 Red Hat, Inc.
> QNX4 filesystem 0.2.3 registered.
> fuse: init (API version 7.36)
> orangefs_debugfs_init: called with debug mask: :none: :0:
> orangefs_init: module version upstream loaded
> SGI XFS with security attributes, realtime, debug enabled
> NILFS version 2 loaded
> gfs2: GFS2 installed
> xor: automatically using best checksumming function   avx       =

> async_tx: api initialized (async)
> Key type asymmetric registered
> Asymmetric key parser 'x509' registered
> Asymmetric key parser 'pkcs8' registered
> Asymmetric key parser 'tpm_parser' registered
> alg: self-tests for CTR-KDF (hmac(sha256)) passed
> bounce: pool size: 64 pages
> Block layer SCSI generic (bsg) driver version 0.4 loaded (major 245)
> io scheduler mq-deadline registered
> io scheduler kyber registered
> io scheduler bfq registered
> String selftests succeeded
> test_scanf: loaded.
> test_scanf: all 2383 tests passed
> test_bitmap: loaded.
> test_bitmap: parselist: 14: input is '0-2047:128/256' OK, Time: 983
> test_bitmap: bitmap_print_to_pagebuf: input is '0-32767
> ', Time: 3633
> test_bitmap: all 1945 tests passed
> test_strscpy: loaded.
> test_strscpy: all 32 tests passed
> test_stackinit: u8_zero ok
> test_stackinit: u16_zero ok
> test_stackinit: u32_zero ok
> test_stackinit: u64_zero ok
> test_stackinit: char_array_zero ok
> test_stackinit: small_hole_zero ok
> test_stackinit: big_hole_zero ok
> test_stackinit: trailing_hole_zero ok
> test_stackinit: packed_zero ok
> test_stackinit: small_hole_dynamic_partial ok
> test_stackinit: big_hole_dynamic_partial ok
> test_stackinit: trailing_hole_dynamic_partial ok
> test_stackinit: packed_dynamic_partial ok
> test_stackinit: small_hole_assigned_dynamic_partial ok
> test_stackinit: big_hole_assigned_dynamic_partial ok
> test_stackinit: trailing_hole_assigned_dynamic_partial ok
> test_stackinit: packed_assigned_dynamic_partial ok
> test_stackinit: small_hole_static_partial ok
> test_stackinit: big_hole_static_partial ok
> test_stackinit: trailing_hole_static_partial ok
> test_stackinit: packed_static_partial ok
> test_stackinit: small_hole_static_all FAIL (uninit bytes: 3)
> test_stackinit: big_hole_static_all FAIL (uninit bytes: 124)
> test_stackinit: trailing_hole_static_all FAIL (uninit bytes: 3)
> test_stackinit: packed_static_all ok
> test_stackinit: small_hole_dynamic_all FAIL (uninit bytes: 3)
> test_stackinit: big_hole_dynamic_all FAIL (uninit bytes: 124)
> test_stackinit: trailing_hole_dynamic_all FAIL (uninit bytes: 3)
> test_stackinit: packed_dynamic_all ok
> test_stackinit: small_hole_runtime_partial FAIL (uninit bytes: 15)
> test_stackinit: big_hole_runtime_partial FAIL (uninit bytes: 127)
> test_stackinit: trailing_hole_runtime_partial FAIL (uninit bytes: 12)
> test_stackinit: packed_runtime_partial FAIL (uninit bytes: 12)
> test_stackinit: small_hole_runtime_all FAIL (uninit bytes: 3)
> test_stackinit: big_hole_runtime_all FAIL (uninit bytes: 124)
> test_stackinit: trailing_hole_runtime_all FAIL (uninit bytes: 3)
> test_stackinit: packed_runtime_all ok
> test_stackinit: small_hole_assigned_static_partial ok
> test_stackinit: big_hole_assigned_static_partial ok
> test_stackinit: trailing_hole_assigned_static_partial ok
> test_stackinit: packed_assigned_static_partial ok
> test_stackinit: small_hole_assigned_static_all FAIL (uninit bytes: 3)
> test_stackinit: big_hole_assigned_static_all FAIL (uninit bytes: 124)
> test_stackinit: trailing_hole_assigned_static_all FAIL (uninit bytes: 3)
> test_stackinit: packed_assigned_static_all ok
> test_stackinit: small_hole_assigned_dynamic_all FAIL (uninit bytes: 3)
> test_stackinit: big_hole_assigned_dynamic_all FAIL (uninit bytes: 124)
> test_stackinit: trailing_hole_assigned_dynamic_all FAIL (uninit bytes: 3)
> test_stackinit: packed_assigned_dynamic_all ok
> test_stackinit: small_hole_assigned_copy XFAIL (uninit bytes: 3)
> test_stackinit: big_hole_assigned_copy XFAIL (uninit bytes: 124)
> test_stackinit: trailing_hole_assigned_copy XFAIL (uninit bytes: 3)
> test_stackinit: packed_assigned_copy ok
> test_stackinit: u8_none FAIL (uninit bytes: 1)
> test_stackinit: u16_none FAIL (uninit bytes: 2)
> test_stackinit: u32_none FAIL (uninit bytes: 4)
> test_stackinit: u64_none FAIL (uninit bytes: 8)
> test_stackinit: char_array_none FAIL (uninit bytes: 16)
> test_stackinit: switch_1_none XFAIL (uninit bytes: 8)
> test_stackinit: switch_2_none XFAIL (uninit bytes: 8)
> test_stackinit: small_hole_none FAIL (uninit bytes: 16)
> test_stackinit: big_hole_none FAIL (uninit bytes: 128)
> test_stackinit: trailing_hole_none FAIL (uninit bytes: 16)
> test_stackinit: packed_none FAIL (uninit bytes: 16)
> test_stackinit: user FAIL (uninit bytes: 16)
> test_stackinit: failures: 29
> test_free_pages: Testing with GFP_KERNEL
> test_free_pages: Testing with GFP_KERNEL | __GFP_COMP
> test_free_pages: Test completed
> test_div64: Starting 64bit/32bit division and modulo test
> test_div64: Completed 64bit/32bit division and modulo test, 0.001100681s =
elapsed
> crc32: CRC_LE_BITS =3D 64, CRC_BE BITS =3D 64
> crc32: self tests passed, processed 225944 bytes in 125353 nsec
> crc32c: CRC_LE_BITS =3D 64
> crc32c: self tests passed, processed 225944 bytes in 72827 nsec
> crc32_combine: 8373 self tests passed
> crc32c_combine: 8373 self tests passed
> gpio_winbond: chip ID at 2e is ffff
> gpio_winbond: not an our chip
> gpio_winbond: chip ID at 4e is ffff
> gpio_winbond: not an our chip
> switchtec: loaded.
> SPI driver hx8357 has no spi_device_id for himax,hx8369
> IPMI message handler: version 39.2
> ipmi device interface
> ipmi_si: IPMI System Interface driver
> ipmi_si: Unable to find any System Interface(s)
> ipmi_ssif: IPMI SSIF Interface driver
> IPMI Watchdog: driver initialized
> input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input0
> ACPI: button: Power Button [PWRF]
> Warning: Processor Platform Limit event detected, but not handled.
> Consider compiling CPUfreq support into your kernel.
> Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
> serial 00:05: GPIO lookup for consumer rs485-term
> serial 00:05: using ACPI for GPIO lookup
> acpi PNP0501:00: GPIO: looking up rs485-term-gpios
> acpi PNP0501:00: GPIO: looking up rs485-term-gpio
> serial 00:05: using lookup tables for GPIO lookup
> serial 00:05: No GPIO consumer rs485-term found
> 00:05: ttyS0 at I/O 0x3f8 (irq =3D 4, base_baud =3D 115200) is a 16550A
> serial 00:06: GPIO lookup for consumer rs485-term
> serial 00:06: using ACPI for GPIO lookup
> acpi PNP0501:01: GPIO: looking up rs485-term-gpios
> acpi PNP0501:01: GPIO: looking up rs485-term-gpio
> serial 00:06: using lookup tables for GPIO lookup
> serial 00:06: No GPIO consumer rs485-term found
> 00:06: ttyS1 at I/O 0x2f8 (irq =3D 3, base_baud =3D 115200) is a 16550A
> lp: driver loaded but no devices found
> DoubleTalk PC - not found
> Applicom driver: $Id: ac.c,v 1.30 2000/03/22 16:03:57 dwmw2 Exp $
> ac.o: No PCI boards found.
> ac.o: For an ISA board you must supply memory and irq parameters.
> Non-volatile memory driver v1.3
> toshiba: not a supported Toshiba laptop
> ppdev: user-space parallel port driver
> platform pc8736x_gpio.0: NatSemi pc8736x GPIO Driver Initializing
> platform pc8736x_gpio.0: no device found
> nsc_gpio initializing
> telclk_interrupt =3D 0xf non-mcpbl0010 hw.
> parport_pc 00:04: reported by Plug and Play ACPI
> parport0: PC-style at 0x378, irq 7 [PCSPP,TRISTATE]
> lp0: using parport0 (interrupt-driven).
> brd: module loaded
> loop: module loaded
> mtip32xx Version 1.3.1
> Error creating debugfs parent
> null_blk: module loaded
> dummy-irq: no IRQ given.  Use irq=3DN
> Phantom Linux Driver, version n0.9.8, init OK
> Silicon Labs C2 port support v. 0.51.0 - (C) 2007 Rodolfo Giometti
> Guest personality initialized and is inactive
> VMCI host device registered (name=3Dvmci, major=3D10, minor=3D126)
> Initialized host personality
> rdac: device handler registered
> hp_sw: device handler registered
> alua: device handler registered
> SCSI Media Changer driver v0.25 =

> SSFDC read-only Flash Translation layer
> mtdoops: mtd device (mtddev=3Dname/number) must be supplied
> L440GX flash mapping: failed to find PIIX4 ISA bridge, cannot continue
> device id =3D 2440
> device id =3D 2480
> device id =3D 24c0
> device id =3D 24d0
> device id =3D 25a1
> device id =3D 2670
> scx200_docflash: NatSemi SCx200 DOCCS Flash Driver
> mtd mtd0: GPIO lookup for consumer wp
> mtd mtd0: using lookup tables for GPIO lookup
> mtd mtd0: No GPIO consumer wp found
> rfd_ftl: no RFD magic found in 'mtdram test device'
> ftl_cs: FTL header not found.
> DiskOnChip Millennium Plus 32MB is not supported, ignoring.
> No valid DiskOnChip devices found
> [nandsim] warning: read_byte: unexpected data output cycle, state is STAT=
E_READY return 0x0
> [nandsim] warning: read_byte: unexpected data output cycle, state is STAT=
E_READY return 0x0
> [nandsim] warning: read_byte: unexpected data output cycle, state is STAT=
E_READY return 0x0
> [nandsim] warning: read_byte: unexpected data output cycle, state is STAT=
E_READY return 0x0
> [nandsim] warning: read_byte: unexpected data output cycle, state is STAT=
E_READY return 0x0
> [nandsim] warning: read_byte: unexpected data output cycle, state is STAT=
E_READY return 0x0
> nand: device found, Manufacturer ID: 0x98, Chip ID: 0x39
> nand: Toshiba NAND 128MiB 1,8V 8-bit
> nand: 128 MiB, SLC, erase size: 16 KiB, page size: 512, OOB size: 16
> flash size: 128 MiB
> page size: 512 bytes
> OOB area size: 16 bytes
> sector size: 16 KiB
> pages number: 262144
> pages per sector: 32
> bus width: 8
> bits in sector size: 14
> bits in page size: 9
> bits in OOB size: 4
> flash size with OOB: 135168 KiB
> page address bytes: 4
> sector address bytes: 3
> options: 0x42
> Scanning device for bad blocks
> Creating 1 MTD partitions on "NAND 128MiB 1,8V 8-bit":
> 0x000000000000-0x000008000000 : "NAND simulator partition 0"
> mtd mtd1: GPIO lookup for consumer wp
> mtd mtd1: using lookup tables for GPIO lookup
> mtd mtd1: No GPIO consumer wp found
> ftl_cs: FTL header not found.
> mtdblock: MTD device 'NAND simulator partition 0' is NAND, please conside=
r using UBI block devices instead.
> [nandsim] warning: CONFIG_MTD_PARTITIONED_MASTER must be enabled to expos=
e debugfs stuff
> parport0: AVR Butterfly
> parport0: cannot grant exclusive access for device spi-lm70llp
> spi_lm70llp: spi_lm70llp probe fail, status -12
> HSI/SSI char device loaded
> e1000: Intel(R) PRO/1000 Network Driver
> e1000: Copyright (c) 1999-2006 Intel Corporation.
> ACPI: \_SB_.LNKC: Enabled at IRQ 11
> e1000 0000:00:03.0 eth0: (PCI:33MHz:32-bit) 52:54:00:12:34:56
> e1000 0000:00:03.0 eth0: Intel(R) PRO/1000 Network Connection
> Fusion MPT base driver 3.04.20
> Copyright (c) 1999-2008 LSI Corporation
> Fusion MPT SPI Host driver 3.04.20
> VFIO - User Level meta-driver version: 0.3
> panel: could not claim access to parport0. Aborting.
> panel: panel driver not yet registered
> Databook TCIC-2 PCMCIA probe: =

> not found.
> i8042: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU] at 0x60,0x64 irq 1,=
12
> serio: i8042 KBD port at 0x60,0x64 irq 1
> serio: i8042 AUX port at 0x60,0x64 irq 12
> parport0: cannot grant exclusive access for device parkbd
> input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/inp=
ut/input1
> rtc-test rtc-test.0: registered as rtc0
> rtc-test rtc-test.0: setting system clock to 2022-02-03T04:56:44 UTC (164=
3864204)
> rtc-test rtc-test.1: registered as rtc1
> rtc-test rtc-test.2: registered as rtc2
> piix4_smbus 0000:00:01.3: SMBus Host Controller at 0x700, revision 0
> eeprom 0-0050: eeprom driver is deprecated, please use at24 instead
> eeprom 0-0051: eeprom driver is deprecated, please use at24 instead
> eeprom 0-0052: eeprom driver is deprecated, please use at24 instead
> eeprom 0-0053: eeprom driver is deprecated, please use at24 instead
> eeprom 0-0054: eeprom driver is deprecated, please use at24 instead
> eeprom 0-0055: eeprom driver is deprecated, please use at24 instead
> eeprom 0-0056: eeprom driver is deprecated, please use at24 instead
> eeprom 0-0057: eeprom driver is deprecated, please use at24 instead
> Driver for 1-wire Dallas network protocol.
> DS1WM w1 busmaster driver - (c) 2004 Szabolcs Gyurko
> f71882fg: Not a Fintek device
> f71882fg: Not a Fintek device
> input: ImExPS/2 Generic Explorer Mouse as /devices/platform/i8042/serio1/=
input/input3
> pc87360: PC8736x not detected, module not inserted
> sdhci: Secure Digital Host Controller Interface driver
> sdhci: Copyright(c) Pierre Ossman
> wbsd: Winbond W83L51xD SD/MMC card interface driver
> wbsd: Copyright(c) Pierre Ossman
> SPI driver leds_cr0014114 has no spi_device_id for crane,cr0014114
> SPI driver leds_el15203000 has no spi_device_id for crane,el15203000
> SPI driver leds_spi_byte has no spi_device_id for ubnt,acb-spi-led
> comedi: version 0.7.76 - http://www.comedi.org
> comedi comedi0: comedi_test: 1000000 microvolt, 100000 microsecond wavefo=
rm attached
> comedi comedi0: driver 'comedi_test' has successfully auto-configured 'co=
medi_test'.
> vme_user: VME User Space Access Driver
> vme_user: No cards, skipping registration
> FPGA DOWNLOAD --->
> FPGA image file name: xlinx_fpga_firmware.bit
> GPIO INIT FAIL!!
> greybus: registered new driver loopback
> greybus: registered new driver gbphy
> gb_gbphy: registered new driver spi
> dell_smbios: Unable to run on non-Dell system
> SPI driver st-accel-spi has no spi_device_id for st,lis302dl-spi
> SPI driver st-accel-spi has no spi_device_id for st,lis3lv02dl-accel
> SPI driver st-accel-spi has no spi_device_id for st,lis3dh-accel
> SPI driver st-accel-spi has no spi_device_id for st,lsm330d-accel
> SPI driver st-accel-spi has no spi_device_id for st,lsm330dl-accel
> SPI driver st-accel-spi has no spi_device_id for st,lsm330dlc-accel
> SPI driver st-accel-spi has no spi_device_id for st,lis331dlh-accel
> SPI driver st-accel-spi has no spi_device_id for st,lsm330-accel
> SPI driver st-accel-spi has no spi_device_id for st,lsm303agr-accel
> SPI driver st-accel-spi has no spi_device_id for st,lis2dh12-accel
> SPI driver st-accel-spi has no spi_device_id for st,lng2dm-accel
> SPI driver st-accel-spi has no spi_device_id for st,h3lis331dl-accel
> SPI driver st-accel-spi has no spi_device_id for st,lis331dl-accel
> SPI driver ad7124 has no spi_device_id for adi,ad7124-4
> SPI driver ad7124 has no spi_device_id for adi,ad7124-8
> SPI driver ad7192 has no spi_device_id for adi,ad7190
> SPI driver ad7192 has no spi_device_id for adi,ad7193
> SPI driver ad7192 has no spi_device_id for adi,ad7195
> SPI driver ad9467 has no spi_device_id for adi,ad9265
> SPI driver ad9467 has no spi_device_id for adi,ad9434
> SPI driver ads131e08 has no spi_device_id for ti,ads131e04
> SPI driver ads131e08 has no spi_device_id for ti,ads131e06
> SPI driver st-gyro-spi has no spi_device_id for st,l3g4200d-gyro
> SPI driver st-gyro-spi has no spi_device_id for st,lsm330d-gyro
> SPI driver st-gyro-spi has no spi_device_id for st,lsm330dl-gyro
> SPI driver st-gyro-spi has no spi_device_id for st,lsm330dlc-gyro
> SPI driver st-gyro-spi has no spi_device_id for st,l3gd20-gyro
> SPI driver st-gyro-spi has no spi_device_id for st,l3gd20h-gyro
> SPI driver st-gyro-spi has no spi_device_id for st,l3g4is-gyro
> SPI driver st-gyro-spi has no spi_device_id for st,lsm330-gyro
> SPI driver st-gyro-spi has no spi_device_id for st,lsm9ds0-gyro
> SPI driver adis16475 has no spi_device_id for adi,adis16470
> SPI driver adis16475 has no spi_device_id for adi,adis16475-1
> SPI driver adis16475 has no spi_device_id for adi,adis16475-2
> SPI driver adis16475 has no spi_device_id for adi,adis16475-3
> SPI driver adis16475 has no spi_device_id for adi,adis16477-1
> SPI driver adis16475 has no spi_device_id for adi,adis16477-2
> SPI driver adis16475 has no spi_device_id for adi,adis16477-3
> SPI driver adis16475 has no spi_device_id for adi,adis16465-1
> SPI driver adis16475 has no spi_device_id for adi,adis16465-2
> SPI driver adis16475 has no spi_device_id for adi,adis16465-3
> SPI driver adis16475 has no spi_device_id for adi,adis16467-1
> SPI driver adis16475 has no spi_device_id for adi,adis16467-2
> SPI driver adis16475 has no spi_device_id for adi,adis16467-3
> SPI driver adis16475 has no spi_device_id for adi,adis16500
> SPI driver adis16475 has no spi_device_id for adi,adis16505-1
> SPI driver adis16475 has no spi_device_id for adi,adis16505-2
> SPI driver adis16475 has no spi_device_id for adi,adis16505-3
> SPI driver adis16475 has no spi_device_id for adi,adis16507-1
> SPI driver adis16475 has no spi_device_id for adi,adis16507-2
> SPI driver adis16475 has no spi_device_id for adi,adis16507-3
> SPI driver st-lsm9ds0-spi has no spi_device_id for st,lsm9ds0-imu
> SPI driver st-magn-spi has no spi_device_id for st,lis3mdl-magn
> SPI driver st-magn-spi has no spi_device_id for st,lsm303agr-magn
> SPI driver st-magn-spi has no spi_device_id for st,lsm9ds1-magn
> SPI driver bmp280 has no spi_device_id for bosch,bmp085
> gnss: GNSS driver registered with major 509
> NET: Registered PF_INET6 protocol family
> Segment Routing with IPv6
> In-situ OAM (IOAM) with IPv6
> sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
> NET: Registered PF_PACKET protocol family
> 9pnet: Installing 9P2000 support
> IPI shorthand broadcast: enabled
> ... APIC ID:      00000000 (0)
> ... APIC VERSION: 00050014
> 0000000000000000000000000000000000000000000000000000000000000000
> 0000000000000000000000000000000000000000000000000000000000000000
> 0000000000000000000000000000000000000000000000000000000000000000
> =

> number of MP IRQ sources: 15.
> number of IO-APIC #0 registers: 24.
> testing the IO APIC.......................
> IO APIC #0......
> .... register #00: 00000000
> .......    : physical APIC id: 00
> .......    : Delivery Type: 0
> .......    : LTS          : 0
> .... register #01: 00170011
> .......     : max redirection entries: 17
> .......     : PRQ implemented: 0
> .......     : IO APIC version: 11
> .... register #02: 00000000
> .......     : arbitration: 00
> .... IRQ redirection table:
> IOAPIC 0:
> pin00, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
> pin01, enabled , edge , high, V(22), IRR(0), S(0), logical , D(0001), M(0)
> pin02, enabled , edge , high, V(30), IRR(0), S(0), logical , D(0001), M(0)
> pin03, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
> pin04, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
> pin05, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
> pin06, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
> pin07, enabled , edge , high, V(21), IRR(0), S(0), logical , D(0001), M(0)
> pin08, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
> pin09, enabled , level, high, V(21), IRR(0), S(0), logical , D(0002), M(0)
> pin0a, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
> pin0b, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
> pin0c, enabled , edge , high, V(22), IRR(0), S(0), logical , D(0002), M(0)
> pin0d, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
> pin0e, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
> pin0f, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
> pin10, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
> pin11, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
> pin12, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
> pin13, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
> pin14, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
> pin15, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
> pin16, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
> pin17, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
> IRQ to pin mappings:
> IRQ0 -> 0:2
> IRQ1 -> 0:1
> IRQ3 -> 0:3
> IRQ4 -> 0:4
> IRQ5 -> 0:5
> IRQ6 -> 0:6
> IRQ7 -> 0:7
> IRQ8 -> 0:8
> IRQ9 -> 0:9
> IRQ10 -> 0:10
> IRQ11 -> 0:11
> IRQ12 -> 0:12
> IRQ13 -> 0:13
> IRQ14 -> 0:14
> IRQ15 -> 0:15
> .................................... done.
> sched_clock: Marking stable (29761019538, 32330526)->(29832638763, -39288=
699)
> Loading compiled-in X.509 certificates
> debug_vm_pgtable: [debug_vm_pgtable         ]: Validating architecture pa=
ge table helpers
> Key type encrypted registered
> RIO: rio_register_scan for mport_id=3D-1
> e1000: eth0 NIC Link is Up 1000 Mbps Full Duplex, Flow Control: RX
> IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
> Sending DHCP requests ., OK
> IP-Config: Got DHCP answer from 10.0.2.2, my address is 10.0.2.15
> IP-Config: Complete:
> device=3Deth0, hwaddr=3D52:54:00:12:34:56, ipaddr=3D10.0.2.15, mask=3D255=
.255.255.0, gw=3D10.0.2.2
> host=3Dvm-snb-i386-109, domain=3D, nis-domain=3D(none)
> bootserver=3D10.0.2.2, rootserver=3D10.0.2.2, rootpath=3D
> nameserver0=3D10.0.2.3
> DEBUG_HOTPLUG_CPU0: CPU 0 is now offline
> TAP version 14
> 1..19
> # Subtest: time_test_cases
> 1..1
> ok 1 - time64_to_tm_test_date_range
> ok 1 - time_test_cases
> # Subtest: ext4_inode_test
> 1..1
> # Subtest: inode_test_xtimestamp_decoding
> ok 1 - 1901-12-13 Lower bound of 32bit < 0 timestamp, no extra bits
> ok 2 - 1969-12-31 Upper bound of 32bit < 0 timestamp, no extra bits
> ok 3 - 1970-01-01 Lower bound of 32bit >=3D0 timestamp, no extra bits
> ok 4 - 2038-01-19 Upper bound of 32bit >=3D0 timestamp, no extra bits
> ok 5 - 2038-01-19 Lower bound of 32bit <0 timestamp, lo extra sec bit on
> ok 6 - 2106-02-07 Upper bound of 32bit <0 timestamp, lo extra sec bit on
> ok 7 - 2106-02-07 Lower bound of 32bit >=3D0 timestamp, lo extra sec bit =
on
> ok 8 - 2174-02-25 Upper bound of 32bit >=3D0 timestamp, lo extra sec bit =
on
> ok 9 - 2174-02-25 Lower bound of 32bit <0 timestamp, hi extra sec bit on
> ok 10 - 2242-03-16 Upper bound of 32bit <0 timestamp, hi extra sec bit on
> ok 11 - 2242-03-16 Lower bound of 32bit >=3D0 timestamp, hi extra sec bit=
 on
> ok 12 - 2310-04-04 Upper bound of 32bit >=3D0 timestamp, hi extra sec bit=
 on
> ok 13 - 2310-04-04 Upper bound of 32bit>=3D0 timestamp, hi extra sec bit =
1. 1 ns
> ok 14 - 2378-04-22 Lower bound of 32bit>=3D timestamp. Extra sec bits 1. =
Max ns
> ok 15 - 2378-04-22 Lower bound of 32bit >=3D0 timestamp. All extra sec bi=
ts on
> ok 16 - 2446-05-10 Upper bound of 32bit >=3D0 timestamp. All extra sec bi=
ts on
> # inode_test_xtimestamp_decoding: pass:16 fail:0 skip:0 total:16
> ok 1 - inode_test_xtimestamp_decoding
> # Totals: pass:16 fail:0 skip:0 total:16
> ok 2 - ext4_inode_test
> # Subtest: fat_test
> 1..3
> ok 1 - fat_checksum_test
> # Subtest: fat_time_fat2unix_test
> ok 1 - Earliest possible UTC (1980-01-01 00:00:00)
> ok 2 - Latest possible UTC (2107-12-31 23:59:58)
> ok 3 - Earliest possible (UTC-11) (=3D=3D 1979-12-31 13:00:00 UTC)
> ok 4 - Latest possible (UTC+11) (=3D=3D 2108-01-01 10:59:58 UTC)
> ok 5 - Leap Day / Year (1996-02-29 00:00:00)
> ok 6 - Year 2000 is leap year (2000-02-29 00:00:00)
> ok 7 - Year 2100 not leap year (2100-03-01 00:00:00)
> ok 8 - Leap year + timezone UTC+1 (=3D=3D 2004-02-29 00:30:00 UTC)
> ok 9 - Leap year + timezone UTC-1 (=3D=3D 2004-02-29 23:30:00 UTC)
> ok 10 - VFAT odd-second resolution (1999-12-31 23:59:59)
> ok 11 - VFAT 10ms resolution (1980-01-01 00:00:00:0010)
> # fat_time_fat2unix_test: pass:11 fail:0 skip:0 total:11
> ok 2 - fat_time_fat2unix_test
> # Subtest: fat_time_unix2fat_test
> ok 1 - Earliest possible UTC (1980-01-01 00:00:00)
> ok 2 - Latest possible UTC (2107-12-31 23:59:58)
> ok 3 - Earliest possible (UTC-11) (=3D=3D 1979-12-31 13:00:00 UTC)
> ok 4 - Latest possible (UTC+11) (=3D=3D 2108-01-01 10:59:58 UTC)
> ok 5 - Leap Day / Year (1996-02-29 00:00:00)
> ok 6 - Year 2000 is leap year (2000-02-29 00:00:00)
> ok 7 - Year 2100 not leap year (2100-03-01 00:00:00)
> ok 8 - Leap year + timezone UTC+1 (=3D=3D 2004-02-29 00:30:00 UTC)
> ok 9 - Leap year + timezone UTC-1 (=3D=3D 2004-02-29 23:30:00 UTC)
> ok 10 - VFAT odd-second resolution (1999-12-31 23:59:59)
> ok 11 - VFAT 10ms resolution (1980-01-01 00:00:00:0010)
> # fat_time_unix2fat_test: pass:11 fail:0 skip:0 total:11
> ok 3 - fat_time_unix2fat_test
> # fat_test: pass:3 fail:0 skip:0 total:3
> # Totals: pass:23 fail:0 skip:0 total:23
> ok 3 - fat_test
> # Subtest: kunit_executor_test
> 1..5
> ok 1 - parse_filter_test
> ok 2 - filter_subsuite_test
> ok 3 - filter_subsuite_test_glob_test
> ok 4 - filter_subsuite_to_empty_test
> ok 5 - filter_suites_test
> # kunit_executor_test: pass:5 fail:0 skip:0 total:5
> # Totals: pass:5 fail:0 skip:0 total:5
> ok 4 - kunit_executor_test
> # Subtest: kunit-try-catch-test
> 1..2
> ok 1 - kunit_test_try_catch_successful_try_no_catch
> ok 2 - kunit_test_try_catch_unsuccessful_try_does_catch
> # kunit-try-catch-test: pass:2 fail:0 skip:0 total:2
> # Totals: pass:2 fail:0 skip:0 total:2
> ok 5 - kunit-try-catch-test
> # Subtest: kunit-resource-test
> 1..7
> ok 1 - kunit_resource_test_init_resources
> ok 2 - kunit_resource_test_alloc_resource
> ok 3 - kunit_resource_test_destroy_resource
> ok 4 - kunit_resource_test_cleanup_resources
> ok 5 - kunit_resource_test_proper_free_ordering
> ok 6 - kunit_resource_test_static
> ok 7 - kunit_resource_test_named
> # kunit-resource-test: pass:7 fail:0 skip:0 total:7
> # Totals: pass:7 fail:0 skip:0 total:7
> ok 6 - kunit-resource-test
> # Subtest: kunit-log-test
> 1..1
> put this in log.
> this too.
> add to suite log.
> along with this.
> ok 1 - kunit_log_test
> ok 7 - kunit-log-test
> # Subtest: kunit_status
> 1..2
> ok 1 - kunit_status_set_failure_test
> ok 2 - kunit_status_mark_skipped_test
> # kunit_status: pass:2 fail:0 skip:0 total:2
> # Totals: pass:2 fail:0 skip:0 total:2
> ok 8 - kunit_status
> # Subtest: string-stream-test
> 1..3
> ok 1 - string_stream_test_empty_on_creation
> ok 2 - string_stream_test_not_empty_after_add
> ok 3 - string_stream_test_get_string
> # string-stream-test: pass:3 fail:0 skip:0 total:3
> # Totals: pass:3 fail:0 skip:0 total:3
> ok 9 - string-stream-test
> # Subtest: example
> 1..3
> # example_simple_test: initializing
> ok 1 - example_simple_test
> # example_skip_test: initializing
> # example_skip_test: You should not see a line below.
> ok 2 - example_skip_test # SKIP this test should be skipped
> # example_mark_skipped_test: initializing
> # example_mark_skipped_test: You should see a line below.
> # example_mark_skipped_test: You should see this line.
> ok 3 - example_mark_skipped_test # SKIP this test should be skipped
> # example: pass:1 fail:0 skip:2 total:3
> # Totals: pass:1 fail:0 skip:2 total:3
> ok 10 - example
> # Subtest: rational
> 1..1
> # Subtest: rational_test
> ok 1 - Exceeds bounds, semi-convergent term > 1/2 last term
> ok 2 - Exceeds bounds, semi-convergent term < 1/2 last term
> ok 3 - Closest to zero
> ok 4 - Closest to smallest non-zero
> ok 5 - Use convergent
> ok 6 - Exact answer
> ok 7 - Semiconvergent, numerator limit
> ok 8 - Semiconvergent, denominator limit
> # rational_test: pass:8 fail:0 skip:0 total:8
> ok 1 - rational_test
> # Totals: pass:8 fail:0 skip:0 total:8
> ok 11 - rational
> # Subtest: list-kunit-test
> 1..36
> ok 1 - list_test_list_init
> ok 2 - list_test_list_add
> ok 3 - list_test_list_add_tail
> ok 4 - list_test_list_del
> ok 5 - list_test_list_replace
> ok 6 - list_test_list_replace_init
> ok 7 - list_test_list_swap
> ok 8 - list_test_list_del_init
> ok 9 - list_test_list_move
> ok 10 - list_test_list_move_tail
> ok 11 - list_test_list_bulk_move_tail
> ok 12 - list_test_list_is_first
> ok 13 - list_test_list_is_last
> ok 14 - list_test_list_empty
> ok 15 - list_test_list_empty_careful
> ok 16 - list_test_list_rotate_left
> ok 17 - list_test_list_rotate_to_front
> ok 18 - list_test_list_is_singular
> ok 19 - list_test_list_cut_position
> ok 20 - list_test_list_cut_before
> ok 21 - list_test_list_splice
> ok 22 - list_test_list_splice_tail
> ok 23 - list_test_list_splice_init
> ok 24 - list_test_list_splice_tail_init
> ok 25 - list_test_list_entry
> ok 26 - list_test_list_first_entry
> ok 27 - list_test_list_last_entry
> ok 28 - list_test_list_first_entry_or_null
> ok 29 - list_test_list_next_entry
> ok 30 - list_test_list_prev_entry
> ok 31 - list_test_list_for_each
> ok 32 - list_test_list_for_each_prev
> ok 33 - list_test_list_for_each_safe
> ok 34 - list_test_list_for_each_prev_safe
> ok 35 - list_test_list_for_each_entry
> ok 36 - list_test_list_for_each_entry_reverse
> # list-kunit-test: pass:36 fail:0 skip:0 total:36
> # Totals: pass:36 fail:0 skip:0 total:36
> ok 12 - list-kunit-test
> # Subtest: linear-ranges-test
> 1..4
> ok 1 - range_test_get_value_amount
> ok 2 - range_test_get_selector_high
> ok 3 - range_test_get_selector_low
> ok 4 - range_test_get_value
> # linear-ranges-test: pass:4 fail:0 skip:0 total:4
> # Totals: pass:4 fail:0 skip:0 total:4
> ok 13 - linear-ranges-test
> # Subtest: bits-test
> 1..3
> ok 1 - genmask_test
> ok 2 - genmask_ull_test
> ok 3 - genmask_input_check_test
> # bits-test: pass:3 fail:0 skip:0 total:3
> # Totals: pass:3 fail:0 skip:0 total:3
> ok 14 - bits-test
> # Subtest: cmdline
> 1..4
> ok 1 - cmdline_test_noint
> ok 2 - cmdline_test_lead_int
> ok 3 - cmdline_test_tail_int
> ok 4 - cmdline_test_range
> # cmdline: pass:4 fail:0 skip:0 total:4
> # Totals: pass:4 fail:0 skip:0 total:4
> ok 15 - cmdline
> # Subtest: memcpy
> 1..3
> # memset_test: ok: memset() direct assignment
> # memset_test: ok: memset() complete overwrite
> # memset_test: ok: memset() middle overwrite
> # memset_test: ok: memset() argument side-effects
> # memset_test: ok: memset() memset_after()
> # memset_test: ok: memset() memset_startat()
> ok 1 - memset_test
> # memcpy_test: ok: memcpy() static initializers
> # memcpy_test: ok: memcpy() direct assignment
> # memcpy_test: ok: memcpy() complete overwrite
> # memcpy_test: ok: memcpy() middle overwrite
> # memcpy_test: ok: memcpy() argument side-effects
> ok 2 - memcpy_test
> # memmove_test: ok: memmove() static initializers
> # memmove_test: ok: memmove() direct assignment
> # memmove_test: ok: memmove() complete overwrite
> # memmove_test: ok: memmove() middle overwrite
> # memmove_test: ok: memmove() argument side-effects
> # memmove_test: ok: memmove() overlapping write
> ok 3 - memmove_test
> # memcpy: pass:3 fail:0 skip:0 total:3
> # Totals: pass:3 fail:0 skip:0 total:3
> ok 16 - memcpy
> # Subtest: qos-kunit-test
> 1..3
> ok 1 - freq_qos_test_min
> ok 2 - freq_qos_test_maxdef
> ok 3 - freq_qos_test_readd
> # qos-kunit-test: pass:3 fail:0 skip:0 total:3
> # Totals: pass:3 fail:0 skip:0 total:3
> ok 17 - qos-kunit-test
> # Subtest: property-entry
> 1..7
> ok 1 - pe_test_uints
> ok 2 - pe_test_uint_arrays
> ok 3 - pe_test_strings
> ok 4 - pe_test_bool
> ok 5 - pe_test_move_inline_u8
> ok 6 - pe_test_move_inline_str
> ok 7 - pe_test_reference
> # property-entry: pass:7 fail:0 skip:0 total:7
> # Totals: pass:7 fail:0 skip:0 total:7
> ok 18 - property-entry
> # Subtest: rtc_lib_test_cases
> 1..1
> ok 1 - rtc_time64_to_tm_test_date_range
> ok 19 - rtc_lib_test_cases
> Freeing unused kernel image (initmem) memory: 840K
> Write protecting kernel text and read-only data: 28096k
> rodata_test: all tests were successful
> Run /init as init process
> with arguments:
> /init
> with environment:
> HOME=3D/
> TERM=3Dlinux
> RESULT_ROOT=3D/result/rcutorture/300s-default-rcu/vm-snb-i386/debian-i386=
-20191205.cgz/i386-randconfig-a004-20211220/gcc-9/cd7bd64af59fd15e0760a42f3=
43c0fbb87121219/3
> BOOT_IMAGE=3D/pkg/linux/i386-randconfig-a004-20211220/gcc-9/cd7bd64af59fd=
15e0760a42f343c0fbb87121219/vmlinuz-5.17.0-rc1-00102-gcd7bd64af59f
> branch=3Dammarfaizi2-block/paulmck/linux-rcu/dev.2022.02.01a
> job=3D/lkp/jobs/scheduled/vm-snb-i386-109/rcutorture-300s-default-rcu-deb=
ian-i386-20191205.cgz-cd7bd64af59fd15e0760a42f343c0fbb87121219-20220203-273=
20-o08ooz-5.yaml
> user=3Dlkp
> ARCH=3Di386
> kconfig=3Di386-randconfig-a004-20211220
> commit=3Dcd7bd64af59fd15e0760a42f343c0fbb87121219
> page_owner=3Don
> max_uptime=3D2100
> LKP_SERVER=3Dinternal-lkp-server
> selinux=3D0
> softlockup_panic=3D1
> vga=3Dnormal
> systemd[1]: RTC configured in localtime, applying delta of 0 minutes to s=
ystem time.
> random: systemd: uninitialized urandom read (16 bytes read)
> =

> Welcome to Debian GNU/Linux 9 (stretch)!
> =

> random: systemd: uninitialized urandom read (16 bytes read)
> process 310 (systemd) attempted a POSIX timer syscall while CONFIG_POSIX_=
TIMERS is not set
> random: systemd-cryptse: uninitialized urandom read (16 bytes read)
> Created slice User and Session Slice.
> Listening on Journal Socket (/dev/log).
> Started Forward Password Requests to Wall Directory Watch.
> Listening on RPCbind Server Activation Socket.
> Reached target Swap.
> Listening on udev Kernel Socket.
> Listening on Journal Socket.
> Started Dispatch Password Requests to Console Directory Watch.
> Reached target Encrypted Volumes.
> Created slice System Slice.
> Reached target Slices.
> Created slice system-getty.slice.
> Starting Remount Root and Kernel File Systems...
> Starting Load Kernel Modules...
> Mounting RPC Pipe File System...
> Listening on Syslog Socket.
> Starting Journal Service...
> Listening on udev Control Socket.
> Listening on /dev/initctl Compatibility Named Pipe.
> Starting Create Static Device Nodes in /dev...
> Reached target Paths.
> random: fast init done
> Mounted RPC Pipe File System.
> Started Remount Root and Kernel File Systems.
> Started Load Kernel Modules.
> Started Create Static Device Nodes in /dev.
> Starting udev Kernel Device Manager...
> Mounting Configuration File System...
> Starting Apply Kernel Variables...
> Mounting FUSE Control File System...
> Starting Load/Save Random Seed...
> Starting udev Coldplug all Devices...
> Reached target Local File Systems (Pre).
> Reached target Local File Systems.
> Starting Preprocess NFS configuration...
> Mounted Configuration File System.
> Mounted FUSE Control File System.
> Started udev Kernel Device Manager.
> Started Apply Kernel Variables.
> Started Load/Save Random Seed.
> Started Preprocess NFS configuration.
> Reached target NFS client services.
> Starting Raise network interfaces...
> Started Journal Service.
> Starting Flush Journal to Persistent Storage...
> Started Flush Journal to Persistent Storage.
> Starting Create Volatile Files and Directories...
> Started Create Volatile Files and Directories.
> Started Raise network interfaces.
> Reached target Network.
> Reached target Network is Online.
> Starting Update UTMP about System Boot/Shutdown...
> Starting Network Time Synchronization...
> Starting RPC bind portmap service...
> Failed to start Update UTMP about System Boot/Shutdown.
> See 'systemctl status systemd-update-utmp.service' for details.
> Dependency failed for Update UTMP about System Runlevel Changes.
> Started RPC bind portmap service.
> Reached target Remote File Systems (Pre).
> Reached target Remote File Systems.
> Reached target RPC Port Mapper.
> Started Network Time Synchronization.
> Reached target System Time Synchronized.
> Reached target Printer.
> Started udev Coldplug all Devices.
> Reached target System Initialization.
> Started Daily Cleanup of Temporary Directories.
> Started Daily apt download activities.
> Started Daily apt upgrade and clean activities.
> Reached target Timers.
> Listening on D-Bus System Message Bus Socket.
> Reached target Sockets.
> Reached target Basic System.
> Starting LSB: Start and stop bmc-watchdog...
> Starting Permit User Sessions...
> Starting LSB: Execute the kexec -e command to reboot system...
> Started D-Bus System Message Bus.
> Starting Login Service...
> Starting OpenBSD Secure Shell server...
> Started Regular background program processing daemon.
> Starting System Logging Service...
> Starting /etc/rc.local Compatibility...
> Starting LKP bootstrap...
> Started Permit User Sessions.
> Started /etc/rc.local Compatibility.
> rc.local[431]: PATH=3D/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/=
sbin:/bin:/lkp/lkp/src/bin
> Started OpenBSD Secure Shell server.
> rc.local[431]: /lkp/lkp/src/bin/lkp-setup-rootfs: 78: /lkp/lkp/src/bin/lk=
p-setup-rootfs: cannot create /sys/devices/system/cpu/microcode/reload: Dir=
ectory nonexistent
> Started LSB: Start and stop bmc-watchdog.
> Started LSB: Execute the kexec -e command to reboot system.
> LKP: HOSTNAME vm-snb-i386-109, MAC 52:54:00:12:34:56, kernel 5.17.0-rc1-0=
0102-gcd7bd64af59f 1, serial console /dev/ttyS0
> Started Login Service.
> Starting LSB: Load kernel image with kexec...
> Reached target Login Prompts.
> Started LSB: Load kernel image with kexec.
> rcu-torture:--- Start of test: nreaders=3D1 nfakewriters=3D4 stat_interva=
l=3D60 verbose=3D1 test_no_idle_hz=3D1 shuffle_interval=3D3 stutter=3D5 irq=
reader=3D1 fqs_duration=3D0 fqs_holdoff=3D0 fqs_stutter=3D3 test_boost=3D1/=
0 test_boost_interval=3D7 test_boost_duration=3D4 shutdown_secs=3D0 stall_c=
pu=3D0 stall_cpu_holdoff=3D10 stall_cpu_irqsoff=3D0 stall_cpu_block=3D0 n_b=
arrier_cbs=3D0 onoff_interval=3D0 onoff_holdoff=3D0 read_exit_delay=3D13 re=
ad_exit_burst=3D16 nocbs_nthreads=3D0 nocbs_toggle=3D1000
> rcu:  Start-test grace-period state: g13424 f0x0
> rcu_torture_write_types: Testing conditional GPs.
> rcu_torture_write_types: Testing conditional expedited GPs.
> rcu_torture_write_types: Testing expedited GPs.
> rcu_torture_write_types: Testing asynchronous GPs.
> rcu_torture_write_types: Testing polling GPs.
> rcu_torture_write_types: Testing polling expedited GPs.
> rcu_torture_write_types: Testing normal GPs.
> rcu-torture: Creating rcu_torture_writer task
> rcu-torture: Creating rcu_torture_fakewriter task
> rcu-torture: rcu_torture_writer task started
> rcu-torture: Creating rcu_torture_fakewriter task
> rcu-torture: rcu_torture_fakewriter task started
> rcu-torture: Creating rcu_torture_fakewriter task
> rcu-torture: rcu_torture_fakewriter task started
> rcu-torture: Creating rcu_torture_fakewriter task
> rcu-torture: rcu_torture_fakewriter task started
> rcu-torture: Creating rcu_torture_reader task
> rcu-torture: rcu_torture_fakewriter task started
> rcu-torture: Creating rcu_torture_stats task
> rcu-torture: rcu_torture_reader task started
> rcu-torture: Creating torture_shuffle task
> rcu-torture: rcu_torture_stats task started
> rcu-torture: Creating torture_stutter task
> rcu-torture: torture_shuffle task started
> rcu-torture: Creating rcu_torture_fwd_prog task
> rcu-torture: torture_stutter task started
> rcu-torture: Creating rcu_torture_read_exit task
> rcu-torture: rcu_torture_fwd_progress task started
> rcu-torture: rcu_torture_read_exit: Start of test
> Started System Logging Service.
> rcu-torture: rcu_torture_read_exit: End of episode
> Kernel tests: Boot OK!
> =

> rcu-torture: rcu_torture_read_exit: Start of episode
> rcu-torture: rcu_torture_read_exit: End of episode
> =

> mount: mount point /sys/kernel/debug does not exist
> =

> install debs round one: dpkg -i --force-confdef --force-depends /opt/deb/=
gawk_1%3a4.1.4+dfsg-1_i386.deb
> =

> Selecting previously unselected package gawk.
> =

> (Reading database ... 16210 files and directories currently installed.)
> =

> Preparing to unpack .../gawk_1%3a4.1.4+dfsg-1_i386.deb ...
> =

> Unpacking gawk (1:4.1.4+dfsg-1) ...
> =

> Setting up gawk (1:4.1.4+dfsg-1) ...
> =

> mount debug /sys/kernel/debug -t debugfs
> =

> rootfs on / type rootfs (rw)
> =

> sysfs on /sys type sysfs (rw,nosuid,nodev,noexec,relatime)
> =

> proc on /proc type proc (rw,nosuid,nodev,noexec,relatime)
> =

> devtmpfs on /dev type devtmpfs (rw,nosuid,size=3D1476524k,nr_inodes=3D369=
131,mode=3D755)
> =

> tmpfs on /dev/shm type tmpfs (rw,nosuid,nodev)
> =

> devpts on /dev/pts type devpts (rw,nosuid,noexec,relatime,gid=3D5,mode=3D=
620,ptmxmode=3D000)
> =

> tmpfs on /run type tmpfs (rw,nosuid,nodev,mode=3D755)
> =

> tmpfs on /run/lock type tmpfs (rw,nosuid,nodev,noexec,relatime,size=3D512=
0k)
> =

> tmpfs on /sys/fs/cgroup type tmpfs (ro,nosuid,nodev,noexec,mode=3D755)
> =

> cgroup on /sys/fs/cgroup/systemd type cgroup (rw,nosuid,nodev,noexec,rela=
time,xattr,release_agent=3D/lib/systemd/systemd-cgroups-agent,name=3Dsystem=
d)
> =

> cgroup on /sys/fs/cgroup/freezer type cgroup (rw,nosuid,nodev,noexec,rela=
time,freezer)
> =

> cgroup on /sys/fs/cgroup/misc type cgroup (rw,nosuid,nodev,noexec,relatim=
e,misc)
> =

> cgroup on /sys/fs/cgroup/devices type cgroup (rw,nosuid,nodev,noexec,rela=
time,devices)
> =

> cgroup on /sys/fs/cgroup/hugetlb type cgroup (rw,nosuid,nodev,noexec,rela=
time,hugetlb)
> =

> cgroup on /sys/fs/cgroup/cpuacct type cgroup (rw,nosuid,nodev,noexec,rela=
time,cpuacct)
> =

> cgroup on /sys/fs/cgroup/cpuset type cgroup (rw,nosuid,nodev,noexec,relat=
ime,cpuset)
> =

> cgroup on /sys/fs/cgroup/memory type cgroup (rw,nosuid,nodev,noexec,relat=
ime,memory)
> =

> sunrpc on /run/rpc_pipefs type rpc_pipefs (rw,relatime)
> =

> systemd-1 on /proc/sys/fs/binfmt_misc type autofs (rw,relatime,fd=3D36,pg=
rp=3D1,timeout=3D0,minproto=3D5,maxproto=3D5,direct)
> =

> configfs on /sys/kernel/config type configfs (rw,relatime)
> =

> fusectl on /sys/fs/fuse/connections type fusectl (rw,relatime)
> =

> tmp on /tmp type tmpfs (rw,relatime)
> =

> nodev	sysfs
> =

> nodev	tmpfs
> =

> nodev	bdev
> =

> nodev	proc
> =

> nodev	cgroup
> =

> nodev	cgroup2
> =

> nodev	cpuset
> =

> nodev	devtmpfs
> =

> nodev	binfmt_misc
> =

> nodev	configfs
> =

> nodev	tracefs
> =

> nodev	sockfs
> =

> nodev	bpf
> =

> nodev	pipefs
> =

> nodev	ramfs
> =

> nodev	hugetlbfs
> =

> nodev	rpc_pipefs
> =

> nodev	devpts
> =

> 	reiserfs
> =

> 	ext3
> =

> 	ext4
> =

> 	ext2
> =

> 	cramfs
> =

> 	squashfs
> =

> 	vfat
> =

> 	msdos
> =

> 	exfat
> =

> 	bfs
> =

> 	iso9660
> =

> 	hfs
> =

> 	vxfs
> =

> nodev	nfs
> =

> nodev	nfs4
> =

> 	sysv
> =

> 	v7
> =

> 	hpfs
> =

> 	ntfs
> =

> 	ufs
> =

> 	efs
> =

> nodev	jffs2
> =

> 	romfs
> =

> 	qnx4
> =

> nodev	autofs
> =

> 	adfs
> =

> 	fuseblk
> =

> nodev	fuse
> =

> nodev	fusectl
> =

> nodev	virtiofs
> =

> nodev	pvfs2
> =

> 	omfs
> =

> 	xfs
> =

> 	nilfs2
> =

> 	gfs2
> =

> 	gfs2meta
> =

> 	f2fs
> =

> /lkp/lkp/src/bin/run-lkp
> =

> rcu-torture: rcu_torture_read_exit: Start of episode
> rcu-torture: rcu_torture_read_exit: End of episode
> RESULT_ROOT=3D/result/rcutorture/300s-default-rcu/vm-snb-i386/debian-i386=
-20191205.cgz/i386-randconfig-a004-20211220/gcc-9/cd7bd64af59fd15e0760a42f3=
43c0fbb87121219/3
> =

> job=3D/lkp/jobs/scheduled/vm-snb-i386-109/rcutorture-300s-default-rcu-deb=
ian-i386-20191205.cgz-cd7bd64af59fd15e0760a42f343c0fbb87121219-20220203-273=
20-o08ooz-5.yaml
> =

> result_service: raw_upload, RESULT_MNT: /internal-lkp-server/result, RESU=
LT_ROOT: /internal-lkp-server/result/rcutorture/300s-default-rcu/vm-snb-i38=
6/debian-i386-20191205.cgz/i386-randconfig-a004-20211220/gcc-9/cd7bd64af59f=
d15e0760a42f343c0fbb87121219/3, TMP_RESULT_ROOT: /tmp/lkp/result
> =

> run-job /lkp/jobs/scheduled/vm-snb-i386-109/rcutorture-300s-default-rcu-d=
ebian-i386-20191205.cgz-cd7bd64af59fd15e0760a42f343c0fbb87121219-20220203-2=
7320-o08ooz-5.yaml
> =

> /usr/bin/wget -q --timeout=3D1800 --tries=3D1 --local-encoding=3DUTF-8 ht=
tp://internal-lkp-server:80/~lkp/cgi-bin/lkp-jobfile-append-var?job_file=3D=
/lkp/jobs/scheduled/vm-snb-i386-109/rcutorture-300s-default-rcu-debian-i386=
-20191205.cgz-cd7bd64af59fd15e0760a42f343c0fbb87121219-20220203-27320-o08oo=
z-5.yaml&job_state=3Drunning -O /dev/null
> =

> target ucode: =

> =

> 2022-02-03 04:57:11 modprobe rcutorture torture_type=3Drcu
> =

> 2022-02-03 04:57:11 sleep 300
> =

> rcu-torture: rcu_torture_read_exit: Start of episode
> rcu-torture: rcu_torture_read_exit: End of episode
> rcu-torture: rcu_torture_read_exit: Start of episode
> rcu-torture: rcu_torture_read_exit: End of episode
> rcu-torture: rtc: (ptrval) ver: 8 tfle: 0 rta: 9 rtaf: 0 rtf: 2 rtmbe: 0 =
rtmbkf: 0/0 rtbe: 0 rtbke: 0 rtbre: 0 rtbf: 0 rtb: 0 nt: 178 onoff: 0/0:0/0=
 -1,0:-1,0 0:0 (HZ=3D250) barrier: 0/0:0 read-exits: 84 nocb-toggles: 0:0
> rcu-torture: Reader Pipe:  83213 0 0 0 0 0 0 0 0 0 0
> rcu-torture: Reader Batch:  83213 0 0 0 0 0 0 0 0 0 0
> rcu-torture: Free-Block Circulation:  8 7 6 5 4 3 2 2 2 2 0
> rcu_torture_fwd_prog: Starting forward-progress test 0
> rcu_torture_fwd_prog_cr: Starting forward-progress test 0
> rcu_torture_fwd_prog_cr: Waiting for CBs: rcu_barrier+0x0/0x2c0() 0
> rcu_torture_fwd_prog_cr Duration 172 barrier: 82 pending 102 n_launders: =
4619 n_launders_sa: 101 n_max_gps: 100 n_max_cbs: 6750 cver 0 gps 9
> rcu_torture_fwd_cb_hist: Callback-invocation histogram 0 (duration 254 ji=
ffies): 1s/10: 558:3 2s/10: 3961:2 3s/10: 0:1 4s/10: 0:0 5s/10: 6748:3848 6=
s/10: 0:1 7s/10: 0:0 8s/10: 102:3851
> rcu_torture_fwd_prog_nr: Starting forward-progress test 0
> rcu-torture: rcu_torture_read_exit: Start of episode
> rcu-torture: rcu_torture_read_exit: End of episode
> Failed to start LKP bootstrap.
> See 'systemctl status lkp-bootstrap.service' for details.
> Reached target Multi-User System.
> Starting watchdog daemon...
> Started watchdog daemon.
> Reached target Graphical Interface.
> rcu-torture: rcu_torture_read_exit: Start of episode
> rcu-torture: rcu_torture_read_exit: End of episode
> rcu-torture: rcu_torture_read_exit: Start of episode
> rcu-torture: rcu_torture_read_exit: End of episode
> rcu-torture: rcu_torture_read_exit: Start of episode
> rcu-torture: rcu_torture_read_exit: End of episode
> rcu-torture: rtc: (ptrval) ver: 8 tfle: 0 rta: 9 rtaf: 0 rtf: 2 rtmbe: 0 =
rtmbkf: 0/0 rtbe: 0 rtbke: 0 rtbre: 0 rtbf: 0 rtb: 0 nt: 425 onoff: 0/0:0/0=
 -1,0:-1,0 0:0 (HZ=3D250) barrier: 0/0:0 read-exits: 152 nocb-toggles: 0:0
> rcu-torture: Reader Pipe:  219685 0 0 0 0 0 0 0 0 0 0
> rcu-torture: Reader Batch:  219685 0 0 0 0 0 0 0 0 0 0
> rcu-torture: Free-Block Circulation:  8 7 6 5 4 3 2 2 2 2 0
> ??? Writer stall state RTWS_POLL_WAIT_EXP(12) g36469 f0x2 ->state 0x2 cpu=
 1
> task:rcu_torture_wri state:D stack:    0 pid:  622 ppid:     2 flags:0x00=
004000
> Call Trace:
> ? __schedule+0x372/0xb30
> ? schedule+0x3d/0xc0
> ? schedule_hrtimeout_range_clock+0xa5/0x150
> ? hrtimer_init_sleeper+0x110/0x110
> ? schedule_hrtimeout+0xf/0x20
> ? torture_hrtimeout_ns+0x60/0x80 [torture]
> ? torture_hrtimeout_jiffies+0x31/0x40 [torture]
> ? rcu_torture_writer+0x54f/0x812 [rcutorture]
> ? kthread+0xcf/0xf0
> ? rcu_torture_pipe_update+0xd0/0xd0 [rcutorture]
> ? kthread_complete_and_exit+0x20/0x20
> ? ret_from_fork+0x1c/0x28
> rcu: rcu_sched: wait state: RCU_GP_WAIT_FQS(5) ->state: 0x0 ->rt_priority=
 0 delta ->gp_start 3 ->gp_activity 3 ->gp_req_activity 3 ->gp_wake_time 2 =
->gp_wake_seq 36469 ->gp_seq 36469 ->gp_seq_needed 36472 ->gp_max 1381 ->gp=
_flags 0x2
> rcu: 	rcu_node 0:1 ->gp_seq 36469 ->gp_seq_needed 36472 ->qsmask 0x0 ....=
 ->n_boosts 0
> rcu: 	cpu 1 ->gp_seq_needed 36472
> rcu: RCU callbacks invoked since boot: 186569
> rcu_tasks: RTGS_WAIT_CBS(11) since 44174 g:8 i:0/0 k. =

> rcu_tasks_rude: RTGS_WAIT_CBS(11) since 44200 g:8 i:0/3 k. =

> rcu_tasks_trace: RTGS_WAIT_CBS(11) since 44245 g:8 i:0/1 k. N0 h:0/0/0
> Dumping ftrace buffer:
> ---------------------------------
> swapper/-1         1...1. 13161106us : gen_synth_test: next_pid_field=3D7=
77 next_comm_field=3Dhula hoops ts_ns=3D1000000 ts_ms=3D1000 cpu=3D1 my_str=
ing_field=3Dthneed my_int_field=3D598
> rb_produ-52        0..... 13161123us : ring_buffer_producer: Starting rin=
g buffer hammer
> swapper/-1         1...1. 13162919us : empty_synth_test: next_pid_field=
=3D777 next_comm_field=3Dtiddlywinks ts_ns=3D1000000 ts_ms=3D1000 cpu=3D1 m=
y_string_field=3Dthneed_2.0 my_int_field=3D399
> swapper/-1         1...1. 13164663us : create_synth_test: next_pid_field=
=3D777 next_comm_field=3Dtiddlywinks ts_ns=3D1000000 dynstring_field_1=3Dxr=
ayspecs ts_ms=3D1000 cpu=3D1 my_string_field=3Dthneed dynstring_field_2=3Dk=
erplunk my_int_field=3D398
> swapper/-1         1...1. 13164666us : gen_synth_test: next_pid_field=3D7=
77 next_comm_field=3Dslinky ts_ns=3D1000000 ts_ms=3D1000 cpu=3D1 my_string_=
field=3Dthneed_2.01 my_int_field=3D395
> swapper/-1         1...1. 13164668us : gen_synth_test: next_pid_field=3D7=
77 next_comm_field=3Dsilly putty ts_ns=3D1000000 ts_ms=3D1000 cpu=3D1 my_st=
ring_field=3Dthneed_9 my_int_field=3D3999
> swapper/-1         1...1. 13164670us : create_synth_test: next_pid_field=
=3D444 next_comm_field=3Dclackers ts_ns=3D1000000 dynstring_field_1=3Dviewm=
aster ts_ms=3D1000 cpu=3D1 my_string_field=3DThneed dynstring_field_2=3Dyoy=
os my_int_field=3D999
> rb_produ-52        0..... 23161129us : ring_buffer_producer: End ring buf=
fer hammer
> rb_produ-52        0..... 23161235us : ring_buffer_producer: Running Cons=
umer at nice: 19
> rb_produ-52        0..... 23161236us : ring_buffer_producer: Running Prod=
ucer at nice: 19
> rb_produ-52        0..... 23161236us : ring_buffer_producer: WARNING!!! T=
his test is running at lowest priority.
> rb_produ-52        0..... 23161237us : ring_buffer_producer: Time:     10=
000003 (usecs)
> rb_produ-52        0..... 23161237us : ring_buffer_producer: Overruns: 26=
730885
> rb_produ-52        0..... 23161238us : ring_buffer_producer: Read:     37=
53710  (by events)
> rb_produ-52        0..... 23161239us : ring_buffer_producer: Entries:  62=
455
> rb_produ-52        0..... 23161239us : ring_buffer_producer: Total:    30=
547050
> rb_produ-52        0..... 23161240us : ring_buffer_producer: Missed:   0
> rb_produ-52        0..... 23161240us : ring_buffer_producer: Hit:      30=
547050
> rb_produ-52        0..... 23161240us : ring_buffer_producer: Entries per =
millisec: 3054
> rb_produ-52        0..... 23161241us : ring_buffer_producer: 327 ns per e=
ntry
> rb_produ-52        0..... 23161241us : ring_buffer_producer_thread: Sleep=
ing for 10 secs
> rb_produ-52        1..... 35509277us : ring_buffer_producer: Starting rin=
g buffer hammer
> rb_produ-52        1..... 45624911us : ring_buffer_producer: End ring buf=
fer hammer
> rb_produ-52        1..... 45630324us : ring_buffer_producer: Running Cons=
umer at nice: 19
> rb_produ-52        1..... 45630326us : ring_buffer_producer: Running Prod=
ucer at nice: 19
> rb_produ-52        1..... 45630327us : ring_buffer_producer: WARNING!!! T=
his test is running at lowest priority.
> rb_produ-52        1..... 45630327us : ring_buffer_producer: Time:     10=
115630 (usecs)
> rb_produ-52        1..... 45630328us : ring_buffer_producer: Overruns: 0
> rb_produ-52        1..... 45630329us : ring_buffer_producer: Read:     19=
3026  (by pages)
> rb_produ-52        1..... 45630329us : ring_buffer_producer: Entries:  74
> rb_produ-52        1..... 45630330us : ring_buffer_producer: Total:    19=
3100
> rb_produ-52        1..... 45630330us : ring_buffer_producer: Missed:   0
> rb_produ-52        1..... 45630330us : ring_buffer_producer: Hit:      19=
3100
> rb_produ-52        1..... 45630331us : ring_buffer_producer: Entries per =
millisec: 19
> rb_produ-52        1..... 45630331us : ring_buffer_producer: 52631 ns per=
 entry
> rb_produ-52        1..... 45630332us : ring_buffer_producer_thread: Sleep=
ing for 10 secs
> rb_produ-52        1..... 55892543us : ring_buffer_producer: Starting rin=
g buffer hammer
> rb_produ-52        1..... 66588507us : ring_buffer_producer: End ring buf=
fer hammer
> rb_produ-52        1..... 66628551us : ring_buffer_producer: Running Cons=
umer at nice: 19
> rb_produ-52        1..... 66628554us : ring_buffer_producer: Running Prod=
ucer at nice: 19
> rb_produ-52        1..... 66628554us : ring_buffer_producer: WARNING!!! T=
his test is running at lowest priority.
> rb_produ-52        1..... 66628555us : ring_buffer_producer: Time:     10=
695959 (usecs)
> rb_produ-52        1..... 66628556us : ring_buffer_producer: Overruns: 10=
7861
> rb_produ-52        1..... 66628557us : ring_buffer_producer: Read:     16=
6062  (by events)
> rb_produ-52        1..... 66628559us : ring_buffer_producer: Entries:  62=
477
> rb_produ-52        1..... 66628560us : ring_buffer_producer: Total:    33=
6400
> rb_produ-52        1..... 66628560us : ring_buffer_producer: Missed:   0
> rb_produ-52        1..... 66628561us : ring_buffer_producer: Hit:      33=
6400
> rb_produ-52        1..... 66628561us : ring_buffer_producer: Entries per =
millisec: 31
> rb_produ-52        1..... 66628561us : ring_buffer_producer: 32258 ns per=
 entry
> rb_produ-52        1..... 66628562us : ring_buffer_producer_thread: Sleep=
ing for 10 secs
> rb_produ-52        1..... 76884535us : ring_buffer_producer: Starting rin=
g buffer hammer
> rb_produ-52        1..... 87248520us : ring_buffer_producer: End ring buf=
fer hammer
> rb_produ-52        1..... 87248536us : ring_buffer_producer: Running Cons=
umer at nice: 19
> rb_produ-52        1..... 87248537us : ring_buffer_producer: Running Prod=
ucer at nice: 19
> rb_produ-52        1..... 87248537us : ring_buffer_producer: WARNING!!! T=
his test is running at lowest priority.
> rb_produ-52        1..... 87248537us : ring_buffer_producer: Time:     10=
363980 (usecs)
> rb_produ-52        1..... 87248538us : ring_buffer_producer: Overruns: 0
> rb_produ-52        1..... 87248539us : ring_buffer_producer: Read:     38=
8856  (by pages)
> rb_produ-52        1..... 87248539us : ring_buffer_producer: Entries:  294
> rb_produ-52        1..... 87248539us : ring_buffer_producer: Total:    38=
9150
> rb_produ-52        1..... 87248540us : ring_buffer_producer: Missed:   0
> rb_produ-52        1..... 87248540us : ring_buffer_producer: Hit:      38=
9150
> rb_produ-52        1..... 87248540us : ring_buffer_producer: Entries per =
millisec: 37
> rb_produ-52        1..... 87248540us : ring_buffer_producer: 27027 ns per=
 entry
> rb_produ-52        1..... 87248541us : ring_buffer_producer_thread: Sleep=
ing for 10 secs
> rb_produ-52        1..... 97360529us : ring_buffer_producer: Starting rin=
g buffer hammer
> rb_produ-52        1..... 107380553us : ring_buffer_producer: End ring bu=
ffer hammer
> rb_produ-52        1..... 107656559us : ring_buffer_producer: Running Con=
sumer at nice: 19
> rb_produ-52        1..... 107656561us : ring_buffer_producer: Running Pro=
ducer at nice: 19
> rb_produ-52        1..... 107656562us : ring_buffer_producer: WARNING!!! =
This test is running at lowest priority.
> rb_produ-52        1..... 107656563us : ring_buffer_producer: Time:     1=
0020020 (usecs)
> rb_produ-52        1..... 107656563us : ring_buffer_producer: Overruns: 2=
77684
> rb_produ-52        1..... 107656565us : ring_buffer_producer: Read:     3=
39914  (by events)
> rb_produ-52        1..... 107656565us : ring_buffer_producer: Entries:  6=
2502
> rb_produ-52        1..... 107656566us : ring_buffer_producer: Total:    6=
80100
> rb_produ-52        1..... 107656566us : ring_buffer_producer: Missed:   0
> rb_produ-52        1..... 107656566us : ring_buffer_producer: Hit:      6=
80100
> rb_produ-52        1..... 107656567us : ring_buffer_producer: Entries per=
 millisec: 67
> rb_produ-52        1..... 107656567us : ring_buffer_producer: 14925 ns pe=
r entry
> rb_produ-52        1..... 107656568us : ring_buffer_producer_thread: Slee=
ping for 10 secs
> rb_produ-52        1..... 117836617us : ring_buffer_producer: Starting ri=
ng buffer hammer
> rb_produ-52        1..... 127884553us : ring_buffer_producer: End ring bu=
ffer hammer
> rb_produ-52        1..... 127884573us : ring_buffer_producer: Running Con=
sumer at nice: 19
> rb_produ-52        1..... 127884574us : ring_buffer_producer: Running Pro=
ducer at nice: 19
> rb_produ-52        1..... 127884574us : ring_buffer_producer: WARNING!!! =
This test is running at lowest priority.
> rb_produ-52        1..... 127884575us : ring_buffer_producer: Time:     1=
0047932 (usecs)
> rb_produ-52        1..... 127884575us : ring_buffer_producer: Overruns: 0
> rb_produ-52        1..... 127884577us : ring_buffer_producer: Read:     7=
66240  (by pages)
> rb_produ-52        1..... 127884577us : ring_buffer_producer: Entries:  60
> rb_produ-52        1..... 127884578us : ring_buffer_producer: Total:    7=
66300
> rb_produ-52        1..... 127884578us : ring_buffer_producer: Missed:   0
> rb_produ-52        1..... 127884578us : ring_buffer_producer: Hit:      7=
66300
> rb_produ-52        1..... 127884579us : ring_buffer_producer: Entries per=
 millisec: 76
> rb_produ-52        1..... 127884579us : ring_buffer_producer: 13157 ns pe=
r entry
> rb_produ-52        1..... 127884579us : ring_buffer_producer_thread: Slee=
ping for 10 secs
> rb_produ-52        1..... 138060548us : ring_buffer_producer: Starting ri=
ng buffer hammer
> rb_produ-52        1..... 148296614us : ring_buffer_producer: End ring bu=
ffer hammer
> rb_produ-52        1..... 148656550us : ring_buffer_producer: Running Con=
sumer at nice: 19
> rb_produ-52        1..... 148656553us : ring_buffer_producer: Running Pro=
ducer at nice: 19
> rb_produ-52        1..... 148656553us : ring_buffer_producer: WARNING!!! =
This test is running at lowest priority.
> rb_produ-52        1..... 148656554us : ring_buffer_producer: Time:     1=
0236062 (usecs)
> rb_produ-52        1..... 148656554us : ring_buffer_producer: Overruns: 3=
09812
> rb_produ-52        1..... 148656556us : ring_buffer_producer: Read:     3=
79692  (by events)
> rb_produ-52        1..... 148656556us : ring_buffer_producer: Entries:  6=
2596
> rb_produ-52        1..... 148656557us : ring_buffer_producer: Total:    7=
52100
> rb_produ-52        1..... 148656557us : ring_buffer_producer: Missed:   0
> rb_produ-52        1..... 148656557us : ring_buffer_producer: Hit:      7=
52100
> rb_produ-52        1..... 148656558us : ring_buffer_producer: Entries per=
 millisec: 73
> rb_produ-52        1..... 148656558us : ring_buffer_producer: 13698 ns pe=
r entry
> rb_produ-52        1..... 148656559us : ring_buffer_producer_thread: Slee=
ping for 10 secs
> rb_produ-52        1..... 158796625us : ring_buffer_producer: Starting ri=
ng buffer hammer
> rb_produ-52        1..... 168972578us : ring_buffer_producer: End ring bu=
ffer hammer
> rb_produ-52        1..... 168976544us : ring_buffer_producer: Running Con=
sumer at nice: 19
> rb_produ-52        1..... 168976545us : ring_buffer_producer: Running Pro=
ducer at nice: 19
> rb_produ-52        1..... 168976546us : ring_buffer_producer: WARNING!!! =
This test is running at lowest priority.
> rb_produ-52        1..... 168976546us : ring_buffer_producer: Time:     1=
0175949 (usecs)
> rb_produ-52        1..... 168976547us : ring_buffer_producer: Overruns: 0
> rb_produ-52        1..... 168976548us : ring_buffer_producer: Read:     7=
82049  (by pages)
> rb_produ-52        1..... 168976549us : ring_buffer_producer: Entries:  3=
01
> rb_produ-52        1..... 168976549us : ring_buffer_producer: Total:    7=
82350
> rb_produ-52        1..... 168976549us : ring_buffer_producer: Missed:   0
> rb_produ-52        1..... 168976550us : ring_buffer_producer: Hit:      7=
82350
> rb_produ-52        1..... 168976550us : ring_buffer_producer: Entries per=
 millisec: 76
> rb_produ-52        1..... 168976551us : ring_buffer_producer: 13157 ns pe=
r entry
> rb_produ-52        1..... 168976552us : ring_buffer_producer_thread: Slee=
ping for 10 secs
> ---------------------------------
> rcu-torture: rcu_torture_read_exit: Start of episode
> rcu-torture: rcu_torture_read_exit: End of episode
> rcu-torture: rcu_torture_read_exit: Start of episode
> rcu-torture: rcu_torture_read_exit: End of episode
> rcu-torture: rcu_torture_read_exit: Start of episode
> rcu-torture: rcu_torture_read_exit: End of episode
> rcu_torture_fwd_prog_nr: 0 Duration 24379 cver 0 gps 8616
> rcu_torture_fwd_prog_nr: Waiting for CBs: rcu_barrier+0x0/0x2c0() 0
> rcu-torture: rcu_torture_read_exit: Start of episode
> rcu-torture: rcu_torture_read_exit: End of episode
> rcu-torture: rcu_torture_read_exit: Start of episode
> rcu-torture: rcu_torture_read_exit: End of episode
> rcu-torture: rtc: (ptrval) ver: 8 tfle: 0 rta: 9 rtaf: 0 rtf: 2 rtmbe: 0 =
rtmbkf: 0/0 rtbe: 0 rtbke: 0 rtbre: 0 rtbf: 0 rtb: 0 nt: 712 onoff: 0/0:0/0=
 -1,0:-1,0 0:0 (HZ=3D250) barrier: 0/0:0 read-exits: 237 nocb-toggles: 0:0
> rcu-torture: Reader Pipe:  362204 0 0 0 0 0 0 0 0 0 0
> rcu-torture: Reader Batch:  362204 0 0 0 0 0 0 0 0 0 0
> rcu-torture: Free-Block Circulation:  8 7 6 5 4 3 2 2 2 2 0
> ??? Writer stall state RTWS_POLL_WAIT_EXP(12) g50576 f0x0 ->state 0x2 cpu=
 1
> rcu: rcu_sched: wait state: RCU_GP_WAIT_GPS(1) ->state: 0x402 ->rt_priori=
ty 0 delta ->gp_start 94 ->gp_activity 93 ->gp_req_activity 94 ->gp_wake_ti=
me 93 ->gp_wake_seq 50573 ->gp_seq 50576 ->gp_seq_needed 50576 ->gp_max 138=
1 ->gp_flags 0x0
> rcu: RCU callbacks invoked since boot: 191844
> rcu_tasks: RTGS_WAIT_CBS(11) since 59532 g:8 i:0/0 k. =

> rcu_tasks_rude: RTGS_WAIT_CBS(11) since 59558 g:8 i:0/3 k. =

> rcu_tasks_trace: RTGS_WAIT_CBS(11) since 59603 g:8 i:0/1 k. N0 h:0/0/0
> rcu-torture: rcu_torture_read_exit: Start of episode
> rcu-torture: rcu_torture_read_exit: End of episode
> rcu-torture: rcu_torture_read_exit: Start of episode
> rcu-torture: rcu_torture_read_exit: End of episode
> rcu-torture: rcu_torture_read_exit: Start of episode
> rcu_torture_fwd_prog n_max_cbs: 6750
> rcu_torture_fwd_prog: Starting forward-progress test 0
> rcu_torture_fwd_prog_cr: Starting forward-progress test 0
> rcu_torture_fwd_prog_cr: Waiting for CBs: rcu_barrier+0x0/0x2c0() 0
> rcu_torture_fwd_prog_cr Duration 211 barrier: 80 pending 101 n_launders: =
7443 n_launders_sa: 101 n_max_gps: 100 n_max_cbs: 6759 cver 0 gps 8
> rcu_torture_fwd_cb_hist: Callback-invocation histogram 0 (duration 291 ji=
ffies): 1s/10: 2391:3 2s/10: 0:1 3s/10: 4952:8960 4s/10: 0:1 5s/10: 0:3848 =
6s/10: 6758:8958 7s/10: 0:1 8s/10: 0:3851 9s/10: 101:8957
> rcu_torture_fwd_prog_nr: Starting forward-progress test 0
> rcu-torture: rcu_torture_read_exit: End of episode
> rcu-torture: rcu_torture_read_exit: Start of episode
> rcu-torture: rcu_torture_read_exit: End of episode
> rcu-torture: rtc: (ptrval) ver: 8 tfle: 0 rta: 9 rtaf: 0 rtf: 2 rtmbe: 0 =
rtmbkf: 0/0 rtbe: 0 rtbke: 0 rtbre: 0 rtbf: 0 rtb: 0 nt: 917 onoff: 0/0:0/0=
 -1,0:-1,0 0:0 (HZ=3D250) barrier: 0/0:0 read-exits: 305 nocb-toggles: 0:0
> rcu-torture: Reader Pipe:  458654 0 0 0 0 0 0 0 0 0 0
> rcu-torture: Reader Batch:  458654 0 0 0 0 0 0 0 0 0 0
> rcu-torture: Free-Block Circulation:  8 7 6 5 4 3 2 2 2 2 0
> ??? Writer stall state RTWS_POLL_WAIT_EXP(12) g58396 f0x0 ->state 0x2 cpu=
 1
> rcu: rcu_sched: wait state: RCU_GP_WAIT_GPS(1) ->state: 0x402 ->rt_priori=
ty 0 delta ->gp_start 2 ->gp_activity 1 ->gp_req_activity 2 ->gp_wake_time =
1 ->gp_wake_seq 58393 ->gp_seq 58396 ->gp_seq_needed 58396 ->gp_max 1381 ->=
gp_flags 0x0
> rcu: 	rcu_node 0:1 ->gp_seq 58396 ->gp_seq_needed 58400 ->qsmask 0x0 ....=
 ->n_boosts 0
> rcu: RCU callbacks invoked since boot: 208517
> rcu_tasks: RTGS_WAIT_CBS(11) since 74892 g:8 i:0/0 k. =

> rcu_tasks_rude: RTGS_WAIT_CBS(11) since 74918 g:8 i:0/3 k. =

> rcu_tasks_trace: RTGS_WAIT_CBS(11) since 74963 g:8 i:0/1 k. N0 h:0/0/0
> rcu-torture: rcu_torture_read_exit: Start of episode
> rcu-torture: rcu_torture_read_exit: End of episode
> rcu-torture: rcu_torture_read_exit: Start of episode
> rcu-torture: rcu_torture_read_exit: End of episode
> rcu-torture: rcu_torture_read_exit: Start of episode
> rcu-torture: rcu_torture_read_exit: End of episode
> rcu-torture: rcu_torture_read_exit: Start of episode
> rcu-torture: rcu_torture_read_exit: End of episode
> 2022-02-03 05:02:11 rmmod rcutorture
> =

> rcu-torture: Stopping torture_shuffle task
> rcu-torture: torture_shuffle is stopping
> rcu-torture: Stopping torture_stutter task
> rcu-torture: torture_stutter is stopping
> rcu: rcu_sched: wait state: RCU_GP_WAIT_FQS(5) ->state: 0x402 ->rt_priori=
ty 0 delta ->gp_start 0 ->gp_activity 0 ->gp_req_activity 0 ->gp_wake_time =
0 ->gp_wake_seq 77601 ->gp_seq 77605 ->gp_seq_needed 77608 ->gp_max 1381 ->=
gp_flags 0x0
> rcu: 	rcu_node 0:1 ->gp_seq 77605 ->gp_seq_needed 77608 ->qsmask 0x2 ....=
 ->n_boosts 0
> rcu: 	cpu 1 ->gp_seq_needed 77608
> rcu: RCU callbacks invoked since boot: 214159
> rcu_tasks: RTGS_WAIT_CBS(11) since 88585 g:8 i:0/0 k. =

> rcu_tasks_rude: RTGS_WAIT_CBS(11) since 88611 g:8 i:0/3 k. =

> rcu_tasks_trace: RTGS_WAIT_CBS(11) since 88656 g:8 i:0/1 k. N0 h:0/0/0
> rcu-torture: rcu_torture_reader is stopping
> rcu_torture_fwd_prog_nr: Waiting for CBs: rcu_barrier+0x0/0x2c0() 0
> rcu-torture: rcu_torture_read_exit is stopping
> rcu-torture: Stopping rcutorture_read_exit task
> rcu-torture: Stopping rcu_torture_fwd_prog task
> rcu_torture_fwd_prog: tested 1 tested_tries 2
> rcu-torture: rcu_torture_fwd_prog is stopping
> rcu-torture: Stopping rcu_torture_writer task
> rcu-torture: rtc: (ptrval) ver: 8 tfle: 0 rta: 9 rtaf: 0 rtf: 2 rtmbe: 0 =
rtmbkf: 0/0 rtbe: 0 rtbke: 0 rtbre: 0 rtbf: 0 rtb: 0 nt: 1137 onoff: 0/0:0/=
0 -1,0:-1,0 0:0 (HZ=3D250) barrier: 0/0:0 read-exits: 373 nocb-toggles: 0:0
> rcu-torture: Reader Pipe:  594426 0 0 0 0 0 0 0 0 0 0
> rcu-torture: Reader Batch:  594426 0 0 0 0 0 0 0 0 0 0
> rcu-torture: Free-Block Circulation:  8 7 6 5 4 3 2 2 2 2 0
> ??? Writer stall state RTWS_POLL_WAIT_EXP(12) g77749 f0x2 ->state 0x2 cpu=
 1
> rcu: rcu_sched: wait state: RCU_GP_WAIT_FQS(5) ->state: 0x0 ->rt_priority=
 0 delta ->gp_start 1 ->gp_activity 1 ->gp_req_activity 1 ->gp_wake_time 0 =
->gp_wake_seq 77749 ->gp_seq 77749 ->gp_seq_needed 77752 ->gp_max 1381 ->gp=
_flags 0x2
> rcu: 	rcu_node 0:1 ->gp_seq 77749 ->gp_seq_needed 77752 ->qsmask 0x0 ....=
 ->n_boosts 0
> rcu: 	cpu 1 ->gp_seq_needed 77752
> rcu: RCU callbacks invoked since boot: 214347
> rcu_tasks: RTGS_WAIT_CBS(11) since 90252 g:8 i:0/0 k. =

> rcu_tasks_rude: RTGS_WAIT_CBS(11) since 90278 g:8 i:0/3 k. =

> rcu_tasks_trace: RTGS_WAIT_CBS(11) since 90323 g:8 i:0/1 k. N0 h:0/0/0
> rcu-torture: rcu_torture_stats is stopping
> random: crng init done
> random: 7 urandom warning(s) missed due to ratelimiting
> BUG: workqueue lockup - pool cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 stuck=
 for 344s!
> Showing busy workqueues and worker pools:
> workqueue events: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D14/256 refcnt=3D15
> pending: vmstat_shepherd, regulator_init_complete_work_function, e1000_wa=
tchdog, kfree_rcu_monitor, netstamp_clear, release_one_tty, release_one_tty=
, release_one_tty, release_one_tty, cgroup1_release_agent, cgroup1_release_=
agent, release_one_tty, release_one_tty, cgroup1_release_agent
> workqueue events_unbound: flags=3D0x2
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D1/512 refcnt=3D4
> in-flight: 42:fsnotify_mark_destroy_workfn BAR(1)
> workqueue events_power_efficient: flags=3D0x82
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D1/256 refcnt=3D3
> pending: do_cache_clean
> workqueue rcu_gp: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D3/256 refcnt=3D4
> in-flight: 20:sync_rcu_do_polled_gp
> pending: sync_rcu_do_polled_gp, process_srcu
> workqueue mm_percpu_wq: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/256 refcnt=3D2
> pending: vmstat_update
> workqueue cgroup_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: css_release_work_fn
> workqueue cgroup_pidlist_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D5
> pending: cgroup_pidlist_destroy_work_fn
> inactive: cgroup_pidlist_destroy_work_fn, cgroup_pidlist_destroy_work_fn,=
 cgroup_pidlist_destroy_work_fn
> workqueue ipv6_addrconf: flags=3D0x40008
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: addrconf_verify_work
> pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hung=3D344s workers=3D3 id=
le: 66 349
> pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s workers=3D3 idle: 38 46
> BUG: workqueue lockup - pool cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 stuck=
 for 375s!
> Showing busy workqueues and worker pools:
> workqueue events: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D14/256 refcnt=3D15
> pending: vmstat_shepherd, regulator_init_complete_work_function, e1000_wa=
tchdog, kfree_rcu_monitor, netstamp_clear, release_one_tty, release_one_tty=
, release_one_tty, release_one_tty, cgroup1_release_agent, cgroup1_release_=
agent, release_one_tty, release_one_tty, cgroup1_release_agent
> workqueue events_unbound: flags=3D0x2
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D1/512 refcnt=3D4
> in-flight: 42:fsnotify_mark_destroy_workfn BAR(1)
> workqueue events_power_efficient: flags=3D0x82
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D1/256 refcnt=3D3
> pending: do_cache_clean
> workqueue rcu_gp: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D3/256 refcnt=3D4
> in-flight: 20:sync_rcu_do_polled_gp
> pending: sync_rcu_do_polled_gp, process_srcu
> workqueue mm_percpu_wq: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/256 refcnt=3D2
> pending: vmstat_update
> workqueue cgroup_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: css_release_work_fn
> workqueue cgroup_pidlist_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D5
> pending: cgroup_pidlist_destroy_work_fn
> inactive: cgroup_pidlist_destroy_work_fn, cgroup_pidlist_destroy_work_fn,=
 cgroup_pidlist_destroy_work_fn
> workqueue ipv6_addrconf: flags=3D0x40008
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: addrconf_verify_work
> pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hung=3D375s workers=3D3 id=
le: 66 349
> pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s workers=3D3 idle: 38 46
> BUG: workqueue lockup - pool cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 stuck=
 for 406s!
> Showing busy workqueues and worker pools:
> workqueue events: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D14/256 refcnt=3D15
> pending: vmstat_shepherd, regulator_init_complete_work_function, e1000_wa=
tchdog, kfree_rcu_monitor, netstamp_clear, release_one_tty, release_one_tty=
, release_one_tty, release_one_tty, cgroup1_release_agent, cgroup1_release_=
agent, release_one_tty, release_one_tty, cgroup1_release_agent
> workqueue events_unbound: flags=3D0x2
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D1/512 refcnt=3D4
> in-flight: 42:fsnotify_mark_destroy_workfn BAR(1)
> workqueue events_power_efficient: flags=3D0x82
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D1/256 refcnt=3D3
> pending: do_cache_clean
> workqueue rcu_gp: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D3/256 refcnt=3D4
> in-flight: 20:sync_rcu_do_polled_gp
> pending: sync_rcu_do_polled_gp, process_srcu
> workqueue mm_percpu_wq: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/256 refcnt=3D2
> pending: vmstat_update
> workqueue cgroup_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: css_release_work_fn
> workqueue cgroup_pidlist_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D5
> pending: cgroup_pidlist_destroy_work_fn
> inactive: cgroup_pidlist_destroy_work_fn, cgroup_pidlist_destroy_work_fn,=
 cgroup_pidlist_destroy_work_fn
> workqueue ipv6_addrconf: flags=3D0x40008
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: addrconf_verify_work
> pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hung=3D406s workers=3D3 id=
le: 66 349
> pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s workers=3D3 idle: 38 46
> BUG: workqueue lockup - pool cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 stuck=
 for 436s!
> Showing busy workqueues and worker pools:
> workqueue events: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D14/256 refcnt=3D15
> pending: vmstat_shepherd, regulator_init_complete_work_function, e1000_wa=
tchdog, kfree_rcu_monitor, netstamp_clear, release_one_tty, release_one_tty=
, release_one_tty, release_one_tty, cgroup1_release_agent, cgroup1_release_=
agent, release_one_tty, release_one_tty, cgroup1_release_agent
> workqueue events_unbound: flags=3D0x2
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D1/512 refcnt=3D4
> in-flight: 42:fsnotify_mark_destroy_workfn BAR(1)
> workqueue events_power_efficient: flags=3D0x82
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D1/256 refcnt=3D3
> pending: do_cache_clean
> workqueue rcu_gp: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D3/256 refcnt=3D4
> in-flight: 20:sync_rcu_do_polled_gp
> pending: sync_rcu_do_polled_gp, process_srcu
> workqueue mm_percpu_wq: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/256 refcnt=3D2
> pending: vmstat_update
> workqueue cgroup_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: css_release_work_fn
> workqueue cgroup_pidlist_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D5
> pending: cgroup_pidlist_destroy_work_fn
> inactive: cgroup_pidlist_destroy_work_fn, cgroup_pidlist_destroy_work_fn,=
 cgroup_pidlist_destroy_work_fn
> workqueue ipv6_addrconf: flags=3D0x40008
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: addrconf_verify_work
> pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hung=3D436s workers=3D3 id=
le: 66 349
> pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s workers=3D3 idle: 38 46
> BUG: workqueue lockup - pool cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 stuck=
 for 467s!
> Showing busy workqueues and worker pools:
> workqueue events: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D14/256 refcnt=3D15
> pending: vmstat_shepherd, regulator_init_complete_work_function, e1000_wa=
tchdog, kfree_rcu_monitor, netstamp_clear, release_one_tty, release_one_tty=
, release_one_tty, release_one_tty, cgroup1_release_agent, cgroup1_release_=
agent, release_one_tty, release_one_tty, cgroup1_release_agent
> workqueue events_unbound: flags=3D0x2
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D1/512 refcnt=3D4
> in-flight: 42:fsnotify_mark_destroy_workfn BAR(1)
> workqueue events_power_efficient: flags=3D0x82
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D1/256 refcnt=3D3
> pending: do_cache_clean
> workqueue rcu_gp: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D3/256 refcnt=3D4
> in-flight: 20:sync_rcu_do_polled_gp
> pending: sync_rcu_do_polled_gp, process_srcu
> workqueue mm_percpu_wq: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/256 refcnt=3D2
> pending: vmstat_update
> workqueue cgroup_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: css_release_work_fn
> workqueue cgroup_pidlist_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D5
> pending: cgroup_pidlist_destroy_work_fn
> inactive: cgroup_pidlist_destroy_work_fn, cgroup_pidlist_destroy_work_fn,=
 cgroup_pidlist_destroy_work_fn
> workqueue ipv6_addrconf: flags=3D0x40008
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: addrconf_verify_work
> pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hung=3D467s workers=3D3 id=
le: 66 349
> pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s workers=3D3 idle: 38 46
> BUG: workqueue lockup - pool cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 stuck=
 for 498s!
> Showing busy workqueues and worker pools:
> workqueue events: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D14/256 refcnt=3D15
> pending: vmstat_shepherd, regulator_init_complete_work_function, e1000_wa=
tchdog, kfree_rcu_monitor, netstamp_clear, release_one_tty, release_one_tty=
, release_one_tty, release_one_tty, cgroup1_release_agent, cgroup1_release_=
agent, release_one_tty, release_one_tty, cgroup1_release_agent
> workqueue events_unbound: flags=3D0x2
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D1/512 refcnt=3D4
> in-flight: 42:fsnotify_mark_destroy_workfn BAR(1)
> workqueue events_power_efficient: flags=3D0x82
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D1/256 refcnt=3D3
> pending: do_cache_clean
> workqueue rcu_gp: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D3/256 refcnt=3D4
> in-flight: 20:sync_rcu_do_polled_gp
> pending: sync_rcu_do_polled_gp, process_srcu
> workqueue mm_percpu_wq: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/256 refcnt=3D2
> pending: vmstat_update
> workqueue cgroup_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: css_release_work_fn
> workqueue cgroup_pidlist_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D5
> pending: cgroup_pidlist_destroy_work_fn
> inactive: cgroup_pidlist_destroy_work_fn, cgroup_pidlist_destroy_work_fn,=
 cgroup_pidlist_destroy_work_fn
> workqueue ipv6_addrconf: flags=3D0x40008
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: addrconf_verify_work
> pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hung=3D498s workers=3D3 id=
le: 66 349
> pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s workers=3D3 idle: 38 46
> BUG: workqueue lockup - pool cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 stuck=
 for 529s!
> Showing busy workqueues and worker pools:
> workqueue events: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D14/256 refcnt=3D15
> pending: vmstat_shepherd, regulator_init_complete_work_function, e1000_wa=
tchdog, kfree_rcu_monitor, netstamp_clear, release_one_tty, release_one_tty=
, release_one_tty, release_one_tty, cgroup1_release_agent, cgroup1_release_=
agent, release_one_tty, release_one_tty, cgroup1_release_agent
> workqueue events_unbound: flags=3D0x2
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D1/512 refcnt=3D4
> in-flight: 42:fsnotify_mark_destroy_workfn BAR(1)
> workqueue events_power_efficient: flags=3D0x82
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D1/256 refcnt=3D3
> pending: do_cache_clean
> workqueue rcu_gp: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D3/256 refcnt=3D4
> in-flight: 20:sync_rcu_do_polled_gp
> pending: sync_rcu_do_polled_gp, process_srcu
> workqueue mm_percpu_wq: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/256 refcnt=3D2
> pending: vmstat_update
> workqueue cgroup_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: css_release_work_fn
> workqueue cgroup_pidlist_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D5
> pending: cgroup_pidlist_destroy_work_fn
> inactive: cgroup_pidlist_destroy_work_fn, cgroup_pidlist_destroy_work_fn,=
 cgroup_pidlist_destroy_work_fn
> workqueue ipv6_addrconf: flags=3D0x40008
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: addrconf_verify_work
> pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hung=3D529s workers=3D3 id=
le: 66 349
> pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s workers=3D3 idle: 38 46
> BUG: workqueue lockup - pool cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 stuck=
 for 559s!
> Showing busy workqueues and worker pools:
> workqueue events: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D14/256 refcnt=3D15
> pending: vmstat_shepherd, regulator_init_complete_work_function, e1000_wa=
tchdog, kfree_rcu_monitor, netstamp_clear, release_one_tty, release_one_tty=
, release_one_tty, release_one_tty, cgroup1_release_agent, cgroup1_release_=
agent, release_one_tty, release_one_tty, cgroup1_release_agent
> workqueue events_unbound: flags=3D0x2
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D1/512 refcnt=3D4
> in-flight: 42:fsnotify_mark_destroy_workfn BAR(1)
> workqueue events_power_efficient: flags=3D0x82
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D1/256 refcnt=3D3
> pending: do_cache_clean
> workqueue rcu_gp: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D3/256 refcnt=3D4
> in-flight: 20:sync_rcu_do_polled_gp
> pending: sync_rcu_do_polled_gp, process_srcu
> workqueue mm_percpu_wq: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/256 refcnt=3D2
> pending: vmstat_update
> workqueue cgroup_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: css_release_work_fn
> workqueue cgroup_pidlist_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D5
> pending: cgroup_pidlist_destroy_work_fn
> inactive: cgroup_pidlist_destroy_work_fn, cgroup_pidlist_destroy_work_fn,=
 cgroup_pidlist_destroy_work_fn
> workqueue ipv6_addrconf: flags=3D0x40008
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: addrconf_verify_work
> pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hung=3D559s workers=3D3 id=
le: 66 349
> pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s workers=3D3 idle: 46 38
> BUG: workqueue lockup - pool cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 stuck=
 for 590s!
> Showing busy workqueues and worker pools:
> workqueue events: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D14/256 refcnt=3D15
> pending: vmstat_shepherd, regulator_init_complete_work_function, e1000_wa=
tchdog, kfree_rcu_monitor, netstamp_clear, release_one_tty, release_one_tty=
, release_one_tty, release_one_tty, cgroup1_release_agent, cgroup1_release_=
agent, release_one_tty, release_one_tty, cgroup1_release_agent
> workqueue events_unbound: flags=3D0x2
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D1/512 refcnt=3D4
> in-flight: 42:fsnotify_mark_destroy_workfn BAR(1)
> workqueue events_power_efficient: flags=3D0x82
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D1/256 refcnt=3D3
> pending: do_cache_clean
> workqueue rcu_gp: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D3/256 refcnt=3D4
> in-flight: 20:sync_rcu_do_polled_gp
> pending: sync_rcu_do_polled_gp, process_srcu
> workqueue mm_percpu_wq: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/256 refcnt=3D2
> pending: vmstat_update
> workqueue cgroup_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: css_release_work_fn
> workqueue cgroup_pidlist_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D5
> pending: cgroup_pidlist_destroy_work_fn
> inactive: cgroup_pidlist_destroy_work_fn, cgroup_pidlist_destroy_work_fn,=
 cgroup_pidlist_destroy_work_fn
> workqueue ipv6_addrconf: flags=3D0x40008
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: addrconf_verify_work
> pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hung=3D590s workers=3D3 id=
le: 66 349
> pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s workers=3D3 idle: 46 38
> BUG: workqueue lockup - pool cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 stuck=
 for 621s!
> Showing busy workqueues and worker pools:
> workqueue events: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D14/256 refcnt=3D15
> pending: vmstat_shepherd, regulator_init_complete_work_function, e1000_wa=
tchdog, kfree_rcu_monitor, netstamp_clear, release_one_tty, release_one_tty=
, release_one_tty, release_one_tty, cgroup1_release_agent, cgroup1_release_=
agent, release_one_tty, release_one_tty, cgroup1_release_agent
> workqueue events_unbound: flags=3D0x2
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D1/512 refcnt=3D4
> in-flight: 42:fsnotify_mark_destroy_workfn BAR(1)
> workqueue events_power_efficient: flags=3D0x82
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D1/256 refcnt=3D3
> pending: do_cache_clean
> workqueue rcu_gp: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D3/256 refcnt=3D4
> in-flight: 20:sync_rcu_do_polled_gp
> pending: sync_rcu_do_polled_gp, process_srcu
> workqueue mm_percpu_wq: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/256 refcnt=3D2
> pending: vmstat_update
> workqueue cgroup_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: css_release_work_fn
> workqueue cgroup_pidlist_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D5
> pending: cgroup_pidlist_destroy_work_fn
> inactive: cgroup_pidlist_destroy_work_fn, cgroup_pidlist_destroy_work_fn,=
 cgroup_pidlist_destroy_work_fn
> workqueue ipv6_addrconf: flags=3D0x40008
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: addrconf_verify_work
> pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hung=3D621s workers=3D3 id=
le: 66 349
> pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s workers=3D3 idle: 46 38
> BUG: workqueue lockup - pool cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 stuck=
 for 651s!
> Showing busy workqueues and worker pools:
> workqueue events: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D14/256 refcnt=3D15
> pending: vmstat_shepherd, regulator_init_complete_work_function, e1000_wa=
tchdog, kfree_rcu_monitor, netstamp_clear, release_one_tty, release_one_tty=
, release_one_tty, release_one_tty, cgroup1_release_agent, cgroup1_release_=
agent, release_one_tty, release_one_tty, cgroup1_release_agent
> workqueue events_unbound: flags=3D0x2
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D1/512 refcnt=3D4
> in-flight: 42:fsnotify_mark_destroy_workfn BAR(1)
> workqueue events_power_efficient: flags=3D0x82
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D1/256 refcnt=3D3
> pending: do_cache_clean
> workqueue rcu_gp: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D3/256 refcnt=3D4
> in-flight: 20:sync_rcu_do_polled_gp
> pending: sync_rcu_do_polled_gp, process_srcu
> workqueue mm_percpu_wq: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/256 refcnt=3D2
> pending: vmstat_update
> workqueue cgroup_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: css_release_work_fn
> workqueue cgroup_pidlist_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D5
> pending: cgroup_pidlist_destroy_work_fn
> inactive: cgroup_pidlist_destroy_work_fn, cgroup_pidlist_destroy_work_fn,=
 cgroup_pidlist_destroy_work_fn
> workqueue ipv6_addrconf: flags=3D0x40008
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: addrconf_verify_work
> pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hung=3D651s workers=3D3 id=
le: 66 349
> pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s workers=3D3 idle: 46 38
> BUG: workqueue lockup - pool cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 stuck=
 for 682s!
> Showing busy workqueues and worker pools:
> workqueue events: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D14/256 refcnt=3D15
> pending: vmstat_shepherd, regulator_init_complete_work_function, e1000_wa=
tchdog, kfree_rcu_monitor, netstamp_clear, release_one_tty, release_one_tty=
, release_one_tty, release_one_tty, cgroup1_release_agent, cgroup1_release_=
agent, release_one_tty, release_one_tty, cgroup1_release_agent
> workqueue events_unbound: flags=3D0x2
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D1/512 refcnt=3D4
> in-flight: 42:fsnotify_mark_destroy_workfn BAR(1)
> workqueue events_power_efficient: flags=3D0x82
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D1/256 refcnt=3D3
> pending: do_cache_clean
> workqueue rcu_gp: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D3/256 refcnt=3D4
> in-flight: 20:sync_rcu_do_polled_gp
> pending: sync_rcu_do_polled_gp, process_srcu
> workqueue mm_percpu_wq: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/256 refcnt=3D2
> pending: vmstat_update
> workqueue cgroup_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: css_release_work_fn
> workqueue cgroup_pidlist_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D5
> pending: cgroup_pidlist_destroy_work_fn
> inactive: cgroup_pidlist_destroy_work_fn, cgroup_pidlist_destroy_work_fn,=
 cgroup_pidlist_destroy_work_fn
> workqueue ipv6_addrconf: flags=3D0x40008
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: addrconf_verify_work
> pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hung=3D682s workers=3D3 id=
le: 66 349
> pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s workers=3D3 idle: 46 38
> BUG: workqueue lockup - pool cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 stuck=
 for 713s!
> Showing busy workqueues and worker pools:
> workqueue events: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D14/256 refcnt=3D15
> pending: vmstat_shepherd, regulator_init_complete_work_function, e1000_wa=
tchdog, kfree_rcu_monitor, netstamp_clear, release_one_tty, release_one_tty=
, release_one_tty, release_one_tty, cgroup1_release_agent, cgroup1_release_=
agent, release_one_tty, release_one_tty, cgroup1_release_agent
> workqueue events_unbound: flags=3D0x2
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D1/512 refcnt=3D4
> in-flight: 42:fsnotify_mark_destroy_workfn BAR(1)
> workqueue events_power_efficient: flags=3D0x82
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D1/256 refcnt=3D3
> pending: do_cache_clean
> workqueue rcu_gp: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D3/256 refcnt=3D4
> in-flight: 20:sync_rcu_do_polled_gp
> pending: sync_rcu_do_polled_gp, process_srcu
> workqueue mm_percpu_wq: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/256 refcnt=3D2
> pending: vmstat_update
> workqueue cgroup_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: css_release_work_fn
> workqueue cgroup_pidlist_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D5
> pending: cgroup_pidlist_destroy_work_fn
> inactive: cgroup_pidlist_destroy_work_fn, cgroup_pidlist_destroy_work_fn,=
 cgroup_pidlist_destroy_work_fn
> workqueue ipv6_addrconf: flags=3D0x40008
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: addrconf_verify_work
> pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hung=3D713s workers=3D3 id=
le: 66 349
> pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s workers=3D3 idle: 46 38
> BUG: workqueue lockup - pool cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 stuck=
 for 744s!
> Showing busy workqueues and worker pools:
> workqueue events: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D14/256 refcnt=3D15
> pending: vmstat_shepherd, regulator_init_complete_work_function, e1000_wa=
tchdog, kfree_rcu_monitor, netstamp_clear, release_one_tty, release_one_tty=
, release_one_tty, release_one_tty, cgroup1_release_agent, cgroup1_release_=
agent, release_one_tty, release_one_tty, cgroup1_release_agent
> workqueue events_unbound: flags=3D0x2
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D1/512 refcnt=3D4
> in-flight: 42:fsnotify_mark_destroy_workfn BAR(1)
> workqueue events_power_efficient: flags=3D0x82
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D1/256 refcnt=3D3
> pending: do_cache_clean
> workqueue rcu_gp: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D3/256 refcnt=3D4
> in-flight: 20:sync_rcu_do_polled_gp
> pending: sync_rcu_do_polled_gp, process_srcu
> workqueue mm_percpu_wq: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/256 refcnt=3D2
> pending: vmstat_update
> workqueue cgroup_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: css_release_work_fn
> workqueue cgroup_pidlist_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D5
> pending: cgroup_pidlist_destroy_work_fn
> inactive: cgroup_pidlist_destroy_work_fn, cgroup_pidlist_destroy_work_fn,=
 cgroup_pidlist_destroy_work_fn
> workqueue ipv6_addrconf: flags=3D0x40008
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: addrconf_verify_work
> pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hung=3D744s workers=3D3 id=
le: 66 349
> pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s workers=3D3 idle: 46 38
> BUG: workqueue lockup - pool cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 stuck=
 for 774s!
> Showing busy workqueues and worker pools:
> workqueue events: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D14/256 refcnt=3D15
> pending: vmstat_shepherd, regulator_init_complete_work_function, e1000_wa=
tchdog, kfree_rcu_monitor, netstamp_clear, release_one_tty, release_one_tty=
, release_one_tty, release_one_tty, cgroup1_release_agent, cgroup1_release_=
agent, release_one_tty, release_one_tty, cgroup1_release_agent
> workqueue events_unbound: flags=3D0x2
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D1/512 refcnt=3D4
> in-flight: 42:fsnotify_mark_destroy_workfn BAR(1)
> workqueue events_power_efficient: flags=3D0x82
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D1/256 refcnt=3D3
> pending: do_cache_clean
> workqueue rcu_gp: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D3/256 refcnt=3D4
> in-flight: 20:sync_rcu_do_polled_gp
> pending: sync_rcu_do_polled_gp, process_srcu
> workqueue mm_percpu_wq: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/256 refcnt=3D2
> pending: vmstat_update
> workqueue cgroup_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: css_release_work_fn
> workqueue cgroup_pidlist_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D5
> pending: cgroup_pidlist_destroy_work_fn
> inactive: cgroup_pidlist_destroy_work_fn, cgroup_pidlist_destroy_work_fn,=
 cgroup_pidlist_destroy_work_fn
> workqueue ipv6_addrconf: flags=3D0x40008
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: addrconf_verify_work
> pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hung=3D774s workers=3D3 id=
le: 66 349
> pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s workers=3D3 idle: 46 38
> BUG: workqueue lockup - pool cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 stuck=
 for 805s!
> Showing busy workqueues and worker pools:
> workqueue events: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D14/256 refcnt=3D15
> pending: vmstat_shepherd, regulator_init_complete_work_function, e1000_wa=
tchdog, kfree_rcu_monitor, netstamp_clear, release_one_tty, release_one_tty=
, release_one_tty, release_one_tty, cgroup1_release_agent, cgroup1_release_=
agent, release_one_tty, release_one_tty, cgroup1_release_agent
> workqueue events_unbound: flags=3D0x2
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D1/512 refcnt=3D4
> in-flight: 42:fsnotify_mark_destroy_workfn BAR(1)
> workqueue events_power_efficient: flags=3D0x82
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D1/256 refcnt=3D3
> pending: do_cache_clean
> workqueue rcu_gp: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D3/256 refcnt=3D4
> in-flight: 20:sync_rcu_do_polled_gp
> pending: sync_rcu_do_polled_gp, process_srcu
> workqueue mm_percpu_wq: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/256 refcnt=3D2
> pending: vmstat_update
> workqueue cgroup_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: css_release_work_fn
> workqueue cgroup_pidlist_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D5
> pending: cgroup_pidlist_destroy_work_fn
> inactive: cgroup_pidlist_destroy_work_fn, cgroup_pidlist_destroy_work_fn,=
 cgroup_pidlist_destroy_work_fn
> workqueue ipv6_addrconf: flags=3D0x40008
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: addrconf_verify_work
> pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hung=3D805s workers=3D3 id=
le: 66 349
> pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s workers=3D3 idle: 46 38
> BUG: workqueue lockup - pool cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 stuck=
 for 836s!
> Showing busy workqueues and worker pools:
> workqueue events: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D14/256 refcnt=3D15
> pending: vmstat_shepherd, regulator_init_complete_work_function, e1000_wa=
tchdog, kfree_rcu_monitor, netstamp_clear, release_one_tty, release_one_tty=
, release_one_tty, release_one_tty, cgroup1_release_agent, cgroup1_release_=
agent, release_one_tty, release_one_tty, cgroup1_release_agent
> workqueue events_unbound: flags=3D0x2
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D1/512 refcnt=3D4
> in-flight: 42:fsnotify_mark_destroy_workfn BAR(1)
> workqueue rcu_gp: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D3/256 refcnt=3D4
> in-flight: 20:sync_rcu_do_polled_gp
> pending: sync_rcu_do_polled_gp, process_srcu
> workqueue mm_percpu_wq: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/256 refcnt=3D2
> pending: vmstat_update
> workqueue cgroup_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: css_release_work_fn
> workqueue cgroup_pidlist_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D5
> pending: cgroup_pidlist_destroy_work_fn
> inactive: cgroup_pidlist_destroy_work_fn, cgroup_pidlist_destroy_work_fn,=
 cgroup_pidlist_destroy_work_fn
> workqueue ipv6_addrconf: flags=3D0x40008
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: addrconf_verify_work
> pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hung=3D836s workers=3D3 id=
le: 66 349
> pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s workers=3D3 idle: 46 38
> BUG: workqueue lockup - pool cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 stuck=
 for 867s!
> Showing busy workqueues and worker pools:
> workqueue events: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D14/256 refcnt=3D15
> pending: vmstat_shepherd, regulator_init_complete_work_function, e1000_wa=
tchdog, kfree_rcu_monitor, netstamp_clear, release_one_tty, release_one_tty=
, release_one_tty, release_one_tty, cgroup1_release_agent, cgroup1_release_=
agent, release_one_tty, release_one_tty, cgroup1_release_agent
> workqueue events_unbound: flags=3D0x2
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D1/512 refcnt=3D4
> in-flight: 42:fsnotify_mark_destroy_workfn BAR(1)
> workqueue rcu_gp: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D3/256 refcnt=3D4
> in-flight: 20:sync_rcu_do_polled_gp
> pending: sync_rcu_do_polled_gp, process_srcu
> workqueue mm_percpu_wq: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/256 refcnt=3D2
> pending: vmstat_update
> workqueue cgroup_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: css_release_work_fn
> workqueue cgroup_pidlist_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D5
> pending: cgroup_pidlist_destroy_work_fn
> inactive: cgroup_pidlist_destroy_work_fn, cgroup_pidlist_destroy_work_fn,=
 cgroup_pidlist_destroy_work_fn
> workqueue ipv6_addrconf: flags=3D0x40008
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: addrconf_verify_work
> pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hung=3D867s workers=3D3 id=
le: 66 349
> pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s workers=3D3 idle: 46 38
> BUG: workqueue lockup - pool cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 stuck=
 for 897s!
> Showing busy workqueues and worker pools:
> workqueue events: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D14/256 refcnt=3D15
> pending: vmstat_shepherd, regulator_init_complete_work_function, e1000_wa=
tchdog, kfree_rcu_monitor, netstamp_clear, release_one_tty, release_one_tty=
, release_one_tty, release_one_tty, cgroup1_release_agent, cgroup1_release_=
agent, release_one_tty, release_one_tty, cgroup1_release_agent
> workqueue events_unbound: flags=3D0x2
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D1/512 refcnt=3D4
> in-flight: 42:fsnotify_mark_destroy_workfn BAR(1)
> workqueue rcu_gp: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D3/256 refcnt=3D4
> in-flight: 20:sync_rcu_do_polled_gp
> pending: sync_rcu_do_polled_gp, process_srcu
> workqueue mm_percpu_wq: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/256 refcnt=3D2
> pending: vmstat_update
> workqueue cgroup_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: css_release_work_fn
> workqueue cgroup_pidlist_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D5
> pending: cgroup_pidlist_destroy_work_fn
> inactive: cgroup_pidlist_destroy_work_fn, cgroup_pidlist_destroy_work_fn,=
 cgroup_pidlist_destroy_work_fn
> workqueue ipv6_addrconf: flags=3D0x40008
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: addrconf_verify_work
> pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hung=3D897s workers=3D3 id=
le: 66 349
> pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s workers=3D3 idle: 46 38
> INFO: task systemd:1 blocked for more than 491 seconds.
> Not tainted 5.17.0-rc1-00102-gcd7bd64af59f #1
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:systemd         state:D stack:    0 pid:    1 ppid:     0 flags:0x00=
004000
> Call Trace:
> ? __schedule+0x372/0xb30
> ? schedule+0x3d/0xc0
> ? schedule_timeout+0x2a5/0x3b0
> ? find_held_lock+0x24/0x80
> ? lock_release+0xa8/0x290
> ? _raw_spin_unlock_irq+0x1d/0x30
> ? trace_hardirqs_on+0x66/0x300
> ? wait_for_completion+0x8d/0xe0
> ? __flush_work+0x1fc/0x460
> ? flush_workqueue_prep_pwqs+0x130/0x130
> ? flush_delayed_work+0x29/0x50
> ? fsnotify_wait_marks_destroyed+0xd/0x10
> ? fsnotify_destroy_group+0x59/0xd0
> ? inotify_release+0xe/0x20
> ? __fput+0x92/0x2a0
> ? _raw_spin_unlock_irq+0x1d/0x30
> ? ____fput+0x8/0x10
> ? task_work_run+0x54/0x90
> ? exit_to_user_mode_prepare+0x205/0x210
> ? syscall_exit_to_user_mode+0x1a/0x50
> ? __do_fast_syscall_32+0x81/0xd0
> ? __do_fast_syscall_32+0x81/0xd0
> ? trace_irq_enable+0x14d/0x280
> ? irqentry_exit_to_user_mode+0x26/0x30
> ? do_fast_syscall_32+0x29/0x60
> ? do_SYSENTER_32+0x15/0x20
> ? entry_SYSENTER_32+0xa6/0x10d
> INFO: task kworker/u4:2:42 blocked for more than 491 seconds.
> Not tainted 5.17.0-rc1-00102-gcd7bd64af59f #1
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:kworker/u4:2    state:D stack:    0 pid:   42 ppid:     2 flags:0x00=
004000
> Workqueue: events_unbound fsnotify_mark_destroy_workfn
> Call Trace:
> ? __schedule+0x372/0xb30
> ? schedule+0x3d/0xc0
> ? schedule_timeout+0x2a5/0x3b0
> ? mark_held_locks+0x3f/0x70
> ? wait_for_completion+0x86/0xe0
> ? _raw_spin_unlock_irq+0x1d/0x30
> ? trace_hardirqs_on+0x66/0x300
> ? wait_for_completion+0x8d/0xe0
> ? __synchronize_srcu+0xfc/0x150
> ? rcu_tasks_pregp_step+0x10/0x10
> ? synchronize_srcu+0xa0/0xe0
> ? fsnotify_mark_destroy_workfn+0x5e/0xd0
> ? process_one_work+0x238/0x530
> ? worker_thread+0x156/0x3a0
> ? kthread+0xcf/0xf0
> ? process_one_work+0x530/0x530
> ? kthread_complete_and_exit+0x20/0x20
> ? ret_from_fork+0x1c/0x28
> INFO: task rmmod:1018 blocked for more than 491 seconds.
> Not tainted 5.17.0-rc1-00102-gcd7bd64af59f #1
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:rmmod           state:D stack:    0 pid: 1018 ppid:   618 flags:0x00=
004000
> Call Trace:
> ? __schedule+0x372/0xb30
> ? schedule+0x3d/0xc0
> ? schedule_timeout+0x2a5/0x3b0
> ? find_held_lock+0x24/0x80
> ? lock_release+0xa8/0x290
> ? _raw_spin_unlock_irq+0x1d/0x30
> ? trace_hardirqs_on+0x66/0x300
> ? wait_for_completion+0x8d/0xe0
> ? kthread_stop+0x77/0x2b0
> ? _torture_stop_kthread+0x20/0x50 [torture]
> ? rcu_torture_cleanup+0x1ca/0x350 [rcutorture]
> ? finish_wait+0x80/0x80
> ? __ia32_sys_delete_module+0x137/0x210
> ? lock_release+0xa8/0x290
> ? __might_fault+0x2f/0x70
> ? __do_fast_syscall_32+0x77/0xd0
> ? __do_fast_syscall_32+0x81/0xd0
> ? vfs_read+0x1cd/0x320
> ? rcu_read_lock_sched_held+0x3f/0x70
> ? trace_irq_enable+0x14d/0x280
> ? syscall_exit_to_user_mode+0x38/0x50
> ? __do_fast_syscall_32+0x81/0xd0
> ? trace_irq_enable+0x14d/0x280
> ? syscall_exit_to_user_mode+0x38/0x50
> ? __do_fast_syscall_32+0x81/0xd0
> ? __do_fast_syscall_32+0x81/0xd0
> ? trace_irq_enable+0x14d/0x280
> ? irqentry_exit_to_user_mode+0x26/0x30
> ? do_fast_syscall_32+0x29/0x60
> ? do_SYSENTER_32+0x15/0x20
> ? entry_SYSENTER_32+0xa6/0x10d
> =

> Showing all locks held in the system:
> 2 locks held by kworker/1:0/20:
> 1 lock held by khungtaskd/24:
> #0: 42eed778 (rcu_read_lock){....}-{1:2}, at: rcu_lock_acquire+0x0/0x30
> 2 locks held by kworker/u4:2/42:
> #0: 43dbd340 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one=
_work+0x1b7/0x530
> #1: 44115f40 ((reaper_work).work){+.+.}-{0:0}, at: process_one_work+0x1b7=
/0x530
> 1 lock held by in:imklog/639:
> 1 lock held by dmesg/550:
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =

> Kernel panic - not syncing: hung_task: blocked tasks
> CPU: 1 PID: 24 Comm: khungtaskd Not tainted 5.17.0-rc1-00102-gcd7bd64af59=
f #1
> Call Trace:
> ? dump_stack_lvl+0x44/0x57
> ? dump_stack+0xd/0x10
> ? panic+0xd2/0x292
> ? watchdog.cold+0xa5/0xa5
> ? kthread+0xcf/0xf0
> ? proc_dohung_task_timeout_secs+0x40/0x40
> ? kthread_complete_and_exit+0x20/0x20
> ? ret_from_fork+0x1c/0x28
> Kernel Offset: disabled
> =

> Kboot worker: lkp-worker65
> Elapsed time: 1020
> =

> kvm=3D(
> 	qemu-system-i386
> 	-enable-kvm
> 	-cpu SandyBridge
> 	-kernel $kernel
> 	-initrd initrd-vm-snb-i386-109.cgz
> 	-m 4096
> 	-smp 2
> 	-device e1000,netdev=3Dnet0
> 	-netdev user,id=3Dnet0,hostfwd=3Dtcp::32032-:22
> 	-boot order=3Dnc
> 	-no-reboot
> 	-watchdog i6300esb
> 	-watchdog-action debug
> 	-rtc base=3Dlocaltime
> 	-serial stdio
> 	-display none
> 	-monitor null
> )
> =

> append=3D(
> 	ip=3D::::vm-snb-i386-109::dhcp
> 	root=3D/dev/ram0
> 	RESULT_ROOT=3D/result/rcutorture/300s-default-rcu/vm-snb-i386/debian-i38=
6-20191205.cgz/i386-randconfig-a004-20211220/gcc-9/cd7bd64af59fd15e0760a42f=
343c0fbb87121219/3
> 	BOOT_IMAGE=3D/pkg/linux/i386-randconfig-a004-20211220/gcc-9/cd7bd64af59f=
d15e0760a42f343c0fbb87121219/vmlinuz-5.17.0-rc1-00102-gcd7bd64af59f
> 	branch=3Dammarfaizi2-block/paulmck/linux-rcu/dev.2022.02.01a
> 	job=3D/job-script
> 	user=3Dlkp
> 	ARCH=3Di386
> 	kconfig=3Di386-randconfig-a004-20211220
> 	commit=3Dcd7bd64af59fd15e0760a42f343c0fbb87121219
> 	vmalloc=3D128M
> 	initramfs_async=3D0
> 	page_owner=3Don
> 	max_uptime=3D2100
> 	result_service=3Dtmpfs
> 	selinux=3D0
> 	debug
> 	apic=3Ddebug
> 	sysrq_always_enabled
> 	rcupdate.rcu_cpu_stall_timeout=3D100
> 	net.ifnames=3D0
> 	printk.devkmsg=3Don
> 	panic=3D-1
> 	softlockup_panic=3D1
> 	nmi_watchdog=3Dpanic
> 	oops=3Dpanic
> 	load_ramdisk=3D2
> 	prompt_ramdisk=3D0
> 	drbd.minor_count=3D8
> 	systemd.log_level=3Derr
> 	ignore_loglevel
> 	console=3Dtty0
> 	earlyprintk=3DttyS0,115200
> 	console=3DttyS0,115200
> 	vga=3Dnormal
> 	rw
> 	rcuperf.shutdown=3D0
> 	watchdog_thresh=3D240
> )
> =

> "${kvm[@]}" -append "${append[*]}"

--===============3884469753596366400==--

