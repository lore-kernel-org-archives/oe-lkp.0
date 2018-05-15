Content-Type: multipart/mixed; boundary="===============3299845919893567293=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/asm] 51bad67ffb: int3:#[##]
Date: Tue, 15 May 2018 15:29:12 -0700
Message-ID: <CALCETrWjMdTn8OyKgaydjK12sP8XKHtuXonEVnVHFPQ=jUtQLA@mail.gmail.com>
In-Reply-To: <alpine.DEB.2.21.1805160009230.1605@nanos.tec.linutronix.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============3299845919893567293==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 15, 2018 at 3:25 PM Thomas Gleixner <tglx@linutronix.de> wrot=
e:

> On Wed, 16 May 2018, Alexey Dobriyan wrote:

> --- a/arch/x86/entry/entry_32.S
> +++ b/arch/x86/entry/entry_32.S
> @@ -338,6 +338,11 @@ END(ret_from_fork)
>          cmpl    $USER_RPL, %eax
>          jb      resume_kernel                   # not returning to v8086
or userspace

> +       /*
> +        * Jump over the alignment padding which is filled with int3
instructions
> +        */
> +       jmp     resume_userspace
> +
>   ENTRY(resume_userspace)

The problem is already solved, but NAK to this concept.  If we're going to
make ENTRY supply int3 alignment, then we need to avoid using ENTRY if we
fall through.  Jumping over the alignment is just silly.  The macro we
should use is GLOBAL.

--===============3299845919893567293==--

