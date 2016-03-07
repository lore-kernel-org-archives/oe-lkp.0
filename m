Content-Type: multipart/mixed; boundary="===============7396288555018894582=="
MIME-Version: 1.0
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [gpu/i915] 7632469f92: BUG: kernel boot crashed
Date: Mon, 07 Mar 2016 21:23:53 +0100
Message-ID: <56DDE359.8010007@linutronix.de>
In-Reply-To: <8760xhr2i1.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7396288555018894582==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 02/22/2016 01:51 AM, kernel test robot wrote:
> FYI, we noticed the below changes on
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git lin=
ux-4.4.y-rt
> commit 7632469f927db4e8ebecfbc59bba16c14974a474 ("gpu/i915: don't open co=
de these things")
> =

> =

> +-------------------------+------------+------------+
> |                         | 6e4ba49cad | 7632469f92 |
> +-------------------------+------------+------------+
> | boot_successes          | 15         | 0          |
> | boot_failures           | 0          | 18         |
> | BUG:kernel_boot_crashed | 0          | 16         |
> | BUG:kernel_boot_hang    | 0          | 2          |
> +-------------------------+------------+------------+

nope, that can't be. 7632469f92 does not boot, correct. The last thing
I see is

[    0.000000] Console: colour VGA+ 80x25

same in the dmesg.xz you sent. 6e4ba49cad does not boot either. The
difference is that 6e4ba49cad does not compile while the following
commit fixes the compile issue.

Sebastian


--===============7396288555018894582==--

