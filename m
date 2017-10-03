Content-Type: multipart/mixed; boundary="===============0661421883193467717=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [lockdep] b09be676e0 BUG: unable to handle kernel NULL pointer dereference at 000001f2
Date: Tue, 03 Oct 2017 09:54:31 -0700
Message-ID: <CA+55aFxa_1pCMt-GQmBZUzRbc8_UY9sacmEaCqkDM1_=sq8y_A@mail.gmail.com>
In-Reply-To: <20171003140634.r2jzujgl62ox4uzh@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0661421883193467717==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 3, 2017 at 7:06 AM, Fengguang Wu <fengguang.wu@intel.com> wro=
te:
>
> This patch triggers a NULL-dereference bug at update_stack_state().
> Although its parent commit also has a NULL-dereference bug, however
> the call stack looks rather different. Both dmesg files are attached.
>
> It also triggers this warning, which is being discussed in another
> thread, so CC Josh. The full dmesg attached, too.
>
>         Please press Enter to activate this console.
>         [  138.605622] WARNING: kernel stack regs at be299c9a in procd:34=
0 has bad 'bp' value 000001be
>         [  138.605627] unwind stack type:0 next_sp:  (null) mask:0x2 grap=
h_idx:0
>         [  138.605631] be299c9a: 299ceb00 (0x299ceb00)
>         [  138.605633] be299c9e: 2281f1be (0x2281f1be)
>         [  138.605634] be299ca2: 299cebb6 (0x299cebb6)
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>
> commit b09be676e0ff25bd6d2e7637e26d349f9109ad75
>      locking/lockdep: Implement the 'crossrelease' feature

Can we consider just reverting the crossrelease thing?

The apparent stack corruption really worries me, and what worries me
most is that commit wasn't even supposed to change anything as far as
I can tell - it only adds infrastructure, no actual users that *set*
the cross-lock thing.

So the fact that it actually seems to cause behavioural changes seems
to be _really_ scary, and indicates that the code is completely
broken.

Or am I missing something?

                  Linus

--===============0661421883193467717==--

