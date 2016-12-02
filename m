Content-Type: multipart/mixed; boundary="===============4311769153592070970=="
MIME-Version: 1.0
From: Petr Mladek <pmladek@suse.com>
To: lkp@lists.01.org
Subject: Re: [printk.c] ea0639c4d5: BUG:recent_printk_recursion
Date: Fri, 02 Dec 2016 11:05:58 +0100
Message-ID: <20161202100558.GR21230@pathway.suse.cz>
In-Reply-To: <20161201171232.GD31607@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============4311769153592070970==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri 2016-12-02 01:12:32, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> commit: ea0639c4d5c700ad63c0ace6a7a17877aac5b4c2 ("printk.c: removed unne=
cessary code")
> url: https://github.com/0day-ci/linux/commits/Sebastian-Duda/printk-c-rem=
oved-unnecessary-code/20161130-225006
> =

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

> on test machine: qemu-system-i386 -enable-kvm -m 256M
> =

> caused below changes:
> =

> =

> +-------------------------------------------------------+------------+---=
---------+
> |                                                       | ded6e842cf | ea=
0639c4d5 |
> +-------------------------------------------------------+------------+---=
---------+
> | boot_successes                                        | 19         | 8 =
         |
> | boot_failures                                         | 3          | 49=
         |

I am not surprised. The patch breaks counting of the space
needed to print the message. It is likely to cause buffer
overflows. I have already nacked it, see
https://lkml.kernel.org/r/20161130102231.GE24060(a)pathway.suse.cz

Anyway, thanks for testing.

Best Regards,
Petr

--===============4311769153592070970==--

