Content-Type: multipart/mixed; boundary="===============7582071519893548340=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: lkp@lists.01.org
Subject: Re: [ 0.003333] BUG: KASAN: use-after-scope in console_unlock+0x605/0xcc0
Date: Fri, 01 Dec 2017 10:58:28 +0900
Message-ID: <20171201015828.GA1303@jagdpanzerIV>
In-Reply-To: <ecd089a9-5ec4-c512-aa37-7e0d59b64894@virtuozzo.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7582071519893548340==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (11/30/17 16:07), Andrey Ryabinin wrote:
[..]
> >> You can try dirty patch from here:
> >> https://groups.google.com/d/msg/kasan-dev/iDb5bhcMBT0/55QzwWaHAwAJ
> >> It should make KASAN print the exact variable name and frame where it
> >> was allocated.
> > =

> > would be good if Fengguang can try this out. I can't reproduce the
> > problem on my x86 box (linux-next and Linus's trees both work fine
> > for me with KASAN + lockdep + TRACE_IRQ).
> =

> I suspect you don't have gcc 7. That's is requirement for use-after-scope.

I do have it.

gcc --version
gcc (GCC) 7.2.1 20171123

tested with

$ grep GCC .config
CONFIG_HAVE_GCC_PLUGINS=3Dy
CONFIG_GCC_PLUGINS=3Dy
# CONFIG_GCC_PLUGIN_CYC_COMPLEXITY is not set
# CONFIG_GCC_PLUGIN_LATENT_ENTROPY is not set
CONFIG_GCC_PLUGIN_STRUCTLEAK=3Dy
CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF_ALL=3Dy
CONFIG_GCC_PLUGIN_STRUCTLEAK_VERBOSE=3Dy
# CONFIG_GCC_PLUGIN_RANDSTRUCT is not set

got the following use-after-scope:

 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 BUG: KASAN: use-after-scope in pcpu_setup_first_chunk+0x902/0xa21
 Write of size 8 at addr ffffffff81e07d78 by task swapper/0
 =

 CPU: 0 PID: 0 Comm: swapper Not tainted 4.15.0-rc1-dbg-00261-g716b8dd05fd3=
-dirty #927
 Call Trace:
  dump_stack+0xca/0x146
  ? _atomic_dec_and_lock+0xdd/0xdd
  ? show_regs_print_info+0x39/0x39
  ? pcpu_setup_first_chunk+0x902/0xa21
  print_address_description+0x6e/0x207
  ? pcpu_setup_first_chunk+0x902/0xa21
  kasan_report+0x21e/0x244
  pcpu_setup_first_chunk+0x902/0xa21
  ? pcpu_free_alloc_info+0x27/0x27
  ? memblock_remove+0x12/0x12
  pcpu_embed_first_chunk+0x3fa/0x4a6
  ? pcpup_populate_pte+0xa/0xa
  ? pcpu_fc_free+0x40/0x40
  setup_per_cpu_areas+0x7c/0x2df
  start_kernel+0x174/0x489
  ? mem_encrypt_init+0x6/0x6
  ? load_ucode_bsp+0x7f/0xe0
  secondary_startup_64+0xa5/0xb0
 =

 =

 Memory state around the buggy address:
  ffffffff81e07c00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  ffffffff81e07c80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 >ffffffff81e07d00: 00 00 00 00 00 00 00 00 00 00 00 f1 f1 f1 f1 f8
                                                                 ^
  ffffffff81e07d80: f2 f2 f2 f3 f3 f3 f3 00 00 00 00 00 00 00 00 00
  ffffffff81e07e00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

no printk() related reports.

	-ss

--===============7582071519893548340==--

