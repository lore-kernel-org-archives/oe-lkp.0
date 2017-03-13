Content-Type: multipart/mixed; boundary="===============4854009734182536527=="
MIME-Version: 1.0
From: Andrey Ryabinin <aryabinin@virtuozzo.com>
To: lkp@lists.01.org
Subject: Re: [mm/kasan] 80a9201a59 BUG: kernel reboot-without-warning in early-boot stage, last printk: Booting the kernel.
Date: Mon, 13 Mar 2017 17:25:04 +0300
Message-ID: <5211ff97-29ab-c3b5-670b-db98662ce009@virtuozzo.com>
In-Reply-To: <20170228031227.tm7flsxl7t7klspf@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4854009734182536527==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 02/28/2017 06:12 AM, Fengguang Wu wrote:
> Hi Alexander,
> =

> FYI, we find an old bug that's still alive in linux-next. The attached
> reproduce-* script may help debug the problem.
> =


...

> +------------------------------------------------------------------------=
--------------+------------+------------+
> |                                                                        =
              | c146a2b98e | 80a9201a59 |
> +------------------------------------------------------------------------=
--------------+------------+------------+
> | boot_successes                                                         =
              | 740        | 48         |
> | boot_failures                                                          =
              | 0          | 142        |
> | BUG:kernel_reboot-without-warning_in_early-boot_stage,last_printk:Booti=
ng_the_kernel | 0          | 131        |
> | BUG:kernel_in_stage                                                    =
              | 0          | 11         |
> +------------------------------------------------------------------------=
--------------+------------+------------+
> =



Indeed it is an old bug, I'll send a fix shortly. But the bisection result =
is not correct. This bug is actually much older.
Note that commit 80a9201a596 changes Kconfig dependency - it removes depend=
s on SLUB_DEBUG from config KASAN section.
And yours config has:
	# CONFIG_SLUB_DEBUG is not set

So you simply test c146a2b98e with CONFIG_KASAN=3Dn and 80a9201a59 with CON=
FIG_KASAN=3Dy

--===============4854009734182536527==--

