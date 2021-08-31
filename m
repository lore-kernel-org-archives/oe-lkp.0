Content-Type: multipart/mixed; boundary="===============4910109701518700164=="
MIME-Version: 1.0
From: Song Liu <songliubraving@fb.com>
To: lkp@lists.01.org
Subject: Re: [selftests/bpf] 8dff2c1958: BUG:using_smp_processor_id()in_preemptible
Date: Tue, 31 Aug 2021 04:45:49 +0000
Message-ID: <59223446-251F-41A4-87ED-A37A181262CC@fb.com>
In-Reply-To: <20210831013015.GA4286@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============4910109701518700164==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> On Aug 30, 2021, at 6:30 PM, kernel test robot <oliver.sang@intel.com> =
wrote:
> =

> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 8dff2c1958c234e90dff289a2034217b293985e4 ("[PATCH bpf-next 3/3] s=
elftests/bpf: add test for bpf_get_branch_trace")
> url: https://github.com/0day-ci/linux/commits/Song-Liu/bpf-introduce-bpf_=
get_branch_trace/20210824-140315
> base: https://git.kernel.org/cgit/linux/kernel/git/bpf/bpf-next.git master
> =

> in testcase: kernel-selftests
> version: kernel-selftests-x86_64-ebaa603b-1_20210825
> with following parameters:
> =

> 	group: bpf
> 	ucode: 0xde
> =

> test-description: The kernel contains a set of "self tests" under the too=
ls/testing/selftests/ directory. These are intended to be small unit tests =
to exercise individual code paths in the kernel.
> test-url: https://www.kernel.org/doc/Documentation/kselftest.txt
> =

> =

> on test machine: 4 threads 1 sockets Intel(R) Core(TM) i7-7567U CPU @ 3.5=
0GHz with 32G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> =

> kern  :err   : [  136.592584] BUG: using smp_processor_id() in preemptibl=
e [00000000] code: test_progs/5262

hmm... I guess we need to move the call to after migrate_disable(). =



> kern :warn : [  136.593280] caller is intel_pmu_snapshot_branch_stack (ar=
ch/x86/events/intel/lbr.c:1868) =

> kern  :warn  : [  136.593811] CPU: 1 PID: 5262 Comm: test_progs Tainted: =
G        W  OE     5.14.0-rc5-01207-g8dff2c1958c2 #1
> kern  :warn  : [  136.594609] Hardware name: Intel Corporation NUC7i7BNH/=
NUC7i7BNB, BIOS BNKBL357.86A.0067.2018.0814.1500 08/14/2018
> kern  :warn  : [  136.595501] Call Trace:
> kern :warn : [  136.595776] dump_stack_lvl (lib/dump_stack.c:106) =

> kern :warn : [  136.596136] check_preemption_disabled (lib/smp_processor_=
id.c:49) =

> kern :warn : [  136.596565] intel_pmu_snapshot_branch_stack (arch/x86/eve=
nts/intel/lbr.c:1868) =

> kern :warn : [  136.597024] __bpf_prog_enter (kernel/bpf/trampoline.c:577=
) =

> kern :warn : [  136.597434] bpf_trampoline_6442562768_0+0x3b/0x1000 =

> kern :warn : [  136.597968] bpf_fexit_loop_test1 (net/bpf/test_run.c:236) =

> kern :warn : [  136.598331] bpf_prog_test_run_tracing (net/bpf/test_run.c=
:308) =

> kern :warn : [  136.598832] __sys_bpf (kernel/bpf/syscall.c:3307 kernel/b=
pf/syscall.c:4605) =

> kern :warn : [  136.599172] ? __sys_bpf (kernel/bpf/syscall.c:4629) =

> kern :warn : [  136.599575] __x64_sys_bpf (kernel/bpf/syscall.c:4689) =

> kern :warn : [  136.599962] do_syscall_64 (arch/x86/entry/common.c:50 arc=
h/x86/entry/common.c:80) =

> kern :warn : [  136.600293] ? lockdep_hardirqs_on (kernel/locking/lockdep=
.c:4344) =

> kern :warn : [  136.600711] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.601122] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.601481] ? lockdep_hardirqs_on (kernel/locking/lockdep=
.c:4344) =

> kern :warn : [  136.601880] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.602239] ? lockdep_hardirqs_on (kernel/locking/lockdep=
.c:4344) =

> kern :warn : [  136.602639] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.603034] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.603403] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.603740] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.604111] ? asm_sysvec_apic_timer_interrupt (arch/x86/i=
nclude/asm/idtentry.h:638) =

> kern :warn : [  136.604560] ? asm_sysvec_apic_timer_interrupt (arch/x86/i=
nclude/asm/idtentry.h:638) =

> kern :warn : [  136.605018] ? lockdep_hardirqs_on (kernel/locking/lockdep=
.c:4344) =

> kern :warn : [  136.605455] entry_SYSCALL_64_after_hwframe (arch/x86/entr=
y/entry_64.S:113) =

> kern  :warn  : [  136.605903] RIP: 0033:0x7f0fcbd69f59
> kern :warn : [ 136.606268] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1=
f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 2=
4 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 07 6f 0c 00 f7 d8 64 89 01=
 48
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>   0:	00 c3                	add    %al,%bl
>   2:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
>   9:	00 00 00 =

>   c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
>  11:	48 89 f8             	mov    %rdi,%rax
>  14:	48 89 f7             	mov    %rsi,%rdi
>  17:	48 89 d6             	mov    %rdx,%rsi
>  1a:	48 89 ca             	mov    %rcx,%rdx
>  1d:	4d 89 c2             	mov    %r8,%r10
>  20:	4d 89 c8             	mov    %r9,%r8
>  23:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
>  28:	0f 05                	syscall =

>  2a:*	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax		<-- trapping=
 instruction
>  30:	73 01                	jae    0x33
>  32:	c3                   	retq   =

>  33:	48 8b 0d 07 6f 0c 00 	mov    0xc6f07(%rip),%rcx        # 0xc6f41
>  3a:	f7 d8                	neg    %eax
>  3c:	64 89 01             	mov    %eax,%fs:(%rcx)
>  3f:	48                   	rex.W
> =

> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   0:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
>   6:	73 01                	jae    0x9
>   8:	c3                   	retq   =

>   9:	48 8b 0d 07 6f 0c 00 	mov    0xc6f07(%rip),%rcx        # 0xc6f17
>  10:	f7 d8                	neg    %eax
>  12:	64 89 01             	mov    %eax,%fs:(%rcx)
>  15:	48                   	rex.W
> kern  :warn  : [  136.607706] RSP: 002b:00007ffd572256a8 EFLAGS: 00000202=
 ORIG_RAX: 0000000000000141
> kern  :warn  : [  136.608350] RAX: ffffffffffffffda RBX: 0000000000000000=
 RCX: 00007f0fcbd69f59
> kern  :warn  : [  136.609058] RDX: 0000000000000080 RSI: 00007ffd57225700=
 RDI: 000000000000000a
> kern  :warn  : [  136.609656] RBP: 00007ffd572256c0 R08: 0000000000000000=
 R09: 00007ffd57225700
> kern  :warn  : [  136.610260] R10: 0000000000000000 R11: 0000000000000202=
 R12: 0000562a6e61ddb0
> kern  :warn  : [  136.610920] R13: 00007ffd57225a20 R14: 0000000000000000=
 R15: 0000000000000000
> kern  :err   : [  136.611581] BUG: using smp_processor_id() in preemptibl=
e [00000000] code: test_progs/5262
> kern :warn : [  136.612259] caller is intel_pmu_lbr_disable_all (arch/x86=
/events/intel/lbr.c:780) =

> kern  :warn  : [  136.612817] CPU: 1 PID: 5262 Comm: test_progs Tainted: =
G        W  OE     5.14.0-rc5-01207-g8dff2c1958c2 #1
> kern  :warn  : [  136.613653] Hardware name: Intel Corporation NUC7i7BNH/=
NUC7i7BNB, BIOS BNKBL357.86A.0067.2018.0814.1500 08/14/2018
> kern  :warn  : [  136.614642] Call Trace:
> kern :warn : [  136.614904] dump_stack_lvl (lib/dump_stack.c:106) =

