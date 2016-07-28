Content-Type: multipart/mixed; boundary="===============2282387711012180430=="
MIME-Version: 1.0
From: Shaohua Li <shli@fb.com>
To: lkp@lists.01.org
Subject: Re: [md] 8430e7e0af: BUG: unable to handle kernel NULL pointer dereference at 0000000000000050
Date: Thu, 28 Jul 2016 09:07:40 -0700
Message-ID: <20160728160738.GA48252@shli-mbp.local>
In-Reply-To: <20160728063752.GB21499@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============2282387711012180430==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 28, 2016 at 02:37:52PM +0800, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> commit 8430e7e0af9a15063b90343e3beebc164c8e90f3 ("md: disconnect device f=
rom personality before trying to remove it.")
> =

> in testcase: mdadm-selftests
> with following parameters:
> =

> 	test_prefix: 10

Thanks, fixed in my tree.

Thanks,
Shaohua

--===============2282387711012180430==--

