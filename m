Content-Type: multipart/mixed; boundary="===============8712990276880862132=="
MIME-Version: 1.0
From: Wei Wang <weiwan@google.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [ipv6] 66f5d6ce53: net/ipv6/ip6_fib.c:#suspicious_rcu_dereference_check()usage
Date: Mon, 09 Oct 2017 09:51:01 -0700
Message-ID: <CAEA6p_AhqS1Xb5ZPgn4UyZ79nuD7rDUWGi26byqPGBgn9V+MyQ@mail.gmail.com>
In-Reply-To: <20171009075913.GL17200@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============8712990276880862132==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks Xiaolong for reporting this.

I will send a fix upstream to use rcu_dereference_bh() instead of
rcu_deference() in ipv6_route_seq_next() to avoid this warning.

Thanks.
Wei

On Mon, Oct 9, 2017 at 12:59 AM, kernel test robot
<xiaolong.ye@intel.com> wrote:
>
> FYI, we noticed the following commit (built with gcc-6):
>
> commit: 66f5d6ce53e665477d2a33e8f539d4fa4ca81c83 ("ipv6: replace rwlock w=
ith rcu and spinlock in fib6_table")
> https://github.com/jpirko/linux_mlxsw combined_queue
>
> in testcase: trinity
> with following parameters:
>
>         runtime: 300s
>
> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
>
>
> on test machine: qemu-system-x86_64 -enable-kvm -smp 2 -m 512M
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
> +-------------------------------------------------------------+----------=
--+------------+
> |                                                             | 17ecf590b=
3 | 66f5d6ce53 |
> +-------------------------------------------------------------+----------=
--+------------+
> | boot_successes                                              | 2        =
  | 2          |
> | boot_failures                                               | 12       =
  | 13         |
> | WARNING:suspicious_RCU_usage                                | 12       =
  | 11         |
> | net/ipv6/route.c:#suspicious_rcu_dereference_check()usage   | 12       =
  |            |
> | WARNING:at_net/ipv6/route.c:#__rt6_find_exception_rcu       | 12       =
  |            |
> | net/ipv6/ip6_fib.c:#suspicious_rcu_dereference_check()usage | 0        =
  | 11         |
> | BUG:kernel_hang_in_test_stage                               | 0        =
  | 2          |
> +-------------------------------------------------------------+----------=
--+------------+
>
>
>
> [   19.431685] WARNING: suspicious RCU usage
> [   19.433451] 4.14.0-rc3-00914-g66f5d6c #118 Not tainted
> [   19.435509] -----------------------------
> [   19.437267] net/ipv6/ip6_fib.c:2259 suspicious rcu_dereference_check()=
 usage!
> [   19.440790]
> [   19.440790] other info that might help us debug this:
> [   19.440790]
> [   19.444734]
> [   19.444734] rcu_scheduler_active =3D 2, debug_locks =3D 1
> [   19.447757] 2 locks held by odhcpd/3720:
> [   19.449480]  #0:  (&p->lock){+.+.}, at: [<ffffffffb1231f7d>] seq_read+=
0x3c/0x333
> [   19.452720]  #1:  (rcu_read_lock_bh){....}, at: [<ffffffffb1d2b984>] i=
pv6_route_seq_start+0x5/0xfd
> [   19.456323]
> [   19.456323] stack backtrace:
> [   19.458812] CPU: 0 PID: 3720 Comm: odhcpd Not tainted 4.14.0-rc3-00914=
-g66f5d6c #118
> [   19.462042] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [   19.465414] Call Trace:
> [   19.466788]  dump_stack+0x86/0xc0
> [   19.468358]  lockdep_rcu_suspicious+0xea/0xf3
> [   19.470183]  ipv6_route_seq_next+0x71/0x164
> [   19.471963]  seq_read+0x244/0x333
> [   19.473522]  proc_reg_read+0x48/0x67
> [   19.475152]  ? proc_reg_write+0x67/0x67
> [   19.476862]  __vfs_read+0x26/0x10b
> [   19.478463]  ? __might_fault+0x37/0x84
> [   19.480148]  vfs_read+0xba/0x146
> [   19.481690]  SyS_read+0x51/0x8e
> [   19.483197]  do_int80_syscall_32+0x66/0x15a
> [   19.484969]  entry_INT80_compat+0x32/0x50
> [   19.486707] RIP: 0023:0xf7f0be8e
> [   19.488244] RSP: 002b:00000000ffa75d04 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000003
> [   19.491431] RAX: ffffffffffffffda RBX: 0000000000000009 RCX: 000000000=
8056068
> [   19.493886] RDX: 0000000000001000 RSI: 0000000008056008 RDI: 000000000=
0001000
> [   19.496331] RBP: 00000000000001ff R08: 0000000000000000 R09: 000000000=
0000000
> [   19.498768] R10: 0000000000000000 R11: 0000000000000000 R12: 000000000=
0000000
> [   19.501217] R13: 0000000000000000 R14: 0000000000000000 R15: 000000000=
0000000
> [   19.886314] /lkp/lkp/src/bin/run-lkp
> [   19.886314] RESULT_ROOT=3D/result/trinity/300s/vm-lkp-nex04-openwrt-ia=
32/openwrt-i386-2016-03-16.cgz/x86_64-nfsroot/gcc-6/66f5d6ce53e665477d2a33e=
8f539d4fa4ca81c83/0
> [   19.886314] job=3D/lkp/scheduled/vm-lkp-nex04-openwrt-ia32-16/trinity-=
300s-openwrt-i386-2016-03-16.cgz-66f5d6ce53e665477d2a33e8f539d4fa4ca81c83-2=
0171008-18565-6l73b7-1.yaml
> [   19.886314] run-job /lkp/scheduled/vm-lkp-nex04-openwrt-ia32-16/trinit=
y-300s-openwrt-i386-2016-03-16.cgz-66f5d6ce53e665477d2a33e8f539d4fa4ca81c83=
-20171008-18565-6l73b7-1.yaml
> [   19.886314] /bin/busybox wget -q http://inn:80/~lkp/cgi-bin/lkp-jobfil=
e-append-var?job_file=3D/lkp/scheduled/vm-lkp-nex04-openwrt-ia32-16/trinity=
-300s-openwrt-i386-2016-03-16.cgz-66f5d6ce53e665477d2a33e8f539d4fa4ca81c83-=
20171008-18565-6l73b7-1.yaml&job_state=3Drunning -O /dev/null
> [   20.916334] Sun Oct  8 08:13:28 UTC 2017 detected soft_timeout
> [   20.916334] kill 3974 /bin/sh /lkp/scheduled/vm-lkp-nex04-openwrt-ia32=
-16/trinity-300s-openwrt-i386-2016-03-16.cgz-66f5d6ce53e665477d2a33e8f539d4=
fa4ca81c83-20171008-18565-6l73b7-1.sh run_job
> [   20.916334] Sun Oct  8 08:13:28 UTC 2017 wait_job_finished --timeout 60
> [   20.916334] Sun Oct  8 08:13:28 UTC 2017 sleep 141
> [   21.929518] kill 3976 cat /proc/kmsg
> [   21.929518] wait for background monitors: 3978 3983 oom-killer nfs-hang
> [   24.934438] /bin/busybox wget -q http://inn:80/~lkp/cgi-bin/lkp-jobfil=
e-append-var?job_file=3D/lkp/scheduled/vm-lkp-nex04-openwrt-ia32-16/trinity=
-300s-openwrt-i386-2016-03-16.cgz-66f5d6ce53e665477d2a33e8f539d4fa4ca81c83-=
20171008-18565-6l73b7-1.yaml&loadavg=3D0.28%200.06%200.02%202/90%204056&sta=
rt_time=3D&end_time=3D1507450408&version=3D/lkp/lkp/.src-20170930-230231& -=
O /dev/null
> [   24.934438] /bin/busybox wget -q http://inn:80/~lkp/cgi-bin/lkp-jobfil=
e-append-var?job_file=3D/lkp/scheduled/vm-lkp-nex04-openwrt-ia32-16/trinity=
-300s-openwrt-i386-2016-03-16.cgz-66f5d6ce53e665477d2a33e8f539d4fa4ca81c83-=
20171008-18565-6l73b7-1.yaml&job_state=3Dsoft_timeout -O /dev/null
> [   25.397640] sysrq: SysRq : Emergency Sync
> [   25.400455] Emergency Sync complete
> [   25.402360] sysrq: SysRq : Resetting
>
> Elapsed time: 30
>
> initrds=3D(
>         /osimage/openwrt/openwrt-i386-2016-03-16.cgz
>         /lkp/scheduled/vm-lkp-nex04-openwrt-ia32-16/trinity-300s-openwrt-=
i386-2016-03-16.cgz-66f5d6ce53e665477d2a33e8f539d4fa4ca81c83-20171008-18565=
-6l73b7-1.cgz
>         /lkp/lkp/lkp-i386.cgz
>         /osimage/pkg/static/trinity-i386.cgz
>         /pkg/linux/x86_64-nfsroot/gcc-6/66f5d6ce53e665477d2a33e8f539d4fa4=
ca81c83/modules.cgz
> )
>
> cat "${initrds[@]}" > /fs/sdb1/initrd-vm-lkp-nex04-openwrt-ia32-16
>
> kvm=3D(
>         qemu-system-x86_64
>         -enable-kvm
>         -kernel /pkg/linux/x86_64-nfsroot/gcc-6/66f5d6ce53e665477d2a33e8f=
539d4fa4ca81c83/vmlinuz-4.14.0-rc3-00914-g66f5d6c
>         -initrd /fs/sdb1/initrd-vm-lkp-nex04-openwrt-ia32-16
>         -m 512
>         -smp 2
>         -device e1000,netdev=3Dnet0
>         -netdev user,id=3Dnet0,hostfwd=3Dtcp::23285-:22
>         -boot order=3Dnc
>         -no-reboot
>         -watchdog i6300esb
>         -watchdog-action debug
>         -rtc base=3Dlocaltime
>         -pidfile /dev/shm/kboot/pid-vm-lkp-nex04-openwrt-ia32-16
>         -serial file:/dev/shm/kboot/vm-lkp-nex04-openwrt-ia32-16/serial
>         -serial file:/dev/shm/kboot/vm-lkp-nex04-openwrt-ia32-16/kmsg
>         -daemonize
>         -display none
>         -monitor null
> )
>
> append=3D(
>         ip=3D::::vm-lkp-nex04-openwrt-ia32-16::dhcp
>         root=3D/dev/ram0
>         user=3Dlkp
>         job=3D/lkp/scheduled/vm-lkp-nex04-openwrt-ia32-16/trinity-300s-op=
enwrt-i386-2016-03-16.cgz-66f5d6ce53e665477d2a33e8f539d4fa4ca81c83-20171008=
-18565-6l73b7-1.yaml
>         ARCH=3Dx86_64
>         kconfig=3Dx86_64-nfsroot
>         branch=3Dlinux-devel/devel-catchup-201710080551
>         commit=3D66f5d6ce53e665477d2a33e8f539d4fa4ca81c83
>         BOOT_IMAGE=3D/pkg/linux/x86_64-nfsroot/gcc-6/66f5d6ce53e665477d2a=
33e8f539d4fa4ca81c83/vmlinuz-4.14.0-rc3-00914-g66f5d6c
>         max_uptime=3D1500
>         RESULT_ROOT=3D/result/trinity/300s/vm-lkp-nex04-openwrt-ia32/open=
wrt-i386-2016-03-16.cgz/x86_64-nfsroot/gcc-6/66f5d6ce53e665477d2a33e8f539d4=
fa4ca81c83/0
>         LKP_SERVER=3Dinn
>         debug
>
>
> To reproduce:
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script  # job-script is attached in=
 this email
>
>
>
> Thanks,
> Xiaolong

--===============8712990276880862132==--

