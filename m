Content-Type: multipart/mixed; boundary="===============6401678017062638865=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@amacapital.net>
To: lkp@lists.01.org
Subject: Re: [x86/asm/entry] BUG: unable to handle kernel paging request
Date: Mon, 09 Mar 2015 06:15:54 -0700
Message-ID: <CALCETrV0WMp_LmY2rwO_3X72kD4xDrmiN9M1f3x-VEKEcj6ZOQ@mail.gmail.com>
In-Reply-To: <20150309114618.GA18686@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6401678017062638865==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mar 9, 2015 7:46 AM, "Ingo Molnar" <mingo@kernel.org> wrote:
>
>
> * Andy Lutomirski <luto@amacapital.net> wrote:
>
> > >>      */
> > >>     unsigned long        stack[64];
> > >>
> > >> Last I checked, 0x100 !=3D 64.  Also, wow, this is kind of disgustin=
g. :)
> > >
> > >
> > > Seems to be unused: I commented it out on "defconfig" build
> > > and got no build errors.
> >
> > It's used.  On 32-bit, NMIs don't use task gates (I don't know why),
>
> So task gates were a sexy hardware acceleration feature, eons ago, and
> we used to rely on them a lot, but why should we use task gates for
> NMIs on modern CPUs?
>
> NMIs are performance critical for profiling, and task gates are more
> expensive than interrupt gates. Task gates are also an x86 anachronism
> whose performance might change negatively in the future. We don't use
> 32-bit segmentation tricks for similar reasons.
>
> The only place where we use task gates is the double fault handler,
> and we only do it because we must: if pagetables are screwed up then
> we really have to create a new context from scratch to be able to
> print debug info.

Makes sense.  I play with 32-bit stuff so rarely that I have very
little idea how it performs.

--Andy

--===============6401678017062638865==--

