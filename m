Content-Type: multipart/mixed; boundary="===============0760291310303627218=="
MIME-Version: 1.0
From: Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>
To: lkp@lists.01.org
Subject: Re: [hw_breakpoint] WARNING: at kernel/trace/trace_kprobe.c:1393 kprobe_trace_self_tests_init()
Date: Wed, 01 Oct 2014 11:18:48 +0900
Message-ID: <542B6488.9090902@hitachi.com>
In-Reply-To: <20140930175844.GA20922@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0760291310303627218==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

(2014/10/01 2:58), Oleg Nesterov wrote:
> Hi Fengguang,
> =

> On 09/30, Fengguang Wu wrote:
>>
>> Hi Oleg,
>>
>> 0day kernel testing robot got the below dmesg and the first bad commit is
>>
>> commit 8b4d801b2b123b6c09742f861fe44a8527b84d47
>> Author:     Oleg Nesterov <oleg@redhat.com>
>> AuthorDate: Thu Jun 20 17:50:06 2013 +0200
>> Commit:     Ingo Molnar <mingo@kernel.org>
>> CommitDate: Thu Jun 20 17:57:00 2013 +0200
>>
>>     hw_breakpoint: Fix cpu check in task_bp_pinned(cpu)
>>
>>     trinity fuzzer triggered WARN_ONCE("Can't find any breakpoint
>>     slot") in arch_install_hw_breakpoint() but the problem is not
>>     arch-specific.
>>
>>     The problem is, task_bp_pinned(cpu) checks "cpu =3D=3D iter->cpu"
>>     but this doesn't account the "all cpus" events with iter->cpu <
>>     0.
>>
>>     This means that, say, register_user_hw_breakpoint(tsk) can
>>     happily create the arbitrary number > HBP_NUM of breakpoints
>>     which can not be activated. toggle_bp_task_slot() is equally
>>     wrong by the same reason and nr_task_bp_pinned[] can have
>>     negative entries.
>>
>>     Simple test:
>>
>>     	# perl -e 'sleep 1 while 1' &
>>     	# perf record -e mem:0x10,mem:0x10,mem:0x10,mem:0x10,mem:0x10 -p `p=
idof perl`
>>
>>     Before this patch this triggers the same problem/WARN_ON(),
>>     after the patch it correctly fails with -ENOSPC.
>>
>>     Reported-by: Vince Weaver <vincent.weaver@maine.edu>
>>     Signed-off-by: Oleg Nesterov <oleg@redhat.com>
>>     Acked-by: Frederic Weisbecker <fweisbec@gmail.com>
>>     Cc: <stable@vger.kernel.org>
>>     Link: http://lkml.kernel.org/r/20130620155006.GA6324(a)redhat.com
>>     Signed-off-by: Ingo Molnar <mingo@kernel.org>
>>
>> +-----------------------------------------------------------------------=
+------------+------------+------------------+
>> |                                                                       =
| 003002e04e | 8b4d801b2b | v3.17-rc7_093000 |
>> +-----------------------------------------------------------------------=
+------------+------------+------------------+
>> | boot_successes                                                        =
| 60         | 0          | 0                |
>> | boot_failures                                                         =
| 0          | 20         | 11               |
>> | WARNING:at_kernel/trace/trace_kprobe.c:kprobe_trace_self_tests_init() =
| 0          | 20         | 11               |
>> | backtrace:kprobe_trace_self_tests_init                                =
| 0          | 20         | 11               |
>> | backtrace:warn_slowpath_null                                          =
| 0          | 20         | 11               |
>> | backtrace:kernel_init_freeable                                        =
| 0          | 20         | 11               |
>> +-----------------------------------------------------------------------=
+------------+------------+------------------+
>>
>> [    4.188679] Testing kprobe tracing:
>> [    4.189810] Could not insert probe at kprobe_trace_selftest_target+0:=
 -22
> =

> __register_trace_kprobe() fails.
> =

> No, I am very sure this can't be caused by the commit above. If nothing e=
lse,
> task_bp_pinned() changed by this commit is not even called in this case.

Uh, right. I'm trying to reproduce this to analyze...

Anyway, I'd like to remove the whole of kprobe_trace selftest from the
kernel binary. Instead of that, we already have ftracetest scripts.
We can run the test after the kernel booted.

Thank you,

-- =

Masami HIRAMATSU
Software Platform Research Dept. Linux Technology Research Center
Hitachi, Ltd., Yokohama Research Laboratory
E-mail: masami.hiramatsu.pt(a)hitachi.com



--===============0760291310303627218==--

