Content-Type: multipart/mixed; boundary="===============5883160158341661249=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: BUG: KASAN: use-after-free in cmp_ex_search+0x29/0x71
Date: Thu, 30 Nov 2017 09:27:30 +0100
Message-ID: <20171130082730.bmvwejejovqrp3ez@hirez.programming.kicks-ass.net>
In-Reply-To: <20171130045443.2pflxxr2da2gk6ys@olymp>
List-Id: <oe-lkp.lists.linux.dev>

--===============5883160158341661249==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2017 at 06:16:58AM +0100, Thomas Meyer wrote:
> On Thu, Nov 30, 2017 at 11:36:06AM +0800, Fengguang Wu wrote:


> > [   40.847825] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > [   40.848720] BUG: KASAN: use-after-free in cmp_ex_search+0x29/0x71:
> > 						ex_to_insn at lib/extable.c:23
> > 						 (inlined by) cmp_ex_search at lib/extable.c:104

Right after this it does:

> [   40.872223] kernel tried to execute NX-protected page - exploit attemp=
t? (uid: 0)
> [   40.873011] BUG: unable to handle kernel paging request at fffffbfff07=
66694
> [   40.874648] IP: 0xfffffbfff0766694
> [   40.875112] PGD 1b3df067 P4D 1b3df067 PUD 1b3de067 PMD 800000001ac001e3
> [   40.876293] Thread overran stack, or stack corrupted

which seems to suggest the machine is completely fucked and the uaf
could very well be the result of that.

--===============5883160158341661249==--

