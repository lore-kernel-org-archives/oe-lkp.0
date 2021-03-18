Content-Type: multipart/mixed; boundary="===============1264520524928163624=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] objtool, static_call: Don't emit static_call_site for .exit.text
Date: Thu, 18 Mar 2021 09:47:29 +0100
Message-ID: <YFMToXI/3qjlMur4@hirez.programming.kicks-ass.net>
In-Reply-To: <YFMPmkMoae5cRzh+@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============1264520524928163624==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 18, 2021 at 09:30:18AM +0100, Peter Zijlstra wrote:
> On Thu, Mar 18, 2021 at 08:59:45AM +0100, Peter Zijlstra wrote:
> > On Wed, Mar 17, 2021 at 07:02:12PM -0500, Josh Poimboeuf wrote:
> > > On Wed, Mar 17, 2021 at 01:45:57PM +0100, Peter Zijlstra wrote:
> > > > arguably it simply isn't a good idea to use static_call() in __exit
> > > > code anyway, since module unload is never a performance critical pa=
th.
> > > =

> > > Couldn't you make the same argument about __init functions, which are
> > > allowed to do static calls?
> > =

> > I suppose we could indeed make that argument. Much of that code was
> > copied from jump_label without much consideration. And I now I suppose
> > I'll have to consider jump_label in __exit too :/
> > =

> > > We might consider a STATIC_CALL_SITE_EXIT flag, but I suppose we've r=
un
> > > out of flag space.
> > =

> > Yeah, we're definitely short on flags. Let me try and figure out when
> > exactly it's all discarded.
> =

> Ha!, x86 stuffs .exit.text in [__init_begin, __init_end) and it is
> discarded right along with initmem.
> =

> But that means it should match init and be tagged init and all *should*
> work, but somehow it doesn't... clearly I'm missing something again
> ARGH!

I found a race, look at this:

kernel_init()
	...
	free_initmem();
	...
	system_state =3D SYSTEM_RUNNING;

vs

__static_call_update()
	...
	if (static_call_is_init()) {
		if (system_state >=3D SYSTEM_RUNNING)
			continue;
	}


And this is *after* SMP bringup. Somehow I don't think you hit this
race, it is extremely unlikely

(jump_label has the exact same issue fwiw)
--===============1264520524928163624==--

