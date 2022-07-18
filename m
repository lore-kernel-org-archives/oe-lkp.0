Content-Type: multipart/mixed; boundary="===============0271890147046327510=="
MIME-Version: 1.0
From: Joanne Koong <joannelkoong@gmail.com>
To: lkp@lists.01.org
Subject: Re: [net] 2e20fc25bc: BUG:kernel_NULL_pointer_dereference, address
Date: Mon, 18 Jul 2022 14:31:09 -0700
Message-ID: <CAJnrk1Z0f1z-Mk10othmauAyaF_LD+MxcwVrtD_2=Z_bOHgecQ@mail.gmail.com>
In-Reply-To: <YtLJMxChUupbAa+U@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============0271890147046327510==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 16, 2022 at 7:20 AM kernel test robot <oliver.sang@intel.com>=
 wrote:
>
>
>
> Greeting,
>
> FYI, we noticed the following commit (built with gcc-11):
>
> commit: 2e20fc25bca52fbc786bbae312df56514c10798d ("[PATCH net-next v2 1/3=
] net: Add a bhash2 table hashed by port + address")
> url: https://github.com/intel-lab-lkp/linux/commits/Joanne-Koong/Add-a-se=
cond-bind-table-hashed-by-port-address/20220713-075808
> base: https://git.kernel.org/cgit/linux/kernel/git/davem/net-next.git 502=
2e221c98a609e0e5b0a73852c7e3d32f1c545
> patch link: https://lore.kernel.org/netdev/20220712235310.1935121-2-joann=
elkoong(a)gmail.com
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
> +-------------------------------------------------------+------------+---=
---------+
> |                                                       | 5022e221c9 | 2e=
20fc25bc |
> +-------------------------------------------------------+------------+---=
---------+
> | boot_successes                                        | 8          | 0 =
         |
> | boot_failures                                         | 0          | 12=
         |
> | BUG:kernel_NULL_pointer_dereference,address           | 0          | 12=
         |
> | Oops:#[##]                                            | 0          | 12=
         |
> | RIP:inet_bhash2_update_saddr                          | 0          | 12=
         |
> | Kernel_panic-not_syncing:Fatal_exception_in_interrupt | 0          | 12=
         |