> kern :warn : [  136.615293] check_preemption_disabled (lib/smp_processor_=
id.c:49) =

> kern :warn : [  136.615759] intel_pmu_lbr_disable_all (arch/x86/events/in=
tel/lbr.c:780) =

> kern :warn : [  136.616221] intel_pmu_snapshot_branch_stack (arch/x86/eve=
nts/intel/lbr.c:1871) =

> kern :warn : [  136.616705] __bpf_prog_enter (kernel/bpf/trampoline.c:577=
) =

> kern :warn : [  136.617068] bpf_trampoline_6442562768_0+0x3b/0x1000 =

> kern :warn : [  136.617528] bpf_fexit_loop_test1 (net/bpf/test_run.c:236) =

> kern :warn : [  136.617923] bpf_prog_test_run_tracing (net/bpf/test_run.c=
:308) =

> kern :warn : [  136.618367] __sys_bpf (kernel/bpf/syscall.c:3307 kernel/b=
pf/syscall.c:4605) =

> kern :warn : [  136.618692] ? __sys_bpf (kernel/bpf/syscall.c:4629) =

> kern :warn : [  136.619054] __x64_sys_bpf (kernel/bpf/syscall.c:4689) =

> kern :warn : [  136.619418] do_syscall_64 (arch/x86/entry/common.c:50 arc=
h/x86/entry/common.c:80) =

> kern :warn : [  136.619819] ? lockdep_hardirqs_on (kernel/locking/lockdep=
.c:4344) =

> kern :warn : [  136.620237] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.620581] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.620976] ? lockdep_hardirqs_on (kernel/locking/lockdep=
.c:4344) =

> kern :warn : [  136.621354] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.621695] ? lockdep_hardirqs_on (kernel/locking/lockdep=
.c:4344) =

> kern :warn : [  136.622150] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.622491] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.622849] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.623262] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.623605] ? asm_sysvec_apic_timer_interrupt (arch/x86/i=
nclude/asm/idtentry.h:638) =

> kern :warn : [  136.624072] ? asm_sysvec_apic_timer_interrupt (arch/x86/i=
nclude/asm/idtentry.h:638) =

> kern :warn : [  136.624531] ? lockdep_hardirqs_on (kernel/locking/lockdep=
.c:4344) =

> kern :warn : [  136.624930] entry_SYSCALL_64_after_hwframe (arch/x86/entr=
y/entry_64.S:113) =

> kern  :warn  : [  136.625417] RIP: 0033:0x7f0fcbd69f59
> kern :warn : [ 136.625835] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1=
f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 2=
4 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 07 6f 0c 00 f7 d8 64 89 01=
 48
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>   0:	00 c3                	add    %al,%bl
>   2:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
>   9:	00 00 00 =

>   c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
>  11:	48 89 f8             	mov    %rdi,%rax
>  14:	48 89 f7             	mov    %rsi,%rdi
>  17:	48 89 d6             	mov    %rdx,%rsi
>  1a:	48 89 ca             	mov    %rcx,%rdx
>  1d:	4d 89 c2             	mov    %r8,%r10
>  20:	4d 89 c8             	mov    %r9,%r8
>  23:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
>  28:	0f 05                	syscall =

>  2a:*	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax		<-- trapping=
 instruction
>  30:	73 01                	jae    0x33
>  32:	c3                   	retq   =

>  33:	48 8b 0d 07 6f 0c 00 	mov    0xc6f07(%rip),%rcx        # 0xc6f41
>  3a:	f7 d8                	neg    %eax
>  3c:	64 89 01             	mov    %eax,%fs:(%rcx)
>  3f:	48                   	rex.W
> =

> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   0:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
>   6:	73 01                	jae    0x9
>   8:	c3                   	retq   =

>   9:	48 8b 0d 07 6f 0c 00 	mov    0xc6f07(%rip),%rcx        # 0xc6f17
>  10:	f7 d8                	neg    %eax
>  12:	64 89 01             	mov    %eax,%fs:(%rcx)
>  15:	48                   	rex.W
> kern  :warn  : [  136.627326] RSP: 002b:00007ffd572256a8 EFLAGS: 00000202=
 ORIG_RAX: 0000000000000141
> kern  :warn  : [  136.628018] RAX: ffffffffffffffda RBX: 0000000000000000=
 RCX: 00007f0fcbd69f59
> kern  :warn  : [  136.628623] RDX: 0000000000000080 RSI: 00007ffd57225700=
 RDI: 000000000000000a
> kern  :warn  : [  136.629262] RBP: 00007ffd572256c0 R08: 0000000000000000=
 R09: 00007ffd57225700
> kern  :warn  : [  136.629847] R10: 0000000000000000 R11: 0000000000000202=
 R12: 0000562a6e61ddb0
> kern  :warn  : [  136.630469] R13: 00007ffd57225a20 R14: 0000000000000000=
 R15: 0000000000000000
> kern  :err   : [  136.631171] BUG: using smp_processor_id() in preemptibl=
e [00000000] code: test_progs/5262
> kern :warn : [  136.631873] caller is intel_pmu_lbr_disable_all (arch/x86=
/events/intel/lbr.c:764 arch/x86/events/intel/lbr.c:782 arch/x86/events/int=
el/lbr.c:778) =

> kern  :warn  : [  136.632412] CPU: 1 PID: 5262 Comm: test_progs Tainted: =
G        W  OE     5.14.0-rc5-01207-g8dff2c1958c2 #1
> kern  :warn  : [  136.633255] Hardware name: Intel Corporation NUC7i7BNH/=
NUC7i7BNB, BIOS BNKBL357.86A.0067.2018.0814.1500 08/14/2018
> kern  :warn  : [  136.634100] Call Trace:
> kern :warn : [  136.634348] dump_stack_lvl (lib/dump_stack.c:106) =

> kern :warn : [  136.634741] check_preemption_disabled (lib/smp_processor_=
id.c:49) =

> kern :warn : [  136.635190] intel_pmu_lbr_disable_all (arch/x86/events/in=
tel/lbr.c:764 arch/x86/events/intel/lbr.c:782 arch/x86/events/intel/lbr.c:7=
78) =

> kern :warn : [  136.635611] intel_pmu_snapshot_branch_stack (arch/x86/eve=
nts/intel/lbr.c:1871) =

> kern :warn : [  136.636065] __bpf_prog_enter (kernel/bpf/trampoline.c:577=
) =

> kern :warn : [  136.636466] bpf_trampoline_6442562768_0+0x3b/0x1000 =

> kern :warn : [  136.636981] bpf_fexit_loop_test1 (net/bpf/test_run.c:236) =

> kern :warn : [  136.637347] bpf_prog_test_run_tracing (net/bpf/test_run.c=
:308) =

> kern :warn : [  136.637863] __sys_bpf (kernel/bpf/syscall.c:3307 kernel/b=
pf/syscall.c:4605) =

> kern :warn : [  136.638206] ? __sys_bpf (kernel/bpf/syscall.c:4629) =

> kern :warn : [  136.638582] __x64_sys_bpf (kernel/bpf/syscall.c:4689) =

> kern :warn : [  136.638944] do_syscall_64 (arch/x86/entry/common.c:50 arc=
h/x86/entry/common.c:80) =

> kern :warn : [  136.639273] ? lockdep_hardirqs_on (kernel/locking/lockdep=
.c:4344) =

> kern :warn : [  136.639656] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.640054] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.640412] ? lockdep_hardirqs_on (kernel/locking/lockdep=
.c:4344) =

> kern :warn : [  136.640810] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.641169] ? lockdep_hardirqs_on (kernel/locking/lockdep=
.c:4344) =

> kern :warn : [  136.641568] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.641963] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.642343] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.642718] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.643075] ? asm_sysvec_apic_timer_interrupt (arch/x86/i=
nclude/asm/idtentry.h:638) =

> kern :warn : [  136.643575] ? asm_sysvec_apic_timer_interrupt (arch/x86/i=
nclude/asm/idtentry.h:638) =

> kern :warn : [  136.644033] ? lockdep_hardirqs_on (kernel/locking/lockdep=
.c:4344) =

