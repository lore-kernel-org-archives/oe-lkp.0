Content-Type: multipart/mixed; boundary="===============1560941585782173127=="
MIME-Version: 1.0
From: Rik van Riel <riel@redhat.com>
To: lkp@lists.01.org
Subject: Re: [x86/mm] e2a7dcce31: kernel_BUG_at_arch/x86/mm/tlb.c
Date: Sun, 28 May 2017 10:11:20 -0400
Message-ID: <1495980680.29205.68.camel@redhat.com>
In-Reply-To: <CALCETrX71xoZN2MsPVm+zMg9XrrUyMz6bzfLn3B9Vs0cTnegQA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1560941585782173127==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, 2017-05-27 at 09:00 -0700, Andy Lutomirski wrote:
> On Sat, May 27, 2017 at 6:31 AM, kernel test robot
> <xiaolong.ye@intel.com> wrote:
> > =

> > FYI, we noticed the following commit:
> > =

> > commit: e2a7dcce31f10bd7471b4245a6d1f2de344e7adf ("x86/mm: Rework
> > lazy TLB to track the actual loaded mm")
> > https://git.kernel.org/cgit/linux/kernel/git/luto/linux.git
> > x86/tlbflush_cleanup
> =

> Ugh, there's an unpleasant interaction between this patch and
> intel_idle.=C2=A0=C2=A0I suspect that the intel_idle code in question is =
either
> wrong or pointless,

It would be pointless if my "make lazy TLB mode even lazier"
patch from last year had been applied.

https://patchwork.kernel.org/patch/9307541/

I guess I'll go re-send that and investigate the intel_idle
code in addition to that.

--===============1560941585782173127==--

