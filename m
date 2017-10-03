Content-Type: multipart/mixed; boundary="===============0645165766634388027=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lockdep] b09be676e0 BUG: unable to handle kernel NULL pointer dereference at 000001f2
Date: Tue, 03 Oct 2017 19:18:24 +0200
Message-ID: <20171003171824.te5cxms2hq634tvi@gmail.com>
In-Reply-To: <CA+55aFxa_1pCMt-GQmBZUzRbc8_UY9sacmEaCqkDM1_=sq8y_A@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0645165766634388027==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* Linus Torvalds <torvalds@linux-foundation.org> wrote:

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

Yes, I'll do that tomorrow. I was always a bit unhappy about cross-release, =

because it breaks the 'owner task owns the lock' model. Plus I don't think
we found that many real bugs with it - in a 20+ years old, 15+ MLOC code
base that never run with such a debugging facility enabled.

Thanks,

	Ingo

--===============0645165766634388027==--