> kern :warn : [  136.644437] entry_SYSCALL_64_after_hwframe (arch/x86/entr=
y/entry_64.S:113) =

> kern  :warn  : [  136.644884] RIP: 0033:0x7f0fcbd69f59
> kern :warn : [ 136.645231] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1=
f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 2=
4 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 07 6f 0c 00 f7 d8 64 89 01=
 48
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>   0:	00 c3                	add    %al,%bl
>   2:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
>   9:	00 00 00 =

>   c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
>  11:	48 89 f8             	mov    %rdi,%rax
>  14:	48 89 f7             	mov    %rsi,%rdi
>  17:	48 89 d6             	mov    %rdx,%rsi
>  1a:	48 89 ca             	mov    %rcx,%rdx
>  1d:	4d 89 c2             	mov    %r8,%r10
>  20:	4d 89 c8             	mov    %r9,%r8
>  23:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
>  28:	0f 05                	syscall =

>  2a:*	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax		<-- trapping=
 instruction
>  30:	73 01                	jae    0x33
>  32:	c3                   	retq   =

>  33:	48 8b 0d 07 6f 0c 00 	mov    0xc6f07(%rip),%rcx        # 0xc6f41
>  3a:	f7 d8                	neg    %eax
>  3c:	64 89 01             	mov    %eax,%fs:(%rcx)
>  3f:	48                   	rex.W
> =

> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   0:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
>   6:	73 01                	jae    0x9
>   8:	c3                   	retq   =

>   9:	48 8b 0d 07 6f 0c 00 	mov    0xc6f07(%rip),%rcx        # 0xc6f17
>  10:	f7 d8                	neg    %eax
>  12:	64 89 01             	mov    %eax,%fs:(%rcx)
>  15:	48                   	rex.W
> kern  :warn  : [  136.646685] RSP: 002b:00007ffd572256a8 EFLAGS: 00000202=
 ORIG_RAX: 0000000000000141
> kern  :warn  : [  136.647304] RAX: ffffffffffffffda RBX: 0000000000000000=
 RCX: 00007f0fcbd69f59
> kern  :warn  : [  136.647966] RDX: 0000000000000080 RSI: 00007ffd57225700=
 RDI: 000000000000000a
> kern  :warn  : [  136.648588] RBP: 00007ffd572256c0 R08: 0000000000000000=
 R09: 00007ffd57225700
> kern  :warn  : [  136.649246] R10: 0000000000000000 R11: 0000000000000202=
 R12: 0000562a6e61ddb0
> kern  :warn  : [  136.649869] R13: 00007ffd57225a20 R14: 0000000000000000=
 R15: 0000000000000000
> kern  :err   : [  136.650512] BUG: using smp_processor_id() in preemptibl=
e [00000000] code: test_progs/5262
> kern :warn : [  136.651226] caller is intel_pmu_lbr_read (arch/x86/events=
/intel/lbr.c:1003) =

> kern  :warn  : [  136.651691] CPU: 1 PID: 5262 Comm: test_progs Tainted: =
G        W  OE     5.14.0-rc5-01207-g8dff2c1958c2 #1
> kern  :warn  : [  136.652530] Hardware name: Intel Corporation NUC7i7BNH/=
NUC7i7BNB, BIOS BNKBL357.86A.0067.2018.0814.1500 08/14/2018
> kern  :warn  : [  136.653440] Call Trace:
> kern :warn : [  136.653762] dump_stack_lvl (lib/dump_stack.c:106) =

> kern :warn : [  136.654133] check_preemption_disabled (lib/smp_processor_=
id.c:49) =

> kern :warn : [  136.654603] intel_pmu_lbr_read (arch/x86/events/intel/lbr=
.c:1003) =

> kern :warn : [  136.654966] intel_pmu_snapshot_branch_stack (arch/x86/eve=
nts/intel/lbr.c:1873) =

> kern :warn : [  136.655408] __bpf_prog_enter (kernel/bpf/trampoline.c:577=
) =

> kern :warn : [  136.655754] bpf_trampoline_6442562768_0+0x3b/0x1000 =

> kern :warn : [  136.656180] bpf_fexit_loop_test1 (net/bpf/test_run.c:236) =

> kern :warn : [  136.656562] bpf_prog_test_run_tracing (net/bpf/test_run.c=
:308) =

> kern :warn : [  136.656992] __sys_bpf (kernel/bpf/syscall.c:3307 kernel/b=
pf/syscall.c:4605) =

> kern :warn : [  136.657332] ? __sys_bpf (kernel/bpf/syscall.c:4629) =

> kern :warn : [  136.657695] __x64_sys_bpf (kernel/bpf/syscall.c:4689) =

> kern :warn : [  136.658040] do_syscall_64 (arch/x86/entry/common.c:50 arc=
h/x86/entry/common.c:80) =

> kern :warn : [  136.658422] ? lockdep_hardirqs_on (kernel/locking/lockdep=
.c:4344) =

> kern :warn : [  136.658856] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.659272] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.659613] ? lockdep_hardirqs_on (kernel/locking/lockdep=
.c:4344) =

> kern :warn : [  136.660049] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.660406] ? lockdep_hardirqs_on (kernel/locking/lockdep=
.c:4344) =

> kern :warn : [  136.660805] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.661220] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.661560] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.661919] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.662298] ? asm_sysvec_apic_timer_interrupt (arch/x86/i=
nclude/asm/idtentry.h:638) =

> kern :warn : [  136.662746] ? asm_sysvec_apic_timer_interrupt (arch/x86/i=
nclude/asm/idtentry.h:638) =

> kern :warn : [  136.663205] ? lockdep_hardirqs_on (kernel/locking/lockdep=
.c:4344) =

> kern :warn : [  136.663605] entry_SYSCALL_64_after_hwframe (arch/x86/entr=
y/entry_64.S:113) =

> kern  :warn  : [  136.664051] RIP: 0033:0x7f0fcbd69f59
> kern :warn : [ 136.664383] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1=
f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 2=
4 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 07 6f 0c 00 f7 d8 64 89 01=
 48
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>   0:	00 c3                	add    %al,%bl
>   2:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
>   9:	00 00 00 =

>   c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
>  11:	48 89 f8             	mov    %rdi,%rax
>  14:	48 89 f7             	mov    %rsi,%rdi
>  17:	48 89 d6             	mov    %rdx,%rsi
>  1a:	48 89 ca             	mov    %rcx,%rdx
>  1d:	4d 89 c2             	mov    %r8,%r10
>  20:	4d 89 c8             	mov    %r9,%r8
>  23:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
>  28:	0f 05                	syscall =

>  2a:*	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax		<-- trapping=
 instruction
>  30:	73 01                	jae    0x33
>  32:	c3                   	retq   =

>  33:	48 8b 0d 07 6f 0c 00 	mov    0xc6f07(%rip),%rcx        # 0xc6f41
>  3a:	f7 d8                	neg    %eax
>  3c:	64 89 01             	mov    %eax,%fs:(%rcx)
>  3f:	48                   	rex.W
> =

> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   0:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
>   6:	73 01                	jae    0x9
>   8:	c3                   	retq   =

>   9:	48 8b 0d 07 6f 0c 00 	mov    0xc6f07(%rip),%rcx        # 0xc6f17
>  10:	f7 d8                	neg    %eax
>  12:	64 89 01             	mov    %eax,%fs:(%rcx)
>  15:	48                   	rex.W
> kern  :warn  : [  136.665964] RSP: 002b:00007ffd572256a8 EFLAGS: 00000202=
 ORIG_RAX: 0000000000000141
> kern  :warn  : [  136.666650] RAX: ffffffffffffffda RBX: 0000000000000000=
 RCX: 00007f0fcbd69f59
> kern  :warn  : [  136.667271] RDX: 0000000000000080 RSI: 00007ffd57225700=
 RDI: 000000000000000a
> kern  :warn  : [  136.667893] RBP: 00007ffd572256c0 R08: 0000000000000000=
 R09: 00007ffd57225700
> kern  :warn  : [  136.668517] R10: 0000000000000000 R11: 0000000000000202=
 R12: 0000562a6e61ddb0
