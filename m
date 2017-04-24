Content-Type: multipart/mixed; boundary="===============4109233142250019690=="
MIME-Version: 1.0
From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mtd] 42e9401bd1: WARNING:at_kernel/locking/lockdep.c:#__bfs
Date: Mon, 24 Apr 2017 08:57:54 +0200
Message-ID: <20170424065754.pv7rjvf2fckpo2fc@pengutronix.de>
In-Reply-To: <20170411014729.GV17682@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============4109233142250019690==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Apr 11, 2017 at 09:47:29AM +0800, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> commit: 42e9401bd1467d22c4dc4d2c637347b874e6a80b ("mtd: Add partition dev=
ice node to mtd partition devices")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: trinity
> with following parameters:
> =

> 	runtime: 300s
> =

> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
> =

> =

> on test machine: qemu-system-x86_64 -enable-kvm -m 512M
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +------------------------------------------------------------------------=
--+------------+------------+
> |                                                                        =
  | 89a0d9a9f1 | 42e9401bd1 |
> +------------------------------------------------------------------------=
--+------------+------------+
> | boot_successes                                                         =
  | 0          | 0          |
> | boot_failures                                                          =
  | 56         | 52         |
> | WARNING:at_drivers/gpu/drm/drm_mode_config.c:#drm_mode_config_cleanup  =
  | 56         | 52         |
> | BUG:unable_to_handle_kernel                                            =
  | 1          | 39         |
> | Oops:#[##]                                                             =
  | 1          | 39         |
> | Kernel_panic-not_syncing:Fatal_exception                               =
  | 1          | 39         |
> | WARNING:at_kernel/locking/lockdep.c:#__bfs                             =
  | 0          | 39         |
> | BUG:sleeping_function_called_from_invalid_context_at_arch/x86/mm/fault.=
c | 0          | 39         |
> | WARNING:at_kernel/locking/lockdep.c:#__lock_acquire                    =
  | 0          | 11         |
> | BUG:spinlock_lockup_suspected_on_CPU                                   =
  | 0          | 11         |
> +------------------------------------------------------------------------=
--+------------+------------+

Did someone look into this? For me this looks like a wrong report, the
attached config doesn't even have MTD_OF_PARTS enabled.
 =

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--===============4109233142250019690==--

