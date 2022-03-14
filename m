Content-Type: multipart/mixed; boundary="===============2294622737143114451=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: lkp@lists.01.org
Subject: Re: [EXP rcutorture] 556d8afe4a: BUG:workqueue_lockup-pool
Date: Mon, 14 Mar 2022 13:37:06 -0700
Message-ID: <20220314203706.GY4285@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20220313124950.GA14898@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============2294622737143114451==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 13, 2022 at 08:49:50PM +0800, kernel test robot wrote:
> =

> Hi Paul,
> =

> we reported this commit as "[EXP rcutorture]  cd7bd64af5: BUG:workqueue_l=
ockup-pool"
> last month.
> =

> at that time, you requested us to test
> 25c0b105b7ba ("EXP rcu: Add polled expedited grace-period primitives")
> and we confirmed the issue gone on this commit.
> =

> however, now we found this commit is already in linux-next/master,
> but the issue seems still exists.
> =

> and we found the "EXP rcu: Add polled expedited grace-period primitives" =
is
> actually the parent of this commit.
> =

> * 556d8afe4a779 EXP rcutorture: Test polled expedited grace-period primit=
ives
> * 6227afdc95e49 EXP rcu: Add polled expedited grace-period primitives
> =

> and since the issue still exists in lastest linux-next/master, so we repo=
rt
> this again for your information.
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 556d8afe4a779f41dfc8fa373993a88e43f1c5dc ("EXP rcutorture: Test p=
olled expedited grace-period primitives")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
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

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 16G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):

There are some fixes in flight for something matching this.  I was not
seeing it earlier because I had not yet adjusted the rcutorture scenarios
to account for CONFIG_PREEMPT_DYNAMIC=3Dy being the default.  With that
now changed, I can reproduce this easily.

So the current -rcu "dev" branch might have this fixed, but I wouldn't
bet on it.  ;-)

Thank you for your testing efforts!

								Thanx, Paul

> +--------------------------------------------------+------------+--------=
----+
> |                                                  | 6227afdc95 | 556d8af=
e4a |
> +--------------------------------------------------+------------+--------=
----+
> | boot_successes                                   | 10         | 4      =
    |
> | boot_failures                                    | 0          | 6      =
    |
> | BUG:workqueue_lockup-pool                        | 0          | 6      =
    |
> | INFO:task_blocked_for_more_than#seconds          | 0          | 6      =
    |
> | Kernel_panic-not_syncing:hung_task:blocked_tasks | 0          | 6      =
    |
> +--------------------------------------------------+------------+--------=
----+
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> =

> [  408.705502][    C1] BUG: workqueue lockup - pool cpus=3D1 node=3D0 fla=
gs=3D0x0 nice=3D0 stuck for 338s!
> [  408.706448][    C1] Showing busy workqueues and worker pools:
> [  408.707057][    C1] workqueue events: flags=3D0x0
> [  408.707553][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D15/256 refcnt=3D16
> [  408.707613][    C1]     pending: do_free_init, e1000_watchdog, vmstat_=
shepherd, kfree_rcu_monitor, regulator_init_complete_work_function, kernfs_=
notify_workfn, release_one_tty, key_garbage_collector, release_one_tty, rel=
ease_one_tty, release_one_tty, release_one_tty, release_one_tty, release_on=
e_tty, release_one_tty
> [  408.707984][    C1] workqueue events_unbound: flags=3D0x2
> [  408.711681][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
4/512 refcnt=3D7
> [  408.711733][    C1]     in-flight: 40:fsnotify_mark_destroy_workfn fsn=
otify_mark_destroy_workfn BAR(1), 9:fsnotify_connector_destroy_workfn fsnot=
ify_connector_destroy_workfn
> [  408.711871][    C1] workqueue events_power_efficient: flags=3D0x80
> [  408.714333][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D7/256 refcnt=3D8
> [  408.714384][    C1]     pending: neigh_managed_work, neigh_managed_wor=
k, neigh_managed_work, neigh_periodic_work, neigh_periodic_work, neigh_peri=
odic_work, check_lifetime
> [  408.716530][    C1] workqueue rcu_gp: flags=3D0x8
> [  408.716915][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D3/256 refcnt=3D4
> [  408.716964][    C1]     in-flight: 179:sync_rcu_do_polled_gp
> [  408.717002][    C1]     pending: sync_rcu_do_polled_gp, process_srcu
> [  408.717069][    C1] workqueue mm_percpu_wq: flags=3D0x8
> [  408.719169][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/256 refcnt=3D2
> [  408.719220][    C1]     pending: vmstat_update
> [  408.719267][    C1] workqueue cgroup_destroy: flags=3D0x0
> [  408.720719][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D9
> [  408.720775][    C1]     pending: css_killed_work_fn
> [  408.720808][    C1]     inactive: css_killed_work_fn, css_killed_work_=
fn, css_release_work_fn, css_release_work_fn, css_killed_work_fn, css_kille=
d_work_fn, css_killed_work_fn
> [  408.720969][    C1] workqueue ipv6_addrconf: flags=3D0x40008
> [  408.723813][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  408.723858][    C1]     pending: addrconf_verify_work
> [  408.723897][    C1] pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hun=
g=3D338s workers=3D3 idle: 23 36
> [  408.723947][    C1] pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s =
workers=3D4 idle: 1871 1873
> [  438.914180][    C1] BUG: workqueue lockup - pool cpus=3D1 node=3D0 fla=
gs=3D0x0 nice=3D0 stuck for 368s!
> [  438.915000][    C1] Showing busy workqueues and worker pools:
> [  438.915495][    C1] workqueue events: flags=3D0x0
> [  438.915869][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D15/256 refcnt=3D16
> [  438.915918][    C1]     pending: do_free_init, e1000_watchdog, vmstat_=
shepherd, kfree_rcu_monitor, regulator_init_complete_work_function, kernfs_=
notify_workfn, release_one_tty, key_garbage_collector, release_one_tty, rel=
ease_one_tty, release_one_tty, release_one_tty, release_one_tty, release_on=
e_tty, release_one_tty
> [  438.916204][    C1] workqueue events_unbound: flags=3D0x2
> [  438.919292][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
4/512 refcnt=3D7
> [  438.919334][    C1]     in-flight: 40:fsnotify_mark_destroy_workfn fsn=
otify_mark_destroy_workfn BAR(1), 9:fsnotify_connector_destroy_workfn fsnot=
ify_connector_destroy_workfn
> [  438.919451][    C1] workqueue events_power_efficient: flags=3D0x80
> [  438.921618][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D7/256 refcnt=3D8
> [  438.921676][    C1]     pending: neigh_managed_work, neigh_managed_wor=
k, neigh_managed_work, neigh_periodic_work, neigh_periodic_work, neigh_peri=
odic_work, check_lifetime
> [  438.921825][    C1] workqueue rcu_gp: flags=3D0x8
> [  438.923936][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D3/256 refcnt=3D4
> [  438.923981][    C1]     in-flight: 179:sync_rcu_do_polled_gp
> [  438.924018][    C1]     pending: sync_rcu_do_polled_gp, process_srcu
> [  438.924077][    C1] workqueue mm_percpu_wq: flags=3D0x8
> [  438.925910][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/256 refcnt=3D2
> [  438.925947][    C1]     pending: vmstat_update
> [  438.925979][    C1] workqueue cgroup_destroy: flags=3D0x0
> [  438.926981][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D9
> [  438.927014][    C1]     pending: css_killed_work_fn
> [  438.927034][    C1]     inactive: css_killed_work_fn, css_killed_work_=
fn, css_release_work_fn, css_release_work_fn, css_killed_work_fn, css_kille=
d_work_fn, css_killed_work_fn
> [  438.927140][    C1] workqueue ipv6_addrconf: flags=3D0x40008
> [  438.929584][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  438.929631][    C1]     pending: addrconf_verify_work
> [  438.929677][    C1] pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hun=
g=3D368s workers=3D3 idle: 23 36
> [  438.929734][    C1] pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s =
workers=3D4 idle: 1873 1871
> [  469.121528][    C1] BUG: workqueue lockup - pool cpus=3D1 node=3D0 fla=
gs=3D0x0 nice=3D0 stuck for 399s!
> [  469.122375][    C1] Showing busy workqueues and worker pools:
> [  469.122940][    C1] workqueue events: flags=3D0x0
> [  469.123375][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D15/256 refcnt=3D16
> [  469.123443][    C1]     pending: do_free_init, e1000_watchdog, vmstat_=
shepherd, kfree_rcu_monitor, regulator_init_complete_work_function, kernfs_=
notify_workfn, release_one_tty, key_garbage_collector, release_one_tty, rel=
ease_one_tty, release_one_tty, release_one_tty, release_one_tty, release_on=
e_tty, release_one_tty
> [  469.126663][    C1] workqueue events_unbound: flags=3D0x2
> [  469.127113][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
4/512 refcnt=3D7
> [  469.127162][    C1]     in-flight: 40:fsnotify_mark_destroy_workfn fsn=
otify_mark_destroy_workfn BAR(1), 9:fsnotify_connector_destroy_workfn fsnot=
ify_connector_destroy_workfn
> [  469.127286][    C1] workqueue events_power_efficient: flags=3D0x80
> [  469.129649][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D7/256 refcnt=3D8
> [  469.129693][    C1]     pending: neigh_managed_work, neigh_managed_wor=
k, neigh_managed_work, neigh_periodic_work, neigh_periodic_work, neigh_peri=
odic_work, check_lifetime
> [  469.129817][    C1] workqueue rcu_gp: flags=3D0x8
> [  469.131968][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D3/256 refcnt=3D4
> [  469.132021][    C1]     in-flight: 179:sync_rcu_do_polled_gp
> [  469.132064][    C1]     pending: sync_rcu_do_polled_gp, process_srcu
> [  469.132132][    C1] workqueue mm_percpu_wq: flags=3D0x8
> [  469.134219][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/256 refcnt=3D2
> [  469.134275][    C1]     pending: vmstat_update
> [  469.134323][    C1] workqueue cgroup_destroy: flags=3D0x0
> [  469.135788][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D9
> [  469.135843][    C1]     pending: css_killed_work_fn
> [  469.135877][    C1]     inactive: css_killed_work_fn, css_killed_work_=
fn, css_release_work_fn, css_release_work_fn, css_killed_work_fn, css_kille=
d_work_fn, css_killed_work_fn
> [  469.136035][    C1] workqueue ipv6_addrconf: flags=3D0x40008
> [  469.138818][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  469.138876][    C1]     pending: addrconf_verify_work
> [  469.138928][    C1] pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hun=
g=3D399s workers=3D3 idle: 23 36
> [  469.138999][    C1] pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s =
workers=3D4 idle: 1871 1873
> [  499.329506][    C1] BUG: workqueue lockup - pool cpus=3D1 node=3D0 fla=
gs=3D0x0 nice=3D0 stuck for 429s!
> [  499.330360][    C1] Showing busy workqueues and worker pools:
> [  499.330933][    C1] workqueue events: flags=3D0x0
> [  499.331287][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D15/256 refcnt=3D16
> [  499.331332][    C1]     pending: do_free_init, e1000_watchdog, vmstat_=
shepherd, kfree_rcu_monitor, regulator_init_complete_work_function, kernfs_=
notify_workfn, release_one_tty, key_garbage_collector, release_one_tty, rel=
ease_one_tty, release_one_tty, release_one_tty, release_one_tty, release_on=
e_tty, release_one_tty
> [  499.334522][    C1] workqueue events_unbound: flags=3D0x2
> [  499.334966][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
4/512 refcnt=3D7
> [  499.334999][    C1]     in-flight: 40:fsnotify_mark_destroy_workfn fsn=
otify_mark_destroy_workfn BAR(1), 9:fsnotify_connector_destroy_workfn fsnot=
ify_connector_destroy_workfn
> [  499.335119][    C1] workqueue events_power_efficient: flags=3D0x80
> [  499.337451][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D7/256 refcnt=3D8
> [  499.337512][    C1]     pending: neigh_managed_work, neigh_managed_wor=
k, neigh_managed_work, neigh_periodic_work, neigh_periodic_work, neigh_peri=
odic_work, check_lifetime
> [  499.339525][    C1] workqueue rcu_gp: flags=3D0x8
> [  499.339915][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D3/256 refcnt=3D4
> [  499.339967][    C1]     in-flight: 179:sync_rcu_do_polled_gp
> [  499.340008][    C1]     pending: sync_rcu_do_polled_gp, process_srcu
> [  499.340073][    C1] workqueue mm_percpu_wq: flags=3D0x8
> [  499.342140][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/256 refcnt=3D2
> [  499.342197][    C1]     pending: vmstat_update
> [  499.342244][    C1] workqueue cgroup_destroy: flags=3D0x0
> [  499.343789][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D9
> [  499.343843][    C1]     pending: css_killed_work_fn
> [  499.343877][    C1]     inactive: css_killed_work_fn, css_killed_work_=
fn, css_release_work_fn, css_release_work_fn, css_killed_work_fn, css_kille=
d_work_fn, css_killed_work_fn
> [  499.344041][    C1] workqueue ipv6_addrconf: flags=3D0x40008
> [  499.346756][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  499.346813][    C1]     pending: addrconf_verify_work
> [  499.346866][    C1] pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hun=
g=3D429s workers=3D3 idle: 23 36
> [  499.346933][    C1] pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s =
workers=3D4 idle: 1873 1871
> [  529.537551][    C1] BUG: workqueue lockup - pool cpus=3D1 node=3D0 fla=
gs=3D0x0 nice=3D0 stuck for 459s!
> [  529.538415][    C1] Showing busy workqueues and worker pools:
> [  529.538982][    C1] workqueue events: flags=3D0x0
> [  529.539387][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D15/256 refcnt=3D16
> [  529.539447][    C1]     pending: do_free_init, e1000_watchdog, vmstat_=
shepherd, kfree_rcu_monitor, regulator_init_complete_work_function, kernfs_=
notify_workfn, release_one_tty, key_garbage_collector, release_one_tty, rel=
ease_one_tty, release_one_tty, release_one_tty, release_one_tty, release_on=
e_tty, release_one_tty
> [  529.542641][    C1] workqueue events_unbound: flags=3D0x2
> [  529.543117][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
5/512 refcnt=3D8
> [  529.543154][    C1]     in-flight: 40:fsnotify_mark_destroy_workfn fsn=
otify_mark_destroy_workfn BAR(1), 9:fsnotify_connector_destroy_workfn fsnot=
ify_connector_destroy_workfn
> [  529.543254][    C1]     pending: toggle_allocation_gate
> [  529.543280][    C1] workqueue events_power_efficient: flags=3D0x80
> [  529.546120][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D7/256 refcnt=3D8
> [  529.546177][    C1]     pending: neigh_managed_work, neigh_managed_wor=
k, neigh_managed_work, neigh_periodic_work, neigh_periodic_work, neigh_peri=
odic_work, check_lifetime
> [  529.546344][    C1] workqueue rcu_gp: flags=3D0x8
> [  529.548606][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D3/256 refcnt=3D4
> [  529.548662][    C1]     in-flight: 179:sync_rcu_do_polled_gp
> [  529.548704][    C1]     pending: sync_rcu_do_polled_gp, process_srcu
> [  529.548767][    C1] workqueue mm_percpu_wq: flags=3D0x8
> [  529.550856][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/256 refcnt=3D2
> [  529.550912][    C1]     pending: vmstat_update
> [  529.550969][    C1] workqueue cgroup_destroy: flags=3D0x0
> [  529.552552][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D9
> [  529.552608][    C1]     pending: css_killed_work_fn
> [  529.552641][    C1]     inactive: css_killed_work_fn, css_killed_work_=
fn, css_release_work_fn, css_release_work_fn, css_killed_work_fn, css_kille=
d_work_fn, css_killed_work_fn
> [  529.552804][    C1] workqueue ipv6_addrconf: flags=3D0x40008
> [  529.555564][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  529.555620][    C1]     pending: addrconf_verify_work
> [  529.555671][    C1] pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hun=
g=3D459s workers=3D3 idle: 23 36
> [  529.555739][    C1] pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s =
workers=3D4 idle: 1871 1873
> [  559.746304][    C1] BUG: workqueue lockup - pool cpus=3D1 node=3D0 fla=
gs=3D0x0 nice=3D0 stuck for 489s!
> [  559.747235][    C1] Showing busy workqueues and worker pools:
> [  559.747797][    C1] workqueue events: flags=3D0x0
> [  559.748212][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D15/256 refcnt=3D16
> [  559.748262][    C1]     pending: do_free_init, e1000_watchdog, vmstat_=
shepherd, kfree_rcu_monitor, regulator_init_complete_work_function, kernfs_=
notify_workfn, release_one_tty, key_garbage_collector, release_one_tty, rel=
ease_one_tty, release_one_tty, release_one_tty, release_one_tty, release_on=
e_tty, release_one_tty
> [  559.751350][    C1] workqueue events_unbound: flags=3D0x2
> [  559.751813][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
4/512 refcnt=3D7
> [  559.751860][    C1]     in-flight: 40:fsnotify_mark_destroy_workfn fsn=
otify_mark_destroy_workfn BAR(1), 9:fsnotify_connector_destroy_workfn fsnot=
ify_connector_destroy_workfn
> [  559.751984][    C1] workqueue events_power_efficient: flags=3D0x80
> [  559.754423][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D7/256 refcnt=3D8
> [  559.754481][    C1]     pending: neigh_managed_work, neigh_managed_wor=
k, neigh_managed_work, neigh_periodic_work, neigh_periodic_work, neigh_peri=
odic_work, check_lifetime
> [  559.756567][    C1] workqueue rcu_gp: flags=3D0x8
> [  559.756967][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D3/256 refcnt=3D4
> [  559.757012][    C1]     in-flight: 179:sync_rcu_do_polled_gp
> [  559.757049][    C1]     pending: sync_rcu_do_polled_gp, process_srcu
> [  559.757108][    C1] workqueue mm_percpu_wq: flags=3D0x8
> [  559.759130][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/256 refcnt=3D2
> [  559.759182][    C1]     pending: vmstat_update
> [  559.759228][    C1] workqueue cgroup_destroy: flags=3D0x0
> [  559.760711][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D9
> [  559.760768][    C1]     pending: css_killed_work_fn
> [  559.760802][    C1]     inactive: css_killed_work_fn, css_killed_work_=
fn, css_release_work_fn, css_release_work_fn, css_killed_work_fn, css_kille=
d_work_fn, css_killed_work_fn
> [  559.760967][    C1] workqueue ipv6_addrconf: flags=3D0x40008
> [  559.763732][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  559.763789][    C1]     pending: addrconf_verify_work
> [  559.763837][    C1] pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hun=
g=3D489s workers=3D3 idle: 23 36
> [  559.763906][    C1] pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s =
workers=3D4 idle: 1873 1871
> [  589.953507][    C1] BUG: workqueue lockup - pool cpus=3D1 node=3D0 fla=
gs=3D0x0 nice=3D0 stuck for 519s!
> [  589.954311][    C1] Showing busy workqueues and worker pools:
> [  589.954843][    C1] workqueue events: flags=3D0x0
> [  589.955222][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D15/256 refcnt=3D16
> [  589.955276][    C1]     pending: do_free_init, e1000_watchdog, vmstat_=
shepherd, kfree_rcu_monitor, regulator_init_complete_work_function, kernfs_=
notify_workfn, release_one_tty, key_garbage_collector, release_one_tty, rel=
ease_one_tty, release_one_tty, release_one_tty, release_one_tty, release_on=
e_tty, release_one_tty
> [  589.958545][    C1] workqueue events_unbound: flags=3D0x2
> [  589.959008][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
4/512 refcnt=3D7
> [  589.959055][    C1]     in-flight: 40:fsnotify_mark_destroy_workfn fsn=
otify_mark_destroy_workfn BAR(1), 9:fsnotify_connector_destroy_workfn fsnot=
ify_connector_destroy_workfn
> [  589.959183][    C1] workqueue events_power_efficient: flags=3D0x80
> [  589.961591][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D7/256 refcnt=3D8
> [  589.961640][    C1]     pending: neigh_managed_work, neigh_managed_wor=
k, neigh_managed_work, neigh_periodic_work, neigh_periodic_work, neigh_peri=
odic_work, check_lifetime
> [  589.961788][    C1] workqueue rcu_gp: flags=3D0x8
> [  589.963963][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D3/256 refcnt=3D4
> [  589.964015][    C1]     in-flight: 179:sync_rcu_do_polled_gp
> [  589.964056][    C1]     pending: sync_rcu_do_polled_gp, process_srcu
> [  589.964123][    C1] workqueue mm_percpu_wq: flags=3D0x8
> [  589.966276][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/256 refcnt=3D2
> [  589.966332][    C1]     pending: vmstat_update
> [  589.966379][    C1] workqueue cgroup_destroy: flags=3D0x0
> [  589.967806][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D9
> [  589.967856][    C1]     pending: css_killed_work_fn
> [  589.967888][    C1]     inactive: css_killed_work_fn, css_killed_work_=
fn, css_release_work_fn, css_release_work_fn, css_killed_work_fn, css_kille=
d_work_fn, css_killed_work_fn
> [  589.968037][    C1] workqueue ipv6_addrconf: flags=3D0x40008
> [  589.970821][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  589.970879][    C1]     pending: addrconf_verify_work
> [  589.970930][    C1] pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hun=
g=3D519s workers=3D3 idle: 23 36
> [  589.970998][    C1] pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s =
workers=3D4 idle: 1871 1873
> [  620.161550][    C1] BUG: workqueue lockup - pool cpus=3D1 node=3D0 fla=
gs=3D0x0 nice=3D0 stuck for 550s!
> [  620.162374][    C1] Showing busy workqueues and worker pools:
> [  620.162952][    C1] workqueue events: flags=3D0x0
> [  620.163356][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D15/256 refcnt=3D16
> [  620.163429][    C1]     pending: do_free_init, e1000_watchdog, vmstat_=
shepherd, kfree_rcu_monitor, regulator_init_complete_work_function, kernfs_=
notify_workfn, release_one_tty, key_garbage_collector, release_one_tty, rel=
ease_one_tty, release_one_tty, release_one_tty, release_one_tty, release_on=
e_tty, release_one_tty
> [  620.166742][    C1] workqueue events_unbound: flags=3D0x2
> [  620.167203][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
4/512 refcnt=3D7
> [  620.167247][    C1]     in-flight: 40:fsnotify_mark_destroy_workfn fsn=
otify_mark_destroy_workfn BAR(1), 9:fsnotify_connector_destroy_workfn fsnot=
ify_connector_destroy_workfn
> [  620.167384][    C1] workqueue events_power_efficient: flags=3D0x80
> [  620.169800][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D7/256 refcnt=3D8
> [  620.169855][    C1]     pending: neigh_managed_work, neigh_managed_wor=
k, neigh_managed_work, neigh_periodic_work, neigh_periodic_work, neigh_peri=
odic_work, check_lifetime
> [  620.170007][    C1] workqueue rcu_gp: flags=3D0x8
> [  620.172416][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D3/256 refcnt=3D4
> [  620.172466][    C1]     in-flight: 179:sync_rcu_do_polled_gp
> [  620.172506][    C1]     pending: sync_rcu_do_polled_gp, process_srcu
> [  620.174272][    C1] workqueue mm_percpu_wq: flags=3D0x8
> [  620.174791][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/256 refcnt=3D2
> [  620.174850][    C1]     pending: vmstat_update
> [  620.174900][    C1] workqueue cgroup_destroy: flags=3D0x0
> [  620.176449][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D9
> [  620.176511][    C1]     pending: css_killed_work_fn
> [  620.176545][    C1]     inactive: css_killed_work_fn, css_killed_work_=
fn, css_release_work_fn, css_release_work_fn, css_killed_work_fn, css_kille=
d_work_fn, css_killed_work_fn
> [  620.178995][    C1] workqueue ipv6_addrconf: flags=3D0x40008
> [  620.179458][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  620.179508][    C1]     pending: addrconf_verify_work
> [  620.180619][    C1] pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hun=
g=3D550s workers=3D3 idle: 23 36
> [  620.180678][    C1] pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s =
workers=3D4 idle: 1873 1871
> [  650.369599][    C1] BUG: workqueue lockup - pool cpus=3D1 node=3D0 fla=
gs=3D0x0 nice=3D0 stuck for 580s!
> [  650.370205][    C1] Showing busy workqueues and worker pools:
> [  650.370772][    C1] workqueue events: flags=3D0x0
> [  650.371192][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D15/256 refcnt=3D16
> [  650.371248][    C1]     pending: do_free_init, e1000_watchdog, vmstat_=
shepherd, kfree_rcu_monitor, regulator_init_complete_work_function, kernfs_=
notify_workfn, release_one_tty, key_garbage_collector, release_one_tty, rel=
ease_one_tty, release_one_tty, release_one_tty, release_one_tty, release_on=
e_tty, release_one_tty
> [  650.374574][    C1] workqueue events_unbound: flags=3D0x2
> [  650.375046][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
4/512 refcnt=3D7
> [  650.375094][    C1]     in-flight: 40:fsnotify_mark_destroy_workfn fsn=
otify_mark_destroy_workfn BAR(1), 9:fsnotify_connector_destroy_workfn fsnot=
ify_connector_destroy_workfn
> [  650.375217][    C1] workqueue events_power_efficient: flags=3D0x80
> [  650.377523][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D7/256 refcnt=3D8
> [  650.377581][    C1]     pending: neigh_managed_work, neigh_managed_wor=
k, neigh_managed_work, neigh_periodic_work, neigh_periodic_work, neigh_peri=
odic_work, check_lifetime
> [  650.377756][    C1] workqueue rcu_gp: flags=3D0x8
> [  650.379967][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D3/256 refcnt=3D4
> [  650.380011][    C1]     in-flight: 179:sync_rcu_do_polled_gp
> [  650.380044][    C1]     pending: sync_rcu_do_polled_gp, process_srcu
> [  650.380097][    C1] workqueue mm_percpu_wq: flags=3D0x8
> [  650.382130][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/256 refcnt=3D2
> [  650.382185][    C1]     pending: vmstat_update
> [  650.382231][    C1] workqueue cgroup_destroy: flags=3D0x0
> [  650.383783][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D9
> [  650.383834][    C1]     pending: css_killed_work_fn
> [  650.383864][    C1]     inactive: css_killed_work_fn, css_killed_work_=
fn, css_release_work_fn, css_release_work_fn, css_killed_work_fn, css_kille=
d_work_fn, css_killed_work_fn
> [  650.384013][    C1] workqueue ipv6_addrconf: flags=3D0x40008
> [  650.386562][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  650.386618][    C1]     pending: addrconf_verify_work
> [  650.386671][    C1] pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hun=
g=3D580s workers=3D3 idle: 23 36
> [  650.386739][    C1] pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s =
workers=3D4 idle: 1871 1873
> [  680.578270][    C1] BUG: workqueue lockup - pool cpus=3D1 node=3D0 fla=
gs=3D0x0 nice=3D0 stuck for 610s!
> [  680.579223][    C1] Showing busy workqueues and worker pools:
> [  680.579757][    C1] workqueue events: flags=3D0x0
> [  680.580171][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D15/256 refcnt=3D16
> [  680.580229][    C1]     pending: do_free_init, e1000_watchdog, vmstat_=
shepherd, kfree_rcu_monitor, regulator_init_complete_work_function, kernfs_=
notify_workfn, release_one_tty, key_garbage_collector, release_one_tty, rel=
ease_one_tty, release_one_tty, release_one_tty, release_one_tty, release_on=
e_tty, release_one_tty
> [  680.583530][    C1] workqueue events_unbound: flags=3D0x2
> [  680.583987][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
5/512 refcnt=3D8
> [  680.584033][    C1]     in-flight: 40:fsnotify_mark_destroy_workfn fsn=
otify_mark_destroy_workfn BAR(1), 9:fsnotify_connector_destroy_workfn fsnot=
ify_connector_destroy_workfn
> [  680.584152][    C1]     pending: toggle_allocation_gate
> [  680.584184][    C1] workqueue events_power_efficient: flags=3D0x80
> [  680.587166][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D7/256 refcnt=3D8
> [  680.587219][    C1]     pending: neigh_managed_work, neigh_managed_wor=
k, neigh_managed_work, neigh_periodic_work, neigh_periodic_work, neigh_peri=
odic_work, check_lifetime
> [  680.587389][    C1] workqueue rcu_gp: flags=3D0x8
> [  680.589740][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D3/256 refcnt=3D4
> [  680.589793][    C1]     in-flight: 179:sync_rcu_do_polled_gp
> [  680.589834][    C1]     pending: sync_rcu_do_polled_gp, process_srcu
> [  680.589900][    C1] workqueue mm_percpu_wq: flags=3D0x8
> [  680.592043][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/256 refcnt=3D2
> [  680.592096][    C1]     pending: vmstat_update
> [  680.592143][    C1] workqueue cgroup_destroy: flags=3D0x0
> [  680.593720][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D9
> [  680.593780][    C1]     pending: css_killed_work_fn
> [  680.593816][    C1]     inactive: css_killed_work_fn, css_killed_work_=
fn, css_release_work_fn, css_release_work_fn, css_killed_work_fn, css_kille=
d_work_fn, css_killed_work_fn
> [  680.593991][    C1] workqueue ipv6_addrconf: flags=3D0x40008
> [  680.596853][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  680.596933][    C1]     pending: addrconf_verify_work
> [  680.596981][    C1] pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hun=
g=3D610s workers=3D3 idle: 23 36
> [  680.597046][    C1] pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s =
workers=3D4 idle: 1873 1871
> [  710.785506][    C1] BUG: workqueue lockup - pool cpus=3D1 node=3D0 fla=
gs=3D0x0 nice=3D0 stuck for 640s!
> [  710.786354][    C1] Showing busy workqueues and worker pools:
> [  710.786896][    C1] workqueue events: flags=3D0x0
> [  710.787277][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D15/256 refcnt=3D16
> [  710.787331][    C1]     pending: do_free_init, e1000_watchdog, vmstat_=
shepherd, kfree_rcu_monitor, regulator_init_complete_work_function, kernfs_=
notify_workfn, release_one_tty, key_garbage_collector, release_one_tty, rel=
ease_one_tty, release_one_tty, release_one_tty, release_one_tty, release_on=
e_tty, release_one_tty
> [  710.790604][    C1] workqueue events_unbound: flags=3D0x2
> [  710.791083][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
4/512 refcnt=3D7
> [  710.791133][    C1]     in-flight: 40:fsnotify_mark_destroy_workfn fsn=
otify_mark_destroy_workfn BAR(1), 9:fsnotify_connector_destroy_workfn fsnot=
ify_connector_destroy_workfn
> [  710.791267][    C1] workqueue events_power_efficient: flags=3D0x80
> [  710.793708][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D7/256 refcnt=3D8
> [  710.793765][    C1]     pending: neigh_managed_work, neigh_managed_wor=
k, neigh_managed_work, neigh_periodic_work, neigh_periodic_work, neigh_peri=
odic_work, check_lifetime
> [  710.793934][    C1] workqueue rcu_gp: flags=3D0x8
> [  710.796240][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D3/256 refcnt=3D4
> [  710.796294][    C1]     in-flight: 179:sync_rcu_do_polled_gp
> [  710.796335][    C1]     pending: sync_rcu_do_polled_gp, process_srcu
> [  710.796403][    C1] workqueue mm_percpu_wq: flags=3D0x8
> [  710.798676][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/256 refcnt=3D2
> [  710.798728][    C1]     pending: vmstat_update
> [  710.798775][    C1] workqueue cgroup_destroy: flags=3D0x0
> [  710.800268][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D9
> [  710.800324][    C1]     pending: css_killed_work_fn
> [  710.800357][    C1]     inactive: css_killed_work_fn, css_killed_work_=
fn, css_release_work_fn, css_release_work_fn, css_killed_work_fn, css_kille=
d_work_fn, css_killed_work_fn
> [  710.802827][    C1] workqueue ipv6_addrconf: flags=3D0x40008
> [  710.803289][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  710.803345][    C1]     pending: addrconf_verify_work
> [  710.803396][    C1] pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hun=
g=3D640s workers=3D3 idle: 23 36
> [  710.803461][    C1] pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s =
workers=3D4 idle: 1873 1871
> [  740.993516][    C1] BUG: workqueue lockup - pool cpus=3D1 node=3D0 fla=
gs=3D0x0 nice=3D0 stuck for 670s!
> [  740.994427][    C1] Showing busy workqueues and worker pools:
> [  740.994975][    C1] workqueue events: flags=3D0x0
> [  740.995387][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D15/256 refcnt=3D16
> [  740.995432][    C1]     pending: do_free_init, e1000_watchdog, vmstat_=
shepherd, kfree_rcu_monitor, regulator_init_complete_work_function, kernfs_=
notify_workfn, release_one_tty, key_garbage_collector, release_one_tty, rel=
ease_one_tty, release_one_tty, release_one_tty, release_one_tty, release_on=
e_tty, release_one_tty
> [  740.998508][    C1] workqueue events_unbound: flags=3D0x2
> [  740.998989][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
4/512 refcnt=3D7
> [  740.999055][    C1]     in-flight: 40:fsnotify_mark_destroy_workfn fsn=
otify_mark_destroy_workfn BAR(1), 9:fsnotify_connector_destroy_workfn fsnot=
ify_connector_destroy_workfn
> [  740.999175][    C1] workqueue events_power_efficient: flags=3D0x80
> [  741.001710][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D7/256 refcnt=3D8
> [  741.001765][    C1]     pending: neigh_managed_work, neigh_managed_wor=
k, neigh_managed_work, neigh_periodic_work, neigh_periodic_work, neigh_peri=
odic_work, check_lifetime
> [  741.001922][    C1] workqueue rcu_gp: flags=3D0x8
> [  741.004173][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D3/256 refcnt=3D4
> [  741.004223][    C1]     in-flight: 179:sync_rcu_do_polled_gp
> [  741.004262][    C1]     pending: sync_rcu_do_polled_gp, process_srcu
> [  741.004326][    C1] workqueue mm_percpu_wq: flags=3D0x8
> [  741.006403][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/256 refcnt=3D2
> [  741.006456][    C1]     pending: vmstat_update
> [  741.007516][    C1] workqueue cgroup_destroy: flags=3D0x0
> [  741.007988][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D9
> [  741.008042][    C1]     pending: css_killed_work_fn
> [  741.008072][    C1]     inactive: css_killed_work_fn, css_killed_work_=
fn, css_release_work_fn, css_release_work_fn, css_killed_work_fn, css_kille=
d_work_fn, css_killed_work_fn
> [  741.008235][    C1] workqueue ipv6_addrconf: flags=3D0x40008
> [  741.011076][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  741.011131][    C1]     pending: addrconf_verify_work
> [  741.011181][    C1] pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hun=
g=3D671s workers=3D3 idle: 23 36
> [  741.011244][    C1] pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s =
workers=3D4 idle: 1873 1871
> [  771.201509][    C1] BUG: workqueue lockup - pool cpus=3D1 node=3D0 fla=
gs=3D0x0 nice=3D0 stuck for 701s!
> [  771.202368][    C1] Showing busy workqueues and worker pools:
> [  771.202945][    C1] workqueue events: flags=3D0x0
> [  771.203355][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D15/256 refcnt=3D16
> [  771.203416][    C1]     pending: do_free_init, e1000_watchdog, vmstat_=
shepherd, kfree_rcu_monitor, regulator_init_complete_work_function, kernfs_=
notify_workfn, release_one_tty, key_garbage_collector, release_one_tty, rel=
ease_one_tty, release_one_tty, release_one_tty, release_one_tty, release_on=
e_tty, release_one_tty
> [  771.206775][    C1] workqueue events_unbound: flags=3D0x2
> [  771.207260][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
4/512 refcnt=3D7
> [  771.207307][    C1]     in-flight: 40:fsnotify_mark_destroy_workfn fsn=
otify_mark_destroy_workfn BAR(1), 9:fsnotify_connector_destroy_workfn fsnot=
ify_connector_destroy_workfn
> [  771.207427][    C1] workqueue events_power_efficient: flags=3D0x80
> [  771.209848][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D7/256 refcnt=3D8
> [  771.209909][    C1]     pending: neigh_managed_work, neigh_managed_wor=
k, neigh_managed_work, neigh_periodic_work, neigh_periodic_work, neigh_peri=
odic_work, check_lifetime
> [  771.210088][    C1] workqueue rcu_gp: flags=3D0x8
> [  771.212125][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D3/256 refcnt=3D4
> [  771.212181][    C1]     in-flight: 179:sync_rcu_do_polled_gp
> [  771.212224][    C1]     pending: sync_rcu_do_polled_gp, process_srcu
> [  771.212292][    C1] workqueue mm_percpu_wq: flags=3D0x8
> [  771.214339][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/256 refcnt=3D2
> [  771.214392][    C1]     pending: vmstat_update
> [  771.214437][    C1] workqueue cgroup_destroy: flags=3D0x0
> [  771.215926][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D9
> [  771.215987][    C1]     pending: css_killed_work_fn
> [  771.216019][    C1]     inactive: css_killed_work_fn, css_killed_work_=
fn, css_release_work_fn, css_release_work_fn, css_killed_work_fn, css_kille=
d_work_fn, css_killed_work_fn
> [  771.216189][    C1] workqueue ipv6_addrconf: flags=3D0x40008
> [  771.219053][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  771.219323][    C1]     pending: addrconf_verify_work
> [  771.219374][    C1] pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hun=
g=3D701s workers=3D3 idle: 23 36
> [  771.219439][    C1] pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s =
workers=3D4 idle: 1871 1873
> [  801.410329][    C1] BUG: workqueue lockup - pool cpus=3D1 node=3D0 fla=
gs=3D0x0 nice=3D0 stuck for 731s!
> [  801.411198][    C1] Showing busy workqueues and worker pools:
> [  801.411729][    C1] workqueue events: flags=3D0x0
> [  801.412126][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D15/256 refcnt=3D16
> [  801.412180][    C1]     pending: do_free_init, e1000_watchdog, vmstat_=
shepherd, kfree_rcu_monitor, regulator_init_complete_work_function, kernfs_=
notify_workfn, release_one_tty, key_garbage_collector, release_one_tty, rel=
ease_one_tty, release_one_tty, release_one_tty, release_one_tty, release_on=
e_tty, release_one_tty
> [  801.415504][    C1] workqueue events_unbound: flags=3D0x2
> [  801.415971][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
4/512 refcnt=3D7
> [  801.416019][    C1]     in-flight: 40:fsnotify_mark_destroy_workfn fsn=
otify_mark_destroy_workfn BAR(1), 9:fsnotify_connector_destroy_workfn fsnot=
ify_connector_destroy_workfn
> [  801.416144][    C1] workqueue events_power_efficient: flags=3D0x80
> [  801.418610][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D7/256 refcnt=3D8
> [  801.418667][    C1]     pending: neigh_managed_work, neigh_managed_wor=
k, neigh_managed_work, neigh_periodic_work, neigh_periodic_work, neigh_peri=
odic_work, check_lifetime
> [  801.418822][    C1] workqueue rcu_gp: flags=3D0x8
> [  801.421028][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D3/256 refcnt=3D4
> [  801.421073][    C1]     in-flight: 179:sync_rcu_do_polled_gp
> [  801.421109][    C1]     pending: sync_rcu_do_polled_gp, process_srcu
> [  801.421163][    C1] workqueue mm_percpu_wq: flags=3D0x8
> [  801.423291][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/256 refcnt=3D2
> [  801.423347][    C1]     pending: vmstat_update
> [  801.423394][    C1] workqueue cgroup_destroy: flags=3D0x0
> [  801.424904][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D9
> [  801.424956][    C1]     pending: css_killed_work_fn
> [  801.424988][    C1]     inactive: css_killed_work_fn, css_killed_work_=
fn, css_release_work_fn, css_release_work_fn, css_killed_work_fn, css_kille=
d_work_fn, css_killed_work_fn
> [  801.425154][    C1] workqueue ipv6_addrconf: flags=3D0x40008
> [  801.427954][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  801.428011][    C1]     pending: addrconf_verify_work
> [  801.428064][    C1] pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hun=
g=3D731s workers=3D3 idle: 23 36
> [  801.428134][    C1] pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s =
workers=3D4 idle: 1873 1871
> [  831.617538][    C1] BUG: workqueue lockup - pool cpus=3D1 node=3D0 fla=
gs=3D0x0 nice=3D0 stuck for 761s!
> [  831.618345][    C1] Showing busy workqueues and worker pools:
> [  831.618921][    C1] workqueue events: flags=3D0x0
> [  831.619320][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D15/256 refcnt=3D16
> [  831.619380][    C1]     pending: do_free_init, e1000_watchdog, vmstat_=
shepherd, kfree_rcu_monitor, regulator_init_complete_work_function, kernfs_=
notify_workfn, release_one_tty, key_garbage_collector, release_one_tty, rel=
ease_one_tty, release_one_tty, release_one_tty, release_one_tty, release_on=
e_tty, release_one_tty
> [  831.622661][    C1] workqueue events_unbound: flags=3D0x2
> [  831.623135][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
4/512 refcnt=3D7
> [  831.623191][    C1]     in-flight: 40:fsnotify_mark_destroy_workfn fsn=
otify_mark_destroy_workfn BAR(1), 9:fsnotify_connector_destroy_workfn fsnot=
ify_connector_destroy_workfn
> [  831.623337][    C1] workqueue events_power_efficient: flags=3D0x80
> [  831.626041][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D7/256 refcnt=3D8
> [  831.626122][    C1]     pending: neigh_managed_work, neigh_managed_wor=
k, neigh_managed_work, neigh_periodic_work, neigh_periodic_work, neigh_peri=
odic_work, check_lifetime
> [  831.626316][    C1] workqueue rcu_gp: flags=3D0x8
> [  831.628626][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D3/256 refcnt=3D4
> [  831.628682][    C1]     in-flight: 179:sync_rcu_do_polled_gp
> [  831.628728][    C1]     pending: sync_rcu_do_polled_gp, process_srcu
> [  831.628798][    C1] workqueue mm_percpu_wq: flags=3D0x8
> [  831.631035][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/256 refcnt=3D2
> [  831.631098][    C1]     pending: vmstat_update
> [  831.631150][    C1] workqueue cgroup_destroy: flags=3D0x0
> [  831.632675][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D9
> [  831.632731][    C1]     pending: css_killed_work_fn
> [  831.632765][    C1]     inactive: css_killed_work_fn, css_killed_work_=
fn, css_release_work_fn, css_release_work_fn, css_killed_work_fn, css_kille=
d_work_fn, css_killed_work_fn
> [  831.632955][    C1] workqueue ipv6_addrconf: flags=3D0x40008
> [  831.635610][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  831.635653][    C1]     pending: addrconf_verify_work
> [  831.635692][    C1] pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hun=
g=3D761s workers=3D3 idle: 23 36
> [  831.635744][    C1] pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s =
workers=3D4 idle: 1871 1873
> [  861.825544][    C1] BUG: workqueue lockup - pool cpus=3D1 node=3D0 fla=
gs=3D0x0 nice=3D0 stuck for 791s!
> [  861.826418][    C1] Showing busy workqueues and worker pools:
> [  861.826963][    C1] workqueue events: flags=3D0x0
> [  861.827374][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D15/256 refcnt=3D16
> [  861.827418][    C1]     pending: do_free_init, e1000_watchdog, vmstat_=
shepherd, kfree_rcu_monitor, regulator_init_complete_work_function, kernfs_=
notify_workfn, release_one_tty, key_garbage_collector, release_one_tty, rel=
ease_one_tty, release_one_tty, release_one_tty, release_one_tty, release_on=
e_tty, release_one_tty
> [  861.830571][    C1] workqueue events_unbound: flags=3D0x2
> [  861.831021][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
4/512 refcnt=3D7
> [  861.831067][    C1]     in-flight: 40:fsnotify_mark_destroy_workfn fsn=
otify_mark_destroy_workfn BAR(1), 9:fsnotify_connector_destroy_workfn fsnot=
ify_connector_destroy_workfn
> [  861.831190][    C1] workqueue events_power_efficient: flags=3D0x80
> [  861.833611][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D7/256 refcnt=3D8
> [  861.833668][    C1]     pending: neigh_managed_work, neigh_managed_wor=
k, neigh_managed_work, neigh_periodic_work, neigh_periodic_work, neigh_peri=
odic_work, check_lifetime
> [  861.833838][    C1] workqueue rcu_gp: flags=3D0x8
> [  861.836085][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D3/256 refcnt=3D4
> [  861.836128][    C1]     in-flight: 179:sync_rcu_do_polled_gp
> [  861.836165][    C1]     pending: sync_rcu_do_polled_gp, process_srcu
> [  861.836223][    C1] workqueue mm_percpu_wq: flags=3D0x8
> [  861.838322][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/256 refcnt=3D2
> [  861.838376][    C1]     pending: vmstat_update
> [  861.838423][    C1] workqueue cgroup_destroy: flags=3D0x0
> [  861.840003][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D9
> [  861.840062][    C1]     pending: css_killed_work_fn
> [  861.840120][    C1]     inactive: css_killed_work_fn, css_killed_work_=
fn, css_release_work_fn, css_release_work_fn, css_killed_work_fn, css_kille=
d_work_fn, css_killed_work_fn
> [  861.840255][    C1] workqueue ipv6_addrconf: flags=3D0x40008
> [  861.842948][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  861.842999][    C1]     pending: addrconf_verify_work
> [  861.843048][    C1] pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hun=
g=3D791s workers=3D3 idle: 23 36
> [  861.843118][    C1] pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s =
workers=3D4 idle: 1873 1871
> [  892.033547][    C1] BUG: workqueue lockup - pool cpus=3D1 node=3D0 fla=
gs=3D0x0 nice=3D0 stuck for 822s!
> [  892.034444][    C1] Showing busy workqueues and worker pools:
> [  892.035014][    C1] workqueue events: flags=3D0x0
> [  892.035425][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D15/256 refcnt=3D16
> [  892.035485][    C1]     pending: do_free_init, e1000_watchdog, vmstat_=
shepherd, kfree_rcu_monitor, regulator_init_complete_work_function, kernfs_=
notify_workfn, release_one_tty, key_garbage_collector, release_one_tty, rel=
ease_one_tty, release_one_tty, release_one_tty, release_one_tty, release_on=
e_tty, release_one_tty
> [  892.038781][    C1] workqueue events_unbound: flags=3D0x2
> [  892.039243][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
5/512 refcnt=3D8
> [  892.039288][    C1]     in-flight: 40:fsnotify_mark_destroy_workfn fsn=
otify_mark_destroy_workfn BAR(1), 9:fsnotify_connector_destroy_workfn fsnot=
ify_connector_destroy_workfn
> [  892.039406][    C1]     pending: toggle_allocation_gate
> [  892.039437][    C1] workqueue events_power_efficient: flags=3D0x80
> [  892.042420][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D7/256 refcnt=3D8
> [  892.042482][    C1]     pending: neigh_managed_work, neigh_managed_wor=
k, neigh_managed_work, neigh_periodic_work, neigh_periodic_work, neigh_peri=
odic_work, check_lifetime
> [  892.044566][    C1] workqueue rcu_gp: flags=3D0x8
> [  892.044969][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D3/256 refcnt=3D4
> [  892.045018][    C1]     in-flight: 179:sync_rcu_do_polled_gp
> [  892.045057][    C1]     pending: sync_rcu_do_polled_gp, process_srcu
> [  892.045123][    C1] workqueue mm_percpu_wq: flags=3D0x8
> [  892.047297][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/256 refcnt=3D2
> [  892.047355][    C1]     pending: vmstat_update
> [  892.047402][    C1] workqueue cgroup_destroy: flags=3D0x0
> [  892.048963][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D9
> [  892.049035][    C1]     pending: css_killed_work_fn
> [  892.049067][    C1]     inactive: css_killed_work_fn, css_killed_work_=
fn, css_release_work_fn, css_release_work_fn, css_killed_work_fn, css_kille=
d_work_fn, css_killed_work_fn
> [  892.049230][    C1] workqueue ipv6_addrconf: flags=3D0x40008
> [  892.052055][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  892.052118][    C1]     pending: addrconf_verify_work
> [  892.052176][    C1] pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hun=
g=3D822s workers=3D3 idle: 23 36
> [  892.052252][    C1] pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s =
workers=3D4 idle: 1871 1873
> [  922.242347][    C1] BUG: workqueue lockup - pool cpus=3D1 node=3D0 fla=
gs=3D0x0 nice=3D0 stuck for 852s!
> [  922.243300][    C1] Showing busy workqueues and worker pools:
> [  922.243812][    C1] workqueue events: flags=3D0x0
> [  922.244216][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D15/256 refcnt=3D16
> [  922.244262][    C1]     pending: do_free_init, e1000_watchdog, vmstat_=
shepherd, kfree_rcu_monitor, regulator_init_complete_work_function, kernfs_=
notify_workfn, release_one_tty, key_garbage_collector, release_one_tty, rel=
ease_one_tty, release_one_tty, release_one_tty, release_one_tty, release_on=
e_tty, release_one_tty
> [  922.247381][    C1] workqueue events_unbound: flags=3D0x2
> [  922.247877][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
4/512 refcnt=3D7
> [  922.247927][    C1]     in-flight: 40:fsnotify_mark_destroy_workfn fsn=
otify_mark_destroy_workfn BAR(1), 9:fsnotify_connector_destroy_workfn fsnot=
ify_connector_destroy_workfn
> [  922.248053][    C1] workqueue events_power_efficient: flags=3D0x80
> [  922.250508][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D7/256 refcnt=3D8
> [  922.250553][    C1]     pending: neigh_managed_work, neigh_managed_wor=
k, neigh_managed_work, neigh_periodic_work, neigh_periodic_work, neigh_peri=
odic_work, check_lifetime
> [  922.250689][    C1] workqueue rcu_gp: flags=3D0x8
> [  922.252888][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D3/256 refcnt=3D4
> [  922.252939][    C1]     in-flight: 179:sync_rcu_do_polled_gp
> [  922.252979][    C1]     pending: sync_rcu_do_polled_gp, process_srcu
> [  922.253044][    C1] workqueue mm_percpu_wq: flags=3D0x8
> [  922.255182][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/256 refcnt=3D2
> [  922.255232][    C1]     pending: vmstat_update
> [  922.255277][    C1] workqueue cgroup_destroy: flags=3D0x0
> [  922.256691][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D9
> [  922.256749][    C1]     pending: css_killed_work_fn
> [  922.256784][    C1]     inactive: css_killed_work_fn, css_killed_work_=
fn, css_release_work_fn, css_release_work_fn, css_killed_work_fn, css_kille=
d_work_fn, css_killed_work_fn
> [  922.256969][    C1] workqueue ipv6_addrconf: flags=3D0x40008
> [  922.259659][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  922.259713][    C1]     pending: addrconf_verify_work
> [  922.259760][    C1] pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hun=
g=3D852s workers=3D3 idle: 23 36
> [  922.259823][    C1] pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s =
workers=3D4 idle: 1873 1871
> [  952.449517][    C1] BUG: workqueue lockup - pool cpus=3D1 node=3D0 fla=
gs=3D0x0 nice=3D0 stuck for 882s!
> [  952.450408][    C1] Showing busy workqueues and worker pools:
> [  952.450995][    C1] workqueue events: flags=3D0x0
> [  952.451428][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D15/256 refcnt=3D16
> [  952.451489][    C1]     pending: do_free_init, e1000_watchdog, vmstat_=
shepherd, kfree_rcu_monitor, regulator_init_complete_work_function, kernfs_=
notify_workfn, release_one_tty, key_garbage_collector, release_one_tty, rel=
ease_one_tty, release_one_tty, release_one_tty, release_one_tty, release_on=
e_tty, release_one_tty
> [  952.454524][    C1] workqueue events_unbound: flags=3D0x2
> [  952.455011][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
4/512 refcnt=3D7
> [  952.455061][    C1]     in-flight: 40:fsnotify_mark_destroy_workfn fsn=
otify_mark_destroy_workfn BAR(1), 9:fsnotify_connector_destroy_workfn fsnot=
ify_connector_destroy_workfn
> [  952.455195][    C1] workqueue events_power_efficient: flags=3D0x80
> [  952.457674][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D7/256 refcnt=3D8
> [  952.457730][    C1]     pending: neigh_managed_work, neigh_managed_wor=
k, neigh_managed_work, neigh_periodic_work, neigh_periodic_work, neigh_peri=
odic_work, check_lifetime
> [  952.457880][    C1] workqueue rcu_gp: flags=3D0x8
> [  952.460158][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D3/256 refcnt=3D4
> [  952.460205][    C1]     in-flight: 179:sync_rcu_do_polled_gp
> [  952.460240][    C1]     pending: sync_rcu_do_polled_gp, process_srcu
> [  952.460303][    C1] workqueue mm_percpu_wq: flags=3D0x8
> [  952.462396][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/256 refcnt=3D2
> [  952.462444][    C1]     pending: vmstat_update
> [  952.463534][    C1] workqueue cgroup_destroy: flags=3D0x0
> [  952.464021][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D9
> [  952.464080][    C1]     pending: css_killed_work_fn
> [  952.464113][    C1]     inactive: css_killed_work_fn, css_killed_work_=
fn, css_release_work_fn, css_release_work_fn, css_killed_work_fn, css_kille=
d_work_fn, css_killed_work_fn
> [  952.464280][    C1] workqueue ipv6_addrconf: flags=3D0x40008
> [  952.467161][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  952.467222][    C1]     pending: addrconf_verify_work
> [  952.467275][    C1] pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hun=
g=3D882s workers=3D3 idle: 23 36
> [  952.467347][    C1] pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s =
workers=3D4 idle: 1871 1873
> [  982.657536][    C1] BUG: workqueue lockup - pool cpus=3D1 node=3D0 fla=
gs=3D0x0 nice=3D0 stuck for 912s!
> [  982.658425][    C1] Showing busy workqueues and worker pools:
> [  982.659004][    C1] workqueue events: flags=3D0x0
> [  982.659421][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D15/256 refcnt=3D16
> [  982.659480][    C1]     pending: do_free_init, e1000_watchdog, vmstat_=
shepherd, kfree_rcu_monitor, regulator_init_complete_work_function, kernfs_=
notify_workfn, release_one_tty, key_garbage_collector, release_one_tty, rel=
ease_one_tty, release_one_tty, release_one_tty, release_one_tty, release_on=
e_tty, release_one_tty
> [  982.662894][    C1] workqueue events_unbound: flags=3D0x2
> [  982.663394][    C1]   pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D=
4/512 refcnt=3D7
> [  982.663445][    C1]     in-flight: 40:fsnotify_mark_destroy_workfn fsn=
otify_mark_destroy_workfn BAR(1), 9:fsnotify_connector_destroy_workfn fsnot=
ify_connector_destroy_workfn
> [  982.665500][    C1] workqueue events_power_efficient: flags=3D0x80
> [  982.665994][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D7/256 refcnt=3D8
> [  982.666044][    C1]     pending: neigh_managed_work, neigh_managed_wor=
k, neigh_managed_work, neigh_periodic_work, neigh_periodic_work, neigh_peri=
odic_work, check_lifetime
> [  982.666181][    C1] workqueue rcu_gp: flags=3D0x8
> [  982.668550][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D3/256 refcnt=3D4
> [  982.668597][    C1]     in-flight: 179:sync_rcu_do_polled_gp
> [  982.668634][    C1]     pending: sync_rcu_do_polled_gp, process_srcu
> [  982.668695][    C1] workqueue mm_percpu_wq: flags=3D0x8
> [  982.670910][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/256 refcnt=3D2
> [  982.670971][    C1]     pending: vmstat_update
> [  982.671020][    C1] workqueue cgroup_destroy: flags=3D0x0
> [  982.672512][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D9
> [  982.672559][    C1]     pending: css_killed_work_fn
> [  982.672587][    C1]     inactive: css_killed_work_fn, css_killed_work_=
fn, css_release_work_fn, css_release_work_fn, css_killed_work_fn, css_kille=
d_work_fn, css_killed_work_fn
> [  982.672740][    C1] workqueue ipv6_addrconf: flags=3D0x40008
> [  982.675414][    C1]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D1/1 refcnt=3D2
> [  982.675466][    C1]     pending: addrconf_verify_work
> [  982.676570][    C1] pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hun=
g=3D912s workers=3D3 idle: 23 36
> [  982.676637][    C1] pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s =
workers=3D4 idle: 1873 1871
> [ 1004.162318][   T29] INFO: task systemd:1 blocked for more than 491 sec=
onds.
> [ 1004.163047][   T29]       Not tainted 5.17.0-rc1-00111-g556d8afe4a77 #1
> [ 1004.163690][   T29] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"=
 disables this message.
> [ 1004.164413][   T29] task:systemd         state:D stack:    0 pid:    1=
 ppid:     0 flags:0x00004000
> [ 1004.165227][   T29] Call Trace:
> [ 1004.165552][   T29]  <TASK>
> [ 1004.165808][ T29] __schedule (kernel/sched/core.c:4986 kernel/sched/co=
re.c:6296) =

> [ 1004.166207][ T29] ? usleep_range_state (kernel/time/timer.c:1843) =

> [ 1004.166670][ T29] schedule (arch/x86/include/asm/preempt.h:85 (discrim=
inator 1) kernel/sched/core.c:6370 (discriminator 1)) =

> [ 1004.167044][ T29] schedule_timeout (kernel/time/timer.c:1858) =

> [ 1004.167498][ T29] ? hlock_class (kernel/locking/lockdep.c:199) =

> [ 1004.167918][ T29] ? write_comp_data (kernel/kcov.c:221) =

> [ 1004.168370][ T29] ? lockdep_hardirqs_on_prepare (kernel/locking/lockde=
p.c:438 kernel/locking/lockdep.c:4293 kernel/locking/lockdep.c:4244) =

> [ 1004.168962][ T29] ? _raw_spin_unlock_irq (arch/x86/include/asm/irqflag=
s.h:45 arch/x86/include/asm/irqflags.h:80 include/linux/spinlock_api_smp.h:=
159 kernel/locking/spinlock.c:202) =

> [ 1004.169435][ T29] __wait_for_common (kernel/sched/completion.c:86 kern=
el/sched/completion.c:106) =

> [ 1004.169915][ T29] __flush_work (kernel/workqueue.c:3095) =

> [ 1004.170331][ T29] ? flush_workqueue_prep_pwqs (kernel/workqueue.c:2660=
) =

> [ 1004.170926][ T29] ? __wait_for_common (kernel/sched/completion.c:74 ke=
rnel/sched/completion.c:106) =

> [ 1004.171397][ T29] ? inotify_poll (fs/notify/inotify/inotify_user.c:288=
) =

> [ 1004.171855][ T29] fsnotify_destroy_group (fs/notify/group.c:84 (discri=
minator 1)) =

> [ 1004.172348][ T29] ? __sanitizer_cov_trace_pc (kernel/kcov.c:200) =

> [ 1004.172852][ T29] ? locks_remove_file (fs/locks.c:2620) =

> [ 1004.173300][ T29] ? inotify_poll (fs/notify/inotify/inotify_user.c:288=
) =

> [ 1004.173722][ T29] inotify_release (fs/notify/inotify/inotify_user.c:29=
7) =

> [ 1004.174143][ T29] __fput (fs/file_table.c:312) =

> [ 1004.174545][ T29] task_work_run (kernel/task_work.c:166 (discriminator=
 1)) =

> [ 1004.175001][ T29] exit_to_user_mode_prepare (include/linux/tracehook.h=
:197 kernel/entry/common.c:175 kernel/entry/common.c:207) =

> [ 1004.175548][ T29] syscall_exit_to_user_mode (kernel/entry/common.c:126=
 kernel/entry/common.c:302) =

> [ 1004.176065][ T29] do_syscall_64 (arch/x86/entry/common.c:87) =

> [ 1004.176511][ T29] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry=
_64.S:113) =

> [ 1004.177062][   T29] RIP: 0033:0x7fa39f4f7b54
> [ 1004.177438][   T29] RSP: 002b:00007fffb0b4d7d8 EFLAGS: 00000246 ORIG_R=
AX: 0000000000000003
> [ 1004.178185][   T29] RAX: 0000000000000000 RBX: 0000000000000017 RCX: 0=
0007fa39f4f7b54
> [ 1004.178867][   T29] RDX: 00007fa39f5c8ca0 RSI: 0000000000000000 RDI: 0=
000000000000017
> [ 1004.179606][   T29] RBP: 00007fa39e3468c0 R08: 00000000000000ef R09: 0=
0007fa3a13f2060
> [ 1004.180297][   T29] R10: 0000000000000007 R11: 0000000000000246 R12: 0=
000000000000000
> [ 1004.181006][   T29] R13: 00007fffb0b4d890 R14: 0000000000000001 R15: 0=
0007fa39f6e3a8e
> [ 1004.181724][   T29]  </TASK>
> [ 1004.182001][   T29] INFO: task kworker/u4:1:9 blocked for more than 49=
1 seconds.
> [ 1004.182640][   T29]       Not tainted 5.17.0-rc1-00111-g556d8afe4a77 #1
> [ 1004.183221][   T29] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"=
 disables this message.
> [ 1004.183958][   T29] task:kworker/u4:1    state:D stack:    0 pid:    9=
 ppid:     2 flags:0x00004000
> [ 1004.184769][   T29] Workqueue: events_unbound fsnotify_connector_destr=
oy_workfn
> [ 1004.185432][   T29] Call Trace:
> [ 1004.185753][   T29]  <TASK>
> [ 1004.186042][ T29] __schedule (kernel/sched/core.c:4986 kernel/sched/co=
re.c:6296) =

> [ 1004.186441][ T29] ? to_kthread (kernel/kthread.c:77 (discriminator 3)) =

> [ 1004.186867][ T29] ? usleep_range_state (kernel/time/timer.c:1843) =

> [ 1004.187313][ T29] schedule (arch/x86/include/asm/preempt.h:85 (discrim=
inator 1) kernel/sched/core.c:6370 (discriminator 1)) =

> [ 1004.187713][ T29] schedule_timeout (kernel/time/timer.c:1858) =

> [ 1004.188141][ T29] ? mark_held_locks (kernel/locking/lockdep.c:4206) =

> [ 1004.188598][ T29] ? lockdep_hardirqs_on_prepare (kernel/locking/lockde=
p.c:438 kernel/locking/lockdep.c:4293 kernel/locking/lockdep.c:4244) =

> [ 1004.189130][ T29] ? _raw_spin_unlock_irq (arch/x86/include/asm/irqflag=
s.h:45 arch/x86/include/asm/irqflags.h:80 include/linux/spinlock_api_smp.h:=
159 kernel/locking/spinlock.c:202) =

> [ 1004.189611][ T29] __wait_for_common (kernel/sched/completion.c:86 kern=
el/sched/completion.c:106) =

> [ 1004.190073][ T29] __synchronize_srcu (kernel/rcu/srcutree.c:1154) =

> [ 1004.190574][ T29] ? rcu_tasks_pregp_step (kernel/rcu/update.c:367) =

> [ 1004.191049][ T29] ? __wait_for_common (kernel/sched/completion.c:74 ke=
rnel/sched/completion.c:106) =

> [ 1004.191549][ T29] fsnotify_connector_destroy_workfn (fs/notify/mark.c:=
165) =

> [ 1004.192112][ T29] process_one_work (arch/x86/include/asm/atomic.h:29 i=
nclude/linux/atomic/atomic-instrumented.h:28 include/linux/jump_label.h:266=
 include/linux/jump_label.h:276 include/trace/events/workqueue.h:108 kernel=
/workqueue.c:2312) =

> [ 1004.192605][ T29] worker_thread (include/linux/list.h:292 kernel/workq=
ueue.c:2455) =

> [ 1004.193020][ T29] ? rescuer_thread (kernel/workqueue.c:2397) =

> [ 1004.193452][ T29] kthread (kernel/kthread.c:377) =

> [ 1004.193834][ T29] ? kthread_complete_and_exit (kernel/kthread.c:332) =

> [ 1004.194326][ T29] ret_from_fork (arch/x86/entry/entry_64.S:301) =

> [ 1004.194768][   T29]  </TASK>
> [ 1004.195061][   T29] INFO: task kworker/u4:2:40 blocked for more than 4=
91 seconds.
> [ 1004.195713][   T29]       Not tainted 5.17.0-rc1-00111-g556d8afe4a77 #1
> [ 1004.196309][   T29] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"=
 disables this message.
> [ 1004.197064][   T29] task:kworker/u4:2    state:D stack:    0 pid:   40=
 ppid:     2 flags:0x00004000
> [ 1004.197887][   T29] Workqueue: events_unbound fsnotify_mark_destroy_wo=
rkfn
> [ 1004.198529][   T29] Call Trace:
> [ 1004.198816][   T29]  <TASK>
> [ 1004.199095][ T29] __schedule (kernel/sched/core.c:4986 kernel/sched/co=
re.c:6296) =

> [ 1004.199524][ T29] ? to_kthread (kernel/kthread.c:77 (discriminator 3)) =

> [ 1004.199911][ T29] ? usleep_range_state (kernel/time/timer.c:1843) =

> [ 1004.200369][ T29] schedule (arch/x86/include/asm/preempt.h:85 (discrim=
inator 1) kernel/sched/core.c:6370 (discriminator 1)) =

> [ 1004.200769][ T29] schedule_timeout (kernel/time/timer.c:1858) =

> [ 1004.201213][ T29] ? mark_held_locks (kernel/locking/lockdep.c:4206) =

> [ 1004.201689][ T29] ? lockdep_hardirqs_on_prepare (kernel/locking/lockde=
p.c:438 kernel/locking/lockdep.c:4293 kernel/locking/lockdep.c:4244) =

> [ 1004.202245][ T29] ? _raw_spin_unlock_irq (arch/x86/include/asm/irqflag=
s.h:45 arch/x86/include/asm/irqflags.h:80 include/linux/spinlock_api_smp.h:=
159 kernel/locking/spinlock.c:202) =

> [ 1004.202716][ T29] __wait_for_common (kernel/sched/completion.c:86 kern=
el/sched/completion.c:106) =

> [ 1004.203170][ T29] __synchronize_srcu (kernel/rcu/srcutree.c:1154) =

> [ 1004.203638][ T29] ? rcu_tasks_pregp_step (kernel/rcu/update.c:367) =

> [ 1004.204121][ T29] ? __wait_for_common (kernel/sched/completion.c:74 ke=
rnel/sched/completion.c:106) =

> [ 1004.204625][ T29] fsnotify_mark_destroy_workfn (fs/notify/mark.c:866) =

> [ 1004.205153][ T29] process_one_work (arch/x86/include/asm/atomic.h:29 i=
nclude/linux/atomic/atomic-instrumented.h:28 include/linux/jump_label.h:266=
 include/linux/jump_label.h:276 include/trace/events/workqueue.h:108 kernel=
/workqueue.c:2312) =

> [ 1004.205643][ T29] worker_thread (include/linux/list.h:292 kernel/workq=
ueue.c:2455) =

> [ 1004.206080][ T29] ? rescuer_thread (kernel/workqueue.c:2397) =

> [ 1004.206559][ T29] kthread (kernel/kthread.c:377) =

> [ 1004.206931][ T29] ? kthread_complete_and_exit (kernel/kthread.c:332) =

> [ 1004.207426][ T29] ret_from_fork (arch/x86/entry/entry_64.S:301) =

> [ 1004.207878][   T29]  </TASK>
> [ 1004.208180][   T29] INFO: task rmmod:1812 blocked for more than 491 se=
conds.
> [ 1004.208797][   T29]       Not tainted 5.17.0-rc1-00111-g556d8afe4a77 #1
> [ 1004.209395][   T29] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"=
 disables this message.
> [ 1004.210155][   T29] task:rmmod           state:D stack:    0 pid: 1812=
 ppid:   508 flags:0x00004000
> [ 1004.210953][   T29] Call Trace:
> [ 1004.211243][   T29]  <TASK>
> [ 1004.211532][ T29] __schedule (kernel/sched/core.c:4986 kernel/sched/co=
re.c:6296) =

> [ 1004.211961][ T29] ? usleep_range_state (kernel/time/timer.c:1843) =

> [ 1004.212427][ T29] schedule (arch/x86/include/asm/preempt.h:85 (discrim=
inator 1) kernel/sched/core.c:6370 (discriminator 1)) =

> [ 1004.212846][ T29] schedule_timeout (kernel/time/timer.c:1858) =

> [ 1004.213296][ T29] ? hlock_class (kernel/locking/lockdep.c:199) =

> [ 1004.213723][ T29] ? write_comp_data (kernel/kcov.c:221) =

> [ 1004.214161][ T29] ? lockdep_hardirqs_on_prepare (kernel/locking/lockde=
p.c:438 kernel/locking/lockdep.c:4293 kernel/locking/lockdep.c:4244) =

> [ 1004.214723][ T29] ? _raw_spin_unlock_irq (arch/x86/include/asm/irqflag=
s.h:45 arch/x86/include/asm/irqflags.h:80 include/linux/spinlock_api_smp.h:=
159 kernel/locking/spinlock.c:202) =

> [ 1004.215223][ T29] __wait_for_common (kernel/sched/completion.c:86 kern=
el/sched/completion.c:106) =

> [ 1004.215702][ T29] kthread_stop (kernel/kthread.c:710) =

> [ 1004.216129][ T29] _torture_stop_kthread (kernel/torture.c:956 (discrim=
inator 3)) torture
> [ 1004.216618][ T29] rcu_torture_cleanup (kernel/rcu/rcutorture.c:2995) r=
cutorture
> [ 1004.217140][ T29] ? prepare_to_wait_exclusive (kernel/sched/wait.c:415=
) =

> [ 1004.217667][ T29] __x64_sys_delete_module (kernel/module.c:969 kernel/=
module.c:912 kernel/module.c:912) =

> [ 1004.218150][ T29] ? lockdep_hardirqs_on_prepare (kernel/locking/lockde=
p.c:438 kernel/locking/lockdep.c:4293 kernel/locking/lockdep.c:4244) =

> [ 1004.218695][ T29] do_syscall_64 (arch/x86/entry/common.c:67 arch/x86/e=
ntry/common.c:80) =

> [ 1004.219103][ T29] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry=
_64.S:113) =

> [ 1004.219635][   T29] RIP: 0033:0x7f93a158add7
> [ 1004.220037][   T29] RSP: 002b:00007ffd6aef9048 EFLAGS: 00000206 ORIG_R=
AX: 00000000000000b0
> [ 1004.220804][   T29] RAX: ffffffffffffffda RBX: 00007f93a3179900 RCX: 0=
0007f93a158add7
> [ 1004.221533][   T29] RDX: 000000000000000a RSI: 0000000000000800 RDI: 0=
0007f93a3179968
> [ 1004.222218][   T29] RBP: 0000000000000000 R08: 00007ffd6aef7fc1 R09: 0=
000000000000000
> [ 1004.222940][   T29] R10: 00007f93a15fcae0 R11: 0000000000000206 R12: 0=
0007ffd6aef9270
> [ 1004.223624][   T29] R13: 00007ffd6aefadfc R14: 00007f93a3179260 R15: 0=
0007f93a3179900
> [ 1004.224302][   T29]  </TASK>
> [ 1004.224593][   T29]
> [ 1004.224593][   T29] Showing all locks held in the system:
> [ 1004.225166][   T29] 2 locks held by kworker/u4:1/9:
> [ 1004.225587][ T29] #0: ffff9b4480051548 ((wq_completion)events_unbound)=
{+.+.}-{0:0}, at: process_one_work (kernel/workqueue.c:2278) =

> [ 1004.226554][ T29] #1: ffff9b448016fe78 (connector_reaper_work){+.+.}-{=
0:0}, at: process_one_work (kernel/workqueue.c:2278) =

> [ 1004.227509][   T29] 1 lock held by khungtaskd/29:
> [ 1004.227914][ T29] #0: ffffffffbaddd460 (rcu_read_lock){....}-{1:2}, at=
: rcu_lock_acquire (include/linux/rcupdate.h:267) =

> [ 1004.228845][   T29] 2 locks held by kworker/u4:2/40:
> [ 1004.229296][ T29] #0: ffff9b4480051548 ((wq_completion)events_unbound)=
{+.+.}-{0:0}, at: process_one_work (kernel/workqueue.c:2278) =

> [ 1004.230227][ T29] #1: ffff9b4480c93e78 ((reaper_work).work){+.+.}-{0:0=
}, at: process_one_work (kernel/workqueue.c:2278) =

> [ 1004.231129][   T29] 2 locks held by kworker/1:2/179:
> [ 1004.231578][   T29] 1 lock held by in:imklog/431:
> [ 1004.231981][   T29] 1 lock held by dmesg/440:
> [ 1004.232337][   T29]
> [ 1004.232570][   T29] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> [ 1004.232570][   T29]
> [ 1004.233244][   T29] Kernel panic - not syncing: hung_task: blocked tas=
ks
> [ 1004.233796][   T29] CPU: 1 PID: 29 Comm: khungtaskd Not tainted 5.17.0=
-rc1-00111-g556d8afe4a77 #1
> [ 1004.234584][   T29] Call Trace:
> [ 1004.234898][   T29]  <TASK>
> [ 1004.235182][ T29] dump_stack_lvl (lib/dump_stack.c:107 (discriminator =
4)) =

> [ 1004.235600][ T29] panic (kernel/panic.c:251) =

> [ 1004.235952][ T29] ? _printk (kernel/printk/printk.c:2270) =

> [ 1004.236313][ T29] ? watchdog (kernel/hung_task.c:216 kernel/hung_task.=
c:369) =

> [ 1004.236698][ T29] watchdog (kernel/hung_task.c:370) =

> [ 1004.237098][ T29] ? rcu_read_unlock (init/main.c:1291) =

> [ 1004.237530][ T29] kthread (kernel/kthread.c:377) =

> [ 1004.237898][ T29] ? kthread_complete_and_exit (kernel/kthread.c:332) =

> [ 1004.238409][ T29] ret_from_fork (arch/x86/entry/entry_64.S:301) =

> [ 1004.238815][   T29]  </TASK>
> [ 1004.239265][   T29] Kernel Offset: 0x38200000 from 0xffffffff81000000 =
(relocation range: 0xffffffff80000000-0xffffffffbfffffff)
> =

> Kboot worker: lkp-worker57
> Elapsed time: 1020
> =

> kvm=3D(
> qemu-system-x86_64
> -enable-kvm
> -cpu SandyBridge
> -kernel $kernel
> -initrd initrd-vm-snb-67.cgz
> -m 16384
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
> ip=3D::::vm-snb-67::dhcp
> root=3D/dev/ram0
> RESULT_ROOT=3D/result/rcutorture/300s-default-rcu/vm-snb/debian-10.4-x86_=
64-20200603.cgz/x86_64-randconfig-a012-20210928/gcc-9/556d8afe4a779f41dfc8f=
a373993a88e43f1c5dc/3
> BOOT_IMAGE=3D/pkg/linux/x86_64-randconfig-a012-20210928/gcc-9/556d8afe4a7=
79f41dfc8fa373993a88e43f1c5dc/vmlinuz-5.17.0-rc1-00111-g556d8afe4a77
> branch=3Dlinux-devel/devel-hourly-20220304-094445
> job=3D/job-script
> user=3Dlkp
> ARCH=3Dx86_64
> kconfig=3Dx86_64-randconfig-a012-20210928
> commit=3D556d8afe4a779f41dfc8fa373993a88e43f1c5dc
> vmalloc=3D128M
> initramfs_async=3D0
> page_owner=3Don
> max_uptime=3D2100
> =

> =

> To reproduce:
> =

>         # build kernel
> 	cd linux
> 	cp config-5.17.0-rc1-00111-g556d8afe4a77 .config
> 	make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Dx86_64 olddefconfig prepare module=
s_prepare bzImage modules
> 	make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Dx86_64 INSTALL_MOD_PATH=3D<mod-ins=
tall-dir> modules_install
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
> 0-DAY CI Kernel Test Service
> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org
> =

> Thanks,
> Oliver Sang
> =


> #
> # Automatically generated file; DO NOT EDIT.
> # Linux/x86_64 5.17.0-rc1 Kernel Configuration
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
> # CONFIG_UAPI_HEADER_TEST is not set
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
> # CONFIG_SYSVIPC is not set
> CONFIG_POSIX_MQUEUE=3Dy
> CONFIG_POSIX_MQUEUE_SYSCTL=3Dy
> # CONFIG_WATCH_QUEUE is not set
> # CONFIG_CROSS_MEMORY_ATTACH is not set
> CONFIG_USELIB=3Dy
> CONFIG_AUDIT=3Dy
> CONFIG_HAVE_ARCH_AUDITSYSCALL=3Dy
> CONFIG_AUDITSYSCALL=3Dy
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
> CONFIG_POSIX_CPU_TIMERS_TASK_WORK=3Dy
> =

> #
> # Timers subsystem
> #
> CONFIG_TICK_ONESHOT=3Dy
> CONFIG_NO_HZ_COMMON=3Dy
> # CONFIG_HZ_PERIODIC is not set
> CONFIG_NO_HZ_IDLE=3Dy
> # CONFIG_NO_HZ_FULL is not set
> CONFIG_NO_HZ=3Dy
> # CONFIG_HIGH_RES_TIMERS is not set
> CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US=3D100
> # end of Timers subsystem
> =

> CONFIG_BPF=3Dy
> CONFIG_HAVE_EBPF_JIT=3Dy
> CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=3Dy
> =

> #
> # BPF subsystem
> #
> # CONFIG_BPF_SYSCALL is not set
> # CONFIG_BPF_JIT is not set
> # end of BPF subsystem
> =

> CONFIG_PREEMPT_VOLUNTARY_BUILD=3Dy
> # CONFIG_PREEMPT_NONE is not set
> CONFIG_PREEMPT_VOLUNTARY=3Dy
> # CONFIG_PREEMPT is not set
> CONFIG_PREEMPT_COUNT=3Dy
> # CONFIG_PREEMPT_DYNAMIC is not set
> # CONFIG_SCHED_CORE is not set
> =

> #
> # CPU/Task time and stats accounting
> #
> CONFIG_TICK_CPU_ACCOUNTING=3Dy
> # CONFIG_VIRT_CPU_ACCOUNTING_GEN is not set
> # CONFIG_IRQ_TIME_ACCOUNTING is not set
> CONFIG_BSD_PROCESS_ACCT=3Dy
> CONFIG_BSD_PROCESS_ACCT_V3=3Dy
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
> # CONFIG_RCU_EXPERT is not set
> CONFIG_SRCU=3Dy
> CONFIG_TREE_SRCU=3Dy
> CONFIG_TASKS_RCU_GENERIC=3Dy
> CONFIG_TASKS_RCU=3Dy
> CONFIG_TASKS_RUDE_RCU=3Dy
> CONFIG_TASKS_TRACE_RCU=3Dy
> CONFIG_RCU_STALL_COMMON=3Dy
> CONFIG_RCU_NEED_SEGCBLIST=3Dy
> # end of RCU Subsystem
> =

> CONFIG_BUILD_BIN2C=3Dy
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
> # CONFIG_UCLAMP_TASK is not set
> # end of Scheduler features
> =

> CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=3Dy
> CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=3Dy
> CONFIG_CC_HAS_INT128=3Dy
> CONFIG_CC_IMPLICIT_FALLTHROUGH=3D"-Wimplicit-fallthrough=3D5"
> CONFIG_ARCH_SUPPORTS_INT128=3Dy
> CONFIG_CGROUPS=3Dy
> CONFIG_PAGE_COUNTER=3Dy
> CONFIG_MEMCG=3Dy
> CONFIG_MEMCG_KMEM=3Dy
> CONFIG_CGROUP_SCHED=3Dy
> CONFIG_FAIR_GROUP_SCHED=3Dy
> CONFIG_CFS_BANDWIDTH=3Dy
> # CONFIG_RT_GROUP_SCHED is not set
> CONFIG_CGROUP_PIDS=3Dy
> CONFIG_CGROUP_RDMA=3Dy
> # CONFIG_CGROUP_FREEZER is not set
> # CONFIG_CGROUP_HUGETLB is not set
> CONFIG_CPUSETS=3Dy
> CONFIG_PROC_PID_CPUSET=3Dy
> CONFIG_CGROUP_DEVICE=3Dy
> CONFIG_CGROUP_CPUACCT=3Dy
> CONFIG_CGROUP_PERF=3Dy
> CONFIG_CGROUP_MISC=3Dy
> CONFIG_CGROUP_DEBUG=3Dy
> CONFIG_NAMESPACES=3Dy
> # CONFIG_UTS_NS is not set
> # CONFIG_TIME_NS is not set
> CONFIG_IPC_NS=3Dy
> CONFIG_USER_NS=3Dy
> # CONFIG_PID_NS is not set
> CONFIG_NET_NS=3Dy
> # CONFIG_CHECKPOINT_RESTORE is not set
> CONFIG_SCHED_AUTOGROUP=3Dy
> # CONFIG_SYSFS_DEPRECATED is not set
> # CONFIG_RELAY is not set
> CONFIG_BLK_DEV_INITRD=3Dy
> CONFIG_INITRAMFS_SOURCE=3D""
> CONFIG_RD_GZIP=3Dy
> CONFIG_RD_BZIP2=3Dy
> CONFIG_RD_LZMA=3Dy
> CONFIG_RD_XZ=3Dy
> CONFIG_RD_LZO=3Dy
> CONFIG_RD_LZ4=3Dy
> CONFIG_RD_ZSTD=3Dy
> # CONFIG_BOOT_CONFIG is not set
> # CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
> CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
> CONFIG_LD_ORPHAN_WARN=3Dy
> CONFIG_SYSCTL=3Dy
> CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
> CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
> CONFIG_EXPERT=3Dy
> CONFIG_MULTIUSER=3Dy
> CONFIG_SGETMASK_SYSCALL=3Dy
> # CONFIG_SYSFS_SYSCALL is not set
> CONFIG_FHANDLE=3Dy
> CONFIG_POSIX_TIMERS=3Dy
> CONFIG_PRINTK=3Dy
> CONFIG_BUG=3Dy
> CONFIG_ELF_CORE=3Dy
> # CONFIG_PCSPKR_PLATFORM is not set
> # CONFIG_BASE_FULL is not set
> CONFIG_FUTEX=3Dy
> CONFIG_FUTEX_PI=3Dy
> CONFIG_EPOLL=3Dy
> CONFIG_SIGNALFD=3Dy
> CONFIG_TIMERFD=3Dy
> CONFIG_EVENTFD=3Dy
> CONFIG_SHMEM=3Dy
> CONFIG_AIO=3Dy
> CONFIG_IO_URING=3Dy
> CONFIG_ADVISE_SYSCALLS=3Dy
> CONFIG_HAVE_ARCH_USERFAULTFD_WP=3Dy
> CONFIG_HAVE_ARCH_USERFAULTFD_MINOR=3Dy
> CONFIG_MEMBARRIER=3Dy
> CONFIG_KALLSYMS=3Dy
> CONFIG_KALLSYMS_ALL=3Dy
> CONFIG_KALLSYMS_ABSOLUTE_PERCPU=3Dy
> CONFIG_KALLSYMS_BASE_RELATIVE=3Dy
> CONFIG_USERFAULTFD=3Dy
> CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=3Dy
> CONFIG_KCMP=3Dy
> CONFIG_RSEQ=3Dy
> # CONFIG_DEBUG_RSEQ is not set
> CONFIG_EMBEDDED=3Dy
> CONFIG_HAVE_PERF_EVENTS=3Dy
> CONFIG_PERF_USE_VMALLOC=3Dy
> CONFIG_PC104=3Dy
> =

> #
> # Kernel Performance Events And Counters
> #
> CONFIG_PERF_EVENTS=3Dy
> CONFIG_DEBUG_PERF_USE_VMALLOC=3Dy
> # end of Kernel Performance Events And Counters
> =

> # CONFIG_VM_EVENT_COUNTERS is not set
> # CONFIG_SLUB_DEBUG is not set
> # CONFIG_COMPAT_BRK is not set
> # CONFIG_SLAB is not set
> CONFIG_SLUB=3Dy
> # CONFIG_SLOB is not set
> CONFIG_SLAB_MERGE_DEFAULT=3Dy
> CONFIG_SLAB_FREELIST_RANDOM=3Dy
> # CONFIG_SLAB_FREELIST_HARDENED is not set
> CONFIG_SHUFFLE_PAGE_ALLOCATOR=3Dy
> CONFIG_SLUB_CPU_PARTIAL=3Dy
> CONFIG_SYSTEM_DATA_VERIFICATION=3Dy
> # CONFIG_PROFILING is not set
> CONFIG_TRACEPOINTS=3Dy
> # end of General setup
> =

> CONFIG_64BIT=3Dy
> CONFIG_X86_64=3Dy
> CONFIG_X86=3Dy
> CONFIG_INSTRUCTION_DECODER=3Dy
> CONFIG_OUTPUT_FORMAT=3D"elf64-x86-64"
> CONFIG_LOCKDEP_SUPPORT=3Dy
> CONFIG_STACKTRACE_SUPPORT=3Dy
> CONFIG_MMU=3Dy
> CONFIG_ARCH_MMAP_RND_BITS_MIN=3D28
> CONFIG_ARCH_MMAP_RND_BITS_MAX=3D32
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=3D8
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=3D16
> CONFIG_GENERIC_BUG=3Dy
> CONFIG_GENERIC_BUG_RELATIVE_POINTERS=3Dy
> CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
> CONFIG_ARCH_HAS_CPU_RELAX=3Dy
> CONFIG_ARCH_HAS_FILTER_PGPROT=3Dy
> CONFIG_ARCH_HIBERNATION_POSSIBLE=3Dy
> CONFIG_ARCH_NR_GPIO=3D1024
> CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
> CONFIG_ARCH_WANT_GENERAL_HUGETLB=3Dy
> CONFIG_AUDIT_ARCH=3Dy
> CONFIG_X86_64_SMP=3Dy
> CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
> CONFIG_FIX_EARLYCON_MEM=3Dy
> CONFIG_PGTABLE_LEVELS=3D5
> CONFIG_CC_HAS_SANE_STACKPROTECTOR=3Dy
> =

> #
> # Processor type and features
> #
> CONFIG_SMP=3Dy
> CONFIG_X86_FEATURE_NAMES=3Dy
> # CONFIG_X86_X2APIC is not set
> # CONFIG_X86_MPPARSE is not set
> CONFIG_GOLDFISH=3Dy
> # CONFIG_RETPOLINE is not set
> CONFIG_X86_CPU_RESCTRL=3Dy
> # CONFIG_X86_EXTENDED_PLATFORM is not set
> # CONFIG_X86_INTEL_LPSS is not set
> # CONFIG_X86_AMD_PLATFORM_DEVICE is not set
> CONFIG_IOSF_MBI=3Dm
> CONFIG_IOSF_MBI_DEBUG=3Dy
> CONFIG_X86_SUPPORTS_MEMORY_FAILURE=3Dy
> # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
> CONFIG_HYPERVISOR_GUEST=3Dy
> CONFIG_PARAVIRT=3Dy
> # CONFIG_PARAVIRT_DEBUG is not set
> # CONFIG_PARAVIRT_SPINLOCKS is not set
> CONFIG_X86_HV_CALLBACK_VECTOR=3Dy
> # CONFIG_XEN is not set
> CONFIG_KVM_GUEST=3Dy
> CONFIG_ARCH_CPUIDLE_HALTPOLL=3Dy
> # CONFIG_PVH is not set
> # CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
> CONFIG_PARAVIRT_CLOCK=3Dy
> # CONFIG_JAILHOUSE_GUEST is not set
> # CONFIG_ACRN_GUEST is not set
> # CONFIG_MK8 is not set
> # CONFIG_MPSC is not set
> # CONFIG_MCORE2 is not set
> # CONFIG_MATOM is not set
> CONFIG_GENERIC_CPU=3Dy
> CONFIG_X86_INTERNODE_CACHE_SHIFT=3D6
> CONFIG_X86_L1_CACHE_SHIFT=3D6
> CONFIG_X86_TSC=3Dy
> CONFIG_X86_CMPXCHG64=3Dy
> CONFIG_X86_CMOV=3Dy
> CONFIG_X86_MINIMUM_CPU_FAMILY=3D64
> CONFIG_X86_DEBUGCTLMSR=3Dy
> CONFIG_IA32_FEAT_CTL=3Dy
> CONFIG_X86_VMX_FEATURE_NAMES=3Dy
> CONFIG_PROCESSOR_SELECT=3Dy
> CONFIG_CPU_SUP_INTEL=3Dy
> # CONFIG_CPU_SUP_AMD is not set
> # CONFIG_CPU_SUP_HYGON is not set
> # CONFIG_CPU_SUP_CENTAUR is not set
> # CONFIG_CPU_SUP_ZHAOXIN is not set
> CONFIG_HPET_TIMER=3Dy
> CONFIG_HPET_EMULATE_RTC=3Dy
> # CONFIG_DMI is not set
> CONFIG_MAXSMP=3Dy
> CONFIG_NR_CPUS_RANGE_BEGIN=3D8192
> CONFIG_NR_CPUS_RANGE_END=3D8192
> CONFIG_NR_CPUS_DEFAULT=3D8192
> CONFIG_NR_CPUS=3D8192
> CONFIG_SCHED_CLUSTER=3Dy
> CONFIG_SCHED_SMT=3Dy
> CONFIG_SCHED_MC=3Dy
> CONFIG_SCHED_MC_PRIO=3Dy
> CONFIG_X86_LOCAL_APIC=3Dy
> CONFIG_X86_IO_APIC=3Dy
> CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=3Dy
> CONFIG_X86_MCE=3Dy
> # CONFIG_X86_MCELOG_LEGACY is not set
> # CONFIG_X86_MCE_INTEL is not set
> CONFIG_X86_MCE_INJECT=3Dm
> =

> #
> # Performance monitoring
> #
> # CONFIG_PERF_EVENTS_INTEL_UNCORE is not set
> CONFIG_PERF_EVENTS_INTEL_RAPL=3Dm
> # CONFIG_PERF_EVENTS_INTEL_CSTATE is not set
> # end of Performance monitoring
> =

> CONFIG_X86_VSYSCALL_EMULATION=3Dy
> CONFIG_X86_IOPL_IOPERM=3Dy
> CONFIG_I8K=3Dy
> # CONFIG_MICROCODE is not set
> CONFIG_X86_MSR=3Dm
> CONFIG_X86_CPUID=3Dy
> CONFIG_X86_5LEVEL=3Dy
> CONFIG_X86_DIRECT_GBPAGES=3Dy
> CONFIG_X86_CPA_STATISTICS=3Dy
> # CONFIG_NUMA is not set
> CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
> CONFIG_ARCH_SPARSEMEM_DEFAULT=3Dy
> CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
> CONFIG_ILLEGAL_POINTER_VALUE=3D0xdead000000000000
> # CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
> # CONFIG_MTRR is not set
> CONFIG_ARCH_RANDOM=3Dy
> CONFIG_X86_SMAP=3Dy
> CONFIG_X86_UMIP=3Dy
> # CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS is not set
> # CONFIG_X86_INTEL_TSX_MODE_OFF is not set
> CONFIG_X86_INTEL_TSX_MODE_ON=3Dy
> # CONFIG_X86_INTEL_TSX_MODE_AUTO is not set
> CONFIG_X86_SGX=3Dy
> # CONFIG_EFI is not set
> # CONFIG_HZ_100 is not set
> # CONFIG_HZ_250 is not set
> # CONFIG_HZ_300 is not set
> CONFIG_HZ_1000=3Dy
> CONFIG_HZ=3D1000
> CONFIG_KEXEC=3Dy
> CONFIG_KEXEC_FILE=3Dy
> CONFIG_ARCH_HAS_KEXEC_PURGATORY=3Dy
> CONFIG_KEXEC_SIG=3Dy
> # CONFIG_KEXEC_SIG_FORCE is not set
> CONFIG_KEXEC_BZIMAGE_VERIFY_SIG=3Dy
> CONFIG_CRASH_DUMP=3Dy
> CONFIG_PHYSICAL_START=3D0x1000000
> CONFIG_RELOCATABLE=3Dy
> CONFIG_RANDOMIZE_BASE=3Dy
> CONFIG_X86_NEED_RELOCS=3Dy
> CONFIG_PHYSICAL_ALIGN=3D0x200000
> CONFIG_DYNAMIC_MEMORY_LAYOUT=3Dy
> CONFIG_RANDOMIZE_MEMORY=3Dy
> CONFIG_RANDOMIZE_MEMORY_PHYSICAL_PADDING=3D0x0
> CONFIG_HOTPLUG_CPU=3Dy
> CONFIG_BOOTPARAM_HOTPLUG_CPU0=3Dy
> CONFIG_DEBUG_HOTPLUG_CPU0=3Dy
> CONFIG_LEGACY_VSYSCALL_EMULATE=3Dy
> # CONFIG_LEGACY_VSYSCALL_XONLY is not set
> # CONFIG_LEGACY_VSYSCALL_NONE is not set
> # CONFIG_CMDLINE_BOOL is not set
> # CONFIG_MODIFY_LDT_SYSCALL is not set
> # CONFIG_STRICT_SIGALTSTACK_SIZE is not set
> CONFIG_HAVE_LIVEPATCH=3Dy
> # end of Processor type and features
> =

> CONFIG_ARCH_HAS_ADD_PAGES=3Dy
> CONFIG_ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE=3Dy
> =

> #
> # Power management and ACPI options
> #
> # CONFIG_SUSPEND is not set
> CONFIG_PM=3Dy
> CONFIG_PM_DEBUG=3Dy
> # CONFIG_PM_ADVANCED_DEBUG is not set
> CONFIG_PM_CLK=3Dy
> # CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
> CONFIG_ENERGY_MODEL=3Dy
> CONFIG_ARCH_SUPPORTS_ACPI=3Dy
> CONFIG_ACPI=3Dy
> CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy
> CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=3Dy
> CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=3Dy
> CONFIG_ACPI_TABLE_LIB=3Dy
> CONFIG_ACPI_DEBUGGER=3Dy
> CONFIG_ACPI_DEBUGGER_USER=3Dy
> CONFIG_ACPI_SPCR_TABLE=3Dy
> # CONFIG_ACPI_FPDT is not set
> CONFIG_ACPI_LPIT=3Dy
> CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=3Dy
> CONFIG_ACPI_EC_DEBUGFS=3Dy
> # CONFIG_ACPI_AC is not set
> CONFIG_ACPI_BATTERY=3Dm
> CONFIG_ACPI_BUTTON=3Dm
> CONFIG_ACPI_TINY_POWER_BUTTON=3Dm
> CONFIG_ACPI_TINY_POWER_BUTTON_SIGNAL=3D38
> CONFIG_ACPI_VIDEO=3Dm
> CONFIG_ACPI_FAN=3Dm
> CONFIG_ACPI_DOCK=3Dy
> CONFIG_ACPI_CPU_FREQ_PSS=3Dy
> CONFIG_ACPI_PROCESSOR_CSTATE=3Dy
> CONFIG_ACPI_PROCESSOR_IDLE=3Dy
> CONFIG_ACPI_CPPC_LIB=3Dy
> CONFIG_ACPI_PROCESSOR=3Dy
> CONFIG_ACPI_IPMI=3Dm
> CONFIG_ACPI_HOTPLUG_CPU=3Dy
> CONFIG_ACPI_PROCESSOR_AGGREGATOR=3Dy
> CONFIG_ACPI_THERMAL=3Dm
> CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=3Dy
> CONFIG_ACPI_TABLE_UPGRADE=3Dy
> CONFIG_ACPI_DEBUG=3Dy
> CONFIG_ACPI_PCI_SLOT=3Dy
> CONFIG_ACPI_CONTAINER=3Dy
> CONFIG_ACPI_HOTPLUG_IOAPIC=3Dy
> CONFIG_ACPI_SBS=3Dy
> # CONFIG_ACPI_HED is not set
> # CONFIG_ACPI_CUSTOM_METHOD is not set
> # CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
> CONFIG_HAVE_ACPI_APEI=3Dy
> CONFIG_HAVE_ACPI_APEI_NMI=3Dy
> # CONFIG_ACPI_APEI is not set
> # CONFIG_ACPI_DPTF is not set
> CONFIG_ACPI_CONFIGFS=3Dy
> # CONFIG_ACPI_PFRUT is not set
> CONFIG_ACPI_PCC=3Dy
> CONFIG_PMIC_OPREGION=3Dy
> CONFIG_X86_PM_TIMER=3Dy
> =

> #
> # CPU Frequency scaling
> #
> CONFIG_CPU_FREQ=3Dy
> CONFIG_CPU_FREQ_GOV_ATTR_SET=3Dy
> CONFIG_CPU_FREQ_GOV_COMMON=3Dy
> CONFIG_CPU_FREQ_STAT=3Dy
> # CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
> CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=3Dy
> # CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL is not set
> CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
> CONFIG_CPU_FREQ_GOV_POWERSAVE=3Dm
> CONFIG_CPU_FREQ_GOV_USERSPACE=3Dy
> CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dy
> # CONFIG_CPU_FREQ_GOV_CONSERVATIVE is not set
> CONFIG_CPU_FREQ_GOV_SCHEDUTIL=3Dy
> =

> #
> # CPU frequency scaling drivers
> #
> CONFIG_CPUFREQ_DT=3Dm
> CONFIG_CPUFREQ_DT_PLATDEV=3Dy
> CONFIG_X86_INTEL_PSTATE=3Dy
> CONFIG_X86_PCC_CPUFREQ=3Dm
> # CONFIG_X86_AMD_PSTATE is not set
> CONFIG_X86_ACPI_CPUFREQ=3Dy
> CONFIG_X86_POWERNOW_K8=3Dm
> CONFIG_X86_SPEEDSTEP_CENTRINO=3Dm
> CONFIG_X86_P4_CLOCKMOD=3Dy
> =

> #
> # shared options
> #
> CONFIG_X86_SPEEDSTEP_LIB=3Dy
> # end of CPU Frequency scaling
> =

> #
> # CPU Idle
> #
> CONFIG_CPU_IDLE=3Dy
> # CONFIG_CPU_IDLE_GOV_LADDER is not set
> CONFIG_CPU_IDLE_GOV_MENU=3Dy
> CONFIG_CPU_IDLE_GOV_TEO=3Dy
> # CONFIG_CPU_IDLE_GOV_HALTPOLL is not set
> CONFIG_HALTPOLL_CPUIDLE=3Dy
> # end of CPU Idle
> =

> CONFIG_INTEL_IDLE=3Dy
> # end of Power management and ACPI options
> =

> #
> # Bus options (PCI etc.)
> #
> CONFIG_PCI_DIRECT=3Dy
> CONFIG_PCI_MMCONFIG=3Dy
> CONFIG_MMCONF_FAM10H=3Dy
> # CONFIG_PCI_CNB20LE_QUIRK is not set
> CONFIG_ISA_BUS=3Dy
> # CONFIG_ISA_DMA_API is not set
> # end of Bus options (PCI etc.)
> =

> #
> # Binary Emulations
> #
> # CONFIG_IA32_EMULATION is not set
> CONFIG_X86_X32=3Dy
> CONFIG_COMPAT=3Dy
> CONFIG_COMPAT_FOR_U64_ALIGNMENT=3Dy
> # end of Binary Emulations
> =

> CONFIG_HAVE_KVM=3Dy
> # CONFIG_VIRTUALIZATION is not set
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
> CONFIG_KPROBES=3Dy
> # CONFIG_JUMP_LABEL is not set
> # CONFIG_STATIC_CALL_SELFTEST is not set
> CONFIG_OPTPROBES=3Dy
> CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dy
> CONFIG_ARCH_USE_BUILTIN_BSWAP=3Dy
> CONFIG_KRETPROBES=3Dy
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
> CONFIG_HAVE_ALIGNED_STRUCT_PAGE=3Dy
> CONFIG_HAVE_CMPXCHG_LOCAL=3Dy
> CONFIG_HAVE_CMPXCHG_DOUBLE=3Dy
> CONFIG_HAVE_ARCH_SECCOMP=3Dy
> CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
> # CONFIG_SECCOMP is not set
> CONFIG_HAVE_ARCH_STACKLEAK=3Dy
> CONFIG_HAVE_STACKPROTECTOR=3Dy
> # CONFIG_STACKPROTECTOR is not set
> CONFIG_ARCH_SUPPORTS_LTO_CLANG=3Dy
> CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=3Dy
> CONFIG_LTO_NONE=3Dy
> CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=3Dy
> CONFIG_HAVE_CONTEXT_TRACKING=3Dy
> CONFIG_HAVE_CONTEXT_TRACKING_OFFSTACK=3Dy
> CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=3Dy
> CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
> CONFIG_HAVE_MOVE_PUD=3Dy
> CONFIG_HAVE_MOVE_PMD=3Dy
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=3Dy
> CONFIG_HAVE_ARCH_HUGE_VMAP=3Dy
> CONFIG_ARCH_WANT_HUGE_PMD_SHARE=3Dy
> CONFIG_HAVE_ARCH_SOFT_DIRTY=3Dy
> CONFIG_HAVE_MOD_ARCH_SPECIFIC=3Dy
> CONFIG_MODULES_USE_ELF_RELA=3Dy
> CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=3Dy
> CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=3Dy
> CONFIG_ARCH_HAS_ELF_RANDOMIZE=3Dy
> CONFIG_HAVE_ARCH_MMAP_RND_BITS=3Dy
> CONFIG_HAVE_EXIT_THREAD=3Dy
> CONFIG_ARCH_MMAP_RND_BITS=3D28
> CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS=3Dy
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS=3D8
> CONFIG_HAVE_ARCH_COMPAT_MMAP_BASES=3Dy
> CONFIG_PAGE_SIZE_LESS_THAN_64KB=3Dy
> CONFIG_PAGE_SIZE_LESS_THAN_256KB=3Dy
> CONFIG_HAVE_STACK_VALIDATION=3Dy
> CONFIG_HAVE_RELIABLE_STACKTRACE=3Dy
> CONFIG_ISA_BUS_API=3Dy
> CONFIG_COMPAT_32BIT_TIME=3Dy
> CONFIG_HAVE_ARCH_VMAP_STACK=3Dy
> # CONFIG_VMAP_STACK is not set
> CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=3Dy
> # CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT is not set
> CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=3Dy
> CONFIG_STRICT_KERNEL_RWX=3Dy
> CONFIG_ARCH_HAS_STRICT_MODULE_RWX=3Dy
> CONFIG_STRICT_MODULE_RWX=3Dy
> CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=3Dy
> # CONFIG_LOCK_EVENT_COUNTS is not set
> CONFIG_ARCH_HAS_MEM_ENCRYPT=3Dy
> CONFIG_HAVE_STATIC_CALL=3Dy
> CONFIG_HAVE_STATIC_CALL_INLINE=3Dy
> CONFIG_HAVE_PREEMPT_DYNAMIC=3Dy
> CONFIG_ARCH_WANT_LD_ORPHAN_WARN=3Dy
> CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy
> CONFIG_ARCH_SUPPORTS_PAGE_TABLE_CHECK=3Dy
> CONFIG_ARCH_HAS_ELFCORE_COMPAT=3Dy
> CONFIG_ARCH_HAS_PARANOID_L1D_FLUSH=3Dy
> CONFIG_DYNAMIC_SIGFRAME=3Dy
> CONFIG_HAVE_ARCH_NODE_DEV_GROUP=3Dy
> =

> #
> # GCOV-based kernel profiling
> #
> # CONFIG_GCOV_KERNEL is not set
> CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
> # end of GCOV-based kernel profiling
> =

> CONFIG_HAVE_GCC_PLUGINS=3Dy
> # end of General architecture-dependent options
> =

> CONFIG_RT_MUTEXES=3Dy
> CONFIG_BASE_SMALL=3D1
> CONFIG_MODULE_SIG_FORMAT=3Dy
> CONFIG_MODULES=3Dy
> # CONFIG_MODULE_FORCE_LOAD is not set
> CONFIG_MODULE_UNLOAD=3Dy
> # CONFIG_MODULE_FORCE_UNLOAD is not set
> # CONFIG_MODVERSIONS is not set
> # CONFIG_MODULE_SRCVERSION_ALL is not set
> CONFIG_MODULE_SIG=3Dy
> # CONFIG_MODULE_SIG_FORCE is not set
> CONFIG_MODULE_SIG_ALL=3Dy
> # CONFIG_MODULE_SIG_SHA1 is not set
> # CONFIG_MODULE_SIG_SHA224 is not set
> # CONFIG_MODULE_SIG_SHA256 is not set
> CONFIG_MODULE_SIG_SHA384=3Dy
> # CONFIG_MODULE_SIG_SHA512 is not set
> CONFIG_MODULE_SIG_HASH=3D"sha384"
> CONFIG_MODULE_COMPRESS_NONE=3Dy
> # CONFIG_MODULE_COMPRESS_GZIP is not set
> # CONFIG_MODULE_COMPRESS_XZ is not set
> # CONFIG_MODULE_COMPRESS_ZSTD is not set
> # CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
> CONFIG_MODPROBE_PATH=3D"/sbin/modprobe"
> # CONFIG_TRIM_UNUSED_KSYMS is not set
> CONFIG_MODULES_TREE_LOOKUP=3Dy
> # CONFIG_BLOCK is not set
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
> =

> #
> # Executable file formats
> #
> CONFIG_BINFMT_ELF=3Dy
> CONFIG_COMPAT_BINFMT_ELF=3Dy
> CONFIG_ELFCORE=3Dy
> # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
> CONFIG_BINFMT_SCRIPT=3Dy
> # CONFIG_BINFMT_MISC is not set
> CONFIG_COREDUMP=3Dy
> # end of Executable file formats
> =

> #
> # Memory Management options
> #
> CONFIG_SELECT_MEMORY_MODEL=3Dy
> CONFIG_SPARSEMEM_MANUAL=3Dy
> CONFIG_SPARSEMEM=3Dy
> CONFIG_SPARSEMEM_EXTREME=3Dy
> CONFIG_SPARSEMEM_VMEMMAP_ENABLE=3Dy
> CONFIG_SPARSEMEM_VMEMMAP=3Dy
> CONFIG_HAVE_FAST_GUP=3Dy
> CONFIG_EXCLUSIVE_SYSTEM_RAM=3Dy
> CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
> # CONFIG_MEMORY_HOTPLUG is not set
> CONFIG_SPLIT_PTLOCK_CPUS=3D4
> CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=3Dy
> CONFIG_MEMORY_BALLOON=3Dy
> CONFIG_BALLOON_COMPACTION=3Dy
> CONFIG_COMPACTION=3Dy
> CONFIG_PAGE_REPORTING=3Dy
> CONFIG_MIGRATION=3Dy
> CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=3Dy
> CONFIG_ARCH_ENABLE_THP_MIGRATION=3Dy
> CONFIG_PHYS_ADDR_T_64BIT=3Dy
> CONFIG_VIRT_TO_BUS=3Dy
> CONFIG_MMU_NOTIFIER=3Dy
> CONFIG_KSM=3Dy
> CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
> CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=3Dy
> # CONFIG_MEMORY_FAILURE is not set
> CONFIG_TRANSPARENT_HUGEPAGE=3Dy
> # CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS is not set
> CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=3Dy
> CONFIG_ARCH_WANTS_THP_SWAP=3Dy
> CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=3Dy
> CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=3Dy
> CONFIG_HAVE_SETUP_PER_CPU_AREA=3Dy
> # CONFIG_CMA is not set
> CONFIG_ZPOOL=3Dy
> CONFIG_ZBUD=3Dy
> CONFIG_Z3FOLD=3Dm
> CONFIG_ZSMALLOC=3Dy
> CONFIG_ZSMALLOC_STAT=3Dy
> CONFIG_GENERIC_EARLY_IOREMAP=3Dy
> # CONFIG_DEFERRED_STRUCT_PAGE_INIT is not set
> CONFIG_PAGE_IDLE_FLAG=3Dy
> CONFIG_IDLE_PAGE_TRACKING=3Dy
> CONFIG_ARCH_HAS_CACHE_LINE_SIZE=3Dy
> CONFIG_ARCH_HAS_PTE_DEVMAP=3Dy
> CONFIG_ARCH_HAS_ZONE_DMA_SET=3Dy
> # CONFIG_ZONE_DMA is not set
> CONFIG_ZONE_DMA32=3Dy
> # CONFIG_PERCPU_STATS is not set
> # CONFIG_GUP_TEST is not set
> CONFIG_READ_ONLY_THP_FOR_FS=3Dy
> CONFIG_ARCH_HAS_PTE_SPECIAL=3Dy
> # CONFIG_ANON_VMA_NAME is not set
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
> CONFIG_PACKET_DIAG=3Dm
> CONFIG_UNIX=3Dy
> CONFIG_UNIX_SCM=3Dy
> CONFIG_AF_UNIX_OOB=3Dy
> # CONFIG_UNIX_DIAG is not set
> # CONFIG_TLS is not set
> # CONFIG_XFRM_USER is not set
> # CONFIG_NET_KEY is not set
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
> CONFIG_NET_PTP_CLASSIFY=3Dy
> CONFIG_NETWORK_PHY_TIMESTAMPING=3Dy
> # CONFIG_NETFILTER is not set
> # CONFIG_BPFILTER is not set
> # CONFIG_IP_DCCP is not set
> # CONFIG_IP_SCTP is not set
> # CONFIG_RDS is not set
> # CONFIG_TIPC is not set
> CONFIG_ATM=3Dm
> # CONFIG_ATM_CLIP is not set
> # CONFIG_ATM_LANE is not set
> # CONFIG_ATM_BR2684 is not set
> # CONFIG_L2TP is not set
> CONFIG_STP=3Dy
> CONFIG_GARP=3Dy
> CONFIG_MRP=3Dy
> CONFIG_BRIDGE=3Dy
> CONFIG_BRIDGE_IGMP_SNOOPING=3Dy
> CONFIG_BRIDGE_VLAN_FILTERING=3Dy
> CONFIG_BRIDGE_MRP=3Dy
> # CONFIG_BRIDGE_CFM is not set
> # CONFIG_NET_DSA is not set
> CONFIG_VLAN_8021Q=3Dy
> CONFIG_VLAN_8021Q_GVRP=3Dy
> CONFIG_VLAN_8021Q_MVRP=3Dy
> CONFIG_DECNET=3Dy
> CONFIG_DECNET_ROUTER=3Dy
> CONFIG_LLC=3Dy
> # CONFIG_LLC2 is not set
> # CONFIG_ATALK is not set
> # CONFIG_X25 is not set
> CONFIG_LAPB=3Dm
> # CONFIG_PHONET is not set
> # CONFIG_6LOWPAN is not set
> # CONFIG_IEEE802154 is not set
> CONFIG_NET_SCHED=3Dy
> =

> #
> # Queueing/Scheduling
> #
> CONFIG_NET_SCH_CBQ=3Dm
> CONFIG_NET_SCH_HTB=3Dy
> CONFIG_NET_SCH_HFSC=3Dm
> CONFIG_NET_SCH_ATM=3Dm
> # CONFIG_NET_SCH_PRIO is not set
> CONFIG_NET_SCH_MULTIQ=3Dm
> CONFIG_NET_SCH_RED=3Dm
> # CONFIG_NET_SCH_SFB is not set
> CONFIG_NET_SCH_SFQ=3Dy
> # CONFIG_NET_SCH_TEQL is not set
> # CONFIG_NET_SCH_TBF is not set
> CONFIG_NET_SCH_CBS=3Dy
> CONFIG_NET_SCH_ETF=3Dm
> # CONFIG_NET_SCH_TAPRIO is not set
> CONFIG_NET_SCH_GRED=3Dy
> # CONFIG_NET_SCH_DSMARK is not set
> CONFIG_NET_SCH_NETEM=3Dm
> CONFIG_NET_SCH_DRR=3Dm
> CONFIG_NET_SCH_MQPRIO=3Dm
> CONFIG_NET_SCH_SKBPRIO=3Dy
> CONFIG_NET_SCH_CHOKE=3Dy
> CONFIG_NET_SCH_QFQ=3Dm
> CONFIG_NET_SCH_CODEL=3Dm
> # CONFIG_NET_SCH_FQ_CODEL is not set
> CONFIG_NET_SCH_CAKE=3Dy
> CONFIG_NET_SCH_FQ=3Dm
> CONFIG_NET_SCH_HHF=3Dm
> # CONFIG_NET_SCH_PIE is not set
> CONFIG_NET_SCH_PLUG=3Dm
> CONFIG_NET_SCH_ETS=3Dy
> # CONFIG_NET_SCH_DEFAULT is not set
> =

> #
> # Classification
> #
> CONFIG_NET_CLS=3Dy
> CONFIG_NET_CLS_BASIC=3Dy
> CONFIG_NET_CLS_TCINDEX=3Dy
> # CONFIG_NET_CLS_ROUTE4 is not set
> CONFIG_NET_CLS_FW=3Dy
> CONFIG_NET_CLS_U32=3Dy
> # CONFIG_CLS_U32_PERF is not set
> CONFIG_CLS_U32_MARK=3Dy
> CONFIG_NET_CLS_RSVP=3Dy
> CONFIG_NET_CLS_RSVP6=3Dy
> # CONFIG_NET_CLS_FLOW is not set
> # CONFIG_NET_CLS_CGROUP is not set
> # CONFIG_NET_CLS_BPF is not set
> CONFIG_NET_CLS_FLOWER=3Dy
> CONFIG_NET_CLS_MATCHALL=3Dm
> # CONFIG_NET_EMATCH is not set
> # CONFIG_NET_CLS_ACT is not set
> CONFIG_NET_SCH_FIFO=3Dy
> CONFIG_DCB=3Dy
> CONFIG_DNS_RESOLVER=3Dy
> CONFIG_BATMAN_ADV=3Dy
> CONFIG_BATMAN_ADV_BATMAN_V=3Dy
> CONFIG_BATMAN_ADV_BLA=3Dy
> CONFIG_BATMAN_ADV_DAT=3Dy
> CONFIG_BATMAN_ADV_NC=3Dy
> CONFIG_BATMAN_ADV_MCAST=3Dy
> CONFIG_BATMAN_ADV_DEBUG=3Dy
> # CONFIG_BATMAN_ADV_TRACING is not set
> # CONFIG_OPENVSWITCH is not set
> # CONFIG_VSOCKETS is not set
> # CONFIG_NETLINK_DIAG is not set
> CONFIG_MPLS=3Dy
> CONFIG_NET_MPLS_GSO=3Dy
> # CONFIG_MPLS_ROUTING is not set
> # CONFIG_NET_NSH is not set
> # CONFIG_HSR is not set
> # CONFIG_NET_SWITCHDEV is not set
> # CONFIG_NET_L3_MASTER_DEV is not set
> CONFIG_QRTR=3Dy
> CONFIG_QRTR_SMD=3Dy
> CONFIG_QRTR_TUN=3Dm
> CONFIG_QRTR_MHI=3Dm
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

> CONFIG_HAMRADIO=3Dy
> =

> #
> # Packet Radio protocols
> #
> CONFIG_AX25=3Dy
> CONFIG_AX25_DAMA_SLAVE=3Dy
> CONFIG_NETROM=3Dy
> CONFIG_ROSE=3Dy
> =

> #
> # AX.25 network device drivers
> #
> CONFIG_MKISS=3Dy
> CONFIG_6PACK=3Dy
> # CONFIG_BPQETHER is not set
> # CONFIG_BAYCOM_SER_FDX is not set
> # CONFIG_BAYCOM_SER_HDX is not set
> CONFIG_BAYCOM_PAR=3Dm
> CONFIG_YAM=3Dm
> # end of AX.25 network device drivers
> =

> CONFIG_CAN=3Dm
> # CONFIG_CAN_RAW is not set
> CONFIG_CAN_BCM=3Dm
> # CONFIG_CAN_GW is not set
> # CONFIG_CAN_J1939 is not set
> CONFIG_CAN_ISOTP=3Dm
> =

> #
> # CAN Device Drivers
> #
> # CONFIG_CAN_VCAN is not set
> CONFIG_CAN_VXCAN=3Dm
> CONFIG_CAN_SLCAN=3Dm
> CONFIG_CAN_DEV=3Dm
> CONFIG_CAN_CALC_BITTIMING=3Dy
> CONFIG_CAN_FLEXCAN=3Dm
> CONFIG_CAN_GRCAN=3Dm
> CONFIG_CAN_KVASER_PCIEFD=3Dm
> # CONFIG_CAN_C_CAN is not set
> CONFIG_CAN_CC770=3Dm
> CONFIG_CAN_CC770_ISA=3Dm
> # CONFIG_CAN_CC770_PLATFORM is not set
> # CONFIG_CAN_IFI_CANFD is not set
> CONFIG_CAN_M_CAN=3Dm
> CONFIG_CAN_M_CAN_PCI=3Dm
> CONFIG_CAN_M_CAN_PLATFORM=3Dm
> CONFIG_CAN_PEAK_PCIEFD=3Dm
> CONFIG_CAN_SJA1000=3Dm
> CONFIG_CAN_EMS_PCI=3Dm
> CONFIG_CAN_EMS_PCMCIA=3Dm
> CONFIG_CAN_F81601=3Dm
> CONFIG_CAN_KVASER_PCI=3Dm
> # CONFIG_CAN_PEAK_PCI is not set
> CONFIG_CAN_PEAK_PCMCIA=3Dm
> CONFIG_CAN_PLX_PCI=3Dm
> # CONFIG_CAN_SJA1000_ISA is not set
> CONFIG_CAN_SJA1000_PLATFORM=3Dm
> # CONFIG_CAN_SOFTING is not set
> =

> #
> # CAN USB interfaces
> #
> CONFIG_CAN_8DEV_USB=3Dm
> # CONFIG_CAN_EMS_USB is not set
> CONFIG_CAN_ESD_USB2=3Dm
> CONFIG_CAN_ETAS_ES58X=3Dm
> CONFIG_CAN_GS_USB=3Dm
> CONFIG_CAN_KVASER_USB=3Dm
> CONFIG_CAN_MCBA_USB=3Dm
> # CONFIG_CAN_PEAK_USB is not set
> # CONFIG_CAN_UCAN is not set
> # end of CAN USB interfaces
> =

> # CONFIG_CAN_DEBUG_DEVICES is not set
> # end of CAN Device Drivers
> =

> CONFIG_BT=3Dm
> CONFIG_BT_BREDR=3Dy
> # CONFIG_BT_RFCOMM is not set
> CONFIG_BT_BNEP=3Dy
> # CONFIG_BT_BNEP_MC_FILTER is not set
> CONFIG_BT_BNEP_PROTO_FILTER=3Dy
> # CONFIG_BT_HIDP is not set
> CONFIG_BT_HS=3Dy
> # CONFIG_BT_LE is not set
> CONFIG_BT_LEDS=3Dy
> CONFIG_BT_MSFTEXT=3Dy
> # CONFIG_BT_AOSPEXT is not set
> CONFIG_BT_DEBUGFS=3Dy
> # CONFIG_BT_SELFTEST is not set
> # CONFIG_BT_FEATURE_DEBUG is not set
> =

> #
> # Bluetooth device drivers
> #
> CONFIG_BT_INTEL=3Dm
> CONFIG_BT_BCM=3Dm
> CONFIG_BT_HCIBTUSB=3Dm
> # CONFIG_BT_HCIBTUSB_AUTOSUSPEND is not set
> CONFIG_BT_HCIBTUSB_BCM=3Dy
> # CONFIG_BT_HCIBTUSB_MTK is not set
> # CONFIG_BT_HCIBTUSB_RTL is not set
> CONFIG_BT_HCIUART=3Dm
> CONFIG_BT_HCIUART_H4=3Dy
> CONFIG_BT_HCIUART_BCSP=3Dy
> # CONFIG_BT_HCIUART_ATH3K is not set
> CONFIG_BT_HCIUART_INTEL=3Dy
> CONFIG_BT_HCIUART_AG6XX=3Dy
> # CONFIG_BT_HCIBCM203X is not set
> CONFIG_BT_HCIBPA10X=3Dm
> CONFIG_BT_HCIBFUSB=3Dm
> CONFIG_BT_HCIDTL1=3Dm
> CONFIG_BT_HCIBT3C=3Dm
> # CONFIG_BT_HCIBLUECARD is not set
> CONFIG_BT_HCIVHCI=3Dm
> # CONFIG_BT_MRVL is not set
> # CONFIG_BT_ATH3K is not set
> CONFIG_BT_VIRTIO=3Dm
> # end of Bluetooth device drivers
> =

> # CONFIG_AF_RXRPC is not set
> # CONFIG_AF_KCM is not set
> # CONFIG_MCTP is not set
> CONFIG_FIB_RULES=3Dy
> CONFIG_WIRELESS=3Dy
> # CONFIG_CFG80211 is not set
> =

> #
> # CFG80211 needs to be enabled for MAC80211
> #
> CONFIG_MAC80211_STA_HASH_MAX_SIZE=3D0
> CONFIG_RFKILL=3Dy
> CONFIG_RFKILL_LEDS=3Dy
> # CONFIG_RFKILL_INPUT is not set
> CONFIG_RFKILL_GPIO=3Dy
> CONFIG_NET_9P=3Dy
> CONFIG_NET_9P_FD=3Dy
> CONFIG_NET_9P_VIRTIO=3Dy
> CONFIG_NET_9P_DEBUG=3Dy
> CONFIG_CAIF=3Dy
> # CONFIG_CAIF_DEBUG is not set
> CONFIG_CAIF_NETDEV=3Dy
> # CONFIG_CAIF_USB is not set
> # CONFIG_CEPH_LIB is not set
> CONFIG_NFC=3Dm
> # CONFIG_NFC_DIGITAL is not set
> # CONFIG_NFC_NCI is not set
> CONFIG_NFC_HCI=3Dm
> # CONFIG_NFC_SHDLC is not set
> =

> #
> # Near Field Communication (NFC) devices
> #
> CONFIG_NFC_PN533=3Dm
> CONFIG_NFC_PN533_USB=3Dm
> CONFIG_NFC_PN533_I2C=3Dm
> # end of Near Field Communication (NFC) devices
> =

> CONFIG_PSAMPLE=3Dm
> # CONFIG_NET_IFE is not set
> CONFIG_LWTUNNEL=3Dy
> CONFIG_LWTUNNEL_BPF=3Dy
> CONFIG_DST_CACHE=3Dy
> CONFIG_GRO_CELLS=3Dy
> CONFIG_FAILOVER=3Dy
> CONFIG_ETHTOOL_NETLINK=3Dy
> =

> #
> # Device Drivers
> #
> CONFIG_HAVE_EISA=3Dy
> # CONFIG_EISA is not set
> CONFIG_HAVE_PCI=3Dy
> CONFIG_PCI=3Dy
> CONFIG_PCI_DOMAINS=3Dy
> # CONFIG_PCIEPORTBUS is not set
> # CONFIG_PCIEASPM is not set
> CONFIG_PCIE_PTM=3Dy
> # CONFIG_PCI_MSI is not set
> CONFIG_PCI_QUIRKS=3Dy
> # CONFIG_PCI_DEBUG is not set
> # CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
> # CONFIG_PCI_STUB is not set
> # CONFIG_PCI_PF_STUB is not set
> CONFIG_PCI_ATS=3Dy
> CONFIG_PCI_LOCKLESS_CONFIG=3Dy
> CONFIG_PCI_IOV=3Dy
> # CONFIG_PCI_PRI is not set
> # CONFIG_PCI_PASID is not set
> CONFIG_PCI_LABEL=3Dy
> # CONFIG_PCIE_BUS_TUNE_OFF is not set
> # CONFIG_PCIE_BUS_DEFAULT is not set
> # CONFIG_PCIE_BUS_SAFE is not set
> # CONFIG_PCIE_BUS_PERFORMANCE is not set
> CONFIG_PCIE_BUS_PEER2PEER=3Dy
> CONFIG_HOTPLUG_PCI=3Dy
> CONFIG_HOTPLUG_PCI_ACPI=3Dy
> CONFIG_HOTPLUG_PCI_ACPI_IBM=3Dy
> # CONFIG_HOTPLUG_PCI_CPCI is not set
> # CONFIG_HOTPLUG_PCI_SHPC is not set
> =

> #
> # PCI controller drivers
> #
> CONFIG_PCI_FTPCI100=3Dy
> # CONFIG_PCI_HOST_GENERIC is not set
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
> CONFIG_PCIE_CADENCE_HOST=3Dy
> CONFIG_PCIE_CADENCE_PLAT=3Dy
> CONFIG_PCIE_CADENCE_PLAT_HOST=3Dy
> # CONFIG_PCI_J721E_HOST is not set
> # end of Cadence PCIe controllers support
> # end of PCI controller drivers
> =

> #
> # PCI Endpoint
> #
> # CONFIG_PCI_ENDPOINT is not set
> # end of PCI Endpoint
> =

> #
> # PCI switch controller drivers
> #
> CONFIG_PCI_SW_SWITCHTEC=3Dm
> # end of PCI switch controller drivers
> =

> CONFIG_CXL_BUS=3Dm
> CONFIG_CXL_MEM=3Dm
> CONFIG_CXL_MEM_RAW_COMMANDS=3Dy
> CONFIG_CXL_ACPI=3Dm
> CONFIG_PCCARD=3Dy
> CONFIG_PCMCIA=3Dm
> CONFIG_PCMCIA_LOAD_CIS=3Dy
> CONFIG_CARDBUS=3Dy
> =

> #
> # PC-card bridges
> #
> # CONFIG_YENTA is not set
> CONFIG_PD6729=3Dm
> CONFIG_I82092=3Dm
> CONFIG_PCCARD_NONSTATIC=3Dy
> CONFIG_RAPIDIO=3Dm
> CONFIG_RAPIDIO_DISC_TIMEOUT=3D30
> # CONFIG_RAPIDIO_ENABLE_RX_TX_PORTS is not set
> # CONFIG_RAPIDIO_DEBUG is not set
> CONFIG_RAPIDIO_ENUM_BASIC=3Dm
> # CONFIG_RAPIDIO_CHMAN is not set
> CONFIG_RAPIDIO_MPORT_CDEV=3Dm
> =

> #
> # RapidIO Switch drivers
> #
> CONFIG_RAPIDIO_CPS_XX=3Dm
> CONFIG_RAPIDIO_CPS_GEN2=3Dm
> CONFIG_RAPIDIO_RXS_GEN3=3Dm
> # end of RapidIO Switch drivers
> =

> #
> # Generic Driver Options
> #
> # CONFIG_UEVENT_HELPER is not set
> CONFIG_DEVTMPFS=3Dy
> # CONFIG_DEVTMPFS_MOUNT is not set
> # CONFIG_DEVTMPFS_SAFE is not set
> CONFIG_STANDALONE=3Dy
> # CONFIG_PREVENT_FIRMWARE_BUILD is not set
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
> # end of Firmware loader
> =

> # CONFIG_ALLOW_DEV_COREDUMP is not set
> # CONFIG_DEBUG_DRIVER is not set
> CONFIG_DEBUG_DEVRES=3Dy
> # CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
> # CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
> CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
> CONFIG_GENERIC_CPU_VULNERABILITIES=3Dy
> CONFIG_REGMAP=3Dy
> CONFIG_REGMAP_I2C=3Dm
> CONFIG_REGMAP_SLIMBUS=3Dm
> CONFIG_REGMAP_W1=3Dy
> CONFIG_REGMAP_MMIO=3Dy
> CONFIG_REGMAP_IRQ=3Dy
> CONFIG_DMA_SHARED_BUFFER=3Dy
> # CONFIG_DMA_FENCE_TRACE is not set
> # end of Generic Driver Options
> =

> #
> # Bus devices
> #
> CONFIG_MHI_BUS=3Dy
> CONFIG_MHI_BUS_DEBUG=3Dy
> CONFIG_MHI_BUS_PCI_GENERIC=3Dm
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

> CONFIG_EDD=3Dm
> CONFIG_EDD_OFF=3Dy
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

> CONFIG_GNSS=3Dm
> # CONFIG_GNSS_USB is not set
> # CONFIG_MTD is not set
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
> # CONFIG_PARPORT_PC is not set
> CONFIG_PARPORT_AX88796=3Dy
> # CONFIG_PARPORT_1284 is not set
> CONFIG_PARPORT_NOT_PC=3Dy
> CONFIG_PNP=3Dy
> CONFIG_PNP_DEBUG_MESSAGES=3Dy
> =

> #
> # Protocols
> #
> CONFIG_PNPACPI=3Dy
> =

> #
> # NVME Support
> #
> # end of NVME Support
> =

> #
> # Misc devices
> #
> CONFIG_SENSORS_LIS3LV02D=3Dm
> CONFIG_AD525X_DPOT=3Dm
> CONFIG_AD525X_DPOT_I2C=3Dm
> # CONFIG_DUMMY_IRQ is not set
> # CONFIG_IBM_ASM is not set
> CONFIG_PHANTOM=3Dm
> CONFIG_TIFM_CORE=3Dy
> # CONFIG_TIFM_7XX1 is not set
> # CONFIG_ICS932S401 is not set
> CONFIG_ENCLOSURE_SERVICES=3Dy
> CONFIG_HP_ILO=3Dm
> CONFIG_APDS9802ALS=3Dm
> CONFIG_ISL29003=3Dm
> CONFIG_ISL29020=3Dm
> # CONFIG_SENSORS_TSL2550 is not set
> # CONFIG_SENSORS_BH1770 is not set
> # CONFIG_SENSORS_APDS990X is not set
> CONFIG_HMC6352=3Dm
> CONFIG_DS1682=3Dm
> # CONFIG_VMWARE_BALLOON is not set
> CONFIG_SRAM=3Dy
> CONFIG_DW_XDATA_PCIE=3Dm
> # CONFIG_PCI_ENDPOINT_TEST is not set
> # CONFIG_XILINX_SDFEC is not set
> CONFIG_MISC_RTSX=3Dy
> # CONFIG_HISI_HIKEY_USB is not set
> CONFIG_C2PORT=3Dm
> CONFIG_C2PORT_DURAMAR_2150=3Dm
> =

> #
> # EEPROM support
> #
> CONFIG_EEPROM_AT24=3Dm
> CONFIG_EEPROM_LEGACY=3Dm
> CONFIG_EEPROM_MAX6875=3Dm
> # CONFIG_EEPROM_93CX6 is not set
> CONFIG_EEPROM_IDT_89HPESX=3Dm
> CONFIG_EEPROM_EE1004=3Dm
> # end of EEPROM support
> =

> CONFIG_CB710_CORE=3Dm
> # CONFIG_CB710_DEBUG is not set
> CONFIG_CB710_DEBUG_ASSUMPTIONS=3Dy
> =

> #
> # Texas Instruments shared transport line discipline
> #
> CONFIG_TI_ST=3Dm
> # end of Texas Instruments shared transport line discipline
> =

> CONFIG_SENSORS_LIS3_I2C=3Dm
> =

> #
> # Altera FPGA firmware download module (requires I2C)
> #
> CONFIG_ALTERA_STAPL=3Dm
> # CONFIG_INTEL_MEI is not set
> # CONFIG_INTEL_MEI_ME is not set
> # CONFIG_INTEL_MEI_TXE is not set
> CONFIG_VMWARE_VMCI=3Dm
> # CONFIG_GENWQE is not set
> CONFIG_ECHO=3Dm
> CONFIG_MISC_ALCOR_PCI=3Dy
> CONFIG_MISC_RTSX_PCI=3Dm
> CONFIG_MISC_RTSX_USB=3Dy
> CONFIG_HABANA_AI=3Dm
> # CONFIG_UACCE is not set
> CONFIG_PVPANIC=3Dy
> # CONFIG_PVPANIC_MMIO is not set
> CONFIG_PVPANIC_PCI=3Dy
> # end of Misc devices
> =

> #
> # SCSI device support
> #
> CONFIG_SCSI_MOD=3Dy
> # end of SCSI device support
> =

> # CONFIG_FUSION is not set
> =

> #
> # IEEE 1394 (FireWire) support
> #
> CONFIG_FIREWIRE=3Dy
> CONFIG_FIREWIRE_OHCI=3Dm
> # CONFIG_FIREWIRE_NET is not set
> CONFIG_FIREWIRE_NOSY=3Dm
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
> # CONFIG_NET_TEAM is not set
> # CONFIG_MACVLAN is not set
> # CONFIG_IPVLAN is not set
> # CONFIG_VXLAN is not set
> # CONFIG_GENEVE is not set
> # CONFIG_BAREUDP is not set
> # CONFIG_GTP is not set
> # CONFIG_MACSEC is not set
> # CONFIG_NETCONSOLE is not set
> # CONFIG_NTB_NETDEV is not set
> # CONFIG_RIONET is not set
> # CONFIG_TUN is not set
> # CONFIG_TUN_VNET_CROSS_LE is not set
> # CONFIG_VETH is not set
> CONFIG_VIRTIO_NET=3Dm
> # CONFIG_NLMON is not set
> # CONFIG_MHI_NET is not set
> # CONFIG_ARCNET is not set
> CONFIG_ATM_DRIVERS=3Dy
> # CONFIG_ATM_DUMMY is not set
> # CONFIG_ATM_TCP is not set
> # CONFIG_ATM_LANAI is not set
> # CONFIG_ATM_ENI is not set
> # CONFIG_ATM_FIRESTREAM is not set
> # CONFIG_ATM_ZATM is not set
> # CONFIG_ATM_NICSTAR is not set
> # CONFIG_ATM_IDT77252 is not set
> # CONFIG_ATM_AMBASSADOR is not set
> # CONFIG_ATM_HORIZON is not set
> # CONFIG_ATM_IA is not set
> # CONFIG_ATM_FORE200E is not set
> # CONFIG_ATM_HE is not set
> # CONFIG_ATM_SOLOS is not set
> # CONFIG_CAIF_DRIVERS is not set
> CONFIG_ETHERNET=3Dy
> CONFIG_NET_VENDOR_3COM=3Dy
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
> # CONFIG_NET_VENDOR_AMD is not set
> CONFIG_NET_VENDOR_AQUANTIA=3Dy
> # CONFIG_AQTION is not set
> CONFIG_NET_VENDOR_ARC=3Dy
> CONFIG_NET_VENDOR_ASIX=3Dy
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
> # CONFIG_THUNDER_NIC_PF is not set
> # CONFIG_THUNDER_NIC_VF is not set
> # CONFIG_THUNDER_NIC_BGX is not set
> # CONFIG_THUNDER_NIC_RGX is not set
> # CONFIG_LIQUIDIO is not set
> CONFIG_NET_VENDOR_CHELSIO=3Dy
> # CONFIG_CHELSIO_T1 is not set
> # CONFIG_CHELSIO_T3 is not set
> # CONFIG_CHELSIO_T4 is not set
> # CONFIG_CHELSIO_T4VF is not set
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
> # CONFIG_KS8851_MLL is not set
> # CONFIG_KSZ884X_PCI is not set
> CONFIG_NET_VENDOR_MICROCHIP=3Dy
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
> # CONFIG_NE2K_PCI is not set
> # CONFIG_PCMCIA_PCNET is not set
> CONFIG_NET_VENDOR_NVIDIA=3Dy
> # CONFIG_FORCEDETH is not set
> CONFIG_NET_VENDOR_OKI=3Dy
> # CONFIG_ETHOC is not set
> CONFIG_NET_VENDOR_PACKET_ENGINES=3Dy
> # CONFIG_HAMACHI is not set
> # CONFIG_YELLOWFIN is not set
> CONFIG_NET_VENDOR_PENSANDO=3Dy
> # CONFIG_IONIC is not set
> CONFIG_NET_VENDOR_QLOGIC=3Dy
> # CONFIG_QLA3XXX is not set
> # CONFIG_QLCNIC is not set
> # CONFIG_NETXEN_NIC is not set
> # CONFIG_QED is not set
> CONFIG_NET_VENDOR_QUALCOMM=3Dy
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
> CONFIG_USB_NET_DRIVERS=3Dy
> # CONFIG_USB_CATC is not set
> # CONFIG_USB_KAWETH is not set
> # CONFIG_USB_PEGASUS is not set
> # CONFIG_USB_RTL8150 is not set
> # CONFIG_USB_RTL8152 is not set
> # CONFIG_USB_LAN78XX is not set
> # CONFIG_USB_USBNET is not set
> # CONFIG_USB_HSO is not set
> # CONFIG_USB_IPHETH is not set
> CONFIG_WLAN=3Dy
> CONFIG_WLAN_VENDOR_ADMTEK=3Dy
> CONFIG_WLAN_VENDOR_ATH=3Dy
> # CONFIG_ATH_DEBUG is not set
> # CONFIG_ATH5K_PCI is not set
> CONFIG_WLAN_VENDOR_ATMEL=3Dy
> CONFIG_WLAN_VENDOR_BROADCOM=3Dy
> CONFIG_WLAN_VENDOR_CISCO=3Dy
> CONFIG_WLAN_VENDOR_INTEL=3Dy
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
> CONFIG_INPUT_FF_MEMLESS=3Dy
> CONFIG_INPUT_SPARSEKMAP=3Dy
> CONFIG_INPUT_MATRIXKMAP=3Dm
> =

> #
> # Userland interfaces
> #
> CONFIG_INPUT_MOUSEDEV=3Dy
> CONFIG_INPUT_MOUSEDEV_PSAUX=3Dy
> CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1024
> CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D768
> # CONFIG_INPUT_JOYDEV is not set
> CONFIG_INPUT_EVDEV=3Dm
> CONFIG_INPUT_EVBUG=3Dy
> =

> #
> # Input Device Drivers
> #
> CONFIG_INPUT_KEYBOARD=3Dy
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
> # CONFIG_KEYBOARD_GOLDFISH_EVENTS is not set
> # CONFIG_KEYBOARD_STOWAWAY is not set
> # CONFIG_KEYBOARD_SUNKBD is not set
> # CONFIG_KEYBOARD_IQS62X is not set
> # CONFIG_KEYBOARD_OMAP4 is not set
> # CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
> # CONFIG_KEYBOARD_XTKBD is not set
> # CONFIG_KEYBOARD_CAP11XX is not set
> # CONFIG_KEYBOARD_BCM is not set
> # CONFIG_KEYBOARD_CYPRESS_SF is not set
> # CONFIG_INPUT_MOUSE is not set
> CONFIG_INPUT_JOYSTICK=3Dy
> CONFIG_JOYSTICK_ANALOG=3Dy
> CONFIG_JOYSTICK_A3D=3Dm
> CONFIG_JOYSTICK_ADI=3Dm
> CONFIG_JOYSTICK_COBRA=3Dy
> CONFIG_JOYSTICK_GF2K=3Dm
> CONFIG_JOYSTICK_GRIP=3Dm
> CONFIG_JOYSTICK_GRIP_MP=3Dy
> CONFIG_JOYSTICK_GUILLEMOT=3Dm
> CONFIG_JOYSTICK_INTERACT=3Dy
> CONFIG_JOYSTICK_SIDEWINDER=3Dy
> CONFIG_JOYSTICK_TMDC=3Dm
> CONFIG_JOYSTICK_IFORCE=3Dy
> CONFIG_JOYSTICK_IFORCE_USB=3Dm
> CONFIG_JOYSTICK_IFORCE_232=3Dm
> # CONFIG_JOYSTICK_WARRIOR is not set
> CONFIG_JOYSTICK_MAGELLAN=3Dy
> CONFIG_JOYSTICK_SPACEORB=3Dm
> CONFIG_JOYSTICK_SPACEBALL=3Dm
> # CONFIG_JOYSTICK_STINGER is not set
> # CONFIG_JOYSTICK_TWIDJOY is not set
> CONFIG_JOYSTICK_ZHENHUA=3Dm
> # CONFIG_JOYSTICK_DB9 is not set
> # CONFIG_JOYSTICK_GAMECON is not set
> CONFIG_JOYSTICK_TURBOGRAFX=3Dm
> CONFIG_JOYSTICK_AS5011=3Dm
> CONFIG_JOYSTICK_JOYDUMP=3Dy
> CONFIG_JOYSTICK_XPAD=3Dm
> # CONFIG_JOYSTICK_XPAD_FF is not set
> CONFIG_JOYSTICK_XPAD_LEDS=3Dy
> # CONFIG_JOYSTICK_PXRC is not set
> # CONFIG_JOYSTICK_QWIIC is not set
> CONFIG_JOYSTICK_FSIA6B=3Dm
> CONFIG_INPUT_TABLET=3Dy
> CONFIG_TABLET_USB_ACECAD=3Dy
> # CONFIG_TABLET_USB_AIPTEK is not set
> CONFIG_TABLET_USB_HANWANG=3Dm
> CONFIG_TABLET_USB_KBTAB=3Dy
> CONFIG_TABLET_USB_PEGASUS=3Dy
> # CONFIG_TABLET_SERIAL_WACOM4 is not set
> # CONFIG_INPUT_TOUCHSCREEN is not set
> CONFIG_INPUT_MISC=3Dy
> # CONFIG_INPUT_88PM80X_ONKEY is not set
> CONFIG_INPUT_AD714X=3Dm
> CONFIG_INPUT_AD714X_I2C=3Dm
> CONFIG_INPUT_ATC260X_ONKEY=3Dm
> CONFIG_INPUT_ATMEL_CAPTOUCH=3Dm
> CONFIG_INPUT_BMA150=3Dm
> # CONFIG_INPUT_E3X0_BUTTON is not set
> CONFIG_INPUT_MAX77650_ONKEY=3Dm
> CONFIG_INPUT_MC13783_PWRBUTTON=3Dm
> # CONFIG_INPUT_MMA8450 is not set
> CONFIG_INPUT_APANEL=3Dm
> # CONFIG_INPUT_GPIO_BEEPER is not set
> # CONFIG_INPUT_GPIO_DECODER is not set
> # CONFIG_INPUT_GPIO_VIBRA is not set
> CONFIG_INPUT_ATLAS_BTNS=3Dy
> CONFIG_INPUT_ATI_REMOTE2=3Dy
> CONFIG_INPUT_KEYSPAN_REMOTE=3Dy
> CONFIG_INPUT_KXTJ9=3Dm
> # CONFIG_INPUT_POWERMATE is not set
> # CONFIG_INPUT_YEALINK is not set
> CONFIG_INPUT_CM109=3Dy
> # CONFIG_INPUT_REGULATOR_HAPTIC is not set
> # CONFIG_INPUT_RETU_PWRBUTTON is not set
> CONFIG_INPUT_TPS65218_PWRBUTTON=3Dm
> CONFIG_INPUT_UINPUT=3Dy
> # CONFIG_INPUT_PCF50633_PMU is not set
> # CONFIG_INPUT_PCF8574 is not set
> CONFIG_INPUT_RK805_PWRKEY=3Dm
> CONFIG_INPUT_GPIO_ROTARY_ENCODER=3Dm
> CONFIG_INPUT_DA7280_HAPTICS=3Dm
> CONFIG_INPUT_DA9063_ONKEY=3Dm
> CONFIG_INPUT_ADXL34X=3Dm
> CONFIG_INPUT_ADXL34X_I2C=3Dm
> # CONFIG_INPUT_IMS_PCU is not set
> CONFIG_INPUT_IQS269A=3Dm
> # CONFIG_INPUT_IQS626A is not set
> # CONFIG_INPUT_CMA3000 is not set
> # CONFIG_INPUT_IDEAPAD_SLIDEBAR is not set
> # CONFIG_INPUT_DRV260X_HAPTICS is not set
> # CONFIG_INPUT_DRV2665_HAPTICS is not set
> CONFIG_INPUT_DRV2667_HAPTICS=3Dm
> CONFIG_RMI4_CORE=3Dm
> CONFIG_RMI4_I2C=3Dm
> CONFIG_RMI4_SMB=3Dm
> CONFIG_RMI4_F03=3Dy
> CONFIG_RMI4_F03_SERIO=3Dm
> CONFIG_RMI4_2D_SENSOR=3Dy
> CONFIG_RMI4_F11=3Dy
> CONFIG_RMI4_F12=3Dy
> CONFIG_RMI4_F30=3Dy
> # CONFIG_RMI4_F34 is not set
> # CONFIG_RMI4_F3A is not set
> # CONFIG_RMI4_F55 is not set
> =

> #
> # Hardware I/O ports
> #
> CONFIG_SERIO=3Dy
> CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=3Dy
> CONFIG_SERIO_I8042=3Dy
> CONFIG_SERIO_SERPORT=3Dm
> CONFIG_SERIO_CT82C710=3Dy
> CONFIG_SERIO_PARKBD=3Dm
> CONFIG_SERIO_PCIPS2=3Dm
> CONFIG_SERIO_LIBPS2=3Dy
> CONFIG_SERIO_RAW=3Dm
> # CONFIG_SERIO_ALTERA_PS2 is not set
> # CONFIG_SERIO_PS2MULT is not set
> # CONFIG_SERIO_ARC_PS2 is not set
> CONFIG_SERIO_APBPS2=3Dm
> CONFIG_SERIO_GPIO_PS2=3Dy
> CONFIG_USERIO=3Dm
> CONFIG_GAMEPORT=3Dy
> # CONFIG_GAMEPORT_NS558 is not set
> # CONFIG_GAMEPORT_L4 is not set
> CONFIG_GAMEPORT_EMU10K1=3Dm
> CONFIG_GAMEPORT_FM801=3Dm
> # end of Hardware I/O ports
> # end of Input device support
> =

> #
> # Character devices
> #
> CONFIG_TTY=3Dy
> # CONFIG_VT is not set
> CONFIG_UNIX98_PTYS=3Dy
> # CONFIG_LEGACY_PTYS is not set
> CONFIG_LDISC_AUTOLOAD=3Dy
> =

> #
> # Serial drivers
> #
> CONFIG_SERIAL_EARLYCON=3Dy
> CONFIG_SERIAL_8250=3Dy
> # CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
> # CONFIG_SERIAL_8250_PNP is not set
> # CONFIG_SERIAL_8250_16550A_VARIANTS is not set
> # CONFIG_SERIAL_8250_FINTEK is not set
> CONFIG_SERIAL_8250_CONSOLE=3Dy
> CONFIG_SERIAL_8250_PCI=3Dy
> CONFIG_SERIAL_8250_EXAR=3Dy
> CONFIG_SERIAL_8250_CS=3Dm
> CONFIG_SERIAL_8250_NR_UARTS=3D4
> CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> CONFIG_SERIAL_8250_EXTENDED=3Dy
> # CONFIG_SERIAL_8250_MANY_PORTS is not set
> # CONFIG_SERIAL_8250_ASPEED_VUART is not set
> CONFIG_SERIAL_8250_SHARE_IRQ=3Dy
> # CONFIG_SERIAL_8250_DETECT_IRQ is not set
> CONFIG_SERIAL_8250_RSA=3Dy
> CONFIG_SERIAL_8250_DWLIB=3Dy
> # CONFIG_SERIAL_8250_DW is not set
> # CONFIG_SERIAL_8250_RT288X is not set
> CONFIG_SERIAL_8250_LPSS=3Dm
> # CONFIG_SERIAL_8250_MID is not set
> CONFIG_SERIAL_8250_PERICOM=3Dy
> # CONFIG_SERIAL_OF_PLATFORM is not set
> =

> #
> # Non-8250 serial port support
> #
> CONFIG_SERIAL_UARTLITE=3Dy
> CONFIG_SERIAL_UARTLITE_CONSOLE=3Dy
> CONFIG_SERIAL_UARTLITE_NR_UARTS=3D1
> CONFIG_SERIAL_CORE=3Dy
> CONFIG_SERIAL_CORE_CONSOLE=3Dy
> # CONFIG_SERIAL_JSM is not set
> CONFIG_SERIAL_SIFIVE=3Dy
> # CONFIG_SERIAL_SIFIVE_CONSOLE is not set
> CONFIG_SERIAL_LANTIQ=3Dm
> CONFIG_SERIAL_SCCNXP=3Dy
> # CONFIG_SERIAL_SCCNXP_CONSOLE is not set
> CONFIG_SERIAL_SC16IS7XX_CORE=3Dm
> CONFIG_SERIAL_SC16IS7XX=3Dm
> CONFIG_SERIAL_SC16IS7XX_I2C=3Dy
> # CONFIG_SERIAL_BCM63XX is not set
> CONFIG_SERIAL_ALTERA_JTAGUART=3Dm
> CONFIG_SERIAL_ALTERA_UART=3Dy
> CONFIG_SERIAL_ALTERA_UART_MAXPORTS=3D4
> CONFIG_SERIAL_ALTERA_UART_BAUDRATE=3D115200
> CONFIG_SERIAL_ALTERA_UART_CONSOLE=3Dy
> CONFIG_SERIAL_XILINX_PS_UART=3Dm
> CONFIG_SERIAL_ARC=3Dy
> CONFIG_SERIAL_ARC_CONSOLE=3Dy
> CONFIG_SERIAL_ARC_NR_PORTS=3D1
> CONFIG_SERIAL_RP2=3Dy
> CONFIG_SERIAL_RP2_NR_UARTS=3D32
> CONFIG_SERIAL_FSL_LPUART=3Dy
> CONFIG_SERIAL_FSL_LPUART_CONSOLE=3Dy
> # CONFIG_SERIAL_FSL_LINFLEXUART is not set
> CONFIG_SERIAL_CONEXANT_DIGICOLOR=3Dm
> # CONFIG_SERIAL_SPRD is not set
> # end of Serial drivers
> =

> CONFIG_SERIAL_MCTRL_GPIO=3Dy
> CONFIG_SERIAL_NONSTANDARD=3Dy
> CONFIG_MOXA_INTELLIO=3Dm
> CONFIG_MOXA_SMARTIO=3Dy
> CONFIG_SYNCLINK_GT=3Dy
> CONFIG_N_HDLC=3Dy
> # CONFIG_GOLDFISH_TTY is not set
> # CONFIG_N_GSM is not set
> CONFIG_NOZOMI=3Dm
> CONFIG_NULL_TTY=3Dy
> # CONFIG_RPMSG_TTY is not set
> # CONFIG_SERIAL_DEV_BUS is not set
> CONFIG_TTY_PRINTK=3Dy
> CONFIG_TTY_PRINTK_LEVEL=3D6
> CONFIG_PRINTER=3Dy
> # CONFIG_LP_CONSOLE is not set
> CONFIG_PPDEV=3Dy
> # CONFIG_VIRTIO_CONSOLE is not set
> CONFIG_IPMI_HANDLER=3Dm
> CONFIG_IPMI_PLAT_DATA=3Dy
> # CONFIG_IPMI_PANIC_EVENT is not set
> # CONFIG_IPMI_DEVICE_INTERFACE is not set
> CONFIG_IPMI_SI=3Dm
> CONFIG_IPMI_SSIF=3Dm
> # CONFIG_IPMI_IPMB is not set
> CONFIG_IPMI_WATCHDOG=3Dm
> CONFIG_IPMI_POWEROFF=3Dm
> # CONFIG_IPMB_DEVICE_INTERFACE is not set
> CONFIG_HW_RANDOM=3Dy
> # CONFIG_HW_RANDOM_TIMERIOMEM is not set
> # CONFIG_HW_RANDOM_INTEL is not set
> # CONFIG_HW_RANDOM_AMD is not set
> CONFIG_HW_RANDOM_BA431=3Dy
> # CONFIG_HW_RANDOM_VIA is not set
> CONFIG_HW_RANDOM_VIRTIO=3Dm
> CONFIG_HW_RANDOM_CCTRNG=3Dm
> CONFIG_HW_RANDOM_XIPHERA=3Dm
> CONFIG_APPLICOM=3Dy
> =

> #
> # PCMCIA character devices
> #
> CONFIG_SYNCLINK_CS=3Dm
> CONFIG_CARDMAN_4000=3Dm
> CONFIG_CARDMAN_4040=3Dm
> CONFIG_SCR24X=3Dm
> # CONFIG_IPWIRELESS is not set
> # end of PCMCIA character devices
> =

> CONFIG_MWAVE=3Dy
> CONFIG_DEVMEM=3Dy
> CONFIG_NVRAM=3Dm
> CONFIG_DEVPORT=3Dy
> CONFIG_HPET=3Dy
> # CONFIG_HPET_MMAP is not set
> CONFIG_HANGCHECK_TIMER=3Dy
> CONFIG_TCG_TPM=3Dy
> # CONFIG_HW_RANDOM_TPM is not set
> CONFIG_TCG_TIS_CORE=3Dm
> CONFIG_TCG_TIS=3Dm
> CONFIG_TCG_TIS_I2C_CR50=3Dm
> CONFIG_TCG_TIS_I2C_ATMEL=3Dm
> # CONFIG_TCG_TIS_I2C_INFINEON is not set
> CONFIG_TCG_TIS_I2C_NUVOTON=3Dm
> CONFIG_TCG_NSC=3Dm
> CONFIG_TCG_ATMEL=3Dm
> # CONFIG_TCG_INFINEON is not set
> # CONFIG_TCG_CRB is not set
> # CONFIG_TCG_VTPM_PROXY is not set
> # CONFIG_TCG_TIS_ST33ZP24_I2C is not set
> CONFIG_TELCLOCK=3Dm
> CONFIG_XILLYBUS_CLASS=3Dy
> CONFIG_XILLYBUS=3Dm
> CONFIG_XILLYBUS_OF=3Dm
> CONFIG_XILLYUSB=3Dy
> CONFIG_RANDOM_TRUST_CPU=3Dy
> # CONFIG_RANDOM_TRUST_BOOTLOADER is not set
> # end of Character devices
> =

> #
> # I2C support
> #
> CONFIG_I2C=3Dm
> CONFIG_I2C_BOARDINFO=3Dy
> CONFIG_I2C_COMPAT=3Dy
> CONFIG_I2C_CHARDEV=3Dm
> # CONFIG_I2C_MUX is not set
> CONFIG_I2C_HELPER_AUTO=3Dy
> CONFIG_I2C_SMBUS=3Dm
> CONFIG_I2C_ALGOBIT=3Dm
> CONFIG_I2C_ALGOPCA=3Dm
> =

> #
> # I2C Hardware Bus support
> #
> =

> #
> # PC SMBus host controller drivers
> #
> CONFIG_I2C_ALI1535=3Dm
> CONFIG_I2C_ALI1563=3Dm
> CONFIG_I2C_ALI15X3=3Dm
> # CONFIG_I2C_AMD756 is not set
> # CONFIG_I2C_AMD8111 is not set
> CONFIG_I2C_AMD_MP2=3Dm
> # CONFIG_I2C_I801 is not set
> CONFIG_I2C_ISCH=3Dm
> # CONFIG_I2C_ISMT is not set
> # CONFIG_I2C_PIIX4 is not set
> CONFIG_I2C_NFORCE2=3Dm
> # CONFIG_I2C_NFORCE2_S4985 is not set
> # CONFIG_I2C_NVIDIA_GPU is not set
> CONFIG_I2C_SIS5595=3Dm
> CONFIG_I2C_SIS630=3Dm
> CONFIG_I2C_SIS96X=3Dm
> # CONFIG_I2C_VIA is not set
> # CONFIG_I2C_VIAPRO is not set
> =

> #
> # ACPI drivers
> #
> # CONFIG_I2C_SCMI is not set
> =

> #
> # I2C system bus drivers (mostly embedded / system-on-chip)
> #
> CONFIG_I2C_CBUS_GPIO=3Dm
> CONFIG_I2C_DESIGNWARE_CORE=3Dm
> CONFIG_I2C_DESIGNWARE_SLAVE=3Dy
> CONFIG_I2C_DESIGNWARE_PLATFORM=3Dm
> # CONFIG_I2C_DESIGNWARE_BAYTRAIL is not set
> # CONFIG_I2C_DESIGNWARE_PCI is not set
> # CONFIG_I2C_EMEV2 is not set
> # CONFIG_I2C_GPIO is not set
> CONFIG_I2C_KEMPLD=3Dm
> CONFIG_I2C_OCORES=3Dm
> CONFIG_I2C_PCA_PLATFORM=3Dm
> # CONFIG_I2C_RK3X is not set
> # CONFIG_I2C_SIMTEC is not set
> CONFIG_I2C_XILINX=3Dm
> =

> #
> # External I2C/SMBus adapter drivers
> #
> CONFIG_I2C_DIOLAN_U2C=3Dm
> # CONFIG_I2C_DLN2 is not set
> CONFIG_I2C_CP2615=3Dm
> CONFIG_I2C_PARPORT=3Dm
> CONFIG_I2C_ROBOTFUZZ_OSIF=3Dm
> CONFIG_I2C_TAOS_EVM=3Dm
> CONFIG_I2C_TINY_USB=3Dm
> CONFIG_I2C_VIPERBOARD=3Dm
> =

> #
> # Other I2C/SMBus bus drivers
> #
> CONFIG_I2C_MLXCPLD=3Dm
> CONFIG_I2C_FSI=3Dm
> # CONFIG_I2C_VIRTIO is not set
> # end of I2C Hardware Bus support
> =

> # CONFIG_I2C_STUB is not set
> CONFIG_I2C_SLAVE=3Dy
> CONFIG_I2C_SLAVE_EEPROM=3Dm
> CONFIG_I2C_SLAVE_TESTUNIT=3Dm
> # CONFIG_I2C_DEBUG_CORE is not set
> # CONFIG_I2C_DEBUG_ALGO is not set
> # CONFIG_I2C_DEBUG_BUS is not set
> # end of I2C support
> =

> # CONFIG_I3C is not set
> # CONFIG_SPI is not set
> # CONFIG_SPMI is not set
> # CONFIG_HSI is not set
> CONFIG_PPS=3Dm
> # CONFIG_PPS_DEBUG is not set
> =

> #
> # PPS clients support
> #
> CONFIG_PPS_CLIENT_KTIMER=3Dm
> CONFIG_PPS_CLIENT_LDISC=3Dm
> CONFIG_PPS_CLIENT_PARPORT=3Dm
> CONFIG_PPS_CLIENT_GPIO=3Dm
> =

> #
> # PPS generators support
> #
> =

> #
> # PTP clock support
> #
> # CONFIG_PTP_1588_CLOCK is not set
> CONFIG_PTP_1588_CLOCK_OPTIONAL=3Dy
> =

> #
> # Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
> #
> # end of PTP clock support
> =

> CONFIG_PINCTRL=3Dy
> CONFIG_GENERIC_PINCTRL_GROUPS=3Dy
> CONFIG_PINMUX=3Dy
> CONFIG_GENERIC_PINMUX_FUNCTIONS=3Dy
> CONFIG_PINCONF=3Dy
> CONFIG_GENERIC_PINCONF=3Dy
> CONFIG_DEBUG_PINCTRL=3Dy
> # CONFIG_PINCTRL_AMD is not set
> CONFIG_PINCTRL_DA9062=3Dm
> CONFIG_PINCTRL_EQUILIBRIUM=3Dm
> CONFIG_PINCTRL_MCP23S08_I2C=3Dm
> CONFIG_PINCTRL_MCP23S08=3Dm
> # CONFIG_PINCTRL_MICROCHIP_SGPIO is not set
> CONFIG_PINCTRL_OCELOT=3Dy
> CONFIG_PINCTRL_RK805=3Dm
> # CONFIG_PINCTRL_SINGLE is not set
> # CONFIG_PINCTRL_STMFX is not set
> =

> #
> # Intel pinctrl drivers
> #
> # CONFIG_PINCTRL_BAYTRAIL is not set
> CONFIG_PINCTRL_CHERRYVIEW=3Dy
> # CONFIG_PINCTRL_LYNXPOINT is not set
> CONFIG_PINCTRL_INTEL=3Dy
> # CONFIG_PINCTRL_ALDERLAKE is not set
> CONFIG_PINCTRL_BROXTON=3Dm
> # CONFIG_PINCTRL_CANNONLAKE is not set
> CONFIG_PINCTRL_CEDARFORK=3Dm
> # CONFIG_PINCTRL_DENVERTON is not set
> # CONFIG_PINCTRL_ELKHARTLAKE is not set
> CONFIG_PINCTRL_EMMITSBURG=3Dy
> CONFIG_PINCTRL_GEMINILAKE=3Dy
> CONFIG_PINCTRL_ICELAKE=3Dm
> CONFIG_PINCTRL_JASPERLAKE=3Dy
> CONFIG_PINCTRL_LAKEFIELD=3Dm
> CONFIG_PINCTRL_LEWISBURG=3Dy
> CONFIG_PINCTRL_SUNRISEPOINT=3Dm
> CONFIG_PINCTRL_TIGERLAKE=3Dy
> # end of Intel pinctrl drivers
> =

> #
> # Renesas pinctrl drivers
> #
> # end of Renesas pinctrl drivers
> =

> CONFIG_GPIOLIB=3Dy
> CONFIG_GPIOLIB_FASTPATH_LIMIT=3D512
> CONFIG_OF_GPIO=3Dy
> CONFIG_GPIO_ACPI=3Dy
> CONFIG_GPIOLIB_IRQCHIP=3Dy
> # CONFIG_DEBUG_GPIO is not set
> CONFIG_GPIO_SYSFS=3Dy
> CONFIG_GPIO_CDEV=3Dy
> CONFIG_GPIO_CDEV_V1=3Dy
> CONFIG_GPIO_GENERIC=3Dy
> =

> #
> # Memory mapped GPIO drivers
> #
> CONFIG_GPIO_74XX_MMIO=3Dm
> # CONFIG_GPIO_ALTERA is not set
> # CONFIG_GPIO_AMDPT is not set
> CONFIG_GPIO_CADENCE=3Dm
> CONFIG_GPIO_DWAPB=3Dy
> # CONFIG_GPIO_EXAR is not set
> # CONFIG_GPIO_FTGPIO010 is not set
> CONFIG_GPIO_GENERIC_PLATFORM=3Dy
> CONFIG_GPIO_GRGPIO=3Dy
> # CONFIG_GPIO_HLWD is not set
> CONFIG_GPIO_ICH=3Dy
> CONFIG_GPIO_LOGICVC=3Dm
> CONFIG_GPIO_MB86S7X=3Dy
> CONFIG_GPIO_SAMA5D2_PIOBU=3Dy
> # CONFIG_GPIO_SIFIVE is not set
> CONFIG_GPIO_SYSCON=3Dy
> CONFIG_GPIO_VX855=3Dm
> CONFIG_GPIO_WCD934X=3Dm
> CONFIG_GPIO_XILINX=3Dy
> CONFIG_GPIO_AMD_FCH=3Dy
> # end of Memory mapped GPIO drivers
> =

> #
> # Port-mapped I/O GPIO drivers
> #
> CONFIG_GPIO_104_DIO_48E=3Dy
> CONFIG_GPIO_104_IDIO_16=3Dm
> # CONFIG_GPIO_104_IDI_48 is not set
> CONFIG_GPIO_F7188X=3Dy
> CONFIG_GPIO_GPIO_MM=3Dm
> # CONFIG_GPIO_IT87 is not set
> # CONFIG_GPIO_SCH is not set
> CONFIG_GPIO_SCH311X=3Dy
> CONFIG_GPIO_WINBOND=3Dy
> CONFIG_GPIO_WS16C48=3Dm
> # end of Port-mapped I/O GPIO drivers
> =

> #
> # I2C GPIO expanders
> #
> # CONFIG_GPIO_ADP5588 is not set
> # CONFIG_GPIO_ADNP is not set
> CONFIG_GPIO_GW_PLD=3Dm
> # CONFIG_GPIO_MAX7300 is not set
> CONFIG_GPIO_MAX732X=3Dm
> # CONFIG_GPIO_PCA953X is not set
> # CONFIG_GPIO_PCA9570 is not set
> CONFIG_GPIO_PCF857X=3Dm
> # CONFIG_GPIO_TPIC2810 is not set
> # end of I2C GPIO expanders
> =

> #
> # MFD GPIO expanders
> #
> CONFIG_GPIO_ARIZONA=3Dm
> CONFIG_GPIO_BD9571MWV=3Dm
> CONFIG_GPIO_DLN2=3Dm
> CONFIG_GPIO_KEMPLD=3Dm
> # CONFIG_GPIO_MAX77650 is not set
> # CONFIG_GPIO_TPS65086 is not set
> CONFIG_GPIO_TPS65218=3Dm
> CONFIG_GPIO_TPS65912=3Dm
> # CONFIG_GPIO_TQMX86 is not set
> CONFIG_GPIO_WM8994=3Dm
> # end of MFD GPIO expanders
> =

> #
> # PCI GPIO expanders
> #
> CONFIG_GPIO_AMD8111=3Dy
> CONFIG_GPIO_BT8XX=3Dy
> CONFIG_GPIO_ML_IOH=3Dm
> CONFIG_GPIO_PCI_IDIO_16=3Dy
> CONFIG_GPIO_PCIE_IDIO_24=3Dm
> CONFIG_GPIO_RDC321X=3Dy
> CONFIG_GPIO_SODAVILLE=3Dy
> # end of PCI GPIO expanders
> =

> #
> # USB GPIO expanders
> #
> CONFIG_GPIO_VIPERBOARD=3Dm
> # end of USB GPIO expanders
> =

> #
> # Virtual GPIO drivers
> #
> CONFIG_GPIO_AGGREGATOR=3Dm
> CONFIG_GPIO_MOCKUP=3Dy
> # CONFIG_GPIO_VIRTIO is not set
> # CONFIG_GPIO_SIM is not set
> # end of Virtual GPIO drivers
> =

> CONFIG_W1=3Dy
> =

> #
> # 1-wire Bus Masters
> #
> # CONFIG_W1_MASTER_MATROX is not set
> CONFIG_W1_MASTER_DS2490=3Dy
> # CONFIG_W1_MASTER_DS2482 is not set
> CONFIG_W1_MASTER_DS1WM=3Dy
> CONFIG_W1_MASTER_GPIO=3Dy
> CONFIG_W1_MASTER_SGI=3Dy
> # end of 1-wire Bus Masters
> =

> #
> # 1-wire Slaves
> #
> CONFIG_W1_SLAVE_THERM=3Dm
> CONFIG_W1_SLAVE_SMEM=3Dy
> # CONFIG_W1_SLAVE_DS2405 is not set
> CONFIG_W1_SLAVE_DS2408=3Dy
> # CONFIG_W1_SLAVE_DS2408_READBACK is not set
> # CONFIG_W1_SLAVE_DS2413 is not set
> CONFIG_W1_SLAVE_DS2406=3Dm
> CONFIG_W1_SLAVE_DS2423=3Dm
> # CONFIG_W1_SLAVE_DS2805 is not set
> CONFIG_W1_SLAVE_DS2430=3Dy
> CONFIG_W1_SLAVE_DS2431=3Dy
> CONFIG_W1_SLAVE_DS2433=3Dy
> # CONFIG_W1_SLAVE_DS2433_CRC is not set
> CONFIG_W1_SLAVE_DS2438=3Dy
> CONFIG_W1_SLAVE_DS250X=3Dy
> CONFIG_W1_SLAVE_DS2780=3Dy
> CONFIG_W1_SLAVE_DS2781=3Dy
> # CONFIG_W1_SLAVE_DS28E04 is not set
> # CONFIG_W1_SLAVE_DS28E17 is not set
> # end of 1-wire Slaves
> =

> CONFIG_POWER_RESET=3Dy
> CONFIG_POWER_RESET_ATC260X=3Dm
> CONFIG_POWER_RESET_GPIO=3Dy
> # CONFIG_POWER_RESET_GPIO_RESTART is not set
> # CONFIG_POWER_RESET_LTC2952 is not set
> # CONFIG_POWER_RESET_REGULATOR is not set
> # CONFIG_POWER_RESET_RESTART is not set
> # CONFIG_POWER_RESET_TPS65086 is not set
> CONFIG_POWER_RESET_SYSCON=3Dy
> CONFIG_POWER_RESET_SYSCON_POWEROFF=3Dy
> CONFIG_REBOOT_MODE=3Dy
> CONFIG_SYSCON_REBOOT_MODE=3Dy
> CONFIG_NVMEM_REBOOT_MODE=3Dy
> CONFIG_POWER_SUPPLY=3Dy
> # CONFIG_POWER_SUPPLY_DEBUG is not set
> CONFIG_POWER_SUPPLY_HWMON=3Dy
> # CONFIG_PDA_POWER is not set
> # CONFIG_TEST_POWER is not set
> CONFIG_CHARGER_ADP5061=3Dm
> # CONFIG_BATTERY_ACT8945A is not set
> CONFIG_BATTERY_CW2015=3Dm
> CONFIG_BATTERY_DS2760=3Dm
> CONFIG_BATTERY_DS2780=3Dy
> CONFIG_BATTERY_DS2781=3Dy
> # CONFIG_BATTERY_DS2782 is not set
> CONFIG_BATTERY_SBS=3Dm
> CONFIG_CHARGER_SBS=3Dm
> CONFIG_BATTERY_BQ27XXX=3Dm
> CONFIG_BATTERY_BQ27XXX_I2C=3Dm
> CONFIG_BATTERY_BQ27XXX_HDQ=3Dm
> # CONFIG_BATTERY_BQ27XXX_DT_UPDATES_NVM is not set
> CONFIG_BATTERY_MAX17040=3Dm
> # CONFIG_BATTERY_MAX17042 is not set
> CONFIG_BATTERY_MAX1721X=3Dy
> CONFIG_CHARGER_PCF50633=3Dm
> CONFIG_CHARGER_ISP1704=3Dm
> CONFIG_CHARGER_MAX8903=3Dm
> CONFIG_CHARGER_LP8727=3Dm
> CONFIG_CHARGER_GPIO=3Dm
> # CONFIG_CHARGER_MANAGER is not set
> # CONFIG_CHARGER_LT3651 is not set
> # CONFIG_CHARGER_LTC4162L is not set
> CONFIG_CHARGER_MAX14577=3Dm
> CONFIG_CHARGER_DETECTOR_MAX14656=3Dm
> # CONFIG_CHARGER_MAX77650 is not set
> # CONFIG_CHARGER_MAX77693 is not set
> # CONFIG_CHARGER_MAX77976 is not set
> # CONFIG_CHARGER_MT6360 is not set
> CONFIG_CHARGER_BQ2415X=3Dm
> # CONFIG_CHARGER_BQ24190 is not set
> # CONFIG_CHARGER_BQ24257 is not set
> # CONFIG_CHARGER_BQ24735 is not set
> CONFIG_CHARGER_BQ2515X=3Dm
> CONFIG_CHARGER_BQ25890=3Dm
> CONFIG_CHARGER_BQ25980=3Dm
> CONFIG_CHARGER_BQ256XX=3Dm
> CONFIG_CHARGER_SMB347=3Dm
> # CONFIG_CHARGER_TPS65217 is not set
> # CONFIG_BATTERY_GAUGE_LTC2941 is not set
> CONFIG_BATTERY_GOLDFISH=3Dy
> CONFIG_BATTERY_RT5033=3Dm
> CONFIG_CHARGER_RT9455=3Dm
> # CONFIG_CHARGER_UCS1002 is not set
> # CONFIG_CHARGER_BD99954 is not set
> CONFIG_HWMON=3Dy
> CONFIG_HWMON_VID=3Dy
> # CONFIG_HWMON_DEBUG_CHIP is not set
> =

> #
> # Native drivers
> #
> # CONFIG_SENSORS_AD7414 is not set
> CONFIG_SENSORS_AD7418=3Dm
> CONFIG_SENSORS_ADM1021=3Dm
> CONFIG_SENSORS_ADM1025=3Dm
> # CONFIG_SENSORS_ADM1026 is not set
> CONFIG_SENSORS_ADM1029=3Dm
> CONFIG_SENSORS_ADM1031=3Dm
> # CONFIG_SENSORS_ADM1177 is not set
> CONFIG_SENSORS_ADM9240=3Dm
> CONFIG_SENSORS_ADT7X10=3Dm
> CONFIG_SENSORS_ADT7410=3Dm
> # CONFIG_SENSORS_ADT7411 is not set
> CONFIG_SENSORS_ADT7462=3Dm
> CONFIG_SENSORS_ADT7470=3Dm
> CONFIG_SENSORS_ADT7475=3Dm
> # CONFIG_SENSORS_AHT10 is not set
> CONFIG_SENSORS_AS370=3Dy
> # CONFIG_SENSORS_ASC7621 is not set
> CONFIG_SENSORS_AXI_FAN_CONTROL=3Dy
> CONFIG_SENSORS_K8TEMP=3Dm
> # CONFIG_SENSORS_APPLESMC is not set
> CONFIG_SENSORS_ASB100=3Dm
> # CONFIG_SENSORS_ASPEED is not set
> CONFIG_SENSORS_ATXP1=3Dm
> CONFIG_SENSORS_CORSAIR_CPRO=3Dy
> CONFIG_SENSORS_CORSAIR_PSU=3Dm
> # CONFIG_SENSORS_DS620 is not set
> # CONFIG_SENSORS_DS1621 is not set
> CONFIG_SENSORS_DELL_SMM=3Dy
> # CONFIG_SENSORS_I5K_AMB is not set
> CONFIG_SENSORS_F71805F=3Dy
> CONFIG_SENSORS_F71882FG=3Dy
> CONFIG_SENSORS_F75375S=3Dm
> # CONFIG_SENSORS_GSC is not set
> CONFIG_SENSORS_MC13783_ADC=3Dm
> CONFIG_SENSORS_FSCHMD=3Dm
> CONFIG_SENSORS_GL518SM=3Dm
> # CONFIG_SENSORS_GL520SM is not set
> # CONFIG_SENSORS_G760A is not set
> CONFIG_SENSORS_G762=3Dm
> # CONFIG_SENSORS_GPIO_FAN is not set
> CONFIG_SENSORS_HIH6130=3Dm
> CONFIG_SENSORS_IBMAEM=3Dm
> CONFIG_SENSORS_IBMPEX=3Dm
> CONFIG_SENSORS_I5500=3Dy
> CONFIG_SENSORS_CORETEMP=3Dy
> CONFIG_SENSORS_IT87=3Dm
> # CONFIG_SENSORS_JC42 is not set
> CONFIG_SENSORS_POWR1220=3Dm
> # CONFIG_SENSORS_LINEAGE is not set
> # CONFIG_SENSORS_LTC2945 is not set
> CONFIG_SENSORS_LTC2947=3Dm
> CONFIG_SENSORS_LTC2947_I2C=3Dm
> CONFIG_SENSORS_LTC2990=3Dm
> # CONFIG_SENSORS_LTC2992 is not set
> CONFIG_SENSORS_LTC4151=3Dm
> CONFIG_SENSORS_LTC4215=3Dm
> CONFIG_SENSORS_LTC4222=3Dm
> CONFIG_SENSORS_LTC4245=3Dm
> CONFIG_SENSORS_LTC4260=3Dm
> CONFIG_SENSORS_LTC4261=3Dm
> CONFIG_SENSORS_MAX127=3Dm
> # CONFIG_SENSORS_MAX16065 is not set
> # CONFIG_SENSORS_MAX1619 is not set
> CONFIG_SENSORS_MAX1668=3Dm
> # CONFIG_SENSORS_MAX197 is not set
> # CONFIG_SENSORS_MAX31730 is not set
> # CONFIG_SENSORS_MAX6620 is not set
> # CONFIG_SENSORS_MAX6621 is not set
> CONFIG_SENSORS_MAX6639=3Dm
> CONFIG_SENSORS_MAX6642=3Dm
> CONFIG_SENSORS_MAX6650=3Dm
> CONFIG_SENSORS_MAX6697=3Dm
> # CONFIG_SENSORS_MAX31790 is not set
> # CONFIG_SENSORS_MCP3021 is not set
> # CONFIG_SENSORS_TC654 is not set
> # CONFIG_SENSORS_TPS23861 is not set
> # CONFIG_SENSORS_MR75203 is not set
> CONFIG_SENSORS_LM63=3Dm
> CONFIG_SENSORS_LM73=3Dm
> CONFIG_SENSORS_LM75=3Dm
> CONFIG_SENSORS_LM77=3Dm
> CONFIG_SENSORS_LM78=3Dm
> CONFIG_SENSORS_LM80=3Dm
> # CONFIG_SENSORS_LM83 is not set
> CONFIG_SENSORS_LM85=3Dm
> CONFIG_SENSORS_LM87=3Dm
> # CONFIG_SENSORS_LM90 is not set
> CONFIG_SENSORS_LM92=3Dm
> CONFIG_SENSORS_LM93=3Dm
> # CONFIG_SENSORS_LM95234 is not set
> CONFIG_SENSORS_LM95241=3Dm
> # CONFIG_SENSORS_LM95245 is not set
> CONFIG_SENSORS_PC87360=3Dm
> # CONFIG_SENSORS_PC87427 is not set
> # CONFIG_SENSORS_NCT6683 is not set
> # CONFIG_SENSORS_NCT6775 is not set
> CONFIG_SENSORS_NCT7802=3Dm
> CONFIG_SENSORS_NPCM7XX=3Dm
> # CONFIG_SENSORS_PCF8591 is not set
> # CONFIG_PMBUS is not set
> CONFIG_SENSORS_SBTSI=3Dm
> CONFIG_SENSORS_SBRMI=3Dm
> CONFIG_SENSORS_SHT15=3Dy
> # CONFIG_SENSORS_SHT21 is not set
> # CONFIG_SENSORS_SHT3x is not set
> CONFIG_SENSORS_SHT4x=3Dm
> CONFIG_SENSORS_SHTC1=3Dm
> # CONFIG_SENSORS_SIS5595 is not set
> # CONFIG_SENSORS_DME1737 is not set
> # CONFIG_SENSORS_EMC1403 is not set
> CONFIG_SENSORS_EMC2103=3Dm
> CONFIG_SENSORS_EMC6W201=3Dm
> # CONFIG_SENSORS_SMSC47M1 is not set
> CONFIG_SENSORS_SMSC47M192=3Dm
> CONFIG_SENSORS_SMSC47B397=3Dm
> CONFIG_SENSORS_STTS751=3Dm
> CONFIG_SENSORS_SMM665=3Dm
> CONFIG_SENSORS_ADC128D818=3Dm
> # CONFIG_SENSORS_ADS7828 is not set
> CONFIG_SENSORS_AMC6821=3Dm
> CONFIG_SENSORS_INA209=3Dm
> CONFIG_SENSORS_INA2XX=3Dm
> # CONFIG_SENSORS_INA238 is not set
> # CONFIG_SENSORS_INA3221 is not set
> CONFIG_SENSORS_TC74=3Dm
> # CONFIG_SENSORS_THMC50 is not set
> CONFIG_SENSORS_TMP102=3Dm
> CONFIG_SENSORS_TMP103=3Dm
> CONFIG_SENSORS_TMP108=3Dm
> CONFIG_SENSORS_TMP401=3Dm
> CONFIG_SENSORS_TMP421=3Dm
> CONFIG_SENSORS_TMP513=3Dm
> CONFIG_SENSORS_VIA_CPUTEMP=3Dy
> CONFIG_SENSORS_VIA686A=3Dm
> CONFIG_SENSORS_VT1211=3Dm
> CONFIG_SENSORS_VT8231=3Dy
> CONFIG_SENSORS_W83773G=3Dm
> CONFIG_SENSORS_W83781D=3Dm
> # CONFIG_SENSORS_W83791D is not set
> CONFIG_SENSORS_W83792D=3Dm
> CONFIG_SENSORS_W83793=3Dm
> CONFIG_SENSORS_W83795=3Dm
> CONFIG_SENSORS_W83795_FANCTRL=3Dy
> CONFIG_SENSORS_W83L785TS=3Dm
> # CONFIG_SENSORS_W83L786NG is not set
> CONFIG_SENSORS_W83627HF=3Dy
> # CONFIG_SENSORS_W83627EHF is not set
> # CONFIG_SENSORS_XGENE is not set
> =

> #
> # ACPI drivers
> #
> CONFIG_SENSORS_ACPI_POWER=3Dm
> # CONFIG_SENSORS_ATK0110 is not set
> CONFIG_THERMAL=3Dy
> CONFIG_THERMAL_NETLINK=3Dy
> # CONFIG_THERMAL_STATISTICS is not set
> CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=3D0
> CONFIG_THERMAL_HWMON=3Dy
> # CONFIG_THERMAL_OF is not set
> CONFIG_THERMAL_WRITABLE_TRIPS=3Dy
> CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=3Dy
> # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
> # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
> # CONFIG_THERMAL_GOV_FAIR_SHARE is not set
> CONFIG_THERMAL_GOV_STEP_WISE=3Dy
> CONFIG_THERMAL_GOV_BANG_BANG=3Dy
> CONFIG_THERMAL_GOV_USER_SPACE=3Dy
> # CONFIG_THERMAL_GOV_POWER_ALLOCATOR is not set
> CONFIG_DEVFREQ_THERMAL=3Dy
> CONFIG_THERMAL_EMULATION=3Dy
> CONFIG_THERMAL_MMIO=3Dm
> CONFIG_DA9062_THERMAL=3Dm
> =

> #
> # Intel thermal drivers
> #
> CONFIG_INTEL_POWERCLAMP=3Dm
> CONFIG_X86_THERMAL_VECTOR=3Dy
> CONFIG_X86_PKG_TEMP_THERMAL=3Dm
> CONFIG_INTEL_SOC_DTS_IOSF_CORE=3Dm
> # CONFIG_INTEL_SOC_DTS_THERMAL is not set
> =

> #
> # ACPI INT340X thermal drivers
> #
> CONFIG_INT340X_THERMAL=3Dm
> CONFIG_ACPI_THERMAL_REL=3Dm
> CONFIG_INT3406_THERMAL=3Dm
> CONFIG_PROC_THERMAL_MMIO_RAPL=3Dm
> # end of ACPI INT340X thermal drivers
> =

> # CONFIG_INTEL_PCH_THERMAL is not set
> # CONFIG_INTEL_TCC_COOLING is not set
> # CONFIG_INTEL_MENLOW is not set
> # end of Intel thermal drivers
> =

> # CONFIG_WATCHDOG is not set
> CONFIG_SSB_POSSIBLE=3Dy
> CONFIG_SSB=3Dm
> CONFIG_SSB_PCIHOST_POSSIBLE=3Dy
> # CONFIG_SSB_PCIHOST is not set
> CONFIG_SSB_PCMCIAHOST_POSSIBLE=3Dy
> # CONFIG_SSB_PCMCIAHOST is not set
> CONFIG_SSB_DRIVER_GPIO=3Dy
> CONFIG_BCMA_POSSIBLE=3Dy
> CONFIG_BCMA=3Dm
> CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
> # CONFIG_BCMA_HOST_PCI is not set
> # CONFIG_BCMA_HOST_SOC is not set
> # CONFIG_BCMA_DRIVER_PCI is not set
> CONFIG_BCMA_DRIVER_GMAC_CMN=3Dy
> # CONFIG_BCMA_DRIVER_GPIO is not set
> CONFIG_BCMA_DEBUG=3Dy
> =

> #
> # Multifunction device drivers
> #
> CONFIG_MFD_CORE=3Dy
> CONFIG_MFD_ACT8945A=3Dm
> CONFIG_MFD_ATMEL_FLEXCOM=3Dm
> CONFIG_MFD_ATMEL_HLCDC=3Dy
> CONFIG_MFD_BCM590XX=3Dm
> CONFIG_MFD_BD9571MWV=3Dm
> # CONFIG_MFD_AXP20X_I2C is not set
> # CONFIG_MFD_MADERA is not set
> CONFIG_MFD_DA9062=3Dm
> CONFIG_MFD_DA9063=3Dm
> # CONFIG_MFD_DA9150 is not set
> CONFIG_MFD_DLN2=3Dm
> CONFIG_MFD_GATEWORKS_GSC=3Dm
> CONFIG_MFD_MC13XXX=3Dm
> CONFIG_MFD_MC13XXX_I2C=3Dm
> CONFIG_MFD_MP2629=3Dm
> CONFIG_MFD_HI6421_PMIC=3Dy
> CONFIG_HTC_PASIC3=3Dm
> # CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
> CONFIG_LPC_ICH=3Dy
> CONFIG_LPC_SCH=3Dy
> CONFIG_INTEL_SOC_PMIC_MRFLD=3Dy
> # CONFIG_MFD_INTEL_LPSS_ACPI is not set
> # CONFIG_MFD_INTEL_LPSS_PCI is not set
> # CONFIG_MFD_INTEL_PMC_BXT is not set
> CONFIG_MFD_IQS62X=3Dm
> # CONFIG_MFD_JANZ_CMODIO is not set
> CONFIG_MFD_KEMPLD=3Dm
> CONFIG_MFD_88PM800=3Dm
> CONFIG_MFD_88PM805=3Dm
> CONFIG_MFD_MAX14577=3Dm
> CONFIG_MFD_MAX77650=3Dm
> CONFIG_MFD_MAX77686=3Dm
> CONFIG_MFD_MAX77693=3Dm
> # CONFIG_MFD_MAX8907 is not set
> CONFIG_MFD_MT6360=3Dm
> # CONFIG_MFD_MT6397 is not set
> # CONFIG_MFD_MENF21BMC is not set
> CONFIG_MFD_VIPERBOARD=3Dm
> CONFIG_MFD_NTXEC=3Dm
> CONFIG_MFD_RETU=3Dm
> CONFIG_MFD_PCF50633=3Dm
> CONFIG_PCF50633_ADC=3Dm
> CONFIG_PCF50633_GPIO=3Dm
> CONFIG_MFD_RDC321X=3Dy
> CONFIG_MFD_RT4831=3Dm
> CONFIG_MFD_RT5033=3Dm
> CONFIG_MFD_RK808=3Dm
> CONFIG_MFD_RN5T618=3Dm
> CONFIG_MFD_SI476X_CORE=3Dm
> # CONFIG_MFD_SM501 is not set
> # CONFIG_MFD_SKY81452 is not set
> CONFIG_MFD_SYSCON=3Dy
> # CONFIG_MFD_TI_AM335X_TSCADC is not set
> # CONFIG_MFD_LP3943 is not set
> CONFIG_MFD_TI_LMU=3Dm
> # CONFIG_TPS6105X is not set
> # CONFIG_TPS65010 is not set
> CONFIG_TPS6507X=3Dm
> CONFIG_MFD_TPS65086=3Dm
> CONFIG_MFD_TPS65217=3Dm
> # CONFIG_MFD_TI_LP873X is not set
> # CONFIG_MFD_TI_LP87565 is not set
> CONFIG_MFD_TPS65218=3Dm
> CONFIG_MFD_TPS65912=3Dm
> CONFIG_MFD_TPS65912_I2C=3Dm
> CONFIG_MFD_WL1273_CORE=3Dm
> CONFIG_MFD_LM3533=3Dm
> CONFIG_MFD_TQMX86=3Dm
> CONFIG_MFD_VX855=3Dm
> CONFIG_MFD_ARIZONA=3Dm
> CONFIG_MFD_ARIZONA_I2C=3Dm
> # CONFIG_MFD_CS47L24 is not set
> CONFIG_MFD_WM5102=3Dy
> CONFIG_MFD_WM5110=3Dy
> # CONFIG_MFD_WM8997 is not set
> CONFIG_MFD_WM8998=3Dy
> CONFIG_MFD_WM8994=3Dm
> CONFIG_MFD_STMFX=3Dm
> CONFIG_MFD_WCD934X=3Dm
> CONFIG_MFD_ATC260X=3Dm
> CONFIG_MFD_ATC260X_I2C=3Dm
> CONFIG_MFD_QCOM_PM8008=3Dm
> CONFIG_MFD_RSMU_I2C=3Dm
> # end of Multifunction device drivers
> =

> CONFIG_REGULATOR=3Dy
> CONFIG_REGULATOR_DEBUG=3Dy
> CONFIG_REGULATOR_FIXED_VOLTAGE=3Dm
> # CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
> CONFIG_REGULATOR_USERSPACE_CONSUMER=3Dy
> CONFIG_REGULATOR_88PG86X=3Dm
> CONFIG_REGULATOR_88PM800=3Dm
> CONFIG_REGULATOR_ACT8865=3Dm
> CONFIG_REGULATOR_ACT8945A=3Dm
> CONFIG_REGULATOR_AD5398=3Dm
> CONFIG_REGULATOR_ATC260X=3Dm
> CONFIG_REGULATOR_BCM590XX=3Dm
> CONFIG_REGULATOR_BD9571MWV=3Dm
> CONFIG_REGULATOR_DA9062=3Dm
> CONFIG_REGULATOR_DA9063=3Dm
> CONFIG_REGULATOR_DA9121=3Dm
> CONFIG_REGULATOR_DA9210=3Dm
> CONFIG_REGULATOR_DA9211=3Dm
> CONFIG_REGULATOR_FAN53555=3Dm
> CONFIG_REGULATOR_FAN53880=3Dm
> CONFIG_REGULATOR_GPIO=3Dy
> CONFIG_REGULATOR_HI6421=3Dy
> CONFIG_REGULATOR_HI6421V530=3Dm
> # CONFIG_REGULATOR_ISL9305 is not set
> CONFIG_REGULATOR_ISL6271A=3Dm
> CONFIG_REGULATOR_LM363X=3Dm
> CONFIG_REGULATOR_LP3971=3Dm
> CONFIG_REGULATOR_LP3972=3Dm
> CONFIG_REGULATOR_LP872X=3Dm
> # CONFIG_REGULATOR_LP8755 is not set
> CONFIG_REGULATOR_LTC3589=3Dm
> CONFIG_REGULATOR_LTC3676=3Dm
> # CONFIG_REGULATOR_MAX14577 is not set
> CONFIG_REGULATOR_MAX1586=3Dm
> CONFIG_REGULATOR_MAX77650=3Dm
> CONFIG_REGULATOR_MAX8649=3Dm
> CONFIG_REGULATOR_MAX8660=3Dm
> CONFIG_REGULATOR_MAX8893=3Dm
> CONFIG_REGULATOR_MAX8952=3Dm
> # CONFIG_REGULATOR_MAX20086 is not set
> CONFIG_REGULATOR_MAX77686=3Dm
> CONFIG_REGULATOR_MAX77693=3Dm
> CONFIG_REGULATOR_MAX77802=3Dm
> CONFIG_REGULATOR_MAX77826=3Dm
> CONFIG_REGULATOR_MC13XXX_CORE=3Dm
> # CONFIG_REGULATOR_MC13783 is not set
> CONFIG_REGULATOR_MC13892=3Dm
> CONFIG_REGULATOR_MCP16502=3Dm
> # CONFIG_REGULATOR_MP5416 is not set
> CONFIG_REGULATOR_MP8859=3Dm
> CONFIG_REGULATOR_MP886X=3Dm
> # CONFIG_REGULATOR_MPQ7920 is not set
> CONFIG_REGULATOR_MT6311=3Dm
> CONFIG_REGULATOR_MT6360=3Dm
> CONFIG_REGULATOR_PCA9450=3Dm
> CONFIG_REGULATOR_PCF50633=3Dm
> CONFIG_REGULATOR_PF8X00=3Dm
> # CONFIG_REGULATOR_PFUZE100 is not set
> CONFIG_REGULATOR_PV88060=3Dm
> CONFIG_REGULATOR_PV88080=3Dm
> # CONFIG_REGULATOR_PV88090 is not set
> CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY=3Dm
> # CONFIG_REGULATOR_RK808 is not set
> # CONFIG_REGULATOR_RN5T618 is not set
> CONFIG_REGULATOR_RT4801=3Dm
> CONFIG_REGULATOR_RT4831=3Dm
> CONFIG_REGULATOR_RT5033=3Dm
> CONFIG_REGULATOR_RT6160=3Dm
> CONFIG_REGULATOR_RT6245=3Dm
> CONFIG_REGULATOR_RTQ2134=3Dm
> CONFIG_REGULATOR_RTMV20=3Dm
> # CONFIG_REGULATOR_RTQ6752 is not set
> CONFIG_REGULATOR_SLG51000=3Dm
> CONFIG_REGULATOR_SY8106A=3Dm
> CONFIG_REGULATOR_SY8824X=3Dm
> CONFIG_REGULATOR_SY8827N=3Dm
> CONFIG_REGULATOR_TPS51632=3Dm
> CONFIG_REGULATOR_TPS62360=3Dm
> CONFIG_REGULATOR_TPS65023=3Dm
> CONFIG_REGULATOR_TPS6507X=3Dm
> CONFIG_REGULATOR_TPS65086=3Dm
> CONFIG_REGULATOR_TPS65132=3Dm
> CONFIG_REGULATOR_TPS65217=3Dm
> CONFIG_REGULATOR_TPS65218=3Dm
> CONFIG_REGULATOR_TPS65912=3Dm
> # CONFIG_REGULATOR_VCTRL is not set
> CONFIG_REGULATOR_WM8994=3Dm
> CONFIG_RC_CORE=3Dm
> # CONFIG_RC_MAP is not set
> CONFIG_LIRC=3Dy
> # CONFIG_RC_DECODERS is not set
> # CONFIG_RC_DEVICES is not set
> CONFIG_CEC_CORE=3Dm
> =

> #
> # CEC support
> #
> # CONFIG_MEDIA_CEC_RC is not set
> CONFIG_MEDIA_CEC_SUPPORT=3Dy
> CONFIG_CEC_CH7322=3Dm
> # CONFIG_USB_PULSE8_CEC is not set
> # CONFIG_USB_RAINSHADOW_CEC is not set
> # end of CEC support
> =

> # CONFIG_MEDIA_SUPPORT is not set
> =

> #
> # Graphics support
> #
> CONFIG_AGP=3Dm
> # CONFIG_AGP_INTEL is not set
> CONFIG_AGP_SIS=3Dm
> CONFIG_AGP_VIA=3Dm
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
> CONFIG_LCD_PLATFORM=3Dy
> CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
> CONFIG_BACKLIGHT_KTD253=3Dm
> CONFIG_BACKLIGHT_LM3533=3Dm
> CONFIG_BACKLIGHT_APPLE=3Dm
> # CONFIG_BACKLIGHT_QCOM_WLED is not set
> # CONFIG_BACKLIGHT_RT4831 is not set
> CONFIG_BACKLIGHT_SAHARA=3Dy
> CONFIG_BACKLIGHT_ADP8860=3Dm
> # CONFIG_BACKLIGHT_ADP8870 is not set
> CONFIG_BACKLIGHT_PCF50633=3Dm
> # CONFIG_BACKLIGHT_LM3639 is not set
> CONFIG_BACKLIGHT_TPS65217=3Dm
> # CONFIG_BACKLIGHT_GPIO is not set
> CONFIG_BACKLIGHT_LV5207LP=3Dm
> # CONFIG_BACKLIGHT_BD6107 is not set
> CONFIG_BACKLIGHT_ARCXCNN=3Dm
> CONFIG_BACKLIGHT_LED=3Dy
> # end of Backlight & LCD device support
> # end of Graphics support
> =

> CONFIG_SOUND=3Dm
> # CONFIG_SND is not set
> =

> #
> # HID support
> #
> CONFIG_HID=3Dy
> # CONFIG_HID_BATTERY_STRENGTH is not set
> # CONFIG_HIDRAW is not set
> # CONFIG_UHID is not set
> # CONFIG_HID_GENERIC is not set
> =

> #
> # Special HID drivers
> #
> CONFIG_HID_A4TECH=3Dm
> CONFIG_HID_ACRUX=3Dy
> # CONFIG_HID_ACRUX_FF is not set
> CONFIG_HID_APPLE=3Dm
> # CONFIG_HID_AUREAL is not set
> CONFIG_HID_BELKIN=3Dy
> # CONFIG_HID_CHERRY is not set
> CONFIG_HID_COUGAR=3Dy
> CONFIG_HID_MACALLY=3Dy
> CONFIG_HID_CMEDIA=3Dy
> CONFIG_HID_CYPRESS=3Dy
> # CONFIG_HID_DRAGONRISE is not set
> # CONFIG_HID_EMS_FF is not set
> CONFIG_HID_ELECOM=3Dm
> CONFIG_HID_EZKEY=3Dy
> CONFIG_HID_GEMBIRD=3Dm
> # CONFIG_HID_GFRM is not set
> CONFIG_HID_GLORIOUS=3Dm
> CONFIG_HID_VIVALDI=3Dy
> # CONFIG_HID_KEYTOUCH is not set
> # CONFIG_HID_KYE is not set
> CONFIG_HID_WALTOP=3Dy
> CONFIG_HID_VIEWSONIC=3Dm
> # CONFIG_HID_XIAOMI is not set
> CONFIG_HID_GYRATION=3Dy
> CONFIG_HID_ICADE=3Dy
> CONFIG_HID_ITE=3Dm
> CONFIG_HID_JABRA=3Dm
> CONFIG_HID_TWINHAN=3Dy
> # CONFIG_HID_KENSINGTON is not set
> CONFIG_HID_LCPOWER=3Dy
> CONFIG_HID_LED=3Dy
> CONFIG_HID_LENOVO=3Dm
> CONFIG_HID_MAGICMOUSE=3Dy
> CONFIG_HID_MALTRON=3Dm
> CONFIG_HID_MAYFLASH=3Dy
> # CONFIG_HID_REDRAGON is not set
> CONFIG_HID_MICROSOFT=3Dm
> CONFIG_HID_MONTEREY=3Dm
> CONFIG_HID_MULTITOUCH=3Dm
> # CONFIG_HID_NINTENDO is not set
> CONFIG_HID_NTI=3Dy
> CONFIG_HID_ORTEK=3Dy
> # CONFIG_HID_PANTHERLORD is not set
> # CONFIG_HID_PETALYNX is not set
> CONFIG_HID_PICOLCD=3Dm
> CONFIG_HID_PICOLCD_BACKLIGHT=3Dy
> # CONFIG_HID_PICOLCD_LCD is not set
> CONFIG_HID_PICOLCD_LEDS=3Dy
> CONFIG_HID_PICOLCD_CIR=3Dy
> CONFIG_HID_PLANTRONICS=3Dy
> CONFIG_HID_PLAYSTATION=3Dm
> CONFIG_PLAYSTATION_FF=3Dy
> # CONFIG_HID_PRIMAX is not set
> CONFIG_HID_SAITEK=3Dm
> # CONFIG_HID_SEMITEK is not set
> # CONFIG_HID_SPEEDLINK is not set
> CONFIG_HID_STEAM=3Dy
> CONFIG_HID_STEELSERIES=3Dy
> CONFIG_HID_SUNPLUS=3Dy
> CONFIG_HID_RMI=3Dm
> CONFIG_HID_GREENASIA=3Dm
> CONFIG_GREENASIA_FF=3Dy
> # CONFIG_HID_SMARTJOYPLUS is not set
> CONFIG_HID_TIVO=3Dy
> CONFIG_HID_TOPSEED=3Dy
> CONFIG_HID_THINGM=3Dy
> # CONFIG_HID_UDRAW_PS3 is not set
> CONFIG_HID_WIIMOTE=3Dm
> CONFIG_HID_XINMO=3Dm
> CONFIG_HID_ZEROPLUS=3Dm
> CONFIG_ZEROPLUS_FF=3Dy
> CONFIG_HID_ZYDACRON=3Dy
> CONFIG_HID_SENSOR_HUB=3Dm
> CONFIG_HID_SENSOR_CUSTOM_SENSOR=3Dm
> # CONFIG_HID_ALPS is not set
> # end of Special HID drivers
> =

> #
> # USB HID support
> #
> # CONFIG_USB_HID is not set
> # CONFIG_HID_PID is not set
> =

> #
> # USB HID Boot Protocol drivers
> #
> # CONFIG_USB_KBD is not set
> CONFIG_USB_MOUSE=3Dy
> # end of USB HID Boot Protocol drivers
> # end of USB HID support
> =

> #
> # I2C HID support
> #
> CONFIG_I2C_HID_ACPI=3Dm
> CONFIG_I2C_HID_OF=3Dm
> CONFIG_I2C_HID_OF_GOODIX=3Dm
> # end of I2C HID support
> =

> CONFIG_I2C_HID_CORE=3Dm
> =

> #
> # Intel ISH HID support
> #
> CONFIG_INTEL_ISH_HID=3Dy
> # CONFIG_INTEL_ISH_FIRMWARE_DOWNLOADER is not set
> # end of Intel ISH HID support
> =

> #
> # AMD SFH HID Support
> #
> # CONFIG_AMD_SFH_HID is not set
> # end of AMD SFH HID Support
> # end of HID support
> =

> CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
> CONFIG_USB_SUPPORT=3Dy
> CONFIG_USB_COMMON=3Dy
> # CONFIG_USB_LED_TRIG is not set
> CONFIG_USB_ULPI_BUS=3Dy
> # CONFIG_USB_CONN_GPIO is not set
> CONFIG_USB_ARCH_HAS_HCD=3Dy
> CONFIG_USB=3Dy
> # CONFIG_USB_PCI is not set
> # CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set
> =

> #
> # Miscellaneous USB options
> #
> # CONFIG_USB_DEFAULT_PERSIST is not set
> CONFIG_USB_FEW_INIT_RETRIES=3Dy
> CONFIG_USB_DYNAMIC_MINORS=3Dy
> CONFIG_USB_OTG=3Dy
> CONFIG_USB_OTG_PRODUCTLIST=3Dy
> # CONFIG_USB_OTG_DISABLE_EXTERNAL_HUB is not set
> CONFIG_USB_OTG_FSM=3Dm
> CONFIG_USB_LEDS_TRIGGER_USBPORT=3Dy
> CONFIG_USB_AUTOSUSPEND_DELAY=3D2
> CONFIG_USB_MON=3Dm
> =

> #
> # USB Host Controller Drivers
> #
> CONFIG_USB_C67X00_HCD=3Dy
> CONFIG_USB_XHCI_HCD=3Dm
> CONFIG_USB_XHCI_DBGCAP=3Dy
> # CONFIG_USB_XHCI_PCI_RENESAS is not set
> CONFIG_USB_XHCI_PLATFORM=3Dm
> CONFIG_USB_EHCI_HCD=3Dy
> CONFIG_USB_EHCI_ROOT_HUB_TT=3Dy
> CONFIG_USB_EHCI_TT_NEWSCHED=3Dy
> # CONFIG_USB_EHCI_FSL is not set
> CONFIG_USB_EHCI_HCD_PLATFORM=3Dy
> CONFIG_USB_OXU210HP_HCD=3Dm
> # CONFIG_USB_ISP116X_HCD is not set
> # CONFIG_USB_FOTG210_HCD is not set
> # CONFIG_USB_OHCI_HCD is not set
> CONFIG_USB_U132_HCD=3Dm
> # CONFIG_USB_SL811_HCD is not set
> CONFIG_USB_R8A66597_HCD=3Dy
> CONFIG_USB_HCD_BCMA=3Dm
> CONFIG_USB_HCD_SSB=3Dm
> # CONFIG_USB_HCD_TEST_MODE is not set
> =

> #
> # USB Device Class drivers
> #
> CONFIG_USB_ACM=3Dm
> # CONFIG_USB_PRINTER is not set
> CONFIG_USB_WDM=3Dy
> CONFIG_USB_TMC=3Dy
> =

> #
> # NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
> #
> =

> #
> # also be needed; see USB_STORAGE Help for more info
> #
> =

> #
> # USB Imaging devices
> #
> CONFIG_USB_MDC800=3Dy
> CONFIG_USBIP_CORE=3Dy
> # CONFIG_USBIP_VHCI_HCD is not set
> CONFIG_USBIP_HOST=3Dy
> CONFIG_USBIP_VUDC=3Dm
> # CONFIG_USBIP_DEBUG is not set
> CONFIG_USB_CDNS_SUPPORT=3Dm
> CONFIG_USB_CDNS_HOST=3Dy
> CONFIG_USB_CDNS3=3Dm
> # CONFIG_USB_CDNS3_GADGET is not set
> CONFIG_USB_CDNS3_HOST=3Dy
> # CONFIG_USB_MUSB_HDRC is not set
> # CONFIG_USB_DWC3 is not set
> CONFIG_USB_DWC2=3Dm
> # CONFIG_USB_DWC2_HOST is not set
> =

> #
> # Gadget/Dual-role mode requires USB Gadget support to be enabled
> #
> CONFIG_USB_DWC2_PERIPHERAL=3Dy
> # CONFIG_USB_DWC2_DUAL_ROLE is not set
> CONFIG_USB_DWC2_DEBUG=3Dy
> CONFIG_USB_DWC2_VERBOSE=3Dy
> # CONFIG_USB_DWC2_TRACK_MISSED_SOFS is not set
> CONFIG_USB_DWC2_DEBUG_PERIODIC=3Dy
> CONFIG_USB_CHIPIDEA=3Dm
> CONFIG_USB_CHIPIDEA_UDC=3Dy
> CONFIG_USB_CHIPIDEA_HOST=3Dy
> CONFIG_USB_CHIPIDEA_MSM=3Dm
> # CONFIG_USB_CHIPIDEA_IMX is not set
> CONFIG_USB_CHIPIDEA_GENERIC=3Dm
> CONFIG_USB_CHIPIDEA_TEGRA=3Dm
> CONFIG_USB_ISP1760=3Dy
> CONFIG_USB_ISP1760_HCD=3Dy
> CONFIG_USB_ISP1760_HOST_ROLE=3Dy
> =

> #
> # USB port drivers
> #
> CONFIG_USB_USS720=3Dy
> CONFIG_USB_SERIAL=3Dm
> CONFIG_USB_SERIAL_GENERIC=3Dy
> CONFIG_USB_SERIAL_SIMPLE=3Dm
> # CONFIG_USB_SERIAL_AIRCABLE is not set
> CONFIG_USB_SERIAL_ARK3116=3Dm
> # CONFIG_USB_SERIAL_BELKIN is not set
> CONFIG_USB_SERIAL_CH341=3Dm
> CONFIG_USB_SERIAL_WHITEHEAT=3Dm
> CONFIG_USB_SERIAL_DIGI_ACCELEPORT=3Dm
> CONFIG_USB_SERIAL_CP210X=3Dm
> CONFIG_USB_SERIAL_CYPRESS_M8=3Dm
> # CONFIG_USB_SERIAL_EMPEG is not set
> CONFIG_USB_SERIAL_FTDI_SIO=3Dm
> CONFIG_USB_SERIAL_VISOR=3Dm
> # CONFIG_USB_SERIAL_IPAQ is not set
> # CONFIG_USB_SERIAL_IR is not set
> CONFIG_USB_SERIAL_EDGEPORT=3Dm
> # CONFIG_USB_SERIAL_EDGEPORT_TI is not set
> # CONFIG_USB_SERIAL_F81232 is not set
> CONFIG_USB_SERIAL_F8153X=3Dm
> CONFIG_USB_SERIAL_GARMIN=3Dm
> CONFIG_USB_SERIAL_IPW=3Dm
> CONFIG_USB_SERIAL_IUU=3Dm
> # CONFIG_USB_SERIAL_KEYSPAN_PDA is not set
> # CONFIG_USB_SERIAL_KEYSPAN is not set
> CONFIG_USB_SERIAL_KLSI=3Dm
> CONFIG_USB_SERIAL_KOBIL_SCT=3Dm
> CONFIG_USB_SERIAL_MCT_U232=3Dm
> CONFIG_USB_SERIAL_METRO=3Dm
> # CONFIG_USB_SERIAL_MOS7720 is not set
> CONFIG_USB_SERIAL_MOS7840=3Dm
> CONFIG_USB_SERIAL_MXUPORT=3Dm
> # CONFIG_USB_SERIAL_NAVMAN is not set
> # CONFIG_USB_SERIAL_PL2303 is not set
> # CONFIG_USB_SERIAL_OTI6858 is not set
> CONFIG_USB_SERIAL_QCAUX=3Dm
> CONFIG_USB_SERIAL_QUALCOMM=3Dm
> CONFIG_USB_SERIAL_SPCP8X5=3Dm
> CONFIG_USB_SERIAL_SAFE=3Dm
> CONFIG_USB_SERIAL_SAFE_PADDED=3Dy
> CONFIG_USB_SERIAL_SIERRAWIRELESS=3Dm
> CONFIG_USB_SERIAL_SYMBOL=3Dm
> CONFIG_USB_SERIAL_TI=3Dm
> # CONFIG_USB_SERIAL_CYBERJACK is not set
> CONFIG_USB_SERIAL_WWAN=3Dm
> CONFIG_USB_SERIAL_OPTION=3Dm
> CONFIG_USB_SERIAL_OMNINET=3Dm
> CONFIG_USB_SERIAL_OPTICON=3Dm
> CONFIG_USB_SERIAL_XSENS_MT=3Dm
> CONFIG_USB_SERIAL_WISHBONE=3Dm
> # CONFIG_USB_SERIAL_SSU100 is not set
> CONFIG_USB_SERIAL_QT2=3Dm
> CONFIG_USB_SERIAL_UPD78F0730=3Dm
> # CONFIG_USB_SERIAL_XR is not set
> # CONFIG_USB_SERIAL_DEBUG is not set
> =

> #
> # USB Miscellaneous drivers
> #
> CONFIG_USB_EMI62=3Dy
> # CONFIG_USB_EMI26 is not set
> CONFIG_USB_ADUTUX=3Dm
> CONFIG_USB_SEVSEG=3Dy
> # CONFIG_USB_LEGOTOWER is not set
> CONFIG_USB_LCD=3Dm
> CONFIG_USB_CYPRESS_CY7C63=3Dm
> CONFIG_USB_CYTHERM=3Dm
> CONFIG_USB_IDMOUSE=3Dy
> CONFIG_USB_FTDI_ELAN=3Dy
> CONFIG_USB_APPLEDISPLAY=3Dy
> # CONFIG_APPLE_MFI_FASTCHARGE is not set
> # CONFIG_USB_SISUSBVGA is not set
> CONFIG_USB_LD=3Dm
> # CONFIG_USB_TRANCEVIBRATOR is not set
> CONFIG_USB_IOWARRIOR=3Dm
> # CONFIG_USB_TEST is not set
> # CONFIG_USB_EHSET_TEST_FIXTURE is not set
> CONFIG_USB_ISIGHTFW=3Dy
> # CONFIG_USB_YUREX is not set
> CONFIG_USB_EZUSB_FX2=3Dm
> # CONFIG_USB_HUB_USB251XB is not set
> # CONFIG_USB_HSIC_USB3503 is not set
> # CONFIG_USB_HSIC_USB4604 is not set
> # CONFIG_USB_LINK_LAYER_TEST is not set
> CONFIG_USB_CHAOSKEY=3Dm
> # CONFIG_USB_ATM is not set
> =

> #
> # USB Physical Layer drivers
> #
> CONFIG_USB_PHY=3Dy
> # CONFIG_NOP_USB_XCEIV is not set
> # CONFIG_USB_GPIO_VBUS is not set
> # CONFIG_TAHVO_USB is not set
> CONFIG_USB_ISP1301=3Dm
> # end of USB Physical Layer drivers
> =

> CONFIG_USB_GADGET=3Dm
> # CONFIG_USB_GADGET_DEBUG is not set
> # CONFIG_USB_GADGET_DEBUG_FILES is not set
> # CONFIG_USB_GADGET_DEBUG_FS is not set
> CONFIG_USB_GADGET_VBUS_DRAW=3D2
> CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=3D2
> # CONFIG_U_SERIAL_CONSOLE is not set
> =

> #
> # USB Peripheral Controller
> #
> CONFIG_USB_FOTG210_UDC=3Dm
> CONFIG_USB_GR_UDC=3Dm
> CONFIG_USB_R8A66597=3Dm
> CONFIG_USB_PXA27X=3Dm
> CONFIG_USB_MV_UDC=3Dm
> CONFIG_USB_MV_U3D=3Dm
> CONFIG_USB_SNP_CORE=3Dm
> CONFIG_USB_SNP_UDC_PLAT=3Dm
> CONFIG_USB_M66592=3Dm
> # CONFIG_USB_BDC_UDC is not set
> CONFIG_USB_NET2272=3Dm
> CONFIG_USB_NET2272_DMA=3Dy
> CONFIG_USB_GADGET_XILINX=3Dm
> CONFIG_USB_DUMMY_HCD=3Dm
> # end of USB Peripheral Controller
> =

> CONFIG_USB_LIBCOMPOSITE=3Dm
> CONFIG_USB_F_ACM=3Dm
> CONFIG_USB_F_SS_LB=3Dm
> CONFIG_USB_U_SERIAL=3Dm
> CONFIG_USB_U_ETHER=3Dm
> CONFIG_USB_F_SERIAL=3Dm
> CONFIG_USB_F_OBEX=3Dm
> CONFIG_USB_F_ECM=3Dm
> CONFIG_USB_F_SUBSET=3Dm
> CONFIG_USB_F_RNDIS=3Dm
> CONFIG_USB_F_FS=3Dm
> CONFIG_USB_F_HID=3Dm
> CONFIG_USB_CONFIGFS=3Dm
> CONFIG_USB_CONFIGFS_SERIAL=3Dy
> CONFIG_USB_CONFIGFS_ACM=3Dy
> CONFIG_USB_CONFIGFS_OBEX=3Dy
> # CONFIG_USB_CONFIGFS_NCM is not set
> # CONFIG_USB_CONFIGFS_ECM is not set
> # CONFIG_USB_CONFIGFS_ECM_SUBSET is not set
> CONFIG_USB_CONFIGFS_RNDIS=3Dy
> # CONFIG_USB_CONFIGFS_EEM is not set
> # CONFIG_USB_CONFIGFS_F_LB_SS is not set
> CONFIG_USB_CONFIGFS_F_FS=3Dy
> # CONFIG_USB_CONFIGFS_F_HID is not set
> # CONFIG_USB_CONFIGFS_F_PRINTER is not set
> =

> #
> # USB Gadget precomposed configurations
> #
> CONFIG_USB_ZERO=3Dm
> CONFIG_USB_ZERO_HNPTEST=3Dy
> CONFIG_USB_ETH=3Dm
> # CONFIG_USB_ETH_RNDIS is not set
> # CONFIG_USB_ETH_EEM is not set
> # CONFIG_USB_G_NCM is not set
> CONFIG_USB_GADGETFS=3Dm
> # CONFIG_USB_FUNCTIONFS is not set
> CONFIG_USB_G_SERIAL=3Dm
> # CONFIG_USB_G_PRINTER is not set
> # CONFIG_USB_CDC_COMPOSITE is not set
> CONFIG_USB_G_HID=3Dm
> CONFIG_USB_G_DBGP=3Dm
> CONFIG_USB_G_DBGP_PRINTK=3Dy
> # CONFIG_USB_G_DBGP_SERIAL is not set
> CONFIG_USB_RAW_GADGET=3Dm
> # end of USB Gadget precomposed configurations
> =

> CONFIG_TYPEC=3Dy
> CONFIG_TYPEC_TCPM=3Dm
> CONFIG_TYPEC_TCPCI=3Dm
> CONFIG_TYPEC_RT1711H=3Dm
> CONFIG_TYPEC_MT6360=3Dm
> # CONFIG_TYPEC_TCPCI_MAXIM is not set
> # CONFIG_TYPEC_FUSB302 is not set
> # CONFIG_TYPEC_UCSI is not set
> CONFIG_TYPEC_TPS6598X=3Dm
> CONFIG_TYPEC_HD3SS3220=3Dm
> CONFIG_TYPEC_STUSB160X=3Dm
> =

> #
> # USB Type-C Multiplexer/DeMultiplexer Switch support
> #
> CONFIG_TYPEC_MUX_PI3USB30532=3Dm
> CONFIG_TYPEC_MUX_INTEL_PMC=3Dy
> # end of USB Type-C Multiplexer/DeMultiplexer Switch support
> =

> #
> # USB Type-C Alternate Mode drivers
> #
> # end of USB Type-C Alternate Mode drivers
> =

> CONFIG_USB_ROLE_SWITCH=3Dy
> # CONFIG_USB_ROLES_INTEL_XHCI is not set
> # CONFIG_MMC is not set
> # CONFIG_MEMSTICK is not set
> CONFIG_NEW_LEDS=3Dy
> CONFIG_LEDS_CLASS=3Dy
> CONFIG_LEDS_CLASS_FLASH=3Dy
> CONFIG_LEDS_CLASS_MULTICOLOR=3Dm
> # CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set
> =

> #
> # LED drivers
> #
> CONFIG_LEDS_AN30259A=3Dm
> CONFIG_LEDS_AW2013=3Dm
> CONFIG_LEDS_BCM6328=3Dm
> # CONFIG_LEDS_BCM6358 is not set
> CONFIG_LEDS_LM3530=3Dm
> CONFIG_LEDS_LM3532=3Dm
> CONFIG_LEDS_LM3533=3Dm
> CONFIG_LEDS_LM3642=3Dm
> CONFIG_LEDS_LM3692X=3Dm
> # CONFIG_LEDS_PCA9532 is not set
> CONFIG_LEDS_GPIO=3Dy
> # CONFIG_LEDS_LP3944 is not set
> CONFIG_LEDS_LP3952=3Dm
> CONFIG_LEDS_LP50XX=3Dm
> CONFIG_LEDS_LP55XX_COMMON=3Dm
> # CONFIG_LEDS_LP5521 is not set
> CONFIG_LEDS_LP5523=3Dm
> CONFIG_LEDS_LP5562=3Dm
> # CONFIG_LEDS_LP8501 is not set
> # CONFIG_LEDS_LP8860 is not set
> CONFIG_LEDS_PCA955X=3Dm
> CONFIG_LEDS_PCA955X_GPIO=3Dy
> CONFIG_LEDS_PCA963X=3Dm
> CONFIG_LEDS_REGULATOR=3Dm
> CONFIG_LEDS_BD2802=3Dm
> # CONFIG_LEDS_LT3593 is not set
> # CONFIG_LEDS_MC13783 is not set
> # CONFIG_LEDS_TCA6507 is not set
> CONFIG_LEDS_TLC591XX=3Dm
> CONFIG_LEDS_MAX77650=3Dm
> CONFIG_LEDS_LM355x=3Dm
> CONFIG_LEDS_IS31FL319X=3Dm
> CONFIG_LEDS_IS31FL32XX=3Dm
> =

> #
> # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_T=
HINGM)
> #
> CONFIG_LEDS_BLINKM=3Dm
> CONFIG_LEDS_SYSCON=3Dy
> CONFIG_LEDS_MLXREG=3Dm
> # CONFIG_LEDS_USER is not set
> CONFIG_LEDS_NIC78BX=3Dy
> CONFIG_LEDS_TI_LMU_COMMON=3Dy
> CONFIG_LEDS_LM3697=3Dm
> CONFIG_LEDS_LM36274=3Dm
> # CONFIG_LEDS_LGM is not set
> =

> #
> # Flash and Torch LED drivers
> #
> CONFIG_LEDS_AAT1290=3Dm
> CONFIG_LEDS_AS3645A=3Dm
> CONFIG_LEDS_KTD2692=3Dy
> CONFIG_LEDS_LM3601X=3Dm
> CONFIG_LEDS_MAX77693=3Dm
> # CONFIG_LEDS_MT6360 is not set
> CONFIG_LEDS_RT4505=3Dm
> CONFIG_LEDS_RT8515=3Dm
> CONFIG_LEDS_SGM3140=3Dm
> =

> #
> # LED Triggers
> #
> CONFIG_LEDS_TRIGGERS=3Dy
> CONFIG_LEDS_TRIGGER_TIMER=3Dy
> CONFIG_LEDS_TRIGGER_ONESHOT=3Dy
> # CONFIG_LEDS_TRIGGER_HEARTBEAT is not set
> # CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
> # CONFIG_LEDS_TRIGGER_CPU is not set
> # CONFIG_LEDS_TRIGGER_ACTIVITY is not set
> CONFIG_LEDS_TRIGGER_GPIO=3Dy
> CONFIG_LEDS_TRIGGER_DEFAULT_ON=3Dm
> =

> #
> # iptables trigger is under Netfilter config (LED target)
> #
> CONFIG_LEDS_TRIGGER_TRANSIENT=3Dy
> CONFIG_LEDS_TRIGGER_CAMERA=3Dy
> # CONFIG_LEDS_TRIGGER_PANIC is not set
> CONFIG_LEDS_TRIGGER_NETDEV=3Dy
> CONFIG_LEDS_TRIGGER_PATTERN=3Dm
> CONFIG_LEDS_TRIGGER_AUDIO=3Dm
> CONFIG_LEDS_TRIGGER_TTY=3Dy
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
> CONFIG_RTC_LIB=3Dy
> CONFIG_RTC_MC146818_LIB=3Dy
> CONFIG_RTC_CLASS=3Dy
> # CONFIG_RTC_HCTOSYS is not set
> CONFIG_RTC_SYSTOHC=3Dy
> CONFIG_RTC_SYSTOHC_DEVICE=3D"rtc0"
> # CONFIG_RTC_DEBUG is not set
> # CONFIG_RTC_NVMEM is not set
> =

> #
> # RTC interfaces
> #
> CONFIG_RTC_INTF_SYSFS=3Dy
> CONFIG_RTC_INTF_PROC=3Dy
> CONFIG_RTC_INTF_DEV=3Dy
> # CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
> # CONFIG_RTC_DRV_TEST is not set
> =

> #
> # I2C RTC drivers
> #
> # CONFIG_RTC_DRV_88PM80X is not set
> CONFIG_RTC_DRV_ABB5ZES3=3Dm
> # CONFIG_RTC_DRV_ABEOZ9 is not set
> CONFIG_RTC_DRV_ABX80X=3Dm
> CONFIG_RTC_DRV_DS1307=3Dm
> # CONFIG_RTC_DRV_DS1307_CENTURY is not set
> CONFIG_RTC_DRV_DS1374=3Dm
> # CONFIG_RTC_DRV_DS1672 is not set
> CONFIG_RTC_DRV_HYM8563=3Dm
> CONFIG_RTC_DRV_MAX6900=3Dm
> # CONFIG_RTC_DRV_MAX77686 is not set
> CONFIG_RTC_DRV_RK808=3Dm
> # CONFIG_RTC_DRV_RS5C372 is not set
> CONFIG_RTC_DRV_ISL1208=3Dm
> # CONFIG_RTC_DRV_ISL12022 is not set
> # CONFIG_RTC_DRV_ISL12026 is not set
> CONFIG_RTC_DRV_X1205=3Dm
> CONFIG_RTC_DRV_PCF8523=3Dm
> CONFIG_RTC_DRV_PCF85063=3Dm
> CONFIG_RTC_DRV_PCF85363=3Dm
> CONFIG_RTC_DRV_PCF8563=3Dm
> CONFIG_RTC_DRV_PCF8583=3Dm
> CONFIG_RTC_DRV_M41T80=3Dm
> # CONFIG_RTC_DRV_M41T80_WDT is not set
> CONFIG_RTC_DRV_BQ32K=3Dm
> CONFIG_RTC_DRV_RC5T619=3Dm
> CONFIG_RTC_DRV_S35390A=3Dm
> CONFIG_RTC_DRV_FM3130=3Dm
> # CONFIG_RTC_DRV_RX8010 is not set
> CONFIG_RTC_DRV_RX8581=3Dm
> # CONFIG_RTC_DRV_RX8025 is not set
> # CONFIG_RTC_DRV_EM3027 is not set
> CONFIG_RTC_DRV_RV3028=3Dm
> CONFIG_RTC_DRV_RV3032=3Dm
> CONFIG_RTC_DRV_RV8803=3Dm
> CONFIG_RTC_DRV_SD3078=3Dm
> =

> #
> # SPI RTC drivers
> #
> CONFIG_RTC_I2C_AND_SPI=3Dm
> =

> #
> # SPI and I2C RTC drivers
> #
> CONFIG_RTC_DRV_DS3232=3Dm
> # CONFIG_RTC_DRV_DS3232_HWMON is not set
> CONFIG_RTC_DRV_PCF2127=3Dm
> CONFIG_RTC_DRV_RV3029C2=3Dm
> # CONFIG_RTC_DRV_RV3029_HWMON is not set
> CONFIG_RTC_DRV_RX6110=3Dm
> =

> #
> # Platform RTC drivers
> #
> CONFIG_RTC_DRV_CMOS=3Dy
> CONFIG_RTC_DRV_DS1286=3Dm
> CONFIG_RTC_DRV_DS1511=3Dm
> CONFIG_RTC_DRV_DS1553=3Dy
> # CONFIG_RTC_DRV_DS1685_FAMILY is not set
> CONFIG_RTC_DRV_DS1742=3Dy
> CONFIG_RTC_DRV_DS2404=3Dy
> CONFIG_RTC_DRV_DA9063=3Dm
> CONFIG_RTC_DRV_STK17TA8=3Dy
> # CONFIG_RTC_DRV_M48T86 is not set
> CONFIG_RTC_DRV_M48T35=3Dm
> CONFIG_RTC_DRV_M48T59=3Dm
> # CONFIG_RTC_DRV_MSM6242 is not set
> # CONFIG_RTC_DRV_BQ4802 is not set
> CONFIG_RTC_DRV_RP5C01=3Dm
> CONFIG_RTC_DRV_V3020=3Dy
> # CONFIG_RTC_DRV_PCF50633 is not set
> CONFIG_RTC_DRV_ZYNQMP=3Dy
> CONFIG_RTC_DRV_NTXEC=3Dm
> =

> #
> # on-CPU RTC drivers
> #
> CONFIG_RTC_DRV_CADENCE=3Dy
> CONFIG_RTC_DRV_FTRTC010=3Dy
> # CONFIG_RTC_DRV_MC13XXX is not set
> # CONFIG_RTC_DRV_R7301 is not set
> =

> #
> # HID Sensor RTC drivers
> #
> CONFIG_RTC_DRV_GOLDFISH=3Dy
> # CONFIG_DMADEVICES is not set
> =

> #
> # DMABUF options
> #
> CONFIG_SYNC_FILE=3Dy
> # CONFIG_SW_SYNC is not set
> # CONFIG_UDMABUF is not set
> # CONFIG_DMABUF_MOVE_NOTIFY is not set
> # CONFIG_DMABUF_DEBUG is not set
> # CONFIG_DMABUF_SELFTESTS is not set
> # CONFIG_DMABUF_HEAPS is not set
> CONFIG_DMABUF_SYSFS_STATS=3Dy
> # end of DMABUF options
> =

> # CONFIG_AUXDISPLAY is not set
> # CONFIG_PANEL is not set
> CONFIG_UIO=3Dm
> CONFIG_UIO_CIF=3Dm
> # CONFIG_UIO_PDRV_GENIRQ is not set
> CONFIG_UIO_DMEM_GENIRQ=3Dm
> # CONFIG_UIO_AEC is not set
> # CONFIG_UIO_SERCOS3 is not set
> # CONFIG_UIO_PCI_GENERIC is not set
> # CONFIG_UIO_NETX is not set
> CONFIG_UIO_PRUSS=3Dm
> CONFIG_UIO_MF624=3Dm
> CONFIG_VFIO=3Dy
> CONFIG_VFIO_IOMMU_TYPE1=3Dy
> CONFIG_VFIO_NOIOMMU=3Dy
> CONFIG_VFIO_PCI_MMAP=3Dy
> CONFIG_VFIO_PCI_INTX=3Dy
> # CONFIG_VFIO_PCI is not set
> CONFIG_VFIO_MDEV=3Dm
> # CONFIG_VIRT_DRIVERS is not set
> CONFIG_VIRTIO=3Dy
> CONFIG_VIRTIO_PCI_LIB=3Dm
> CONFIG_VIRTIO_PCI_LIB_LEGACY=3Dm
> CONFIG_VIRTIO_MENU=3Dy
> CONFIG_VIRTIO_PCI=3Dm
> CONFIG_VIRTIO_PCI_LEGACY=3Dy
> CONFIG_VIRTIO_VDPA=3Dm
> CONFIG_VIRTIO_BALLOON=3Dy
> CONFIG_VIRTIO_INPUT=3Dm
> CONFIG_VIRTIO_MMIO=3Dy
> # CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES is not set
> CONFIG_VDPA=3Dy
> CONFIG_VDPA_SIM=3Dy
> # CONFIG_VDPA_SIM_NET is not set
> CONFIG_VDPA_SIM_BLOCK=3Dy
> CONFIG_VDPA_USER=3Dm
> CONFIG_VHOST_IOTLB=3Dy
> CONFIG_VHOST_RING=3Dy
> # CONFIG_VHOST_MENU is not set
> =

> #
> # Microsoft Hyper-V guest support
> #
> # CONFIG_HYPERV is not set
> # end of Microsoft Hyper-V guest support
> =

> # CONFIG_GREYBUS is not set
> CONFIG_COMEDI=3Dy
> CONFIG_COMEDI_DEBUG=3Dy
> CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=3D2048
> CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=3D20480
> CONFIG_COMEDI_MISC_DRIVERS=3Dy
> CONFIG_COMEDI_BOND=3Dm
> # CONFIG_COMEDI_TEST is not set
> CONFIG_COMEDI_PARPORT=3Dm
> # CONFIG_COMEDI_ISA_DRIVERS is not set
> # CONFIG_COMEDI_PCI_DRIVERS is not set
> CONFIG_COMEDI_PCMCIA_DRIVERS=3Dm
> CONFIG_COMEDI_CB_DAS16_CS=3Dm
> CONFIG_COMEDI_DAS08_CS=3Dm
> CONFIG_COMEDI_NI_DAQ_700_CS=3Dm
> CONFIG_COMEDI_NI_DAQ_DIO24_CS=3Dm
> CONFIG_COMEDI_NI_LABPC_CS=3Dm
> CONFIG_COMEDI_NI_MIO_CS=3Dm
> # CONFIG_COMEDI_QUATECH_DAQP_CS is not set
> CONFIG_COMEDI_USB_DRIVERS=3Dy
> # CONFIG_COMEDI_DT9812 is not set
> # CONFIG_COMEDI_NI_USB6501 is not set
> CONFIG_COMEDI_USBDUX=3Dy
> CONFIG_COMEDI_USBDUXFAST=3Dy
> CONFIG_COMEDI_USBDUXSIGMA=3Dy
> CONFIG_COMEDI_VMK80XX=3Dy
> CONFIG_COMEDI_8254=3Dm
> CONFIG_COMEDI_8255=3Dy
> CONFIG_COMEDI_8255_SA=3Dy
> CONFIG_COMEDI_KCOMEDILIB=3Dm
> CONFIG_COMEDI_DAS08=3Dm
> CONFIG_COMEDI_NI_LABPC=3Dm
> CONFIG_COMEDI_NI_TIO=3Dm
> CONFIG_COMEDI_NI_ROUTING=3Dm
> # CONFIG_COMEDI_TESTS is not set
> CONFIG_STAGING=3Dy
> # CONFIG_RTL8192U is not set
> # CONFIG_RTLLIB is not set
> CONFIG_STAGING_MEDIA=3Dy
> =

> #
> # Android
> #
> CONFIG_ASHMEM=3Dy
> # end of Android
> =

> # CONFIG_STAGING_BOARD is not set
> CONFIG_LTE_GDM724X=3Dm
> # CONFIG_FIREWIRE_SERIAL is not set
> # CONFIG_GS_FPGABOOT is not set
> CONFIG_UNISYSSPAR=3Dy
> # CONFIG_UNISYS_VISORNIC is not set
> # CONFIG_UNISYS_VISORINPUT is not set
> CONFIG_COMMON_CLK_XLNX_CLKWZRD=3Dy
> CONFIG_MOST_COMPONENTS=3Dy
> CONFIG_MOST_NET=3Dy
> CONFIG_MOST_DIM2=3Dy
> # CONFIG_MOST_I2C is not set
> CONFIG_XIL_AXIS_FIFO=3Dm
> CONFIG_FIELDBUS_DEV=3Dm
> CONFIG_HMS_ANYBUSS_BUS=3Dm
> CONFIG_ARCX_ANYBUS_CONTROLLER=3Dm
> CONFIG_HMS_PROFINET=3Dm
> # CONFIG_QLGE is not set
> CONFIG_X86_PLATFORM_DEVICES=3Dy
> # CONFIG_ACPI_WMI is not set
> CONFIG_ACERHDF=3Dm
> CONFIG_ACER_WIRELESS=3Dm
> # CONFIG_AMD_PMC is not set
> CONFIG_ADV_SWBUTTON=3Dm
> # CONFIG_APPLE_GMUX is not set
> # CONFIG_ASUS_LAPTOP is not set
> CONFIG_ASUS_WIRELESS=3Dm
> # CONFIG_ASUS_TF103C_DOCK is not set
> CONFIG_MERAKI_MX100=3Dy
> # CONFIG_EEEPC_LAPTOP is not set
> CONFIG_X86_PLATFORM_DRIVERS_DELL=3Dy
> CONFIG_DCDBAS=3Dm
> # CONFIG_DELL_RBU is not set
> CONFIG_DELL_RBTN=3Dy
> CONFIG_DELL_SMBIOS=3Dm
> CONFIG_DELL_SMBIOS_SMM=3Dy
> CONFIG_DELL_SMO8800=3Dm
> # CONFIG_AMILO_RFKILL is not set
> # CONFIG_FUJITSU_LAPTOP is not set
> CONFIG_FUJITSU_TABLET=3Dm
> # CONFIG_GPD_POCKET_FAN is not set
> # CONFIG_HP_ACCEL is not set
> # CONFIG_WIRELESS_HOTKEY is not set
> CONFIG_IBM_RTL=3Dm
> # CONFIG_IDEAPAD_LAPTOP is not set
> # CONFIG_SENSORS_HDAPS is not set
> # CONFIG_INTEL_ATOMISP2_LED is not set
> # CONFIG_INTEL_ATOMISP2_PM is not set
> # CONFIG_INTEL_SAR_INT1092 is not set
> # CONFIG_INTEL_SKL_INT3472 is not set
> # CONFIG_INTEL_PMC_CORE is not set
> =

> #
> # Intel Speed Select Technology interface support
> #
> # CONFIG_INTEL_SPEED_SELECT_INTERFACE is not set
> # end of Intel Speed Select Technology interface support
> =

> # CONFIG_INTEL_HID_EVENT is not set
> # CONFIG_INTEL_VBTN is not set
> # CONFIG_INTEL_OAKTRAIL is not set
> # CONFIG_INTEL_ISHTP_ECLITE is not set
> # CONFIG_INTEL_MRFLD_PWRBTN is not set
> # CONFIG_INTEL_PUNIT_IPC is not set
> # CONFIG_INTEL_RST is not set
> # CONFIG_INTEL_SMARTCONNECT is not set
> # CONFIG_INTEL_TURBO_MAX_3 is not set
> # CONFIG_INTEL_UNCORE_FREQ_CONTROL is not set
> # CONFIG_INTEL_VSEC is not set
> # CONFIG_MSI_LAPTOP is not set
> # CONFIG_PCENGINES_APU2 is not set
> # CONFIG_BARCO_P50_GPIO is not set
> # CONFIG_SAMSUNG_LAPTOP is not set
> CONFIG_SAMSUNG_Q10=3Dm
> # CONFIG_TOSHIBA_BT_RFKILL is not set
> CONFIG_TOSHIBA_HAPS=3Dm
> CONFIG_ACPI_CMPC=3Dy
> # CONFIG_COMPAL_LAPTOP is not set
> CONFIG_PANASONIC_LAPTOP=3Dm
> CONFIG_SONY_LAPTOP=3Dm
> # CONFIG_SONYPI_COMPAT is not set
> # CONFIG_SYSTEM76_ACPI is not set
> # CONFIG_TOPSTAR_LAPTOP is not set
> CONFIG_I2C_MULTI_INSTANTIATE=3Dm
> # CONFIG_MLX_PLATFORM is not set
> CONFIG_INTEL_IPS=3Dy
> CONFIG_INTEL_SCU_IPC=3Dy
> CONFIG_INTEL_SCU=3Dy
> CONFIG_INTEL_SCU_PCI=3Dy
> CONFIG_INTEL_SCU_PLATFORM=3Dm
> # CONFIG_INTEL_SCU_IPC_UTIL is not set
> # CONFIG_SIEMENS_SIMATIC_IPC is not set
> CONFIG_PMC_ATOM=3Dy
> CONFIG_GOLDFISH_PIPE=3Dm
> # CONFIG_CHROME_PLATFORMS is not set
> # CONFIG_MELLANOX_PLATFORM is not set
> # CONFIG_SURFACE_PLATFORMS is not set
> CONFIG_HAVE_CLK=3Dy
> CONFIG_HAVE_CLK_PREPARE=3Dy
> CONFIG_COMMON_CLK=3Dy
> CONFIG_COMMON_CLK_MAX77686=3Dm
> CONFIG_COMMON_CLK_MAX9485=3Dm
> CONFIG_COMMON_CLK_RK808=3Dm
> # CONFIG_COMMON_CLK_SI5341 is not set
> CONFIG_COMMON_CLK_SI5351=3Dm
> # CONFIG_COMMON_CLK_SI514 is not set
> CONFIG_COMMON_CLK_SI544=3Dm
> CONFIG_COMMON_CLK_SI570=3Dm
> CONFIG_COMMON_CLK_CDCE706=3Dm
> # CONFIG_COMMON_CLK_CDCE925 is not set
> CONFIG_COMMON_CLK_CS2000_CP=3Dm
> # CONFIG_COMMON_CLK_LAN966X is not set
> # CONFIG_COMMON_CLK_AXI_CLKGEN is not set
> CONFIG_COMMON_CLK_VC5=3Dm
> # CONFIG_COMMON_CLK_FIXED_MMIO is not set
> CONFIG_CLK_LGM_CGU=3Dy
> CONFIG_XILINX_VCU=3Dm
> CONFIG_HWSPINLOCK=3Dy
> =

> #
> # Clock Source drivers
> #
> CONFIG_TIMER_OF=3Dy
> CONFIG_TIMER_PROBE=3Dy
> CONFIG_CLKEVT_I8253=3Dy
> CONFIG_CLKBLD_I8253=3Dy
> CONFIG_CLKSRC_MMIO=3Dy
> CONFIG_MICROCHIP_PIT64B=3Dy
> # end of Clock Source drivers
> =

> CONFIG_MAILBOX=3Dy
> CONFIG_PLATFORM_MHU=3Dm
> CONFIG_PCC=3Dy
> # CONFIG_ALTERA_MBOX is not set
> # CONFIG_MAILBOX_TEST is not set
> CONFIG_IOMMU_IOVA=3Dy
> CONFIG_IOMMU_API=3Dy
> # CONFIG_IOMMU_SUPPORT is not set
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
> # CONFIG_RPMSG_QCOM_GLINK_RPM is not set
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
> # CONFIG_LITEX_SOC_CONTROLLER is not set
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
> # CONFIG_DEVFREQ_GOV_PERFORMANCE is not set
> # CONFIG_DEVFREQ_GOV_POWERSAVE is not set
> CONFIG_DEVFREQ_GOV_USERSPACE=3Dm
> # CONFIG_DEVFREQ_GOV_PASSIVE is not set
> =

> #
> # DEVFREQ Drivers
> #
> CONFIG_PM_DEVFREQ_EVENT=3Dy
> CONFIG_EXTCON=3Dy
> =

> #
> # Extcon Device Drivers
> #
> CONFIG_EXTCON_FSA9480=3Dm
> # CONFIG_EXTCON_GPIO is not set
> CONFIG_EXTCON_INTEL_INT3496=3Dy
> CONFIG_EXTCON_INTEL_MRFLD=3Dm
> CONFIG_EXTCON_MAX14577=3Dm
> # CONFIG_EXTCON_MAX3355 is not set
> CONFIG_EXTCON_MAX77693=3Dm
> CONFIG_EXTCON_PTN5150=3Dm
> CONFIG_EXTCON_RT8973A=3Dm
> # CONFIG_EXTCON_SM5502 is not set
> CONFIG_EXTCON_USB_GPIO=3Dy
> CONFIG_EXTCON_USBC_TUSB320=3Dm
> # CONFIG_MEMORY is not set
> # CONFIG_IIO is not set
> CONFIG_NTB=3Dm
> CONFIG_NTB_AMD=3Dm
> # CONFIG_NTB_IDT is not set
> CONFIG_NTB_INTEL=3Dm
> CONFIG_NTB_EPF=3Dm
> CONFIG_NTB_SWITCHTEC=3Dm
> CONFIG_NTB_PINGPONG=3Dm
> CONFIG_NTB_TOOL=3Dm
> CONFIG_NTB_PERF=3Dm
> CONFIG_NTB_TRANSPORT=3Dm
> # CONFIG_VME_BUS is not set
> # CONFIG_PWM is not set
> =

> #
> # IRQ chip support
> #
> CONFIG_IRQCHIP=3Dy
> CONFIG_AL_FIC=3Dy
> # end of IRQ chip support
> =

> # CONFIG_IPACK_BUS is not set
> CONFIG_RESET_CONTROLLER=3Dy
> # CONFIG_RESET_INTEL_GW is not set
> CONFIG_RESET_TI_SYSCON=3Dy
> =

> #
> # PHY Subsystem
> #
> CONFIG_GENERIC_PHY=3Dy
> CONFIG_GENERIC_PHY_MIPI_DPHY=3Dy
> CONFIG_USB_LGM_PHY=3Dm
> CONFIG_PHY_CAN_TRANSCEIVER=3Dm
> =

> #
> # PHY drivers for Broadcom platforms
> #
> # CONFIG_BCM_KONA_USB2_PHY is not set
> # end of PHY drivers for Broadcom platforms
> =

> CONFIG_PHY_CADENCE_TORRENT=3Dm
> CONFIG_PHY_CADENCE_DPHY=3Dy
> CONFIG_PHY_CADENCE_SIERRA=3Dm
> CONFIG_PHY_CADENCE_SALVO=3Dy
> CONFIG_PHY_FSL_IMX8MQ_USB=3Dy
> # CONFIG_PHY_MIXEL_MIPI_DPHY is not set
> # CONFIG_PHY_FSL_IMX8M_PCIE is not set
> CONFIG_PHY_PXA_28NM_HSIC=3Dy
> CONFIG_PHY_PXA_28NM_USB2=3Dy
> # CONFIG_PHY_LAN966X_SERDES is not set
> CONFIG_PHY_MAPPHONE_MDM6600=3Dm
> CONFIG_PHY_OCELOT_SERDES=3Dy
> CONFIG_PHY_QCOM_USB_HS=3Dm
> # CONFIG_PHY_QCOM_USB_HSIC is not set
> CONFIG_PHY_SAMSUNG_USB2=3Dm
> # CONFIG_PHY_TUSB1210 is not set
> # CONFIG_PHY_INTEL_LGM_COMBO is not set
> # CONFIG_PHY_INTEL_LGM_EMMC is not set
> # end of PHY Subsystem
> =

> CONFIG_POWERCAP=3Dy
> CONFIG_INTEL_RAPL_CORE=3Dm
> CONFIG_INTEL_RAPL=3Dm
> CONFIG_IDLE_INJECT=3Dy
> # CONFIG_DTPM is not set
> # CONFIG_MCB is not set
> =

> #
> # Performance monitor support
> #
> # end of Performance monitor support
> =

> # CONFIG_RAS is not set
> CONFIG_USB4=3Dy
> CONFIG_USB4_DEBUGFS_WRITE=3Dy
> # CONFIG_USB4_DMA_TEST is not set
> =

> #
> # Android
> #
> CONFIG_ANDROID=3Dy
> CONFIG_ANDROID_BINDER_IPC=3Dy
> CONFIG_ANDROID_BINDERFS=3Dy
> CONFIG_ANDROID_BINDER_DEVICES=3D"binder,hwbinder,vndbinder"
> # CONFIG_ANDROID_BINDER_IPC_SELFTEST is not set
> # end of Android
> =

> # CONFIG_DAX is not set
> CONFIG_NVMEM=3Dy
> CONFIG_NVMEM_SYSFS=3Dy
> # CONFIG_NVMEM_RMEM is not set
> =

> #
> # HW tracing support
> #
> CONFIG_STM=3Dm
> # CONFIG_STM_PROTO_BASIC is not set
> CONFIG_STM_PROTO_SYS_T=3Dm
> # CONFIG_STM_DUMMY is not set
> CONFIG_STM_SOURCE_CONSOLE=3Dm
> CONFIG_STM_SOURCE_HEARTBEAT=3Dm
> # CONFIG_STM_SOURCE_FTRACE is not set
> CONFIG_INTEL_TH=3Dm
> # CONFIG_INTEL_TH_PCI is not set
> CONFIG_INTEL_TH_ACPI=3Dm
> CONFIG_INTEL_TH_GTH=3Dm
> CONFIG_INTEL_TH_STH=3Dm
> # CONFIG_INTEL_TH_MSU is not set
> CONFIG_INTEL_TH_PTI=3Dm
> CONFIG_INTEL_TH_DEBUG=3Dy
> # end of HW tracing support
> =

> CONFIG_FPGA=3Dm
> CONFIG_ALTERA_PR_IP_CORE=3Dm
> CONFIG_ALTERA_PR_IP_CORE_PLAT=3Dm
> CONFIG_FPGA_MGR_ALTERA_CVP=3Dm
> CONFIG_FPGA_BRIDGE=3Dm
> CONFIG_ALTERA_FREEZE_BRIDGE=3Dm
> CONFIG_XILINX_PR_DECOUPLER=3Dm
> CONFIG_FPGA_REGION=3Dm
> CONFIG_OF_FPGA_REGION=3Dm
> # CONFIG_FPGA_DFL is not set
> CONFIG_FSI=3Dy
> CONFIG_FSI_NEW_DEV_NODE=3Dy
> CONFIG_FSI_MASTER_GPIO=3Dy
> # CONFIG_FSI_MASTER_HUB is not set
> CONFIG_FSI_MASTER_ASPEED=3Dy
> # CONFIG_FSI_SCOM is not set
> CONFIG_FSI_SBEFIFO=3Dm
> CONFIG_FSI_OCC=3Dm
> CONFIG_PM_OPP=3Dy
> CONFIG_UNISYS_VISORBUS=3Dy
> # CONFIG_SIOX is not set
> CONFIG_SLIMBUS=3Dy
> # CONFIG_SLIM_QCOM_CTRL is not set
> CONFIG_INTERCONNECT=3Dy
> CONFIG_COUNTER=3Dm
> # CONFIG_104_QUAD_8 is not set
> CONFIG_INTERRUPT_CNT=3Dm
> CONFIG_FTM_QUADDEC=3Dm
> # CONFIG_MICROCHIP_TCB_CAPTURE is not set
> CONFIG_INTEL_QEP=3Dm
> CONFIG_MOST=3Dy
> CONFIG_MOST_USB_HDM=3Dy
> CONFIG_MOST_CDEV=3Dm
> # end of Device Drivers
> =

> #
> # File systems
> #
> CONFIG_DCACHE_WORD_ACCESS=3Dy
> # CONFIG_VALIDATE_FS_PARSER is not set
> # CONFIG_FS_DAX is not set
> CONFIG_EXPORTFS=3Dy
> # CONFIG_EXPORTFS_BLOCK_OPS is not set
> CONFIG_FILE_LOCKING=3Dy
> CONFIG_FS_ENCRYPTION=3Dy
> CONFIG_FS_VERITY=3Dy
> CONFIG_FS_VERITY_DEBUG=3Dy
> # CONFIG_FS_VERITY_BUILTIN_SIGNATURES is not set
> CONFIG_FSNOTIFY=3Dy
> CONFIG_DNOTIFY=3Dy
> CONFIG_INOTIFY_USER=3Dy
> CONFIG_FANOTIFY=3Dy
> # CONFIG_FANOTIFY_ACCESS_PERMISSIONS is not set
> # CONFIG_QUOTA is not set
> # CONFIG_AUTOFS4_FS is not set
> CONFIG_AUTOFS_FS=3Dm
> # CONFIG_FUSE_FS is not set
> CONFIG_OVERLAY_FS=3Dm
> CONFIG_OVERLAY_FS_REDIRECT_DIR=3Dy
> CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW=3Dy
> # CONFIG_OVERLAY_FS_INDEX is not set
> # CONFIG_OVERLAY_FS_XINO_AUTO is not set
> CONFIG_OVERLAY_FS_METACOPY=3Dy
> =

> #
> # Caches
> #
> # CONFIG_FSCACHE is not set
> # end of Caches
> =

> #
> # Pseudo filesystems
> #
> CONFIG_PROC_FS=3Dy
> # CONFIG_PROC_KCORE is not set
> CONFIG_PROC_VMCORE=3Dy
> # CONFIG_PROC_VMCORE_DEVICE_DUMP is not set
> CONFIG_PROC_SYSCTL=3Dy
> CONFIG_PROC_PAGE_MONITOR=3Dy
> # CONFIG_PROC_CHILDREN is not set
> CONFIG_PROC_PID_ARCH_STATUS=3Dy
> CONFIG_PROC_CPU_RESCTRL=3Dy
> CONFIG_KERNFS=3Dy
> CONFIG_SYSFS=3Dy
> CONFIG_TMPFS=3Dy
> # CONFIG_TMPFS_POSIX_ACL is not set
> # CONFIG_TMPFS_XATTR is not set
> # CONFIG_TMPFS_INODE64 is not set
> CONFIG_HUGETLBFS=3Dy
> CONFIG_HUGETLB_PAGE=3Dy
> CONFIG_HUGETLB_PAGE_FREE_VMEMMAP=3Dy
> CONFIG_HUGETLB_PAGE_FREE_VMEMMAP_DEFAULT_ON=3Dy
> CONFIG_MEMFD_CREATE=3Dy
> CONFIG_ARCH_HAS_GIGANTIC_PAGE=3Dy
> CONFIG_CONFIGFS_FS=3Dy
> # end of Pseudo filesystems
> =

> # CONFIG_MISC_FILESYSTEMS is not set
> # CONFIG_NETWORK_FILESYSTEMS is not set
> CONFIG_NLS=3Dy
> CONFIG_NLS_DEFAULT=3D"iso8859-1"
> # CONFIG_NLS_CODEPAGE_437 is not set
> # CONFIG_NLS_CODEPAGE_737 is not set
> CONFIG_NLS_CODEPAGE_775=3Dm
> # CONFIG_NLS_CODEPAGE_850 is not set
> CONFIG_NLS_CODEPAGE_852=3Dy
> # CONFIG_NLS_CODEPAGE_855 is not set
> # CONFIG_NLS_CODEPAGE_857 is not set
> CONFIG_NLS_CODEPAGE_860=3Dy
> CONFIG_NLS_CODEPAGE_861=3Dm
> # CONFIG_NLS_CODEPAGE_862 is not set
> CONFIG_NLS_CODEPAGE_863=3Dy
> CONFIG_NLS_CODEPAGE_864=3Dm
> CONFIG_NLS_CODEPAGE_865=3Dm
> # CONFIG_NLS_CODEPAGE_866 is not set
> # CONFIG_NLS_CODEPAGE_869 is not set
> # CONFIG_NLS_CODEPAGE_936 is not set
> # CONFIG_NLS_CODEPAGE_950 is not set
> # CONFIG_NLS_CODEPAGE_932 is not set
> # CONFIG_NLS_CODEPAGE_949 is not set
> # CONFIG_NLS_CODEPAGE_874 is not set
> CONFIG_NLS_ISO8859_8=3Dm
> CONFIG_NLS_CODEPAGE_1250=3Dy
> CONFIG_NLS_CODEPAGE_1251=3Dy
> # CONFIG_NLS_ASCII is not set
> # CONFIG_NLS_ISO8859_1 is not set
> CONFIG_NLS_ISO8859_2=3Dm
> # CONFIG_NLS_ISO8859_3 is not set
> # CONFIG_NLS_ISO8859_4 is not set
> CONFIG_NLS_ISO8859_5=3Dy
> CONFIG_NLS_ISO8859_6=3Dy
> CONFIG_NLS_ISO8859_7=3Dy
> CONFIG_NLS_ISO8859_9=3Dy
> CONFIG_NLS_ISO8859_13=3Dm
> CONFIG_NLS_ISO8859_14=3Dy
> CONFIG_NLS_ISO8859_15=3Dy
> # CONFIG_NLS_KOI8_R is not set
> CONFIG_NLS_KOI8_U=3Dy
> CONFIG_NLS_MAC_ROMAN=3Dm
> CONFIG_NLS_MAC_CELTIC=3Dm
> CONFIG_NLS_MAC_CENTEURO=3Dy
> CONFIG_NLS_MAC_CROATIAN=3Dm
> # CONFIG_NLS_MAC_CYRILLIC is not set
> CONFIG_NLS_MAC_GAELIC=3Dm
> CONFIG_NLS_MAC_GREEK=3Dm
> CONFIG_NLS_MAC_ICELAND=3Dy
> # CONFIG_NLS_MAC_INUIT is not set
> CONFIG_NLS_MAC_ROMANIAN=3Dy
> CONFIG_NLS_MAC_TURKISH=3Dy
> # CONFIG_NLS_UTF8 is not set
> # CONFIG_DLM is not set
> CONFIG_UNICODE=3Dy
> CONFIG_UNICODE_UTF8_DATA=3Dy
> # CONFIG_UNICODE_NORMALIZATION_SELFTEST is not set
> CONFIG_IO_WQ=3Dy
> # end of File systems
> =

> #
> # Security options
> #
> CONFIG_KEYS=3Dy
> # CONFIG_KEYS_REQUEST_CACHE is not set
> # CONFIG_PERSISTENT_KEYRINGS is not set
> CONFIG_TRUSTED_KEYS=3Dm
> CONFIG_ENCRYPTED_KEYS=3Dy
> # CONFIG_KEY_DH_OPERATIONS is not set
> CONFIG_SECURITY_DMESG_RESTRICT=3Dy
> CONFIG_SECURITY=3Dy
> CONFIG_SECURITYFS=3Dy
> CONFIG_SECURITY_NETWORK=3Dy
> # CONFIG_PAGE_TABLE_ISOLATION is not set
> CONFIG_SECURITY_PATH=3Dy
> CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=3Dy
> # CONFIG_HARDENED_USERCOPY is not set
> CONFIG_FORTIFY_SOURCE=3Dy
> # CONFIG_STATIC_USERMODEHELPER is not set
> # CONFIG_SECURITY_SELINUX is not set
> # CONFIG_SECURITY_SMACK is not set
> # CONFIG_SECURITY_TOMOYO is not set
> CONFIG_SECURITY_APPARMOR=3Dy
> # CONFIG_SECURITY_APPARMOR_HASH is not set
> CONFIG_SECURITY_APPARMOR_DEBUG=3Dy
> # CONFIG_SECURITY_APPARMOR_DEBUG_ASSERTS is not set
> # CONFIG_SECURITY_APPARMOR_DEBUG_MESSAGES is not set
> CONFIG_SECURITY_YAMA=3Dy
> # CONFIG_SECURITY_SAFESETID is not set
> # CONFIG_SECURITY_LOCKDOWN_LSM is not set
> CONFIG_SECURITY_LANDLOCK=3Dy
> # CONFIG_INTEGRITY is not set
> # CONFIG_DEFAULT_SECURITY_APPARMOR is not set
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
> CONFIG_INIT_ON_ALLOC_DEFAULT_ON=3Dy
> CONFIG_INIT_ON_FREE_DEFAULT_ON=3Dy
> # end of Memory initialization
> # end of Kernel hardening options
> # end of Security options
> =

> CONFIG_XOR_BLOCKS=3Dy
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
> CONFIG_CRYPTO_USER=3Dm
> CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
> CONFIG_CRYPTO_GF128MUL=3Dy
> CONFIG_CRYPTO_NULL=3Dy
> CONFIG_CRYPTO_NULL2=3Dy
> # CONFIG_CRYPTO_PCRYPT is not set
> CONFIG_CRYPTO_CRYPTD=3Dy
> CONFIG_CRYPTO_AUTHENC=3Dy
> # CONFIG_CRYPTO_TEST is not set
> CONFIG_CRYPTO_SIMD=3Dy
> CONFIG_CRYPTO_ENGINE=3Dy
> =

> #
> # Public-key cryptography
> #
> CONFIG_CRYPTO_RSA=3Dy
> CONFIG_CRYPTO_DH=3Dy
> CONFIG_CRYPTO_ECC=3Dy
> CONFIG_CRYPTO_ECDH=3Dy
> CONFIG_CRYPTO_ECDSA=3Dy
> CONFIG_CRYPTO_ECRDSA=3Dy
> CONFIG_CRYPTO_SM2=3Dm
> # CONFIG_CRYPTO_CURVE25519 is not set
> CONFIG_CRYPTO_CURVE25519_X86=3Dm
> =

> #
> # Authenticated Encryption with Associated Data
> #
> CONFIG_CRYPTO_CCM=3Dm
> CONFIG_CRYPTO_GCM=3Dy
> CONFIG_CRYPTO_CHACHA20POLY1305=3Dm
> # CONFIG_CRYPTO_AEGIS128 is not set
> # CONFIG_CRYPTO_AEGIS128_AESNI_SSE2 is not set
> CONFIG_CRYPTO_SEQIV=3Dy
> CONFIG_CRYPTO_ECHAINIV=3Dy
> =

> #
> # Block modes
> #
> CONFIG_CRYPTO_CBC=3Dy
> # CONFIG_CRYPTO_CFB is not set
> CONFIG_CRYPTO_CTR=3Dy
> CONFIG_CRYPTO_CTS=3Dy
> CONFIG_CRYPTO_ECB=3Dy
> CONFIG_CRYPTO_LRW=3Dy
> # CONFIG_CRYPTO_OFB is not set
> CONFIG_CRYPTO_PCBC=3Dm
> # CONFIG_CRYPTO_XTS is not set
> # CONFIG_CRYPTO_KEYWRAP is not set
> CONFIG_CRYPTO_NHPOLY1305=3Dy
> CONFIG_CRYPTO_NHPOLY1305_SSE2=3Dm
> CONFIG_CRYPTO_NHPOLY1305_AVX2=3Dy
> CONFIG_CRYPTO_ADIANTUM=3Dm
> CONFIG_CRYPTO_ESSIV=3Dm
> =

> #
> # Hash modes
> #
> CONFIG_CRYPTO_CMAC=3Dm
> CONFIG_CRYPTO_HMAC=3Dy
> # CONFIG_CRYPTO_XCBC is not set
> CONFIG_CRYPTO_VMAC=3Dy
> =

> #
> # Digest
> #
> CONFIG_CRYPTO_CRC32C=3Dy
> CONFIG_CRYPTO_CRC32C_INTEL=3Dy
> CONFIG_CRYPTO_CRC32=3Dy
> # CONFIG_CRYPTO_CRC32_PCLMUL is not set
> CONFIG_CRYPTO_XXHASH=3Dm
> CONFIG_CRYPTO_BLAKE2B=3Dy
> # CONFIG_CRYPTO_BLAKE2S is not set
> # CONFIG_CRYPTO_BLAKE2S_X86 is not set
> CONFIG_CRYPTO_CRCT10DIF=3Dy
> # CONFIG_CRYPTO_CRCT10DIF_PCLMUL is not set
> CONFIG_CRYPTO_GHASH=3Dy
> CONFIG_CRYPTO_POLY1305=3Dm
> CONFIG_CRYPTO_POLY1305_X86_64=3Dy
> CONFIG_CRYPTO_MD4=3Dm
> CONFIG_CRYPTO_MD5=3Dy
> # CONFIG_CRYPTO_MICHAEL_MIC is not set
> # CONFIG_CRYPTO_RMD160 is not set
> CONFIG_CRYPTO_SHA1=3Dy
> CONFIG_CRYPTO_SHA1_SSSE3=3Dm
> CONFIG_CRYPTO_SHA256_SSSE3=3Dy
> # CONFIG_CRYPTO_SHA512_SSSE3 is not set
> CONFIG_CRYPTO_SHA256=3Dy
> CONFIG_CRYPTO_SHA512=3Dy
> # CONFIG_CRYPTO_SHA3 is not set
> CONFIG_CRYPTO_SM3=3Dm
> CONFIG_CRYPTO_STREEBOG=3Dy
> CONFIG_CRYPTO_WP512=3Dm
> CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL=3Dm
> =

> #
> # Ciphers
> #
> CONFIG_CRYPTO_AES=3Dy
> CONFIG_CRYPTO_AES_TI=3Dm
> CONFIG_CRYPTO_AES_NI_INTEL=3Dm
> CONFIG_CRYPTO_BLOWFISH=3Dm
> CONFIG_CRYPTO_BLOWFISH_COMMON=3Dm
> CONFIG_CRYPTO_BLOWFISH_X86_64=3Dm
> CONFIG_CRYPTO_CAMELLIA=3Dm
> CONFIG_CRYPTO_CAMELLIA_X86_64=3Dy
> CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=3Dm
> # CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64 is not set
> CONFIG_CRYPTO_CAST_COMMON=3Dy
> CONFIG_CRYPTO_CAST5=3Dy
> CONFIG_CRYPTO_CAST5_AVX_X86_64=3Dy
> CONFIG_CRYPTO_CAST6=3Dy
> # CONFIG_CRYPTO_CAST6_AVX_X86_64 is not set
> CONFIG_CRYPTO_DES=3Dy
> CONFIG_CRYPTO_DES3_EDE_X86_64=3Dy
> # CONFIG_CRYPTO_FCRYPT is not set
> CONFIG_CRYPTO_CHACHA20=3Dy
> # CONFIG_CRYPTO_CHACHA20_X86_64 is not set
> CONFIG_CRYPTO_SERPENT=3Dm
> # CONFIG_CRYPTO_SERPENT_SSE2_X86_64 is not set
> CONFIG_CRYPTO_SERPENT_AVX_X86_64=3Dm
> CONFIG_CRYPTO_SERPENT_AVX2_X86_64=3Dm
> # CONFIG_CRYPTO_SM4 is not set
> CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64=3Dy
> CONFIG_CRYPTO_SM4_AESNI_AVX2_X86_64=3Dy
> # CONFIG_CRYPTO_TWOFISH is not set
> CONFIG_CRYPTO_TWOFISH_COMMON=3Dy
> CONFIG_CRYPTO_TWOFISH_X86_64=3Dy
> CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=3Dy
> # CONFIG_CRYPTO_TWOFISH_AVX_X86_64 is not set
> =

> #
> # Compression
> #
> CONFIG_CRYPTO_DEFLATE=3Dy
> CONFIG_CRYPTO_LZO=3Dy
> CONFIG_CRYPTO_842=3Dy
> # CONFIG_CRYPTO_LZ4 is not set
> # CONFIG_CRYPTO_LZ4HC is not set
> CONFIG_CRYPTO_ZSTD=3Dm
> =

> #
> # Random Number Generation
> #
> CONFIG_CRYPTO_ANSI_CPRNG=3Dy
> CONFIG_CRYPTO_DRBG_MENU=3Dy
> CONFIG_CRYPTO_DRBG_HMAC=3Dy
> # CONFIG_CRYPTO_DRBG_HASH is not set
> CONFIG_CRYPTO_DRBG_CTR=3Dy
> CONFIG_CRYPTO_DRBG=3Dy
> CONFIG_CRYPTO_JITTERENTROPY=3Dy
> CONFIG_CRYPTO_USER_API=3Dy
> CONFIG_CRYPTO_USER_API_HASH=3Dy
> CONFIG_CRYPTO_USER_API_SKCIPHER=3Dy
> # CONFIG_CRYPTO_USER_API_RNG is not set
> CONFIG_CRYPTO_USER_API_AEAD=3Dm
> # CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE is not set
> # CONFIG_CRYPTO_STATS is not set
> CONFIG_CRYPTO_HASH_INFO=3Dy
> CONFIG_CRYPTO_HW=3Dy
> CONFIG_CRYPTO_DEV_PADLOCK=3Dy
> # CONFIG_CRYPTO_DEV_PADLOCK_AES is not set
> CONFIG_CRYPTO_DEV_PADLOCK_SHA=3Dm
> CONFIG_CRYPTO_DEV_ATMEL_I2C=3Dm
> CONFIG_CRYPTO_DEV_ATMEL_ECC=3Dm
> # CONFIG_CRYPTO_DEV_ATMEL_SHA204A is not set
> # CONFIG_CRYPTO_DEV_CCP is not set
> CONFIG_CRYPTO_DEV_QAT=3Dy
> CONFIG_CRYPTO_DEV_QAT_DH895xCC=3Dy
> CONFIG_CRYPTO_DEV_QAT_C3XXX=3Dm
> # CONFIG_CRYPTO_DEV_QAT_C62X is not set
> CONFIG_CRYPTO_DEV_QAT_4XXX=3Dy
> CONFIG_CRYPTO_DEV_QAT_DH895xCCVF=3Dm
> CONFIG_CRYPTO_DEV_QAT_C3XXXVF=3Dy
> # CONFIG_CRYPTO_DEV_QAT_C62XVF is not set
> CONFIG_CRYPTO_DEV_VIRTIO=3Dy
> # CONFIG_CRYPTO_DEV_SAFEXCEL is not set
> # CONFIG_CRYPTO_DEV_CCREE is not set
> CONFIG_CRYPTO_DEV_AMLOGIC_GXL=3Dm
> CONFIG_CRYPTO_DEV_AMLOGIC_GXL_DEBUG=3Dy
> CONFIG_ASYMMETRIC_KEY_TYPE=3Dy
> CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=3Dy
> # CONFIG_ASYMMETRIC_TPM_KEY_SUBTYPE is not set
> CONFIG_X509_CERTIFICATE_PARSER=3Dy
> CONFIG_PKCS8_PRIVATE_KEY_PARSER=3Dy
> CONFIG_PKCS7_MESSAGE_PARSER=3Dy
> # CONFIG_PKCS7_TEST_KEY is not set
> CONFIG_SIGNED_PE_FILE_VERIFICATION=3Dy
> =

> #
> # Certificates for signature checking
> #
> CONFIG_MODULE_SIG_KEY=3D"certs/signing_key.pem"
> # CONFIG_MODULE_SIG_KEY_TYPE_RSA is not set
> CONFIG_MODULE_SIG_KEY_TYPE_ECDSA=3Dy
> CONFIG_SYSTEM_TRUSTED_KEYRING=3Dy
> CONFIG_SYSTEM_TRUSTED_KEYS=3D""
> # CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
> # CONFIG_SECONDARY_TRUSTED_KEYRING is not set
> CONFIG_SYSTEM_BLACKLIST_KEYRING=3Dy
> CONFIG_SYSTEM_BLACKLIST_HASH_LIST=3D""
> # CONFIG_SYSTEM_REVOCATION_LIST is not set
> # end of Certificates for signature checking
> =

> CONFIG_BINARY_PRINTF=3Dy
> =

> #
> # Library routines
> #
> CONFIG_LINEAR_RANGES=3Dy
> # CONFIG_PACKING is not set
> CONFIG_BITREVERSE=3Dy
> CONFIG_GENERIC_STRNCPY_FROM_USER=3Dy
> CONFIG_GENERIC_STRNLEN_USER=3Dy
> CONFIG_GENERIC_NET_UTILS=3Dy
> CONFIG_CORDIC=3Dm
> CONFIG_PRIME_NUMBERS=3Dy
> CONFIG_RATIONAL=3Dy
> CONFIG_GENERIC_PCI_IOMAP=3Dy
> CONFIG_GENERIC_IOMAP=3Dy
> CONFIG_ARCH_USE_CMPXCHG_LOCKREF=3Dy
> CONFIG_ARCH_HAS_FAST_MULTIPLIER=3Dy
> CONFIG_ARCH_USE_SYM_ANNOTATIONS=3Dy
> =

> #
> # Crypto library routines
> #
> CONFIG_CRYPTO_LIB_AES=3Dy
> CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=3Dy
> CONFIG_CRYPTO_LIB_CHACHA_GENERIC=3Dy
> # CONFIG_CRYPTO_LIB_CHACHA is not set
> CONFIG_CRYPTO_ARCH_HAVE_LIB_CURVE25519=3Dm
> CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=3Dm
> # CONFIG_CRYPTO_LIB_CURVE25519 is not set
> CONFIG_CRYPTO_LIB_DES=3Dy
> CONFIG_CRYPTO_LIB_POLY1305_RSIZE=3D11
> CONFIG_CRYPTO_ARCH_HAVE_LIB_POLY1305=3Dy
> CONFIG_CRYPTO_LIB_POLY1305_GENERIC=3Dy
> CONFIG_CRYPTO_LIB_POLY1305=3Dm
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
> # CONFIG_CRC32_SELFTEST is not set
> # CONFIG_CRC32_SLICEBY8 is not set
> # CONFIG_CRC32_SLICEBY4 is not set
> # CONFIG_CRC32_SARWATE is not set
> CONFIG_CRC32_BIT=3Dy
> CONFIG_CRC64=3Dm
> CONFIG_CRC4=3Dy
> CONFIG_CRC7=3Dm
> CONFIG_LIBCRC32C=3Dy
> CONFIG_CRC8=3Dy
> CONFIG_XXHASH=3Dy
> # CONFIG_RANDOM32_SELFTEST is not set
> CONFIG_842_COMPRESS=3Dy
> CONFIG_842_DECOMPRESS=3Dy
> CONFIG_ZLIB_INFLATE=3Dy
> CONFIG_ZLIB_DEFLATE=3Dy
> CONFIG_LZO_COMPRESS=3Dy
> CONFIG_LZO_DECOMPRESS=3Dy
> CONFIG_LZ4_DECOMPRESS=3Dy
> CONFIG_ZSTD_COMPRESS=3Dm
> CONFIG_ZSTD_DECOMPRESS=3Dy
> CONFIG_XZ_DEC=3Dy
> CONFIG_XZ_DEC_X86=3Dy
> # CONFIG_XZ_DEC_POWERPC is not set
> # CONFIG_XZ_DEC_IA64 is not set
> # CONFIG_XZ_DEC_ARM is not set
> # CONFIG_XZ_DEC_ARMTHUMB is not set
> # CONFIG_XZ_DEC_SPARC is not set
> # CONFIG_XZ_DEC_MICROLZMA is not set
> CONFIG_XZ_DEC_BCJ=3Dy
> # CONFIG_XZ_DEC_TEST is not set
> CONFIG_DECOMPRESS_GZIP=3Dy
> CONFIG_DECOMPRESS_BZIP2=3Dy
> CONFIG_DECOMPRESS_LZMA=3Dy
> CONFIG_DECOMPRESS_XZ=3Dy
> CONFIG_DECOMPRESS_LZO=3Dy
> CONFIG_DECOMPRESS_LZ4=3Dy
> CONFIG_DECOMPRESS_ZSTD=3Dy
> CONFIG_GENERIC_ALLOCATOR=3Dy
> CONFIG_INTERVAL_TREE=3Dy
> CONFIG_XARRAY_MULTI=3Dy
> CONFIG_ASSOCIATIVE_ARRAY=3Dy
> CONFIG_HAS_IOMEM=3Dy
> CONFIG_HAS_IOPORT_MAP=3Dy
> CONFIG_HAS_DMA=3Dy
> CONFIG_DMA_OPS=3Dy
> CONFIG_NEED_SG_DMA_LENGTH=3Dy
> CONFIG_NEED_DMA_MAP_STATE=3Dy
> CONFIG_ARCH_DMA_ADDR_T_64BIT=3Dy
> CONFIG_DMA_DECLARE_COHERENT=3Dy
> CONFIG_SWIOTLB=3Dy
> CONFIG_DMA_RESTRICTED_POOL=3Dy
> # CONFIG_DMA_API_DEBUG is not set
> # CONFIG_DMA_MAP_BENCHMARK is not set
> CONFIG_SGL_ALLOC=3Dy
> CONFIG_CHECK_SIGNATURE=3Dy
> CONFIG_CPUMASK_OFFSTACK=3Dy
> CONFIG_CPU_RMAP=3Dy
> CONFIG_DQL=3Dy
> CONFIG_GLOB=3Dy
> # CONFIG_GLOB_SELFTEST is not set
> CONFIG_NLATTR=3Dy
> CONFIG_CLZ_TAB=3Dy
> # CONFIG_IRQ_POLL is not set
> CONFIG_MPILIB=3Dy
> CONFIG_LIBFDT=3Dy
> CONFIG_OID_REGISTRY=3Dy
> CONFIG_HAVE_GENERIC_VDSO=3Dy
> CONFIG_GENERIC_GETTIMEOFDAY=3Dy
> CONFIG_GENERIC_VDSO_TIME_NS=3Dy
> CONFIG_ARCH_HAS_PMEM_API=3Dy
> CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=3Dy
> CONFIG_ARCH_HAS_COPY_MC=3Dy
> CONFIG_ARCH_STACKWALK=3Dy
> CONFIG_STACKDEPOT=3Dy
> CONFIG_STACK_HASH_ORDER=3D20
> # end of Library routines
> =

> CONFIG_ASN1_ENCODER=3Dm
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
> CONFIG_SYMBOLIC_ERRNAME=3Dy
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
> CONFIG_FRAME_WARN=3D2048
> CONFIG_STRIP_ASM_SYMS=3Dy
> # CONFIG_READABLE_ASM is not set
> CONFIG_HEADERS_INSTALL=3Dy
> CONFIG_DEBUG_SECTION_MISMATCH=3Dy
> CONFIG_SECTION_MISMATCH_WARN_ONLY=3Dy
> CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_64B=3Dy
> CONFIG_STACK_VALIDATION=3Dy
> CONFIG_VMLINUX_MAP=3Dy
> # CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
> # end of Compile-time checks and compiler options
> =

> #
> # Generic Kernel Debugging Instruments
> #
> CONFIG_MAGIC_SYSRQ=3Dy
> CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=3D0x1
> # CONFIG_MAGIC_SYSRQ_SERIAL is not set
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
> # CONFIG_UBSAN_BOOL is not set
> # CONFIG_UBSAN_ENUM is not set
> # CONFIG_UBSAN_ALIGNMENT is not set
> CONFIG_UBSAN_SANITIZE_ALL=3Dy
> # CONFIG_TEST_UBSAN is not set
> CONFIG_HAVE_ARCH_KCSAN=3Dy
> # end of Generic Kernel Debugging Instruments
> =

> CONFIG_DEBUG_KERNEL=3Dy
> CONFIG_DEBUG_MISC=3Dy
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
> # CONFIG_PAGE_TABLE_CHECK is not set
> CONFIG_PAGE_POISONING=3Dy
> # CONFIG_DEBUG_PAGE_REF is not set
> # CONFIG_DEBUG_RODATA_TEST is not set
> CONFIG_ARCH_HAS_DEBUG_WX=3Dy
> # CONFIG_DEBUG_WX is not set
> CONFIG_GENERIC_PTDUMP=3Dy
> # CONFIG_PTDUMP_DEBUGFS is not set
> # CONFIG_DEBUG_OBJECTS is not set
> CONFIG_SLUB_STATS=3Dy
> CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
> # CONFIG_DEBUG_KMEMLEAK is not set
> # CONFIG_DEBUG_STACK_USAGE is not set
> CONFIG_SCHED_STACK_END_CHECK=3Dy
> CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=3Dy
> CONFIG_DEBUG_VM=3Dy
> # CONFIG_DEBUG_VM_VMACACHE is not set
> # CONFIG_DEBUG_VM_RB is not set
> CONFIG_DEBUG_VM_PGFLAGS=3Dy
> CONFIG_DEBUG_VM_PGTABLE=3Dy
> CONFIG_ARCH_HAS_DEBUG_VIRTUAL=3Dy
> CONFIG_DEBUG_VIRTUAL=3Dy
> # CONFIG_DEBUG_MEMORY_INIT is not set
> CONFIG_DEBUG_PER_CPU_MAPS=3Dy
> CONFIG_HAVE_ARCH_KASAN=3Dy
> CONFIG_HAVE_ARCH_KASAN_VMALLOC=3Dy
> CONFIG_CC_HAS_KASAN_GENERIC=3Dy
> CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=3Dy
> # CONFIG_KASAN is not set
> CONFIG_HAVE_ARCH_KFENCE=3Dy
> CONFIG_KFENCE=3Dy
> CONFIG_KFENCE_SAMPLE_INTERVAL=3D100
> CONFIG_KFENCE_NUM_OBJECTS=3D255
> CONFIG_KFENCE_STRESS_TEST_FAULTS=3D0
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
> # CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
> CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=3D0
> CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=3Dy
> # CONFIG_HARDLOCKUP_DETECTOR is not set
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

> # CONFIG_DEBUG_TIMEKEEPING is not set
> =

> #
> # Lock Debugging (spinlocks, mutexes, etc...)
> #
> CONFIG_LOCK_DEBUGGING_SUPPORT=3Dy
> CONFIG_PROVE_LOCKING=3Dy
> # CONFIG_PROVE_RAW_LOCK_NESTING is not set
> CONFIG_LOCK_STAT=3Dy
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
> # CONFIG_WW_MUTEX_SELFTEST is not set
> # CONFIG_SCF_TORTURE_TEST is not set
> CONFIG_CSD_LOCK_WAIT_DEBUG=3Dy
> # end of Lock Debugging (spinlocks, mutexes, etc...)
> =

> CONFIG_TRACE_IRQFLAGS=3Dy
> CONFIG_TRACE_IRQFLAGS_NMI=3Dy
> CONFIG_DEBUG_IRQFLAGS=3Dy
> CONFIG_STACKTRACE=3Dy
> # CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
> # CONFIG_DEBUG_KOBJECT is not set
> =

> #
> # Debug kernel data structures
> #
> # CONFIG_DEBUG_LIST is not set
> CONFIG_DEBUG_PLIST=3Dy
> CONFIG_DEBUG_SG=3Dy
> CONFIG_DEBUG_NOTIFIERS=3Dy
> # CONFIG_BUG_ON_DATA_CORRUPTION is not set
> # end of Debug kernel data structures
> =

> CONFIG_DEBUG_CREDENTIALS=3Dy
> =

> #
> # RCU Debugging
> #
> CONFIG_PROVE_RCU=3Dy
> CONFIG_TORTURE_TEST=3Dm
> CONFIG_RCU_SCALE_TEST=3Dm
> CONFIG_RCU_TORTURE_TEST=3Dm
> # CONFIG_RCU_REF_SCALE_TEST is not set
> CONFIG_RCU_CPU_STALL_TIMEOUT=3D21
> # CONFIG_RCU_TRACE is not set
> # CONFIG_RCU_EQS_DEBUG is not set
> # end of RCU Debugging
> =

> # CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
> CONFIG_CPU_HOTPLUG_STATE_CONTROL=3Dy
> CONFIG_LATENCYTOP=3Dy
> CONFIG_USER_STACKTRACE_SUPPORT=3Dy
> CONFIG_NOP_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_TRACER=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS=3Dy
> CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
> CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy
> CONFIG_HAVE_FENTRY=3Dy
> CONFIG_HAVE_OBJTOOL_MCOUNT=3Dy
> CONFIG_HAVE_C_RECORDMCOUNT=3Dy
> CONFIG_BUILDTIME_MCOUNT_SORT=3Dy
> CONFIG_TRACE_CLOCK=3Dy
> CONFIG_RING_BUFFER=3Dy
> CONFIG_EVENT_TRACING=3Dy
> CONFIG_CONTEXT_SWITCH_TRACER=3Dy
> CONFIG_PREEMPTIRQ_TRACEPOINTS=3Dy
> CONFIG_TRACING=3Dy
> CONFIG_TRACING_SUPPORT=3Dy
> # CONFIG_FTRACE is not set
> # CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
> # CONFIG_SAMPLES is not set
> CONFIG_HAVE_SAMPLE_FTRACE_DIRECT=3Dy
> CONFIG_HAVE_SAMPLE_FTRACE_DIRECT_MULTI=3Dy
> CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=3Dy
> CONFIG_STRICT_DEVMEM=3Dy
> # CONFIG_IO_STRICT_DEVMEM is not set
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
> # CONFIG_DEBUG_TLBFLUSH is not set
> CONFIG_HAVE_MMIOTRACE_SUPPORT=3Dy
> # CONFIG_X86_DECODER_SELFTEST is not set
> # CONFIG_IO_DELAY_0X80 is not set
> # CONFIG_IO_DELAY_0XED is not set
> # CONFIG_IO_DELAY_UDELAY is not set
> CONFIG_IO_DELAY_NONE=3Dy
> # CONFIG_DEBUG_BOOT_PARAMS is not set
> # CONFIG_CPA_DEBUG is not set
> # CONFIG_DEBUG_ENTRY is not set
> # CONFIG_DEBUG_NMI_SELFTEST is not set
> # CONFIG_X86_DEBUG_FPU is not set
> # CONFIG_PUNIT_ATOM_DEBUG is not set
> CONFIG_UNWINDER_ORC=3Dy
> # CONFIG_UNWINDER_FRAME_POINTER is not set
> # end of x86 Debugging
> =

> #
> # Kernel Testing and Coverage
> #
> # CONFIG_KUNIT is not set
> CONFIG_NOTIFIER_ERROR_INJECTION=3Dm
> CONFIG_PM_NOTIFIER_ERROR_INJECT=3Dm
> # CONFIG_OF_RECONFIG_NOTIFIER_ERROR_INJECT is not set
> CONFIG_NETDEV_NOTIFIER_ERROR_INJECT=3Dm
> CONFIG_FUNCTION_ERROR_INJECTION=3Dy
> # CONFIG_FAULT_INJECTION is not set
> CONFIG_ARCH_HAS_KCOV=3Dy
> CONFIG_CC_HAS_SANCOV_TRACE_PC=3Dy
> CONFIG_KCOV=3Dy
> CONFIG_KCOV_ENABLE_COMPARISONS=3Dy
> CONFIG_KCOV_INSTRUMENT_ALL=3Dy
> CONFIG_KCOV_IRQ_AREA_SIZE=3D0x40000
> CONFIG_RUNTIME_TESTING_MENU=3Dy
> # CONFIG_LKDTM is not set
> # CONFIG_TEST_MIN_HEAP is not set
> # CONFIG_TEST_DIV64 is not set
> # CONFIG_BACKTRACE_SELF_TEST is not set
> # CONFIG_TEST_REF_TRACKER is not set
> # CONFIG_RBTREE_TEST is not set
> # CONFIG_REED_SOLOMON_TEST is not set
> # CONFIG_INTERVAL_TREE_TEST is not set
> # CONFIG_PERCPU_TEST is not set
> # CONFIG_ATOMIC64_SELFTEST is not set
> # CONFIG_TEST_HEXDUMP is not set
> # CONFIG_STRING_SELFTEST is not set
> # CONFIG_TEST_STRING_HELPERS is not set
> # CONFIG_TEST_STRSCPY is not set
> # CONFIG_TEST_KSTRTOX is not set
> # CONFIG_TEST_PRINTF is not set
> # CONFIG_TEST_SCANF is not set
> # CONFIG_TEST_BITMAP is not set
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
> # CONFIG_TEST_UDELAY is not set
> # CONFIG_TEST_STATIC_KEYS is not set
> # CONFIG_TEST_DEBUG_VIRTUAL is not set
> # CONFIG_TEST_MEMCAT_P is not set
> # CONFIG_TEST_STACKINIT is not set
> # CONFIG_TEST_MEMINIT is not set
> # CONFIG_TEST_FREE_PAGES is not set
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
> 	export queue=3D'bisect'
> 	export testbox=3D'vm-snb-67'
> 	export tbox_group=3D'vm-snb'
> 	export branch=3D'linux-devel/devel-hourly-20220304-094445'
> 	export commit=3D'556d8afe4a779f41dfc8fa373993a88e43f1c5dc'
> 	export kconfig=3D'x86_64-randconfig-a012-20210928'
> 	export nr_vm=3D160
> 	export submit_id=3D'6227adaafa9a1defaf472e96'
> 	export job_file=3D'/lkp/jobs/scheduled/vm-snb-67/rcutorture-300s-default=
-rcu-debian-10.4-x86_64-20200603.cgz-556d8afe4a779f41dfc8fa373993a88e43f1c5=
dc-20220309-61359-zgedsu-2.yaml'
> 	export id=3D'2c60266b60311a02f4e4d7220371cf9e2c7d3b49'
> 	export queuer_version=3D'/lkp-src'
> 	export model=3D'qemu-system-x86_64 -enable-kvm -cpu SandyBridge'
> 	export nr_cpu=3D2
> 	export memory=3D'16G'
> 	export need_kconfig=3D\{\"RCU_TORTURE_TEST\"\=3D\>\"m\"\}'
> '\{\"SECURITY_LOADPIN_ENABLED\"\=3D\>\"n,\ \<\=3D\ v4.19\"\}'
> '\{\"SECURITY_LOADPIN_ENFORCE\"\=3D\>\"n,\ v4.20\"\}'
> '\{\"MODULE_UNLOAD\"\=3D\>\"y\"\}'
> '\{\"KVM_GUEST\"\=3D\>\"y\"\}
> 	export ssh_base_port=3D23032
> 	export kernel_cmdline=3D'vmalloc=3D128M initramfs_async=3D0 page_owner=
=3Don'
> 	export rootfs=3D'debian-10.4-x86_64-20200603.cgz'
> 	export compiler=3D'gcc-9'
> 	export enqueue_time=3D'2022-03-09 03:25:31 +0800'
> 	export _id=3D'6227b814fa9a1defaf472e98'
> 	export _rt=3D'/result/rcutorture/300s-default-rcu/vm-snb/debian-10.4-x86=
_64-20200603.cgz/x86_64-randconfig-a012-20210928/gcc-9/556d8afe4a779f41dfc8=
fa373993a88e43f1c5dc'
> 	export user=3D'lkp'
> 	export LKP_SERVER=3D'internal-lkp-server'
> 	export result_root=3D'/result/rcutorture/300s-default-rcu/vm-snb/debian-=
10.4-x86_64-20200603.cgz/x86_64-randconfig-a012-20210928/gcc-9/556d8afe4a77=
9f41dfc8fa373993a88e43f1c5dc/3'
> 	export scheduler_version=3D'/lkp/lkp/.src-20220308-102049'
> 	export arch=3D'x86_64'
> 	export max_uptime=3D2100
> 	export initrd=3D'/osimage/debian/debian-10.4-x86_64-20200603.cgz'
> 	export bootloader_append=3D'root=3D/dev/ram0
> RESULT_ROOT=3D/result/rcutorture/300s-default-rcu/vm-snb/debian-10.4-x86_=
64-20200603.cgz/x86_64-randconfig-a012-20210928/gcc-9/556d8afe4a779f41dfc8f=
a373993a88e43f1c5dc/3
> BOOT_IMAGE=3D/pkg/linux/x86_64-randconfig-a012-20210928/gcc-9/556d8afe4a7=
79f41dfc8fa373993a88e43f1c5dc/vmlinuz-5.17.0-rc1-00111-g556d8afe4a77
> branch=3Dlinux-devel/devel-hourly-20220304-094445
> job=3D/lkp/jobs/scheduled/vm-snb-67/rcutorture-300s-default-rcu-debian-10=
.4-x86_64-20200603.cgz-556d8afe4a779f41dfc8fa373993a88e43f1c5dc-20220309-61=
359-zgedsu-2.yaml
> user=3Dlkp
> ARCH=3Dx86_64
> kconfig=3Dx86_64-randconfig-a012-20210928
> commit=3D556d8afe4a779f41dfc8fa373993a88e43f1c5dc
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
> 	export modules_initrd=3D'/pkg/linux/x86_64-randconfig-a012-20210928/gcc-=
9/556d8afe4a779f41dfc8fa373993a88e43f1c5dc/modules.cgz'
> 	export bm_initrd=3D'/osimage/deps/debian-10.4-x86_64-20200603.cgz/run-ip=
config_20200608.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/lkp_20220=
105.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/rsync-rootfs_20200608=
.cgz'
> 	export lkp_initrd=3D'/osimage/user/lkp/lkp-x86_64.cgz'
> 	export site=3D'inn'
> 	export LKP_CGI_PORT=3D80
> 	export LKP_CIFS_PORT=3D139
> 	export schedule_notify_address=3D
> 	export kernel=3D'/pkg/linux/x86_64-randconfig-a012-20210928/gcc-9/556d8a=
fe4a779f41dfc8fa373993a88e43f1c5dc/vmlinuz-5.17.0-rc1-00111-g556d8afe4a77'
> 	export dequeue_time=3D'2022-03-09 04:10:54 +0800'
> 	export job_initrd=3D'/lkp/jobs/scheduled/vm-snb-67/rcutorture-300s-defau=
lt-rcu-debian-10.4-x86_64-20200603.cgz-556d8afe4a779f41dfc8fa373993a88e43f1=
c5dc-20220309-61359-zgedsu-2.cgz'
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
> early console in extract_kernel
> input_data: 0x00000000030e22e0
> input_len: 0x0000000000d1cbf1
> output: 0x0000000001000000
> output_len: 0x000000000295baa0
> kernel_total_size: 0x0000000003220000
> needed_size: 0x0000000003400000
> trampoline_32bit: 0x000000000009d000
> Physical KASLR using RDTSC...
> Virtual KASLR using RDTSC...
> =

> Decompressing Linux... Parsing ELF... Performing relocations... done.
> Booting the kernel.
> Linux version 5.17.0-rc1-00111-g556d8afe4a77 (kbuild(a)1871ff489a11) (gcc=
-9 (Debian 9.3.0-22) 9.3.0, GNU ld (GNU Binutils for Debian) 2.35.2) #1 SMP=
 Wed Mar 9 03:43:42 CST 2022
> Command line: ip=3D::::vm-snb-67::dhcp root=3D/dev/ram0 RESULT_ROOT=3D/re=
sult/rcutorture/300s-default-rcu/vm-snb/debian-10.4-x86_64-20200603.cgz/x86=
_64-randconfig-a012-20210928/gcc-9/556d8afe4a779f41dfc8fa373993a88e43f1c5dc=
/3 BOOT_IMAGE=3D/pkg/linux/x86_64-randconfig-a012-20210928/gcc-9/556d8afe4a=
779f41dfc8fa373993a88e43f1c5dc/vmlinuz-5.17.0-rc1-00111-g556d8afe4a77 branc=
h=3Dlinux-devel/devel-hourly-20220304-094445 job=3D/lkp/jobs/scheduled/vm-s=
nb-67/rcutorture-300s-default-rcu-debian-10.4-x86_64-20200603.cgz-556d8afe4=
a779f41dfc8fa373993a88e43f1c5dc-20220309-61359-zgedsu-2.yaml user=3Dlkp ARC=
H=3Dx86_64 kconfig=3Dx86_64-randconfig-a012-20210928 commit=3D556d8afe4a779=
f41dfc8fa373993a88e43f1c5dc vmalloc=3D128M initramfs_async=3D0 page_owner=
=3Don max_uptime=3D2100 LKP_SERVER=3Dinternal-lkp-server selinux=3D0 debug =
apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D100 net.=
ifnames=3D0 printk.devkmsg=3Don panic=3D-1 softlockup_panic=3D1 nmi_watchdo=
g=3Dpanic oops=3Dpanic load_ramdisk=3D2 prompt_ramdi
> KERNEL supported cpus:
> Intel GenuineIntel
> x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
> x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
> x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
> x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
> x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using 's=
tandard' format.
> signal: max sigframe size: 1360
> BIOS-provided physical RAM map:
> BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
> BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reserved
> BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] reserved
> BIOS-e820: [mem 0x0000000000100000-0x00000000bffdffff] usable
> BIOS-e820: [mem 0x00000000bffe0000-0x00000000bfffffff] reserved
> BIOS-e820: [mem 0x00000000feffc000-0x00000000feffffff] reserved
> BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] reserved
> BIOS-e820: [mem 0x0000000100000000-0x000000043fffffff] usable
> printk: debug: ignoring loglevel setting.
> printk: bootconsole [earlyser0] enabled
> NX (Execute Disable) protection: active
> Hypervisor detected: KVM
> kvm-clock: Using msrs 4b564d01 and 4b564d00
> kvm-clock: using sched offset of 5557670255 cycles
> clocksource: kvm-clock: mask: 0xffffffffffffffff max_cycles: 0x1cd42e4dff=
b, max_idle_ns: 881590591483 ns
> tsc: Detected 2095.078 MHz processor
> e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> reserved
> e820: remove [mem 0x000a0000-0x000fffff] usable
> last_pfn =3D 0x440000 max_arch_pfn =3D 0x400000000
> x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WB  WT  UC- UC  =

> Memory KASLR using RDTSC...
> last_pfn =3D 0xbffe0 max_arch_pfn =3D 0x400000000
> RAMDISK: [mem 0x78a9d000-0x7fffffff]
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
> mapped APIC to ffffffffff5fd000 (        fee00000)
> Zone ranges:
> DMA32    [mem 0x0000000000001000-0x00000000ffffffff]
> Normal   [mem 0x0000000100000000-0x000000043fffffff]
> Movable zone start for each node
> Early memory node ranges
> node   0: [mem 0x0000000000001000-0x000000000009efff]
> node   0: [mem 0x0000000000100000-0x00000000bffdffff]
> node   0: [mem 0x0000000100000000-0x000000043fffffff]
> Initmem setup node 0 [mem 0x0000000000001000-0x000000043fffffff]
> On node 0, zone DMA32: 1 pages in unavailable ranges
> On node 0, zone DMA32: 97 pages in unavailable ranges
> On node 0, zone Normal: 32 pages in unavailable ranges
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
> mapped IOAPIC to ffffffffff5fc000 (fec00000)
> [mem 0xc0000000-0xfeffbfff] available for PCI devices
> Booting paravirtualized kernel on KVM
> clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, ma=
x_idle_ns: 1910969940391419 ns
> setup_percpu: NR_CPUS:8192 nr_cpumask_bits:2 nr_cpu_ids:2 nr_node_ids:1
> percpu: Embedded 502 pages/cpu s2016920 r8192 d31080 u2097152
> pcpu-alloc: s2016920 r8192 d31080 u2097152 alloc=3D1*2097152
> pcpu-alloc: [0] 0 [0] 1 =

> Built 1 zonelists, mobility grouping on.  Total pages: 4128482
> Kernel command line: ip=3D::::vm-snb-67::dhcp root=3D/dev/ram0 RESULT_ROO=
T=3D/result/rcutorture/300s-default-rcu/vm-snb/debian-10.4-x86_64-20200603.=
cgz/x86_64-randconfig-a012-20210928/gcc-9/556d8afe4a779f41dfc8fa373993a88e4=
3f1c5dc/3 BOOT_IMAGE=3D/pkg/linux/x86_64-randconfig-a012-20210928/gcc-9/556=
d8afe4a779f41dfc8fa373993a88e43f1c5dc/vmlinuz-5.17.0-rc1-00111-g556d8afe4a7=
7 branch=3Dlinux-devel/devel-hourly-20220304-094445 job=3D/lkp/jobs/schedul=
ed/vm-snb-67/rcutorture-300s-default-rcu-debian-10.4-x86_64-20200603.cgz-55=
6d8afe4a779f41dfc8fa373993a88e43f1c5dc-20220309-61359-zgedsu-2.yaml user=3D=
lkp ARCH=3Dx86_64 kconfig=3Dx86_64-randconfig-a012-20210928 commit=3D556d8a=
fe4a779f41dfc8fa373993a88e43f1c5dc vmalloc=3D128M initramfs_async=3D0 page_=
owner=3Don max_uptime=3D2100 LKP_SERVER=3Dinternal-lkp-server selinux=3D0 d=
ebug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D100=
 net.ifnames=3D0 printk.devkmsg=3Don panic=3D-1 softlockup_panic=3D1 nmi_wa=
tchdog=3Dpanic oops=3Dpanic load_ramdisk=3D2 promp
> sysrq: sysrq always enabled.
> ignoring the deprecated load_ramdisk=3D option
> Unknown kernel command line parameters "RESULT_ROOT=3D/result/rcutorture/=
300s-default-rcu/vm-snb/debian-10.4-x86_64-20200603.cgz/x86_64-randconfig-a=
012-20210928/gcc-9/556d8afe4a779f41dfc8fa373993a88e43f1c5dc/3 BOOT_IMAGE=3D=
/pkg/linux/x86_64-randconfig-a012-20210928/gcc-9/556d8afe4a779f41dfc8fa3739=
93a88e43f1c5dc/vmlinuz-5.17.0-rc1-00111-g556d8afe4a77 branch=3Dlinux-devel/=
devel-hourly-20220304-094445 job=3D/lkp/jobs/scheduled/vm-snb-67/rcutorture=
-300s-default-rcu-debian-10.4-x86_64-20200603.cgz-556d8afe4a779f41dfc8fa373=
993a88e43f1c5dc-20220309-61359-zgedsu-2.yaml user=3Dlkp ARCH=3Dx86_64 kconf=
ig=3Dx86_64-randconfig-a012-20210928 commit=3D556d8afe4a779f41dfc8fa373993a=
88e43f1c5dc vmalloc=3D128M page_owner=3Don max_uptime=3D2100 LKP_SERVER=3Di=
nternal-lkp-server selinux=3D0 softlockup_panic=3D1 nmi_watchdog=3Dpanic pr=
ompt_ramdisk=3D0 vga=3Dnormal", will be passed to user space.
> Dentry cache hash table entries: 2097152 (order: 12, 16777216 bytes, line=
ar)
> Inode-cache hash table entries: 1048576 (order: 11, 8388608 bytes, linear)
> mem auto-init: stack:off, heap alloc:on, heap free:on
> mem auto-init: clearing system memory may take some time...
> Memory: 16245120K/16776696K available (14341K kernel code, 6125K rwdata, =
7964K rodata, 3052K init, 13768K bss, 531316K reserved, 0K cma-reserved)
> random: get_random_u64 called from cache_random_seq_create+0x54/0x10f wit=
h crng_init=3D0
> SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D2, Nodes=3D1
> Running RCU self tests
> rcu: Hierarchical RCU implementation.
> rcu: 	RCU lockdep checking is enabled.
> rcu: 	RCU restricting CPUs from NR_CPUS=3D8192 to nr_cpu_ids=3D2.
> 	RCU CPU stall warnings timeout set to 100 (rcu_cpu_stall_timeout).
> 	Trampoline variant of Tasks RCU enabled.
> 	Rude variant of Tasks RCU enabled.
> 	Tracing variant of Tasks RCU enabled.
> rcu: RCU calculated value of scheduler-enlistment delay is 100 jiffies.
> rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=3D2
> NR_IRQS: 4352, nr_irqs: 56, preallocated irqs: 16
> rcu: srcu_init: Setting srcu_struct sizes based on contention.
> kfence: initialized - using 2097152 bytes for 255 objects at 0x(____ptrva=
l____)-0x(____ptrval____)
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
> memory used by lock dependency info: 6877 kB
> memory used for stack traces: 4224 kB
> per task-struct memory footprint: 2688 bytes
> ACPI: Core revision 20211217
> clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: =
19112604467 ns
> APIC: Switch to symmetric I/O mode setup
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
> clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x1e3306b9ad=
a, max_idle_ns: 440795224413 ns
> Calibrating delay loop (skipped) preset value.. 4190.15 BogoMIPS (lpj=3D2=
095078)
> pid_max: default: 4096 minimum: 301
> LSM: Security Framework initializing
> landlock: Up and running.
> Yama: becoming mindful.
> Mount-cache hash table entries: 32768 (order: 6, 262144 bytes, linear)
> Mountpoint-cache hash table entries: 32768 (order: 6, 262144 bytes, linea=
r)
> Poking KASLR using RDTSC...
> Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
> Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
> Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sani=
tization
> Spectre V2 : Spectre mitigation: kernel not compiled with retpoline; no m=
itigation available!
> Speculative Store Bypass: Vulnerable
> MDS: Vulnerable: Clear CPU buffers attempted, no microcode
> Freeing SMP alternatives memory: 16K
> smpboot: CPU0: Intel Xeon E312xx (Sandy Bridge) (family: 0x6, model: 0x2a=
, stepping: 0x1)
> cblist_init_generic: Setting adjustable number of callback queues.
> cblist_init_generic: Setting shift to 1 and lim to 1.
> cblist_init_generic: Setting shift to 1 and lim to 1.
> cblist_init_generic: Setting shift to 1 and lim to 1.
> Running RCU-tasks wait API self tests
> Performance Events: unsupported p6 CPU model 42 no PMU driver, software e=
vents only.
> rcu: Hierarchical SRCU implementation.
> Callback from call_rcu_tasks_trace() invoked.
> smp: Bringing up secondary CPUs ...
> x86: Booting SMP configuration:
> .... node  #0, CPUs:      #1
> masked ExtINT on CPU#1
> smpboot: CPU 1 Converting physical 0 to logical die 1
> smp: Brought up 1 node, 2 CPUs
> smpboot: Max logical packages: 2
> smpboot: Total of 2 processors activated (8380.31 BogoMIPS)
> devtmpfs: initialized
> clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_n=
s: 1911260446275000 ns
> futex hash table entries: 16 (order: -1, 2048 bytes, linear)
> pinctrl core: initialized pinctrl subsystem
> pinctrl core: failed to create debugfs directory
> regulator-dummy: no parameters, enabled
> NET: Registered PF_NETLINK/PF_ROUTE protocol family
> audit: initializing netlink subsys (disabled)
> thermal_sys: Registered thermal governor 'bang_bang'
> thermal_sys: Registered thermal governor 'step_wise'
> thermal_sys: Registered thermal governor 'user_space'
> cpuidle: using governor menu
> audit: type=3D2000 audit(1646770297.786:1): state=3Dinitialized audit_ena=
bled=3D0 res=3D1
> NET: Registered PF_QIPCRTR protocol family
> acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
> PCI: Using configuration type 1 for base access
> kprobes: kprobe jump-optimization is enabled. All kprobes are optimized i=
f possible.
> HugeTLB: can free 6 vmemmap pages for hugepages-2048kB
> HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
> cryptd: max_cpu_qlen set to 1000
> ACPI: Added _OSI(Module Device)
> ACPI: Added _OSI(Processor Device)
> ACPI: Added _OSI(3.0 _SCP Extensions)
> ACPI: Added _OSI(Processor Aggregator Device)
> ACPI: Added _OSI(Linux-Dell-Video)
> ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
> ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
> ACPI: 1 ACPI AML tables successfully acquired and loaded
> Callback from call_rcu_tasks_rude() invoked.
> ACPI: Interpreter enabled
> ACPI: PM: (supports S0 S5)
> ACPI: Using IOAPIC for interrupt routing
> PCI: Using host bridge windows from ACPI; if necessary, use "pci=3Dnocrs"=
 and report a bug
> ACPI: Enabled 2 GPEs in block 00 to 0F
> ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
> acpi PNP0A03:00: _OSC: OS supports [Segments HPX-Type3]
> acpi PNP0A03:00: PCIe port services disabled; not requesting _OSC control
> acpi PNP0A03:00: fail to add MMCONFIG information, can't access extended =
PCI configuration space under this bridge.
> acpiphp: Slot [3] registered
> acpiphp: Slot [4] registered
> acpiphp: Slot [5] registered
> acpiphp: Slot [6] registered
> acpiphp: Slot [7] registered
> acpiphp: Slot [8] registered
> acpiphp: Slot [9] registered
> acpiphp: Slot [10] registered
> acpiphp: Slot [11] registered
> acpiphp: Slot [12] registered
> acpiphp: Slot [13] registered
> acpiphp: Slot [14] registered
> acpiphp: Slot [15] registered
> acpiphp: Slot [16] registered
> acpiphp: Slot [17] registered
> acpiphp: Slot [18] registered
> acpiphp: Slot [19] registered
> acpiphp: Slot [20] registered
> acpiphp: Slot [21] registered
> acpiphp: Slot [22] registered
> acpiphp: Slot [23] registered
> acpiphp: Slot [24] registered
> acpiphp: Slot [25] registered
> acpiphp: Slot [26] registered
> acpiphp: Slot [27] registered
> acpiphp: Slot [28] registered
> acpiphp: Slot [29] registered
> acpiphp: Slot [30] registered
> acpiphp: Slot [31] registered
> PCI host bridge to bus 0000:00
> pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
> pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
> pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
> pci_bus 0000:00: root bus resource [mem 0xc0000000-0xfebfffff window]
> pci_bus 0000:00: root bus resource [mem 0x440000000-0x4bfffffff window]
> pci_bus 0000:00: root bus resource [bus 00-ff]
> pci 0000:00:00.0: [8086:1237] type 00 class 0x060000
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
> ACPI: bus type USB registered
> usbcore: registered new interface driver usbfs
> usbcore: registered new interface driver hub
> usbcore: registered new device driver usb
> PCI: Using ACPI for IRQ routing
> PCI: pci_cache_line_size set to 64 bytes
> e820: reserve RAM buffer [mem 0x0009fc00-0x0009ffff]
> e820: reserve RAM buffer [mem 0xbffe0000-0xbfffffff]
> hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
> hpet0: 3 comparators, 64-bit 100.000000 MHz counter
> clocksource: Switched to clocksource kvm-clock
> Callback from call_rcu_tasks() invoked.
> pnp: PnP ACPI init
> pnp 00:03: [dma 2]
> pnp: PnP ACPI: found 7 devices
> clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2=
085701024 ns
> NET: Registered PF_INET protocol family
> IP idents hash table entries: 262144 (order: 9, 2097152 bytes, linear)
> tcp_listen_portaddr_hash hash table entries: 8192 (order: 7, 720896 bytes=
, linear)
> TCP established hash table entries: 131072 (order: 8, 1048576 bytes, line=
ar)
> TCP bind hash table entries: 65536 (order: 10, 5242880 bytes, vmalloc)
> TCP: Hash tables configured (established 131072 bind 65536)
> UDP hash table entries: 8192 (order: 8, 1572864 bytes, linear)
> UDP-Lite hash table entries: 8192 (order: 8, 1572864 bytes, linear)
> NET: Registered PF_UNIX/PF_LOCAL protocol family
> pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
> pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
> pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
> pci_bus 0000:00: resource 7 [mem 0xc0000000-0xfebfffff window]
> pci_bus 0000:00: resource 8 [mem 0x440000000-0x4bfffffff window]
> pci 0000:00:01.0: PIIX3: Enabling Passive Release
> pci 0000:00:00.0: Limiting direct PCI/PCI transfers
> pci 0000:00:01.0: Activating ISA DMA hang workarounds
> pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x000c0000-0x000=
dffff]
> PCI: CLS 0 bytes, default 64
> Unpacking initramfs...
> Freeing initrd memory: 120204K
> PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
> software IO TLB: mapped [mem 0x00000000bbfe0000-0x00000000bffe0000] (64MB)
> ACPI: bus type thunderbolt registered
> clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x1e3306b9ada, max=
_idle_ns: 440795224413 ns
> AVX2 or AES-NI instructions are not detected.
> Initialise system trusted keyrings
> Key type blacklist registered
> workingset: timestamp_bits=3D46 max_order=3D22 bucket_order=3D0
> zbud: loaded
> zsmalloc: debugfs not available, stat dir not created
> NET: Registered PF_ALG protocol family
> xor: automatically using best checksumming function   avx       =

> Key type asymmetric registered
> Asymmetric key parser 'x509' registered
> Asymmetric key parser 'pkcs8' registered
> start plist test
> end plist test
> gpio_winbond: chip ID at 2e is ffff
> gpio_winbond: not an our chip
> gpio_winbond: chip ID at 4e is ffff
> gpio_winbond: not an our chip
> acpiphp_ibm: ibm_acpiphp_init: acpi_walk_namespace failed
> N_HDLC line discipline registered with maxframe=3D4096
> Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
> serial8250: ttyS0 at I/O 0x3f8 (irq =3D 4, base_baud =3D 115200) is a 165=
50A
> serial8250: ttyS1 at I/O 0x2f8 (irq =3D 3, base_baud =3D 115200) is a 165=
50A
> SyncLink GT
> SyncLink GT, tty major#245
> SyncLink GT no devices found
> lp: driver loaded but no devices found
> Applicom driver: $Id: ac.c,v 1.30 2000/03/22 16:03:57 dwmw2 Exp $
> ac.o: No PCI boards found.
> ac.o: For an ISA board you must supply memory and irq parameters.
> ppdev: user-space parallel port driver
> smapi::smapi_init, ERROR invalid usSmapiID
> mwave: tp3780i::tp3780I_InitializeBoardData: Error: SMAPI is not availabl=
e on this machine
> mwave: mwavedd::mwave_init: Error: Failed to initialize board data
> mwave: mwavedd::mwave_init: Error: Failed to initialize
> Hangcheck: starting hangcheck timer 0.9.1 (tick is 180 seconds, margin is=
 60 seconds).
> usbcore: registered new interface driver xillyusb
> usbcore: registered new interface driver rtsx_usb
> e1000: Intel(R) PRO/1000 Network Driver
> e1000: Copyright (c) 1999-2006 Intel Corporation.
> ACPI: \_SB_.LNKC: Enabled at IRQ 11
> e1000 0000:00:03.0 eth0: (PCI:33MHz:32-bit) 52:54:00:12:34:56
> e1000 0000:00:03.0 eth0: Intel(R) PRO/1000 Network Connection
> mkiss: AX.25 Multikiss, Hans Albas PE1AYX
> AX.25: 6pack driver, Revision: 0.3.0
> VFIO - User Level meta-driver version: 0.3
> ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
> ehci-platform: EHCI generic platform driver
> usbcore: registered new interface driver cdc_wdm
> usbcore: registered new interface driver usbtmc
> usbcore: registered new interface driver mdc800
> mdc800: v0.7.5 (30/10/2000):USB Driver for Mustek MDC800 Digital Camera
> usbcore: registered new interface driver appledisplay
> usbcore: registered new interface driver emi62 - firmware loader
> ftdi_elan: driver ftdi-elan
> usbcore: registered new interface driver ftdi-elan
> usbcore: registered new interface driver idmouse
> usbcore: registered new interface driver isight_firmware
> usbcore: registered new interface driver uss720
> uss720: USB Parport Cable driver for Cables using the Lucent Technologies=
 USS720 Chip
> uss720: NOTE: this is a special purpose driver to allow nonstandard
> uss720: protocols (eg. bitbang) over USS720 usb to parallel cables
> uss720: If you just want to connect to a printer, use usblp instead
> usbcore: registered new interface driver usbsevseg
> usbcore: registered new device driver usbip-host
> i8042: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU] at 0x60,0x64 irq 1,=
12
> serio: i8042 KBD port at 0x60,0x64 irq 1
> serio: i8042 AUX port at 0x60,0x64 irq 12
> mousedev: PS/2 mouse device common for all mice
> usbcore: registered new interface driver usb_acecad
> usbcore: registered new interface driver kbtab
> usbcore: registered new interface driver pegasus_notetaker
> usbcore: registered new interface driver ati_remote2
> cm109: Keymap for Komunikate KIP1000 phone loaded
> usbcore: registered new interface driver cm109
> cm109: CM109 phone driver: 20080805 (C) Alfred E. Heggestad
> usbcore: registered new interface driver keyspan_remote
> rtc_cmos 00:00: RTC can wake from S4
> rtc_cmos 00:00: registered as rtc0
> rtc_cmos 00:00: alarms up to one day, y3k, 114 bytes nvram, hpet irqs
> Driver for 1-wire Dallas network protocol.
> usbcore: registered new interface driver DS9490R
> DS1WM w1 busmaster driver - (c) 2004 Szabolcs Gyurko
> intel_pstate: CPU model not supported
> input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/inp=
ut/input0
> evbug: Connected device: input0 (AT Translated Set 2 keyboard at isa0060/=
serio0/input0)
> usbcore: registered new interface driver usbmouse
> comedi: version 0.7.76 - http://www.comedi.org
> usbcore: registered new interface driver usbdux
> usbcore: registered new interface driver usbduxfast
> usbcore: registered new interface driver usbduxsigma
> usbcore: registered new interface driver vmk80xx
> ashmem: initialized
> usbcore: registered new interface driver hdm_usb
> u32 classifier
> input device check on
> NET: Registered PF_INET6 protocol family
> Segment Routing with IPv6
> In-situ OAM (IOAM) with IPv6
> sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
> NET: Registered PF_PACKET protocol family
> NET: Registered PF_NETROM protocol family
> NET: Registered PF_ROSE protocol family
> NET: Registered PF_AX25 protocol family
> NET4: DECnet for Linux: V.2.5.68s (C) 1995-2003 Linux DECnet Project Team
> DECnet: Routing cache hash table of 1024 buckets, 80Kbytes
> NET: Registered PF_DECnet protocol family
> 8021q: 802.1Q VLAN Support v1.8
> 9pnet: Installing 9P2000 support
> NET: Registered PF_CAIF protocol family
> Key type dns_resolver registered
> batman_adv: B.A.T.M.A.N. advanced 2022.0 (compatibility version 15) loaded
> mpls_gso: MPLS GSO support
> IPI shorthand broadcast: enabled
> ... APIC ID:      00000000 (0)
> ... APIC VERSION: 00050014
> 0000000000000000000000000000000000000000000000000000000000000000
> 0000000000000000000000000000000000000000000000000000000000000000
> 0000000000000000000000000000000000000000000000000000000008000000
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
> pin01, enabled , edge , high, V(22), IRR(0), S(0), logical , D(0002), M(0)
> pin02, enabled , edge , high, V(30), IRR(0), S(0), logical , D(0001), M(0)
> pin03, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
> pin04, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
> pin05, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
> pin06, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
> pin07, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
> pin08, enabled , edge , high, V(22), IRR(0), S(0), logical , D(0001), M(0)
> pin09, enabled , level, high, V(21), IRR(0), S(0), logical , D(0002), M(0)
> pin0a, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
> pin0b, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
> pin0c, enabled , edge , high, V(21), IRR(0), S(0), logical , D(0001), M(0)
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
> sched_clock: Marking stable (47726844576, 47642871)->(48086399637, -31191=
2190)
> Loading compiled-in X.509 certificates
> Loaded X.509 cert 'Build time autogenerated kernel key: 1ce19b688c6758fa9=
8504a06999e9f6554fc9436'
> debug_vm_pgtable: [debug_vm_pgtable         ]: Validating architecture pa=
ge table helpers
> Key type ._fscrypt registered
> Key type .fscrypt registered
> Key type fscrypt-provisioning registered
> fs-verity: Initialized fs-verity
> Key type encrypted registered
> 8021q: adding VLAN 0 to HW filter on device eth0
> e1000: eth0 NIC Link is Up 1000 Mbps Full Duplex, Flow Control: RX
> IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
> Sending DHCP requests ., OK
> IP-Config: Got DHCP answer from 10.0.2.2, my address is 10.0.2.15
> IP-Config: Complete:
> device=3Deth0, hwaddr=3D52:54:00:12:34:56, ipaddr=3D10.0.2.15, mask=3D255=
.255.255.0, gw=3D10.0.2.2
> host=3Dvm-snb-67, domain=3D, nis-domain=3D(none)
> bootserver=3D10.0.2.2, rootserver=3D10.0.2.2, rootpath=3D
> nameserver0=3D10.0.2.3
> DEBUG_HOTPLUG_CPU0: CPU 0 is now offline
> Freeing unused kernel image (initmem) memory: 3052K
> Write protecting the kernel read-only data: 24576k
> Freeing unused kernel image (text/rodata gap) memory: 2040K
> Freeing unused kernel image (rodata/data gap) memory: 228K
> Run /init as init process
> with arguments:
> /init
> with environment:
> HOME=3D/
> TERM=3Dlinux
> RESULT_ROOT=3D/result/rcutorture/300s-default-rcu/vm-snb/debian-10.4-x86_=
64-20200603.cgz/x86_64-randconfig-a012-20210928/gcc-9/556d8afe4a779f41dfc8f=
a373993a88e43f1c5dc/3
> BOOT_IMAGE=3D/pkg/linux/x86_64-randconfig-a012-20210928/gcc-9/556d8afe4a7=
79f41dfc8fa373993a88e43f1c5dc/vmlinuz-5.17.0-rc1-00111-g556d8afe4a77
> branch=3Dlinux-devel/devel-hourly-20220304-094445
> job=3D/lkp/jobs/scheduled/vm-snb-67/rcutorture-300s-default-rcu-debian-10=
.4-x86_64-20200603.cgz-556d8afe4a779f41dfc8fa373993a88e43f1c5dc-20220309-61=
359-zgedsu-2.yaml
> user=3Dlkp
> ARCH=3Dx86_64
> kconfig=3Dx86_64-randconfig-a012-20210928
> commit=3D556d8afe4a779f41dfc8fa373993a88e43f1c5dc
> vmalloc=3D128M
> page_owner=3Don
> max_uptime=3D2100
> LKP_SERVER=3Dinternal-lkp-server
> selinux=3D0
> softlockup_panic=3D1
> nmi_watchdog=3Dpanic
> prompt_ramdisk=3D0
> vga=3Dnormal
> systemd[1]: RTC configured in localtime, applying delta of 0 minutes to s=
ystem time.
> systemd[1]: Inserted module 'autofs4'
> =

> Welcome to Debian GNU/Linux 10 (buster)!
> =

> random: systemd: uninitialized urandom read (16 bytes read)
> Listening on udev Kernel Socket.
> random: systemd: uninitialized urandom read (16 bytes read)
> Listening on Syslog Socket.
> random: systemd: uninitialized urandom read (16 bytes read)
> Listening on Journal Audit Socket.
> Listening on udev Control Socket.
> Reached target Swap.
> Listening on Journal Socket.
> Starting Load Kernel Modules...
> Starting Remount Root and Kernel File Systems...
> Mounting POSIX Message Queue File System...
> Mounting RPC Pipe File System...
> Listening on initctl Compatibility Named Pipe.
> Mounting Huge Pages File System...
> Created slice system-getty.slice.
> Reached target Paths.
> Reached target Local Encrypted Volumes.
> Created slice User and Session Slice.
> Starting udev Coldplug all Devices...
> Listening on Journal Socket (/dev/log).
> Starting Journal Service...
> Listening on RPCbind Server Activation Socket.
> Reached target Slices.
> Started Load Kernel Modules.
> Started Remount Root and Kernel File Systems.
> Mounted POSIX Message Queue File System.
> Failed to mount RPC Pipe File System.
> See 'systemctl status run-rpc_pipefs.mount' for details.
> Mounted Huge Pages File System.
> Reached target NFS client services.
> Starting Create System Users...
> Starting Load/Save Random Seed...
> Starting Apply Kernel Variables...
> Mounting Kernel Configuration File System...
> Started Create System Users.
> Started Load/Save Random Seed.
> Starting Create Static Device Nodes in /dev...
> Started Apply Kernel Variables.
> Mounted Kernel Configuration File System.
> Started Journal Service.
> Starting Flush Journal to Persistent Storage...
> random: fast init done
> Started Create Static Device Nodes in /dev.
> Reached target Local File Systems (Pre).
> Reached target Local File Systems.
> Starting Preprocess NFS configuration...
> Starting udev Kernel Device Manager...
> Started Flush Journal to Persistent Storage.
> Starting Create Volatile Files and Directories...
> Started Preprocess NFS configuration.
> Started udev Kernel Device Manager.
> Started Create Volatile Files and Directories.
> Starting Network Time Synchronization...
> Starting Update UTMP about System Boot/Shutdown...
> Starting RPC bind portmap service...
> Started udev Coldplug all Devices.
> Starting Helper to synchronize boot up for ifupdown...
> Started RPC bind portmap service.
> Reached target RPC Port Mapper.
> Reached target Remote File Systems (Pre).
> Reached target Remote File Systems.
> Started Update UTMP about System Boot/Shutdown.
> Started Helper to synchronize boot up for ifupdown.
> Starting Raise network interfaces...
> Started Network Time Synchronization.
> Reached target System Time Synchronized.
> Reached target System Initialization.
> Started Daily Cleanup of Temporary Directories.
> Listening on D-Bus System Message Bus Socket.
> Reached target Sockets.
> Started Daily rotation of log files.
> Started Daily apt download activities.
> Started Daily apt upgrade and clean activities.
> Reached target Timers.
> Reached target Basic System.
> Started D-Bus System Message Bus.
> Starting System Logging Service...
> Starting LSB: OpenIPMI Driver init script...
> Starting Login Service...
> Started Regular background program processing daemon.
> Started Raise network interfaces.
> Reached target Network.
> Starting LKP bootstrap...
> Starting Permit User Sessions...
> Starting /etc/rc.local Compatibility...
> Starting OpenBSD Secure Shell server...
> Started Permit User Sessions.
> Starting LSB: Load kernel image with kexec...
> Started LKP bootstrap.
> Started Login Service.
> IPMI message handler: version 39.2
> Started LSB: Load kernel image with kexec.
> ipmi_si: IPMI System Interface driver
> ipmi_si: Unable to find any System Interface(s)
> Failed to start LSB: OpenIPMI Driver init script.
> See 'systemctl status openipmi.service' for details.
> random: crng init done
> random: 7 urandom warning(s) missed due to ratelimiting
> LKP: ttyS0: 247: Kernel tests: Boot OK!
> LKP: ttyS0: 247: HOSTNAME vm-snb-67, MAC 52:54:00:12:34:56, kernel 5.17.0=
-rc1-00111-g556d8afe4a77 1
> Started OpenBSD Secure Shell server.
> input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input2
> evbug: Connected device: input2 (Power Button at LNXPWRBN/button/input0)
> ACPI: button: Power Button [PWRF]
> RAPL PMU: API unit is 2^-32 Joules, 0 fixed counters, 10737418240 ms ovfl=
 timer
> AVX version of gcm_enc/dec engaged.
> AES CTR mode by8 optimization enabled
> LKP: ttyS0: 247:  /lkp/lkp/src/bin/run-lkp /lkp/jobs/scheduled/vm-snb-67/=
rcutorture-300s-default-rcu-debian-10.4-x86_64-20200603.cgz-556d8afe4a779f4=
1dfc8fa373993a88e43f1c5dc-20220309-61359-zgedsu-2.yaml
> Started System Logging Service.
> rcu-torture:--- Start of test: nreaders=3D1 nfakewriters=3D4 stat_interva=
l=3D60 verbose=3D1 test_no_idle_hz=3D1 shuffle_interval=3D3 stutter=3D5 irq=
reader=3D1 fqs_duration=3D0 fqs_holdoff=3D0 fqs_stutter=3D3 test_boost=3D1/=
0 test_boost_interval=3D7 test_boost_duration=3D4 shutdown_secs=3D0 stall_c=
pu=3D0 stall_cpu_holdoff=3D10 stall_cpu_irqsoff=3D0 stall_cpu_block=3D0 n_b=
arrier_cbs=3D0 onoff_interval=3D0 onoff_holdoff=3D0 read_exit_delay=3D13 re=
ad_exit_burst=3D16 nocbs_nthreads=3D0 nocbs_toggle=3D1000
> rcu:  Start-test grace-period state: g35208 f0x0
> rcu_torture_write_types: Testing conditional GPs.
> rcu_torture_write_types: Testing conditional expedited GPs.
> rcu_torture_write_types: Testing expedited GPs.
> rcu_torture_write_types: Testing asynchronous GPs.
> rcu_torture_write_types: Testing polling GPs.
> rcu_torture_write_types: Testing polling expedited GPs.
> rcu_torture_write_types: Testing normal GPs.
> rcu-torture: Creating rcu_torture_writer task
> rcu-torture: rcu_torture_writer task started
> rcu-torture: Creating rcu_torture_fakewriter task
> rcu-torture: Creating rcu_torture_fakewriter task
> rcu-torture: rcu_torture_fakewriter task started
> rcu-torture: Creating rcu_torture_fakewriter task
> rcu-torture: rcu_torture_fakewriter task started
> rcu-torture: Creating rcu_torture_fakewriter task
> rcu-torture: rcu_torture_fakewriter task started
> rcu-torture: Creating rcu_torture_reader task
> rcu-torture: rcu_torture_fakewriter task started
> rcu-torture: rcu_torture_reader task started
> rcu-torture: Creating rcu_torture_stats task
> rcu-torture: Creating torture_shuffle task
> rcu-torture: rcu_torture_stats task started
> rcu-torture: torture_shuffle task started
> rcu-torture: Creating torture_stutter task
> rcu-torture: torture_stutter task started
> rcu-torture: Creating rcu_torture_fwd_prog task
> rcu-torture: rcu_torture_fwd_progress task started
> rcu-torture: Creating rcu_torture_read_exit task
> rcu-torture: rcu_torture_read_exit: Start of test
> rcu-torture: rcu_torture_read_exit: End of episode
> rcu-torture: rcu_torture_read_exit: Start of episode
> rcu-torture: rcu_torture_read_exit: End of episode
> rcu-torture: rcu_torture_read_exit: Start of episode
> rcu-torture: rcu_torture_read_exit: End of episode
> LKP: stdout: 247: Kernel tests: Boot OK!
> =

> rcu-torture: rcu_torture_read_exit: Start of episode
> rcu-torture: rcu_torture_read_exit: End of episode
> =

> mount: /sys/kernel/debug: mount point does not exist.
> =

> LKP: stdout: 247: HOSTNAME vm-snb-67, MAC 52:54:00:12:34:56, kernel 5.17.=
0-rc1-00111-g556d8afe4a77 1
> =

> rcu-torture: rcu_torture_read_exit: Start of episode
> install debs round one: dpkg -i --force-confdef --force-depends /opt/deb/=
gawk_1%3a4.2.1+dfsg-1_amd64.deb
> =

> Selecting previously unselected package gawk.
> =

> (Reading database ... 16553 files and directories currently installed.)
> =

> Preparing to unpack .../gawk_1%3a4.2.1+dfsg-1_amd64.deb ...
> =

> Unpacking gawk (1:4.2.1+dfsg-1) ...
> =

> Setting up gawk (1:4.2.1+dfsg-1) ...
> =

> mount debug /sys/kernel/debug -t debugfs
> =

> rootfs on / type rootfs (rw)
> =

> rcu-torture: rcu_torture_read_exit: End of episode
> sysfs on /sys type sysfs (rw,nosuid,nodev,noexec,relatime)
> =

> proc on /proc type proc (rw,nosuid,nodev,noexec,relatime)
> =

> devtmpfs on /dev type devtmpfs (rw,nosuid,size=3D8122696k,nr_inodes=3D203=
0674,mode=3D755)
> =

> securityfs on /sys/kernel/security type securityfs (rw,nosuid,nodev,noexe=
c,relatime)
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

> cgroup2 on /sys/fs/cgroup/unified type cgroup2 (rw,nosuid,nodev,noexec,re=
latime,nsdelegate)
> =

> cgroup on /sys/fs/cgroup/systemd type cgroup (rw,nosuid,nodev,noexec,rela=
time,xattr,name=3Dsystemd)
> =

> cgroup on /sys/fs/cgroup/memory type cgroup (rw,nosuid,nodev,noexec,relat=
ime,memory)
> =

> cgroup on /sys/fs/cgroup/rdma type cgroup (rw,nosuid,nodev,noexec,relatim=
e,rdma)
> =

> cgroup on /sys/fs/cgroup/cpuset type cgroup (rw,nosuid,nodev,noexec,relat=
ime,cpuset)
> =

> cgroup on /sys/fs/cgroup/misc type cgroup (rw,nosuid,nodev,noexec,relatim=
e,misc)
> =

> cgroup on /sys/fs/cgroup/perf_event type cgroup (rw,nosuid,nodev,noexec,r=
elatime,perf_event)
> =

> cgroup on /sys/fs/cgroup/debug type cgroup (rw,nosuid,nodev,noexec,relati=
me,debug)
> =

> cgroup on /sys/fs/cgroup/cpu,cpuacct type cgroup (rw,nosuid,nodev,noexec,=
relatime,cpu,cpuacct)
> =

> cgroup on /sys/fs/cgroup/devices type cgroup (rw,nosuid,nodev,noexec,rela=
time,devices)
> =

> cgroup on /sys/fs/cgroup/pids type cgroup (rw,nosuid,nodev,noexec,relatim=
e,pids)
> =

> mqueue on /dev/mqueue type mqueue (rw,relatime)
> =

> hugetlbfs on /dev/hugepages type hugetlbfs (rw,relatime,pagesize=3D2M)
> =

> configfs on /sys/kernel/config type configfs (rw,relatime)
> =

> tmp on /tmp type tmpfs (rw,relatime)
> =

> nodev	sysfs
> =

> nodev	tmpfs
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

> nodev	configfs
> =

> nodev	tracefs
> =

> nodev	securityfs
> =

> nodev	sockfs
> =

> nodev	pipefs
> =

> nodev	ramfs
> =

> nodev	hugetlbfs
> =

> nodev	devpts
> =

> nodev	mqueue
> =

> nodev	binder
> =

> nodev	autofs
> =

> rcu-torture: rtc: 00000000cc758e4b ver: 5 tfle: 0 rta: 6 rtaf: 0 rtf: 2 r=
tmbe: 0 rtmbkf: 0/0 rtbe: 0 rtbke: 0 rtbre: 0 rtbf: 0 rtb: 0 nt: 760 onoff:=
 0/0:0/0 -1,0:-1,0 0:0 (HZ=3D1000) barrier: 0/0:0 read-exits: 84 nocb-toggl=
es: 0:0
> rcu-torture: Reader Pipe:  49488 0 0 0 0 0 0 0 0 0 0
> rcu-torture: Reader Batch:  49488 0 0 0 0 0 0 0 0 0 0
> rcu-torture: Free-Block Circulation:  5 4 3 2 2 2 2 2 2 2 0
> rcu_torture_fwd_prog: Starting forward-progress test 0
> rcu_torture_fwd_prog_cr: Starting forward-progress test 0
> rcu_torture_fwd_prog_cr: Waiting for CBs: rcu_barrier+0x0/0x253() 0
> rcu_torture_fwd_prog_cr Duration 475 barrier: 251 pending 103 n_launders:=
 1841 n_launders_sa: 103 n_max_gps: 100 n_max_cbs: 1425 cver 0 gps 14
> rcu_torture_fwd_cb_hist: Callback-invocation histogram 0 (duration 980 ji=
ffies): 1s/10: 648:3 2s/10: 0:1 3s/10: 1091:11402 4s/10: 1424:3 5s/10: 103:5
> rcu_torture_fwd_prog_nr: Starting forward-progress test 0
> rcu-torture: rcu_torture_read_exit: Start of episode
> rcu-torture: rcu_torture_read_exit: End of episode
> LKP: stdout: 247:  /lkp/lkp/src/bin/run-lkp /lkp/jobs/scheduled/vm-snb-67=
/rcutorture-300s-default-rcu-debian-10.4-x86_64-20200603.cgz-556d8afe4a779f=
41dfc8fa373993a88e43f1c5dc-20220309-61359-zgedsu-2.yaml
> =

> RESULT_ROOT=3D/result/rcutorture/300s-default-rcu/vm-snb/debian-10.4-x86_=
64-20200603.cgz/x86_64-randconfig-a012-20210928/gcc-9/556d8afe4a779f41dfc8f=
a373993a88e43f1c5dc/3
> =

> job=3D/lkp/jobs/scheduled/vm-snb-67/rcutorture-300s-default-rcu-debian-10=
.4-x86_64-20200603.cgz-556d8afe4a779f41dfc8fa373993a88e43f1c5dc-20220309-61=
359-zgedsu-2.yaml
> =

> result_service: raw_upload, RESULT_MNT: /internal-lkp-server/result, RESU=
LT_ROOT: /internal-lkp-server/result/rcutorture/300s-default-rcu/vm-snb/deb=
ian-10.4-x86_64-20200603.cgz/x86_64-randconfig-a012-20210928/gcc-9/556d8afe=
4a779f41dfc8fa373993a88e43f1c5dc/3, TMP_RESULT_ROOT: /tmp/lkp/result
> =

> run-job /lkp/jobs/scheduled/vm-snb-67/rcutorture-300s-default-rcu-debian-=
10.4-x86_64-20200603.cgz-556d8afe4a779f41dfc8fa373993a88e43f1c5dc-20220309-=
61359-zgedsu-2.yaml
> =

> rcu-torture: rcu_torture_read_exit: Start of episode
> rcu-torture: rcu_torture_read_exit: End of episode
> /usr/bin/wget -q --timeout=3D1800 --tries=3D1 --local-encoding=3DUTF-8 ht=
tp://internal-lkp-server:80/~lkp/cgi-bin/lkp-jobfile-append-var?job_file=3D=
/lkp/jobs/scheduled/vm-snb-67/rcutorture-300s-default-rcu-debian-10.4-x86_6=
4-20200603.cgz-556d8afe4a779f41dfc8fa373993a88e43f1c5dc-20220309-61359-zged=
su-2.yaml&job_state=3Drunning -O /dev/null
> =

> target ucode: =

> =

> 2022-03-08 20:12:30 modprobe rcutorture torture_type=3Drcu
> =

> 2022-03-08 20:12:31 sleep 300
> =

> rcu-torture: rcu_torture_read_exit: Start of episode
> rcu-torture: rcu_torture_read_exit: End of episode
> rcu_torture_fwd_prog_nr: 0 Duration 40623 cver 0 gps 14906
> rcu_torture_fwd_prog_nr: Waiting for CBs: rcu_barrier+0x0/0x253() 0
> rcu-torture: rcu_torture_read_exit: Start of episode
> rcu-torture: rcu_torture_read_exit: End of episode
> rcu-torture: rtc: 00000000cc758e4b ver: 5 tfle: 0 rta: 6 rtaf: 0 rtf: 2 r=
tmbe: 0 rtmbkf: 0/0 rtbe: 0 rtbke: 0 rtbre: 0 rtbf: 0 rtb: 0 nt: 1756 onoff=
: 0/0:0/0 -1,0:-1,0 0:0 (HZ=3D1000) barrier: 0/0:0 read-exits: 152 nocb-tog=
gles: 0:0
> rcu-torture: Reader Pipe:  118373 0 0 0 0 0 0 0 0 0 0
> rcu-torture: Reader Batch:  118373 0 0 0 0 0 0 0 0 0 0
> rcu-torture: Free-Block Circulation:  5 4 3 2 2 2 2 2 2 2 0
> ??? Writer stall state RTWS_POLL_WAIT_EXP(12) g109004 f0x0 ->state 0x2 cp=
u 1
> task:rcu_torture_wri state:D stack:    0 pid:  515 ppid:     2 flags:0x00=
004000
> Call Trace:
> <TASK>
> __schedule+0x6dd/0x721
> schedule+0x4e/0x83
> schedule_hrtimeout_range_clock+0xba/0x10c
> ? __hrtimer_init+0x135/0x135
> torture_hrtimeout_ns+0x65/0x6b [torture]
> rcu_torture_writer+0x4f5/0x766 [rcutorture]
> ? write_comp_data+0x20/0x71
> ? rcutorture_oom_notify+0x185/0x185 [rcutorture]
> kthread+0xf7/0x106
> ? kthread_complete_and_exit+0x2d/0x2d
> ret_from_fork+0x1f/0x30
> </TASK>
> rcu: rcu_sched: wait state: RCU_GP_WAIT_GPS(1) ->state: 0x402 ->rt_priori=
ty 0 delta ->gp_start 46 ->gp_activity 45 ->gp_req_activity 46 ->gp_wake_ti=
me 45 ->gp_wake_seq 109001 ->gp_seq 109004 ->gp_seq_needed 109004 ->gp_max =
133 ->gp_flags 0x0
> rcu: RCU callbacks invoked since boot: 174032
> rcu_tasks: RTGS_WAIT_CBS(11) since 176582 g:8 i:0/0 k. =

> rcu_tasks_rude: RTGS_WAIT_CBS(11) since 176790 g:8 i:0/3 k. =

> rcu_tasks_trace: RTGS_WAIT_CBS(11) since 176988 g:8 i:0/0 k. N0 h:0/0/0
> Dumping ftrace buffer:
> (ftrace buffer empty)
> rcu-torture: rcu_torture_read_exit: Start of episode
> rcu-torture: rcu_torture_read_exit: End of episode
> rcu-torture: rcu_torture_read_exit: Start of episode
> rcu-torture: rcu_torture_read_exit: End of episode
> rcu-torture: rcu_torture_read_exit: Start of episode
> rcu-torture: rcu_torture_read_exit: End of episode
> rcu_torture_fwd_prog n_max_cbs: 1425
> rcu_torture_fwd_prog: Starting forward-progress test 0
> rcu_torture_fwd_prog_cr: Starting forward-progress test 0
> rcu_torture_fwd_prog_cr: Waiting for CBs: rcu_barrier+0x0/0x253() 0
> rcu_torture_fwd_prog_cr Duration 205 barrier: 129 pending 103 n_launders:=
 1632 n_launders_sa: 102 n_max_gps: 100 n_max_cbs: 1225 cver 0 gps 11
> rcu_torture_fwd_cb_hist: Callback-invocation histogram 0 (duration 486 ji=
ffies): 1s/10: 1531:6 2s/10: 1223:4 3s/10: 103:5
> rcu-torture: rcu_torture_read_exit: Start of episode
> rcu-torture: rcu_torture_read_exit: End of episode
> rcu_torture_fwd_prog_nr: Starting forward-progress test 0
> rcu-torture: rcu_torture_read_exit: Start of episode
> rcu-torture: rcu_torture_read_exit: End of episode
> rcu-torture: rtc: 00000000cc758e4b ver: 5 tfle: 0 rta: 6 rtaf: 0 rtf: 2 r=
tmbe: 0 rtmbkf: 0/0 rtbe: 0 rtbke: 0 rtbre: 0 rtbf: 0 rtb: 0 nt: 3261 onoff=
: 0/0:0/0 -1,0:-1,0 0:0 (HZ=3D1000) barrier: 0/0:0 read-exits: 237 nocb-tog=
gles: 0:0
> rcu-torture: Reader Pipe:  221546 0 0 0 0 0 0 0 0 0 0
> rcu-torture: Reader Batch:  221546 0 0 0 0 0 0 0 0 0 0
> rcu-torture: Free-Block Circulation:  5 4 3 2 2 2 2 2 2 2 0
> ??? Writer stall state RTWS_POLL_WAIT_EXP(12) g141173 f0x2 ->state 0x0 cp=
u 1
> rcu: rcu_sched: wait state: RCU_GP_WAIT_FQS(5) ->state: 0x0 ->rt_priority=
 0 delta ->gp_start 9 ->gp_activity 9 ->gp_req_activity 9 ->gp_wake_time 8 =
->gp_wake_seq 141173 ->gp_seq 141173 ->gp_seq_needed 141176 ->gp_max 133 ->=
gp_flags 0x2
> rcu: 	rcu_node 0:1 ->gp_seq 141173 ->gp_seq_needed 141176 ->qsmask 0x0 ..=
.. ->n_boosts 0
> rcu: 	cpu 1 ->gp_seq_needed 141176
> rcu: RCU callbacks invoked since boot: 195553
> rcu_tasks: RTGS_WAIT_CBS(11) since 238020 g:8 i:0/0 k. =

> rcu_tasks_rude: RTGS_WAIT_CBS(11) since 238228 g:8 i:0/3 k. =

> rcu_tasks_trace: RTGS_WAIT_CBS(11) since 238425 g:8 i:0/0 k. N0 h:0/0/0
> rcu-torture: rcu_torture_read_exit: Start of episode
> rcu-torture: rcu_torture_read_exit: End of episode
> rcu_torture_fwd_prog_nr: 0 Duration 34398 cver 0 gps 12844
> rcu_torture_fwd_prog_nr: Waiting for CBs: rcu_barrier+0x0/0x253() 0
> rcu-torture: rcu_torture_read_exit: Start of episode
> rcu-torture: rcu_torture_read_exit: End of episode
> rcu-torture: rcu_torture_read_exit: Start of episode
> rcu-torture: rcu_torture_read_exit: End of episode
> rcu-torture: rcu_torture_read_exit: Start of episode
> rcu-torture: rcu_torture_read_exit: End of episode
> rcu-torture: rtc: 00000000cc758e4b ver: 5 tfle: 0 rta: 6 rtaf: 0 rtf: 2 r=
tmbe: 0 rtmbkf: 0/0 rtbe: 0 rtbke: 0 rtbre: 0 rtbf: 0 rtb: 0 nt: 4606 onoff=
: 0/0:0/0 -1,0:-1,0 0:0 (HZ=3D1000) barrier: 0/0:0 read-exits: 305 nocb-tog=
gles: 0:0
> rcu-torture: Reader Pipe:  312724 0 0 0 0 0 0 0 0 0 0
> rcu-torture: Reader Batch:  312724 0 0 0 0 0 0 0 0 0 0
> rcu-torture: Free-Block Circulation:  5 4 3 2 2 2 2 2 2 2 0
> ??? Writer stall state RTWS_POLL_WAIT_EXP(12) g178804 f0x0 ->state 0x0 cp=
u 1
> rcu: rcu_sched: wait state: RCU_GP_WAIT_GPS(1) ->state: 0x402 ->rt_priori=
ty 0 delta ->gp_start 25 ->gp_activity 24 ->gp_req_activity 25 ->gp_wake_ti=
me 24 ->gp_wake_seq 178801 ->gp_seq 178804 ->gp_seq_needed 178804 ->gp_max =
133 ->gp_flags 0x0
> rcu: RCU callbacks invoked since boot: 215714
> rcu_tasks: RTGS_WAIT_CBS(11) since 299456 g:8 i:0/0 k. =

> rcu_tasks_rude: RTGS_WAIT_CBS(11) since 299664 g:8 i:0/3 k. =

> rcu_tasks_trace: RTGS_WAIT_CBS(11) since 299861 g:8 i:0/0 k. N0 h:0/0/0
> rcu-torture: rcu_torture_read_exit: Start of episode
> rcu-torture: rcu_torture_read_exit: End of episode
> rcu-torture: rcu_torture_read_exit: Start of episode
> rcu-torture: rcu_torture_read_exit: End of episode
> rcu_torture_fwd_prog n_max_cbs: 1225
> rcu_torture_fwd_prog: Starting forward-progress test 0
> rcu_torture_fwd_prog_cr: Starting forward-progress test 0
> rcu_torture_fwd_prog_cr: Waiting for CBs: rcu_barrier+0x0/0x253() 0
> rcu_torture_fwd_prog_cr Duration 245 barrier: 126 pending 104 n_launders:=
 1742 n_launders_sa: 103 n_max_gps: 100 n_max_cbs: 1185 cver 0 gps 31
> rcu_torture_fwd_cb_hist: Callback-invocation histogram 0 (duration 517 ji=
ffies): 1s/10: 592:2 2s/10: 2231:28 3s/10: 104:5
> rcu_torture_fwd_prog_nr: Starting forward-progress test 0
> rcu-torture: rcu_torture_read_exit: Start of episode
> rcu-torture: rcu_torture_read_exit: End of episode
> rcu-torture: rcu_torture_read_exit: Start of episode
> rcu-torture: rcu_torture_read_exit: End of episode
> 2022-03-08 20:17:31 rmmod rcutorture
> =

> rcu-torture: Stopping torture_shuffle task
> rcu-torture: torture_shuffle is stopping
> rcu-torture: Stopping torture_stutter task
> rcu-torture: torture_stutter is stopping
> rcu: rcu_sched: wait state: RCU_GP_WAIT_FQS(5) ->state: 0x402 ->rt_priori=
ty 0 delta ->gp_start 0 ->gp_activity 0 ->gp_req_activity 0 ->gp_wake_time =
0 ->gp_wake_seq 231476 ->gp_seq 231477 ->gp_seq_needed 231480 ->gp_max 133 =
->gp_flags 0x0
> rcu: 	rcu_node 0:1 ->gp_seq 231477 ->gp_seq_needed 231484 ->qsmask 0x0 ..=
.. ->n_boosts 0
> rcu: 	cpu 1 ->gp_seq_needed 231480
> rcu: RCU callbacks invoked since boot: 241662
> rcu_tasks: RTGS_WAIT_CBS(11) since 353737 g:8 i:0/0 k. =

> rcu_tasks_rude: RTGS_WAIT_CBS(11) since 353944 g:8 i:0/3 k. =

> rcu_tasks_trace: RTGS_WAIT_CBS(11) since 354142 g:8 i:0/0 k. N0 h:0/0/0
> rcu-torture: rcu_torture_reader is stopping
> rcu_torture_fwd_prog_nr: Waiting for CBs: rcu_barrier+0x0/0x253() 0
> rcu_torture_fwd_prog: tested 2 tested_tries 3
> rcu-torture: rcu_torture_fwd_prog is stopping
> rcu-torture: rcu_torture_read_exit is stopping
> rcu-torture: Stopping rcutorture_read_exit task
> rcu-torture: Stopping rcu_torture_fwd_prog task
> rcu-torture: Stopping rcu_torture_writer task
> rcu-torture: rtc: 00000000cc758e4b ver: 5 tfle: 0 rta: 6 rtaf: 0 rtf: 2 r=
tmbe: 0 rtmbkf: 0/0 rtbe: 0 rtbke: 0 rtbre: 0 rtbf: 0 rtb: 0 nt: 5832 onoff=
: 0/0:0/0 -1,0:-1,0 0:0 (HZ=3D1000) barrier: 0/0:0 read-exits: 373 nocb-tog=
gles: 0:0
> rcu-torture: Reader Pipe:  402665 0 0 0 0 0 0 0 0 0 0
> rcu-torture: Reader Batch:  402665 0 0 0 0 0 0 0 0 0 0
> rcu-torture: Free-Block Circulation:  5 4 3 2 2 2 2 2 2 2 0
> ??? Writer stall state RTWS_POLL_WAIT_EXP(12) g232412 f0x0 ->state 0x2 cp=
u 1
> rcu: rcu_sched: wait state: RCU_GP_WAIT_GPS(1) ->state: 0x402 ->rt_priori=
ty 0 delta ->gp_start 130 ->gp_activity 129 ->gp_req_activity 130 ->gp_wake=
_time 129 ->gp_wake_seq 232409 ->gp_seq 232412 ->gp_seq_needed 232412 ->gp_=
max 133 ->gp_flags 0x0
> rcu: RCU callbacks invoked since boot: 243296
> rcu_tasks: RTGS_WAIT_CBS(11) since 360896 g:8 i:0/0 k. =

> rcu_tasks_rude: RTGS_WAIT_CBS(11) since 361103 g:8 i:0/3 k. =

> rcu_tasks_trace: RTGS_WAIT_CBS(11) since 361301 g:8 i:0/0 k. N0 h:0/0/0
> rcu-torture: rcu_torture_stats is stopping
> Started /etc/rc.local Compatibility.
> Reached target Login Prompts.
> Reached target Multi-User System.
> Starting watchdog daemon...
> Started watchdog daemon.
> Reached target Graphical Interface.
> Starting Update UTMP about System Runlevel Changes...
> Started Update UTMP about System Runlevel Changes.
> BUG: workqueue lockup - pool cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 stuck=
 for 338s!
> Showing busy workqueues and worker pools:
> workqueue events: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D15/256 refcnt=3D16
> pending: do_free_init, e1000_watchdog, vmstat_shepherd, kfree_rcu_monitor=
, regulator_init_complete_work_function, kernfs_notify_workfn, release_one_=
tty, key_garbage_collector, release_one_tty, release_one_tty, release_one_t=
ty, release_one_tty, release_one_tty, release_one_tty, release_one_tty
> workqueue events_unbound: flags=3D0x2
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D4/512 refcnt=3D7
> in-flight: 40:fsnotify_mark_destroy_workfn fsnotify_mark_destroy_workfn B=
AR(1), 9:fsnotify_connector_destroy_workfn fsnotify_connector_destroy_workfn
> workqueue events_power_efficient: flags=3D0x80
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D7/256 refcnt=3D8
> pending: neigh_managed_work, neigh_managed_work, neigh_managed_work, neig=
h_periodic_work, neigh_periodic_work, neigh_periodic_work, check_lifetime
> workqueue rcu_gp: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D3/256 refcnt=3D4
> in-flight: 179:sync_rcu_do_polled_gp
> pending: sync_rcu_do_polled_gp, process_srcu
> workqueue mm_percpu_wq: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/256 refcnt=3D2
> pending: vmstat_update
> workqueue cgroup_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D9
> pending: css_killed_work_fn
> inactive: css_killed_work_fn, css_killed_work_fn, css_release_work_fn, cs=
s_release_work_fn, css_killed_work_fn, css_killed_work_fn, css_killed_work_=
fn
> workqueue ipv6_addrconf: flags=3D0x40008
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: addrconf_verify_work
> pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hung=3D338s workers=3D3 id=
le: 23 36
> pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s workers=3D4 idle: 1871 =
1873
> BUG: workqueue lockup - pool cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 stuck=
 for 368s!
> Showing busy workqueues and worker pools:
> workqueue events: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D15/256 refcnt=3D16
> pending: do_free_init, e1000_watchdog, vmstat_shepherd, kfree_rcu_monitor=
, regulator_init_complete_work_function, kernfs_notify_workfn, release_one_=
tty, key_garbage_collector, release_one_tty, release_one_tty, release_one_t=
ty, release_one_tty, release_one_tty, release_one_tty, release_one_tty
> workqueue events_unbound: flags=3D0x2
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D4/512 refcnt=3D7
> in-flight: 40:fsnotify_mark_destroy_workfn fsnotify_mark_destroy_workfn B=
AR(1), 9:fsnotify_connector_destroy_workfn fsnotify_connector_destroy_workfn
> workqueue events_power_efficient: flags=3D0x80
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D7/256 refcnt=3D8
> pending: neigh_managed_work, neigh_managed_work, neigh_managed_work, neig=
h_periodic_work, neigh_periodic_work, neigh_periodic_work, check_lifetime
> workqueue rcu_gp: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D3/256 refcnt=3D4
> in-flight: 179:sync_rcu_do_polled_gp
> pending: sync_rcu_do_polled_gp, process_srcu
> workqueue mm_percpu_wq: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/256 refcnt=3D2
> pending: vmstat_update
> workqueue cgroup_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D9
> pending: css_killed_work_fn
> inactive: css_killed_work_fn, css_killed_work_fn, css_release_work_fn, cs=
s_release_work_fn, css_killed_work_fn, css_killed_work_fn, css_killed_work_=
fn
> workqueue ipv6_addrconf: flags=3D0x40008
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: addrconf_verify_work
> pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hung=3D368s workers=3D3 id=
le: 23 36
> pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s workers=3D4 idle: 1873 =
1871
> BUG: workqueue lockup - pool cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 stuck=
 for 399s!
> Showing busy workqueues and worker pools:
> workqueue events: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D15/256 refcnt=3D16
> pending: do_free_init, e1000_watchdog, vmstat_shepherd, kfree_rcu_monitor=
, regulator_init_complete_work_function, kernfs_notify_workfn, release_one_=
tty, key_garbage_collector, release_one_tty, release_one_tty, release_one_t=
ty, release_one_tty, release_one_tty, release_one_tty, release_one_tty
> workqueue events_unbound: flags=3D0x2
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D4/512 refcnt=3D7
> in-flight: 40:fsnotify_mark_destroy_workfn fsnotify_mark_destroy_workfn B=
AR(1), 9:fsnotify_connector_destroy_workfn fsnotify_connector_destroy_workfn
> workqueue events_power_efficient: flags=3D0x80
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D7/256 refcnt=3D8
> pending: neigh_managed_work, neigh_managed_work, neigh_managed_work, neig=
h_periodic_work, neigh_periodic_work, neigh_periodic_work, check_lifetime
> workqueue rcu_gp: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D3/256 refcnt=3D4
> in-flight: 179:sync_rcu_do_polled_gp
> pending: sync_rcu_do_polled_gp, process_srcu
> workqueue mm_percpu_wq: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/256 refcnt=3D2
> pending: vmstat_update
> workqueue cgroup_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D9
> pending: css_killed_work_fn
> inactive: css_killed_work_fn, css_killed_work_fn, css_release_work_fn, cs=
s_release_work_fn, css_killed_work_fn, css_killed_work_fn, css_killed_work_=
fn
> workqueue ipv6_addrconf: flags=3D0x40008
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: addrconf_verify_work
> pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hung=3D399s workers=3D3 id=
le: 23 36
> pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s workers=3D4 idle: 1871 =
1873
> BUG: workqueue lockup - pool cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 stuck=
 for 429s!
> Showing busy workqueues and worker pools:
> workqueue events: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D15/256 refcnt=3D16
> pending: do_free_init, e1000_watchdog, vmstat_shepherd, kfree_rcu_monitor=
, regulator_init_complete_work_function, kernfs_notify_workfn, release_one_=
tty, key_garbage_collector, release_one_tty, release_one_tty, release_one_t=
ty, release_one_tty, release_one_tty, release_one_tty, release_one_tty
> workqueue events_unbound: flags=3D0x2
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D4/512 refcnt=3D7
> in-flight: 40:fsnotify_mark_destroy_workfn fsnotify_mark_destroy_workfn B=
AR(1), 9:fsnotify_connector_destroy_workfn fsnotify_connector_destroy_workfn
> workqueue events_power_efficient: flags=3D0x80
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D7/256 refcnt=3D8
> pending: neigh_managed_work, neigh_managed_work, neigh_managed_work, neig=
h_periodic_work, neigh_periodic_work, neigh_periodic_work, check_lifetime
> workqueue rcu_gp: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D3/256 refcnt=3D4
> in-flight: 179:sync_rcu_do_polled_gp
> pending: sync_rcu_do_polled_gp, process_srcu
> workqueue mm_percpu_wq: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/256 refcnt=3D2
> pending: vmstat_update
> workqueue cgroup_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D9
> pending: css_killed_work_fn
> inactive: css_killed_work_fn, css_killed_work_fn, css_release_work_fn, cs=
s_release_work_fn, css_killed_work_fn, css_killed_work_fn, css_killed_work_=
fn
> workqueue ipv6_addrconf: flags=3D0x40008
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: addrconf_verify_work
> pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hung=3D429s workers=3D3 id=
le: 23 36
> pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s workers=3D4 idle: 1873 =
1871
> BUG: workqueue lockup - pool cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 stuck=
 for 459s!
> Showing busy workqueues and worker pools:
> workqueue events: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D15/256 refcnt=3D16
> pending: do_free_init, e1000_watchdog, vmstat_shepherd, kfree_rcu_monitor=
, regulator_init_complete_work_function, kernfs_notify_workfn, release_one_=
tty, key_garbage_collector, release_one_tty, release_one_tty, release_one_t=
ty, release_one_tty, release_one_tty, release_one_tty, release_one_tty
> workqueue events_unbound: flags=3D0x2
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D5/512 refcnt=3D8
> in-flight: 40:fsnotify_mark_destroy_workfn fsnotify_mark_destroy_workfn B=
AR(1), 9:fsnotify_connector_destroy_workfn fsnotify_connector_destroy_workfn
> pending: toggle_allocation_gate
> workqueue events_power_efficient: flags=3D0x80
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D7/256 refcnt=3D8
> pending: neigh_managed_work, neigh_managed_work, neigh_managed_work, neig=
h_periodic_work, neigh_periodic_work, neigh_periodic_work, check_lifetime
> workqueue rcu_gp: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D3/256 refcnt=3D4
> in-flight: 179:sync_rcu_do_polled_gp
> pending: sync_rcu_do_polled_gp, process_srcu
> workqueue mm_percpu_wq: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/256 refcnt=3D2
> pending: vmstat_update
> workqueue cgroup_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D9
> pending: css_killed_work_fn
> inactive: css_killed_work_fn, css_killed_work_fn, css_release_work_fn, cs=
s_release_work_fn, css_killed_work_fn, css_killed_work_fn, css_killed_work_=
fn
> workqueue ipv6_addrconf: flags=3D0x40008
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: addrconf_verify_work
> pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hung=3D459s workers=3D3 id=
le: 23 36
> pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s workers=3D4 idle: 1871 =
1873
> BUG: workqueue lockup - pool cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 stuck=
 for 489s!
> Showing busy workqueues and worker pools:
> workqueue events: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D15/256 refcnt=3D16
> pending: do_free_init, e1000_watchdog, vmstat_shepherd, kfree_rcu_monitor=
, regulator_init_complete_work_function, kernfs_notify_workfn, release_one_=
tty, key_garbage_collector, release_one_tty, release_one_tty, release_one_t=
ty, release_one_tty, release_one_tty, release_one_tty, release_one_tty
> workqueue events_unbound: flags=3D0x2
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D4/512 refcnt=3D7
> in-flight: 40:fsnotify_mark_destroy_workfn fsnotify_mark_destroy_workfn B=
AR(1), 9:fsnotify_connector_destroy_workfn fsnotify_connector_destroy_workfn
> workqueue events_power_efficient: flags=3D0x80
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D7/256 refcnt=3D8
> pending: neigh_managed_work, neigh_managed_work, neigh_managed_work, neig=
h_periodic_work, neigh_periodic_work, neigh_periodic_work, check_lifetime
> workqueue rcu_gp: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D3/256 refcnt=3D4
> in-flight: 179:sync_rcu_do_polled_gp
> pending: sync_rcu_do_polled_gp, process_srcu
> workqueue mm_percpu_wq: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/256 refcnt=3D2
> pending: vmstat_update
> workqueue cgroup_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D9
> pending: css_killed_work_fn
> inactive: css_killed_work_fn, css_killed_work_fn, css_release_work_fn, cs=
s_release_work_fn, css_killed_work_fn, css_killed_work_fn, css_killed_work_=
fn
> workqueue ipv6_addrconf: flags=3D0x40008
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: addrconf_verify_work
> pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hung=3D489s workers=3D3 id=
le: 23 36
> pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s workers=3D4 idle: 1873 =
1871
> BUG: workqueue lockup - pool cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 stuck=
 for 519s!
> Showing busy workqueues and worker pools:
> workqueue events: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D15/256 refcnt=3D16
> pending: do_free_init, e1000_watchdog, vmstat_shepherd, kfree_rcu_monitor=
, regulator_init_complete_work_function, kernfs_notify_workfn, release_one_=
tty, key_garbage_collector, release_one_tty, release_one_tty, release_one_t=
ty, release_one_tty, release_one_tty, release_one_tty, release_one_tty
> workqueue events_unbound: flags=3D0x2
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D4/512 refcnt=3D7
> in-flight: 40:fsnotify_mark_destroy_workfn fsnotify_mark_destroy_workfn B=
AR(1), 9:fsnotify_connector_destroy_workfn fsnotify_connector_destroy_workfn
> workqueue events_power_efficient: flags=3D0x80
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D7/256 refcnt=3D8
> pending: neigh_managed_work, neigh_managed_work, neigh_managed_work, neig=
h_periodic_work, neigh_periodic_work, neigh_periodic_work, check_lifetime
> workqueue rcu_gp: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D3/256 refcnt=3D4
> in-flight: 179:sync_rcu_do_polled_gp
> pending: sync_rcu_do_polled_gp, process_srcu
> workqueue mm_percpu_wq: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/256 refcnt=3D2
> pending: vmstat_update
> workqueue cgroup_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D9
> pending: css_killed_work_fn
> inactive: css_killed_work_fn, css_killed_work_fn, css_release_work_fn, cs=
s_release_work_fn, css_killed_work_fn, css_killed_work_fn, css_killed_work_=
fn
> workqueue ipv6_addrconf: flags=3D0x40008
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: addrconf_verify_work
> pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hung=3D519s workers=3D3 id=
le: 23 36
> pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s workers=3D4 idle: 1871 =
1873
> BUG: workqueue lockup - pool cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 stuck=
 for 550s!
> Showing busy workqueues and worker pools:
> workqueue events: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D15/256 refcnt=3D16
> pending: do_free_init, e1000_watchdog, vmstat_shepherd, kfree_rcu_monitor=
, regulator_init_complete_work_function, kernfs_notify_workfn, release_one_=
tty, key_garbage_collector, release_one_tty, release_one_tty, release_one_t=
ty, release_one_tty, release_one_tty, release_one_tty, release_one_tty
> workqueue events_unbound: flags=3D0x2
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D4/512 refcnt=3D7
> in-flight: 40:fsnotify_mark_destroy_workfn fsnotify_mark_destroy_workfn B=
AR(1), 9:fsnotify_connector_destroy_workfn fsnotify_connector_destroy_workfn
> workqueue events_power_efficient: flags=3D0x80
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D7/256 refcnt=3D8
> pending: neigh_managed_work, neigh_managed_work, neigh_managed_work, neig=
h_periodic_work, neigh_periodic_work, neigh_periodic_work, check_lifetime
> workqueue rcu_gp: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D3/256 refcnt=3D4
> in-flight: 179:sync_rcu_do_polled_gp
> pending: sync_rcu_do_polled_gp, process_srcu
> workqueue mm_percpu_wq: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/256 refcnt=3D2
> pending: vmstat_update
> workqueue cgroup_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D9
> pending: css_killed_work_fn
> inactive: css_killed_work_fn, css_killed_work_fn, css_release_work_fn, cs=
s_release_work_fn, css_killed_work_fn, css_killed_work_fn, css_killed_work_=
fn
> workqueue ipv6_addrconf: flags=3D0x40008
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: addrconf_verify_work
> pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hung=3D550s workers=3D3 id=
le: 23 36
> pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s workers=3D4 idle: 1873 =
1871
> BUG: workqueue lockup - pool cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 stuck=
 for 580s!
> Showing busy workqueues and worker pools:
> workqueue events: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D15/256 refcnt=3D16
> pending: do_free_init, e1000_watchdog, vmstat_shepherd, kfree_rcu_monitor=
, regulator_init_complete_work_function, kernfs_notify_workfn, release_one_=
tty, key_garbage_collector, release_one_tty, release_one_tty, release_one_t=
ty, release_one_tty, release_one_tty, release_one_tty, release_one_tty
> workqueue events_unbound: flags=3D0x2
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D4/512 refcnt=3D7
> in-flight: 40:fsnotify_mark_destroy_workfn fsnotify_mark_destroy_workfn B=
AR(1), 9:fsnotify_connector_destroy_workfn fsnotify_connector_destroy_workfn
> workqueue events_power_efficient: flags=3D0x80
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D7/256 refcnt=3D8
> pending: neigh_managed_work, neigh_managed_work, neigh_managed_work, neig=
h_periodic_work, neigh_periodic_work, neigh_periodic_work, check_lifetime
> workqueue rcu_gp: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D3/256 refcnt=3D4
> in-flight: 179:sync_rcu_do_polled_gp
> pending: sync_rcu_do_polled_gp, process_srcu
> workqueue mm_percpu_wq: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/256 refcnt=3D2
> pending: vmstat_update
> workqueue cgroup_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D9
> pending: css_killed_work_fn
> inactive: css_killed_work_fn, css_killed_work_fn, css_release_work_fn, cs=
s_release_work_fn, css_killed_work_fn, css_killed_work_fn, css_killed_work_=
fn
> workqueue ipv6_addrconf: flags=3D0x40008
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: addrconf_verify_work
> pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hung=3D580s workers=3D3 id=
le: 23 36
> pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s workers=3D4 idle: 1871 =
1873
> BUG: workqueue lockup - pool cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 stuck=
 for 610s!
> Showing busy workqueues and worker pools:
> workqueue events: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D15/256 refcnt=3D16
> pending: do_free_init, e1000_watchdog, vmstat_shepherd, kfree_rcu_monitor=
, regulator_init_complete_work_function, kernfs_notify_workfn, release_one_=
tty, key_garbage_collector, release_one_tty, release_one_tty, release_one_t=
ty, release_one_tty, release_one_tty, release_one_tty, release_one_tty
> workqueue events_unbound: flags=3D0x2
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D5/512 refcnt=3D8
> in-flight: 40:fsnotify_mark_destroy_workfn fsnotify_mark_destroy_workfn B=
AR(1), 9:fsnotify_connector_destroy_workfn fsnotify_connector_destroy_workfn
> pending: toggle_allocation_gate
> workqueue events_power_efficient: flags=3D0x80
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D7/256 refcnt=3D8
> pending: neigh_managed_work, neigh_managed_work, neigh_managed_work, neig=
h_periodic_work, neigh_periodic_work, neigh_periodic_work, check_lifetime
> workqueue rcu_gp: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D3/256 refcnt=3D4
> in-flight: 179:sync_rcu_do_polled_gp
> pending: sync_rcu_do_polled_gp, process_srcu
> workqueue mm_percpu_wq: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/256 refcnt=3D2
> pending: vmstat_update
> workqueue cgroup_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D9
> pending: css_killed_work_fn
> inactive: css_killed_work_fn, css_killed_work_fn, css_release_work_fn, cs=
s_release_work_fn, css_killed_work_fn, css_killed_work_fn, css_killed_work_=
fn
> workqueue ipv6_addrconf: flags=3D0x40008
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: addrconf_verify_work
> pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hung=3D610s workers=3D3 id=
le: 23 36
> pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s workers=3D4 idle: 1873 =
1871
> BUG: workqueue lockup - pool cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 stuck=
 for 640s!
> Showing busy workqueues and worker pools:
> workqueue events: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D15/256 refcnt=3D16
> pending: do_free_init, e1000_watchdog, vmstat_shepherd, kfree_rcu_monitor=
, regulator_init_complete_work_function, kernfs_notify_workfn, release_one_=
tty, key_garbage_collector, release_one_tty, release_one_tty, release_one_t=
ty, release_one_tty, release_one_tty, release_one_tty, release_one_tty
> workqueue events_unbound: flags=3D0x2
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D4/512 refcnt=3D7
> in-flight: 40:fsnotify_mark_destroy_workfn fsnotify_mark_destroy_workfn B=
AR(1), 9:fsnotify_connector_destroy_workfn fsnotify_connector_destroy_workfn
> workqueue events_power_efficient: flags=3D0x80
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D7/256 refcnt=3D8
> pending: neigh_managed_work, neigh_managed_work, neigh_managed_work, neig=
h_periodic_work, neigh_periodic_work, neigh_periodic_work, check_lifetime
> workqueue rcu_gp: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D3/256 refcnt=3D4
> in-flight: 179:sync_rcu_do_polled_gp
> pending: sync_rcu_do_polled_gp, process_srcu
> workqueue mm_percpu_wq: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/256 refcnt=3D2
> pending: vmstat_update
> workqueue cgroup_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D9
> pending: css_killed_work_fn
> inactive: css_killed_work_fn, css_killed_work_fn, css_release_work_fn, cs=
s_release_work_fn, css_killed_work_fn, css_killed_work_fn, css_killed_work_=
fn
> workqueue ipv6_addrconf: flags=3D0x40008
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: addrconf_verify_work
> pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hung=3D640s workers=3D3 id=
le: 23 36
> pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s workers=3D4 idle: 1873 =
1871
> BUG: workqueue lockup - pool cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 stuck=
 for 670s!
> Showing busy workqueues and worker pools:
> workqueue events: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D15/256 refcnt=3D16
> pending: do_free_init, e1000_watchdog, vmstat_shepherd, kfree_rcu_monitor=
, regulator_init_complete_work_function, kernfs_notify_workfn, release_one_=
tty, key_garbage_collector, release_one_tty, release_one_tty, release_one_t=
ty, release_one_tty, release_one_tty, release_one_tty, release_one_tty
> workqueue events_unbound: flags=3D0x2
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D4/512 refcnt=3D7
> in-flight: 40:fsnotify_mark_destroy_workfn fsnotify_mark_destroy_workfn B=
AR(1), 9:fsnotify_connector_destroy_workfn fsnotify_connector_destroy_workfn
> workqueue events_power_efficient: flags=3D0x80
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D7/256 refcnt=3D8
> pending: neigh_managed_work, neigh_managed_work, neigh_managed_work, neig=
h_periodic_work, neigh_periodic_work, neigh_periodic_work, check_lifetime
> workqueue rcu_gp: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D3/256 refcnt=3D4
> in-flight: 179:sync_rcu_do_polled_gp
> pending: sync_rcu_do_polled_gp, process_srcu
> workqueue mm_percpu_wq: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/256 refcnt=3D2
> pending: vmstat_update
> workqueue cgroup_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D9
> pending: css_killed_work_fn
> inactive: css_killed_work_fn, css_killed_work_fn, css_release_work_fn, cs=
s_release_work_fn, css_killed_work_fn, css_killed_work_fn, css_killed_work_=
fn
> workqueue ipv6_addrconf: flags=3D0x40008
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: addrconf_verify_work
> pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hung=3D671s workers=3D3 id=
le: 23 36
> pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s workers=3D4 idle: 1873 =
1871
> BUG: workqueue lockup - pool cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 stuck=
 for 701s!
> Showing busy workqueues and worker pools:
> workqueue events: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D15/256 refcnt=3D16
> pending: do_free_init, e1000_watchdog, vmstat_shepherd, kfree_rcu_monitor=
, regulator_init_complete_work_function, kernfs_notify_workfn, release_one_=
tty, key_garbage_collector, release_one_tty, release_one_tty, release_one_t=
ty, release_one_tty, release_one_tty, release_one_tty, release_one_tty
> workqueue events_unbound: flags=3D0x2
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D4/512 refcnt=3D7
> in-flight: 40:fsnotify_mark_destroy_workfn fsnotify_mark_destroy_workfn B=
AR(1), 9:fsnotify_connector_destroy_workfn fsnotify_connector_destroy_workfn
> workqueue events_power_efficient: flags=3D0x80
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D7/256 refcnt=3D8
> pending: neigh_managed_work, neigh_managed_work, neigh_managed_work, neig=
h_periodic_work, neigh_periodic_work, neigh_periodic_work, check_lifetime
> workqueue rcu_gp: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D3/256 refcnt=3D4
> in-flight: 179:sync_rcu_do_polled_gp
> pending: sync_rcu_do_polled_gp, process_srcu
> workqueue mm_percpu_wq: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/256 refcnt=3D2
> pending: vmstat_update
> workqueue cgroup_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D9
> pending: css_killed_work_fn
> inactive: css_killed_work_fn, css_killed_work_fn, css_release_work_fn, cs=
s_release_work_fn, css_killed_work_fn, css_killed_work_fn, css_killed_work_=
fn
> workqueue ipv6_addrconf: flags=3D0x40008
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: addrconf_verify_work
> pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hung=3D701s workers=3D3 id=
le: 23 36
> pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s workers=3D4 idle: 1871 =
1873
> BUG: workqueue lockup - pool cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 stuck=
 for 731s!
> Showing busy workqueues and worker pools:
> workqueue events: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D15/256 refcnt=3D16
> pending: do_free_init, e1000_watchdog, vmstat_shepherd, kfree_rcu_monitor=
, regulator_init_complete_work_function, kernfs_notify_workfn, release_one_=
tty, key_garbage_collector, release_one_tty, release_one_tty, release_one_t=
ty, release_one_tty, release_one_tty, release_one_tty, release_one_tty
> workqueue events_unbound: flags=3D0x2
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D4/512 refcnt=3D7
> in-flight: 40:fsnotify_mark_destroy_workfn fsnotify_mark_destroy_workfn B=
AR(1), 9:fsnotify_connector_destroy_workfn fsnotify_connector_destroy_workfn
> workqueue events_power_efficient: flags=3D0x80
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D7/256 refcnt=3D8
> pending: neigh_managed_work, neigh_managed_work, neigh_managed_work, neig=
h_periodic_work, neigh_periodic_work, neigh_periodic_work, check_lifetime
> workqueue rcu_gp: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D3/256 refcnt=3D4
> in-flight: 179:sync_rcu_do_polled_gp
> pending: sync_rcu_do_polled_gp, process_srcu
> workqueue mm_percpu_wq: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/256 refcnt=3D2
> pending: vmstat_update
> workqueue cgroup_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D9
> pending: css_killed_work_fn
> inactive: css_killed_work_fn, css_killed_work_fn, css_release_work_fn, cs=
s_release_work_fn, css_killed_work_fn, css_killed_work_fn, css_killed_work_=
fn
> workqueue ipv6_addrconf: flags=3D0x40008
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: addrconf_verify_work
> pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hung=3D731s workers=3D3 id=
le: 23 36
> pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s workers=3D4 idle: 1873 =
1871
> BUG: workqueue lockup - pool cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 stuck=
 for 761s!
> Showing busy workqueues and worker pools:
> workqueue events: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D15/256 refcnt=3D16
> pending: do_free_init, e1000_watchdog, vmstat_shepherd, kfree_rcu_monitor=
, regulator_init_complete_work_function, kernfs_notify_workfn, release_one_=
tty, key_garbage_collector, release_one_tty, release_one_tty, release_one_t=
ty, release_one_tty, release_one_tty, release_one_tty, release_one_tty
> workqueue events_unbound: flags=3D0x2
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D4/512 refcnt=3D7
> in-flight: 40:fsnotify_mark_destroy_workfn fsnotify_mark_destroy_workfn B=
AR(1), 9:fsnotify_connector_destroy_workfn fsnotify_connector_destroy_workfn
> workqueue events_power_efficient: flags=3D0x80
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D7/256 refcnt=3D8
> pending: neigh_managed_work, neigh_managed_work, neigh_managed_work, neig=
h_periodic_work, neigh_periodic_work, neigh_periodic_work, check_lifetime
> workqueue rcu_gp: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D3/256 refcnt=3D4
> in-flight: 179:sync_rcu_do_polled_gp
> pending: sync_rcu_do_polled_gp, process_srcu
> workqueue mm_percpu_wq: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/256 refcnt=3D2
> pending: vmstat_update
> workqueue cgroup_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D9
> pending: css_killed_work_fn
> inactive: css_killed_work_fn, css_killed_work_fn, css_release_work_fn, cs=
s_release_work_fn, css_killed_work_fn, css_killed_work_fn, css_killed_work_=
fn
> workqueue ipv6_addrconf: flags=3D0x40008
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: addrconf_verify_work
> pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hung=3D761s workers=3D3 id=
le: 23 36
> pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s workers=3D4 idle: 1871 =
1873
> BUG: workqueue lockup - pool cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 stuck=
 for 791s!
> Showing busy workqueues and worker pools:
> workqueue events: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D15/256 refcnt=3D16
> pending: do_free_init, e1000_watchdog, vmstat_shepherd, kfree_rcu_monitor=
, regulator_init_complete_work_function, kernfs_notify_workfn, release_one_=
tty, key_garbage_collector, release_one_tty, release_one_tty, release_one_t=
ty, release_one_tty, release_one_tty, release_one_tty, release_one_tty
> workqueue events_unbound: flags=3D0x2
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D4/512 refcnt=3D7
> in-flight: 40:fsnotify_mark_destroy_workfn fsnotify_mark_destroy_workfn B=
AR(1), 9:fsnotify_connector_destroy_workfn fsnotify_connector_destroy_workfn
> workqueue events_power_efficient: flags=3D0x80
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D7/256 refcnt=3D8
> pending: neigh_managed_work, neigh_managed_work, neigh_managed_work, neig=
h_periodic_work, neigh_periodic_work, neigh_periodic_work, check_lifetime
> workqueue rcu_gp: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D3/256 refcnt=3D4
> in-flight: 179:sync_rcu_do_polled_gp
> pending: sync_rcu_do_polled_gp, process_srcu
> workqueue mm_percpu_wq: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/256 refcnt=3D2
> pending: vmstat_update
> workqueue cgroup_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D9
> pending: css_killed_work_fn
> inactive: css_killed_work_fn, css_killed_work_fn, css_release_work_fn, cs=
s_release_work_fn, css_killed_work_fn, css_killed_work_fn, css_killed_work_=
fn
> workqueue ipv6_addrconf: flags=3D0x40008
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: addrconf_verify_work
> pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hung=3D791s workers=3D3 id=
le: 23 36
> pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s workers=3D4 idle: 1873 =
1871
> BUG: workqueue lockup - pool cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 stuck=
 for 822s!
> Showing busy workqueues and worker pools:
> workqueue events: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D15/256 refcnt=3D16
> pending: do_free_init, e1000_watchdog, vmstat_shepherd, kfree_rcu_monitor=
, regulator_init_complete_work_function, kernfs_notify_workfn, release_one_=
tty, key_garbage_collector, release_one_tty, release_one_tty, release_one_t=
ty, release_one_tty, release_one_tty, release_one_tty, release_one_tty
> workqueue events_unbound: flags=3D0x2
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D5/512 refcnt=3D8
> in-flight: 40:fsnotify_mark_destroy_workfn fsnotify_mark_destroy_workfn B=
AR(1), 9:fsnotify_connector_destroy_workfn fsnotify_connector_destroy_workfn
> pending: toggle_allocation_gate
> workqueue events_power_efficient: flags=3D0x80
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D7/256 refcnt=3D8
> pending: neigh_managed_work, neigh_managed_work, neigh_managed_work, neig=
h_periodic_work, neigh_periodic_work, neigh_periodic_work, check_lifetime
> workqueue rcu_gp: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D3/256 refcnt=3D4
> in-flight: 179:sync_rcu_do_polled_gp
> pending: sync_rcu_do_polled_gp, process_srcu
> workqueue mm_percpu_wq: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/256 refcnt=3D2
> pending: vmstat_update
> workqueue cgroup_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D9
> pending: css_killed_work_fn
> inactive: css_killed_work_fn, css_killed_work_fn, css_release_work_fn, cs=
s_release_work_fn, css_killed_work_fn, css_killed_work_fn, css_killed_work_=
fn
> workqueue ipv6_addrconf: flags=3D0x40008
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: addrconf_verify_work
> pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hung=3D822s workers=3D3 id=
le: 23 36
> pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s workers=3D4 idle: 1871 =
1873
> BUG: workqueue lockup - pool cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 stuck=
 for 852s!
> Showing busy workqueues and worker pools:
> workqueue events: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D15/256 refcnt=3D16
> pending: do_free_init, e1000_watchdog, vmstat_shepherd, kfree_rcu_monitor=
, regulator_init_complete_work_function, kernfs_notify_workfn, release_one_=
tty, key_garbage_collector, release_one_tty, release_one_tty, release_one_t=
ty, release_one_tty, release_one_tty, release_one_tty, release_one_tty
> workqueue events_unbound: flags=3D0x2
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D4/512 refcnt=3D7
> in-flight: 40:fsnotify_mark_destroy_workfn fsnotify_mark_destroy_workfn B=
AR(1), 9:fsnotify_connector_destroy_workfn fsnotify_connector_destroy_workfn
> workqueue events_power_efficient: flags=3D0x80
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D7/256 refcnt=3D8
> pending: neigh_managed_work, neigh_managed_work, neigh_managed_work, neig=
h_periodic_work, neigh_periodic_work, neigh_periodic_work, check_lifetime
> workqueue rcu_gp: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D3/256 refcnt=3D4
> in-flight: 179:sync_rcu_do_polled_gp
> pending: sync_rcu_do_polled_gp, process_srcu
> workqueue mm_percpu_wq: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/256 refcnt=3D2
> pending: vmstat_update
> workqueue cgroup_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D9
> pending: css_killed_work_fn
> inactive: css_killed_work_fn, css_killed_work_fn, css_release_work_fn, cs=
s_release_work_fn, css_killed_work_fn, css_killed_work_fn, css_killed_work_=
fn
> workqueue ipv6_addrconf: flags=3D0x40008
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: addrconf_verify_work
> pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hung=3D852s workers=3D3 id=
le: 23 36
> pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s workers=3D4 idle: 1873 =
1871
> BUG: workqueue lockup - pool cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 stuck=
 for 882s!
> Showing busy workqueues and worker pools:
> workqueue events: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D15/256 refcnt=3D16
> pending: do_free_init, e1000_watchdog, vmstat_shepherd, kfree_rcu_monitor=
, regulator_init_complete_work_function, kernfs_notify_workfn, release_one_=
tty, key_garbage_collector, release_one_tty, release_one_tty, release_one_t=
ty, release_one_tty, release_one_tty, release_one_tty, release_one_tty
> workqueue events_unbound: flags=3D0x2
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D4/512 refcnt=3D7
> in-flight: 40:fsnotify_mark_destroy_workfn fsnotify_mark_destroy_workfn B=
AR(1), 9:fsnotify_connector_destroy_workfn fsnotify_connector_destroy_workfn
> workqueue events_power_efficient: flags=3D0x80
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D7/256 refcnt=3D8
> pending: neigh_managed_work, neigh_managed_work, neigh_managed_work, neig=
h_periodic_work, neigh_periodic_work, neigh_periodic_work, check_lifetime
> workqueue rcu_gp: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D3/256 refcnt=3D4
> in-flight: 179:sync_rcu_do_polled_gp
> pending: sync_rcu_do_polled_gp, process_srcu
> workqueue mm_percpu_wq: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/256 refcnt=3D2
> pending: vmstat_update
> workqueue cgroup_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D9
> pending: css_killed_work_fn
> inactive: css_killed_work_fn, css_killed_work_fn, css_release_work_fn, cs=
s_release_work_fn, css_killed_work_fn, css_killed_work_fn, css_killed_work_=
fn
> workqueue ipv6_addrconf: flags=3D0x40008
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: addrconf_verify_work
> pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hung=3D882s workers=3D3 id=
le: 23 36
> pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s workers=3D4 idle: 1871 =
1873
> BUG: workqueue lockup - pool cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 stuck=
 for 912s!
> Showing busy workqueues and worker pools:
> workqueue events: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D15/256 refcnt=3D16
> pending: do_free_init, e1000_watchdog, vmstat_shepherd, kfree_rcu_monitor=
, regulator_init_complete_work_function, kernfs_notify_workfn, release_one_=
tty, key_garbage_collector, release_one_tty, release_one_tty, release_one_t=
ty, release_one_tty, release_one_tty, release_one_tty, release_one_tty
> workqueue events_unbound: flags=3D0x2
> pwq 4: cpus=3D0-1 flags=3D0x4 nice=3D0 active=3D4/512 refcnt=3D7
> in-flight: 40:fsnotify_mark_destroy_workfn fsnotify_mark_destroy_workfn B=
AR(1), 9:fsnotify_connector_destroy_workfn fsnotify_connector_destroy_workfn
> workqueue events_power_efficient: flags=3D0x80
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D7/256 refcnt=3D8
> pending: neigh_managed_work, neigh_managed_work, neigh_managed_work, neig=
h_periodic_work, neigh_periodic_work, neigh_periodic_work, check_lifetime
> workqueue rcu_gp: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D3/256 refcnt=3D4
> in-flight: 179:sync_rcu_do_polled_gp
> pending: sync_rcu_do_polled_gp, process_srcu
> workqueue mm_percpu_wq: flags=3D0x8
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/256 refcnt=3D2
> pending: vmstat_update
> workqueue cgroup_destroy: flags=3D0x0
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D9
> pending: css_killed_work_fn
> inactive: css_killed_work_fn, css_killed_work_fn, css_release_work_fn, cs=
s_release_work_fn, css_killed_work_fn, css_killed_work_fn, css_killed_work_=
fn
> workqueue ipv6_addrconf: flags=3D0x40008
> pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/1 refcnt=3D2
> pending: addrconf_verify_work
> pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hung=3D912s workers=3D3 id=
le: 23 36
> pool 4: cpus=3D0-1 flags=3D0x4 nice=3D0 hung=3D0s workers=3D4 idle: 1873 =
1871
> INFO: task systemd:1 blocked for more than 491 seconds.
> Not tainted 5.17.0-rc1-00111-g556d8afe4a77 #1
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:systemd         state:D stack:    0 pid:    1 ppid:     0 flags:0x00=
004000
> Call Trace:
> <TASK>
> __schedule+0x6dd/0x721
> ? usleep_range_state+0x9d/0x9d
> schedule+0x4e/0x83
> schedule_timeout+0x38/0x106
> ? hlock_class+0x1a/0x5d
> ? write_comp_data+0x20/0x71
> ? lockdep_hardirqs_on_prepare+0x14a/0x169
> ? _raw_spin_unlock_irq+0x1f/0x29
> __wait_for_common+0xbd/0x11b
> __flush_work+0x391/0x3bf
> ? flush_workqueue_prep_pwqs+0x1ca/0x1ca
> ? __wait_for_common+0x3c/0x11b
> ? inotify_poll+0xaf/0xaf
> fsnotify_destroy_group+0xad/0xe9
> ? __sanitizer_cov_trace_pc+0x17/0x42
> ? locks_remove_file+0x131/0x13e
> ? inotify_poll+0xaf/0xaf
> inotify_release+0x15/0x19
> __fput+0x212/0x3c0
> task_work_run+0x94/0xbf
> exit_to_user_mode_prepare+0xb1/0x15c
> syscall_exit_to_user_mode+0x18/0x43
> do_syscall_64+0xa1/0xa7
> entry_SYSCALL_64_after_hwframe+0x44/0xae
> RIP: 0033:0x7fa39f4f7b54
> RSP: 002b:00007fffb0b4d7d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000003
> RAX: 0000000000000000 RBX: 0000000000000017 RCX: 00007fa39f4f7b54
> RDX: 00007fa39f5c8ca0 RSI: 0000000000000000 RDI: 0000000000000017
> RBP: 00007fa39e3468c0 R08: 00000000000000ef R09: 00007fa3a13f2060
> R10: 0000000000000007 R11: 0000000000000246 R12: 0000000000000000
> R13: 00007fffb0b4d890 R14: 0000000000000001 R15: 00007fa39f6e3a8e
> </TASK>
> INFO: task kworker/u4:1:9 blocked for more than 491 seconds.
> Not tainted 5.17.0-rc1-00111-g556d8afe4a77 #1
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:kworker/u4:1    state:D stack:    0 pid:    9 ppid:     2 flags:0x00=
004000
> Workqueue: events_unbound fsnotify_connector_destroy_workfn
> Call Trace:
> <TASK>
> __schedule+0x6dd/0x721
> ? to_kthread+0x2c/0x36
> ? usleep_range_state+0x9d/0x9d
> schedule+0x4e/0x83
> schedule_timeout+0x38/0x106
> ? mark_held_locks+0x4a/0x5c
> ? lockdep_hardirqs_on_prepare+0x14a/0x169
> ? _raw_spin_unlock_irq+0x1f/0x29
> __wait_for_common+0xbd/0x11b
> __synchronize_srcu+0xfd/0x10c
> ? rcu_tasks_pregp_step+0x5/0x5
> ? __wait_for_common+0x3c/0x11b
> fsnotify_connector_destroy_workfn+0x3d/0x6b
> process_one_work+0x3d6/0x66d
> worker_thread+0x29f/0x38a
> ? rescuer_thread+0x382/0x382
> kthread+0xf7/0x106
> ? kthread_complete_and_exit+0x2d/0x2d
> ret_from_fork+0x1f/0x30
> </TASK>
> INFO: task kworker/u4:2:40 blocked for more than 491 seconds.
> Not tainted 5.17.0-rc1-00111-g556d8afe4a77 #1
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:kworker/u4:2    state:D stack:    0 pid:   40 ppid:     2 flags:0x00=
004000
> Workqueue: events_unbound fsnotify_mark_destroy_workfn
> Call Trace:
> <TASK>
> __schedule+0x6dd/0x721
> ? to_kthread+0x2c/0x36
> ? usleep_range_state+0x9d/0x9d
> schedule+0x4e/0x83
> schedule_timeout+0x38/0x106
> ? mark_held_locks+0x4a/0x5c
> ? lockdep_hardirqs_on_prepare+0x14a/0x169
> ? _raw_spin_unlock_irq+0x1f/0x29
> __wait_for_common+0xbd/0x11b
> __synchronize_srcu+0xfd/0x10c
> ? rcu_tasks_pregp_step+0x5/0x5
> ? __wait_for_common+0x3c/0x11b
> fsnotify_mark_destroy_workfn+0x6a/0xc8
> process_one_work+0x3d6/0x66d
> worker_thread+0x29f/0x38a
> ? rescuer_thread+0x382/0x382
> kthread+0xf7/0x106
> ? kthread_complete_and_exit+0x2d/0x2d
> ret_from_fork+0x1f/0x30
> </TASK>
> INFO: task rmmod:1812 blocked for more than 491 seconds.
> Not tainted 5.17.0-rc1-00111-g556d8afe4a77 #1
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:rmmod           state:D stack:    0 pid: 1812 ppid:   508 flags:0x00=
004000
> Call Trace:
> <TASK>
> __schedule+0x6dd/0x721
> ? usleep_range_state+0x9d/0x9d
> schedule+0x4e/0x83
> schedule_timeout+0x38/0x106
> ? hlock_class+0x1a/0x5d
> ? write_comp_data+0x20/0x71
> ? lockdep_hardirqs_on_prepare+0x14a/0x169
> ? _raw_spin_unlock_irq+0x1f/0x29
> __wait_for_common+0xbd/0x11b
> kthread_stop+0x1bc/0x34c
> _torture_stop_kthread+0x5a/0x6a [torture]
> rcu_torture_cleanup+0x23b/0x834 [rcutorture]
> ? prepare_to_wait_exclusive+0x83/0x83
> __x64_sys_delete_module+0x109/0x1c3
> ? lockdep_hardirqs_on_prepare+0x14a/0x169
> do_syscall_64+0x85/0xa7
> entry_SYSCALL_64_after_hwframe+0x44/0xae
> RIP: 0033:0x7f93a158add7
> RSP: 002b:00007ffd6aef9048 EFLAGS: 00000206 ORIG_RAX: 00000000000000b0
> RAX: ffffffffffffffda RBX: 00007f93a3179900 RCX: 00007f93a158add7
> RDX: 000000000000000a RSI: 0000000000000800 RDI: 00007f93a3179968
> RBP: 0000000000000000 R08: 00007ffd6aef7fc1 R09: 0000000000000000
> R10: 00007f93a15fcae0 R11: 0000000000000206 R12: 00007ffd6aef9270
> R13: 00007ffd6aefadfc R14: 00007f93a3179260 R15: 00007f93a3179900
> </TASK>
> =

> Showing all locks held in the system:
> 2 locks held by kworker/u4:1/9:
> #0: ffff9b4480051548 ((wq_completion)events_unbound){+.+.}-{0:0}, at: pro=
cess_one_work+0x233/0x66d
> #1: ffff9b448016fe78 (connector_reaper_work){+.+.}-{0:0}, at: process_one=
_work+0x233/0x66d
> 1 lock held by khungtaskd/29:
> #0: ffffffffbaddd460 (rcu_read_lock){....}-{1:2}, at: rcu_lock_acquire+0x=
0/0x22
> 2 locks held by kworker/u4:2/40:
> #0: ffff9b4480051548 ((wq_completion)events_unbound){+.+.}-{0:0}, at: pro=
cess_one_work+0x233/0x66d
> #1: ffff9b4480c93e78 ((reaper_work).work){+.+.}-{0:0}, at: process_one_wo=
rk+0x233/0x66d
> 2 locks held by kworker/1:2/179:
> 1 lock held by in:imklog/431:
> 1 lock held by dmesg/440:
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =

> Kernel panic - not syncing: hung_task: blocked tasks
> CPU: 1 PID: 29 Comm: khungtaskd Not tainted 5.17.0-rc1-00111-g556d8afe4a7=
7 #1
> Call Trace:
> <TASK>
> dump_stack_lvl+0xcd/0x134
> panic+0x1c2/0x51f
> ? _printk+0x53/0x55
> ? watchdog+0x6ec/0x725
> watchdog+0x6f8/0x725
> ? rcu_read_unlock+0x94/0x94
> kthread+0xf7/0x106
> ? kthread_complete_and_exit+0x2d/0x2d
> ret_from_fork+0x1f/0x30
> </TASK>
> Kernel Offset: 0x38200000 from 0xffffffff81000000 (relocation range: 0xff=
ffffff80000000-0xffffffffbfffffff)
> =

> Kboot worker: lkp-worker57
> Elapsed time: 1020
> =

> kvm=3D(
> 	qemu-system-x86_64
> 	-enable-kvm
> 	-cpu SandyBridge
> 	-kernel $kernel
> 	-initrd initrd-vm-snb-67.cgz
> 	-m 16384
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
> 	ip=3D::::vm-snb-67::dhcp
> 	root=3D/dev/ram0
> 	RESULT_ROOT=3D/result/rcutorture/300s-default-rcu/vm-snb/debian-10.4-x86=
_64-20200603.cgz/x86_64-randconfig-a012-20210928/gcc-9/556d8afe4a779f41dfc8=
fa373993a88e43f1c5dc/3
> 	BOOT_IMAGE=3D/pkg/linux/x86_64-randconfig-a012-20210928/gcc-9/556d8afe4a=
779f41dfc8fa373993a88e43f1c5dc/vmlinuz-5.17.0-rc1-00111-g556d8afe4a77
> 	branch=3Dlinux-devel/devel-hourly-20220304-094445
> 	job=3D/job-script
> 	user=3Dlkp
> 	ARCH=3Dx86_64
> 	kconfig=3Dx86_64-randconfig-a012-20210928
> 	commit=3D556d8afe4a779f41dfc8fa373993a88e43f1c5dc
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

--===============2294622737143114451==--

