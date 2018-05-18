Content-Type: multipart/mixed; boundary="===============5356144381598240714=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/asm] 51bad67ffb: int3:#[##]
Date: Fri, 18 May 2018 09:15:59 +0200
Message-ID: <20180518071559.GA26358@gmail.com>
In-Reply-To: <CA+55aFzTpkn_fokmm+ddi+cgk5K3EOftRmPad+NkUb5W2z0Fqg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5356144381598240714==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Tue, May 15, 2018 at 3:43 PM Josh Poimboeuf <jpoimboe@redhat.com> wr=
ote:
> =

> > Glancing through the 32-bit and 64-bit entry code, I didn't see any more
> > cases.  At least it will fail loudly if any such cases do still exist.
> =

> \Will it? Do we have objtool checks for it now?
> =

> Because without static checks, there could be things hiding that just don=
't
> happen normally (think compat code etc that for most people is just dead
> code).

And it's not just about infrequent uses, it's also about hard to debug cras=
hes =

like in suspend/resume code, where people can only report "machine is dead".

So I'm not sure this side effect of turning padding into crashes is good fo=
r =

overall robustness, without static analysis finding such bugs.

Thanks,

	Ingo

--===============5356144381598240714==--

