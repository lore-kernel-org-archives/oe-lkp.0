Content-Type: multipart/mixed; boundary="===============8074179972200326076=="
MIME-Version: 1.0
From: Kirill A. Shutemov <kirill@shutemov.name>
To: lkp@lists.01.org
Subject: Re: c88d71508e ("x86/boot/64: Rewrite startup_64() in C"): BUG: kernel reboot-without-warning in early-boot stage, last printk: Booting the kernel.
Date: Fri, 16 Jun 2017 12:27:42 +0300
Message-ID: <20170616092742.3yoeaba6thmyxguu@node.shutemov.name>
In-Reply-To: <20170616081630.mvc52ku6spchsqj4@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8074179972200326076==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 16, 2017 at 10:16:30AM +0200, Ingo Molnar wrote:
> =

> * kernel test robot <fengguang.wu@intel.com> wrote:
> =

> > Greetings,
> > =

> > 0day kernel testing robot got the below dmesg and the first bad commit =
is
> > =

> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git mas=
ter
> > =

> > commit c88d71508e36b514413464bd2e01f96f34583a0e
> > Author:     Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> > AuthorDate: Tue Jun 6 14:31:26 2017 +0300
> > Commit:     Ingo Molnar <mingo@kernel.org>
> > CommitDate: Tue Jun 13 08:56:54 2017 +0200
> > =

> >     x86/boot/64: Rewrite startup_64() in C
> >     =

> >     The patch write most of startup_64 logic in C.
> >     =

> >     This is preparation for 5-level paging enabling.
> >     =

> >     Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.co=
m>
> =

> Kirill, should I drop the 5-level paging series for now, or is there a fi=
x in the =

> works?

I'm looking into this.

-- =

 Kirill A. Shutemov

--===============8074179972200326076==--

