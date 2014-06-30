Content-Type: multipart/mixed; boundary="===============5072474956074905336=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [crypto] BUG: unable to handle kernel paging request at ffff88000bb88000
Date: Mon, 30 Jun 2014 05:28:14 +0000
Message-ID: <20140630053126.GA13887@localhost>
In-Reply-To: <42550233.Kxs179MjQV@myon.chronox.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============5072474956074905336==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Stephan,

On Sun, Jun 29, 2014 at 09:45:48PM +0200, Stephan Mueller wrote:
> Am Sonntag, 29. Juni 2014, 22:52:46 schrieb Fengguang Wu:
> =

> Hi Fengguang,
> =

> > Greetings,
> > =

> > 0day kernel testing robot got the below dmesg and the first bad commit =
is
> =

> May I ask whether there is anything special in your kernel config?

It's an x86_64 randconfig. You may find it in the attachment of the
original report email.

> This very bug should have been triggered already in all previous code lev=
els! =

> I am seriously wondering why this bug was not triggered before -- does ka=
lloc =

> somehow allocates more memory than you requested? And only your specific =

> kernel config made kalloc to allocate the exact amount of memory that was =

> requested?

Yeah the bug may have been triggered in other places. If you see
anything valuable from this bisect result, it would be great. Judging
from the comparison of 64d1cdfbe2 and its parent commit 3332ee2a17,
it's pretty reproducible, so easy to verify the possible fixes.

+--------------------------------------------------------------------------=
--+------------+------------+
|                                                                          =
  | 3332ee2a17 | 64d1cdfbe2 |
+--------------------------------------------------------------------------=
--+------------+------------+
| boot_successes                                                           =
  | 81         | 3          |
| boot_failures                                                            =
  | 0          | 23         |
| BUG:unable_to_handle_kernel_paging_request                               =
  | 0          | 20         |
| Oops                                                                     =
  | 0          | 19         |
| RIP:kzfree                                                               =
  | 0          | 15         |
| WARNING:CPU:PID:at_kernel/rcu/tree.c:rcu_do_batch()                      =
  | 0          | 9          |
| backtrace:cryptomgr_test                                                 =
  | 0          | 18         |
| backtrace:cpu_startup_entry                                              =
  | 0          | 3          |
| kernel_BUG_at_include/linux/mm.h                                         =
  | 0          | 1          |
...

Thanks,
Fengguang

--===============5072474956074905336==--

