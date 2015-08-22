Content-Type: multipart/mixed; boundary="===============5510347737344793050=="
MIME-Version: 1.0
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
To: lkp@lists.01.org
Subject: Re: [x86_64] ef7f0d6a6c: BUG: kernel early-boot crashed early console in setup code
Date: Sat, 22 Aug 2015 16:31:38 +0300
Message-ID: <CAPAsAGxkfTgMWy+3FPVdsbvtszmk1L_fwyOA2O5XzWQMuyPpig@mail.gmail.com>
In-Reply-To: <87wpwnjwfj.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5510347737344793050==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

2015-08-22 16:16 GMT+03:00 kernel test robot <ying.huang@intel.com>:
> FYI, we noticed the below changes on
>
> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> commit ef7f0d6a6ca8c9e4b27d78895af86c2fbfaeedb2 ("x86_64: add KASan suppo=
rt")
>
>
> +-----------------------------------------------------------+------------=
+------------+
> |                                                           | 786a895991 =
| ef7f0d6a6c |
> +-----------------------------------------------------------+------------=
+------------+
> | boot_successes                                            | 10         =
| 0          |
> | boot_failures                                             | 1          =
| 12         |
> | BUG:kernel_test_crashed                                   | 1          =
|            |
> | BUG:kernel_early-boot_crashed_early_console_in_setup_code | 0          =
| 12         |
> +-----------------------------------------------------------+------------=
+------------+
>
>
> This may related to the specific kernel configuration file, which is atta=
ched.
>

The combination of these 2 configs didn't work at some point:
       CONFIG_PHYSICAL_START=3D0x1000000
       CONFIG_KASAN=3Dy

This was fixed in commit 5d5aa3cfca5cf74cd928daf3674642e6004328d1
("x86/kasan: Fix KASAN shadow region page tables")

--===============5510347737344793050==--

