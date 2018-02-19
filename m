Content-Type: multipart/mixed; boundary="===============7506327530054266026=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [perf/x86/intel] 41e062cd2e: WARNING:at_arch/x86/events/intel/ds.c:#intel_pmu_save_and_restart_reload
Date: Mon, 19 Feb 2018 13:44:46 +0100
Message-ID: <20180219124446.GR25201@hirez.programming.kicks-ass.net>
In-Reply-To: <20180217062119.cemwsj6dsf4ezfn6@inn>
List-Id: <oe-lkp.lists.linux.dev>

--===============7506327530054266026==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 17, 2018 at 02:21:19PM +0800, kernel test robot wrote:
> [  242.731381] WARNING: CPU: 3 PID: 1107 at arch/x86/events/intel/ds.c:13=
26 intel_pmu_save_and_restart_reload+0x87/0x90

That's the one asserting the PMU is in fact disabled.

> [  242.731417] CPU: 3 PID: 1107 Comm: netserver Not tainted 4.15.0-00001-=
g41e062c #1
> [  242.731418] Hardware name: LENOVO IdeaPad U410    /Lenovo          , B=
IOS 65CN15WW 06/05/2012
> [  242.731422] RIP: 0010:intel_pmu_save_and_restart_reload+0x87/0x90
> [  242.731423] RSP: 0018:fffffe000008c8d0 EFLAGS: 00010002
> [  242.731425] RAX: 0000000000000001 RBX: ffff88007d069800 RCX: 000000000=
0000000
> [  242.731426] RDX: 0000000000000001 RSI: 0000000000000001 RDI: ffff88007=
d069800
> [  242.731427] RBP: 0000000000000010 R08: 0000000000000001 R09: 000000000=
0000001
> [  242.731428] R10: 00000000000000b0 R11: 0000000000003000 R12: 000000000=
00f4243
> [  242.731429] R13: 0000000000000001 R14: 0000000000000000 R15: 000000000=
0000001
> [  242.731431] FS:  00007f1501639700(0000) GS:ffff880112ac0000(0000) knlG=
S:0000000000000000
> [  242.731432] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  242.731433] CR2: 00007f65a1394d68 CR3: 000000007f62a006 CR4: 000000000=
01606e0
> [  242.731434] Call Trace:
> [  242.731438]  <NMI>
> [  242.731443]  __intel_pmu_pebs_event+0xc8/0x260
> [  242.731452]  ? intel_pmu_drain_pebs_nhm+0x211/0x2f0
> [  242.731454]  intel_pmu_drain_pebs_nhm+0x211/0x2f0
> [  242.731457]  intel_pmu_handle_irq+0x12d/0x4b0
> [  242.731464]  ? perf_event_nmi_handler+0x2d/0x50
> [  242.731466]  perf_event_nmi_handler+0x2d/0x50
> [  242.731470]  nmi_handle+0x6a/0x130
> [  242.731473]  default_do_nmi+0x4e/0x110
> [  242.731475]  do_nmi+0xe5/0x140
> [  242.731479]  end_repeat_nmi+0x1a/0x54

And this should have shown with any testing I think.

The problem appears to be that intel_pmu_handle_irq() uses
__intel_pmu_disable_all() which 'forgets' to clear cpuc->enabled as per
x86_pmu_disable().



--===============7506327530054266026==--