> kern  :warn  : [  136.669104] R13: 00007ffd57225a20 R14: 0000000000000000=
 R15: 0000000000000000
> kern  :err   : [  136.669728] BUG: using smp_processor_id() in preemptibl=
e [00000000] code: test_progs/5262
> kern :warn : [  136.670431] caller is intel_pmu_lbr_read (arch/x86/events=
/intel/lbr.c:764 arch/x86/events/intel/lbr.c:1011) =

> kern  :warn  : [  136.670867] CPU: 1 PID: 5262 Comm: test_progs Tainted: =
G        W  OE     5.14.0-rc5-01207-g8dff2c1958c2 #1
> kern  :warn  : [  136.671765] Hardware name: Intel Corporation NUC7i7BNH/=
NUC7i7BNB, BIOS BNKBL357.86A.0067.2018.0814.1500 08/14/2018
> kern  :warn  : [  136.672649] Call Trace:
> kern :warn : [  136.672912] dump_stack_lvl (lib/dump_stack.c:106) =

> kern :warn : [  136.673301] check_preemption_disabled (lib/smp_processor_=
id.c:49) =

> kern :warn : [  136.673765] intel_pmu_lbr_read (arch/x86/events/intel/lbr=
.c:764 arch/x86/events/intel/lbr.c:1011) =

> kern :warn : [  136.674149] intel_pmu_snapshot_branch_stack (arch/x86/eve=
nts/intel/lbr.c:1873) =

> kern :warn : [  136.674604] __bpf_prog_enter (kernel/bpf/trampoline.c:577=
) =

> kern :warn : [  136.674968] bpf_trampoline_6442562768_0+0x3b/0x1000 =

> kern :warn : [  136.675448] bpf_fexit_loop_test1 (net/bpf/test_run.c:236) =

> kern :warn : [  136.675865] bpf_prog_test_run_tracing (net/bpf/test_run.c=
:308) =

> kern :warn : [  136.676331] __sys_bpf (kernel/bpf/syscall.c:3307 kernel/b=
pf/syscall.c:4605) =

> kern :warn : [  136.676672] ? __sys_bpf (kernel/bpf/syscall.c:4629) =

> kern :warn : [  136.677067] __x64_sys_bpf (kernel/bpf/syscall.c:4689) =

> kern :warn : [  136.677413] do_syscall_64 (arch/x86/entry/common.c:50 arc=
h/x86/entry/common.c:80) =

> kern :warn : [  136.677799] ? lockdep_hardirqs_on (kernel/locking/lockdep=
.c:4344) =

> kern :warn : [  136.678234] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.678597] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.678991] ? lockdep_hardirqs_on (kernel/locking/lockdep=
.c:4344) =

> kern :warn : [  136.679388] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.679747] ? lockdep_hardirqs_on (kernel/locking/lockdep=
.c:4344) =

> kern :warn : [  136.680146] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.680505] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.680863] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.681240] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.681582] ? asm_sysvec_apic_timer_interrupt (arch/x86/i=
nclude/asm/idtentry.h:638) =

> kern :warn : [  136.682043] ? asm_sysvec_apic_timer_interrupt (arch/x86/i=
nclude/asm/idtentry.h:638) =

> kern :warn : [  136.682503] ? lockdep_hardirqs_on (kernel/locking/lockdep=
.c:4344) =

> kern :warn : [  136.682903] entry_SYSCALL_64_after_hwframe (arch/x86/entr=
y/entry_64.S:113) =

> kern  :warn  : [  136.683388] RIP: 0033:0x7f0fcbd69f59
> kern :warn : [ 136.683771] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1=
f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 2=
4 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 07 6f 0c 00 f7 d8 64 89 01=
 48
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>   0:	00 c3                	add    %al,%bl
>   2:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
>   9:	00 00 00 =

>   c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
>  11:	48 89 f8             	mov    %rdi,%rax
>  14:	48 89 f7             	mov    %rsi,%rdi
>  17:	48 89 d6             	mov    %rdx,%rsi
>  1a:	48 89 ca             	mov    %rcx,%rdx
>  1d:	4d 89 c2             	mov    %r8,%r10
>  20:	4d 89 c8             	mov    %r9,%r8
>  23:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
>  28:	0f 05                	syscall =

>  2a:*	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax		<-- trapping=
 instruction
>  30:	73 01                	jae    0x33
>  32:	c3                   	retq   =

>  33:	48 8b 0d 07 6f 0c 00 	mov    0xc6f07(%rip),%rcx        # 0xc6f41
>  3a:	f7 d8                	neg    %eax
>  3c:	64 89 01             	mov    %eax,%fs:(%rcx)
>  3f:	48                   	rex.W
> =

> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   0:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
>   6:	73 01                	jae    0x9
>   8:	c3                   	retq   =

>   9:	48 8b 0d 07 6f 0c 00 	mov    0xc6f07(%rip),%rcx        # 0xc6f17
>  10:	f7 d8                	neg    %eax
>  12:	64 89 01             	mov    %eax,%fs:(%rcx)
>  15:	48                   	rex.W
> kern  :warn  : [  136.685257] RSP: 002b:00007ffd572256a8 EFLAGS: 00000202=
 ORIG_RAX: 0000000000000141
> kern  :warn  : [  136.685878] RAX: ffffffffffffffda RBX: 0000000000000000=
 RCX: 00007f0fcbd69f59
> kern  :warn  : [  136.686512] RDX: 0000000000000080 RSI: 00007ffd57225700=
 RDI: 000000000000000a
> kern  :warn  : [  136.687152] RBP: 00007ffd572256c0 R08: 0000000000000000=
 R09: 00007ffd57225700
> kern  :warn  : [  136.687739] R10: 0000000000000000 R11: 0000000000000202=
 R12: 0000562a6e61ddb0
> kern  :warn  : [  136.688399] R13: 00007ffd57225a20 R14: 0000000000000000=
 R15: 0000000000000000
> kern  :err   : [  136.689060] BUG: using smp_processor_id() in preemptibl=
e [00000000] code: test_progs/5262
> kern :warn : [  136.689760] caller is intel_pmu_snapshot_branch_stack (ar=
ch/x86/events/intel/lbr.c:1872) =

> kern  :warn  : [  136.690329] CPU: 1 PID: 5262 Comm: test_progs Tainted: =
G        W  OE     5.14.0-rc5-01207-g8dff2c1958c2 #1
> kern  :warn  : [  136.691130] Hardware name: Intel Corporation NUC7i7BNH/=
NUC7i7BNB, BIOS BNKBL357.86A.0067.2018.0814.1500 08/14/2018
> kern  :warn  : [  136.691976] Call Trace:
> kern :warn : [  136.692257] dump_stack_lvl (lib/dump_stack.c:106) =

> kern :warn : [  136.692645] check_preemption_disabled (lib/smp_processor_=
id.c:49) =

> kern :warn : [  136.693130] intel_pmu_snapshot_branch_stack (arch/x86/eve=
nts/intel/lbr.c:1872) =

> kern :warn : [  136.693629] __bpf_prog_enter (kernel/bpf/trampoline.c:577=
) =

> kern :warn : [  136.694029] bpf_trampoline_6442562768_0+0x3b/0x1000 =

> kern :warn : [  136.694472] bpf_fexit_loop_test1 (net/bpf/test_run.c:236) =

> kern :warn : [  136.694889] bpf_prog_test_run_tracing (net/bpf/test_run.c=
:308) =

> kern :warn : [  136.695319] __sys_bpf (kernel/bpf/syscall.c:3307 kernel/b=
pf/syscall.c:4605) =

> kern :warn : [  136.695693] ? __sys_bpf (kernel/bpf/syscall.c:4629) =

> kern :warn : [  136.696090] __x64_sys_bpf (kernel/bpf/syscall.c:4689) =

> kern :warn : [  136.696436] do_syscall_64 (arch/x86/entry/common.c:50 arc=
h/x86/entry/common.c:80) =

> kern :warn : [  136.696782] ? lockdep_hardirqs_on (kernel/locking/lockdep=
.c:4344) =

> kern :warn : [  136.697181] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.697543] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.697937] ? lockdep_hardirqs_on (kernel/locking/lockdep=
.c:4344) =

