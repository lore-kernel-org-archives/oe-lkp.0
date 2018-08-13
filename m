Content-Type: multipart/mixed; boundary="===============2705298018801157579=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: ca90800a91 [ 3.251519] WARNING: CPU: 0 PID: 1 at mm/page_alloc.c:4061 __alloc_pages_nodemask
Date: Mon, 13 Aug 2018 16:14:27 -0700
Message-ID: <CAGXu5jKLVrgS8nWitpO0gkvLkSRF5TYNW4UMZEXJ6R4yGBA2tw@mail.gmail.com>
In-Reply-To: <20180813001328.GA9648@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============2705298018801157579==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

This is the expected output when running the lib/test_overflow.c tests.

Thanks,

-Kees

On Sun, Aug 12, 2018 at 5:13 PM, kernel test robot
<rong.a.chen@intel.com> wrote:
> Greetings,
>
> 0day kernel testing robot got the below dmesg and the first bad commit is
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>
> commit ca90800a91ba723d78ded634d037c1d2df8b54d6
> Author:     Kees Cook <keescook@chromium.org>
> AuthorDate: Thu May 10 16:40:03 2018 -0700
> Commit:     Kees Cook <keescook@chromium.org>
> CommitDate: Tue Jun 5 12:16:51 2018 -0700
>
>     test_overflow: Add memory allocation overflow tests
>
>     Make sure that the memory allocators are behaving as expected in the =
face
>     of overflows of multiplied arguments or when using the array_size()-f=
amily
>     helpers.
>
>     Example output of new tests (with the expected __alloc_pages_slowpath
>     and vmalloc warnings about refusing giant allocations removed):
>
>     [   93.062076] test_overflow: kmalloc detected saturation
>     [   93.062988] test_overflow: kmalloc_node detected saturation
>     [   93.063818] test_overflow: kzalloc detected saturation
>     [   93.064539] test_overflow: kzalloc_node detected saturation
>     [   93.120386] test_overflow: kvmalloc detected saturation
>     [   93.143458] test_overflow: kvmalloc_node detected saturation
>     [   93.166861] test_overflow: kvzalloc detected saturation
>     [   93.189924] test_overflow: kvzalloc_node detected saturation
>     [   93.221671] test_overflow: vmalloc detected saturation
>     [   93.246326] test_overflow: vmalloc_node detected saturation
>     [   93.270260] test_overflow: vzalloc detected saturation
>     [   93.293824] test_overflow: vzalloc_node detected saturation
>     [   93.294597] test_overflow: devm_kmalloc detected saturation
>     [   93.295383] test_overflow: devm_kzalloc detected saturation
>     [   93.296217] test_overflow: all tests passed
>
>     Signed-off-by: Kees Cook <keescook@chromium.org>
>
> 610b15c50e  overflow.h: Add allocation size calculation helpers
> ca90800a91  test_overflow: Add memory allocation overflow tests
> ec0c96714e  Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net
> 4110b42356  Add linux-next specific files for 20180810
> +-----------------------------------------------------+------------+-----=
-------+------------+---------------+
> |                                                     | 610b15c50e | ca90=
800a91 | ec0c96714e | next-20180810 |
> +-----------------------------------------------------+------------+-----=
-------+------------+---------------+
> | boot_successes                                      | 72         | 0   =
       | 0          | 0             |
> | boot_failures                                       | 1          | 49  =
       | 18         | 20            |
> | Mem-Info                                            | 1          | 49  =
       | 18         | 20            |
> | WARNING:at_mm/page_alloc.c:#__alloc_pages_nodemask  | 0          | 49  =
       | 18         | 20            |
> | EIP:__alloc_pages_nodemask                          | 0          | 49  =
       | 18         | 20            |
> | WARNING:at_arch/x86/mm/dump_pagetables.c:#note_page | 0          | 0   =
       | 0          | 20            |
> | EIP:note_page                                       | 0          | 0   =
       | 0          | 20            |
