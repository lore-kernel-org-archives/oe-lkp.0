Content-Type: multipart/mixed; boundary="===============6716651203830229178=="
MIME-Version: 1.0
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lockdep] b09be676e0 BUG: unable to handle kernel NULL pointer dereference at 000001f2
Date: Thu, 05 Oct 2017 08:01:46 -0500
Message-ID: <20171005130146.pmayo6owv362zfai@treble>
In-Reply-To: <CA+55aFxa_1pCMt-GQmBZUzRbc8_UY9sacmEaCqkDM1_=sq8y_A@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6716651203830229178==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 03, 2017 at 09:54:31AM -0700, Linus Torvalds wrote:
> On Tue, Oct 3, 2017 at 7:06 AM, Fengguang Wu <fengguang.wu@intel.com> w=
rote:
> >
> > This patch triggers a NULL-dereference bug at update_stack_state().
> > Although its parent commit also has a NULL-dereference bug, however
> > the call stack looks rather different. Both dmesg files are attached.
> >
> > It also triggers this warning, which is being discussed in another
> > thread, so CC Josh. The full dmesg attached, too.
> >
> >         Please press Enter to activate this console.
> >         [  138.605622] WARNING: kernel stack regs at be299c9a in procd:=
340 has bad 'bp' value 000001be
> >         [  138.605627] unwind stack type:0 next_sp:  (null) mask:0x2 gr=
aph_idx:0
> >         [  138.605631] be299c9a: 299ceb00 (0x299ceb00)
> >         [  138.605633] be299c9e: 2281f1be (0x2281f1be)
> >         [  138.605634] be299ca2: 299cebb6 (0x299cebb6)
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git mast=
er
> >
> > commit b09be676e0ff25bd6d2e7637e26d349f9109ad75
> >      locking/lockdep: Implement the 'crossrelease' feature
> =

> Can we consider just reverting the crossrelease thing?
> =

> The apparent stack corruption really worries me, and what worries me
> most is that commit wasn't even supposed to change anything as far as
> I can tell - it only adds infrastructure, no actual users that *set*
> the cross-lock thing.
> =

> So the fact that it actually seems to cause behavioural changes seems
> to be _really_ scary, and indicates that the code is completely
> broken.
> =

> Or am I missing something?

So I gave crossrelease a bad rap here.  Going back and looking at the
panics and stack dumps, what I thought was "stack corruption" was
actually the GCC unaligned stack pointer thing.

I suspect those commits were implicated in the bisections because they
started doing more stack traces in general, revealing some existing
32-bit unwinder/GCC/frame pointer bugs in the process.

So I just wanted to clarify that crossrelease seems to be innocent in
all this.  Sorry for the confusion!

-- =

Josh

--===============6716651203830229178==--