> kern :warn : [  136.698368] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.698762] ? lockdep_hardirqs_on (kernel/locking/lockdep=
.c:4344) =

> kern :warn : [  136.699161] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.699556] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.699914] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.700291] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.700667] ? asm_sysvec_apic_timer_interrupt (arch/x86/i=
nclude/asm/idtentry.h:638) =

> kern :warn : [  136.701133] ? asm_sysvec_apic_timer_interrupt (arch/x86/i=
nclude/asm/idtentry.h:638) =

> kern :warn : [  136.701629] ? lockdep_hardirqs_on (kernel/locking/lockdep=
.c:4344) =

> kern :warn : [  136.702029] entry_SYSCALL_64_after_hwframe (arch/x86/entr=
y/entry_64.S:113) =

> kern  :warn  : [  136.702478] RIP: 0033:0x7f0fcbd69f59
> kern :warn : [ 136.702824] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1=
f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 2=
4 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 07 6f 0c 00 f7 d8 64 89 01=
 48
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>   0:	00 c3                	add    %al,%bl
>   2:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
>   9:	00 00 00 =

>   c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
>  11:	48 89 f8             	mov    %rdi,%rax
>  14:	48 89 f7             	mov    %rsi,%rdi
>  17:	48 89 d6             	mov    %rdx,%rsi
>  1a:	48 89 ca             	mov    %rcx,%rdx
>  1d:	4d 89 c2             	mov    %r8,%r10
>  20:	4d 89 c8             	mov    %r9,%r8
>  23:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
>  28:	0f 05                	syscall =

>  2a:*	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax		<-- trapping=
 instruction
>  30:	73 01                	jae    0x33
>  32:	c3                   	retq   =

>  33:	48 8b 0d 07 6f 0c 00 	mov    0xc6f07(%rip),%rcx        # 0xc6f41
>  3a:	f7 d8                	neg    %eax
>  3c:	64 89 01             	mov    %eax,%fs:(%rcx)
>  3f:	48                   	rex.W
> =

> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   0:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
>   6:	73 01                	jae    0x9
>   8:	c3                   	retq   =

>   9:	48 8b 0d 07 6f 0c 00 	mov    0xc6f07(%rip),%rcx        # 0xc6f17
>  10:	f7 d8                	neg    %eax
>  12:	64 89 01             	mov    %eax,%fs:(%rcx)
>  15:	48                   	rex.W
> kern  :warn  : [  136.704386] RSP: 002b:00007ffd572256a8 EFLAGS: 00000202=
 ORIG_RAX: 0000000000000141
> kern  :warn  : [  136.705038] RAX: ffffffffffffffda RBX: 0000000000000000=
 RCX: 00007f0fcbd69f59
> kern  :warn  : [  136.705625] RDX: 0000000000000080 RSI: 00007ffd57225700=
 RDI: 000000000000000a
> kern  :warn  : [  136.706267] RBP: 00007ffd572256c0 R08: 0000000000000000=
 R09: 00007ffd57225700
> kern  :warn  : [  136.706836] R10: 0000000000000000 R11: 0000000000000202=
 R12: 0000562a6e61ddb0
> kern  :warn  : [  136.707496] R13: 00007ffd57225a20 R14: 0000000000000000=
 R15: 0000000000000000
> kern  :err   : [  136.708104] BUG: using smp_processor_id() in preemptibl=
e [00000000] code: test_progs/5262
> kern :warn : [  136.708822] caller is intel_pmu_snapshot_branch_stack (ar=
ch/x86/events/intel/lbr.c:1875) =

> kern  :warn  : [  136.709398] CPU: 1 PID: 5262 Comm: test_progs Tainted: =
G        W  OE     5.14.0-rc5-01207-g8dff2c1958c2 #1
> kern  :warn  : [  136.710237] Hardware name: Intel Corporation NUC7i7BNH/=
NUC7i7BNB, BIOS BNKBL357.86A.0067.2018.0814.1500 08/14/2018
> kern  :warn  : [  136.711142] Call Trace:
> kern :warn : [  136.711429] dump_stack_lvl (lib/dump_stack.c:106) =

> kern :warn : [  136.711838] check_preemption_disabled (lib/smp_processor_=
id.c:49) =

> kern :warn : [  136.712273] intel_pmu_snapshot_branch_stack (arch/x86/eve=
nts/intel/lbr.c:1875) =

> kern :warn : [  136.712764] __bpf_prog_enter (kernel/bpf/trampoline.c:577=
) =

> kern :warn : [  136.713127] bpf_trampoline_6442562768_0+0x3b/0x1000 =

> kern :warn : [  136.713572] bpf_fexit_loop_test1 (net/bpf/test_run.c:236) =

> kern :warn : [  136.713953] bpf_prog_test_run_tracing (net/bpf/test_run.c=
:308) =

> kern :warn : [  136.714418] __sys_bpf (kernel/bpf/syscall.c:3307 kernel/b=
pf/syscall.c:4605) =

> kern :warn : [  136.714794] ? __sys_bpf (kernel/bpf/syscall.c:4629) =

> kern :warn : [  136.715214] __x64_sys_bpf (kernel/bpf/syscall.c:4689) =

> kern :warn : [  136.715539] do_syscall_64 (arch/x86/entry/common.c:50 arc=
h/x86/entry/common.c:80) =

> kern :warn : [  136.715887] ? lockdep_hardirqs_on (kernel/locking/lockdep=
.c:4344) =

> kern :warn : [  136.716307] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.716651] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.717008] ? lockdep_hardirqs_on (kernel/locking/lockdep=
.c:4344) =

> kern :warn : [  136.717407] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.717766] ? lockdep_hardirqs_on (kernel/locking/lockdep=
.c:4344) =

> kern :warn : [  136.718179] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.718549] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.718906] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.719264] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.719623] ? asm_sysvec_apic_timer_interrupt (arch/x86/i=
nclude/asm/idtentry.h:638) =

> kern :warn : [  136.720089] ? asm_sysvec_apic_timer_interrupt (arch/x86/i=
nclude/asm/idtentry.h:638) =

> kern :warn : [  136.720585] ? lockdep_hardirqs_on (kernel/locking/lockdep=
.c:4344) =

> kern :warn : [  136.721058] entry_SYSCALL_64_after_hwframe (arch/x86/entr=
y/entry_64.S:113) =

> kern  :warn  : [  136.721489] RIP: 0033:0x7f0fcbd69f59
> kern :warn : [ 136.721854] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1=
f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 2=
4 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 07 6f 0c 00 f7 d8 64 89 01=
 48
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>   0:	00 c3                	add    %al,%bl
>   2:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
>   9:	00 00 00 =

>   c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
>  11:	48 89 f8             	mov    %rdi,%rax
>  14:	48 89 f7             	mov    %rsi,%rdi
>  17:	48 89 d6             	mov    %rdx,%rsi
>  1a:	48 89 ca             	mov    %rcx,%rdx
>  1d:	4d 89 c2             	mov    %r8,%r10
>  20:	4d 89 c8             	mov    %r9,%r8
>  23:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
>  28:	0f 05                	syscall =

>  2a:*	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax		<-- trapping=
 instruction
>  30:	73 01                	jae    0x33
>  32:	c3                   	retq   =

>  33:	48 8b 0d 07 6f 0c 00 	mov    0xc6f07(%rip),%rcx        # 0xc6f41
>  3a:	f7 d8                	neg    %eax
>  3c:	64 89 01             	mov    %eax,%fs:(%rcx)
>  3f:	48                   	rex.W
> =

> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   0:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
>   6:	73 01                	jae    0x9
>   8:	c3                   	retq   =

>   9:	48 8b 0d 07 6f 0c 00 	mov    0xc6f07(%rip),%rcx        # 0xc6f17
>  10:	f7 d8                	neg    %eax
>  12:	64 89 01             	mov    %eax,%fs:(%rcx)
>  15:	48                   	rex.W
> kern  :warn  : [  136.723348] RSP: 002b:00007ffd572256a8 EFLAGS: 00000202=
 ORIG_RAX: 0000000000000141
