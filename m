Content-Type: multipart/mixed; boundary="===============8453887958971293561=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/mm] e2a7dcce31: kernel_BUG_at_arch/x86/mm/tlb.c
Date: Tue, 30 May 2017 21:05:01 -0700
Message-ID: <06ab9499-0c74-f2f0-251c-57244360219f@linux.intel.com>
In-Reply-To: <CALCETrU0TyCxKKt482XBPQRP9r6E8JctOzw03SGXsYecBoGo0A@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8453887958971293561==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 5/27/2017 9:56 AM, Andy Lutomirski wrote:
> On Sat, May 27, 2017 at 9:00 AM, Andy Lutomirski <luto@kernel.org> wrot=
e:
>> On Sat, May 27, 2017 at 6:31 AM, kernel test robot
>> <xiaolong.ye@intel.com> wrote:
>>>
>>> FYI, we noticed the following commit:
>>>
>>> commit: e2a7dcce31f10bd7471b4245a6d1f2de344e7adf ("x86/mm: Rework lazy =
TLB to track the actual loaded mm")
>>> https://git.kernel.org/cgit/linux/kernel/git/luto/linux.git x86/tlbflus=
h_cleanup
>>
>> Ugh, there's an unpleasant interaction between this patch and
>> intel_idle.  I suspect that the intel_idle code in question is either
>> wrong or pointless, but I want to investigate further.  Ingo, can you
>> hold off on applying this patch?
>
> I think this is what's going on: intel_idle has an optimization and
> sometimes calls leave_mm().  This is a rather expensive way of working
> around x86 Linux's fairly weak lazy mm handling.  It also abuses the
> whole switch_mm state machine.  In particular, there's no guarantee
> that the mm is actually lazy at the time.  The old code didn't care,
> but the new code can oops.
>
> The short-term fix is to just reorder the code in leave_mm() to avoid the=
 OOPS.

fwiw the reason the code is in intel_idle is to avoid tlb flush IPIs to idl=
e cpus,
once the cpu goes into a deep enough idle state.  In the current linux code,
that is done by no longer having the old TLB live on the CPU, by switching =
to the neutral
kernel-only set of tlbs.

If your proposed changes do that (avoid the IPI/wakeup), great!
(if not, there should be a way to do that)


--===============8453887958971293561==--