> +-----------------------------------------------------+------------+-----=
-------+------------+---------------+
>
> [    3.249253] test_overflow: s8 : 19 tests
> [    3.249696] test_overflow: u16: 17 tests
> [    3.250151] test_overflow: s16: 17 tests
> [    3.250599] test_overflow: u32: 17 tests
> [    3.251039] test_overflow: s32: 17 tests
> [    3.251519] WARNING: CPU: 0 PID: 1 at mm/page_alloc.c:4061 __alloc_pag=
es_nodemask+0x2e9/0xe12
> [    3.252625] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G                T =
4.17.0-rc4-00006-gca90800 #1151
> [    3.253474] EIP: __alloc_pages_nodemask+0x2e9/0xe12
> [    3.253474] EFLAGS: 00210246 CPU: 0
> [    3.253474] EAX: 00200140 EBX: 00000000 ECX: 00000000 EDX: 00000001
> [    3.253474] ESI: 7a7af300 EDI: 014040c0 EBP: 7fc4fde4 ESP: 7fc4fd38
> [    3.253474]  DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068
> [    3.253474] CR0: 80050033 CR2: 00000000 CR3: 02a90000 CR4: 000006d0
> [    3.253474] Call Trace:
> [    3.253474]  ? sched_clock_cpu+0x11c/0x155
> [    3.253474]  ? _raw_spin_unlock+0x2c/0x45
> [    3.253474]  ? free_one_page+0x28b/0x423
> [    3.253474]  ? kmalloc_order+0x20/0x2f
> [    3.253474]  ? kmalloc_order_trace+0x1b/0xe0
> [    3.253474]  ? __kmalloc+0x180/0x227
> [    3.253474]  ? kfree+0x1d3/0x1f6
> [    3.253474]  ? test_kmalloc+0xe6/0x137
> [    3.253474]  ? test_module_init+0x2297/0x30e3
> [    3.253474]  ? preempt_count_sub+0xa/0x67
> [    3.253474]  ? preempt_count_sub+0x44/0x67
> [    3.253474]  ? _raw_spin_unlock_irqrestore+0x41/0x6a
> [    3.253474]  ? add_device_randomness+0xb1/0x208
> [    3.253474]  ? test_kzalloc+0x137/0x137
> [    3.253474]  ? do_one_initcall+0x10d/0x392
> [    3.253474]  ? do_early_param+0xf7/0xf7
> [    3.253474]  ? kernel_init_freeable+0x2a1/0x42b
> [    3.253474]  ? rest_init+0x10d/0x10d
> [    3.253474]  ? kernel_init+0x10/0xf3
> [    3.253474]  ? schedule_tail_wrapper+0x9/0xc
> [    3.253474]  ? ret_from_fork+0x19/0x24
> [    3.253474] Code: 0c 8b 33 85 f6 75 e2 64 ff 0d c8 76 93 7a 74 05 e9 3=
a fe ff ff e8 42 ae ec ff e9 30 fe ff ff f7 c7 00 02 00 00 0f 85 11 fe ff f=
f <0f> 0b e9 0a fe ff ff 64 8b 15 cc 76 93 7a 83 ba 58 0a 00 00 63
> [    3.253474] ---[ end trace 48b5392a6d84e6d7 ]---
> [    3.269794] test_overflow: kmalloc detected saturation
>
>                                                           # HH:MM RESULT =
GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> git bisect start e4f6a44c4aeca9eda153302abb0c14d053914f72 v4.17 --
> git bisect  bad ec65e266ae548ea560c7f109c3d9749abcc877b5  # 04:54  B     =
 0     1   78  31  staging:rtl8192u: typedef struct tx_fwinfo_819x_usb remo=
ve typedef
> git bisect  bad e62b4e21d1edf1cbe6d79e4c05fdbd56190a57aa  # 05:13  B     =
 0     2   46  30  staging: rtl8192u: Truncate block comments to 80 charact=
er length - Style
> git bisect  bad ab0b2e59323cd3972e5f011fbbf3868a4ec360dd  # 05:27  B     =
 0     1   17   2  Merge tag 'upstream-4.18-rc1' of git://git.infradead.org=
/linux-ubifs
> git bisect good af6c5d5e01ad9f2c9ca38cccaae6b5d67ddd241f  # 06:26  G     =
10     0    0   0  Merge branch 'for-4.18' of git://git.kernel.org/pub/scm/=
linux/kernel/git/tj/wq
> git bisect  bad 68abbe729567cef128b2c2141f2ed2567f3b8372  # 06:26  B     =
 0    50  115   0  Merge branch 'akpm' (patches from Andrew)
> git bisect  bad da315f6e03988a7127680bbc26e1028991b899b8  # 06:26  B     =
 0    45   93   0  Merge tag 'fuse-update-4.18' of git://git.kernel.org/pub=
/scm/linux/kernel/git/mszeredi/fuse
> git bisect good 0eb0061381b2bac082cc26d573fc48fe99db3922  # 07:25  G     =
10     0    0   0  Merge tag 'for-linus-4.18' of git://github.com/cminyard/=
linux-ipmi
> git bisect good 8b5c6a3a49d9ebc7dc288870b9c56c4f946035d8  # 08:20  G     =
10     0    0   0  Merge tag 'audit-pr-20180605' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/pcmoore/audit
> git bisect  bad 285767604576148fc1be7fcd112e4a90eb0d6ad2  # 08:20  B     =
 0    59  133   0  Merge tag 'overflow-v4.18-rc1' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/kees/linux
> git bisect good 5eb6eed7e0fe880dc8de8da203cc888716bbf196  # 09:38  G     =
10     0    0   0  Merge tag 'trace-v4.18' of git://git.kernel.org/pub/scm/=
linux/kernel/git/rostedt/linux-trace
> git bisect  bad ca90800a91ba723d78ded634d037c1d2df8b54d6  # 12:17  B     =
 0     1   86  38  test_overflow: Add memory allocation overflow tests
> git bisect good 6d3344324b5ae49fc8cb599a2c687e5607ba6e9f  # 12:17  G     =
11     0    0   0  test_overflow: macrofy some more, do more tests for free
> git bisect good 610b15c50e86eb1e4b77274fabcaea29ac72d6a8  # 12:17  G     =
19     0    0   3  overflow.h: Add allocation size calculation helpers
> # first bad commit: [ca90800a91ba723d78ded634d037c1d2df8b54d6] test_overf=
low: Add memory allocation overflow tests
> git bisect good 610b15c50e86eb1e4b77274fabcaea29ac72d6a8  # 13:08  G     =
30     0    0   4  overflow.h: Add allocation size calculation helpers
> # extra tests on HEAD of chao-linux/erofs-dev
> git bisect  bad dfc9ffb5362ab48bdb5dec53f1e726965d7eb115  # 13:08  B     =
 0    17   38   0  staging: erofs: fix race when the managed cache is enabl=
ed
> # extra tests on tree/branch linus/master
> git bisect  bad ec0c96714e7ddeda4eccaa077f5646a0fd6e371f  # 13:09  B     =
 0    18   51   0  Merge git://git.kernel.org/pub/scm/linux/kernel/git/dave=
m/net
> # extra tests on tree/branch linux-next/master
> git bisect  bad 4110b42356f3f8e237659eb85b0ec1f479044cdf  # 13:14  B     =
 0    16   30   0  Add linux-next specific files for 20180810
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/lkp                          Intel Corpora=
tion



-- =

Kees Cook
Pixel Security

--===============2705298018801157579==--