> kern  :warn  : [  136.724036] RAX: ffffffffffffffda RBX: 0000000000000000=
 RCX: 00007f0fcbd69f59
> kern  :warn  : [  136.724625] RDX: 0000000000000080 RSI: 00007ffd57225700=
 RDI: 000000000000000a
> kern  :warn  : [  136.725212] RBP: 00007ffd572256c0 R08: 0000000000000000=
 R09: 00007ffd57225700
> kern  :warn  : [  136.725798] R10: 0000000000000000 R11: 0000000000000202=
 R12: 0000562a6e61ddb0
> kern  :warn  : [  136.726457] R13: 00007ffd57225a20 R14: 0000000000000000=
 R15: 0000000000000000
> kern  :err   : [  136.727118] BUG: using smp_processor_id() in preemptibl=
e [00000000] code: test_progs/5262
> kern :warn : [  136.727822] caller is intel_pmu_lbr_enable_all (arch/x86/=
events/intel/lbr.c:772) =

> kern  :warn  : [  136.728317] CPU: 1 PID: 5262 Comm: test_progs Tainted: =
G        W  OE     5.14.0-rc5-01207-g8dff2c1958c2 #1
> kern  :warn  : [  136.729158] Hardware name: Intel Corporation NUC7i7BNH/=
NUC7i7BNB, BIOS BNKBL357.86A.0067.2018.0814.1500 08/14/2018
> kern  :warn  : [  136.730037] Call Trace:
> kern :warn : [  136.730301] dump_stack_lvl (lib/dump_stack.c:106) =

> kern :warn : [  136.730671] check_preemption_disabled (lib/smp_processor_=
id.c:49) =

> kern :warn : [  136.731121] intel_pmu_lbr_enable_all (arch/x86/events/int=
el/lbr.c:772) =

> kern :warn : [  136.731586] __bpf_prog_enter (kernel/bpf/trampoline.c:577=
) =

> kern :warn : [  136.731987] bpf_trampoline_6442562768_0+0x3b/0x1000 =

> kern :warn : [  136.732467] bpf_fexit_loop_test1 (net/bpf/test_run.c:236) =

> kern :warn : [  136.732884] bpf_prog_test_run_tracing (net/bpf/test_run.c=
:308) =

> kern :warn : [  136.733335] __sys_bpf (kernel/bpf/syscall.c:3307 kernel/b=
pf/syscall.c:4605) =

> kern :warn : [  136.733656] ? __sys_bpf (kernel/bpf/syscall.c:4629) =

> kern :warn : [  136.734076] __x64_sys_bpf (kernel/bpf/syscall.c:4689) =

> kern :warn : [  136.734401] do_syscall_64 (arch/x86/entry/common.c:50 arc=
h/x86/entry/common.c:80) =

> kern :warn : [  136.734750] ? lockdep_hardirqs_on (kernel/locking/lockdep=
.c:4344) =

> kern :warn : [  136.735204] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.735549] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.735906] ? lockdep_hardirqs_on (kernel/locking/lockdep=
.c:4344) =

> kern :warn : [  136.736306] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.736665] ? lockdep_hardirqs_on (kernel/locking/lockdep=
.c:4344) =

> kern :warn : [  136.737077] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.737416] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.737847] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.738204] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.738581] ? asm_sysvec_apic_timer_interrupt (arch/x86/i=
nclude/asm/idtentry.h:638) =

> kern :warn : [  136.739031] ? asm_sysvec_apic_timer_interrupt (arch/x86/i=
nclude/asm/idtentry.h:638) =

> kern :warn : [  136.739490] ? lockdep_hardirqs_on (kernel/locking/lockdep=
.c:4344) =

> kern :warn : [  136.739921] entry_SYSCALL_64_after_hwframe (arch/x86/entr=
y/entry_64.S:113) =

> kern  :warn  : [  136.740400] RIP: 0033:0x7f0fcbd69f59
> kern :warn : [ 136.740784] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1=
f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 2=
4 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 07 6f 0c 00 f7 d8 64 89 01=
 48
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>   0:	00 c3                	add    %al,%bl
>   2:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
>   9:	00 00 00 =

>   c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
>  11:	48 89 f8             	mov    %rdi,%rax
>  14:	48 89 f7             	mov    %rsi,%rdi
>  17:	48 89 d6             	mov    %rdx,%rsi
>  1a:	48 89 ca             	mov    %rcx,%rdx
>  1d:	4d 89 c2             	mov    %r8,%r10
>  20:	4d 89 c8             	mov    %r9,%r8
>  23:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
>  28:	0f 05                	syscall =

>  2a:*	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax		<-- trapping=
 instruction
>  30:	73 01                	jae    0x33
>  32:	c3                   	retq   =

>  33:	48 8b 0d 07 6f 0c 00 	mov    0xc6f07(%rip),%rcx        # 0xc6f41
>  3a:	f7 d8                	neg    %eax
>  3c:	64 89 01             	mov    %eax,%fs:(%rcx)
>  3f:	48                   	rex.W
> =

> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   0:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
>   6:	73 01                	jae    0x9
>   8:	c3                   	retq   =

>   9:	48 8b 0d 07 6f 0c 00 	mov    0xc6f07(%rip),%rcx        # 0xc6f17
>  10:	f7 d8                	neg    %eax
>  12:	64 89 01             	mov    %eax,%fs:(%rcx)
>  15:	48                   	rex.W
> kern  :warn  : [  136.742236] RSP: 002b:00007ffd572256a8 EFLAGS: 00000202=
 ORIG_RAX: 0000000000000141
> kern  :warn  : [  136.742870] RAX: ffffffffffffffda RBX: 0000000000000000=
 RCX: 00007f0fcbd69f59
> kern  :warn  : [  136.743514] RDX: 0000000000000080 RSI: 00007ffd57225700=
 RDI: 000000000000000a
> kern  :warn  : [  136.744099] RBP: 00007ffd572256c0 R08: 0000000000000000=
 R09: 00007ffd57225700
> kern  :warn  : [  136.744723] R10: 0000000000000000 R11: 0000000000000202=
 R12: 0000562a6e61ddb0
> kern  :warn  : [  136.745328] R13: 00007ffd57225a20 R14: 0000000000000000=
 R15: 0000000000000000
> kern  :err   : [  136.746006] BUG: using smp_processor_id() in preemptibl=
e [00000000] code: test_progs/5262
> kern :warn : [  136.746743] caller is intel_pmu_lbr_enable_all (arch/x86/=
events/intel/lbr.c:764 arch/x86/events/intel/lbr.c:774 arch/x86/events/inte=
l/lbr.c:770) =

> kern  :warn  : [  136.747218] CPU: 1 PID: 5262 Comm: test_progs Tainted: =
G        W  OE     5.14.0-rc5-01207-g8dff2c1958c2 #1
> kern  :warn  : [  136.748040] Hardware name: Intel Corporation NUC7i7BNH/=
NUC7i7BNB, BIOS BNKBL357.86A.0067.2018.0814.1500 08/14/2018
> kern  :warn  : [  136.749026] Call Trace:
> kern :warn : [  136.749274] dump_stack_lvl (lib/dump_stack.c:106) =

> kern :warn : [  136.749627] check_preemption_disabled (lib/smp_processor_=
id.c:49) =

> kern :warn : [  136.750131] intel_pmu_lbr_enable_all (arch/x86/events/int=
el/lbr.c:764 arch/x86/events/intel/lbr.c:774 arch/x86/events/intel/lbr.c:77=
0) =

> kern :warn : [  136.750538] __bpf_prog_enter (kernel/bpf/trampoline.c:577=
) =

> kern :warn : [  136.750938] bpf_trampoline_6442562768_0+0x3b/0x1000 =

> kern :warn : [  136.751416] bpf_fexit_loop_test1 (net/bpf/test_run.c:236) =

> kern :warn : [  136.751797] bpf_prog_test_run_tracing (net/bpf/test_run.c=
:308) =

> kern :warn : [  136.752281] __sys_bpf (kernel/bpf/syscall.c:3307 kernel/b=
pf/syscall.c:4605) =

> kern :warn : [  136.752604] ? __sys_bpf (kernel/bpf/syscall.c:4629) =

