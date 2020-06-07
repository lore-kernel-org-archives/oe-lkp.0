Content-Type: multipart/mixed; boundary="===============4033471714472170401=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [x86] 24256c140e: dmesg.UBSAN:array-index-out-of-bounds_in_arch/x86/mm/dump_pagetables.c
Date: Sun, 07 Jun 2020 16:49:35 -0700
Message-ID: <20200607164935.6df93a6018389f2ed995b26c@linux-foundation.org>
In-Reply-To: <20200607072749.GW12456@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============4033471714472170401==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, 7 Jun 2020 15:27:49 +0800 kernel test robot <rong.a.chen@intel.co=
m> wrote:

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 24256c140e59c3431af4918fd4ec892102cbc2f3 ("x86: mm: ptdump: calcu=
late effective permissions correctly")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =

> in testcase: boot
> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 8G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <rong.a.chen@intel.com>
> =

> =

> [    8.785395] UBSAN: array-index-out-of-bounds in arch/x86/mm/dump_paget=
ables.c:285:27
> [    8.787718] index -1 is out of range for type 'pgprotval_t [5]'
> [    8.789278] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.7.0-rc7-00027-=
g24256c140e59c #1
> [    8.791350] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.12.0-1 04/01/2014
> [    8.793505] Call Trace:
> [    8.794221]  dump_stack+0x6c/0x94
> [    8.795140]  ubsan_epilogue+0x8/0x3e
> [    8.796132]  __ubsan_handle_out_of_bounds+0x48/0x53
> [    8.797362]  ? is_visible+0x2b/0x32
> [    8.798231]  ? atomic_try_cmpxchg+0x4c/0x57
> [    8.799203]  note_page+0x37/0x80b
> [    8.800138]  ? __up_read+0x352/0x37b
> [    8.801124]  ptdump_walk_pgd+0x57/0x60
> [    8.802145]  ptdump_walk_pgd_level_core+0x72/0x9f
> [    8.803369]  ? ptdump_walk_pgd_level_debugfs+0x18/0x18
> [    8.804613]  ? ptdump_walk_pgd_level_core+0x9f/0x9f
> [    8.805779]  ptdump_walk_pgd_level_checkwx+0x1d/0x21
> [    8.806873]  mark_rodata_ro+0x9f/0xa6
> [    8.807821]  ? rest_init+0x7f/0x164
> [    8.808808]  kernel_init+0x44/0xf7
> [    8.809735]  ? rest_init+0x164/0x164
> [    8.810708]  ret_from_fork+0x19/0x24

Yup, thanks, the new note_page() doesn't handle level=3D=3D-1, which is
"unknown" according to the comment in include/linux/ptdump.h.

Steven, could you please take a look?
--===============4033471714472170401==--

