Content-Type: multipart/mixed; boundary="===============2671690517747290405=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [fs/lock] 0064b3d9f9: BUG:kernel_NULL_pointer_dereference, address
Date: Fri, 29 Jul 2022 13:29:50 +0800
Message-ID: <YuNwTtT9gWLdUZiF@xsang-OptiPlex-9020>
In-Reply-To: <7614df1720c5cd5b35fc18d14114d1aba2144f98.camel@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============2671690517747290405==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Jeff, and all,

we should say Sorry that, after more checks, we confirmed this report is a
false positive.
the initial investigation points out it could be caused by the way we use
clang. we will do more study and send report to clang team if necessary.

please just ignore this report. thanks

On Tue, Jul 26, 2022 at 09:55:31AM -0400, Jeff Layton wrote:
> (cc'ing dri-devel)
> =

> This looks like it died down in the DRM code. It seems doubtful that the
> flock code would be affecting this, but let me know if I'm incorrect
> here.
> =

> Thanks,
> Jeff
> =

> On Tue, 2022-07-26 at 21:14 +0800, kernel test robot wrote:
> > Greeting,
> > =

> > FYI, we noticed the following commit (built with clang-15):
> > =

> > commit: 0064b3d9f96f3dc466e44a6fc716910cea56dbbf ("fs/lock: Rearrange o=
ps in flock syscall.")
> > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> > =

> > in testcase: boot
> > =

> > on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -=
m 4G
> > =

> > caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):
> > =

> > =

> > =

> > If you fix the issue, kindly add following tag
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> > =

> > =

> > [    3.564403][    T1] BUG: kernel NULL pointer dereference, address: 0=
0000b2c
> > [    3.565351][    T1] #PF: supervisor read access in kernel mode
> > [    3.565351][    T1] #PF: error_code(0x0000) - not-present page
> > [    3.565351][    T1] *pde =3D 00000000
> > [    3.565351][    T1] Oops: 0000 [#1]
> > [    3.565351][    T1] CPU: 0 PID: 1 Comm: swapper Tainted: G          =
      T 5.19.0-rc6-00004-g0064b3d9f96f #1
> > [    3.565351][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, =
1996), BIOS 1.16.0-debian-1.16.0-4 04/01/2014
> > [ 3.565351][ T1] EIP: drm_atomic_helper_setup_commit (??:?) =

> > [ 3.565351][ T1] Code: 45 ec eb b5 89 d8 83 c4 0c 5e 5f 5b 5d 31 c9 31 =
d2 c3 90 90 90 90 90 90 90 55 89 e5 53 57 56 83 ec 38 89 55 d4 89 c2 8b 40 =
04 <8b> 88 2c 07 00 00 89 4d c4 83 b8 30 05 00 00 00 89 55 ec 0f 8e fa
> > All code
> > =3D=3D=3D=3D=3D=3D=3D=3D
> >    0:	45 ec                	rex.RB in (%dx),%al
> >    2:	eb b5                	jmp    0xffffffffffffffb9
> >    4:	89 d8                	mov    %ebx,%eax
> >    6:	83 c4 0c             	add    $0xc,%esp
> >    9:	5e                   	pop    %rsi
> >    a:	5f                   	pop    %rdi
> >    b:	5b                   	pop    %rbx
> >    c:	5d                   	pop    %rbp
> >    d:	31 c9                	xor    %ecx,%ecx
> >    f:	31 d2                	xor    %edx,%edx
> >   11:	c3                   	retq   =

> >   12:	90                   	nop
> >   13:	90                   	nop
> >   14:	90                   	nop
> >   15:	90                   	nop
> >   16:	90                   	nop
> >   17:	90                   	nop
> >   18:	90                   	nop
> >   19:	55                   	push   %rbp
> >   1a:	89 e5                	mov    %esp,%ebp
> >   1c:	53                   	push   %rbx
> >   1d:	57                   	push   %rdi
> >   1e:	56                   	push   %rsi
> >   1f:	83 ec 38             	sub    $0x38,%esp
> >   22:	89 55 d4             	mov    %edx,-0x2c(%rbp)
> >   25:	89 c2                	mov    %eax,%edx
> >   27:	8b 40 04             	mov    0x4(%rax),%eax
> >   2a:*	8b 88 2c 07 00 00    	mov    0x72c(%rax),%ecx		<-- trapping inst=
ruction
> >   30:	89 4d c4             	mov    %ecx,-0x3c(%rbp)
> >   33:	83 b8 30 05 00 00 00 	cmpl   $0x0,0x530(%rax)
> >   3a:	89 55 ec             	mov    %edx,-0x14(%rbp)
> >   3d:	0f                   	.byte 0xf
> >   3e:	8e fa                	mov    %edx,%?
> > =

> > Code starting with the faulting instruction
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >    0:	8b 88 2c 07 00 00    	mov    0x72c(%rax),%ecx
> >    6:	89 4d c4             	mov    %ecx,-0x3c(%rbp)
> >    9:	83 b8 30 05 00 00 00 	cmpl   $0x0,0x530(%rax)
> >   10:	89 55 ec             	mov    %edx,-0x14(%rbp)
> >   13:	0f                   	.byte 0xf
> >   14:	8e fa                	mov    %edx,%?
> > [    3.565351][    T1] EAX: 00000400 EBX: 401ebc64 ECX: 414f8750 EDX: 4=
01ebc64
> > [    3.565351][    T1] ESI: 401ebc64 EDI: 414f8750 EBP: 401ebbc8 ESP: 4=
01ebb84
> > [    3.565351][    T1] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFL=
AGS: 00010206
> > [    3.565351][    T1] CR0: 80050033 CR2: 00000b2c CR3: 02e5b000 CR4: 0=
00406d0
> > [    3.565351][    T1] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 0=
0000000
> > [    3.565351][    T1] DR6: fffe0ff0 DR7: 00000400
> > [    3.565351][    T1] Call Trace:
> > [ 3.565351][ T1] ? __lock_acquire (lockdep.c:?) =

> > [ 3.565351][ T1] ? drm_atomic_helper_async_commit (??:?) =

> > [ 3.565351][ T1] ? drm_atomic_helper_commit (??:?) =

> > [ 3.565351][ T1] ? drm_get_format_info (??:?) =

> > [ 3.565351][ T1] ? drm_internal_framebuffer_create (??:?) =

> > [ 3.565351][ T1] ? lock_is_held_type (??:?) =

> > [ 3.565351][ T1] ? drm_mode_addfb2 (??:?) =

> > [ 3.565351][ T1] ? sched_clock (??:?) =

> > [ 3.565351][ T1] ? drm_mode_addfb (??:?) =

> > [ 3.565351][ T1] ? drm_client_framebuffer_create (??:?) =

> > [ 3.565351][ T1] ? drm_fb_helper_generic_probe (drm_fb_helper.c:?) =

> > [ 3.565351][ T1] ? __drm_fb_helper_initial_config_and_unlock (drm_fb_he=
lper.c:?) =

> > [ 3.565351][ T1] ? drm_fbdev_client_hotplug (drm_fb_helper.c:?) =

> > [ 3.565351][ T1] ? drm_fbdev_generic_setup (??:?) =

> > [ 3.565351][ T1] ? vkms_init (vkms_drv.c:?) =

> > [ 3.565351][ T1] ? drm_sched_fence_slab_init (vkms_drv.c:?) =

> > [ 3.565351][ T1] ? do_one_initcall (??:?) =

> > [ 3.565351][ T1] ? drm_sched_fence_slab_init (vkms_drv.c:?) =

> > [ 3.565351][ T1] ? tick_program_event (??:?) =

> > [ 3.565351][ T1] ? error_context (??:?) =

> > [ 3.565351][ T1] ? trace_hardirqs_on (??:?) =

> > [ 3.565351][ T1] ? irqentry_exit (??:?) =

> > [ 3.565351][ T1] ? sysvec_apic_timer_interrupt (??:?) =

> > [ 3.565351][ T1] ? handle_exception (init_task.c:?) =

> > [ 3.565351][ T1] ? parse_args (??:?) =

> > [ 3.565351][ T1] ? error_context (??:?) =

> > [ 3.565351][ T1] ? parse_args (??:?) =

> > [ 3.565351][ T1] ? do_initcall_level (main.c:?) =

> > [ 3.565351][ T1] ? rest_init (main.c:?) =

> > [ 3.565351][ T1] ? do_initcalls (main.c:?) =

> > [ 3.565351][ T1] ? do_basic_setup (main.c:?) =

> > [ 3.565351][ T1] ? kernel_init_freeable (main.c:?) =

> > [ 3.565351][ T1] ? kernel_init (main.c:?) =

> > [ 3.565351][ T1] ? ret_from_fork (??:?) =

> > [    3.565351][    T1] Modules linked in:
> > [    3.565351][    T1] CR2: 0000000000000b2c
> > [    3.565351][    T1] ---[ end trace 0000000000000000 ]---
> > [ 3.565351][ T1] EIP: drm_atomic_helper_setup_commit (??:?) =

> > [ 3.565351][ T1] Code: 45 ec eb b5 89 d8 83 c4 0c 5e 5f 5b 5d 31 c9 31 =
d2 c3 90 90 90 90 90 90 90 55 89 e5 53 57 56 83 ec 38 89 55 d4 89 c2 8b 40 =
04 <8b> 88 2c 07 00 00 89 4d c4 83 b8 30 05 00 00 00 89 55 ec 0f 8e fa
> > All code
> > =3D=3D=3D=3D=3D=3D=3D=3D
> >    0:	45 ec                	rex.RB in (%dx),%al
> >    2:	eb b5                	jmp    0xffffffffffffffb9
> >    4:	89 d8                	mov    %ebx,%eax
> >    6:	83 c4 0c             	add    $0xc,%esp
> >    9:	5e                   	pop    %rsi
> >    a:	5f                   	pop    %rdi
> >    b:	5b                   	pop    %rbx
> >    c:	5d                   	pop    %rbp
> >    d:	31 c9                	xor    %ecx,%ecx
> >    f:	31 d2                	xor    %edx,%edx
> >   11:	c3                   	retq   =

> >   12:	90                   	nop
> >   13:	90                   	nop
> >   14:	90                   	nop
> >   15:	90                   	nop
> >   16:	90                   	nop
> >   17:	90                   	nop
> >   18:	90                   	nop
> >   19:	55                   	push   %rbp
> >   1a:	89 e5                	mov    %esp,%ebp
> >   1c:	53                   	push   %rbx
> >   1d:	57                   	push   %rdi
> >   1e:	56                   	push   %rsi
> >   1f:	83 ec 38             	sub    $0x38,%esp
> >   22:	89 55 d4             	mov    %edx,-0x2c(%rbp)
> >   25:	89 c2                	mov    %eax,%edx
> >   27:	8b 40 04             	mov    0x4(%rax),%eax
> >   2a:*	8b 88 2c 07 00 00    	mov    0x72c(%rax),%ecx		<-- trapping inst=
ruction
> >   30:	89 4d c4             	mov    %ecx,-0x3c(%rbp)
> >   33:	83 b8 30 05 00 00 00 	cmpl   $0x0,0x530(%rax)
> >   3a:	89 55 ec             	mov    %edx,-0x14(%rbp)
> >   3d:	0f                   	.byte 0xf
> >   3e:	8e fa                	mov    %edx,%?
> > =

> > Code starting with the faulting instruction
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >    0:	8b 88 2c 07 00 00    	mov    0x72c(%rax),%ecx
> >    6:	89 4d c4             	mov    %ecx,-0x3c(%rbp)
> >    9:	83 b8 30 05 00 00 00 	cmpl   $0x0,0x530(%rax)
> >   10:	89 55 ec             	mov    %edx,-0x14(%rbp)
> >   13:	0f                   	.byte 0xf
> >   14:	8e fa                	mov    %edx,%?
> > =

> > =

> > To reproduce:
> > =

> >         # build kernel
> > 	cd linux
> > 	cp config-5.19.0-rc6-00004-g0064b3d9f96f .config
> > 	make HOSTCC=3Dclang-15 CC=3Dclang-15 ARCH=3Di386 olddefconfig prepare =
modules_prepare bzImage modules
> > 	make HOSTCC=3Dclang-15 CC=3Dclang-15 ARCH=3Di386 INSTALL_MOD_PATH=3D<m=
od-install-dir> modules_install
> > 	cd <mod-install-dir>
> > 	find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz
> > =

> > =

> >         git clone https://github.com/intel/lkp-tests.git
> >         cd lkp-tests
> >         bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-scrip=
t is attached in this email
> > =

> >         # if come across any failure that blocks the test,
> >         # please remove ~/.lkp and /lkp dir to run from a clean state.
> > =

> > =

> > =

> =

> -- =

> Jeff Layton <jlayton@kernel.org>
--===============2671690517747290405==--

