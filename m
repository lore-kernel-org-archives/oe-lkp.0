Content-Type: multipart/mixed; boundary="===============5284793016682989908=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@kernel.org>
To: lkp@lists.01.org
Subject: Re: [x86/mm] e2a7dcce31: kernel_BUG_at_arch/x86/mm/tlb.c
Date: Sun, 28 May 2017 08:57:15 -0700
Message-ID: <CALCETrXr-+AUXe8nkK0QDiFhBB_=JLpykXbCdnbi+UR=iMM72g@mail.gmail.com>
In-Reply-To: <1495980680.29205.68.camel@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5284793016682989908==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, May 28, 2017 at 7:11 AM, Rik van Riel <riel@redhat.com> wrote:
> On Sat, 2017-05-27 at 09:00 -0700, Andy Lutomirski wrote:
>> On Sat, May 27, 2017 at 6:31 AM, kernel test robot
>> <xiaolong.ye@intel.com> wrote:
>> >
>> > FYI, we noticed the following commit:
>> >
>> > commit: e2a7dcce31f10bd7471b4245a6d1f2de344e7adf ("x86/mm: Rework
>> > lazy TLB to track the actual loaded mm")
>> > https://git.kernel.org/cgit/linux/kernel/git/luto/linux.git
>> > x86/tlbflush_cleanup
>>
>> Ugh, there's an unpleasant interaction between this patch and
>> intel_idle.  I suspect that the intel_idle code in question is either
>> wrong or pointless,
>
> It would be pointless if my "make lazy TLB mode even lazier"
> patch from last year had been applied.
>
> https://patchwork.kernel.org/patch/9307541/
>
> I guess I'll go re-send that and investigate the intel_idle
> code in addition to that.

You might want to wait a bit until I'm done churning the code.  I
suspect that increased TLB laziness will look a bit different on top.

--===============5284793016682989908==--

