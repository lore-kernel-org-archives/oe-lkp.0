Content-Type: multipart/mixed; boundary="===============6000783729028472973=="
MIME-Version: 1.0
From: Kirill Tkhai <ktkhai@virtuozzo.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [bisect done] f0b07bb151 [ 0.250774] WARNING: possible recursive locking detected
Date: Mon, 02 Apr 2018 11:48:30 +0300
Message-ID: <dad011ec-bdfe-ba56-3f15-a69d18ce2231@virtuozzo.com>
In-Reply-To: <20180402015501.a4yy75j5gjq6hxp4@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============6000783729028472973==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

thanks for the report, but I've already fixed this in:

commit fc1dd36992bb
Author: Kirill Tkhai <ktkhai@virtuozzo.com>
Date:   Fri Mar 30 19:38:27 2018 +0300

    net: Remove net_rwsem from {, un}register_netdevice_notifier()

Kirill

On 02.04.2018 04:55, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> git://internal_merge_and_test_tree devel-catchup-201803300230
> =

> commit f0b07bb151b098d291fd1fd71ef7a2df56fb124a
> Author:     Kirill Tkhai <ktkhai@virtuozzo.com>
> AuthorDate: Thu Mar 29 19:20:32 2018 +0300
> Commit:     David S. Miller <davem@davemloft.net>
> CommitDate: Thu Mar 29 13:47:53 2018 -0400
> =

>     net: Introduce net_rwsem to protect net_namespace_list
>     =

>     rtnl_lock() is used everywhere, and contention is very high.
>     When someone wants to iterate over alive net namespaces,
>     he/she has no a possibility to do that without exclusive lock.
>     But the exclusive rtnl_lock() in such places is overkill,
>     and it just increases the contention. Yes, there is already
>     for_each_net_rcu() in kernel, but it requires rcu_read_lock(),
>     and this can't be sleepable. Also, sometimes it may be need
>     really prevent net_namespace_list growth, so for_each_net_rcu()
>     is not fit there.
>     =

>     This patch introduces new rw_semaphore, which will be used
>     instead of rtnl_mutex to protect net_namespace_list. It is
>     sleepable and allows not-exclusive iterations over net
>     namespaces list. It allows to stop using rtnl_lock()
>     in several places (what is made in next patches) and makes
>     less the time, we keep rtnl_mutex. Here we just add new lock,
>     while the explanation of we can remove rtnl_lock() there are
>     in next patches.
>     =

>     Fine grained locks generally are better, then one big lock,
>     so let's do that with net_namespace_list, while the situation
>     allows that.
>     =

>     Signed-off-by: Kirill Tkhai <ktkhai@virtuozzo.com>
>     Signed-off-by: David S. Miller <davem@davemloft.net>
> =

> 906edee91e  Merge branch 'net-bgmac-Couple-of-small-bgmac-changes'
> f0b07bb151  net: Introduce net_rwsem to protect net_namespace_list
> 860cf30996  0day head guard for 'devel-catchup-201803300230'
> +---------------------------------------------+------------+------------+=
------------+
> |                                             | 906edee91e | f0b07bb151 |=
 860cf30996 |
> +---------------------------------------------+------------+------------+=
------------+
> | boot_successes                              | 35         | 0          |=
 0          |
> | boot_failures                               | 0          | 15         |=
 15         |
> | WARNING:possible_recursive_locking_detected | 0          | 15         |=
 15         |
> | Mem-Info                                    | 0          | 1          |=
            |
> +---------------------------------------------+------------+------------+=
------------+
> =

> [    0.248557] Bluetooth: L2CAP socket layer initialized
> [    0.249157] NET: Registered protocol family 8
> [    0.249615] NET: Registered protocol family 20
> [    0.250096] =

