Content-Type: multipart/mixed; boundary="===============6294566069505255720=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [Revert "ppdev] 1701f68040: genirq: Flags mismatch irq 4. 00000000 (serial) vs. 00000080 (goldfish_pdev_bus)
Date: Sun, 29 May 2016 09:25:28 -0700
Message-ID: <CA+55aFyvxUJV+uSKVbfhf_BFmDoBwth=HXqC+oZ-V0j7A2xACA@mail.gmail.com>
In-Reply-To: <574b0aa9.uByHhFFKGUV1AySn%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6294566069505255720==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, May 29, 2016 at 8:28 AM, kernel test robot
<fengguang.wu@intel.com> wrote:
>
> 0day kernel testing robot got the below dmesg and the first bad commit is

This bisection seems unlikely.

I *think* what is going on is that the previous kernels ended up with
boot failures:

> +------------------------------------------------------------+-----------=
-+------------+-------------+
> |                                                            | 3b3b3bd977=
 | 1701f68040 | v4.6_052910 |
> +------------------------------------------------------------+-----------=
-+------------+-------------+
> | kernel_BUG_at_drivers/base/driver.c                        | 92        =
 |            |             |

and then when that went away (thanks to the commit you bisected to),
the "genirq: Flags mismatch" warning showed up because it now got past
that original bug.

I'm not sure what the fix to the 0day bisection should be. Maybe add
some test that the last "good" kernel actually booted?

               Linus

--===============6294566069505255720==--

