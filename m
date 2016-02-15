Content-Type: multipart/mixed; boundary="===============8150203406220460329=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To: lkp@lists.01.org
Subject: Re: [printk] af097cab1b: EIP is at vprintk_emit+0xab2/0xb5c
Date: Tue, 16 Feb 2016 01:04:34 +0900
Message-ID: <20160215160434.GA435@swordfish>
In-Reply-To: <87vb5qd9yu.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8150203406220460329==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (02/15/16 09:43), kernel test robot wrote:
> FYI, we noticed the below changes on
> =

> https://github.com/0day-ci/linux Sergey-Senozhatsky/printk-move-can_use_c=
onsole-out-of-console_trylock_for_printk/20160213-024210
> commit af097cab1b878d5be746be8bcaa9a79986716c41 ("printk: set may_schedul=
e for some of console_trylock callers")

> [   37.263248] CPU: 0 PID: 1 Comm: swapper Not tainted 4.5.0-rc3-00002-ga=
f097ca #1
> [   37.263248] CPU: 0 PID: 1 Comm: swapper Not tainted 4.5.0-rc3-00002-ga=
f097ca #1

the two patches you have, I assume
	printk-move-can_use_console-out-of-console_trylock_for_printk.patch
	printk-set-may_schedule-for-some-of-console_trylock-callers.patch


does it happen all the time? is every single message duplicated,
or just some of them (if so, then under what circumstances)?

do you happen to have several console drivers from some point, so
call_console_drivers() pushes the data to several consoles via con->write()?

	-ss

> [   37.263363]  [<c11b1168>] vprintk_default+0x20/0x30
> [   37.263363]  [<c11b1168>] vprintk_default+0x20/0x30
> [   37.263372]  [<c12b8713>] printk+0x1f/0x2f
> [   37.263372]  [<c12b8713>] printk+0x1f/0x2f
> [   37.263382]  [<c197ce8b>] of_overlay_destroy+0x1b4/0x595
> [   37.263382]  [<c197ce8b>] of_overlay_destroy+0x1b4/0x595
> [   37.263392]  [<c21f906b>] of_unittest+0x252c/0x26e5
> [   37.263392]  [<c21f906b>] of_unittest+0x252c/0x26e5
> [   37.263400]  [<c135cc63>] ? slob_free+0x98c/0x9a2
> [   37.263400]  [<c135cc63>] ? slob_free+0x98c/0x9a2
> [   37.263408]  [<c10d5880>] ? __phys_addr+0x146/0x188
> [   37.263408]  [<c10d5880>] ? __phys_addr+0x146/0x188
> [   37.263414]  [<c135cfe5>] ? kfree+0x11f/0x1cc
> [   37.263414]  [<c135cfe5>] ? kfree+0x11f/0x1cc
> [   37.263423]  [<c100239c>] do_one_initcall+0x2ee/0x474
> [   37.263423]  [<c100239c>] do_one_initcall+0x2ee/0x474
> [   37.263432]  [<c2173944>] ? repair_env_string+0x36/0x140
> [   37.263432]  [<c2173944>] ? repair_env_string+0x36/0x140
> [   37.263440]  [<c21f6b3f>] ? of_unittest_find_node_by_name+0x11f0/0x11f0
> [   37.263440]  [<c21f6b3f>] ? of_unittest_find_node_by_name+0x11f0/0x11f0
> [   37.263450]  [<c1147a0d>] ? parse_args+0x828/0x9c2
> [   37.263450]  [<c1147a0d>] ? parse_args+0x828/0x9c2
> [   37.263461]  [<c21750ce>] ? kernel_init_freeable+0x322/0x581
> [   37.263461]  [<c21750ce>] ? kernel_init_freeable+0x322/0x581
> [   37.263470]  [<c21751c2>] kernel_init_freeable+0x416/0x581
> [   37.263470]  [<c21751c2>] kernel_init_freeable+0x416/0x581
> [   37.263480]  [<c1ab3d81>] kernel_init+0x16/0x1e7
> [   37.263480]  [<c1ab3d81>] kernel_init+0x16/0x1e7
> [   37.263488]  [<c1ac8410>] ret_from_kernel_thread+0x20/0x40
> [   37.263488]  [<c1ac8410>] ret_from_kernel_thread+0x20/0x40
> [   37.263496]  [<c1ab3d6b>] ? rest_init+0x2bb/0x2bb
> [   37.263496]  [<c1ab3d6b>] ? rest_init+0x2bb/0x2bb
> [   37.263609] Code: 83 05 48 90 aa c2 01 b8 a0 65 f0 c1 83 15 4c 90 aa c=
2 00 e9 84 f6 ff ff 83 05 40 90 aa c2 01 8b 45 ec 83 15 44 90 aa c2 00 50 9=
d <8d> 74 26 00 83 05 50 90 aa c2 01 83 15 54 90 aa c2 00 80 7d eb
> [   37.263609] Code: 83 05 48 90 aa c2 01 b8 a0 65 f0 c1 83 15 4c 90 aa c=
2 00 e9 84 f6 ff ff 83 05 40 90 aa c2 01 8b 45 ec 83 15 44 90 aa c2 00 50 9=
d <8d> 74 26 00 83 05 50 90 aa c2 01 83 15 54 90 aa c2 00 80 7d eb
> [   37.263614] Kernel panic - not syncing: softlockup: hung tasks
> [   37.263614] Kernel panic - not syncing: softlockup: hung tasks

--===============8150203406220460329==--