> [    0.250252] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [    0.250774] WARNING: possible recursive locking detected
> [    0.251291] 4.16.0-rc6-01789-gf0b07bb1 #2 Not tainted
> [    0.251769] --------------------------------------------
> [    0.252000] swapper/0/1 is trying to acquire lock:
> [    0.252000]  (net_rwsem){++++}, at: [<8f7b464c>] wireless_nlevent_flus=
h+0x1d/0xb0
> [    0.252000] =

> [    0.252000] but task is already holding lock:
> [    0.252000]  (net_rwsem){++++}, at: [<7b706491>] register_netdevice_no=
tifier+0x6a/0x210
> [    0.252000] =

> [    0.252000] other info that might help us debug this:
> [    0.252000]  Possible unsafe locking scenario:
> [    0.252000] =

> [    0.252000]        CPU0
> [    0.252000]        ----
> [    0.252000]   lock(net_rwsem);
> [    0.252000] =

> [    0.252000]  *** DEADLOCK ***
> [    0.252000] =

> [    0.252000]  May be due to missing lock nesting notation
> [    0.252000] =

> [    0.252000] 2 locks held by swapper/0/1:
> [    0.252000]  #0:  (rtnl_mutex){+.+.}, at: [<31774005>] rtnl_lock+0x14/=
0x20
> [    0.252000]  #1:  (net_rwsem){++++}, at: [<7b706491>] register_netdevi=
ce_notifier+0x6a/0x210
> [    0.252000] =

> [    0.252000] stack backtrace:
> [    0.252000] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.16.0-rc6-01789=
-gf0b07bb1 #2
> [    0.252000] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [    0.252000] Call Trace:
> [    0.252000]  ? dump_stack+0x76/0xa9
> [    0.252000]  ? __lock_acquire+0xfb6/0x17d0
> [    0.252000]  ? rtnl_lock+0x14/0x20
> [    0.252000]  ? lock_acquire+0x88/0x1e0
> [    0.252000]  ? wireless_nlevent_flush+0x1d/0xb0
> [    0.252000]  ? down_read+0x34/0x90
> [    0.252000]  ? wireless_nlevent_flush+0x1d/0xb0
> [    0.252000]  ? wext_netdev_notifier_call+0xd/0x20
> [    0.252000]  ? register_netdevice_notifier+0xb6/0x210
> [    0.252000]  ? wext_pernet_init+0x43/0x43
> [    0.252000]  ? wireless_nlevent_init+0x24/0x3c
> [    0.252000]  ? wext_pernet_init+0x43/0x43
> [    0.252000]  ? do_one_initcall+0x46/0x180
> [    0.252000]  ? parse_args+0x1bb/0x300
> [    0.252000]  ? set_debug_rodata+0x14/0x14
> [    0.252000]  ? kernel_init_freeable+0xf4/0x167
> [    0.252000]  ? rest_init+0x1f0/0x1f0
> [    0.252000]  ? kernel_init+0xd/0x100
> [    0.252000]  ? ret_from_fork+0x19/0x30
> [    0.252266] dcdbas dcdbas: Dell Systems Management Base Driver (versio=
n 5.6.0-3.2)
> [    0.253551] clocksource: Switched to clocksource kvm-clock
> [    0.302953] FS-Cache: Loaded
> [    0.303362] pnp: PnP ACPI init
> [    0.303774] pnp 00:00: Plug and Play ACPI device, IDs PNP0b00 (active)
> =

>                                                           # HH:MM RESULT =
GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> git bisect start fe00c7574520313cab1f2b7e2a533ce39bf27cdb 3eb2ce825ea1ad8=
9d20f7a3b5780df850e4be274 --
> git bisect  bad 83a53cd7e6f147a2ca72274103bfe9772410ecdd  # 23:41  B     =
 0     1   15   0  Merge 'pm/testing' into devel-catchup-201803302147
> git bisect  bad 42afff1de206c3a2f7d6a50feba59f5c5be67433  # 23:57  B     =
 0     2   16   0  Merge 'intel-gvt-linux/gvt-staging' into devel-catchup-2=
