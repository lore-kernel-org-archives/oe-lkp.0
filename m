Content-Type: multipart/mixed; boundary="===============0628189743131006338=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: lkp@lists.01.org
Subject: Re: [KVM] c3e0c8c2e8: leaking-addresses.proc..data..ro_after_init.
Date: Thu, 01 Sep 2022 21:24:21 +0800
Message-ID: <YxCyhTES9Nk+S94y@rli9-MOBL1.ccr.corp.intel.com>
In-Reply-To: <04ce8956-3285-345a-4ce5-b78500729e42@leemhuis.info>
List-Id: <oe-lkp.lists.linux.dev>

--===============0628189743131006338==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 01, 2022 at 02:12:39PM +0200, Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker.
> =

> On 15.08.22 16:34, kernel test robot wrote:
> > Greeting,
> > =

> > FYI, we noticed the following commit (built with gcc-11):
> > =

> > commit: c3e0c8c2e8b17bae30d5978bc2decdd4098f0f99 ("KVM: x86/mmu: Fully =
re-evaluate MMIO caching when SPTE masks change")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> > =

> > in testcase: leaking-addresses
> > version: leaking-addresses-x86_64-4f19048-1_20220518
> > with following parameters:
> > =

> > 	ucode: 0x28
> > =

> > =

> > =

> > on test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4770 CPU @ 3.=
40GHz with 16G memory
> > =

> > caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):
> > =

> > If you fix the issue, kindly add following tag
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> >
> > [...]
> >
> > #regzbot introduced: c3e0c8c2e8
> =

> Removing this from the list of tracked regressions:
> =

> #regzbot invalid: report from the kernel test report that was ignored by
> developers, so I assume it's not something bad
> =

> To explain: Yeah, maybe tracking regressions found by CI systems in
> regzbot might be a good idea now or in the long run. If you are from
> Intel and would like to discuss how to do this, please get in touch (I
> tried recently, but got no answer[1]).

Sorry, this was a mistake that we missed [1] to provide our reply. I will
reply to the questions in that one soon.

> =

> But I'm not sure if it's a good idea right now to get regzbot involved
> by default (especially as long as the reports are not telling developers
> to add proper "Link:" tags that would allow regzbot to notice when fixes

Apologize again that we started to track mainline regression we found before
we fully understand [2], which probably not the effective usage. Especially
we missed the initial touch and led to more improper usage.

> for the problem are posted or merged; see [1] and [2]), as it looks like
> developers ignore quite a few (many?) reports like the one partly quoted
> above.
> =

> I guess there are various reasons why developers do so (too many false
> positives? issues unlikely to happen in practice? already fixed?).

agree, not all reports we send out got response even it was reported on
mainline (0day does wide range testing include the repos from developer,
so the reports are against these repos and mainline/next).

Usuaally, we also ping/discuss with developer when an issue enters
mainline if there's no response. This is one reason we tries to connect
with regzbot to track the issue on mainline, but we missed the point that
you mention below (it need look important).

> Normally I'd say "this is a regression and I should try to find out and
> prod developers to get it fixed". And I'll do that if the issue
> obviously looks important to a Linux kernel generalist like me.

got it, thanks for the info, i found earlier you tracked a bug from kernel
test robot, which should be the case that you thought it was important.

> =

> But that doesn't appear to be the case here (please correct me if I
> misjudged!). I hence chose to ignore this report, as there are quite a
> few other reports that are waiting for my attention, too. :-/

Thanks, we will revisit our process and consult you before we do any actual
action, and sorry for causing you extra effort to do cleanup.

> =

> Ciao, Thorsten
> =

> [1]
> https://lore.kernel.org/all/384393c2-6155-9a07-ebd4-c2c410cbe947(a)leemhu=
is.info/
> =

> =

> [2] https://docs.kernel.org/process/handling-regressions.html
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org
--===============0628189743131006338==--

