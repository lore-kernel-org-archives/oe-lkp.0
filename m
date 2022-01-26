Content-Type: multipart/mixed; boundary="===============2349052745991733806=="
MIME-Version: 1.0
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: lkp@lists.01.org
Subject: Re: [x86] 17cd1a8149: kernel_BUG_at_mm/page_table_check.c
Date: Wed, 26 Jan 2022 07:29:41 -0500
Message-ID: <CA+CK2bAG73VdzbUP4RS83TtsGmYDqBw=VXboMyaPta4NgrpciA@mail.gmail.com>
In-Reply-To: <20220126065751.GA23867@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============2349052745991733806==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 26, 2022 at 1:58 AM kernel test robot <oliver.sang@intel.com>=
 wrote:
>
>
>
> Greeting,
>
> FYI, we noticed the following commit (built with gcc-9):
>
> commit: 17cd1a8149994ce2c0f49abbed2196626cb51011 ("x86: mm: add x86_64 su=
pport for page table check")
> url: https://github.com/0day-ci/linux/commits/Yang-Li/net-phy-micrel-use-=
min-macro-instead-of-doing-it-manually/20211224-171618
>
> in testcase: boot
>
> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 16G
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
> +------------------------------------------+------------+------------+
> |                                          | a26c01367c | 17cd1a8149 |
> +------------------------------------------+------------+------------+
> | boot_successes                           | 48         | 0          |
> | boot_failures                            | 0          | 48         |
> | kernel_BUG_at_mm/page_table_check.c      | 0          | 48         |
> | invalid_opcode:#[##]                     | 0          | 48         |
> | RIP:__page_table_check_zero              | 0          | 48         |
> | Kernel_panic-not_syncing:Fatal_exception | 0          | 48         |
> +------------------------------------------+------------+------------+
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
>
>
> [    9.414679][    T1] kernel BUG at mm/page_table_check.c:162!
> [    9.415511][    T1] invalid opcode: 0000 [#1] SMP
> [    9.416217][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.16.0-r=
c6-00149-g17cd1a814999 #1 145cbc68045d824db2e83a3e2291f7c16a59376c
> [    9.417858][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 19=
96), BIOS 1.12.0-1 04/01/2014
> [ 9.419117][ T1] RIP: 0010:__page_table_check_zero (mm/page_table_check.c=
:162 (discriminator 1))
> [ 9.419966][ T1] Code: 03 2d e6 ab 97 01 41 83 c4 01 41 83 fd 1f 0f 87 f8=
 f9 9c 00 45 39 e6 7f 9b 48 83 c4 08 5b 5d 41 5c 41 5d 41 5e 41 5f c3 0f 0b=
 <0f> 0b 0f 0b cc cc cc cc cc cc 48 8b 07 48 89 06 31 c0 c3 0f 1f 80
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0:   03 2d e6 ab 97 01       add    0x197abe6(%rip),%ebp        # 0x19=
7abec
>    6:   41 83 c4 01             add    $0x1,%r12d
>    a:   41 83 fd 1f             cmp    $0x1f,%r13d
>    e:   0f 87 f8 f9 9c 00       ja     0x9cfa0c
>   14:   45 39 e6                cmp    %r12d,%r14d
>   17:   7f 9b                   jg     0xffffffffffffffb4
>   19:   48 83 c4 08             add    $0x8,%rsp
>   1d:   5b                      pop    %rbx
>   1e:   5d                      pop    %rbp
>   1f:   41 5c                   pop    %r12
>   21:   41 5d                   pop    %r13
>   23:   41 5e                   pop    %r14
>   25:   41 5f                   pop    %r15
>   27:   c3                      retq
>   28:   0f 0b                   ud2
>   2a:*  0f 0b                   ud2             <-- trapping instruction
>   2c:   0f 0b                   ud2
>   2e:   cc                      int3
>   2f:   cc                      int3
>   30:   cc                      int3
>   31:   cc                      int3
>   32:   cc                      int3
>   33:   cc                      int3
>   34:   48 8b 07                mov    (%rdi),%rax
>   37:   48 89 06                mov    %rax,(%rsi)
>   3a:   31 c0                   xor    %eax,%eax
>   3c:   c3                      retq
>   3d:   0f                      .byte 0xf
>   3e:   1f                      (bad)
>   3f:   80                      .byte 0x80
>
> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    0:   0f 0b                   ud2
>    2:   0f 0b                   ud2
>    4:   cc                      int3
>    5:   cc                      int3
>    6:   cc                      int3
>    7:   cc                      int3
>    8:   cc                      int3
>    9:   cc                      int3
>    a:   48 8b 07                mov    (%rdi),%rax
>    d:   48 89 06                mov    %rax,(%rsi)
>   10:   31 c0                   xor    %eax,%eax
>   12:   c3                      retq
>   13:   0f                      .byte 0xf
>   14:   1f                      (bad)
>   15:   80                      .byte 0x80
> [    9.422517][    T1] RSP: 0000:ffffc9000022bce0 EFLAGS: 00010202
> [    9.423342][    T1] RAX: 0000000000000000 RBX: 0000000000000001 RCX: 0=
000000000000000
> [    9.424457][    T1] RDX: 0000000000000000 RSI: 0000000000000001 RDI: f=
fffffff82ebedc8
> [    9.425596][    T1] RBP: ffff888101819790 R08: 0000000000000000 R09: 0=
00000000004007e
> [    9.426731][    T1] R10: 0000000000000000 R11: 0000000000000000 R12: 0=
000000000000000
> [    9.427859][    T1] R13: 0000000000000000 R14: 0000000000000001 R15: 0=
000000000000000
> [    9.429002][    T1] FS:  0000000000000000(0000) GS:ffff88842fc00000(00=
00) knlGS:0000000000000000
> [    9.430271][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    9.431156][    T1] CR2: 00000000ffc6c3db CR3: 0000000002861000 CR4: 0=
0000000000406f0
> [    9.432278][    T1] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0=
000000000000000
> [    9.433406][    T1] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0=
000000000000400
> [    9.434514][    T1] Call Trace:
> [    9.435019][    T1]  <TASK>
> [ 9.435489][ T1] free_pcp_prepare (include/linux/page_table_check.h:43 mm=
/page_alloc.c:1351 mm/page_alloc.c:1424)
> [ 9.436171][ T1] ? lock_is_held_type (kernel/locking/lockdep.c:5380 kerne=
l/locking/lockdep.c:5680)
> [ 9.436873][ T1] free_unref_page (mm/page_alloc.c:3323 mm/page_alloc.c:34=
02)
> [ 9.437558][ T1] destroy_args (mm/debug_vm_pgtable.c:1046)
> [ 9.438202][ T1] debug_vm_pgtable (mm/debug_vm_pgtable.c:1332)
> [ 9.438902][ T1] ? init_args (mm/debug_vm_pgtable.c:1238)

This problem is fixed by this patch:
https://lore.kernel.org/all/20220126060514.1574935-2-pasha.tatashin(a)solee=
n.com
--===============2349052745991733806==--

