Content-Type: multipart/mixed; boundary="===============5673240477708212833=="
MIME-Version: 1.0
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lockdep] b09be676e0 BUG: unable to handle kernel NULL pointer dereference at 000001f2
Date: Thu, 05 Oct 2017 08:57:34 -0500
Message-ID: <20171005135734.7hiztv6i5abdcqv7@treble>
In-Reply-To: <201710052002.HIH12957.JOFFSMOVFHLOtQ@I-love.SAKURA.ne.jp>
List-Id: <oe-lkp.lists.linux.dev>

--===============5673240477708212833==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 05, 2017 at 08:02:33PM +0900, Tetsuo Handa wrote:
> Josh Poimboeuf wrote:
> > On Wed, Oct 04, 2017 at 06:44:50AM +0900, Tetsuo Handa wrote:
> > > Josh Poimboeuf wrote:
> > > > On Tue, Oct 03, 2017 at 11:28:15AM -0500, Josh Poimboeuf wrote:
> > > > > There are two bugs:
> > > > > =

> > > > > 1) Somebody -- presumably lockdep -- is corrupting the stack.  Ne=
ed the
> > > > >    lockdep people to look at that.
> > > > > =

> > > > > 2) The 32-bit FP unwinder isn't handling the corrupt stack very w=
ell,
> > > > >    It's blindly dereferencing untrusted data:
> > > > > =

> > > > > 	/* Is the next frame pointer an encoded pointer to pt_regs? */
> > > > > 	regs =3D decode_frame_pointer(next_bp);
> > > > > 	if (regs) {
> > > > > 		frame =3D (unsigned long *)regs;
> > > > > 		len =3D regs_size(regs);
> > > > > 		state->got_irq =3D true;
> > > > > =

> > > > >   On 32-bit, regs_size() dereferences the regs pointer before we =
know it
> > > > >   points to a valid stack.  I'll fix that, along with the other u=
nwinder
> > > > >   improvements I discussed with Linus.
> > > > =

> > > > Tetsuo and/or Fengguang,
> > > > =

> > > > Would you mind testing with this patch?  It should at least prevent=
 the
> > > > unwinder panic and should hopefully print a useful unwinder dump
> > > > instead.
> > > > =

> > > Here are two outputs.
> > =

> > Tetsuo, would you mind trying the following patch?
> > =

> Here are two outputs. Same kernel with different host hardware.

Thanks, these dumps are more "normal":

- The first shows a missing frame pointer setup in
  atomic64_add_unless_cx8().

- The second shows some frame pointer related issue in the kthread
  creation path.

I don't plan on fixing those, because we don't yet have objtool support
for 32-bit and we don't have anything which needs reliable stack traces
there.  I'll probably just disable those unwinder dumps on 32-bit.

-- =

Josh

--===============5673240477708212833==--

