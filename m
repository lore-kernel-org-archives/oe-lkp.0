Content-Type: multipart/mixed; boundary="===============9135393159641041328=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: [x86/mm] e2a7dcce31: kernel_BUG_at_arch/x86/mm/tlb.c
Date: Sun, 28 May 2017 10:51:47 +0200
Message-ID: <20170528085147.dazpglz4my6o7isg@gmail.com>
In-Reply-To: <CALCETrX71xoZN2MsPVm+zMg9XrrUyMz6bzfLn3B9Vs0cTnegQA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9135393159641041328==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* Andy Lutomirski <luto@kernel.org> wrote:

> On Sat, May 27, 2017 at 6:31 AM, kernel test robot
> <xiaolong.ye@intel.com> wrote:
> >
> > FYI, we noticed the following commit:
> >
> > commit: e2a7dcce31f10bd7471b4245a6d1f2de344e7adf ("x86/mm: Rework lazy =
TLB to track the actual loaded mm")
> > https://git.kernel.org/cgit/linux/kernel/git/luto/linux.git x86/tlbflus=
h_cleanup
> =

> Ugh, there's an unpleasant interaction between this patch and
> intel_idle.  I suspect that the intel_idle code in question is either
> wrong or pointless, but I want to investigate further.  Ingo, can you
> hold off on applying this patch?

Yeah, will wait for the next iteration of your series.

Thanks,

	Ingo

--===============9135393159641041328==--

