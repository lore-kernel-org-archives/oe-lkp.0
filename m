Content-Type: multipart/mixed; boundary="===============7247461408117429512=="
MIME-Version: 1.0
From: Nathan Chancellor <nathan@kernel.org>
To: lkp@lists.01.org
Subject: Re: [mm] d88f8edb09: dmesg.Kernel_panic-not_syncing:Fatal_exception
Date: Thu, 01 Sep 2022 12:28:40 -0700
Message-ID: <YxEH6BbPa5VJYGiD@dev-arch.thelio-3990X>
In-Reply-To: <35fb81bd-6020-f256-27cc-c2787b4dd9ef@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7247461408117429512==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Yujie,

On Thu, Sep 01, 2022 at 05:04:03PM +0800, Yujie Liu wrote:
> On 8/25/2022 12:18, Yu Zhao wrote:
> > On Wed, Aug 24, 2022 at 7:55 PM kernel test robot <yujie.liu@intel.co=
m> wrote:
> > > =

> > > Greeting,
> > > =

> > > FYI, we noticed the following commit (built with clang-16):
> > > =

> > > commit: d88f8edb095214f8c36eeec6b89cebcfcbe3ea62 ("mm: multi-gen LRU:=
 optimize multiple memcgs")
> > > https://github.com/steev/linux lenovo-x13s-5.19.0
> > > =

> > > in testcase: boot
> > > =

> > > on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp=
 2 -m 16G
> > > =

> > > caused below changes (please refer to attached dmesg/kmsg for entire =
log/backtrace):
> > > =

> > > =

> > > [    5.440406][    T1] general protection fault, probably for non-can=
onical address 0xe686464b00000166: 0000 [#1] KASAN PTI
> > > [    5.441841][    T1] KASAN: maybe wild-memory-access in range [0x34=
32525800000b30-0x3432525800000b37]
> > > [    5.443045][    T1] CPU: 0 PID: 1 Comm: swapper Tainted: G        =
        T 5.19.0-00144-gd88f8edb0952 #1
> > > [    5.443471][    T1] RIP: 0010:drm_atomic_helper_check_modeset+0x59=
/0x2c80
> > > [    5.443471][    T1] Code: 03 48 89 85 20 ff ff ff 42 80 3c 20 00 7=
4 08 4c 89 f7 e8 7a a0 b6 fe 48 89 5d a8 bb 30 08 00 00 49 03 1e 48 89 d8 4=
8 c1 e8 03 <42> 0f b6 04 20 84 c0 0f 85 b6 2a 00 00 83 3b 00 4c 89 b5 58 ff=
 ff
> > > [    5.443471][    T1] RSP: 0018:ffffc9000001f580 EFLAGS: 00010206
> > > [    5.443471][    T1] RAX: 06864a4b00000166 RBX: 3432525800000b30 RC=
X: ffffc9000001f890
> > > [    5.443471][    T1] RDX: dffffc0000000000 RSI: ffffc9000001f888 RD=
I: ffffc9000001f888
> > > [    5.443471][    T1] RBP: ffffc9000001f6c0 R08: ffff88811d82c800 R0=
9: ffffc9000001f898
> > > [    5.443471][    T1] R10: ffffc9000001f88c R11: ffffffff82b8a800 R1=
2: dffffc0000000000
> > > [    5.443471][    T1] R13: 1ffff92000003f13 R14: ffffc9000001f890 R1=
5: 0000000000000014
> > > [    5.443471][    T1] FS:  0000000000000000(0000) GS:ffffffff880c600=
0(0000) knlGS:0000000000000000
> > > [    5.443471][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050=
033
> > > [    5.443471][    T1] CR2: 00007f6aae86f480 CR3: 0000000008036000 CR=
4: 00000000000406f0
> > > [    5.443471][    T1] DR0: 0000000000000000 DR1: 0000000000000000 DR=
2: 0000000000000000
> > > [    5.443471][    T1] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR=
7: 0000000000000400
> > > [    5.443471][    T1] Call Trace:
> > > [    5.443471][    T1]  <TASK>
> > > [    5.443471][    T1]  ? validate_chain+0x1379/0x5b80
> > > [    5.443471][    T1]  drm_atomic_helper_check+0x18/0x100
> > > [    5.443471][    T1]  drm_get_format_info+0x67/0x180
> > > [    5.443471][    T1]  drm_internal_framebuffer_create+0x280/0x19c0
> > > [    5.443471][    T1]  drm_mode_addfb2+0x9b/0x300
> > > [    5.443471][    T1]  drm_mode_addfb+0x25d/0x580
> > > [    5.443471][    T1]  drm_client_framebuffer_create+0x412/0x8c0
> > > [    5.443471][    T1]  drm_fb_helper_generic_probe+0x191/0x980
> > > [    5.443471][    T1]  ? __kasan_check_write+0x14/0x40
> > > [    5.443471][    T1]  ? __mutex_unlock_slowpath+0x1d7/0x740
> > > [    5.443471][    T1]  __drm_fb_helper_initial_config_and_unlock+0x1=
159/0x1b80
> > > [    5.443471][    T1]  drm_fbdev_client_hotplug+0x547/0x740
> > > [    5.443471][    T1]  drm_fbdev_generic_setup+0x13b/0x3c0
> > > [    5.443471][    T1]  vkms_init+0x4b6/0x640
> > > [    5.443471][    T1]  ? vgem_init+0x240/0x240
> > > [    5.443471][    T1]  do_one_initcall+0x16d/0x440
> > > [    5.443471][    T1]  ? vgem_init+0x240/0x240
> > > [    5.443471][    T1]  do_initcall_level+0x1a3/0x280
> > > [    5.443471][    T1]  do_initcalls+0x4b/0x80
> > > [    5.443471][    T1]  do_basic_setup+0x69/0x80
> > > [    5.443471][    T1]  kernel_init_freeable+0xe2/0x180
> > > [    5.443471][    T1]  ? rest_init+0x140/0x140
> > > [    5.443471][    T1]  kernel_init+0x18/0x1c0
> > > [    5.443471][    T1]  ? rest_init+0x140/0x140
> > > [    5.443471][    T1]  ret_from_fork+0x22/0x30
> > > [    5.443471][    T1]  </TASK>
> > > [    5.443471][    T1] Modules linked in:
> > > [    5.476918][    T1] ---[ end trace 0000000000000000 ]---
> > > [    5.477623][    T1] RIP: 0010:drm_atomic_helper_check_modeset+0x59=
/0x2c80
> > > [    5.478507][    T1] Code: 03 48 89 85 20 ff ff ff 42 80 3c 20 00 7=
4 08 4c 89 f7 e8 7a a0 b6 fe 48 89 5d a8 bb 30 08 00 00 49 03 1e 48 89 d8 4=
8 c1 e8 03 <42> 0f b6 04 20 84 c0 0f 85 b6 2a 00 00 83 3b 00 4c 89 b5 58 ff=
 ff
> > > [    5.481043][    T1] RSP: 0018:ffffc9000001f580 EFLAGS: 00010206
> > > [    5.481851][    T1] RAX: 06864a4b00000166 RBX: 3432525800000b30 RC=
X: ffffc9000001f890
> > > [    5.482887][    T1] RDX: dffffc0000000000 RSI: ffffc9000001f888 RD=
I: ffffc9000001f888
> > > [    5.483950][    T1] RBP: ffffc9000001f6c0 R08: ffff88811d82c800 R0=
9: ffffc9000001f898
> > > [    5.484993][    T1] R10: ffffc9000001f88c R11: ffffffff82b8a800 R1=
2: dffffc0000000000
> > > [    5.486020][    T1] R13: 1ffff92000003f13 R14: ffffc9000001f890 R1=
5: 0000000000000014
> > > [    5.487054][    T1] FS:  0000000000000000(0000) GS:ffffffff880c600=
0(0000) knlGS:0000000000000000
> > > [    5.488258][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050=
033
> > > [    5.489116][    T1] CR2: 00007f6aae86f480 CR3: 0000000008036000 CR=
4: 00000000000406f0
> > > [    5.490109][    T1] DR0: 0000000000000000 DR1: 0000000000000000 DR=
2: 0000000000000000
> > > [    5.491150][    T1] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR=
7: 0000000000000400
> > > [    5.492241][    T1] Kernel panic - not syncing: Fatal exception
> > > [    5.493037][    T1] Kernel Offset: disabled
> > > =

> > > =

> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > tbox_group/testcase/rootfs/kconfig/compiler/sleep:
> > >       vm-snb/boot/yocto-x86_64-minimal-20190520.cgz/x86_64-randconfig=
-a003-20220801/clang-16/1
> > > =

> > > commit:
> > >       fe2bb20302a87cfeda355e4be3cc3029478a5214
> > >       d88f8edb095214f8c36eeec6b89cebcfcbe3ea62
> > > =

> > > fe2bb20302a87cfe d88f8edb095214f8c36eeec6b89
> > > ---------------- ---------------------------
> > >            fail:runs  %reproduction    fail:runs
> > >                |             |             |
> > >                :30         133%          40:40    dmesg.Kernel_panic-=
not_syncing:Fatal_exception
> > >                :30         133%          40:40    dmesg.RIP:drm_atomi=
c_helper_check_modeset
> > > =

> > > =

> > > The kconfig of this boot test has "# CONFIG_LRU_GEN is not set"
> > =

> > This means the aforementioned commit was not built at all. So it
> > shouldn't cause the crash.
> > =

> > > We also tried to enable CONFIG_LRU_GEN and re-test it, then boot is s=
uccessful.
> > =

> > Nor should it fix the crash.
> > =

> > > https://github.com/steev/linux lenovo-x13s-5.19.0
> > =

> > This tree has other patches. In case you want to make sure MGLRU has
> > nothing to do with the crash, please try the patchset on top of the
> > official 5.19.0 and try again.
> =

> Hi Yu,
> =

> Sorry for this wrong report. The crash has no relation with the patch sin=
ce LRU_GEN
> is not enabled at all. This looks like a tricky issue related with clang =
compiler,
> so let me add llvm folks.
> =

> Hi Nathan, Hi Nick,
> =

> For this case, we build the kernels under completely same environment for=
 twice
> (kernel commit: d88f8edb09, llvm commit: c55b41d519, kconfig attached), o=
ne of them
> works well, but the other fails to boot. Could you please help to look at=
 this issue?
> If required, we can provide more details for further analysis.
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> commit/compiler/kconfig/testcase:
>   d88f8edb095214f8c36eeec6b89cebcfcbe3ea62/clang-16/x86_64-randconfig-a00=
3-20220801/boot
> =

> debug-setup:
>   clang-16-c55b41d519-0
>   clang-16-c55b41d519-1
> =

> clang-16-c55b41d519-0      clang-16-c55b41d519-1
> ---------------- ---------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>          20:20        -100%            :20    last_state.booting
>          20:20        -100%            :20    last_state.is_incomplete_run
>          20:20        -100%            :20    dmesg.BUG:KASAN:vmalloc-out=
-of-bounds_in_drm_vram_helper_mode_valid
>          20:20        -100%            :20    dmesg.BUG:unable_to_handle_=
page_fault_for_address
>          20:20        -100%            :20    dmesg.Kernel_panic-not_sync=
ing:Fatal_exception
>          20:20        -100%            :20    dmesg.Oops:#[##]
>          20:20        -100%            :20    dmesg.RIP:drm_vram_helper_m=
ode_valid

I am running into a similar issue of only being able to reproduce a
crash sporadically at the same commit with the same configuration,
although my version of LLVM is slightly newer (c7511b4ecf45c17). I will
continue to try and reproduce this consistently to continue
investigating, although I do need to move on to other things today. I
wonder if this is a recent LLVM regression...

For what it's worth, the last crash I did get was similar but not the
exact same as the one you noticed:

[    0.807218][    T1] general protection fault, probably for non-canonical=
 address 0xe686464b000001d7: 0000 [#1] KASAN NOPTI
[    0.808207][    T1] KASAN: maybe wild-memory-access in range [0x34325258=
00000eb8-0x3432525800000ebf]
[    0.808551][    T1] CPU: 0 PID: 1 Comm: swapper Tainted: G              =
  T 5.19.0-00144-gd88f8edb0952 #1
[    0.808551][    T1] RIP: 0010:drm_atomic_helper_setup_commit+0x58/0x1140
[    0.808551][    T1] Code: e8 03 48 89 85 70 ff ff ff 42 80 3c 28 00 74 0=
8 4c 89 e7 e8 3a c9 b5 fe 49 8b 1c 24 48 8d bb b8 0b 00 00 48 89 f8 48 c1 e=
8 03 <42> 80 3c 28 00 74 05 e8 1c c9 b5 fe 48 8b 83 b8 0b 00 00 48 89 85
[    0.808551][    T1] RSP: 0018:ffffc9000001f5d0 EFLAGS: 00010216
[    0.808551][    T1] RAX: 06864a4b000001d7 RBX: 3432525800000300 RCX: dff=
ffc0000000000
[    0.808551][    T1] RDX: dffffc0000000000 RSI: 0000000000000000 RDI: 343=
2525800000eb8
[    0.808551][    T1] RBP: ffffc9000001f690 R08: ffff88800d788800 R09: fff=
fc9000001f898
[    0.808551][    T1] R10: ffffc9000001f88c R11: ffffffff82b92040 R12: fff=
fc9000001f890
[    0.808551][    T1] R13: dffffc0000000000 R14: ffffc9000001f888 R15: 000=
0000000000014
[    0.808551][    T1] FS:  0000000000000000(0000) GS:ffffffff880c6000(0000=
) knlGS:0000000000000000
[    0.808551][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    0.808551][    T1] CR2: 00005576db60448f CR3: 0000000008036000 CR4: 000=
00000003506b0
[    0.808551][    T1] Call Trace:
[    0.808551][    T1]  <TASK>
[    0.808551][    T1]  drm_atomic_helper_commit+0x50/0x6c0
[    0.808551][    T1]  drm_get_format_info+0x67/0x180
[    0.808551][    T1]  drm_internal_framebuffer_create+0x280/0x19c0
[    0.808551][    T1]  drm_mode_addfb2+0x9b/0x300
[    0.808551][    T1]  drm_mode_addfb+0x25d/0x580
[    0.808551][    T1]  drm_client_framebuffer_create+0x412/0x8c0
[    0.808551][    T1]  drm_fb_helper_generic_probe+0x191/0x980
[    0.808551][    T1]  ? __kasan_check_write+0x14/0x40
[    0.808551][    T1]  ? __mutex_unlock_slowpath+0x1d7/0x740
[    0.808551][    T1]  __drm_fb_helper_initial_config_and_unlock+0x1159/0x=
1b80
[    0.808551][    T1]  drm_fbdev_client_hotplug+0x547/0x740
[    0.808551][    T1]  drm_fbdev_generic_setup+0x13b/0x3c0
[    0.808551][    T1]  vkms_init+0x4b6/0x640
[    0.808551][    T1]  ? vgem_init+0x240/0x240
[    0.808551][    T1]  do_one_initcall+0x16d/0x440
[    0.808551][    T1]  ? vgem_init+0x240/0x240
[    0.808551][    T1]  do_initcall_level+0x1a3/0x280
[    0.808551][    T1]  do_initcalls+0x4b/0x80
[    0.808551][    T1]  do_basic_setup+0x69/0x80
[    0.808551][    T1]  kernel_init_freeable+0xe2/0x180
[    0.808551][    T1]  ? rest_init+0x140/0x140
[    0.808551][    T1]  kernel_init+0x18/0x1c0
[    0.808551][    T1]  ? rest_init+0x140/0x140
[    0.808551][    T1]  ret_from_fork+0x22/0x30
[    0.808551][    T1]  </TASK>
[    0.808551][    T1] Modules linked in:
[    0.828450][    T1] ---[ end trace 0000000000000000 ]---
[    0.828882][    T1] RIP: 0010:drm_atomic_helper_setup_commit+0x58/0x1140
[    0.829433][    T1] Code: e8 03 48 89 85 70 ff ff ff 42 80 3c 28 00 74 0=
8 4c 89 e7 e8 3a c9 b5 fe 49 8b 1c 24 48 8d bb b8 0b 00 00 48 89 f8 48 c1 e=
8 03 <42> 80 3c 28 00 74 05 e8 1c c9 b5 fe 48 8b 83 b8 0b 00 00 48 89 85
[    0.831048][    T1] RSP: 0018:ffffc9000001f5d0 EFLAGS: 00010216
[    0.831541][    T1] RAX: 06864a4b000001d7 RBX: 3432525800000300 RCX: dff=
ffc0000000000
[    0.832177][    T1] RDX: dffffc0000000000 RSI: 0000000000000000 RDI: 343=
2525800000eb8
[    0.832827][    T1] RBP: ffffc9000001f690 R08: ffff88800d788800 R09: fff=
fc9000001f898
[    0.833476][    T1] R10: ffffc9000001f88c R11: ffffffff82b92040 R12: fff=
fc9000001f890
[    0.834121][    T1] R13: dffffc0000000000 R14: ffffc9000001f888 R15: 000=
0000000000014
[    0.834765][    T1] FS:  0000000000000000(0000) GS:ffffffff880c6000(0000=
) knlGS:0000000000000000
[    0.835480][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    0.836014][    T1] CR2: 00005576db60448f CR3: 0000000008036000 CR4: 000=
00000003506b0
[    0.836656][    T1] Kernel panic - not syncing: Fatal exception
[    0.837141][    T1] Kernel Offset: disabled
[    0.837492][    T1] ---[ end Kernel panic - not syncing: Fatal exception=
 ]---

Cheers,
Nathan
--===============7247461408117429512==--

