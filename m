Content-Type: multipart/mixed; boundary="===============2122805018719537361=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86] 69218e4799: BUG:kernel_hang_in_boot_stage
Date: Tue, 21 Mar 2017 12:20:55 -0700
Message-ID: <CA+55aFyz-snHPk=GkE7mHzd3r8nzWy4DnFEnNGLrn_ck4rPKwA@mail.gmail.com>
In-Reply-To: <CAJcbSZGE9P3p6GV=7QHeDUesJZuR4mE=9tkMK+6SRbOoc-2kAg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2122805018719537361==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 21, 2017 at 11:16 AM, Thomas Garnier <thgarnie@google.com> wr=
ote:
> This error happens even with Andy TLS fix on 32-bit (GDT is on fixmap
> but not readonly). I am looking into it.
>
> KVM internal error. Suberror: 3
> extra data[0]: 80000b0e
> extra data[1]: 31

If I read that right, it's extra data[1] 0x31, which EXIT_REASON_EPT_MISCON=
FIG.

I'm not seeing how the A bit in a GDT entry could have anything to do
with it. I'm assuming it happens even without Andy's patch?

                  Linus

--===============2122805018719537361==--