01803302147
> git bisect  bad 3487547e336eb1fab61b0aa7594f48363c882876  # 00:16  B     =
 0     2   16   0  Merge 'net-next/master' into devel-catchup-201803302147
> git bisect good bfc5ba0b7f0680efbfa77033f087ee2ccbfe2e7e  # 00:28  G     =
11     0    0   0  0day base guard for 'devel-catchup-201803302147'
> git bisect good ec77789032c0d5ab77c32abd762f5a8e65198e1b  # 00:43  G     =
11     0    1   1  net: hns3: fix for use-after-free when setting ring para=
meter
> git bisect good da18ab32d78b6414267d3e5c8c9b5ab34a6d3321  # 00:54  G     =
10     0    1   1  tipc: tipc_disc_addr_trial_msg() can be static
> git bisect good 2a0f561bf81c13d36910c7312ac8c67f83320a07  # 01:08  G     =
11     0    1   1  net/mlx5e: Do not reset Receive Queue params on every ty=
pe change
> git bisect good 63f5be0a81e0c607255e8debab16e62670305fee  # 01:18  G     =
11     0    1   1  Merge tag 'iwlwifi-next-for-kalle-2018-03-28' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next
> git bisect  bad e3e67a4f07433d0159dcbd2abe7d6bdf6e1268c8  # 01:35  B     =
 0    11   25   0  Merge branch 'dsa-Add-ATU-VTU-statistics'
> git bisect  bad 6e2135ce54b72f8b2b20cef2a06ae6acb77a3431  # 01:49  B     =
 0    11   27   2  Merge tag 'mlx5-updates-2018-03-27' of git://git.kernel.=
org/pub/scm/linux/kernel/git/saeed/linux
> git bisect good 906edee91e79af5a348f1ad1b3f9b4b948db3db7  # 02:06  G     =
11     0    0   0  Merge branch 'net-bgmac-Couple-of-small-bgmac-changes'
> git bisect good db75373c91b0cfb6a68ad6ae88721e4e21ae6261  # 02:17  G     =
11     0    2   2  net/mlx5e: Recover Send Queue (SQ) from error state
> git bisect  bad 350311aab4c0b2477f9cf3fb03cef2e4cd6c3b18  # 02:31  B     =
 0    11   25   0  security: Remove rtnl_lock() in selinux_xfrm_notify_poli=
cyload()
> git bisect  bad 10256debb918aea083d0ddada64d29014c642a7b  # 02:45  B     =
 0     2   16   0  net: Don't take rtnl_lock() in wireless_nlevent_flush()
> git bisect  bad f0b07bb151b098d291fd1fd71ef7a2df56fb124a  # 03:02  B     =
 0     1   15   0  net: Introduce net_rwsem to protect net_namespace_list
> # first bad commit: [f0b07bb151b098d291fd1fd71ef7a2df56fb124a] net: Intro=
duce net_rwsem to protect net_namespace_list
> git bisect good 906edee91e79af5a348f1ad1b3f9b4b948db3db7  # 03:09  G     =
31     0    0   0  Merge branch 'net-bgmac-Couple-of-small-bgmac-changes'
> # extra tests with debug options
> git bisect  bad f0b07bb151b098d291fd1fd71ef7a2df56fb124a  # 03:23  B     =
 0    10   24   0  net: Introduce net_rwsem to protect net_namespace_list
> # extra tests on HEAD of linux-devel/devel-catchup-201803302147
> git bisect  bad fe00c7574520313cab1f2b7e2a533ce39bf27cdb  # 03:24  B     =
 0    35   52   0  0day head guard for 'devel-catchup-201803302147'
> # extra tests on tree/branch linux-devel/devel-catchup-201803300230
> git bisect  bad 860cf30996e27fdafe2aa5db34eaec8b36b2651f  # 03:47  B     =
 0     1   15   0  0day head guard for 'devel-catchup-201803300230'
> =

> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/lkp                          Intel Corpora=
tion
>=20

--===============6000783729028472973==--

