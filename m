Content-Type: multipart/mixed; boundary="===============6898331917094780188=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: lkp@lists.01.org
Subject: Re: [KVM] c3e0c8c2e8: leaking-addresses.proc..data..ro_after_init.
Date: Fri, 02 Sep 2022 20:26:07 +0800
Message-ID: <YxH2X8gMWyJeKPRa@rli9-MOBL1.ccr.corp.intel.com>
In-Reply-To: <57c596f7-014f-1833-3173-af3bad2ca45d@leemhuis.info>
List-Id: <oe-lkp.lists.linux.dev>

--===============6898331917094780188==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 02, 2022 at 12:54:05PM +0200, Thorsten Leemhuis wrote:
> On 01.09.22 15:24, Philip Li wrote:
> > On Thu, Sep 01, 2022 at 02:12:39PM +0200, Thorsten Leemhuis wrote:
> >> Hi, this is your Linux kernel regression tracker.
> >>
> >> On 15.08.22 16:34, kernel test robot wrote:
> >>> Greeting,
> >>>
> >>> FYI, we noticed the following commit (built with gcc-11):
> >>>
> >>> commit: c3e0c8c2e8b17bae30d5978bc2decdd4098f0f99 ("KVM: x86/mmu: Full=
y re-evaluate MMIO caching when SPTE masks change")
> >>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> >>>
> >>> in testcase: leaking-addresses
> >>> version: leaking-addresses-x86_64-4f19048-1_20220518
> >>> with following parameters:
> >>>
> >>> 	ucode: 0x28
> >>>
> >>> on test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4770 CPU @ =
3.40GHz with 16G memory
> >>>
> >>> caused below changes (please refer to attached dmesg/kmsg for entire =
log/backtrace):
> >>>
> >>> If you fix the issue, kindly add following tag
> >>> Reported-by: kernel test robot <oliver.sang@intel.com>
> >>>
> >>> [...]
> >>>
> >>> #regzbot introduced: c3e0c8c2e8
> >>
> >> Removing this from the list of tracked regressions:
> >>
> >> #regzbot invalid: report from the kernel test report that was ignored =
by
> >> developers, so I assume it's not something bad
> >>
> >> To explain: Yeah, maybe tracking regressions found by CI systems in
> >> regzbot might be a good idea now or in the long run. If you are from
> >> Intel and would like to discuss how to do this, please get in touch (I
> >> tried recently, but got no answer[1]).
> > =

> > Sorry, this was a mistake that we missed [1] to provide our reply. I wi=
ll
> > reply to the questions in that one soon.
> =

> Thx!
> =

> >> But I'm not sure if it's a good idea right now to get regzbot involved
> >> by default (especially as long as the reports are not telling develope=
rs
> >> to add proper "Link:" tags that would allow regzbot to notice when fix=
es
> >
> > Apologize again that we started to track mainline regression we found b=
efore
> > we fully understand [2], which probably not the effective usage. Especi=
ally
> > we missed the initial touch and led to more improper usage.
> =

> No worries, as maybe it's a good thing to have the 0day reports in
> there, even if some of its reports don't get any traction. But having
> them in the list of tracked regressions gives them some more visibility
> for a while -- and at least one more set of eyes (mine) that take a look
> at it. And it's not that much work for me or anybody else to close the
> issue in regzbot (say after a week or two) if no developer acts on it
> because it's irrelevant from their point of view. But would still be
> better if they'd state that publicly themselves; in that case they even
> could tell regzbot to ignore the issue; your report's could tell people
> how to do that (e.g. "#regzbot invalid some_reason").

Thanks for the encouragement :-) The flow/process is very helpful. We will =
follow
up a few things before we resuming the tracking

1) Add Link tag

2) Do internal judgement of mainline regression we found for whether it is
important, so we do some filtering at initial period to avoid bringing nois=
e to the list.

3) Add the hint as you suggested here, so it can be easily invalidate by de=
veloper.

Also some thinking below.

> =

> >> for the problem are posted or merged; see [1] and [2]), as it looks li=
ke
> >> developers ignore quite a few (many?) reports like the one partly quot=
ed
> >> above.
> >>
> >> I guess there are various reasons why developers do so (too many false
> >> positives? issues unlikely to happen in practice? already fixed?).
> > =

> > agree, not all reports we send out got response even it was reported on
> > mainline (0day does wide range testing include the repos from developer,
> > so the reports are against these repos and mainline/next).
> > =

> > Usuaally, we also ping/discuss with developer when an issue enters
> > mainline if there's no response. This is one reason we tries to connect
> > with regzbot to track the issue on mainline, but we missed the point th=
at
> > you mention below (it need look important).
> =

> I just want to prevent the list of tracked regressions becoming too long
> (and thus obscure) due to many issues that are not worth tracking, as I
> fear people will then start to ignore regzbot and its reports. :-/

got it, we will be very careful to selectly tracking. Maybe we don't need
track the issue if it is responsed by developer quickly and can be solved
directly.

But only track the one that is valuable, while it need more discussion, ext=
ra
testing, investigation and so one, that such problem can't be straight forw=
ard
to solve in short time. For such case, the tracking helps us to get back to=
 this
even when there's a pause, like developer is blocked by testing or need swi=
tch
to other effort. This is just my thinking.

> =

> >> Normally I'd say "this is a regression and I should try to find out and
> >> prod developers to get it fixed". And I'll do that if the issue
> >> obviously looks important to a Linux kernel generalist like me.
> > =

> > got it, thanks for the info, i found earlier you tracked a bug from ker=
nel
> > test robot, which should be the case that you thought it was important.
> =

> Yeah, some of the reports are valuable, that's why I guess it makes
> sense to track at least some of them. The question is, how to filter the
> bad ones out or how to pick just the valuable ones...

Currently what in my mind is we will consider performance regression like
around or larger than 10% for certain test case, or some general tests such
as kselftests, or serious boot issue.

Or if you considers certain reports are valuable and track them, we will al=
so
learn from this to get better understanding of what worth tracking now.

> =

> Are you or someone from the 0day team an LPC? Then we could discuss this
> in person there.

We will join 2 MC (Rust, Testing) but all virtually, thus not able to discu=
ss in
person :-( But we are glad to join any further discussion or follow the sug=
gested
rule if you have some discussion with other CI and reporters.

> =

> >> But that doesn't appear to be the case here (please correct me if I
> >> misjudged!). I hence chose to ignore this report, as there are quite a
> >> few other reports that are waiting for my attention, too. :-/
> > =

> > Thanks, we will revisit our process and consult you before we do any ac=
tual
> > action, and sorry for causing you extra effort to do cleanup.
> =

> No need to be sorry, everything is fine, up to some point I liked what
> you did. :-D
> =

> Ciao, Thorsten
--===============6898331917094780188==--

