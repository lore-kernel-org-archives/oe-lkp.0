Content-Type: multipart/mixed; boundary="===============8952605620161954629=="
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
To: lkp@lists.01.org
Subject: Re: 37f2447049 ("kbuild: fix linker feature test macros when cross .."): BUG: kernel hang in early-boot stage, last printk: Decompressing Linux...
Date: Mon, 30 Oct 2017 09:05:21 -0700
Message-ID: <CAKwvOdkbLx0XxCeuWM4=J4Xr5+jWmzkntthbvzUbmp7P82EzRg@mail.gmail.com>
In-Reply-To: <59f565cb.bCzO8d/eTN31ak4x%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8952605620161954629==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

+ Rahul

On Sat, Oct 28, 2017 at 10:23 PM, kernel test robot
<fengguang.wu@intel.com> wrote:
> Greetings,
>
> 0day kernel testing robot got the below dmesg and the first bad commit is
>
> https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.gi=
t kbuild
>
> commit 37f24470495731e8b5cfd29164e346ca9d3c0632
> Author:     Nick Desaulniers <ndesaulniers@google.com>
> AuthorDate: Fri Oct 27 13:13:43 2017 -0700
> Commit:     Masahiro Yamada <yamada.masahiro@socionext.com>
> CommitDate: Sat Oct 28 23:45:19 2017 +0900
>
>     kbuild: fix linker feature test macros when cross compiling with Clang
>
>     I was not seeing my linker flags getting added when using ld-option w=
hen
>     cross compiling with Clang. Upon investigation, this seems to be due =
to
>     a difference in how GCC vs Clang handle cross compilation.
>
>     GCC is configured at build time to support one backend, that is impli=
cit
>     when compiling.  Clang is explicit via the use of `-target <triple>` =
and
>     ships with all supported backends by default.
>
>     GNU Make feature test macros that compile then link will always fail
>     when cross compiling with Clang unless Clang's triple is passed along=
 to
>     the compiler. For example:
>
>     $ clang -x c /dev/null -c -o temp.o
>     $ aarch64-linux-android/bin/ld -E temp.o
>     aarch64-linux-android/bin/ld:
>     unknown architecture of input file `temp.o' is incompatible with
>     aarch64 output
>     aarch64-linux-android/bin/ld:
>     warning: cannot find entry symbol _start; defaulting to
>     0000000000400078
>     $ echo $?
>     1
>
>     $ clang -target aarch64-linux-android- -x c /dev/null -c -o temp.o
>     $ aarch64-linux-android/bin/ld -E temp.o
>     aarch64-linux-android/bin/ld:
>     warning: cannot find entry symbol _start; defaulting to 0000000000400=
2e4
>     $ echo $?
>     0
>
>     This causes conditional checks that invoke $(CC) without the target
>     triple, then $(LD) on the result, to always fail.
>
>     Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>     Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>     Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
>     Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>
> 4467d3f62b  kbuild: shrink .cache.mk when it exceeds 1000 lines
> 37f2447049  kbuild: fix linker feature test macros when cross compiling w=
ith Clang
> +---------------------------------------------------------------------+--=
----------+------------+
> |                                                                     | 4=
467d3f62b | 37f2447049 |
> +---------------------------------------------------------------------+--=
----------+------------+
> | boot_successes                                                      | 4=
5         | 0          |
> | boot_failures                                                       | 1=
          | 15         |
> | BUG:kernel_reboot-without-warning_in_test_stage                     | 1=
          |            |
> | BUG:kernel_hang_in_early-boot_stage,last_printk:Decompressing_Linux | 0=
          | 15         |
> +---------------------------------------------------------------------+--=
----------+------------+
>
> output_len: 0x02878090
> kernel_total_size: 0x03212000
>
> Decompressing Linux...
>
>                                                           # HH:MM RESULT =
GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> git bisect start a31e7b0dd1c980f8f842421bd373b6afc24c537f bb176f67090ca54=
869fc1262c913aa69d2ede070 --
> git bisect  bad 692704061fb6f80f037821c9ade25e6ee9d17e07  # 08:38  B     =
 0     7   50  15  Merge 'nf-next/master' into devel-spot-201710290439
> git bisect  bad 24dd4080b9c6b1a1a0a7bf973aab35f9cbf12c8d  # 08:56  B     =
 0     9   21   0  Merge 'nfs/multipath_tcp' into devel-spot-201710290439
> git bisect good de878dafcdae7a7ffd23447434ed0c1a7041df0c  # 09:25  G     =
11     0    0   0  Merge 'masahiroy/kbuild' into devel-spot-201710290439
> git bisect  bad 147b60216364d0894b8311056262421d876f4404  # 10:01  B     =
 0    11   23   0  Merge 'chao-linux/f2fs-dev' into devel-spot-201710290439
> git bisect  bad 6b86583a4f515543d235803943209d79c562f4cc  # 10:29  B     =
 0     5   26   8  Merge 'masahiroy/for-next' into devel-spot-201710290439
> git bisect good f7b0acea7951ca21d8da74ee840dc83edbca95ba  # 11:03  G     =
11     0    0   0  kbuild: rpm-pkg: do not force -jN in submake
> git bisect good 8808232e8600605b81763d2972124fd24561aaad  # 11:37  G     =
11     0    0   0  kbuild: Cache a few more calls to the compiler
> git bisect  bad 37f24470495731e8b5cfd29164e346ca9d3c0632  # 12:01  B     =
 0    11   23   0  kbuild: fix linker feature test macros when cross compil=
ing with Clang
> git bisect good 4467d3f62b5cfddd20362649d988c18317f8e754  # 12:20  G     =
11     0    0   1  kbuild: shrink .cache.mk when it exceeds 1000 lines
> # first bad commit: [37f24470495731e8b5cfd29164e346ca9d3c0632] kbuild: fi=
x linker feature test macros when cross compiling with Clang
> git bisect good 4467d3f62b5cfddd20362649d988c18317f8e754  # 12:24  G     =
31     0    0   1  kbuild: shrink .cache.mk when it exceeds 1000 lines
> # extra tests with CONFIG_DEBUG_INFO_REDUCED
> git bisect  bad 37f24470495731e8b5cfd29164e346ca9d3c0632  # 12:49  B     =
 0     2   14   0  kbuild: fix linker feature test macros when cross compil=
ing with Clang
> # extra tests on HEAD of linux-devel/devel-spot-201710290439
> git bisect  bad a31e7b0dd1c980f8f842421bd373b6afc24c537f  # 12:55  B     =
 0    59  119   0  0day head guard for 'devel-spot-201710290439'
> # extra tests on tree/branch masahiroy/kbuild
> git bisect  bad 37f24470495731e8b5cfd29164e346ca9d3c0632  # 12:59  B     =
 0    15   27   0  kbuild: fix linker feature test macros when cross compil=
ing with Clang
> # extra tests with first bad commit reverted
> git bisect good 09508094eac49ab7db0f797d9c8fb8a0ae555e26  # 13:23  G     =
11     0    0   0  Revert "kbuild: fix linker feature test macros when cros=
s compiling with Clang"
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/lkp                          Intel Corpora=
tion



-- =

Thanks,
~Nick Desaulniers

--===============8952605620161954629==--

