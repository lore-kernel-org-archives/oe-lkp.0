Content-Type: multipart/mixed; boundary="===============1829907219010882339=="
MIME-Version: 1.0
From: Byungchul Park <byungchul.park@lge.com>
To: lkp@lists.01.org
Subject: Re: [lockdep] b09be676e0 BUG: unable to handle kernel NULL pointer dereference at 000001f2
Date: Tue, 10 Oct 2017 14:30:46 +0900
Message-ID: <20171010053045.GC3323@X58A-UD3R>
In-Reply-To: <20171003171824.te5cxms2hq634tvi@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1829907219010882339==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 03, 2017 at 07:18:24PM +0200, Ingo Molnar wrote:
> =

> * Linus Torvalds <torvalds@linux-foundation.org> wrote:
> =

> > On Tue, Oct 3, 2017 at 7:06 AM, Fengguang Wu <fengguang.wu@intel.com>=
 wrote:
> > >
> > > This patch triggers a NULL-dereference bug at update_stack_state().
> > > Although its parent commit also has a NULL-dereference bug, however
> > > the call stack looks rather different. Both dmesg files are attached.
> > >
> > > It also triggers this warning, which is being discussed in another
> > > thread, so CC Josh. The full dmesg attached, too.
> > >
> > >         Please press Enter to activate this console.
> > >         [  138.605622] WARNING: kernel stack regs at be299c9a in proc=
d:340 has bad 'bp' value 000001be
> > >         [  138.605627] unwind stack type:0 next_sp:  (null) mask:0x2 =
graph_idx:0
> > >         [  138.605631] be299c9a: 299ceb00 (0x299ceb00)
> > >         [  138.605633] be299c9e: 2281f1be (0x2281f1be)
> > >         [  138.605634] be299ca2: 299cebb6 (0x299cebb6)
> > >
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git ma=
ster
> > >
> > > commit b09be676e0ff25bd6d2e7637e26d349f9109ad75
> > >      locking/lockdep: Implement the 'crossrelease' feature
> > =

> > Can we consider just reverting the crossrelease thing?
> =

> Yes, I'll do that tomorrow. I was always a bit unhappy about cross-releas=
e, =

> because it breaks the 'owner task owns the lock' model. Plus I don't think

Of course, I may have taken a mistake. It would be appriciated if you
let me know and fix it, if it actually exists.

But I believe that the design of crossrelease to detect deadlocks in
more general way is correct.

As you know, dependencies do not have to be created by the model, while
all waiters can create dependencies causing deadlocks. So the model
should be broken for such waiters to be in.


--===============1829907219010882339==--

