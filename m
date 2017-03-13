Content-Type: multipart/mixed; boundary="===============1589732340658077843=="
MIME-Version: 1.0
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
To: lkp@lists.01.org
Subject: Re: [mm/kasan] BUG: KASAN: slab-out-of-bounds in inotify_read at addr ffff88001539780c
Date: Mon, 13 Mar 2017 17:51:46 +0300
Message-ID: <899f0c39-81b5-5d02-5ced-937884d22c89@gmail.com>
In-Reply-To: <20170311135436.hh2pvivpiadkgdkr@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1589732340658077843==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 03/11/2017 04:54 PM, Fengguang Wu wrote:
> Hi Alexander,
> =

> FYI, here is another bisect result.
> =


Also wrong for the same reason as before.

> [   22.974867] debug: unmapping init [mem 0xffff8800023f5000-0xffff880002=
3fffff]
> [   40.729584] x86/mm: Checked W+X mappings: passed, no W+X pages found.
> [   40.743879] random: init: uninitialized urandom read (12 bytes read)
> [   40.754136] hostname (177) used greatest stack depth: 29632 bytes left
> [   40.791170] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   40.792751] BUG: KASAN: slab-out-of-bounds in inotify_read+0x1ac/0x2c6=
 at addr ffff88001539780c
> [   40.794614] Read of size 5 by task init/1

This is false-positive. According to dmesg this kernel was built with "gcc =
version 4.6.4 (Debian 4.6.4-7)".
As we recently discovered here - http://lkml.kernel.org/r/<1eb0b1ba-3847-9b=
dc-8f4a-adcd34de3486@gmail.com>
some old gcc versions such as 4.7.4 and now apparently 4.6.4 as well cause =
false-positives reports.
I'm guessing that old gcc miss-compile something in check_memory_region().

Given that kasan is fully supported only since gcc 5, could you teach the b=
ot use only supported gcc =

for the runtime testing with kasan?

> [   40.795491] CPU: 0 PID: 1 Comm: init Not tainted 4.7.0-05999-g80a9201 =
#1
> [   40.796933] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.9.3-20161025_171302-gandalf 04/01/2014
> [   40.798606]  ffffed0002a72f02 ffff88000004fcb8 ffffffff813fbc56 ffff88=
000004fd48
> [   40.799906]  ffffffff81125e14 ffff880000000000 ffff880000041300 000000=
0000000246
> [   40.801214]  0000000000000282 ffff880011331b00 0000000000000010 000000=
0000000246
> [   40.802505] Call Trace:
> [   40.802934]  [<ffffffff813fbc56>] dump_stack+0x19/0x1b
> [   40.803791]  [<ffffffff81125e14>] kasan_report+0x316/0x552
> [   40.804670]  [<ffffffff81124ca6>] check_memory_region+0x10b/0x10d
> [   40.805674]  [<ffffffff81124d7b>] kasan_check_read+0x11/0x13
> [   40.806623]  [<ffffffff81171647>] inotify_read+0x1ac/0x2c6
> [   40.807535]  [<ffffffff8108cda1>] ? wait_woken+0x76/0x76
> [   40.808425]  [<ffffffff811382b0>] __vfs_read+0x23/0xe3
> [   40.809270]  [<ffffffff813a372f>] ? security_file_permission+0x93/0x9c
> [   40.810351]  [<ffffffff81138406>] vfs_read+0x96/0x102
> [   40.811181]  [<ffffffff811387cb>] SyS_read+0x4e/0x94
> [   40.812010]  [<ffffffff81d379bd>] entry_SYSCALL_64_fastpath+0x23/0xc1
> [   40.813058] Object at ffff8800153977e0, in cache kmalloc-64
> [   40.813979] Object allocated with size 54 bytes.
> [   40.814697] Allocation:
> [   40.815123] PID =3D 189
> [   40.815514]  [<ffffffff81010c9f>] save_stack_trace+0x27/0x45
> [   40.816473]  [<ffffffff8112530e>] kasan_kmalloc+0xe5/0x16c
> [   40.817399]  [<ffffffff81123d1d>] __kmalloc+0x16c/0x17e
> [   40.818289]  [<ffffffff8117106e>] inotify_handle_event+0x80/0x10e
> [   40.819323]  [<ffffffff8116f8b0>] fsnotify+0x3c5/0x4f4
> [   40.820200]  [<ffffffff81145c5b>] vfs_link+0x1d8/0x210
> [   40.821070]  [<ffffffff81145dfb>] SyS_linkat+0x168/0x22c
> [   40.821981]  [<ffffffff81145ed8>] SyS_link+0x19/0x1b
> [   40.822805]  [<ffffffff81d379bd>] entry_SYSCALL_64_fastpath+0x23/0xc1
> [   40.823902] Memory state around the buggy address:
> [   40.824664]  ffff880015397700: fc fc fc fc 00 00 00 00 00 00 00 fc fc =
fc fc fc
> =

>                                                           # HH:MM RESULT =
GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD


--===============1589732340658077843==--

