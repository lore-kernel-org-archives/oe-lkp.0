Content-Type: multipart/mixed; boundary="===============1193936884989403135=="
MIME-Version: 1.0
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
To: lkp@lists.01.org
Subject: Re: [mm/sl[au]b] 3c4cafa313: canonical_address#:#[##]
Date: Fri, 09 Sep 2022 20:05:15 +0900
Message-ID: <Yxsd625lvTS6IWc+@hyeyoo>
In-Reply-To: <aec59f53-0e53-1736-5932-25407125d4d4@suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============1193936884989403135==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 09, 2022 at 12:21:32PM +0200, Vlastimil Babka wrote:
> =

> On 9/6/22 17:11, Vlastimil Babka wrote:
> > On 9/6/22 16:56, Hyeonggon Yoo wrote:
> >> On Tue, Sep 06, 2022 at 03:51:01PM +0800, kernel test robot wrote:
> >>> Greeting,
> >>>
> >>> FYI, we noticed the following commit (built with gcc-11):
> >>>
> >>> commit: 3c4cafa313d978b31a1d5dc17c323074b19a1d63 ("mm/sl[au]b: rearra=
nge
> >>> struct slab fields to allow larger rcu_head")
> >>> git://git.kernel.org/cgit/linux/kernel/git/vbabka/slab.git
> >>> for-6.1/fit_rcu_head
> >>>
> >>> in testcase: fio-basic
> >>> version: fio-x86_64-3.15-1_20220903
> >>> with following parameters:
> >>>
> >>> =C2=A0=C2=A0=C2=A0=C2=A0disk: 2pmem
> >>> =C2=A0=C2=A0=C2=A0=C2=A0fs: xfs
> >>> =C2=A0=C2=A0=C2=A0=C2=A0runtime: 200s
> >>> =C2=A0=C2=A0=C2=A0=C2=A0nr_task: 50%
> >>> =C2=A0=C2=A0=C2=A0=C2=A0time_based: tb
> >>> =C2=A0=C2=A0=C2=A0=C2=A0rw: randrw
> >>> =C2=A0=C2=A0=C2=A0=C2=A0bs: 2M
> >>> =C2=A0=C2=A0=C2=A0=C2=A0ioengine: mmap
> >>> =C2=A0=C2=A0=C2=A0=C2=A0test_size: 200G
> >>> =C2=A0=C2=A0=C2=A0=C2=A0cpufreq_governor: performance
> >>>
> >>> test-description: Fio is a tool that will spawn a number of threads or
> >>> processes doing a particular type of I/O action as specified by the u=
ser.
> >>> test-url:https://github.com/axboe/fio
> >>>
> >>>
> >>> on test machine: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @
> >>> 2.10GHz (Cascade Lake) with 512G memory
> >>>
> >>> caused below changes (please refer to attached dmesg/kmsg for entire
> >>> log/backtrace):
> >>>
> >>>
> >>> [=C2=A0 304.700893][=C2=A0=C2=A0 C40] perf: interrupt took too long (=
12747 > 12477),
> >>> lowering kernel.perf_event_max_sample_rate to 15000
> >>> [=C2=A0 305.015834][=C2=A0=C2=A0 C40] perf: interrupt took too long (=
15947 > 15933),
> >>> lowering kernel.perf_event_max_sample_rate to 12000
> >>> [=C2=A0 305.954702][=C2=A0=C2=A0 C40] perf: interrupt took too long (=
19968 > 19933),
> >>> lowering kernel.perf_event_max_sample_rate to 10000
> >>> [=C2=A0 309.554949][=C2=A0=C2=A0 C31] perf: interrupt took too long (=
25118 > 24960),
> >>> lowering kernel.perf_event_max_sample_rate to 7000
> >>> [=C2=A0 315.068744][=C2=A0=C2=A0 C95] sched: RT throttling activated
> >>> [=C2=A0 317.121806][=C2=A0 T590] general protection fault, probably f=
or
> >>> non-canonical address 0xdead000000000120: 0000 [#1] SMP NOPTI
> >>> [=C2=A0 317.133291][=C2=A0 T590] CPU: 61 PID: 590 Comm: kcompactd0 Ta=
inted: G
> >>> S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.0.0-rc2-00002-g3c4cafa313d9 #1
> >>> [=C2=A0 317.144084][=C2=A0 T590] Hardware name: Intel Corporation
> >>> S2600WFT/S2600WFT, BIOS SE5C620.86B.02.01.0008.031920191559 03/19/2019
> >>> [ 317.155668][ T590] RIP: 0010:isolate_movable_page (mm/migrate.c:103)
> >>> [ 317.162016][ T590] Code: ba 28 00 0f 82 88 00 00 00 48 89 ef e8 e2 =
3a
> >>> f8 ff 84 c0 74 74 48 8b 45 00 a9 00 00 04 00 75 69 48 8b 45 18 44 89 =
e6
> >>> 48 89 ef <48> 8b 40 fe ff d0 0f 1f 00 84 c0 74 52 48 8b 45 00 a9 00 0=
0 04 00
> >>> All code
> >>> =3D=3D=3D=3D=3D=3D=3D=3D
> >>> =C2=A0=C2=A0=C2=A0 0:=C2=A0=C2=A0=C2=A0 ba 28 00 0f 82=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=C2=A0 $0x820f=
0028,%edx
> >>> =C2=A0=C2=A0=C2=A0 5:=C2=A0=C2=A0=C2=A0 88 00=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=C2=A0 %al,(%rax)
> >>> =C2=A0=C2=A0=C2=A0 7:=C2=A0=C2=A0=C2=A0 00 00=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 add=C2=A0=C2=A0=C2=A0 %al,(%rax)
> >>> =C2=A0=C2=A0=C2=A0 9:=C2=A0=C2=A0=C2=A0 48 89 ef=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 mov=C2=A0=C2=A0=C2=A0 %rbp,%rdi
> >>> =C2=A0=C2=A0=C2=A0 c:=C2=A0=C2=A0=C2=A0 e8 e2 3a f8 ff=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 callq=C2=A0 0xfffffffffff83af3
> >>> =C2=A0=C2=A0 11:=C2=A0=C2=A0=C2=A0 84 c0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 test=C2=A0=C2=A0 %al,%al
> >>> =C2=A0=C2=A0 13:=C2=A0=C2=A0=C2=A0 74 74=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 je=C2=A0=C2=A0=C2=A0=C2=A0 0x89
> >>> =C2=A0=C2=A0 15:=C2=A0=C2=A0=C2=A0 48 8b 45 00=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=
=C2=A0 0x0(%rbp),%rax
> >>> =C2=A0=C2=A0 19:=C2=A0=C2=A0=C2=A0 a9 00 00 04 00=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test=C2=A0=C2=A0 $0x40000,%eax
> >>> =C2=A0=C2=A0 1e:=C2=A0=C2=A0=C2=A0 75 69=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 jne=C2=A0=C2=A0=C2=A0 0x89
> >>> =C2=A0=C2=A0 20:=C2=A0=C2=A0=C2=A0 48 8b 45 18=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=
=C2=A0 0x18(%rbp),%rax
> >>> =C2=A0=C2=A0 24:=C2=A0=C2=A0=C2=A0 44 89 e6=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mo=
v=C2=A0=C2=A0=C2=A0 %r12d,%esi
> >>> =C2=A0=C2=A0 27:=C2=A0=C2=A0=C2=A0 48 89 ef=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mo=
v=C2=A0=C2=A0=C2=A0 %rbp,%rdi
> >>> =C2=A0=C2=A0 2a:*=C2=A0=C2=A0=C2=A0 48 8b 40 fe=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=
=C2=A0 -0x2(%rax),%rax=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <--
> >>> trapping instruction
> >>> =C2=A0=C2=A0 2e:=C2=A0=C2=A0=C2=A0 ff d0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 callq=C2=A0 *%rax
> >>> =C2=A0=C2=A0 30:=C2=A0=C2=A0=C2=A0 0f 1f 00=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 no=
pl=C2=A0=C2=A0 (%rax)
> >>> =C2=A0=C2=A0 33:=C2=A0=C2=A0=C2=A0 84 c0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 test=C2=A0=C2=A0 %al,%al
> >>> =C2=A0=C2=A0 35:=C2=A0=C2=A0=C2=A0 74 52=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 je=C2=A0=C2=A0=C2=A0=C2=A0 0x89
> >>> =C2=A0=C2=A0 37:=C2=A0=C2=A0=C2=A0 48 8b 45 00=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=
=C2=A0 0x0(%rbp),%rax
> >>> =C2=A0=C2=A0 3b:=C2=A0=C2=A0=C2=A0 a9 00 00 04 00=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test=C2=A0=C2=A0 $0x40000,%eax
> >>>
> >>> Code starting with the faulting instruction
> >>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> =C2=A0=C2=A0=C2=A0 0:=C2=A0=C2=A0=C2=A0 48 8b 40 fe=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=
=A0=C2=A0 -0x2(%rax),%rax
> >>> =C2=A0=C2=A0=C2=A0 4:=C2=A0=C2=A0=C2=A0 ff d0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 callq=C2=A0 *%rax
> >>> =C2=A0=C2=A0=C2=A0 6:=C2=A0=C2=A0=C2=A0 0f 1f 00=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 nopl=C2=A0=C2=A0 (%rax)
> >>> =C2=A0=C2=A0=C2=A0 9:=C2=A0=C2=A0=C2=A0 84 c0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 test=C2=A0=C2=A0 %al,%al
> >>> =C2=A0=C2=A0=C2=A0 b:=C2=A0=C2=A0=C2=A0 74 52=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 je=C2=A0=C2=A0=C2=A0=C2=A0 0x5f
> >>> =C2=A0=C2=A0=C2=A0 d:=C2=A0=C2=A0=C2=A0 48 8b 45 00=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=
=A0=C2=A0 0x0(%rbp),%rax
> >>> =C2=A0=C2=A0 11:=C2=A0=C2=A0=C2=A0 a9 00 00 04 00=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test=C2=A0=C2=A0 $0x40000,%eax
> >>> [=C2=A0 317.182354][=C2=A0 T590] RSP: 0018:ffffc9000e1d3c78 EFLAGS: 0=
0010246
> >>> [=C2=A0 317.188668][=C2=A0 T590] RAX: dead000000000122 RBX: ffffea000=
4031034 RCX:
> >>> 000000000000000c
> >>> [=C2=A0 317.196890][=C2=A0 T590] RDX: dead000000000101 RSI: 000000000=
000000c RDI:
> >>> ffffea0004031000
> >>> [=C2=A0 317.205273][=C2=A0 T590] RBP: ffffea0004031000 R08: 000000000=
4031000 R09:
> >>> 0000000000000004
> >>> [=C2=A0 317.213752][=C2=A0 T590] R10: 00000000000066b6 R11: 000000000=
0000004 R12:
> >>> 000000000000000c
> >>> [=C2=A0 317.222384][=C2=A0 T590] R13: ffffea0004031000 R14: 000000000=
0100c40 R15:
> >>> ffffc9000e1d3df0
> >>> [=C2=A0 317.230679][=C2=A0 T590] FS:=C2=A0 0000000000000000(0000)
> >>> GS:ffff88c04ff40000(0000) knlGS:0000000000000000
> >>> [=C2=A0 317.239896][=C2=A0 T590] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0=
: 0000000080050033
> >>> [=C2=A0 317.247098][=C2=A0 T590] CR2: 0000000000451c00 CR3: 000000806=
4ca4002 CR4:
> >>> 00000000007706e0
> >>> [=C2=A0 317.255788][=C2=A0 T590] DR0: 0000000000000000 DR1: 000000000=
0000000 DR2:
> >>> 0000000000000000
> >>> [=C2=A0 317.264256][=C2=A0 T590] DR3: 0000000000000000 DR6: 00000000f=
ffe0ff0 DR7:
> >>> 0000000000000400
> >>> [=C2=A0 317.272772][=C2=A0 T590] PKRU: 55555554
> >>> [=C2=A0 317.276783][=C2=A0 T590] Call Trace:
> >>> [=C2=A0 317.280932][=C2=A0 T590]=C2=A0 <TASK>
> >>> [ 317.284315][ T590] isolate_migratepages_block (mm/compaction.c:982)
> >>> [ 317.290702][ T590] isolate_migratepages (mm/compaction.c:1960)
> >>> [ 317.296278][ T590] compact_zone (mm/compaction.c:2393)
> >>> [ 317.301202][ T590] proactive_compact_node (mm/compaction.c:2661
> >>> (discriminator 2))
> >> Hmm... Let's debug.
> >>
> >> FYI, simply echo 1 > /proc/sys/vm/compact_memory invokes same bug on m=
y test
> >> environment.
> >>
> >> the 'mops' is invalid address in mm/migrate.c:103.
> >>
> >> Hmm, why is this slab page confused as movable page?
> >> -> Because page->'mapping' and slab->slabs field has same offset.
> >>
> >> I think this is invoked because lowest two bits of slab->slabs is not =
0.
> >>
> >> Vlastimil, any thoughts?
> > =

> > Yeah, slabs->slabs could do that, and the remedy would be to exchange it
> > with the slab->next field.
> > However the report points to the value dead000000000122 which is
> > LIST_POISON2, which unfortunately contains the lower bit after 4c6080cd=
6f8b
> > ("lib/list: tweak LIST_POISON2 for better code generation on x86_64")
> > =

> > Probably the simplest fix would be to check for PageSlab() before
> > __PageMovable().
> =

> So I've done with the patch below, that I added to the for-6.1/fit_rcu_he=
ad
> branch in slab.git. It's not very nice though with all the new membarrier=
s.
> I hope it's at least correct...
> =

> > But heads up for Joel - if your rcu_head debugging info series (didn't
> > check) has something like a counter in the 3rd 64bit word, where bit 1 =
can
> > thus be set, it can cause the same issue fooling the __PageMovable() ch=
eck.
> =

> ----8<----
> From d6f9fbb33b908eb8162cc1f6ce7f7c970d0f285f Mon Sep 17 00:00:00 2001
> From: Vlastimil Babka <vbabka@suse.cz>
> Date: Fri, 9 Sep 2022 12:03:10 +0200
> Subject: [PATCH 2/3] mm/migrate: make isolate_movable_page() skip slab pa=
ges
> =

> In the next commit we want to rearrange struct slab fields to allow a
> larger rcu_head. Afterwards, the page->mapping field will overlap
> with SLUB's "struct list_head slab_list", where the value of prev
> pointer can become LIST_POISON2, which is 0x122 + POISON_POINTER_DELTA.
> Unfortunately the bit 1 being set can confuse PageMovable() to be a
> false positive and cause a GPF as reported by lkp [1].
> =

> To fix this, make isolate_movable_page() skip pages with the PageSlab
> flag set. This is a bit tricky as we need to add memory barriers to SLAB
> and SLUB's page allocation and freeing, and their counterparts to
> isolate_movable_page().

Hello, I just took a quick grasp,
Is this approach okay with folio_test_anon()?

> =

> [1] https://lore.kernel.org/all/208c1757-5edd-fd42-67d4-1940cc43b50f(a)in=
tel.com/
> =

> Reported-by: kernel test robot <yujie.liu@intel.com>
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
> ---
>  mm/compaction.c |  2 +-
>  mm/migrate.c    | 12 +++++++++++-
>  mm/slab.c       |  6 +++++-
>  mm/slub.c       |  6 +++++-
>  4 files changed, 22 insertions(+), 4 deletions(-)
> =

> diff --git a/mm/compaction.c b/mm/compaction.c
> index 640fa76228dd..b697c207beec 100644
> --- a/mm/compaction.c
> +++ b/mm/compaction.c
> @@ -972,7 +972,7 @@ isolate_migratepages_block(struct compact_control *cc=
, unsigned long low_pfn,
>  			 * __PageMovable can return false positive so we need
>  			 * to verify it under page_lock.
>  			 */
> -			if (unlikely(__PageMovable(page)) &&
> +			if (unlikely(!PageSlab(page) && __PageMovable(page)) &&
>  					!PageIsolated(page)) {
>  				if (locked) {
>  					unlock_page_lruvec_irqrestore(locked, flags);
> diff --git a/mm/migrate.c b/mm/migrate.c
> index 6a1597c92261..7f661b45d431 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -78,7 +78,7 @@ int isolate_movable_page(struct page *page, isolate_mod=
e_t mode)
>  	 * assumes anybody doesn't touch PG_lock of newly allocated page
>  	 * so unconditionally grabbing the lock ruins page's owner side.
>  	 */
> -	if (unlikely(!__PageMovable(page)))
> +	if (unlikely(!__PageMovable(page) || PageSlab(page)))
>  		goto out_putpage;
>  	/*
>  	 * As movable pages are not isolated from LRU lists, concurrent
> @@ -94,9 +94,19 @@ int isolate_movable_page(struct page *page, isolate_mo=
de_t mode)
>  	if (unlikely(!trylock_page(page)))
>  		goto out_putpage;
>  =

> +	if (unlikely(PageSlab(page)))
> +		goto out_no_isolated;
> +	/* Pairs with smp_wmb() in slab freeing, e.g. SLUB's __free_slab() */
> +	smp_rmb();
> +
>  	if (!PageMovable(page) || PageIsolated(page))
>  		goto out_no_isolated;
>  =

> +	/* Pairs with smp_wmb() in slab allocation, e.g. SLUB's alloc_slab_page=
() */
> +	smp_rmb();
> +	if (unlikely(PageSlab(page)))
> +		goto out_no_isolated;
> +
>  	mops =3D page_movable_ops(page);
>  	VM_BUG_ON_PAGE(!mops, page);
>  =

> diff --git a/mm/slab.c b/mm/slab.c
> index 10e96137b44f..25e9a6ef4f74 100644
> --- a/mm/slab.c
> +++ b/mm/slab.c
> @@ -1370,6 +1370,8 @@ static struct slab *kmem_getpages(struct kmem_cache=
 *cachep, gfp_t flags,
>  =

>  	account_slab(slab, cachep->gfporder, cachep, flags);
>  	__folio_set_slab(folio);
> +	/* Make the flag visible before any changes to folio->mapping */
> +	smp_wmb();
>  	/* Record if ALLOC_NO_WATERMARKS was set when allocating the slab */
>  	if (sk_memalloc_socks() && page_is_pfmemalloc(folio_page(folio, 0)))
>  		slab_set_pfmemalloc(slab);
> @@ -1387,9 +1389,11 @@ static void kmem_freepages(struct kmem_cache *cach=
ep, struct slab *slab)
>  =

>  	BUG_ON(!folio_test_slab(folio));
>  	__slab_clear_pfmemalloc(slab);
> -	__folio_clear_slab(folio);
>  	page_mapcount_reset(folio_page(folio, 0));
>  	folio->mapping =3D NULL;
> +	/* Make the mapping reset visible before clearing the flag */
> +	smp_wmb();
> +	__folio_clear_slab(folio);
>  =

>  	if (current->reclaim_state)
>  		current->reclaim_state->reclaimed_slab +=3D 1 << order;
> diff --git a/mm/slub.c b/mm/slub.c
> index d86be1b0d09f..2f9cb6e67de3 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -1830,6 +1830,8 @@ static inline struct slab *alloc_slab_page(gfp_t fl=
ags, int node,
>  =

>  	slab =3D folio_slab(folio);
>  	__folio_set_slab(folio);
> +	/* Make the flag visible before any changes to folio->mapping */
> +	smp_wmb();
>  	if (page_is_pfmemalloc(folio_page(folio, 0)))
>  		slab_set_pfmemalloc(slab);
>  =

> @@ -2037,8 +2039,10 @@ static void __free_slab(struct kmem_cache *s, stru=
ct slab *slab)
>  	int pages =3D 1 << order;
>  =

>  	__slab_clear_pfmemalloc(slab);
> -	__folio_clear_slab(folio);
>  	folio->mapping =3D NULL;
> +	/* Make the mapping reset visible before clearing the flag */
> +	smp_wmb();
> +	__folio_clear_slab(folio);
>  	if (current->reclaim_state)
>  		current->reclaim_state->reclaimed_slab +=3D pages;
>  	unaccount_slab(slab, order, s);
> -- =

> 2.37.3
> =

> =

> =


-- =

Thanks,
Hyeonggon
--===============1193936884989403135==--

