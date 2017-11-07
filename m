Content-Type: multipart/mixed; boundary="===============6604472128531350012=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [d_alloc_parallel] WARNING: bad unlock balance detected!
Date: Tue, 07 Nov 2017 10:01:13 +0800
Message-ID: <20171107020113.52ws4cqhonhk2zvw@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6604472128531350012==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

Here is a warning in v4.14-rc8 -- it's not necessarily a new bug.

[  428.512005] e1000: eth0 NIC Link is Up 1000 Mbps Full Duplex, Flow Contr=
ol: RX
LKP: HOSTNAME vm-lkp-wsx03-openwrt-i386-8, MAC , kernel 4.14.0-rc8 158, ser=
ial console /dev/ttyS0
[  429.798345] Kernel tests: Boot OK!
[  430.761760] =

[  430.766166] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[  430.775297] WARNING: bad unlock balance detected!
[  430.784342] 4.14.0-rc8 #158 Not tainted
[  430.792153] -------------------------------------
[  430.801319] pidof/1024 is trying to release lock (rcu_preempt_state) at:
[  430.813514] [<c10e4348>] rcu_read_unlock_special+0x5f8/0x620
[  430.824041] but there are no more locks to release!
[  430.833342] =

[  430.833342] other info that might help us debug this:
[  430.845985] 2 locks held by pidof/1024:
[  430.853826]  #0:  (&sb->s_type->i_mutex_key){....}, at: [<c1266efa>] loo=
kup_slow+0x8a/0x310
[  430.869344]  #1:  (rcu_read_lock){....}, at: [<c128094e>] d_alloc_parall=
el+0x7e/0xd10
[  430.884215] =

[  430.884215] stack backtrace:
[  430.893488] CPU: 0 PID: 1024 Comm: pidof Not tainted 4.14.0-rc8 #158
[  430.905217] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
1.10.2-1 04/01/2014
[  430.920682] Call Trace:
[  430.926481]  dump_stack+0x16/0x1c
[  430.933406]  print_unlock_imbalance_bug+0xb9/0xd0
[  430.942512]  ? rcu_read_unlock_special+0x5f8/0x620
[  430.951690]  ? rcu_read_unlock_special+0x5f8/0x620
[  430.960928]  lock_release+0x1cc/0x490
[  430.968446]  ? rcu_gp_kthread_wake+0x34/0x50
[  430.976960]  ? rcu_read_unlock_special+0x5f8/0x620
[  430.986108]  rt_mutex_unlock+0x1e/0xb0
[  430.993754]  rcu_read_unlock_special+0x5f8/0x620
[  431.003016]  __rcu_read_unlock+0xa7/0xb0
[  431.010665]  d_alloc_parallel+0x345/0xd10
[  431.018441]  lookup_slow+0xe4/0x310
[  431.025500]  walk_component+0x146/0x590
[  431.031915]  path_lookupat+0xcc/0x3f0
[  431.038634]  ? 0xc1000000
[  431.042398]  ? 0xc1000000
[  431.046246]  filename_lookup+0xd8/0x290
[  431.051246]  ? strncpy_from_user+0x13f/0x260
[  431.056818]  user_path_at_empty+0x25/0x30
[  431.062068]  SyS_readlink+0x52/0x130
[  431.066929]  do_int80_syscall_32+0x95/0x290
[  431.072306]  entry_INT80_32+0x2f/0x2f
[  431.077230] EIP: 0xb7f0e6a2
[  431.081187] EFLAGS: 00000296 CPU: 0
[  431.085910] EAX: ffffffda EBX: bf82714b ECX: 080964b8 EDX: 00000050
[  431.095247] ESI: 00000050 EDI: bf82714b EBP: bf827124 ESP: bf827100
[  431.107404]  DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b
[  431.617153] 8021q: adding VLAN 0 to HW filter on device eth0
[  433.538079] e1000: eth0 NIC Link is Up 1000 Mbps Full Duplex, Flow Contr=
ol: RX

Thanks,
Fengguang

--===============6604472128531350012==--

