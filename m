Content-Type: multipart/mixed; boundary="===============4451673703153486373=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] netdev: Fix sleeping inside wait event
Date: Wed, 29 Oct 2014 18:13:45 +0100
Message-ID: <20141029171345.GO12706@worktop.programming.kicks-ass.net>
In-Reply-To: <CAM_iQpXTyBT_4TrnYAoAuAE_jMto=2B=cutFggpHRMhvSrG7qg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4451673703153486373==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2014 at 09:29:55AM -0700, Cong Wang wrote:
> (Adding netdev(a)...)
> =

> On Wed, Oct 29, 2014 at 9:16 AM, Peter Zijlstra <peterz@infradead.org> =
wrote:
> >
> > Dave, this relies on bits currently in tip/sched/core, if you're ok I'll
> > merge it through that tree.
> >
> > ---
> > Subject: netdev: Fix sleeping inside wait event
> > From: Peter Zijlstra <peterz@infradead.org>
> > Date: Wed Oct 29 17:04:56 CET 2014
> >
> > rtnl_lock_unregistering() takes rtnl_lock() -- a mutex -- inside a
> > wait loop. The wait loop relies on current->state to function, but so
> > does mutex_lock(), nesting them makes for the inner to destroy the
> > outer state.
> >
> =

> While you are on it, please fix rtnl_lock_unregistering_all() too?

Ah, that's hidden someplace else, sure I can do that. Thanks for
pointing it out.

--===============4451673703153486373==--

