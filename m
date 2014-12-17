Content-Type: multipart/mixed; boundary="===============8245850828381411186=="
MIME-Version: 1.0
From: Frederic Weisbecker <fweisbec@gmail.com>
To: lkp@lists.01.org
Subject: Re: [nohz] 2a16fc93d2c: kernel lockup on idle injection
Date: Wed, 17 Dec 2014 13:47:30 +0100
Message-ID: <20141217124724.GB20739@lerouge>
In-Reply-To: <alpine.DEB.2.11.1412171008260.17382@nanos>
List-Id: <oe-lkp.lists.linux.dev>

--===============8245850828381411186==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 17, 2014 at 10:11:58AM +0100, Thomas Gleixner wrote:
> On Wed, 17 Dec 2014, Frederic Weisbecker wrote:
> > On Tue, Dec 16, 2014 at 10:21:27PM +0100, Thomas Gleixner wrote:
> > > So instead of evaluating the whole nonsense a gazillion times in a row
> > > and firing pointless self ipis why are you not looking at the obvious
> > > solution of sane state change tracking?
> > =

> > Because I had to do it wrong first before somebody like you with a fres=
h mind
> > comes, look at the whole picture and propose a rethink :-)
> =

> Point taken.
>  =

> > >     I told all of you from the very beginning that remote accounting
> > >     is a key mechanism for this, but you keep insisting on hacking
> > >     around it.
> > =

> > I don't, and I think everybody has understood we are not going to accept
> > hacks to solve the 1hz issue.
> =

> You wish.
> =

> > I'm pretty sure you know what this is about to maintain a project with a
> > (variably) cruel lack of manpower ;-)
> =

> Oh yes! :(
>  =

> > Moreover I'm not the kind of kernel developer who ignores reviews (whet=
her pre or
> > post merge).
> =

> I know that.
>  =

> > So, no point in threatening a dependency to BROKEN or ripping out excep=
t perhaps to
> > push me out to other projects with more thankful managers.
> =

> This was not directed to you, really.
> =

> This was directed at the folks who randomly "fix" that code by voodoo
> bandaids instead of analyzing the root causes in the first
> place. You're the least one to blame for that.

Well I was about to propose a bad fix for powerclamp and I sometimes take
overengineering directions. I'm still to blame for several things 8-)

Sorry I got too touchy :-)

Anyway, I'll give a try to your proposition. Somehow I have always felt that
something was wrong with this tick_nohz_can_stop_tick() called all over the=
 place,
that plus the IPI that's often near the scheduler IPI.

I'm pretty sure this is going to help fixing some overhead issues I got rep=
orted.

Thanks a lot!

--===============8245850828381411186==--

