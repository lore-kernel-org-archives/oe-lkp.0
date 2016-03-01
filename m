Content-Type: multipart/mixed; boundary="===============0357354141280579655=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [slab] a1fd55538c: WARNING: CPU: 0 PID: 0 at kernel/locking/lockdep.c:2601 trace_hardirqs_on_caller()
Date: Tue, 01 Mar 2016 10:33:44 -0800
Message-ID: <20160301103344.6f3095a269db284fbe0c3c2c@linux-foundation.org>
In-Reply-To: <56aa2b47.MwdlkrzZ08oDKqh8%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0357354141280579655==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 28 Jan 2016 22:52:55 +0800 kernel test robot <fengguang.wu@intel.=
com> wrote:

> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> =

> commit a1fd55538cae9f411059c9b067a3d48c41aa876b
> Author:     Jesper Dangaard Brouer <brouer@redhat.com>
> AuthorDate: Thu Jan 28 09:47:16 2016 +1100
> Commit:     Stephen Rothwell <sfr@canb.auug.org.au>
> CommitDate: Thu Jan 28 09:47:16 2016 +1100
> =

>     slab: use slab_pre_alloc_hook in SLAB allocator shared with SLUB
>     =

> ...
>
> [    0.000000] ------------[ cut here ]------------
> [    0.000000] WARNING: CPU: 0 PID: 0 at kernel/locking/lockdep.c:2601 tr=
ace_hardirqs_on_caller+0x341/0x380()
> [    0.000000] DEBUG_LOCKS_WARN_ON(unlikely(early_boot_irqs_disabled))
> [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 4.5.0-rc1-00069-ga=
1fd555 #1
> [    0.000000]  ffffffff82403dd8 ffffffff82403d90 ffffffff813b937d ffffff=
ff82403dc8
> [    0.000000]  ffffffff810eb4d3 ffffffff812617cc 0000000000000001 ffff88=
000fcc50a8
> [    0.000000]  ffff8800000984c0 00000000024000c0 ffffffff82403e28 ffffff=
ff810eb5c7
> [    0.000000] Call Trace:
> [    0.000000]  [<ffffffff813b937d>] dump_stack+0x27/0x3a
> [    0.000000]  [<ffffffff810eb4d3>] warn_slowpath_common+0xa3/0x100
> [    0.000000]  [<ffffffff812617cc>] ? cache_alloc_refill+0x7ac/0x910
> [    0.000000]  [<ffffffff810eb5c7>] warn_slowpath_fmt+0x57/0x70
> [    0.000000]  [<ffffffff81143e61>] trace_hardirqs_on_caller+0x341/0x380
> [    0.000000]  [<ffffffff81143ebd>] trace_hardirqs_on+0x1d/0x30
> [    0.000000]  [<ffffffff812617cc>] cache_alloc_refill+0x7ac/0x910
> [    0.000000]  [<ffffffff8121df6a>] ? pcpu_mem_zalloc+0x5a/0xc0
> [    0.000000]  [<ffffffff81261fce>] __kmalloc+0x24e/0x440
> [    0.000000]  [<ffffffff8121df6a>] pcpu_mem_zalloc+0x5a/0xc0
> [    0.000000]  [<ffffffff829213aa>] percpu_init_late+0x4d/0xbb

The next patch
(http://ozlabs.org/~akpm/mmotm/broken-out/slab-use-slab_pre_alloc_hook-in-s=
lab-allocator-shared-with-slub-fix.patch)
should have fixed this?

> [    0.000000]  [<ffffffff828f41c9>] start_kernel+0x30b/0x6e1
> [    0.000000]  [<ffffffff828f3120>] ? early_idt_handler_array+0x120/0x120
> [    0.000000]  [<ffffffff828f332f>] x86_64_start_reservations+0x46/0x4f
> [    0.000000]  [<ffffffff828f34d4>] x86_64_start_kernel+0x19c/0x1b2
> [    0.000000] ---[ end trace cb88537fdc8fa200 ]---
>
> ...

--===============0357354141280579655==--