> kern :warn : [  136.752966] __x64_sys_bpf (kernel/bpf/syscall.c:4689) =

> kern :warn : [  136.753311] do_syscall_64 (arch/x86/entry/common.c:50 arc=
h/x86/entry/common.c:80) =

> kern :warn : [  136.753658] ? lockdep_hardirqs_on (kernel/locking/lockdep=
.c:4344) =

> kern :warn : [  136.754091] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.754453] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.754846] ? lockdep_hardirqs_on (kernel/locking/lockdep=
.c:4344) =

> kern :warn : [  136.755245] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.755589] ? lockdep_hardirqs_on (kernel/locking/lockdep=
.c:4344) =

> kern :warn : [  136.756007] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.756349] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.756795] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.757153] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.757511] ? asm_sysvec_apic_timer_interrupt (arch/x86/i=
nclude/asm/idtentry.h:638) =

> kern :warn : [  136.758011] ? asm_sysvec_apic_timer_interrupt (arch/x86/i=
nclude/asm/idtentry.h:638) =

> kern :warn : [  136.758471] ? lockdep_hardirqs_on (kernel/locking/lockdep=
.c:4344) =

> kern :warn : [  136.758871] entry_SYSCALL_64_after_hwframe (arch/x86/entr=
y/entry_64.S:113) =

> kern  :warn  : [  136.759319] RIP: 0033:0x7f0fcbd69f59
> kern :warn : [ 136.759666] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1=
f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 2=
4 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 07 6f 0c 00 f7 d8 64 89 01=
 48
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>   0:	00 c3                	add    %al,%bl
>   2:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
>   9:	00 00 00 =

>   c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
>  11:	48 89 f8             	mov    %rdi,%rax
>  14:	48 89 f7             	mov    %rsi,%rdi
>  17:	48 89 d6             	mov    %rdx,%rsi
>  1a:	48 89 ca             	mov    %rcx,%rdx
>  1d:	4d 89 c2             	mov    %r8,%r10
>  20:	4d 89 c8             	mov    %r9,%r8
>  23:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
>  28:	0f 05                	syscall =

>  2a:*	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax		<-- trapping=
 instruction
>  30:	73 01                	jae    0x33
>  32:	c3                   	retq   =

>  33:	48 8b 0d 07 6f 0c 00 	mov    0xc6f07(%rip),%rcx        # 0xc6f41
>  3a:	f7 d8                	neg    %eax
>  3c:	64 89 01             	mov    %eax,%fs:(%rcx)
>  3f:	48                   	rex.W
> =

> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   0:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
>   6:	73 01                	jae    0x9
>   8:	c3                   	retq   =

>   9:	48 8b 0d 07 6f 0c 00 	mov    0xc6f07(%rip),%rcx        # 0xc6f17
>  10:	f7 d8                	neg    %eax
>  12:	64 89 01             	mov    %eax,%fs:(%rcx)
>  15:	48                   	rex.W
> kern  :warn  : [  136.761174] RSP: 002b:00007ffd572256a8 EFLAGS: 00000202=
 ORIG_RAX: 0000000000000141
> kern  :warn  : [  136.761776] RAX: ffffffffffffffda RBX: 0000000000000000=
 RCX: 00007f0fcbd69f59
> kern  :warn  : [  136.762436] RDX: 0000000000000080 RSI: 00007ffd57225700=
 RDI: 000000000000000a
> kern  :warn  : [  136.763021] RBP: 00007ffd572256c0 R08: 0000000000000000=
 R09: 00007ffd57225700
> kern  :warn  : [  136.763680] R10: 0000000000000000 R11: 0000000000000202=
 R12: 0000562a6e61ddb0
> kern  :warn  : [  136.764266] R13: 00007ffd57225a20 R14: 0000000000000000=
 R15: 0000000000000000
> kern  :err   : [  136.764875] BUG: using smp_processor_id() in preemptibl=
e [00000000] code: test_progs/5262
> kern :warn : [  136.765626] caller is intel_pmu_lbr_enable_all (arch/x86/=
events/intel/lbr.c:190 arch/x86/events/intel/lbr.c:775 arch/x86/events/inte=
l/lbr.c:770) =

> kern  :warn  : [  136.766173] CPU: 1 PID: 5262 Comm: test_progs Tainted: =
G        W  OE     5.14.0-rc5-01207-g8dff2c1958c2 #1
> kern  :warn  : [  136.767068] Hardware name: Intel Corporation NUC7i7BNH/=
NUC7i7BNB, BIOS BNKBL357.86A.0067.2018.0814.1500 08/14/2018
> kern  :warn  : [  136.767986] Call Trace:
> kern :warn : [  136.768248] dump_stack_lvl (lib/dump_stack.c:106) =

> kern :warn : [  136.768620] check_preemption_disabled (lib/smp_processor_=
id.c:49) =

> kern :warn : [  136.769141] intel_pmu_lbr_enable_all (arch/x86/events/int=
el/lbr.c:190 arch/x86/events/intel/lbr.c:775 arch/x86/events/intel/lbr.c:77=
0) =

> kern :warn : [  136.769570] __bpf_prog_enter (kernel/bpf/trampoline.c:577=
) =

> kern :warn : [  136.769933] bpf_trampoline_6442562768_0+0x3b/0x1000 =

> kern :warn : [  136.770407] bpf_fexit_loop_test1 (net/bpf/test_run.c:236) =

> kern :warn : [  136.770790] bpf_prog_test_run_tracing (net/bpf/test_run.c=
:308) =

> kern :warn : [  136.771237] __sys_bpf (kernel/bpf/syscall.c:3307 kernel/b=
pf/syscall.c:4605) =

> kern :warn : [  136.771594] ? __sys_bpf (kernel/bpf/syscall.c:4629) =

> kern :warn : [  136.771957] __x64_sys_bpf (kernel/bpf/syscall.c:4689) =

> kern :warn : [  136.772322] do_syscall_64 (arch/x86/entry/common.c:50 arc=
h/x86/entry/common.c:80) =

> kern :warn : [  136.772688] ? lockdep_hardirqs_on (kernel/locking/lockdep=
.c:4344) =

> kern :warn : [  136.773087] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.773463] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.773803] ? lockdep_hardirqs_on (kernel/locking/lockdep=
.c:4344) =

> kern :warn : [  136.774202] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.774563] ? lockdep_hardirqs_on (kernel/locking/lockdep=
.c:4344) =

> kern :warn : [  136.774961] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.775320] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.775678] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.776035] ? do_syscall_64 (arch/x86/entry/common.c:87) =

> kern :warn : [  136.776424] ? asm_sysvec_apic_timer_interrupt (arch/x86/i=
nclude/asm/idtentry.h:638) =

> kern :warn : [  136.776962] ? asm_sysvec_apic_timer_interrupt (arch/x86/i=
nclude/asm/idtentry.h:638) =

> kern :warn : [  136.777458] ? lockdep_hardirqs_on (kernel/locking/lockdep=
.c:4344) =

> kern :warn : [  136.777858] entry_SYSCALL_64_after_hwframe (arch/x86/entr=
y/entry_64.S:113) =

> kern  :warn  : [  136.778327] RIP: 0033:0x7f0fcbd69f59
> kern :warn : [ 136.778655] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1=
f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 2=
4 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 07 6f 0c 00 f7 d8 64 89 01=
 48
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>   0:	00 c3                	add    %al,%bl
>   2:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
>   9:	00 00 00 =

>   c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
>  11:	48 89 f8             	mov    %rdi,%rax
>  14:	48 89 f7             	mov    %rsi,%rdi
>  17:	48 89 d6             	mov    %rdx,%rsi
>  1a:	48 89 ca             	mov    %rcx,%rdx
>  1d:	4d 89 c2             	mov    %r8,%r10
>  20:	4d 89 c8             	mov    %r9,%r8
>  23:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
>  28:	0f 05                	syscall =

>  2a:*	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax		<-- trapping=
 instruction
>  30:	73 01                	jae    0x33
>  32:	c3                   	retq   =

