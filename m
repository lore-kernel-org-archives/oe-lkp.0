Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A584436A
	for <oe-lkp@lists.linux.dev>; Sun, 22 Oct 2023 00:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lhRgVtmH"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-49e035bdca7so722217e0c.2
        for <oe-lkp@lists.linux.dev>; Sat, 21 Oct 2023 17:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697936165; x=1698540965; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5OnO1MBd6+KhZ17LR91vEcgXpVdTRhK7syQbr2E6Rgw=;
        b=lhRgVtmHvbUqxToANl4mvfl1hBElH+Je3/LkKvrw64haLlJ0pYyxZlK6SA1+sORu/A
         LcIl7Q0V8ktyyCxc359MJX5yOo4mqBpSMWlhz4XhzN1lGxgKLueVDqFFjYzXZVH8/s2Q
         O0QiEIJLl6OS4EfCqqSNFYAmIBJmaTyWpjZk5ILP22W2wOSf1PxfcpqkjnC2VQra5kkT
         oi92U+SDsfSu3IOQaOSsnFy1dNpb6g+4PEuzejOCsLwInwuVATPlB9opE2v3vUCriPSe
         Ov4a5MqI54Bghy+nRH1BPMyzIw41w0LWOOg63AksvTndAM27y6OzVPa+9qsb1/8iwIuM
         gdVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697936165; x=1698540965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5OnO1MBd6+KhZ17LR91vEcgXpVdTRhK7syQbr2E6Rgw=;
        b=mQ4tWUJdC2hZ1aMllJnJWc80NUwer8/A+nixzFQT4oEauezWODnZaMEoIuYXiPv304
         AmC/jZE+RKo35dApykNmyR+OoJLrzKvkwLa/qpTSCvpXlkV7aduTL/dUxvdCQHdlFlwJ
         k/YBGnY4uaKRwOIil4tgMGOUEa0USROftqfe3TRsGVuxI09pUZmUBI7oqO8FOjFq2j8F
         rdapNnxQc4/GCCx78PNScWfbEmJprwYq7zdeBXB1RaVzksr5ZmgqB7TWeOGmob+eGZyQ
         /c0RKS1PXCWI4jn/GdOB2njKGLVCBs4tmoI/ukhuPxHhftWKOQhATMLy1t2oeM6h0CxT
         2xZg==
X-Gm-Message-State: AOJu0Yyi+0ygXyEtDHIP9vI05rKLcsC6Ep+3J2hROe3t2nMcjV7mp0AZ
	IMPAKObTs2KUqg0mNZlL5gEzc4yYmFTym7CvWkjfS1Df
X-Google-Smtp-Source: AGHT+IFseQJ4wysn1A4NEFF8hPyu8bZ+rrLyn5ez0P0q2czr9Q9ywJMqrC3CfvBVtWnsBwl6XwTqxRm7mTHmkN7/Zc0=
X-Received: by 2002:a67:e114:0:b0:44d:453c:a838 with SMTP id
 d20-20020a67e114000000b0044d453ca838mr4872039vsl.5.1697936164988; Sat, 21 Oct
 2023 17:56:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202310202332.2a4dcca1-oliver.sang@intel.com>
In-Reply-To: <202310202332.2a4dcca1-oliver.sang@intel.com>
From: jim.cromie@gmail.com
Date: Sat, 21 Oct 2023 18:55:38 -0600
Message-ID: <CAJfuBxy=Lb+SSYyu6LADFbBDxf6Ei5EsGL2bGxXtMC=qto+w2g@mail.gmail.com>
Subject: Re: [jimc:dd-kitchen-sink] [dyndbg] 64261c3ad0: BUG:TASK_stack_guard_page_was_hit_at#(stack_is#..#)
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hi Oliver, etal,

thanks for the report - Im looking...
I noticed in the dmesg.xz this fragment:
[  346.798552][ T3580] LTP: starting dynamic_debug01 (dynamic_debug01.sh)

I checked the lkp-test repo, I didnt find that script.
is it available ?  it'd be handy to consult.

other than that, the last patch is very new, and highly suspect for this tr=
ace.
HEAD~1 shouldnt leak, since any ptr vals stored in the tree ref to me thats
either builtin, or managed at module-load.






