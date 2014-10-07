Content-Type: multipart/mixed; boundary="===============4695941106399791368=="
MIME-Version: 1.0
From: Waiman Long <waiman.long@hp.com>
To: lkp@lists.01.org
Subject: Re: [x86, locking/rwlocks, btrfs] INFO: rcu_sched self-detected stall on CPU
Date: Tue, 07 Oct 2014 11:10:39 -0400
Message-ID: <5434026F.3070404@hp.com>
In-Reply-To: <20141004050628.4613752a@as>
List-Id: <oe-lkp.lists.linux.dev>

--===============4695941106399791368==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/04/2014 06:06 AM, Chuck Ebbert wrote:
> On Fri, 03 Oct 2014 23:27:58 -0400
> Waiman Long<waiman.long@hp.com>  wrote:
>
>> On 10/03/2014 09:33 AM, Fengguang Wu wrote:
>>> Hi Waiman,
>>>
>>> FYI, we noticed the below changes on commit
>>>
>>> bd01ec1a13f9a327950c8e3080096446c7804753 ("x86, locking/rwlocks: Enable=
 qrwlocks on x86")
>>>
>>> +----------------------------------------------+------------+----------=
--+
>>> |                                              | 70af2f8a4f | bd01ec1a1=
3 |
>>> +----------------------------------------------+------------+----------=
--+
>>> | boot_successes                               | 3          | 2        =
  |
>>> | boot_failures                                | 7          | 13       =
  |
>>> | BUG:kernel_test_crashed                      | 7          | 8        =
  |
>>> | INFO:rcu_sched_self-detected_stall_on_CPU    | 0          | 4        =
  |
>>> | RIP:intel_idle                               | 0          | 4        =
  |
>>> | RIP:queue_write_lock_slowpath                | 0          | 4        =
  |
>>> | RIP:queue_read_lock_slowpath                 | 0          | 4        =
  |
>>> | RIP:sys_imageblit_sysimgblt                  | 0          | 2        =
  |
>>> | RIP:default_send_IPI_mask_sequence_phys      | 0          | 1        =
  |
>>> | RIP:memcpy                                   | 0          | 1        =
  |
>>> | RIP:delay_tsc                                | 0          | 4        =
  |
>>> | backtrace:cpu_startup_entry                  | 0          | 3        =
  |
>>> | backtrace:do_fsync                           | 0          | 4        =
  |
>>> | backtrace:SyS_fsync                          | 0          | 4        =
  |
>>> | backtrace:normal_work_helper                 | 0          | 1        =
  |
>>> | backtrace:vfs_write                          | 0          | 3        =
  |
>>> | backtrace:SyS_write                          | 0          | 3        =
  |
>>> | backtrace:do_sys_open                        | 0          | 4        =
  |
>>> | backtrace:SyS_open                           | 0          | 4        =
  |
>>> | backtrace:flush_to_ldisc                     | 0          | 1        =
  |
>>> | RIP:cpu_startup_entry                        | 0          | 1        =
  |
>>> | RIP:native_read_tsc                          | 0          | 2        =
  |
>>> | RIP:rcu_eqs_exit_common                      | 0          | 1        =
  |
>>> | INFO:rcu_sched_detected_stalls_on_CPUs/tasks | 0          | 1        =
  |
>>> +----------------------------------------------+------------+----------=
--+
>>>
>>>
>> The btrfs filesystem had problem using qrwlock. This was a known btrfs
>> problem in 3.16-rc1. The following patch by Chris should have fixed the
>> problem:
>>
>>   >  commit ea4ebde02e08558b020c4b61bb9a4c0fcf63028e
>>   >  Author: Chris Mason<clm@fb.com>
>>   >  Date:   Thu Jun 19 14:16:52 2014 -0700
>>   >
>>   >       Btrfs: fix deadlocks with trylock on tree nodes
>>
>> Was that patch included in your test?
>>
> That patch went in 3.16-rc2, so it can be assumed it was included in
> the test kernel (3.16.0)

The problem should be gone in 3.16.0. I was asking because the 2 commits =

bd01ec1a13 and 70af2f8a4f are the two consecutive qrwlock patches. The =

first one adds the code while the second one enables its use in x86. So =

if you just compare these two commits, you will certainly see some =

regressions in the test.

-Longman


--===============4695941106399791368==--