>  33:	48 8b 0d 07 6f 0c 00 	mov    0xc6f07(%rip),%rcx        # 0xc6f41
>  3a:	f7 d8                	neg    %eax
>  3c:	64 89 01             	mov    %eax,%fs:(%rcx)
>  3f:	48                   	rex.W
> =

> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   0:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
>   6:	73 01                	jae    0x9
>   8:	c3                   	retq   =

>   9:	48 8b 0d 07 6f 0c 00 	mov    0xc6f07(%rip),%rcx        # 0xc6f17
>  10:	f7 d8                	neg    %eax
>  12:	64 89 01             	mov    %eax,%fs:(%rcx)
>  15:	48                   	rex.W
> kern  :warn  : [  136.780125] RSP: 002b:00007ffd572256a8 EFLAGS: 00000202=
 ORIG_RAX: 0000000000000141
> kern  :warn  : [  136.780727] RAX: ffffffffffffffda RBX: 0000000000000000=
 RCX: 00007f0fcbd69f59
> kern  :warn  : [  136.781313] RDX: 0000000000000080 RSI: 00007ffd57225700=
 RDI: 000000000000000a
> kern  :warn  : [  136.781899] RBP: 00007ffd572256c0 R08: 0000000000000000=
 R09: 00007ffd57225700
> kern  :warn  : [  136.782535] R10: 0000000000000000 R11: 0000000000000202=
 R12: 0000562a6e61ddb0
> kern  :warn  : [  136.783177] R13: 00007ffd57225a20 R14: 0000000000000000=
 R15: 0000000000000000
> kern  :info  : [  138.164543] perf: interrupt took too long (3153 > 3143)=
, lowering kernel.perf_event_max_sample_rate to 63000
> kern  :info  : [  138.165345] perf: interrupt took too long (3153 > 3143)=
, lowering kernel.perf_event_max_sample_rate to 63000
> kern  :info  : [  138.166457] perf: interrupt took too long (3945 > 3941)=
, lowering kernel.perf_event_max_sample_rate to 50000
> kern  :info  : [  138.168213] perf: interrupt took too long (4932 > 4931)=
, lowering kernel.perf_event_max_sample_rate to 40000
> user  :notice: [  139.355105] # run_tests_skb_less:FAIL:ipv6-frag nhoff=
=3D0/14 thoff=3D0/62 addr_proto=3D0x0/0x86dd is_frag=3D0/1 is_first_frag=3D=
0/1 is_encap=3D0/0 ip_proto=3D0x0/0x6 n_proto=3D0x0/0xdd86 flow_label=3D0x0=
/0x0 sport=3D0/80 dport=3D0/8080
> =

> user  :notice: [  139.359537] # run_tests_skb_less:FAIL:ipv6-frag bpf_map=
_delete_elem -2
> =

> user  :notice: [  139.362850] # test_skb_less_link_create:PASS:bpf_link__=
destroy 0 nsec
> =

> user  :notice: [  139.364974] # #46 flow_dissector:FAIL
> =

> user  :notice: [  139.367223] # #47 flow_dissector_load_bytes:OK
> =

> user  :notice: [  139.370893] # #48/1 flow_dissector_reattach/flow dissec=
tor prog attach, prog attach (init_net):OK
> =

> user  :notice: [  139.375234] # #48/2 flow_dissector_reattach/flow dissec=
tor link create, link create (init_net):OK
> =

> user  :notice: [  139.379842] # #48/3 flow_dissector_reattach/flow dissec=
tor prog attach, link create (init_net):OK
> =

> user  :notice: [  139.382497] # #48/4 flow_dissector_reattach/flow dissec=
tor link create, prog attach (init_net):OK
> =

> user  :notice: [  139.385061] # #48/5 flow_dissector_reattach/flow dissec=
tor link create, prog detach (init_net):OK
> =

> user  :notice: [  139.387717] # #48/6 flow_dissector_reattach/flow dissec=
tor prog attach, detach, query (init_net):OK
> =

> user  :notice: [  139.390353] # #48/7 flow_dissector_reattach/flow dissec=
tor link create, close, query (init_net):OK
> =

> user  :notice: [  139.392961] # #48/8 flow_dissector_reattach/flow dissec=
tor link update no old prog (init_net):OK
> =

> user  :notice: [  139.395690] # #48/9 flow_dissector_reattach/flow dissec=
tor link update with replace old prog (init_net):OK
> =

> user  :notice: [  139.398424] # #48/10 flow_dissector_reattach/flow disse=
ctor link update with same prog (init_net):OK
> =

> user  :notice: [  139.401090] # #48/11 flow_dissector_reattach/flow disse=
ctor link update invalid opts (init_net):OK
> =

> user  :notice: [  139.403722] # #48/12 flow_dissector_reattach/flow disse=
ctor link update invalid prog (init_net):OK
> =

> user  :notice: [  139.406231] # #48/13 flow_dissector_reattach/flow disse=
ctor link update netns gone (init_net):OK
> =

> user  :notice: [  139.408610] # #48/14 flow_dissector_reattach/flow disse=
ctor link get info (init_net):OK
> =

> user  :notice: [  139.411035] # #48/15 flow_dissector_reattach/flow disse=
ctor prog attach, prog attach:OK
> =

> user  :notice: [  139.413359] # #48/16 flow_dissector_reattach/flow disse=
ctor link create, link create:OK
> =

> user  :notice: [  139.415751] # #48/17 flow_dissector_reattach/flow disse=
ctor prog attach, link create:OK
> =

> user  :notice: [  139.417999] # #48/18 flow_dissector_reattach/flow disse=
ctor link create, prog attach:OK
> =

> user  :notice: [  139.420432] # #48/19 flow_dissector_reattach/flow disse=
ctor link create, prog detach:OK
> =

> user  :notice: [  139.422821] # #48/20 flow_dissector_reattach/flow disse=
ctor prog attach, detach, query:OK
> =

> user  :notice: [  139.425174] # #48/21 flow_dissector_reattach/flow disse=
ctor link create, close, query:OK
> =

> user  :notice: [  139.427447] # #48/22 flow_dissector_reattach/flow disse=
ctor link update no old prog:OK
> =

> user  :notice: [  139.430055] # #48/23 flow_dissector_reattach/flow disse=
ctor link update with replace old prog:OK
> =

> user  :notice: [  139.432549] # #48/24 flow_dissector_reattach/flow disse=
ctor link update with same prog:OK
> =

> user  :notice: [  139.434965] # #48/25 flow_dissector_reattach/flow disse=
ctor link update invalid opts:OK
> =

> user  :notice: [  139.437261] # #48/26 flow_dissector_reattach/flow disse=
ctor link update invalid prog:OK
> =

> user  :notice: [  139.439471] # #48/27 flow_dissector_reattach/flow disse=
ctor link update netns gone:OK
> =

> user  :notice: [  139.441628] # #48/28 flow_dissector_reattach/flow disse=
ctor link get info:OK
> =

> user  :notice: [  139.443097] # #48 flow_dissector_reattach:OK
> =

> user  :notice: [  139.444238] # #49/1 for_each/hash_map:OK
> =

> user  :notice: [  139.445375] # #49/2 for_each/array_map:OK
> =

> user  :notice: [  139.446309] # #49 for_each:OK
> =

> user  :notice: [  139.448091] # test_get_branch_trace:PASS:get_branch_tra=
ce__open_and_load 0 nsec
> =

> user  :notice: [  139.449839] # test_get_branch_trace:PASS:kallsyms_find =
0 nsec
> =

> =

> =

> To reproduce:
> =

>        git clone https://github.com/intel/lkp-tests.git
>        cd lkp-tests
>        bin/lkp install                job.yaml  # job file is attached in=
 this email
>        bin/lkp split-job --compatible job.yaml  # generate the yaml file =
for lkp run
>        bin/lkp run                    generated-yaml-file
> =

> =

> =

> ---
> 0DAY/LKP+ Test Infrastructure                   Open Source Technology Ce=
nter
> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org        Intel Corp=
oration
> =

> Thanks,
> Oliver Sang
> =

> <config-5.14.0-rc5-01207-g8dff2c1958c2><job-script.txt><kmsg.xz><kernel-s=
elftests.txt><job.yaml><reproduce.txt>

--===============4910109701518700164==--