> +-------------------------------------------------------+------------+---=
---------+
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
>
I will fix this issue in the next iteration of the patch (if the
previous address was never added to the bhash2 table, then we don't
need to compute the hash for it and remove it from the table). Thanks
for reporting.
>
> [  247.022450][  T328] BUG: kernel NULL pointer dereference, address: 000=
0000000000000
> [  247.024448][  T328] #PF: supervisor write access in kernel mode
> [  247.026159][  T328] #PF: error_code(0x0002) - not-present page
> [  247.027743][  T328] PGD 800000014b28a067 P4D 800000014b28a067 PUD 14b2=
89067 PMD 0
> [  247.029705][  T328] Oops: 0002 [#1] SMP PTI
> [  247.030900][  T328] CPU: 1 PID: 328 Comm: wget Not tainted 5.19.0-rc5-=
01130-g2e20fc25bca5 #1
> [  247.033223][  T328] Hardware name: QEMU Standard PC (i440FX + PIIX, 19=
96), BIOS 1.16.0-debian-1.16.0-4 04/01/2014
> [ 247.035984][ T328] RIP: 0010:inet_bhash2_update_saddr (include/linux/li=
st.h:884 include/net/sock.h:824 net/ipv4/inet_hashtables.c:872)
> [ 247.037623][ T328] Code: 48 8d 83 00 03 00 00 4c 8b a3 f8 02 00 00 48 8=
9 c7 48 89 44 24 28 e8 10 79 01 ff 4c 8b ab 00 03 00 00 4c 89 ef e8 f1 87 0=
1 ff <4d> 89 65 00 4d 85 e4 74 14 e8 93 2b ed fe 49 8d 7c 24 08 e8 d9 87
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0:   48 8d 83 00 03 00 00    lea    0x300(%rbx),%rax
>    7:   4c 8b a3 f8 02 00 00    mov    0x2f8(%rbx),%r12
>    e:   48 89 c7                mov    %rax,%rdi
>   11:   48 89 44 24 28          mov    %rax,0x28(%rsp)
>   16:   e8 10 79 01 ff          callq  0xffffffffff01792b
>   1b:   4c 8b ab 00 03 00 00    mov    0x300(%rbx),%r13
>   22:   4c 89 ef                mov    %r13,%rdi
>   25:   e8 f1 87 01 ff          callq  0xffffffffff01881b
>   2a:*  4d 89 65 00             mov    %r12,0x0(%r13)           <-- trapp=
ing instruction
>   2e:   4d 85 e4                test   %r12,%r12
>   31:   74 14                   je     0x47
>   33:   e8 93 2b ed fe          callq  0xfffffffffeed2bcb
>   38:   49 8d 7c 24 08          lea    0x8(%r12),%rdi
>   3d:   e8                      .byte 0xe8
>   3e:   d9                      .byte 0xd9
>   3f:   87                      .byte 0x87
>
> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    0:   4d 89 65 00             mov    %r12,0x0(%r13)
>    4:   4d 85 e4                test   %r12,%r12
>    7:   74 14                   je     0x1d
>    9:   e8 93 2b ed fe          callq  0xfffffffffeed2ba1
>    e:   49 8d 7c 24 08          lea    0x8(%r12),%rdi
>   13:   e8                      .byte 0xe8
>   14:   d9                      .byte 0xd9
>   15:   87                      .byte 0x87
> [  247.062693][  T328] RSP: 0018:ffffc90000ae7bd8 EFLAGS: 00010246
> [  247.064435][  T328] RAX: ffff88811673c3e0 RBX: ffff8881168e4600 RCX: f=
fffffff823fb28f
> [  247.066525][  T328] RDX: 0000000000000a28 RSI: 0001ffffffffffff RDI: 0=
000000000000000
> [  247.068479][  T328] RBP: ffffc90000ae7c60 R08: ffffffff8477ff18 R09: 0=
000000000000000
> [  247.070484][  T328] R10: 0000000000000005 R11: 0000000000000000 R12: 0=
000000000000000
> [  247.072457][  T328] R13: 0000000000000000 R14: ffffffff84cefd40 R15: f=
fffffff84cf29c0
> [  247.074463][  T328] FS:  00007f38cc1a6700(0000) GS:ffff88842fd00000(00=
00) knlGS:0000000000000000
> [  247.076798][  T328] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  247.080161][  T328] CR2: 0000000000000000 CR3: 0000000116a32000 CR4: 0=
0000000000006e0
> [  247.082224][  T328] Call Trace:
> [  247.083152][  T328]  <TASK>
> [ 247.083906][ T328] ? write_comp_data (kernel/kcov.c:229)
> [ 247.085183][ T328] tcp_v4_connect (net/ipv4/tcp_ipv4.c:261)
> [ 247.086542][ T328] __inet_stream_connect (net/ipv4/af_inet.c:661)
> [ 247.088103][ T328] ? write_comp_data (kernel/kcov.c:229)
> [ 247.089429][ T328] inet_stream_connect (net/ipv4/af_inet.c:725)
> [ 247.090707][ T328] ? __inet_stream_connect (net/ipv4/af_inet.c:720)
> [ 247.092104][ T328] __sys_connect_file (net/socket.c:1976)
> [ 247.093453][ T328] __sys_connect (net/socket.c:1993)
> [ 247.094902][ T328] ? write_comp_data (kernel/kcov.c:229)
> [ 247.096382][ T328] ? __x64_sys_alarm (kernel/time/itimer.c:306)
> [ 247.097825][ T328] __x64_sys_connect (net/socket.c:2000)
> [ 247.115487][ T328] do_syscall_64 (arch/x86/entry/common.c:50 arch/x86/e=
ntry/common.c:80)
> [ 247.116792][ T328] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry=
_64.S:115)
> [  247.118477][  T328] RIP: 0033:0x7f38cb2662e0
> [ 247.119521][ T328] Code: 00 31 d2 48 29 c2 64 89 11 48 83 c8 ff eb ea 9=
0 90 90 90 90 90 90 90 90 90 90 83 3d fd 8e 2c 00 00 75 10 b8 2a 00 00 00 0=
f 05 <48> 3d 01 f0 ff ff 73 31 c3 48 83 ec 08 e8 fe ce 00 00 48 89 04 24
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0:   00 31                   add    %dh,(%rcx)
>    2:   d2 48 29                rorb   %cl,0x29(%rax)
>    5:   c2 64 89                retq   $0x8964
>    8:   11 48 83                adc    %ecx,-0x7d(%rax)
>    b:   c8 ff eb ea             enterq $0xebff,$0xea
>    f:   90                      nop
>   10:   90                      nop
>   11:   90                      nop
>   12:   90                      nop
>   13:   90                      nop
>   14:   90                      nop
>   15:   90                      nop
>   16:   90                      nop
>   17:   90                      nop
>   18:   90                      nop
>   19:   90                      nop
>   1a:   83 3d fd 8e 2c 00 00    cmpl   $0x0,0x2c8efd(%rip)        # 0x2c8=
f1e
>   21:   75 10                   jne    0x33
>   23:   b8 2a 00 00 00          mov    $0x2a,%eax
>   28:   0f 05                   syscall
>   2a:*  48 3d 01 f0 ff ff       cmp    $0xfffffffffffff001,%rax         <=
-- trapping instruction
>   30:   73 31                   jae    0x63
>   32:   c3                      retq
>   33:   48 83 ec 08             sub    $0x8,%rsp
>   37:   e8 fe ce 00 00          callq  0xcf3a
>   3c:   48 89 04 24             mov    %rax,(%rsp)
>
> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    0:   48 3d 01 f0 ff ff       cmp    $0xfffffffffffff001,%rax
>    6:   73 31                   jae    0x39
>    8:   c3                      retq
>    9:   48 83 ec 08             sub    $0x8,%rsp
>    d:   e8 fe ce 00 00          callq  0xcf10
>   12:   48 89 04 24             mov    %rax,(%rsp)
> [  247.124379][  T328] RSP: 002b:00007fffffe84038 EFLAGS: 00000246 ORIG_R=
AX: 000000000000002a
> [  247.126935][  T328] RAX: ffffffffffffffda RBX: 00007fffffe840d0 RCX: 0=
0007f38cb2662e0
> [  247.128978][  T328] RDX: 0000000000000010 RSI: 00007fffffe840f0 RDI: 0=
000000000000004
> [  247.131142][  T328] RBP: 0000000000000004 R08: 00007fffffe83fa0 R09: 0=
000000000000001
> [  247.133075][  T328] R10: 00007fffffe83dd0 R11: 0000000000000246 R12: 0=
000000000000050
> [  247.135155][  T328] R13: 000000000065ade0 R14: 0000000001549a70 R15: 0=
00000000000002a
> [  247.137196][  T328]  </TASK>
> [  247.142192][  T328] Modules linked in: bochs drm_vram_helper drm_ttm_h=
elper ttm drm_kms_helper syscopyarea sysfillrect sysimgblt ppdev fb_sys_fop=
s sr_mod drm joydev i2c_piix4 cdrom parport_pc parport
> [  247.147469][  T328] CR2: 0000000000000000
> [  247.148548][  T328] ---[ end trace 0000000000000000 ]---
> [ 247.186378][ T328] RIP: 0010:inet_bhash2_update_saddr (include/linux/li=
st.h:884 include/net/sock.h:824 net/ipv4/inet_hashtables.c:872)
> [ 247.218516][ T328] Code: 48 8d 83 00 03 00 00 4c 8b a3 f8 02 00 00 48 8=
9 c7 48 89 44 24 28 e8 10 79 01 ff 4c 8b ab 00 03 00 00 4c 89 ef e8 f1 87 0=
1 ff <4d> 89 65 00 4d 85 e4 74 14 e8 93 2b ed fe 49 8d 7c 24 08 e8 d9 87
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0:   48 8d 83 00 03 00 00    lea    0x300(%rbx),%rax
>    7:   4c 8b a3 f8 02 00 00    mov    0x2f8(%rbx),%r12
>    e:   48 89 c7                mov    %rax,%rdi
>   11:   48 89 44 24 28          mov    %rax,0x28(%rsp)
>   16:   e8 10 79 01 ff          callq  0xffffffffff01792b
>   1b:   4c 8b ab 00 03 00 00    mov    0x300(%rbx),%r13
>   22:   4c 89 ef                mov    %r13,%rdi
>   25:   e8 f1 87 01 ff          callq  0xffffffffff01881b
>   2a:*  4d 89 65 00             mov    %r12,0x0(%r13)           <-- trapp=
ing instruction
>   2e:   4d 85 e4                test   %r12,%r12
>   31:   74 14                   je     0x47
>   33:   e8 93 2b ed fe          callq  0xfffffffffeed2bcb
>   38:   49 8d 7c 24 08          lea    0x8(%r12),%rdi
>   3d:   e8                      .byte 0xe8
>   3e:   d9                      .byte 0xd9
>   3f:   87                      .byte 0x87
>
> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    0:   4d 89 65 00             mov    %r12,0x0(%r13)
>    4:   4d 85 e4                test   %r12,%r12
>    7:   74 14                   je     0x1d
>    9:   e8 93 2b ed fe          callq  0xfffffffffeed2ba1
>    e:   49 8d 7c 24 08          lea    0x8(%r12),%rdi
>   13:   e8                      .byte 0xe8
>   14:   d9                      .byte 0xd9
>   15:   87                      .byte 0x87
>
>
> To reproduce:
>
>         # build kernel
>         cd linux
>         cp config-5.19.0-rc5-01130-g2e20fc25bca5 .config
>         make HOSTCC=3Dgcc-11 CC=3Dgcc-11 ARCH=3Dx86_64 olddefconfig prepa=
re modules_prepare bzImage modules
>         make HOSTCC=3Dgcc-11 CC=3Dgcc-11 ARCH=3Dx86_64 INSTALL_MOD_PATH=
=3D<mod-install-dir> modules_install
>         cd <mod-install-dir>
>         find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz
>
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-script =
is attached in this email
>
>         # if come across any failure that blocks the test,
>         # please remove ~/.lkp and /lkp dir to run from a clean state.
>
>
>
> --
> 0-DAY CI Kernel Test Service
> https://01.org/lkp
>
>
--===============0271890147046327510==--

