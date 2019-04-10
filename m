Content-Type: multipart/mixed; boundary="===============0282790738636533144=="
MIME-Version: 1.0
From: Toke Høiland-Jørgensen <toke@redhat.com>
To: lkp@lists.01.org
Subject: Re: [xdp] 9cb54e254c: kernel/bpf/devmap.c:#suspicious_rcu_dereference_check()
Date: Wed, 10 Apr 2019 12:00:58 +0200
Message-ID: <87r2aaw55x.fsf@toke.dk>
In-Reply-To: <20190410075954.GC17122@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============0282790738636533144==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot <rong.a.chen@intel.com> writes:

> FYI, we noticed the following commit (built with gcc-7):
>
> commit: 9cb54e254ca479ce636857a1fd1e1a3e9f8796b1 ("[PATCH net-next v4 4/6=
] xdp: Always use a devmap for XDP_REDIRECT to a device")
> url: https://github.com/0day-ci/linux/commits/Toke-H-iland-J-rgensen/xdp-=
Use-a-default-map-for-xdp_redirect-helper/20190409-161851
>
>
> in testcase: trinity
> with following parameters:
>
> 	runtime: 300s
>
> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
>
>
> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 8G
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
> +--------------------------------------------------------------+---------=
---+------------+
> |                                                              | c76c6654=
40 | 9cb54e254c |
> +--------------------------------------------------------------+---------=
---+------------+
> | boot_successes                                               | 0       =
   | 0          |
> | boot_failures                                                | 40      =
   | 38         |
> | BUG:kernel_reboot-without-warning_in_test_stage              | 28      =
   | 10         |
> | BUG:kernel_hang_in_boot_stage                                | 12      =
   | 12         |
> | WARNING:suspicious_RCU_usage                                 | 0       =
   | 16         |
> | kernel/bpf/devmap.c:#suspicious_rcu_dereference_check()usage | 0       =
   | 16         |
> +--------------------------------------------------------------+---------=
---+------------+
>
>
>
> [  413.653218] WARNING: suspicious RCU usage
> [  413.654564] 5.1.0-rc4-00599-g9cb54e2 #43 Tainted: G                T
> [  413.656563] -----------------------------
> [  413.657808] kernel/bpf/devmap.c:807 suspicious rcu_dereference_check()=
 usage!
> [  413.660285] =

> [  413.660285] other info that might help us debug this:
> [  413.660285] =

> [  413.662614] =

> [  413.662614] rcu_scheduler_active =3D 2, debug_locks =3D 1
> [  413.664483] 2 locks held by trinity-c3/2248:
> [  413.665800]  #0: 00000000713e8e50 (&f->f_pos_lock){+.+.}, at: __fdget_=
pos+0x81/0x90
> [  413.668184]  #1: 000000005e54a26c (&p->lock){+.+.}, at: seq_lseek+0x42=
/0x1c0
> [  413.670412] =

> [  413.670412] stack backtrace:
> [  413.671876] CPU: 0 PID: 2248 Comm: trinity-c3 Tainted: G              =
  T 5.1.0-rc4-00599-g9cb54e2 #43
> [  413.674557] Call Trace:
> [  413.675374]  dump_stack+0x1e/0x28
> [  413.676366]  lockdep_rcu_suspicious+0xc6/0xd0
> [  413.677802]  dev_map_default_show+0x84/0xd0

Ah, right, seems I forgot an rcu_read_lock() here. Will fix :)

-Toke

--===============0282790738636533144==--

