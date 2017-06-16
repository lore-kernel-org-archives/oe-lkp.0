Content-Type: multipart/mixed; boundary="===============2542506097431778708=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: c88d71508e ("x86/boot/64: Rewrite startup_64() in C"): BUG: kernel reboot-without-warning in early-boot stage, last printk: Booting the kernel.
Date: Fri, 16 Jun 2017 10:16:30 +0200
Message-ID: <20170616081630.mvc52ku6spchsqj4@gmail.com>
In-Reply-To: <59416012.KgnHJ9oFpPFgBi1m%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2542506097431778708==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* kernel test robot <fengguang.wu@intel.com> wrote:

> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> =

> commit c88d71508e36b514413464bd2e01f96f34583a0e
> Author:     Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> AuthorDate: Tue Jun 6 14:31:26 2017 +0300
> Commit:     Ingo Molnar <mingo@kernel.org>
> CommitDate: Tue Jun 13 08:56:54 2017 +0200
> =

>     x86/boot/64: Rewrite startup_64() in C
>     =

>     The patch write most of startup_64 logic in C.
>     =

>     This is preparation for 5-level paging enabling.
>     =

>     Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

Kirill, should I drop the 5-level paging series for now, or is there a fix =
in the =

works?

Thanks,

	Ingo

--===============2542506097431778708==--

