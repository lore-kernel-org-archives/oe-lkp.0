Content-Type: multipart/mixed; boundary="===============5122029970661335171=="
MIME-Version: 1.0
From: Qinghua Jin <qhjin.dev@gmail.com>
To: lkp@lists.01.org
Subject: Re: [vfs] bf75e8b684: WARNING:possible_recursive_locking_detected
Date: Fri, 07 Jan 2022 11:15:50 +0800
Message-ID: <CACL7WENE3JNPM36rjem32mFY4GqOn5ZK=VmmOyEUJtiYHS_H9Q@mail.gmail.com>
In-Reply-To: <20220106135223.GB3163@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============5122029970661335171==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The patch is broken. Please revert the commit. I'll submit a patch some
time later.
Thanks for your good work!

On Thu, Jan 6, 2022 at 9:52 PM kernel test robot <oliver.sang@intel.com>
wrote:

>
>
> Greeting,
>
> FYI, we noticed the following commit (built with gcc-9):
>
> commit: bf75e8b6842a7dba690263318503c228c1fb93b2 ("[PATCH v2] vfs: fix bug
> when opening a file with O_DIRECT on a file system that does not support =
it
> will leave an empty file")
> url:
> https://github.com/0day-ci/linux/commits/Qinghua-Jin/vfs-fix-bug-when-ope=
ning-a-file-with-O_DIRECT-on-a-file-system-that-does-not-support-it-will-le=
ave-an-empty-file/20220104-174321
> base: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git
> c9e6606c7fe92b50a02ce51dda82586ebdf99b48
> patch link:
> https://lore.kernel.org/linux-fsdevel/20220104094217.99187-1-qhjin.dev(a)=
gmail.com
>
> in testcase: trinity
> version: trinity-static-i386-x86_64-1c734c75-1_2020-01-06
> with following parameters:
>
>         runtime: 300s
>         group: group-02
>
> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
>
>
> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m
> 16G
>
> caused below changes (please refer to attached dmesg/kmsg for entire
> log/backtrace):
>
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
>
>
> [  305.785680][ T3724] WARNING: possible recursive locking detected
> [  305.792683][ T3724] 5.16.0-rc8-00001-gbf75e8b6842a #1 Not tainted
> [  305.799629][ T3724] --------------------------------------------
> [  305.805972][ T3724] trinity-main/3724 is trying to acquire lock:
> [ 305.829352][ T3724] ffff8881bc402448 (sb_writers#5){.+.+}-{0:0}, at:
> do_unlinkat (fs/namei.c:4152)
> [  305.836035][ T3724]
> [  305.836035][ T3724] but task is already holding lock:
> [ 305.847224][ T3724] ffff8881bc402448 (sb_writers#5){.+.+}-{0:0}, at:
> do_open (fs/nfs/dir.c:998)
> [  305.853885][ T3724]
> [  305.853885][ T3724] other info that might help us debug this:
> [  305.865444][ T3724]  Possible unsafe locking scenario:
> [  305.865444][ T3724]
> [  305.876999][ T3724]        CPU0
> [  305.882412][ T3724]        ----
> [  305.888119][ T3724]   lock(sb_writers#5);
> [  305.893721][ T3724]   lock(sb_writers#5);
> [  305.899301][ T3724]
> [  305.899301][ T3724]  *** DEADLOCK ***
> [  305.899301][ T3724]
> [  305.914974][ T3724]  May be due to missing lock nesting notation
> [  305.914974][ T3724]
> [  305.926124][ T3724] 1 lock held by trinity-main/3724:
> [ 305.931835][ T3724] #0: ffff8881bc402448 (sb_writers#5){.+.+}-{0:0}, at:
> do_open (fs/nfs/dir.c:998)
> [  305.938387][ T3724]
> [  305.938387][ T3724] stack backtrace:
> [  305.948298][ T3724] CPU: 0 PID: 3724 Comm: trinity-main Not tainted
> 5.16.0-rc8-00001-gbf75e8b6842a #1
> [  305.954179][ T3724] Hardware name: QEMU Standard PC (i440FX + PIIX,
> 1996), BIOS 1.12.0-1 04/01/2014
> [  305.960312][ T3724] Call Trace:
> [  305.965171][ T3724]  <TASK>
> [ 305.979438][ T3724] dump_stack_lvl (lib/dump_stack.c:107)
> [ 305.984394][ T3724] __lock_acquire.cold (kernel/locking/lockdep.c:2956
> kernel/locking/lockdep.c:2999 kernel/locking/lockdep.c:3788
> kernel/locking/lockdep.c:5027)
> [ 305.989632][ T3724] ? lockdep_hardirqs_on_prepare
> (kernel/locking/lockdep.c:4885)
> [ 305.994509][ T3724] ? lock_is_held_type (kernel/locking/lockdep.c:438
> kernel/locking/lockdep.c:5681)
> [ 305.999423][ T3724] ? rcu_read_lock_sched_held
> (include/linux/lockdep.h:283 kernel/rcu/update.c:125)
> [ 306.004326][ T3724] lock_acquire (kernel/locking/lockdep.c:438
> kernel/locking/lockdep.c:5639 kernel/locking/lockdep.c:5602)
> [ 306.008945][ T3724] ? do_unlinkat (fs/namei.c:4152)
> [ 306.034198][ T3724] ? rcu_read_unlock (include/linux/rcupdate.h:717
> (discriminator 5))
> [ 306.040394][ T3724] ? lock_is_held_type (kernel/locking/lockdep.c:438
> kernel/locking/lockdep.c:5681)
> [ 306.045137][ T3724] ? lock_is_held_type (kernel/locking/lockdep.c:438
> kernel/locking/lockdep.c:5681)
> [ 306.049566][ T3724] mnt_want_write (include/linux/percpu-rwsem.h:53
> include/linux/fs.h:1810 include/linux/fs.h:1880 fs/namespace.c:376)
> [ 306.053945][ T3724] ? do_unlinkat (fs/namei.c:4152)
> [ 306.058228][ T3724] do_unlinkat (fs/namei.c:4152)
> [ 306.061922][ T3724] ? __x64_sys_rmdir (fs/namei.c:4134)
> [ 306.065653][ T3724] ? rcu_read_lock_bh_held (kernel/rcu/update.c:120)
> [ 306.069157][ T3724] ? __kasan_slab_alloc (mm/kasan/common.c:46
> mm/kasan/common.c:434 mm/kasan/common.c:467)
> [ 306.072498][ T3724] ? kmem_cache_alloc (include/trace/events/kmem.h:54
> mm/slub.c:3249)
> [ 306.075899][ T3724] ? process_measurement
> (security/integrity/ima/ima_main.c:512)
> [ 306.079195][ T3724] ? memcpy (mm/kasan/shadow.c:65 (discriminator 1))
> [ 306.082202][ T3724] do_open (fs/nfs/dir.c:1006)
> [ 306.085397][ T3724] path_openat (fs/namei.c:3566)
> [ 306.088636][ T3724] ? do_open (fs/nfs/dir.c:2048)
> [ 306.091782][ T3724] ? lockdep_hardirqs_on_prepare
> (kernel/locking/lockdep.c:4885)
> [ 306.094996][ T3724] ? lock_is_held_type (kernel/locking/lockdep.c:438
> kernel/locking/lockdep.c:5681)
> [ 306.098025][ T3724] ? lock_is_held_type (kernel/locking/lockdep.c:438
> kernel/locking/lockdep.c:5681)
> [ 306.101057][ T3724] do_filp_open (fs/namei.c:3592)
> [ 306.104074][ T3724] ? expand_files (fs/file.c:206 (discriminator 2))
> [ 306.106969][ T3724] ? path_openat (fs/namei.c:3586)
> [ 306.109934][ T3724] ? do_raw_spin_lock
> (arch/x86/include/asm/atomic.h:202
> include/linux/atomic/atomic-instrumented.h:513
> include/asm-generic/qspinlock.h:82 kernel/locking/spinlock_debug.c:115)
> [ 306.112940][ T3724] ? rwlock_bug+0xc0/0xc0
> [ 306.115909][ T3724] ? _raw_spin_unlock
> (arch/x86/include/asm/preempt.h:103 include/linux/spinlock_api_smp.h:143
> kernel/locking/spinlock.c:186)
> [ 306.118948][ T3724] ? alloc_fd (fs/file.c:526 (discriminator 10))
> [ 306.122085][ T3724] do_sys_openat2 (fs/open.c:1206)
> [ 306.125414][ T3724] ? file_open_root (fs/open.c:1192)
> [ 306.128632][ T3724] ? lock_is_held_type (kernel/locking/lockdep.c:438
> kernel/locking/lockdep.c:5681)
> [ 306.131859][ T3724] do_sys_open (fs/open.c:1220)
> [ 306.134832][ T3724] ? filp_open (fs/open.c:1220)
> [ 306.137880][ T3724] ? __ia32_compat_sys_ia32_stat64
> (arch/x86/kernel/sys_ia32.c:177)
> [ 306.141081][ T3724] ? lockdep_hardirqs_on_prepare
> (kernel/locking/lockdep.c:438 kernel/locking/lockdep.c:4293
> kernel/locking/lockdep.c:4244)
> [ 306.144229][ T3724] ? syscall_enter_from_user_mode_prepare
> (arch/x86/include/asm/irqflags.h:45 arch/x86/include/asm/irqflags.h:80
> kernel/entry/common.c:118)
> [ 306.147464][ T3724] ? lockdep_hardirqs_on
> (kernel/locking/lockdep.c:4356)
> [ 306.150356][ T3724] __do_fast_syscall_32 (arch/x86/entry/common.c:112
> arch/x86/entry/common.c:178)
> [ 306.153198][ T3724] ? rcu_read_lock_sched_held
> (include/linux/lockdep.h:283 kernel/rcu/update.c:125)
> [ 306.156313][ T3724] ? rcu_read_lock_bh_held (kernel/rcu/update.c:120)
> [ 306.159209][ T3724] ? __do_fast_syscall_32 (arch/x86/entry/common.c:183)
> [ 306.162071][ T3724] ? lockdep_hardirqs_on
> (kernel/locking/lockdep.c:4356)
> [ 306.164820][ T3724] ? __do_fast_syscall_32 (arch/x86/entry/common.c:183)
> [ 306.167728][ T3724] ? __do_fast_syscall_32 (arch/x86/entry/common.c:183)
> [ 306.170564][ T3724] ? __do_fast_syscall_32 (arch/x86/entry/common.c:183)
> [ 306.173390][ T3724] ? __do_fast_syscall_32 (arch/x86/entry/common.c:183)
> [ 306.176149][ T3724] do_fast_syscall_32 (arch/x86/entry/common.c:203)
> [ 306.178775][ T3724] entry_SYSENTER_compat_after_hwframe
> (arch/x86/entry/entry_64_compat.S:141)
> [  306.181608][ T3724] RIP: 0023:0xf7f9b549
> [ 306.184195][ T3724] Code: 03 74 c0 01 10 05 03 74 b8 01 10 06 03 74 b4
> 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 51 52 55 89 e5 0f 34
> cd 80 <5d> 5a 59 c3 90 90 90 90 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0:   03 74 c0 01             add    0x1(%rax,%rax,8),%esi
>    4:   10 05 03 74 b8 01       adc    %al,0x1b87403(%rip)        #
> 0x1b8740d
>    a:   10 06                   adc    %al,(%rsi)
>    c:   03 74 b4 01             add    0x1(%rsp,%rsi,4),%esi
>   10:   10 07                   adc    %al,(%rdi)
>   12:   03 74 b0 01             add    0x1(%rax,%rsi,4),%esi
>   16:   10 08                   adc    %cl,(%rax)
>   18:   03 74 d8 01             add    0x1(%rax,%rbx,8),%esi
>   1c:   00 00                   add    %al,(%rax)
>   1e:   00 00                   add    %al,(%rax)
>   20:   00 51 52                add    %dl,0x52(%rcx)
>   23:   55                      push   %rbp
>   24:   89 e5                   mov    %esp,%ebp
>   26:   0f 34                   sysenter
>   28:   cd 80                   int    $0x80
>   2a:*  5d                      pop    %rbp             <-- trapping
> instruction
>   2b:   5a                      pop    %rdx
>   2c:   59                      pop    %rcx
>   2d:   c3                      retq
>   2e:   90                      nop
>   2f:   90                      nop
>   30:   90                      nop
>   31:   90                      nop
>   32:   8d b4 26 00 00 00 00    lea    0x0(%rsi,%riz,1),%esi
>   39:   8d b4 26 00 00 00 00    lea    0x0(%rsi,%riz,1),%esi
>
> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    0:   5d                      pop    %rbp
>    1:   5a                      pop    %rdx
>    2:   59                      pop    %rcx
>    3:   c3                      retq
>    4:   90                      nop
>    5:   90                      nop
>    6:   90                      nop
>    7:   90                      nop
>    8:   8d b4 26 00 00 00 00    lea    0x0(%rsi,%riz,1),%esi
>    f:   8d b4 26 00 00 00 00    lea    0x0(%rsi,%riz,1),%esi
>
>
> To reproduce:
>
>         # build kernel
>         cd linux
>         cp config-5.16.0-rc8-00001-gbf75e8b6842a .config
>         make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Dx86_64 olddefconfig prepare
> modules_prepare bzImage modules
>         make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Dx86_64
> INSTALL_MOD_PATH=3D<mod-install-dir> modules_install
>         cd <mod-install-dir>
>         find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz
>
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-script
> is attached in this email
>
>         # if come across any failure that blocks the test,
>         # please remove ~/.lkp and /lkp dir to run from a clean state.
>
>
>
> ---
> 0DAY/LKP+ Test Infrastructure                   Open Source Technology
> Center
> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel
> Corporation
>
> Thanks,
> Oliver Sang
>
>

--===============5122029970661335171==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdj5UaGUgcGF0Y2ggaXMgYnJva2VuLiBQ
bGVhc2UgcmV2ZXJ0IHRoZSBjb21taXQuIEkmIzM5O2xsIHN1Ym1pdCBhIHBhdGNoIHNvbWUgdGlt
ZSBsYXRlci48YnI+PC9kaXY+VGhhbmtzIGZvciB5b3VyIGdvb2Qgd29yayEgPGJyPjwvZGl2Pjxi
cj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0
dHIiPk9uIFRodSwgSmFuIDYsIDIwMjIgYXQgOTo1MiBQTSBrZXJuZWwgdGVzdCByb2JvdCAmbHQ7
PGEgaHJlZj0ibWFpbHRvOm9saXZlci5zYW5nQGludGVsLmNvbSI+b2xpdmVyLnNhbmdAaW50ZWwu
Y29tPC9hPiZndDsgd3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90
ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQg
cmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij48YnI+Cjxicj4KR3JlZXRpbmcsPGJy
Pgo8YnI+CkZZSSwgd2Ugbm90aWNlZCB0aGUgZm9sbG93aW5nIGNvbW1pdCAoYnVpbHQgd2l0aCBn
Y2MtOSk6PGJyPgo8YnI+CmNvbW1pdDogYmY3NWU4YjY4NDJhN2RiYTY5MDI2MzMxODUwM2MyMjhj
MWZiOTNiMiAoJnF1b3Q7W1BBVENIIHYyXSB2ZnM6IGZpeCBidWcgd2hlbiBvcGVuaW5nIGEgZmls
ZSB3aXRoIE9fRElSRUNUIG9uIGEgZmlsZSBzeXN0ZW0gdGhhdCBkb2VzIG5vdCBzdXBwb3J0IGl0
IHdpbGwgbGVhdmUgYW4gZW1wdHkgZmlsZSZxdW90Oyk8YnI+CnVybDogPGEgaHJlZj0iaHR0cHM6
Ly9naXRodWIuY29tLzBkYXktY2kvbGludXgvY29tbWl0cy9RaW5naHVhLUppbi92ZnMtZml4LWJ1
Zy13aGVuLW9wZW5pbmctYS1maWxlLXdpdGgtT19ESVJFQ1Qtb24tYS1maWxlLXN5c3RlbS10aGF0
LWRvZXMtbm90LXN1cHBvcnQtaXQtd2lsbC1sZWF2ZS1hbi1lbXB0eS1maWxlLzIwMjIwMTA0LTE3
NDMyMSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9naXRodWIuY29t
LzBkYXktY2kvbGludXgvY29tbWl0cy9RaW5naHVhLUppbi92ZnMtZml4LWJ1Zy13aGVuLW9wZW5p
bmctYS1maWxlLXdpdGgtT19ESVJFQ1Qtb24tYS1maWxlLXN5c3RlbS10aGF0LWRvZXMtbm90LXN1
cHBvcnQtaXQtd2lsbC1sZWF2ZS1hbi1lbXB0eS1maWxlLzIwMjIwMTA0LTE3NDMyMTwvYT48YnI+
CmJhc2U6IDxhIGhyZWY9Imh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvY2dpdC9saW51eC9rZXJuZWwv
Z2l0L3RvcnZhbGRzL2xpbnV4LmdpdCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9jZ2l0L2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGlu
dXguZ2l0PC9hPiBjOWU2NjA2YzdmZTkyYjUwYTAyY2U1MWRkYTgyNTg2ZWJkZjk5YjQ4PGJyPgpw
YXRjaCBsaW5rOiA8YSBocmVmPSJodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1mc2RldmVs
LzIwMjIwMTA0MDk0MjE3Ljk5MTg3LTEtcWhqaW4uZGV2QGdtYWlsLmNvbSIgcmVsPSJub3JlZmVy
cmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZnNkZXZl
bC8yMDIyMDEwNDA5NDIxNy45OTE4Ny0xLXFoamluLmRldkBnbWFpbC5jb208L2E+PGJyPgo8YnI+
CmluIHRlc3RjYXNlOiB0cmluaXR5PGJyPgp2ZXJzaW9uOiB0cmluaXR5LXN0YXRpYy1pMzg2LXg4
Nl82NC0xYzczNGM3NS0xXzIwMjAtMDEtMDY8YnI+CndpdGggZm9sbG93aW5nIHBhcmFtZXRlcnM6
PGJyPgo8YnI+CsKgIMKgIMKgIMKgIHJ1bnRpbWU6IDMwMHM8YnI+CsKgIMKgIMKgIMKgIGdyb3Vw
OiBncm91cC0wMjxicj4KPGJyPgp0ZXN0LWRlc2NyaXB0aW9uOiBUcmluaXR5IGlzIGEgbGludXgg
c3lzdGVtIGNhbGwgZnV6eiB0ZXN0ZXIuPGJyPgp0ZXN0LXVybDogPGEgaHJlZj0iaHR0cDovL2Nv
ZGVtb25rZXkub3JnLnVrL3Byb2plY3RzL3RyaW5pdHkvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdl
dD0iX2JsYW5rIj5odHRwOi8vY29kZW1vbmtleS5vcmcudWsvcHJvamVjdHMvdHJpbml0eS88L2E+
PGJyPgo8YnI+Cjxicj4Kb24gdGVzdCBtYWNoaW5lOiBxZW11LXN5c3RlbS14ODZfNjQgLWVuYWJs
ZS1rdm0gLWNwdSBTYW5keUJyaWRnZSAtc21wIDIgLW0gMTZHPGJyPgo8YnI+CmNhdXNlZCBiZWxv
dyBjaGFuZ2VzIChwbGVhc2UgcmVmZXIgdG8gYXR0YWNoZWQgZG1lc2cva21zZyBmb3IgZW50aXJl
IGxvZy9iYWNrdHJhY2UpOjxicj4KPGJyPgo8YnI+Cjxicj4KSWYgeW91IGZpeCB0aGUgaXNzdWUs
IGtpbmRseSBhZGQgZm9sbG93aW5nIHRhZzxicj4KUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJv
Ym90ICZsdDs8YSBocmVmPSJtYWlsdG86b2xpdmVyLnNhbmdAaW50ZWwuY29tIiB0YXJnZXQ9Il9i
bGFuayI+b2xpdmVyLnNhbmdAaW50ZWwuY29tPC9hPiZndDs8YnI+Cjxicj4KPGJyPgpbwqAgMzA1
Ljc4NTY4MF1bIFQzNzI0XSBXQVJOSU5HOiBwb3NzaWJsZSByZWN1cnNpdmUgbG9ja2luZyBkZXRl
Y3RlZDxicj4KW8KgIDMwNS43OTI2ODNdWyBUMzcyNF0gNS4xNi4wLXJjOC0wMDAwMS1nYmY3NWU4
YjY4NDJhICMxIE5vdCB0YWludGVkPGJyPgpbwqAgMzA1Ljc5OTYyOV1bIFQzNzI0XSAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLTxicj4KW8KgIDMwNS44MDU5NzJd
WyBUMzcyNF0gdHJpbml0eS1tYWluLzM3MjQgaXMgdHJ5aW5nIHRvIGFjcXVpcmUgbG9jazo8YnI+
ClsgMzA1LjgyOTM1Ml1bIFQzNzI0XSBmZmZmODg4MWJjNDAyNDQ4IChzYl93cml0ZXJzIzUpey4r
Lit9LXswOjB9LCBhdDogZG9fdW5saW5rYXQgKGZzL25hbWVpLmM6NDE1MikgPGJyPgpbwqAgMzA1
LjgzNjAzNV1bIFQzNzI0XTxicj4KW8KgIDMwNS44MzYwMzVdWyBUMzcyNF0gYnV0IHRhc2sgaXMg
YWxyZWFkeSBob2xkaW5nIGxvY2s6PGJyPgpbIDMwNS44NDcyMjRdWyBUMzcyNF0gZmZmZjg4ODFi
YzQwMjQ0OCAoc2Jfd3JpdGVycyM1KXsuKy4rfS17MDowfSwgYXQ6IGRvX29wZW4gKGZzL25mcy9k
aXIuYzo5OTgpIDxicj4KW8KgIDMwNS44NTM4ODVdWyBUMzcyNF08YnI+ClvCoCAzMDUuODUzODg1
XVsgVDM3MjRdIG90aGVyIGluZm8gdGhhdCBtaWdodCBoZWxwIHVzIGRlYnVnIHRoaXM6PGJyPgpb
wqAgMzA1Ljg2NTQ0NF1bIFQzNzI0XcKgIFBvc3NpYmxlIHVuc2FmZSBsb2NraW5nIHNjZW5hcmlv
Ojxicj4KW8KgIDMwNS44NjU0NDRdWyBUMzcyNF08YnI+ClvCoCAzMDUuODc2OTk5XVsgVDM3MjRd
wqAgwqAgwqAgwqAgQ1BVMDxicj4KW8KgIDMwNS44ODI0MTJdWyBUMzcyNF3CoCDCoCDCoCDCoCAt
LS0tPGJyPgpbwqAgMzA1Ljg4ODExOV1bIFQzNzI0XcKgIMKgbG9jayhzYl93cml0ZXJzIzUpOzxi
cj4KW8KgIDMwNS44OTM3MjFdWyBUMzcyNF3CoCDCoGxvY2soc2Jfd3JpdGVycyM1KTs8YnI+ClvC
oCAzMDUuODk5MzAxXVsgVDM3MjRdPGJyPgpbwqAgMzA1Ljg5OTMwMV1bIFQzNzI0XcKgICoqKiBE
RUFETE9DSyAqKio8YnI+ClvCoCAzMDUuODk5MzAxXVsgVDM3MjRdPGJyPgpbwqAgMzA1LjkxNDk3
NF1bIFQzNzI0XcKgIE1heSBiZSBkdWUgdG8gbWlzc2luZyBsb2NrIG5lc3Rpbmcgbm90YXRpb248
YnI+ClvCoCAzMDUuOTE0OTc0XVsgVDM3MjRdPGJyPgpbwqAgMzA1LjkyNjEyNF1bIFQzNzI0XSAx
IGxvY2sgaGVsZCBieSB0cmluaXR5LW1haW4vMzcyNDo8YnI+ClsgMzA1LjkzMTgzNV1bIFQzNzI0
XSAjMDogZmZmZjg4ODFiYzQwMjQ0OCAoc2Jfd3JpdGVycyM1KXsuKy4rfS17MDowfSwgYXQ6IGRv
X29wZW4gKGZzL25mcy9kaXIuYzo5OTgpIDxicj4KW8KgIDMwNS45MzgzODddWyBUMzcyNF08YnI+
ClvCoCAzMDUuOTM4Mzg3XVsgVDM3MjRdIHN0YWNrIGJhY2t0cmFjZTo8YnI+ClvCoCAzMDUuOTQ4
Mjk4XVsgVDM3MjRdIENQVTogMCBQSUQ6IDM3MjQgQ29tbTogdHJpbml0eS1tYWluIE5vdCB0YWlu
dGVkIDUuMTYuMC1yYzgtMDAwMDEtZ2JmNzVlOGI2ODQyYSAjMTxicj4KW8KgIDMwNS45NTQxNzld
WyBUMzcyNF0gSGFyZHdhcmUgbmFtZTogUUVNVSBTdGFuZGFyZCBQQyAoaTQ0MEZYICsgUElJWCwg
MTk5NiksIEJJT1MgMS4xMi4wLTEgMDQvMDEvMjAxNDxicj4KW8KgIDMwNS45NjAzMTJdWyBUMzcy
NF0gQ2FsbCBUcmFjZTo8YnI+ClvCoCAzMDUuOTY1MTcxXVsgVDM3MjRdwqAgJmx0O1RBU0smZ3Q7
PGJyPgpbIDMwNS45Nzk0MzhdWyBUMzcyNF0gZHVtcF9zdGFja19sdmwgKGxpYi9kdW1wX3N0YWNr
LmM6MTA3KSA8YnI+ClsgMzA1Ljk4NDM5NF1bIFQzNzI0XSBfX2xvY2tfYWNxdWlyZS5jb2xkIChr
ZXJuZWwvbG9ja2luZy9sb2NrZGVwLmM6Mjk1NiBrZXJuZWwvbG9ja2luZy9sb2NrZGVwLmM6Mjk5
OSBrZXJuZWwvbG9ja2luZy9sb2NrZGVwLmM6Mzc4OCBrZXJuZWwvbG9ja2luZy9sb2NrZGVwLmM6
NTAyNykgPGJyPgpbIDMwNS45ODk2MzJdWyBUMzcyNF0gPyBsb2NrZGVwX2hhcmRpcnFzX29uX3By
ZXBhcmUgKGtlcm5lbC9sb2NraW5nL2xvY2tkZXAuYzo0ODg1KSA8YnI+ClsgMzA1Ljk5NDUwOV1b
IFQzNzI0XSA/IGxvY2tfaXNfaGVsZF90eXBlIChrZXJuZWwvbG9ja2luZy9sb2NrZGVwLmM6NDM4
IGtlcm5lbC9sb2NraW5nL2xvY2tkZXAuYzo1NjgxKSA8YnI+ClsgMzA1Ljk5OTQyM11bIFQzNzI0
XSA/IHJjdV9yZWFkX2xvY2tfc2NoZWRfaGVsZCAoaW5jbHVkZS9saW51eC9sb2NrZGVwLmg6Mjgz
IGtlcm5lbC9yY3UvdXBkYXRlLmM6MTI1KSA8YnI+ClsgMzA2LjAwNDMyNl1bIFQzNzI0XSBsb2Nr
X2FjcXVpcmUgKGtlcm5lbC9sb2NraW5nL2xvY2tkZXAuYzo0Mzgga2VybmVsL2xvY2tpbmcvbG9j
a2RlcC5jOjU2Mzkga2VybmVsL2xvY2tpbmcvbG9ja2RlcC5jOjU2MDIpIDxicj4KWyAzMDYuMDA4
OTQ1XVsgVDM3MjRdID8gZG9fdW5saW5rYXQgKGZzL25hbWVpLmM6NDE1MikgPGJyPgpbIDMwNi4w
MzQxOThdWyBUMzcyNF0gPyByY3VfcmVhZF91bmxvY2sgKGluY2x1ZGUvbGludXgvcmN1cGRhdGUu
aDo3MTcgKGRpc2NyaW1pbmF0b3IgNSkpIDxicj4KWyAzMDYuMDQwMzk0XVsgVDM3MjRdID8gbG9j
a19pc19oZWxkX3R5cGUgKGtlcm5lbC9sb2NraW5nL2xvY2tkZXAuYzo0Mzgga2VybmVsL2xvY2tp
bmcvbG9ja2RlcC5jOjU2ODEpIDxicj4KWyAzMDYuMDQ1MTM3XVsgVDM3MjRdID8gbG9ja19pc19o
ZWxkX3R5cGUgKGtlcm5lbC9sb2NraW5nL2xvY2tkZXAuYzo0Mzgga2VybmVsL2xvY2tpbmcvbG9j
a2RlcC5jOjU2ODEpIDxicj4KWyAzMDYuMDQ5NTY2XVsgVDM3MjRdIG1udF93YW50X3dyaXRlIChp
bmNsdWRlL2xpbnV4L3BlcmNwdS1yd3NlbS5oOjUzIGluY2x1ZGUvbGludXgvZnMuaDoxODEwIGlu
Y2x1ZGUvbGludXgvZnMuaDoxODgwIGZzL25hbWVzcGFjZS5jOjM3NikgPGJyPgpbIDMwNi4wNTM5
NDVdWyBUMzcyNF0gPyBkb191bmxpbmthdCAoZnMvbmFtZWkuYzo0MTUyKSA8YnI+ClsgMzA2LjA1
ODIyOF1bIFQzNzI0XSBkb191bmxpbmthdCAoZnMvbmFtZWkuYzo0MTUyKSA8YnI+ClsgMzA2LjA2
MTkyMl1bIFQzNzI0XSA/IF9feDY0X3N5c19ybWRpciAoZnMvbmFtZWkuYzo0MTM0KSA8YnI+Clsg
MzA2LjA2NTY1M11bIFQzNzI0XSA/IHJjdV9yZWFkX2xvY2tfYmhfaGVsZCAoa2VybmVsL3JjdS91
cGRhdGUuYzoxMjApIDxicj4KWyAzMDYuMDY5MTU3XVsgVDM3MjRdID8gX19rYXNhbl9zbGFiX2Fs
bG9jIChtbS9rYXNhbi9jb21tb24uYzo0NiBtbS9rYXNhbi9jb21tb24uYzo0MzQgbW0va2FzYW4v
Y29tbW9uLmM6NDY3KSA8YnI+ClsgMzA2LjA3MjQ5OF1bIFQzNzI0XSA/IGttZW1fY2FjaGVfYWxs
b2MgKGluY2x1ZGUvdHJhY2UvZXZlbnRzL2ttZW0uaDo1NCBtbS9zbHViLmM6MzI0OSkgPGJyPgpb
IDMwNi4wNzU4OTldWyBUMzcyNF0gPyBwcm9jZXNzX21lYXN1cmVtZW50IChzZWN1cml0eS9pbnRl
Z3JpdHkvaW1hL2ltYV9tYWluLmM6NTEyKSA8YnI+ClsgMzA2LjA3OTE5NV1bIFQzNzI0XSA/IG1l
bWNweSAobW0va2FzYW4vc2hhZG93LmM6NjUgKGRpc2NyaW1pbmF0b3IgMSkpIDxicj4KWyAzMDYu
MDgyMjAyXVsgVDM3MjRdIGRvX29wZW4gKGZzL25mcy9kaXIuYzoxMDA2KSA8YnI+ClsgMzA2LjA4
NTM5N11bIFQzNzI0XSBwYXRoX29wZW5hdCAoZnMvbmFtZWkuYzozNTY2KSA8YnI+ClsgMzA2LjA4
ODYzNl1bIFQzNzI0XSA/IGRvX29wZW4gKGZzL25mcy9kaXIuYzoyMDQ4KSA8YnI+ClsgMzA2LjA5
MTc4Ml1bIFQzNzI0XSA/IGxvY2tkZXBfaGFyZGlycXNfb25fcHJlcGFyZSAoa2VybmVsL2xvY2tp
bmcvbG9ja2RlcC5jOjQ4ODUpIDxicj4KWyAzMDYuMDk0OTk2XVsgVDM3MjRdID8gbG9ja19pc19o
ZWxkX3R5cGUgKGtlcm5lbC9sb2NraW5nL2xvY2tkZXAuYzo0Mzgga2VybmVsL2xvY2tpbmcvbG9j
a2RlcC5jOjU2ODEpIDxicj4KWyAzMDYuMDk4MDI1XVsgVDM3MjRdID8gbG9ja19pc19oZWxkX3R5
cGUgKGtlcm5lbC9sb2NraW5nL2xvY2tkZXAuYzo0Mzgga2VybmVsL2xvY2tpbmcvbG9ja2RlcC5j
OjU2ODEpIDxicj4KWyAzMDYuMTAxMDU3XVsgVDM3MjRdIGRvX2ZpbHBfb3BlbiAoZnMvbmFtZWku
YzozNTkyKSA8YnI+ClsgMzA2LjEwNDA3NF1bIFQzNzI0XSA/IGV4cGFuZF9maWxlcyAoZnMvZmls
ZS5jOjIwNiAoZGlzY3JpbWluYXRvciAyKSkgPGJyPgpbIDMwNi4xMDY5NjldWyBUMzcyNF0gPyBw
YXRoX29wZW5hdCAoZnMvbmFtZWkuYzozNTg2KSA8YnI+ClsgMzA2LjEwOTkzNF1bIFQzNzI0XSA/
IGRvX3Jhd19zcGluX2xvY2sgKGFyY2gveDg2L2luY2x1ZGUvYXNtL2F0b21pYy5oOjIwMiBpbmNs
dWRlL2xpbnV4L2F0b21pYy9hdG9taWMtaW5zdHJ1bWVudGVkLmg6NTEzIGluY2x1ZGUvYXNtLWdl
bmVyaWMvcXNwaW5sb2NrLmg6ODIga2VybmVsL2xvY2tpbmcvc3BpbmxvY2tfZGVidWcuYzoxMTUp
IDxicj4KWyAzMDYuMTEyOTQwXVsgVDM3MjRdID8gcndsb2NrX2J1ZysweGMwLzB4YzAgPGJyPgpb
IDMwNi4xMTU5MDldWyBUMzcyNF0gPyBfcmF3X3NwaW5fdW5sb2NrIChhcmNoL3g4Ni9pbmNsdWRl
L2FzbS9wcmVlbXB0Lmg6MTAzIGluY2x1ZGUvbGludXgvc3BpbmxvY2tfYXBpX3NtcC5oOjE0MyBr
ZXJuZWwvbG9ja2luZy9zcGlubG9jay5jOjE4NikgPGJyPgpbIDMwNi4xMTg5NDhdWyBUMzcyNF0g
PyBhbGxvY19mZCAoZnMvZmlsZS5jOjUyNiAoZGlzY3JpbWluYXRvciAxMCkpIDxicj4KWyAzMDYu
MTIyMDg1XVsgVDM3MjRdIGRvX3N5c19vcGVuYXQyIChmcy9vcGVuLmM6MTIwNikgPGJyPgpbIDMw
Ni4xMjU0MTRdWyBUMzcyNF0gPyBmaWxlX29wZW5fcm9vdCAoZnMvb3Blbi5jOjExOTIpIDxicj4K
WyAzMDYuMTI4NjMyXVsgVDM3MjRdID8gbG9ja19pc19oZWxkX3R5cGUgKGtlcm5lbC9sb2NraW5n
L2xvY2tkZXAuYzo0Mzgga2VybmVsL2xvY2tpbmcvbG9ja2RlcC5jOjU2ODEpIDxicj4KWyAzMDYu
MTMxODU5XVsgVDM3MjRdIGRvX3N5c19vcGVuIChmcy9vcGVuLmM6MTIyMCkgPGJyPgpbIDMwNi4x
MzQ4MzJdWyBUMzcyNF0gPyBmaWxwX29wZW4gKGZzL29wZW4uYzoxMjIwKSA8YnI+ClsgMzA2LjEz
Nzg4MF1bIFQzNzI0XSA/IF9faWEzMl9jb21wYXRfc3lzX2lhMzJfc3RhdDY0IChhcmNoL3g4Ni9r
ZXJuZWwvc3lzX2lhMzIuYzoxNzcpIDxicj4KWyAzMDYuMTQxMDgxXVsgVDM3MjRdID8gbG9ja2Rl
cF9oYXJkaXJxc19vbl9wcmVwYXJlIChrZXJuZWwvbG9ja2luZy9sb2NrZGVwLmM6NDM4IGtlcm5l
bC9sb2NraW5nL2xvY2tkZXAuYzo0MjkzIGtlcm5lbC9sb2NraW5nL2xvY2tkZXAuYzo0MjQ0KSA8
YnI+ClsgMzA2LjE0NDIyOV1bIFQzNzI0XSA/IHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGVf
cHJlcGFyZSAoYXJjaC94ODYvaW5jbHVkZS9hc20vaXJxZmxhZ3MuaDo0NSBhcmNoL3g4Ni9pbmNs
dWRlL2FzbS9pcnFmbGFncy5oOjgwIGtlcm5lbC9lbnRyeS9jb21tb24uYzoxMTgpIDxicj4KWyAz
MDYuMTQ3NDY0XVsgVDM3MjRdID8gbG9ja2RlcF9oYXJkaXJxc19vbiAoa2VybmVsL2xvY2tpbmcv
bG9ja2RlcC5jOjQzNTYpIDxicj4KWyAzMDYuMTUwMzU2XVsgVDM3MjRdIF9fZG9fZmFzdF9zeXNj
YWxsXzMyIChhcmNoL3g4Ni9lbnRyeS9jb21tb24uYzoxMTIgYXJjaC94ODYvZW50cnkvY29tbW9u
LmM6MTc4KSA8YnI+ClsgMzA2LjE1MzE5OF1bIFQzNzI0XSA/IHJjdV9yZWFkX2xvY2tfc2NoZWRf
aGVsZCAoaW5jbHVkZS9saW51eC9sb2NrZGVwLmg6MjgzIGtlcm5lbC9yY3UvdXBkYXRlLmM6MTI1
KSA8YnI+ClsgMzA2LjE1NjMxM11bIFQzNzI0XSA/IHJjdV9yZWFkX2xvY2tfYmhfaGVsZCAoa2Vy
bmVsL3JjdS91cGRhdGUuYzoxMjApIDxicj4KWyAzMDYuMTU5MjA5XVsgVDM3MjRdID8gX19kb19m
YXN0X3N5c2NhbGxfMzIgKGFyY2gveDg2L2VudHJ5L2NvbW1vbi5jOjE4MykgPGJyPgpbIDMwNi4x
NjIwNzFdWyBUMzcyNF0gPyBsb2NrZGVwX2hhcmRpcnFzX29uIChrZXJuZWwvbG9ja2luZy9sb2Nr
ZGVwLmM6NDM1NikgPGJyPgpbIDMwNi4xNjQ4MjBdWyBUMzcyNF0gPyBfX2RvX2Zhc3Rfc3lzY2Fs
bF8zMiAoYXJjaC94ODYvZW50cnkvY29tbW9uLmM6MTgzKSA8YnI+ClsgMzA2LjE2NzcyOF1bIFQz
NzI0XSA/IF9fZG9fZmFzdF9zeXNjYWxsXzMyIChhcmNoL3g4Ni9lbnRyeS9jb21tb24uYzoxODMp
IDxicj4KWyAzMDYuMTcwNTY0XVsgVDM3MjRdID8gX19kb19mYXN0X3N5c2NhbGxfMzIgKGFyY2gv
eDg2L2VudHJ5L2NvbW1vbi5jOjE4MykgPGJyPgpbIDMwNi4xNzMzOTBdWyBUMzcyNF0gPyBfX2Rv
X2Zhc3Rfc3lzY2FsbF8zMiAoYXJjaC94ODYvZW50cnkvY29tbW9uLmM6MTgzKSA8YnI+ClsgMzA2
LjE3NjE0OV1bIFQzNzI0XSBkb19mYXN0X3N5c2NhbGxfMzIgKGFyY2gveDg2L2VudHJ5L2NvbW1v
bi5jOjIwMykgPGJyPgpbIDMwNi4xNzg3NzVdWyBUMzcyNF0gZW50cnlfU1lTRU5URVJfY29tcGF0
X2FmdGVyX2h3ZnJhbWUgKGFyY2gveDg2L2VudHJ5L2VudHJ5XzY0X2NvbXBhdC5TOjE0MSkgPGJy
PgpbwqAgMzA2LjE4MTYwOF1bIFQzNzI0XSBSSVA6IDAwMjM6MHhmN2Y5YjU0OTxicj4KWyAzMDYu
MTg0MTk1XVsgVDM3MjRdIENvZGU6IDAzIDc0IGMwIDAxIDEwIDA1IDAzIDc0IGI4IDAxIDEwIDA2
IDAzIDc0IGI0IDAxIDEwIDA3IDAzIDc0IGIwIDAxIDEwIDA4IDAzIDc0IGQ4IDAxIDAwIDAwIDAw
IDAwIDAwIDUxIDUyIDU1IDg5IGU1IDBmIDM0IGNkIDgwICZsdDs1ZCZndDsgNWEgNTkgYzMgOTAg
OTAgOTAgOTAgOGQgYjQgMjYgMDAgMDAgMDAgMDAgOGQgYjQgMjYgMDAgMDAgMDAgMDA8YnI+CkFs
bCBjb2RlPGJyPgo9PT09PT09PTxicj4KwqAgwqAwOsKgIMKgMDMgNzQgYzAgMDHCoCDCoCDCoCDC
oCDCoCDCoCDCoGFkZMKgIMKgIDB4MSglcmF4LCVyYXgsOCksJWVzaTxicj4KwqAgwqA0OsKgIMKg
MTAgMDUgMDMgNzQgYjggMDHCoCDCoCDCoCDCoGFkY8KgIMKgICVhbCwweDFiODc0MDMoJXJpcCnC
oCDCoCDCoCDCoCAjIDB4MWI4NzQwZDxicj4KwqAgwqBhOsKgIMKgMTAgMDbCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGFkY8KgIMKgICVhbCwoJXJzaSk8YnI+CsKgIMKgYzrCoCDCoDAzIDc0
IGI0IDAxwqAgwqAgwqAgwqAgwqAgwqAgwqBhZGTCoCDCoCAweDEoJXJzcCwlcnNpLDQpLCVlc2k8
YnI+CsKgIDEwOsKgIMKgMTAgMDfCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGFkY8KgIMKg
ICVhbCwoJXJkaSk8YnI+CsKgIDEyOsKgIMKgMDMgNzQgYjAgMDHCoCDCoCDCoCDCoCDCoCDCoCDC
oGFkZMKgIMKgIDB4MSglcmF4LCVyc2ksNCksJWVzaTxicj4KwqAgMTY6wqAgwqAxMCAwOMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYWRjwqAgwqAgJWNsLCglcmF4KTxicj4KwqAgMTg6wqAg
wqAwMyA3NCBkOCAwMcKgIMKgIMKgIMKgIMKgIMKgIMKgYWRkwqAgwqAgMHgxKCVyYXgsJXJieCw4
KSwlZXNpPGJyPgrCoCAxYzrCoCDCoDAwIDAwwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBh
ZGTCoCDCoCAlYWwsKCVyYXgpPGJyPgrCoCAxZTrCoCDCoDAwIDAwwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBhZGTCoCDCoCAlYWwsKCVyYXgpPGJyPgrCoCAyMDrCoCDCoDAwIDUxIDUywqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgYWRkwqAgwqAgJWRsLDB4NTIoJXJjeCk8YnI+CsKgIDIzOsKg
IMKgNTXCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBwdXNowqAgwqAlcmJwPGJyPgrC
oCAyNDrCoCDCoDg5IGU1wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBtb3bCoCDCoCAlZXNw
LCVlYnA8YnI+CsKgIDI2OsKgIMKgMGYgMzTCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN5
c2VudGVyIDxicj4KwqAgMjg6wqAgwqBjZCA4MMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
aW50wqAgwqAgJDB4ODA8YnI+CsKgIDJhOirCoCA1ZMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIHBvcMKgIMKgICVyYnDCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDstLSB0cmFwcGluZyBp
bnN0cnVjdGlvbjxicj4KwqAgMmI6wqAgwqA1YcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIHBvcMKgIMKgICVyZHg8YnI+CsKgIDJjOsKgIMKgNTnCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBwb3DCoCDCoCAlcmN4PGJyPgrCoCAyZDrCoCDCoGMzwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgcmV0ccKgIMKgPGJyPgrCoCAyZTrCoCDCoDkwwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgbm9wPGJyPgrCoCAyZjrCoCDCoDkwwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgbm9wPGJyPgrCoCAzMDrCoCDCoDkwwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgbm9wPGJyPgrCoCAzMTrCoCDCoDkwwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgbm9wPGJyPgrCoCAzMjrCoCDCoDhkIGI0IDI2IDAwIDAwIDAwIDAwwqAgwqAg
bGVhwqAgwqAgMHgwKCVyc2ksJXJpeiwxKSwlZXNpPGJyPgrCoCAzOTrCoCDCoDhkIGI0IDI2IDAw
IDAwIDAwIDAwwqAgwqAgbGVhwqAgwqAgMHgwKCVyc2ksJXJpeiwxKSwlZXNpPGJyPgo8YnI+CkNv
ZGUgc3RhcnRpbmcgd2l0aCB0aGUgZmF1bHRpbmcgaW5zdHJ1Y3Rpb248YnI+Cj09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT08YnI+CsKgIMKgMDrCoCDCoDVkwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcG9wwqAgwqAgJXJicDxicj4KwqAgwqAxOsKgIMKg
NWHCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBwb3DCoCDCoCAlcmR4PGJyPgrCoCDC
oDI6wqAgwqA1OcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHBvcMKgIMKgICVyY3g8
YnI+CsKgIMKgMzrCoCDCoGMzwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmV0ccKg
IMKgPGJyPgrCoCDCoDQ6wqAgwqA5MMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIG5v
cDxicj4KwqAgwqA1OsKgIMKgOTDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBub3A8
YnI+CsKgIMKgNjrCoCDCoDkwwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgbm9wPGJy
PgrCoCDCoDc6wqAgwqA5MMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIG5vcDxicj4K
wqAgwqA4OsKgIMKgOGQgYjQgMjYgMDAgMDAgMDAgMDDCoCDCoCBsZWHCoCDCoCAweDAoJXJzaSwl
cml6LDEpLCVlc2k8YnI+CsKgIMKgZjrCoCDCoDhkIGI0IDI2IDAwIDAwIDAwIDAwwqAgwqAgbGVh
wqAgwqAgMHgwKCVyc2ksJXJpeiwxKSwlZXNpPGJyPgo8YnI+Cjxicj4KVG8gcmVwcm9kdWNlOjxi
cj4KPGJyPgrCoCDCoCDCoCDCoCAjIGJ1aWxkIGtlcm5lbDxicj4KwqAgwqAgwqAgwqAgY2QgbGlu
dXg8YnI+CsKgIMKgIMKgIMKgIGNwIGNvbmZpZy01LjE2LjAtcmM4LTAwMDAxLWdiZjc1ZThiNjg0
MmEgLmNvbmZpZzxicj4KwqAgwqAgwqAgwqAgbWFrZSBIT1NUQ0M9Z2NjLTkgQ0M9Z2NjLTkgQVJD
SD14ODZfNjQgb2xkZGVmY29uZmlnIHByZXBhcmUgbW9kdWxlc19wcmVwYXJlIGJ6SW1hZ2UgbW9k
dWxlczxicj4KwqAgwqAgwqAgwqAgbWFrZSBIT1NUQ0M9Z2NjLTkgQ0M9Z2NjLTkgQVJDSD14ODZf
NjQgSU5TVEFMTF9NT0RfUEFUSD0mbHQ7bW9kLWluc3RhbGwtZGlyJmd0OyBtb2R1bGVzX2luc3Rh
bGw8YnI+CsKgIMKgIMKgIMKgIGNkICZsdDttb2QtaW5zdGFsbC1kaXImZ3Q7PGJyPgrCoCDCoCDC
oCDCoCBmaW5kIGxpYi8gfCBjcGlvIC1vIC1IIG5ld2MgLS1xdWlldCB8IGd6aXAgJmd0OyBtb2R1
bGVzLmNnejxicj4KPGJyPgo8YnI+CsKgIMKgIMKgIMKgIGdpdCBjbG9uZSA8YSBocmVmPSJodHRw
czovL2dpdGh1Yi5jb20vaW50ZWwvbGtwLXRlc3RzLmdpdCIgcmVsPSJub3JlZmVycmVyIiB0YXJn
ZXQ9Il9ibGFuayI+aHR0cHM6Ly9naXRodWIuY29tL2ludGVsL2xrcC10ZXN0cy5naXQ8L2E+PGJy
PgrCoCDCoCDCoCDCoCBjZCBsa3AtdGVzdHM8YnI+CsKgIMKgIMKgIMKgIGJpbi9sa3AgcWVtdSAt
ayAmbHQ7YnpJbWFnZSZndDsgLW0gbW9kdWxlcy5jZ3ogam9iLXNjcmlwdCAjIGpvYi1zY3JpcHQg
aXMgYXR0YWNoZWQgaW4gdGhpcyBlbWFpbDxicj4KPGJyPgrCoCDCoCDCoCDCoCAjIGlmIGNvbWUg
YWNyb3NzIGFueSBmYWlsdXJlIHRoYXQgYmxvY2tzIHRoZSB0ZXN0LDxicj4KwqAgwqAgwqAgwqAg
IyBwbGVhc2UgcmVtb3ZlIH4vLmxrcCBhbmQgL2xrcCBkaXIgdG8gcnVuIGZyb20gYSBjbGVhbiBz
dGF0ZS48YnI+Cjxicj4KPGJyPgo8YnI+Ci0tLTxicj4KMERBWS9MS1ArIFRlc3QgSW5mcmFzdHJ1
Y3R1cmXCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoE9wZW4gU291cmNlIFRlY2hub2xvZ3kg
Q2VudGVyPGJyPgo8YSBocmVmPSJodHRwczovL2xpc3RzLjAxLm9yZy9oeXBlcmtpdHR5L2xpc3Qv
bGtwQGxpc3RzLjAxLm9yZyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6
Ly9saXN0cy4wMS5vcmcvaHlwZXJraXR0eS9saXN0L2xrcEBsaXN0cy4wMS5vcmc8L2E+wqAgwqAg
wqAgwqBJbnRlbCBDb3Jwb3JhdGlvbjxicj4KPGJyPgpUaGFua3MsPGJyPgpPbGl2ZXIgU2FuZzxi
cj4KPGJyPgo8L2Jsb2NrcXVvdGU+PC9kaXY+PC9kaXY+Cg==

--===============5122029970661335171==--

