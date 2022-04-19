Content-Type: multipart/mixed; boundary="===============7816641708392430369=="
MIME-Version: 1.0
From: David Hildenbrand <david@redhat.com>
To: lkp@lists.01.org
Subject: Re: [x86/pgtable] d1ec551f87: BUG:Bad_page_map_in_process
Date: Tue, 19 Apr 2022 15:00:49 +0200
Message-ID: <232bfdd0-4749-1c8c-3342-ece1c4b33fd5@redhat.com>
In-Reply-To: <57e2e54e-ccdf-a2b8-25cd-72848359533c@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7816641708392430369==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 19.04.22 10:36, David Hildenbrand wrote:
> On 19.04.22 10:22, David Hildenbrand wrote:
>> On 19.04.22 09:59, kernel test robot wrote:
>>>
>>>
>>> Greeting,
>>>
>>> FYI, we noticed the following commit (built with clang-15):
>>>
>>> commit: d1ec551f874e1663bfe76b994c0010a4566cf936 ("x86/pgtable: support=
 __HAVE_ARCH_PTE_SWP_EXCLUSIVE")
>>> https://github.com/hnaz/linux-mm master
>>>
>>> in testcase: trinity
>>> version: trinity-static-i386-x86_64-1c734c75-1_2020-01-06
>>> with following parameters:
>>>
>>> 	runtime: 300s
>>> 	group: group-01
>>>
>>> test-description: Trinity is a linux system call fuzz tester.
>>> test-url: http://codemonkey.org.uk/projects/trinity/
>>>
>>>
>>> on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -=
m 4G
>>>
>>> caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):
>>>
>>>
>>>
>>> If you fix the issue, kindly add following tag
>>> Reported-by: kernel test robot <oliver.sang@intel.com>
>>>
>>>
>>> [   40.201103][ T5099] BUG: Bad page map in process trinity-c7  pte:171=
3003a pmd:7ff71067
>>> [   40.201999][ T5099] addr:096e7000 vm_flags:00100073 anon_vma:bff0aa0=
0 mapping:00000000 index:96e7
>>> [   40.202718][ T5099] file:(null) fault:0x0 mmap:0x0 readpage:0x0
>>> [   40.203229][ T5099] CPU: 0 PID: 5099 Comm: trinity-c7 Not tainted 5.=
18.0-rc2-mm1-00053-gd1ec551f874e #1
>>> [   40.203952][ T5099] Call Trace:
>>> [ 40.204195][ T5099] ? dump_stack_lvl (??:?) =

>>> [ 40.204581][ T5099] ? dump_stack (??:?) =

>>> [ 40.204970][ T5099] ? print_bad_pte (memory.c:?) =

>>> [ 40.205384][ T5099] ? unmap_page_range (??:?) =

>>> [ 40.205843][ T5099] ? unmap_single_vma (memory.c:?) =

>>> [ 40.206271][ T5099] ? unmap_vmas (??:?) =

>>> [ 40.206647][ T5099] ? exit_mmap (??:?) =

>>> [ 40.207032][ T5099] ? __mmput (fork.c:?) =

>>> [ 40.207405][ T5099] ? mmput (??:?) =

>>> [ 40.207751][ T5099] ? exit_mm (exit.c:?) =

>>> [ 40.208121][ T5099] ? do_exit (??:?) =

>>> [ 40.208497][ T5099] ? do_group_exit (??:?) =

>>> [ 40.208905][ T5099] ? trace_hardirqs_on (??:?) =

>>> [ 40.209345][ T5099] ? get_signal (??:?) =

>>> [ 40.209750][ T5099] ? arch_do_signal_or_restart (??:?) =

>>> [ 40.210287][ T5099] ? exit_to_user_mode_loop (common.c:?) =

>>> [ 40.210778][ T5099] ? exit_to_user_mode_prepare (common.c:?) =

>>> [ 40.211302][ T5099] ? syscall_exit_to_user_mode (??:?) =

>>> [ 40.211808][ T5099] ? ret_from_fork (??:?) =

>>> [   40.212268][ T5099] Disabling lock debugging due to kernel taint
>>> [   40.231123][ T5097] BUG: Bad page map in process trinity-c5  pte:171=
e0a3e pmd:0a8d3067
>>> [   40.231770][ T5099] BUG: Bad page map in process trinity-c7  pte:171=
3023a pmd:7ff71067
>>> [   40.231883][ T5097] addr:36ed5000 vm_flags:000000fb anon_vma:0000000=
0 mapping:485d0d80 index:1
>>> [   40.232611][ T5099] addr:096e8000 vm_flags:00100073 anon_vma:bff0ab1=
8 mapping:00000000 index:96e8
>>> [   40.233429][ T5097] file:dev/zero fault:shmem_fault mmap:shmem_mmap =
readpage:0x0
>>> [   40.234271][ T5099] file:(null) fault:0x0 mmap:0x0 readpage:0x0
>>> [   40.234971][ T5097] CPU: 1 PID: 5097 Comm: trinity-c5 Tainted: G    =
B             5.18.0-rc2-mm1-00053-gd1ec551f874e #1
>>> [   40.236510][ T5097] Call Trace:
>>
>> This is 32bit (i386) I assume. I wonder if something about the 32bit swp
>> layout is special and we have to restrict it to 64bit here.
>>
> =

> Staring at arch/x86/include/asm/pgtable-2level.h, I think that's the case:
> The swp type effectively starts at "_PAGE_BIT_PRESENT + 1" which should b=
e bit 1.

Updated patch in

https://lkml.kernel.org/r/d875c292-46b3-f281-65ae-71d0b0c6f592(a)redhat.com


-- =

Thanks,

David / dhildenb

--===============7816641708392430369==--

