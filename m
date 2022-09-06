Content-Type: multipart/mixed; boundary="===============1849971561732391737=="
MIME-Version: 1.0
From: Vlastimil Babka <vbabka@suse.cz>
To: lkp@lists.01.org
Subject: Re: [mm/sl[au]b] 3c4cafa313: canonical_address#:#[##]
Date: Tue, 06 Sep 2022 17:11:02 +0200
Message-ID: <416149c0-1e18-0e00-d116-dd3738957556@suse.cz>
In-Reply-To: <YxdfpTDdfBt6VIpo@hyeyoo>
List-Id: <oe-lkp.lists.linux.dev>

--===============1849971561732391737==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 9/6/22 16:56, Hyeonggon Yoo wrote:
> On Tue, Sep 06, 2022 at 03:51:01PM +0800, kernel test robot wrote:
>> Greeting,
>>
>> FYI, we noticed the following commit (built with gcc-11):
>>
>> commit: 3c4cafa313d978b31a1d5dc17c323074b19a1d63 ("mm/sl[au]b: rearrange=
 struct slab fields to allow larger rcu_head")
>> git://git.kernel.org/cgit/linux/kernel/git/vbabka/slab.git for-6.1/fit_r=
cu_head
>>
>> in testcase: fio-basic
>> version: fio-x86_64-3.15-1_20220903
>> with following parameters:
>>
>> 	disk: 2pmem
>> 	fs: xfs
>> 	runtime: 200s
>> 	nr_task: 50%
>> 	time_based: tb
>> 	rw: randrw
>> 	bs: 2M
>> 	ioengine: mmap
>> 	test_size: 200G
>> 	cpufreq_governor: performance
>>
>> test-description: Fio is a tool that will spawn a number of threads or p=
rocesses doing a particular type of I/O action as specified by the user.
>> test-url:https://github.com/axboe/fio
>>
>>
>> on test machine: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2=
.10GHz (Cascade Lake) with 512G memory
>>
>> caused below changes (please refer to attached dmesg/kmsg for entire log=
/backtrace):
>>
>>
>> [  304.700893][   C40] perf: interrupt took too long (12747 > 12477), lo=
wering kernel.perf_event_max_sample_rate to 15000
>> [  305.015834][   C40] perf: interrupt took too long (15947 > 15933), lo=
wering kernel.perf_event_max_sample_rate to 12000
>> [  305.954702][   C40] perf: interrupt took too long (19968 > 19933), lo=
wering kernel.perf_event_max_sample_rate to 10000
>> [  309.554949][   C31] perf: interrupt took too long (25118 > 24960), lo=
wering kernel.perf_event_max_sample_rate to 7000
>> [  315.068744][   C95] sched: RT throttling activated
>> [  317.121806][  T590] general protection fault, probably for non-canoni=
cal address 0xdead000000000120: 0000 [#1] SMP NOPTI
>> [  317.133291][  T590] CPU: 61 PID: 590 Comm: kcompactd0 Tainted: G S   =
              6.0.0-rc2-00002-g3c4cafa313d9 #1
>> [  317.144084][  T590] Hardware name: Intel Corporation S2600WFT/S2600WF=
T, BIOS SE5C620.86B.02.01.0008.031920191559 03/19/2019
>> [ 317.155668][ T590] RIP: 0010:isolate_movable_page (mm/migrate.c:103)
>> [ 317.162016][ T590] Code: ba 28 00 0f 82 88 00 00 00 48 89 ef e8 e2 3a =
f8 ff 84 c0 74 74 48 8b 45 00 a9 00 00 04 00 75 69 48 8b 45 18 44 89 e6 48 =
89 ef <48> 8b 40 fe ff d0 0f 1f 00 84 c0 74 52 48 8b 45 00 a9 00 00 04 00
>> All code
>> =3D=3D=3D=3D=3D=3D=3D=3D
>>     0:	ba 28 00 0f 82       	mov    $0x820f0028,%edx
>>     5:	88 00                	mov    %al,(%rax)
>>     7:	00 00                	add    %al,(%rax)
>>     9:	48 89 ef             	mov    %rbp,%rdi
>>     c:	e8 e2 3a f8 ff       	callq  0xfffffffffff83af3
>>    11:	84 c0                	test   %al,%al
>>    13:	74 74                	je     0x89
>>    15:	48 8b 45 00          	mov    0x0(%rbp),%rax
>>    19:	a9 00 00 04 00       	test   $0x40000,%eax
>>    1e:	75 69                	jne    0x89
>>    20:	48 8b 45 18          	mov    0x18(%rbp),%rax
>>    24:	44 89 e6             	mov    %r12d,%esi
>>    27:	48 89 ef             	mov    %rbp,%rdi
>>    2a:*	48 8b 40 fe          	mov    -0x2(%rax),%rax		<-- trapping instr=
uction
>>    2e:	ff d0                	callq  *%rax
>>    30:	0f 1f 00             	nopl   (%rax)
>>    33:	84 c0                	test   %al,%al
>>    35:	74 52                	je     0x89
>>    37:	48 8b 45 00          	mov    0x0(%rbp),%rax
>>    3b:	a9 00 00 04 00       	test   $0x40000,%eax
>>
>> Code starting with the faulting instruction
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>     0:	48 8b 40 fe          	mov    -0x2(%rax),%rax
>>     4:	ff d0                	callq  *%rax
>>     6:	0f 1f 00             	nopl   (%rax)
>>     9:	84 c0                	test   %al,%al
>>     b:	74 52                	je     0x5f
>>     d:	48 8b 45 00          	mov    0x0(%rbp),%rax
>>    11:	a9 00 00 04 00       	test   $0x40000,%eax
>> [  317.182354][  T590] RSP: 0018:ffffc9000e1d3c78 EFLAGS: 00010246
>> [  317.188668][  T590] RAX: dead000000000122 RBX: ffffea0004031034 RCX: =
000000000000000c
>> [  317.196890][  T590] RDX: dead000000000101 RSI: 000000000000000c RDI: =
ffffea0004031000
>> [  317.205273][  T590] RBP: ffffea0004031000 R08: 0000000004031000 R09: =
0000000000000004
>> [  317.213752][  T590] R10: 00000000000066b6 R11: 0000000000000004 R12: =
000000000000000c
>> [  317.222384][  T590] R13: ffffea0004031000 R14: 0000000000100c40 R15: =
ffffc9000e1d3df0
>> [  317.230679][  T590] FS:  0000000000000000(0000) GS:ffff88c04ff40000(0=
000) knlGS:0000000000000000
>> [  317.239896][  T590] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [  317.247098][  T590] CR2: 0000000000451c00 CR3: 0000008064ca4002 CR4: =
00000000007706e0
>> [  317.255788][  T590] DR0: 0000000000000000 DR1: 0000000000000000 DR2: =
0000000000000000
>> [  317.264256][  T590] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: =
0000000000000400
>> [  317.272772][  T590] PKRU: 55555554
>> [  317.276783][  T590] Call Trace:
>> [  317.280932][  T590]  <TASK>
>> [ 317.284315][ T590] isolate_migratepages_block (mm/compaction.c:982)
>> [ 317.290702][ T590] isolate_migratepages (mm/compaction.c:1960)
>> [ 317.296278][ T590] compact_zone (mm/compaction.c:2393)
>> [ 317.301202][ T590] proactive_compact_node (mm/compaction.c:2661 (discr=
iminator 2))
> Hmm... Let's debug.
> =

> FYI, simply echo 1 > /proc/sys/vm/compact_memory invokes same bug on my t=
est
> environment.
> =

> the 'mops' is invalid address in mm/migrate.c:103.
> =

> Hmm, why is this slab page confused as movable page?
> -> Because page->'mapping' and slab->slabs field has same offset.
> =

> I think this is invoked because lowest two bits of slab->slabs is not 0.
> =

> Vlastimil, any thoughts?

Yeah, slabs->slabs could do that, and the remedy would be to exchange it =

with the slab->next field.
However the report points to the value dead000000000122 which is =

LIST_POISON2, which unfortunately contains the lower bit after =

4c6080cd6f8b ("lib/list: tweak LIST_POISON2 for better code generation =

on x86_64")

Probably the simplest fix would be to check for PageSlab() before =

__PageMovable().

But heads up for Joel - if your rcu_head debugging info series (didn't =

check) has something like a counter in the 3rd 64bit word, where bit 1 =

can thus be set, it can cause the same issue fooling the __PageMovable() =

check.

>>
>> If you fix the issue, kindly add following tag
>> Reported-by: kernel test robot<yujie.liu@intel.com>
>>
>>
>> To reproduce:
>>
>>          git clonehttps://github.com/intel/lkp-tests.git
>>          cd lkp-tests
>>          sudo bin/lkp install job.yaml           # job file is attached =
in this email
>>          bin/lkp split-job --compatible job.yaml # generate the yaml fil=
e for lkp run
>>          sudo bin/lkp run generated-yaml-file
>>
>>          # if come across any failure that blocks the test,
>>          # please remove ~/.lkp and /lkp dir to run from a clean state.
>>
>>
>> -- =

>> 0-DAY CI Kernel Test Service
>> https://01.org/lkp

--===============1849971561732391737==--

