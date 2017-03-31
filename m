Content-Type: multipart/mixed; boundary="===============5018637690954905534=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: lkp@lists.01.org
Subject: Re: [printk] fbc14616f4: BUG:kernel_reboot-without-warning_in_test_stage
Date: Fri, 31 Mar 2017 11:35:06 +0900
Message-ID: <20170331023506.GB3493@jagdpanzerIV.localdomain>
In-Reply-To: <20170330213829.GA21476@inn.lkp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5018637690954905534==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (03/31/17 05:38), kernel test robot wrote:
> FYI, we noticed the following commit:
> =

> commit: fbc14616f483788afabe77d05bfb99883dc66c73 ("printk: enable printk =
offloading")
> url: https://github.com/0day-ci/linux/commits/Sergey-Senozhatsky/printk-i=
ntroduce-printing-kernel-thread/20170330-185752

thanks for the report!

[..]
> +-------------------------------------------------+------------+---------=
---+
> |                                                 | fd8b6b120c | fbc14616=
f4 |
> +-------------------------------------------------+------------+---------=
---+
> | boot_successes                                  | 8          | 8       =
   |
> | boot_failures                                   | 0          | 6       =
   |
> | BUG:kernel_reboot-without-warning_in_test_stage | 0          | 4       =
   |
> | BUG:kernel_hang_in_test_stage                   | 0          | 2       =
   |
> +-------------------------------------------------+------------+---------=
---+
> =

> =

> =

> [   21.009531] VFS: Warning: trinity-c2 using old stat() call. Recompile =
your binary.
> [   21.148898] VFS: Warning: trinity-c0 using old stat() call. Recompile =
your binary.
> [   22.298208] warning: process `trinity-c2' used the deprecated sysctl s=
ystem call with =

> =

> Elapsed time: 310
> BUG: kernel reboot-without-warning in test stage

so as far as I understand, this is the "missing kernel messages"
type of bug report. a worst case scenario.

	-ss

--===============5018637690954905534==--

