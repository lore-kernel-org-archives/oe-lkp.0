Content-Type: multipart/mixed; boundary="===============5302164110980690939=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] x86/asm: Pad assembly functions with INT3 instructions
Date: Tue, 15 May 2018 16:28:58 -0700
Message-ID: <CA+55aFySWuQvnJ=27GUbz+h=Jop6F2TYFqnALAaeXXiPivLtqQ@mail.gmail.com>
In-Reply-To: <20180515225845.GB21902@avx2>
List-Id: <oe-lkp.lists.linux.dev>

--===============5302164110980690939==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 15, 2018 at 3:58 PM Alexey Dobriyan <adobriyan@gmail.com> wro=
te:
>          jb      resume_kernel                   # not returning to v8086
or userspace
> -
> -ENTRY(resume_userspace)

I went back in history, and we used to have multiple "jmp resume_userspace"
including even the vm86.c code (in a different file) doing that, so there
*used* to be a reason for this being a global symbol (and yes, we had a
fall-through to that global symbol even in those days).

That said, I also look at "resume_kernel". There's no reason to make that
globally visible afaik. It looks local to entry_32.S, and should look like
restore_all rather than resume_userspace.

So we probably should remove the ENTRY() for that too, and just make it be

          ALIGN
         resume_kernel:

instead?

I guess the reason for removing that other ENTRY() is different from this
case, though..

                Linus

--===============5302164110980690939==--

