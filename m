Content-Type: multipart/mixed; boundary="===============8329039774983269794=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [net] 9317bb6982: INFO: task cat-kmsg:893 blocked for more than 300 seconds.
Date: Tue, 10 May 2016 09:26:51 +0800
Message-ID: <87zirywvms.fsf@yhuang-dev.intel.com>
In-Reply-To: <87eg9kgcwg.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8329039774983269794==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Eric,

kernel test robot <ying.huang@linux.intel.com> writes:
> FYI, we noticed the following commit:
>
> git://internal_merge_and_test_tree devel-catchup-201604281529
> commit 9317bb69824ec8d078b0b786b6971aedb0af3d4f ("net: SOCKWQ_ASYNC_NOSPA=
CE optimizations")
>
> on test machine: vm-kbuild-2G: 2 threads qemu-system-x86_64 -enable-kvm -=
cpu Haswell,+smep,+smap with 2G memory
>
> caused below changes:
>
>
> +--------------------------------------------------+------------+--------=
----+
> |                                                  | 210732d16d | 9317bb6=
982 |
> +--------------------------------------------------+------------+--------=
----+
> | boot_successes                                   | 40         | 13     =
    |
> | boot_failures                                    | 0          | 27     =
    |
> | INFO:task_blocked_for_more_than#seconds          | 0          | 27     =
    |
> | RIP:native_safe_halt                             | 0          | 20     =
    |
> | RIP:native_write_msr_safe                        | 0          | 27     =
    |
> | Kernel_panic-not_syncing:hung_task:blocked_tasks | 0          | 27     =
    |
> | backtrace:__close_fd                             | 0          | 27     =
    |
> | backtrace:SyS_close                              | 0          | 27     =
    |
> | backtrace:cpu_startup_entry                      | 0          | 19     =
    |
> | backtrace:watchdog                               | 0          | 27     =
    |
> | RIP:__lock_acquire                               | 0          | 2      =
    |
> | backtrace:rpc_async_schedule                     | 0          | 2      =
    |
> | backtrace:lock_acquire                           | 0          | 1      =
    |
> | RIP:delay_tsc                                    | 0          | 1      =
    |
> | backtrace:SYSC_epoll_wait                        | 0          | 1      =
    |
> | backtrace:SyS_epoll_wait                         | 0          | 1      =
    |
> | RIP:pvclock_clocksource_read                     | 0          | 1      =
    |
> | RIP:xs_reclassify_socket                         | 0          | 1      =
    |
> | backtrace:xs_tcp_setup_socket                    | 0          | 2      =
    |
> | RIP:insert_work                                  | 0          | 1      =
    |
> +--------------------------------------------------+------------+--------=
----+

We recently found this patch cause NFS hang in 0day/LKP test system.
The NFS export can be mounted, but after a while all read/write to NFS
mount blocked.  This influenced the 0day/LKP testing.  Could you help us
to fix this?

Best Regards,
Huang, Ying

--===============8329039774983269794==--

