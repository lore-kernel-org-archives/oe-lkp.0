Content-Type: multipart/mixed; boundary="===============6905521996682318730=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [x86] 45fc8757d1: BUG:unable_to_handle_kernel
Date: Fri, 17 Mar 2017 10:49:47 -0700
Message-ID: <CA+55aFwx5D1hSaW6ac3D=30cY7=2i4cPmGn9zB-1a8ywpau3cw@mail.gmail.com>
In-Reply-To: <20170317115924.GA82960@inn.lkp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6905521996682318730==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 17, 2017 at 4:59 AM, kernel test robot
<xiaolong.ye@intel.com> wrote:
>
> FYI, we noticed the following commit:
>
> commit: 45fc8757d1d2128e342b4e7ef39adedf7752faac ("x86: Make the GDT rema=
pping read-only on 64-bit")
> https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git x86/mm
>
> in testcase: boot
>
> [    4.347219] BUG: unable to handle kernel paging request at ffffffffff5=
77060
> [    4.360480] Oops: 0003 [#1] SMP
> [    4.373550] RIP: 0023:0xf77e91ed
> [    4.375284] RSP: 002b:00000000ffed034c EFLAGS: 00010246

Heh. That's actually in user space, but the error code (0003) means
"protection fault on a write, not a user access".

So it's almost certainly something that tries to access a segment
descriptor in the GDT, but that segment was marked as "not accessed",
and the CPU was trying to set the accessed bit.

I *thought* we always maked everything accessed when we initialize it,
but something clearly is not.

That's why there's no kernel call trace or anything like that: it is a
system page fault, but it's triggered directly from user mode.

The linear address can be used to look up which entry it is. I assume
the GDT starts at ffffffffff577000, and that this is at offset 0x60
from that. Whatever descriptor that would be..

             Linus

--===============6905521996682318730==--

