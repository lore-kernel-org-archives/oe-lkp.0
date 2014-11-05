Content-Type: multipart/mixed; boundary="===============5953242013345635637=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [LSM] Kernel panic - not syncing: No working init found.
Date: Wed, 05 Nov 2014 10:15:48 -0800
Message-ID: <CAGXu5jJdB6pq5WqHWSAaGRmRvgkrzoq95PjHTf7GtSkUGmEchA@mail.gmail.com>
In-Reply-To: <20141105111642.GA20341@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5953242013345635637==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I assume this is due to some unhealthy arrangement of CONFIG items. I
haven't had time to examine the original report...

-Kees

On Wed, Nov 5, 2014 at 3:16 AM, Fengguang Wu <fengguang.wu@intel.com> wro=
te:
> Hi Casey,
>
> FYI, this error still remains in the updated tree.
>
> git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git lsm/stacking
> commit 19ef36a6507555b231aef0498445148ac37aa2c4 ("LSM: Refactor existing =
LSM stacking")
>
>
> +------------------------------------------------+------------+----------=
--+
> |                                                | 644fb12c65 | 19ef36a65=
0 |
> +------------------------------------------------+------------+----------=
--+
> | boot_successes                                 | 15         | 0        =
  |
> | early-boot-hang                                | 1          |          =
  |
> | boot_failures                                  | 0          | 15       =
  |
> | Kernel_panic-not_syncing:No_working_init_found | 0          | 15       =
  |
> | backtrace:panic                                | 0          | 15       =
  |
> +------------------------------------------------+------------+----------=
--+
>
>
> [   14.083301] Starting init: /sbin/init exists but couldn't execute it (=
error -12)
> [   14.084391] Starting init: /etc/init exists but couldn't execute it (e=
rror -13)
> [   14.085300] Starting init: /bin/sh exists but couldn't execute it (err=
or -12)
> [   14.085884] Kernel panic - not syncing: No working init found.  Try pa=
ssing init=3D option to kernel. See Linux Documentation/init.txt for guidan=
ce.
> [   14.086902] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 3.18.0-rc3-wl-00=
142-gb2eaffd #43
> [   14.087517]  00000000 00000000 b002df88 b17d4ee3 00000000 b002dfa0 b17=
d1b54 02178e76
> [   14.088230]  00000000 02178e76 b1bee500 b002dfac b17c8c30 b1aaf57d b00=
2c000 b17e30e1
> [   14.088354]  b17c8a3a 00000000 00000000 00000000 00000000 00000000 000=
00000 0000007b
> [   14.088354] Call Trace:
> [   14.088354]  [<b17d4ee3>] dump_stack+0xb8/0x108
> [   14.088354]  [<b17d1b54>] panic+0x13e/0x378
> [   14.088354]  [<b17c8c30>] kernel_init+0x1f6/0x1fa
> [   14.088354]  [<b17e30e1>] ret_from_kernel_thread+0x21/0x30
> [   14.088354]  [<b17c8a3a>] ? rest_init+0x26f/0x26f
> [   14.088354] Kernel Offset: 0x0 from 0xb1000000 (relocation range: 0xb0=
000000-0xc6ffdfff)
>
> Thanks,
> Fengguang
>
> _______________________________________________
> LKP mailing list
> LKP(a)linux.intel.com
>



-- =

Kees Cook
Chrome OS Security

--===============5953242013345635637==--

