Content-Type: multipart/mixed; boundary="===============1863499432715845175=="
MIME-Version: 1.0
From: Jason A. Donenfeld <Jason@zx2c4.com>
To: lkp@lists.01.org
Subject: Re: [random] 31ac294037: BUG:kernel_reboot-without-warning_in_test_sta
Date: Wed, 22 Jun 2022 11:28:44 +0200
Message-ID: <YrLgzJm7q3XbjXPQ@zx2c4.com>
In-Reply-To: <YrK7W4HebAqkpw+z@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============1863499432715845175==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 22, 2022 at 02:48:59PM +0800, kernel test robot wrote:
> [ 61.471397][ T855] random: get_random_u32 called from arch_align_stack+0=
x33/0x4e with crng_init=3D0 =

> [ 61.471431][ T855] random: get_random_bytes called from create_elf_table=
s+0x14f/0x84c with crng_init=3D0 =

> [ 61.471493][ T855] random: get_random_u64 called from randomize_page+0x7=
f/0x93 with crng_init=3D0 =

> [ 61.474209][ T792] random: get_random_u32 called from arch_setup_additio=
nal_pages+0x9d/0xe1 with crng_init=3D0 =

> [ 61.474251][ T792] random: get_random_u32 called from arch_align_stack+0=
x33/0x4e with crng_init=3D0 =


If the DEBUG option, CONFIG_WARN_ALL_UNSEEDED_RANDOM=3Dy, is set, then
this is exactly the intended behavior. Looking at your .config, it is
set. So no issue here.

Jason

--===============1863499432715845175==--

