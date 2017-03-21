Content-Type: multipart/mixed; boundary="===============2633483859393439539=="
MIME-Version: 1.0
From: Thomas Garnier <thgarnie@google.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86] 69218e4799: BUG:kernel_hang_in_boot_stage
Date: Tue, 21 Mar 2017 12:23:10 -0700
Message-ID: <CAJcbSZHFYz4wpBftvS40Gv9X5Epuk43wLStv9-7axWd3965fcw@mail.gmail.com>
In-Reply-To: <CA+55aFyz-snHPk=GkE7mHzd3r8nzWy4DnFEnNGLrn_ck4rPKwA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2633483859393439539==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 21, 2017 at 12:20 PM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, Mar 21, 2017 at 11:16 AM, Thomas Garnier <thgarnie@google.com> =
wrote:
> > This error happens even with Andy TLS fix on 32-bit (GDT is on fixmap
> > but not readonly). I am looking into it.
> >
> > KVM internal error. Suberror: 3
> > extra data[0]: 80000b0e
> > extra data[1]: 31
>
> If I read that right, it's extra data[1] 0x31, which EXIT_REASON_EPT_MISC=
ONFIG.
>
> I'm not seeing how the A bit in a GDT entry could have anything to do
> with it. I'm assuming it happens even without Andy's patch?

Correct.

>
>                   Linus




-- =

Thomas

--===============2633483859393439539==--

