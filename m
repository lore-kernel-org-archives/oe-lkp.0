Content-Type: multipart/mixed; boundary="===============6778734176707277468=="
MIME-Version: 1.0
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [printk] c162d5b433: BUG:KASAN:use-after-scope_in_c
Date: Thu, 01 Mar 2018 14:14:26 +0000
Message-ID: <CAKv+Gu8HN-t2om8sCfjxCWbsgSir54fZw222dsed0Xwqph2aNg@mail.gmail.com>
In-Reply-To: <CACT4Y+ZkbkjJw=diHQbqHOBdbcs9zDUS0ggqwrLU02U_tEP73g@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6778734176707277468==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 1 March 2018 at 14:09, Dmitry Vyukov <dvyukov@google.com> wrote:
..
> +Ard, Kees
>
> This is a problem with GCC_PLUGIN_STRUCTLEAK_BYREF_ALL. It inserts an
> initializing write for __u used in READ_ONCE outside of live scope of
> the variable.
> Below "movb   $0x1,0x0(%r13)" and "movb   $0xf8,0x0(%r13)" denote live
> scope of the variable __u (the 0xf8 that appears in the KASAN report).
> But the initializing store at ffffffff811a5f84 (and the corresponding
> KASAN check) are outside of that scope, which causes the KASAN report.
>
>
> ffffffff811a5f61: 49 8d 9f 40 ff ff ff lea    -0xc0(%r15),%rbx
> ffffffff811a5f68: 4d 8d 67 80          lea    -0x80(%r15),%r12
> kernel/printk/printk.c:1600
> waiter =3D READ_ONCE(console_waiter);
> ffffffff811a5f79: 49 89 dd              mov    %rbx,%r13
> ffffffff811a5f7c: e8 d3 4e 21 00        callq  ffffffff813bae54 <__asan_s=
tore1>
> ffffffff811a5f81: 4c 89 e7              mov    %r12,%rdi
> ffffffff811a5f84: 41 c6 87 40 ff ff ff movb   $0x0,-0xc0(%r15)
> ffffffff811a5f8b: 00
> ffffffff811a5f8c: 49 c1 ed 03          shr    $0x3,%r13
> ffffffff811a5f90: e8 bf 4e 21 00        callq  ffffffff813bae54 <__asan_s=
tore1>
> kernel/printk/printk.c:1599
> raw_spin_lock(&console_owner_lock);
> ffffffff811a5f95: 48 c7 c7 e0 90 b5 82 mov    $0xffffffff82b590e0,%rdi
> ffffffff811a5f9c: 41 c6 47 80 00        movb   $0x0,-0x80(%r15)
> ffffffff811a5fa1: e8 92 a9 e7 00        callq  ffffffff82020938 <_raw_spi=
n_lock>
> kernel/printk/printk.c:1600
> waiter =3D READ_ONCE(console_waiter);
> ffffffff811a5fa6: 4c 03 ad e8 fe ff ff add    -0x118(%rbp),%r13
> __read_once_size():
> ./include/linux/compiler.h:178
> })
>
> static __always_inline
> void __read_once_size(const volatile void *p, void *res, int size)
> {
> __READ_ONCE_SIZE;
> ffffffff811a5fad: 44 8a 35 2c 7b e6 02 mov    0x2e67b2c(%rip),%r14b
>     # ffffffff8400dae0 <console_waiter>
> ffffffff811a5fb4: 48 89 df              mov    %rbx,%rdi
> console_lock_spinning_disable_and_check():
> kernel/printk/printk.c:1600
> ffffffff811a5fb7: 41 c6 45 00 01        movb   $0x1,0x0(%r13)
> __read_once_size():
> ./include/linux/compiler.h:178
> ffffffff811a5fbc: e8 93 4e 21 00        callq  ffffffff813bae54 <__asan_s=
tore1>
> console_lock_spinning_disable_and_check():
> kernel/printk/printk.c:1600
> ffffffff811a5fc1: 48 89 df              mov    %rbx,%rdi
> __read_once_size():
> ./include/linux/compiler.h:178
> ffffffff811a5fc4: 45 88 b7 40 ff ff ff mov    %r14b,-0xc0(%r15)
> console_lock_spinning_disable_and_check():
> kernel/printk/printk.c:1600
> ffffffff811a5fcb: e8 3d 4e 21 00        callq  ffffffff813bae0d <__asan_l=
oad1>
> ffffffff811a5fd0: 45 8a b7 40 ff ff ff mov    -0xc0(%r15),%r14b
> kernel/printk/printk.c:1602
> raw_spin_unlock(&console_owner_lock);
> ffffffff811a5fd7: 48 c7 c7 e0 90 b5 82 mov    $0xffffffff82b590e0,%rdi
> ffffffff811a5fde: 41 c6 45 00 f8        movb   $0xf8,0x0(%r13)
> kernel/printk/printk.c:1601
> console_owner =3D NULL;
> ffffffff811a5fe3: 48 c7 05 32 7b e6 02 movq   $0x0,0x2e67b32(%rip)
>    # ffffffff8400db20 <console_owner>
> ffffffff811a5fea: 00 00 00 00
> kernel/printk/printk.c:1602
> raw_spin_unlock(&console_owner_lock);
> ffffffff811a5fee: e8 d1 ab e7 00        callq  ffffffff82020bc4
> <_raw_spin_unlock>
>
>
>
> We either need to fix GCC_PLUGIN_STRUCTLEAK_BYREF_ALL (and probably
> GCC_PLUGIN_STRUCTLEAK) to insert initialization at proper places or
> run before KASAN instrumentation (though, since the initializing
> stores are instrumented, it already runs partially before KASAN), or
> declare GCC_PLUGIN_STRUCTLEAK incompatible with KASAN (it's not the
> first time we debug this).

I am pretty sure that this is a fundamental issue with the plugin, and
not specific to BYREF_ALL. BYREF_ALL just increases the number of
occurrences, making it easier to hit this issue.

I'd be fine with making the plugin mutually exclusive with KASAN.

--===============6778734176707277468==--

