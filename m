Content-Type: multipart/mixed; boundary="===============8634574386476892213=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: lkp@lists.01.org
Subject: Re: [KVM] c3e0c8c2e8: leaking-addresses.proc..data..ro_after_init.
Date: Mon, 05 Sep 2022 10:38:06 +0800
Message-ID: <YxVhDnUBWHxErg0S@rli9-MOBL1.ccr.corp.intel.com>
In-Reply-To: <e633e50a-a72a-0d55-7c96-a1853eff1b8e@leemhuis.info>
List-Id: <oe-lkp.lists.linux.dev>

--===============8634574386476892213==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 03, 2022 at 12:27:19PM +0200, Thorsten Leemhuis wrote:
> On 02.09.22 14:26, Philip Li wrote:
> > On Fri, Sep 02, 2022 at 12:54:05PM +0200, Thorsten Leemhuis wrote:
> >> On 01.09.22 15:24, Philip Li wrote:
> >>> On Thu, Sep 01, 2022 at 02:12:39PM +0200, Thorsten Leemhuis wrote:
> >
> > [...]
> >
> > Thanks for the encouragement :-) The flow/process is very helpful. We w=
ill follow
> > up a few things before we resuming the tracking
> > [...]
> =

> Great, thx!
> =

> >>> Usuaally, we also ping/discuss with developer when an issue enters
> >>> mainline if there's no response. This is one reason we tries to conne=
ct
> >>> with regzbot to track the issue on mainline, but we missed the point =
that
> >>> you mention below (it need look important).
> >>
> >> I just want to prevent the list of tracked regressions becoming too lo=
ng
> >> (and thus obscure) due to many issues that are not worth tracking, as I
> >> fear people will then start to ignore regzbot and its reports. :-/
> > =

> > got it, we will be very careful to selectly tracking. Maybe we don't ne=
ed
> > track the issue if it is responsed by developer quickly and can be solv=
ed
> > directly.
> =

> Maybe, but that will always bear the risk that something gets in the way
> (say a big problem is found in the proposed fix) and the regression in
> the end gets forgotten and remains unfixed -- which my tracking tries to
> prevent. Hence I'd say doing it the other way around (adding all
> regressions reported by the 0-day folks to regzbot and remove reports
> after a week or two if it's apparently something that can be ignored)
> would be the better approach.

Got it, we will follow this approach, to track the issue but remove them
after a week or two.

> =

> > But only track the one that is valuable, while it need more discussion,=
 extra
> > testing, investigation and so one, that such problem can't be straight =
forward
> > to solve in short time. For such case, the tracking helps us to get bac=
k to this
> > even when there's a pause, like developer is blocked by testing or need=
 switch
> > to other effort. This is just my thinking.
> =

> Yeah, the problem is just: it's easy to forget the regression to the
> tracking. :-/
> =

> >> Are you or someone from the 0day team an LPC? Then we could discuss th=
is
> >> in person there.
> > =

> > We will join 2 MC (Rust, Testing) but all virtually, thus not able to d=
iscuss in
> > person :-( =

> =

> Okay, was worth asking. :-D
> =

> > But we are glad to join any further discussion or follow the suggested
> > rule if you have some discussion with other CI and reporters.
> =

> Yeah, I'm pretty sure we'll find a way to make everybody happy.
> =

> Ciao, Thorsten
--===============8634574386476892213==--

