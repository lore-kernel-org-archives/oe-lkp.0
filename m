Content-Type: multipart/mixed; boundary="===============2597322254858257259=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [net] 9317bb6982: INFO: task cat-kmsg:893 blocked for more than 300 seconds.
Date: Wed, 11 May 2016 10:16:01 +0800
Message-ID: <87h9e5nxum.fsf@yhuang-dev.intel.com>
In-Reply-To: <CANn89iL32N6R2OQ3F3P33hMGxfuBxaFjVS0bYcPJXYw54zV3CA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2597322254858257259==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Eric Dumazet <edumazet@google.com> writes:
> On Mon, May 9, 2016 at 6:26 PM, Huang, Ying <ying.huang@linux.intel.com=
> wrote:
>> Hi, Eric,
>>
>> kernel test robot <ying.huang@linux.intel.com> writes:
>>> FYI, we noticed the following commit:
>>>
>>> git://internal_merge_and_test_tree devel-catchup-201604281529
>>> commit 9317bb69824ec8d078b0b786b6971aedb0af3d4f ("net: SOCKWQ_ASYNC_NOS=
PACE optimizations")
>>>
>>> on test machine: vm-kbuild-2G: 2 threads qemu-system-x86_64 -enable-kvm=
 -cpu Haswell,+smep,+smap with 2G memory
>>>
>>> caused below changes:
>>>
>>>
>>> +--------------------------------------------------+------------+------=
------+
>>> |                                                  | 210732d16d | 9317b=
b6982 |
>>> +--------------------------------------------------+------------+------=
------+
>>> | boot_successes                                   | 40         | 13   =
      |
>>> | boot_failures                                    | 0          | 27   =
      |
>>> | INFO:task_blocked_for_more_than#seconds          | 0          | 27   =
      |
>>> | RIP:native_safe_halt                             | 0          | 20   =
      |
>>> | RIP:native_write_msr_safe                        | 0          | 27   =
      |
>>> | Kernel_panic-not_syncing:hung_task:blocked_tasks | 0          | 27   =
      |
>>> | backtrace:__close_fd                             | 0          | 27   =
      |
>>> | backtrace:SyS_close                              | 0          | 27   =
      |
>>> | backtrace:cpu_startup_entry                      | 0          | 19   =
      |
>>> | backtrace:watchdog                               | 0          | 27   =
      |
>>> | RIP:__lock_acquire                               | 0          | 2    =
      |
>>> | backtrace:rpc_async_schedule                     | 0          | 2    =
      |
>>> | backtrace:lock_acquire                           | 0          | 1    =
      |
>>> | RIP:delay_tsc                                    | 0          | 1    =
      |
>>> | backtrace:SYSC_epoll_wait                        | 0          | 1    =
      |
>>> | backtrace:SyS_epoll_wait                         | 0          | 1    =
      |
>>> | RIP:pvclock_clocksource_read                     | 0          | 1    =
      |
>>> | RIP:xs_reclassify_socket                         | 0          | 1    =
      |
>>> | backtrace:xs_tcp_setup_socket                    | 0          | 2    =
      |
>>> | RIP:insert_work                                  | 0          | 1    =
      |
>>> +--------------------------------------------------+------------+------=
------+
>>
>> We recently found this patch cause NFS hang in 0day/LKP test system.
>> The NFS export can be mounted, but after a while all read/write to NFS
>> mount blocked.  This influenced the 0day/LKP testing.  Could you help us
>> to fix this?
>>
>> Best Regards,
>> Huang, Ying
>
>
> I need to officially submit this patch :
> http://www.spinics.net/lists/netdev/msg375777.html

Thanks a lot!  The patch fixed our NFS hang.

Tested-by: Huang, Ying <ying.huang@intel.com>

Is it possible to put the fixing patch near (preferably next) the patch
trigger regression?  Otherwise a bigger range of patches will not be
bisectable.

Best Regards,
Huang, Ying

--===============2597322254858257259==--

