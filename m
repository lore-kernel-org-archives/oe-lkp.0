Content-Type: multipart/mixed; boundary="===============0472882964581224061=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@kernel.org>
To: lkp@lists.01.org
Subject: Re: [x86/mm] e2a7dcce31: kernel_BUG_at_arch/x86/mm/tlb.c
Date: Sat, 27 May 2017 09:56:00 -0700
Message-ID: <CALCETrU0TyCxKKt482XBPQRP9r6E8JctOzw03SGXsYecBoGo0A@mail.gmail.com>
In-Reply-To: <CALCETrX71xoZN2MsPVm+zMg9XrrUyMz6bzfLn3B9Vs0cTnegQA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0472882964581224061==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, May 27, 2017 at 9:00 AM, Andy Lutomirski <luto@kernel.org> wrote:
> On Sat, May 27, 2017 at 6:31 AM, kernel test robot
> <xiaolong.ye@intel.com> wrote:
>>
>> FYI, we noticed the following commit:
>>
>> commit: e2a7dcce31f10bd7471b4245a6d1f2de344e7adf ("x86/mm: Rework lazy T=
LB to track the actual loaded mm")
>> https://git.kernel.org/cgit/linux/kernel/git/luto/linux.git x86/tlbflush=
_cleanup
>
> Ugh, there's an unpleasant interaction between this patch and
> intel_idle.  I suspect that the intel_idle code in question is either
> wrong or pointless, but I want to investigate further.  Ingo, can you
> hold off on applying this patch?

I think this is what's going on: intel_idle has an optimization and
sometimes calls leave_mm().  This is a rather expensive way of working
around x86 Linux's fairly weak lazy mm handling.  It also abuses the
whole switch_mm state machine.  In particular, there's no guarantee
that the mm is actually lazy at the time.  The old code didn't care,
but the new code can oops.

The short-term fix is to just reorder the code in leave_mm() to avoid the O=
OPS.

I think the long-term fix is to improve laziness and delete the
leave_mm() call from intel_idle entirely.  Doing that will be quite
simple on top of the PCID.  PCID needs to reliably track when the TLB
is stale without needing IPIs for every invalidation, and laziness
should be able to reuse the same mechanism.  Once we do this, I think
we may even be able to remove leave_mm() altogether.  (Rik should like
this, since it will let us suppress host TLB flush IPIs being sent to
CPUs in guest mode as well.)

--Andy

--===============0472882964581224061==--

