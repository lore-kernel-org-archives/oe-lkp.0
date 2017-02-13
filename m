Content-Type: multipart/mixed; boundary="===============6047222616834901110=="
MIME-Version: 1.0
From: Dou Liyang <douly.fnst@cn.fujitsu.com>
To: lkp@lists.01.org
Subject: Re: [x86/acpi] dc6db24d24: BUG: unable to handle kernel paging request at 0000116007090008
Date: Mon, 13 Feb 2017 13:30:36 +0800
Message-ID: <0188ea2f-f2a1-bfb0-5733-8c84abc3acac@cn.fujitsu.com>
In-Reply-To: <20170213013708.GI16630@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============6047222616834901110==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Xiaolong

At 02/13/2017 09:37 AM, Ye Xiaolong wrote:
> On 11/21, Dou Liyang wrote:
>> Hi, Xiaolong,
>>
>> At 11/21/2016 09:31 AM, Ye Xiaolong wrote:
>>> On 11/18, Dou Liyang wrote:
>>>> Hi xiaolong
>>>>
>>>> At 11/18/2016 02:16 PM, Ye Xiaolong wrote:
>>>>> Hi, liyang
>>>>>
>>>>> Sorry for the late.
>>>>>
>>>>> On 10/31, Dou Liyang wrote:
>>>>>> Hi, Xiaolong,
>>>>>>
>>>>>> I research the ACPI table for a long time, and I found that:
>>>>>> The reason for this bug is the duplicate IDs "0xFF" in DSDT.
>>>>>> it has already been fixed in the committed id
>>>>>> 8e089eaa1999def4bb954caa91941f29b0672b6a and
>>>>>> fd74da217df7d4bd25e95411da64e0b92762842e which is after the
>>>>>> dc6db24d2476cd09c0ecf2b8d80313539f737a89 .
>>>>>>
>>>>>> could you help me to Verify my thoughts in the LKP.
>>>>>>
>>>>>
>>>>> I've queued the same test jobs for commit fd74da217d, I'll notify you
>>>>> once I get the results.
>>>>
>>>
>>> Hi, Liyang,
>>>
>>> Results show that the reported error is gone with commit fd74da217df7d4=
bd25e95411da64e0b92762842e
>>> below is the comparison.
>>>
>>
>> thanks a lot. that means it has been fixed.
>
> Sorry for my neglect, the result for fd74da217df7d4bd25e95411da showed no=
 dmesg
> because it's incomplete run and has no demsg stat at all.

Is that means:

you have already tested the Linux branch which contains the commit
fd74da217df7d. and it doesn't work well.

Btw, Why the test is incomplete run ?

> The bug still persists in v4.9, v4.10-rcx, the lastest kernel head,

If the dmesg and stat of the test is NULL, How do you prove that the
bug still exists?

> could you help to check?
>

Yes, I think we first should make the test with commit fd74da217df7d
work in the specific test machine.

test machine: 72 threads Intel(R) Xeon(R) CPU E5-2699 v3 @ 2.30GHz with =

128G memory

Am I right? waiting your response.

Thanks,
Liyang

> Thanks,
> Xiaolong
>
>>
>>>
>>> compare -at dc6db24d2476cd09c0ecf2b8d80313539f737a89 fd74da217df7d4bd25=
e95411da64e0b92762842e
>>> tests: 1
>>> testcase/path_params/tbox_group/run: vm-scalability/300-never-never-1-1=
-swap-w-rand-performance/lkp-hsw-ep2
>>>
>>> dc6db24d2476cd09  fd74da217df7d4bd25e95411da
>>> ----------------  --------------------------
>>>       fail:runs  %reproduction    fail:runs
>>>           |             |             |
>>>         12:12        -100%            :3     dmesg.BUG:unable_to_handle=
_kernel
>>>         12:12        -100%            :3     dmesg.Oops
>>>         12:12        -100%            :3     dmesg.RIP:get_partial_node
>>>          9:12         -75%            :3     dmesg.RIP:_raw_spin_lock_i=
rqsave
>>>          3:12         -25%            :3     dmesg.general_protection_f=
ault:#[##]SMP
>>>          3:12         -25%            :3     dmesg.RIP:native_queued_sp=
in_lock_slowpath
>>>          3:12         -25%            :3     dmesg.Kernel_panic-not_syn=
cing:Hard_LOCKUP
>>>          2:12         -17%            :3     dmesg.RIP:load_balance
>>>          2:12         -17%            :3     dmesg.Kernel_panic-not_syn=
cing:Fatal_exception_in_interrupt
>>>          1:12          -8%            :3     dmesg.RIP:resched_curr
>>>          1:12          -8%            :3     dmesg.Kernel_panic-not_syn=
cing:Fatal_exception
>>>          5:12         -42%            :3     dmesg.WARNING:at_include/l=
inux/uaccess.h:#__probe_kernel_read
>>>          1:12          -8%            :3     dmesg.WARNING:at_lib/list_=
debug.c:#__list_add
>>>
>>>
>>
>>>>>> 2. About the LKP-tests, I want run the tests in my own pc.
>>>>>> I use the debain sid as an OS. the .yaml file can be installed and
>>>>>> job splited, but it can't be run correctly.
>>>>>>
>>>>>> Is the linux source code must be in /tmp/?
>>>>>> And if I need to modify the .yaml file to fit my pc.
>>>>>>
>>>>>
>>>>> Could you paste the error log for me to analyze?
>>>>
>>>> Yes.  let me tidy up it ah. :)
>>>>
>>
>> And, I am very interesting in LKP-Test. when I built it, I met some
>> problems.
>>
>> here is the error log:
>>
>> root(a)debian:/home/douly/lkp-tests# lkp run ./job-unlink2-performance-0=
4c197c080f2ed7a022f79701455c6837f4b9573-debian-x86_64-2016-08-31.cgz.yaml
>>
>> IPMI BMC is not supported on this machine, skip bmc-watchdog setup!
>> 2016-11-21 15:21:01 ./runtest.py unlink2 32 both 1 54 72
>> /home/douly/lkp-tests/bin/log_cmd: 7: exec: ./runtest.py: not found
>> kill 18805 vmstat -n 10
>> kill 18803 dmesg --follow --decode
>> kill 18829 /lkp/benchmarks/perf-stat/perf stat -a -I 1000 -x  -e cpu-clo=
ck,task-clock,page-faults,context-switches,cpu-migrations,minor-faults,majo=
r-faults
>> --log-fd 1 --
>> kill 18806 vmstat -n 1
>> wait for background monitors: 18811 18813 18830 18833 18832 18819
>> 18821 18826 18818 18815 18810 18814 18825 18827 proc-stat meminfo
>> oom-killer uptime nfs-hang softirqs diskstats sched_debug
>> latency_stats interrupts proc-vmstat slabinfo turbostat perf-profile
>> Error:
>> The /tmp/lkp-root/perf.data file has no samples!
>>
>> Thanks,
>>
>> Dou.
>>
>>
>>
>>
>>
>>
>>
>>
>
>
>



--===============6047222616834901110==--