On Fri, Oct 20, 2023 at 9:17=E2=80=AFAM kernel test robot <oliver.sang@inte=
l.com> wrote:
>
>
>
> Hello,
>
> kernel test robot noticed "BUG:TASK_stack_guard_page_was_hit_at#(stack_is=
#..#)" on:
>
> commit: 64261c3ad071780c4b9455ebf4767f105ddc2b79 ("dyndbg: cache the dyna=
mically generated prefixes per callsite")
> https://github.com/jimc/linux.git dd-kitchen-sink
>
> in testcase: ltp
> version: ltp-x86_64-14c1f76-1_20230715
> with following parameters:
>
>         test: tracing
>
>
>
> compiler: gcc-12
> test machine: 16 threads 1 sockets Intel(R) Xeon(R) CPU D-1541 @ 2.10GHz =
(Broadwell-DE) with 48G memory
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202310202332.2a4dcca1-oliver.san=
g@intel.com
>
>
> [  378.654196][    C3] BUG: TASK stack guard page was hit at 000000005b78=
7114 (stack is 0000000024ca83b8..000000000d3fb8a1)
> [  378.654204][    C3] stack guard page: 0000 [#1] PREEMPT SMP KASAN PTI
> [  378.654209][    C3] CPU: 3 PID: 1667 Comm: in:imklog Tainted: G S     =
            6.6.0-rc6-00034-g64261c3ad071 #1
> [  378.654214][    C3] Hardware name: Supermicro SYS-5018D-FN4T/X10SDV-8C=
-TLN4F, BIOS 1.1 03/02/2016
> [ 378.654217][ C3] RIP: 0010:format_decode (lib/vsprintf.c:2526)
> [ 378.654227][ C3] Code: 90 48 b8 00 00 00 00 00 fc ff df 41 57 4c 8d 7e =
07 41 56 4c 89 f9 41 55 48 c1 e9 03 49 89 f5 41 54 55 48 89 fd 53 48 83 ec =
68 <48> c7 44 24 08 b3 8a b5 41 4c 8d 64 24 08 48 c7 44 24 10 b0 6b 44
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0:   90                      nop
>    1:   48 b8 00 00 00 00 00    movabs $0xdffffc0000000000,%rax
>    8:   fc ff df
>    b:   41 57                   push   %r15
>    d:   4c 8d 7e 07             lea    0x7(%rsi),%r15
>   11:   41 56                   push   %r14
>   13:   4c 89 f9                mov    %r15,%rcx
>   16:   41 55                   push   %r13
>   18:   48 c1 e9 03             shr    $0x3,%rcx
>   1c:   49 89 f5                mov    %rsi,%r13
>   1f:   41 54                   push   %r12
>   21:   55                      push   %rbp
>   22:   48 89 fd                mov    %rdi,%rbp
>   25:   53                      push   %rbx
>   26:   48 83 ec 68             sub    $0x68,%rsp
>   2a:*  48 c7 44 24 08 b3 8a    movq   $0x41b58ab3,0x8(%rsp)            <=
-- trapping instruction
>   31:   b5 41
>   33:   4c 8d 64 24 08          lea    0x8(%rsp),%r12
>   38:   48                      rex.W
>   39:   c7                      .byte 0xc7
>   3a:   44 24 10                rex.R and $0x10,%al
>   3d:   b0 6b                   mov    $0x6b,%al
>   3f:   44                      rex.R
>
> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    0:   48 c7 44 24 08 b3 8a    movq   $0x41b58ab3,0x8(%rsp)
>    7:   b5 41
>    9:   4c 8d 64 24 08          lea    0x8(%rsp),%r12
>    e:   48                      rex.W
>    f:   c7                      .byte 0xc7
>   10:   44 24 10                rex.R and $0x10,%al
>   13:   b0 6b                   mov    $0x6b,%al
>   15:   44                      rex.R
> [  378.654230][    C3] RSP: 0018:ffffc90001737fc8 EFLAGS: 00010292
> [  378.654237][    C3] RAX: dffffc0000000000 RBX: ffffc90001738148 RCX: 1=
ffff920002e7016
> [  378.654240][    C3] RDX: 0000000000000000 RSI: ffffc900017380b0 RDI: f=
fffffff83e4c360
> [  378.654243][    C3] RBP: ffffffff83e4c360 R08: 0000000000000008 R09: 0=
000000000000001
> [  378.654246][    C3] R10: ffff888c7398cc3b R11: 000000000000000a R12: f=
fffc900017380b0
> [  378.654249][    C3] R13: ffffc900017380b0 R14: 0000000000000008 R15: f=
fffc900017380b7
> [  378.654252][    C3] FS:  00007f74749046c0(0000) GS:ffff888bcab80000(00=
00) knlGS:0000000000000000
> [  378.654255][    C3] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  378.654258][    C3] CR2: ffffc90001737fb8 CR3: 0000000c71652002 CR4: 0=
0000000003706e0
> [  378.654261][    C3] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0=
000000000000000
> [  378.654264][    C3] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0=
000000000000400
> [  378.654267][    C3] Call Trace:
> [  378.654270][    C3]  <#DF>
> [ 378.654274][ C3] ? die (arch/x86/kernel/dumpstack.c:421 arch/x86/kernel=
/dumpstack.c:434 arch/x86/kernel/dumpstack.c:447)
> [ 378.654284][ C3] ? handle_stack_overflow (arch/x86/kernel/traps.c:327)
> [ 378.654295][ C3] ? exc_double_fault (arch/x86/kernel/traps.c:378)
> [ 378.654311][ C3] ? asm_exc_double_fault (arch/x86/include/asm/idtentry.=
h:611)
> [ 378.654331][ C3] ? format_decode (lib/vsprintf.c:2526)
> [  378.654340][    C3]  </#DF>
> [  378.654342][    C3]  <TASK>
> [ 378.654349][ C3] ? function_graph_enter (arch/x86/include/asm/atomic.h:=
53 include/linux/atomic/atomic-arch-fallback.h:979 include/linux/atomic/ato=
mic-instrumented.h:436 kernel/trace/fgraph.c:89 kernel/trace/fgraph.c:142)
> [ 378.654361][ C3] vsnprintf (lib/vsprintf.c:2772)
> [ 378.654370][ C3] ? __task_pid_nr_ns (kernel/pid.c:497)
> [ 378.654380][ C3] ? pointer (lib/vsprintf.c:2749)
> [ 378.654385][ C3] ? __rcu_read_unlock (kernel/rcu/tree_plugin.h:419)
> [ 378.654393][ C3] ? prepare_ftrace_return (arch/x86/kernel/ftrace.c:649)
> [ 378.654398][ C3] ? __task_pid_nr_ns (kernel/pid.c:497)
> [ 378.654412][ C3] snprintf (lib/vsprintf.c:2948)
> [ 378.654420][ C3] ? vsprintf (lib/vsprintf.c:2948)
> [ 378.654434][ C3] ? __rcu_read_unlock (kernel/rcu/tree_plugin.h:419)
> [ 378.654447][ C3] dynamic_emit_prefix (lib/dynamic_debug.c:911)
> [ 378.654460][ C3] __dynamic_pr_debug (lib/dynamic_debug.c:939 (discrimin=
ator 2))
> [ 378.654469][ C3] ? dynamic_emit_prefix (lib/dynamic_debug.c:926)
> [ 378.654477][ C3] ? ftrace_graph_stop (kernel/trace/fgraph.c:125)
> [ 378.654488][ C3] ? function_graph_enter (arch/x86/include/asm/atomic.h:=
53 include/linux/atomic/atomic-arch-fallback.h:979 include/linux/atomic/ato=
mic-instrumented.h:436 kernel/trace/fgraph.c:89 kernel/trace/fgraph.c:142)
> [ 378.654510][ C3] ? prepare_ftrace_return (arch/x86/kernel/ftrace.c:649)
> [ 378.654517][ C3] ? __dynamic_emit_prefix (lib/dynamic_debug.c:887)
> [ 378.654531][ C3] kmemleak_alloc (mm/kmemleak.c:978)
> [ 378.654541][ C3] __kmem_cache_alloc_node (mm/slab.h:761 mm/slub.c:3478 =
mm/slub.c:3517)
> [ 378.654547][ C3] ? __dynamic_emit_prefix (lib/dynamic_debug.c:887)
> [ 378.654558][ C3] ? __dynamic_emit_prefix (lib/dynamic_debug.c:887)
> [ 378.654567][ C3] __kmalloc_node_track_caller (include/linux/kasan.h:198=
 mm/slab_common.c:1023 mm/slab_common.c:1043)
> [ 378.654578][ C3] kstrdup (mm/util.c:62)
> [ 378.654588][ C3] __dynamic_emit_prefix (lib/dynamic_debug.c:887)
> [ 378.654599][ C3] dynamic_emit_prefix (lib/dynamic_debug.c:914)
> [ 378.654610][ C3] __dynamic_pr_debug (lib/dynamic_debug.c:939 (discrimin=
ator 2))
> [ 378.654618][ C3] ? dynamic_emit_prefix (lib/dynamic_debug.c:926)
> [ 378.654627][ C3] ? ftrace_graph_stop (kernel/trace/fgraph.c:125)
> [ 378.654638][ C3] ? function_graph_enter (arch/x86/include/asm/atomic.h:=
53 include/linux/atomic/atomic-arch-fallback.h:979 include/linux/atomic/ato=
mic-instrumented.h:436 kernel/trace/fgraph.c:89 kernel/trace/fgraph.c:142)
> [ 378.654660][ C3] ? prepare_ftrace_return (arch/x86/kernel/ftrace.c:649)
> [ 378.654667][ C3] ? __dynamic_emit_prefix (lib/dynamic_debug.c:887)
> [ 378.654681][ C3] kmemleak_alloc (mm/kmemleak.c:978)
> [ 378.654690][ C3] __kmem_cache_alloc_node (mm/slab.h:761 mm/slub.c:3478 =
mm/slub.c:3517)
> [ 378.654694][ C3] ? __dynamic_emit_prefix (lib/dynamic_debug.c:887)
> [ 378.654706][ C3] ? __dynamic_emit_prefix (lib/dynamic_debug.c:887)
> [ 378.654714][ C3] __kmalloc_node_track_caller (include/linux/kasan.h:198=
 mm/slab_common.c:1023 mm/slab_common.c:1043)
> [ 378.654725][ C3] kstrdup (mm/util.c:62)
> [ 378.654733][ C3] __dynamic_emit_prefix (lib/dynamic_debug.c:887)
> [ 378.654745][ C3] dynamic_emit_prefix (lib/dynamic_debug.c:914)
> [ 378.654755][ C3] __dynamic_pr_debug (lib/dynamic_debug.c:939 (discrimin=
ator 2))
> [ 378.654763][ C3] ? dynamic_emit_prefix (lib/dynamic_debug.c:926)
> [ 378.654772][ C3] ? ftrace_graph_stop (kernel/trace/fgraph.c:125)
> [ 378.654783][ C3] ? function_graph_enter (arch/x86/include/asm/atomic.h:=
53 include/linux/atomic/atomic-arch-fallback.h:979 include/linux/atomic/ato=
mic-instrumented.h:436 kernel/trace/fgraph.c:89 kernel/trace/fgraph.c:142)
> [ 378.654805][ C3] ? prepare_ftrace_return (arch/x86/kernel/ftrace.c:649)
> [ 378.654812][ C3] ? __dynamic_emit_prefix (lib/dynamic_debug.c:887)
> [ 378.654826][ C3] kmemleak_alloc (mm/kmemleak.c:978)
> [ 378.654835][ C3] __kmem_cache_alloc_node (mm/slab.h:761 mm/slub.c:3478 =
mm/slub.c:3517)
> [ 378.654840][ C3] ? __dynamic_emit_prefix (lib/dynamic_debug.c:887)
> [ 378.654851][ C3] ? __dynamic_emit_prefix (lib/dynamic_debug.c:887)
> [ 378.654859][ C3] __kmalloc_node_track_caller (include/linux/kasan.h:198=
 mm/slab_common.c:1023 mm/slab_common.c:1043)
> [ 378.654870][ C3] kstrdup (mm/util.c:62)
> [ 378.654878][ C3] __dynamic_emit_prefix (lib/dynamic_debug.c:887)
> [ 378.654890][ C3] dynamic_emit_prefix (lib/dynamic_debug.c:914)
> [ 378.654900][ C3] __dynamic_pr_debug (lib/dynamic_debug.c:939 (discrimin=
ator 2))
> [ 378.654908][ C3] ? dynamic_emit_prefix (lib/dynamic_debug.c:926)
> [ 378.654917][ C3] ? ftrace_graph_stop (kernel/trace/fgraph.c:125)
> [ 378.654928][ C3] ? function_graph_enter (arch/x86/include/asm/atomic.h:=
53 include/linux/atomic/atomic-arch-fallback.h:979 include/linux/atomic/ato=
mic-instrumented.h:436 kernel/trace/fgraph.c:89 kernel/trace/fgraph.c:142)
> [ 378.654950][ C3] ? prepare_ftrace_return (arch/x86/kernel/ftrace.c:649)
> [ 378.654957][ C3] ? __dynamic_emit_prefix (lib/dynamic_debug.c:887)
> [ 378.654971][ C3] kmemleak_alloc (mm/kmemleak.c:978)
> [ 378.654980][ C3] __kmem_cache_alloc_node (mm/slab.h:761 mm/slub.c:3478 =
mm/slub.c:3517)
> [ 378.654984][ C3] ? __dynamic_emit_prefix (lib/dynamic_debug.c:887)
> [ 378.654996][ C3] ? __dynamic_emit_prefix (lib/dynamic_debug.c:887)
> [ 378.655004][ C3] __kmalloc_node_track_caller (include/linux/kasan.h:198=
 mm/slab_common.c:1023 mm/slab_common.c:1043)
> [ 378.655014][ C3] kstrdup (mm/util.c:62)
> [ 378.655023][ C3] __dynamic_emit_prefix (lib/dynamic_debug.c:887)
> [ 378.655034][ C3] dynamic_emit_prefix (lib/dynamic_debug.c:914)
> [ 378.655052][ C3] __dynamic_pr_debug (lib/dynamic_debug.c:939 (discrimin=
ator 2))
> [ 378.655067][ C3] ? dynamic_emit_prefix (lib/dynamic_debug.c:926)
> [ 378.655082][ C3] ? ftrace_graph_stop (kernel/trace/fgraph.c:125)
> [ 378.655104][ C3] ? function_graph_enter (arch/x86/include/asm/atomic.h:=
53 include/linux/atomic/atomic-arch-fallback.h:979 include/linux/atomic/ato=
mic-instrumented.h:436 kernel/trace/fgraph.c:89 kernel/trace/fgraph.c:142)
> [ 378.655149][ C3] ? prepare_ftrace_return (arch/x86/kernel/ftrace.c:649)
> [ 378.655161][ C3] ? __dynamic_emit_prefix (lib/dynamic_debug.c:887)
> [ 378.655175][ C3] kmemleak_alloc (mm/kmemleak.c:978)
> [ 378.655184][ C3] __kmem_cache_alloc_node (mm/slab.h:761 mm/slub.c:3478 =
mm/slub.c:3517)
> [ 378.655189][ C3] ? __dynamic_emit_prefix (lib/dynamic_debug.c:887)
> [ 378.655201][ C3] ? __dynamic_emit_prefix (lib/dynamic_debug.c:887)
> [ 378.655209][ C3] __kmalloc_node_track_caller (include/linux/kasan.h:198=
 mm/slab_common.c:1023 mm/slab_common.c:1043)
> [ 378.655220][ C3] kstrdup (mm/util.c:62)
> [ 378.655228][ C3] __dynamic_emit_prefix (lib/dynamic_debug.c:887)
> [ 378.655240][ C3] dynamic_emit_prefix (lib/dynamic_debug.c:914)
> [ 378.655251][ C3] __dynamic_pr_debug (lib/dynamic_debug.c:939 (discrimin=
ator 2))
> [ 378.655259][ C3] ? dynamic_emit_prefix (lib/dynamic_debug.c:926)
> [ 378.655267][ C3] ? ftrace_graph_stop (kernel/trace/fgraph.c:125)
> [ 378.655278][ C3] ? function_graph_enter (arch/x86/include/asm/atomic.h:=
53 include/linux/atomic/atomic-arch-fallback.h:979 include/linux/atomic/ato=
mic-instrumented.h:436 kernel/trace/fgraph.c:89 kernel/trace/fgraph.c:142)
> [ 378.655300][ C3] ? prepare_ftrace_return (arch/x86/kernel/ftrace.c:649)
> [ 378.655308][ C3] ? __dynamic_emit_prefix (lib/dynamic_debug.c:887)
> [ 378.655322][ C3] kmemleak_alloc (mm/kmemleak.c:978)
> [ 378.655330][ C3] __kmem_cache_alloc_node (mm/slab.h:761 mm/slub.c:3478 =
mm/slub.c:3517)
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20231020/202310202332.2a4dcca1-ol=
iver.sang@intel.com
>
>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
