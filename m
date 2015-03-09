Content-Type: multipart/mixed; boundary="===============5363763333779076398=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: [x86/asm/entry] BUG: unable to handle kernel paging request
Date: Mon, 09 Mar 2015 12:46:18 +0100
Message-ID: <20150309114618.GA18686@gmail.com>
In-Reply-To: <CALCETrU3Ums8SnNQttoCYkdDi-T=HkhCQs-jvF21Nh6igJ3Mhw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5363763333779076398==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* Andy Lutomirski <luto@amacapital.net> wrote:

> >>      */
> >>     unsigned long        stack[64];
> >>
> >> Last I checked, 0x100 !=3D 64.  Also, wow, this is kind of disgusting.=
 :)
> >
> >
> > Seems to be unused: I commented it out on "defconfig" build
> > and got no build errors.
> =

> It's used.  On 32-bit, NMIs don't use task gates (I don't know why), =


So task gates were a sexy hardware acceleration feature, eons ago, and =

we used to rely on them a lot, but why should we use task gates for =

NMIs on modern CPUs?

NMIs are performance critical for profiling, and task gates are more =

expensive than interrupt gates. Task gates are also an x86 anachronism =

whose performance might change negatively in the future. We don't use =

32-bit segmentation tricks for similar reasons.

The only place where we use task gates is the double fault handler, =

and we only do it because we must: if pagetables are screwed up then =

we really have to create a new context from scratch to be able to =

print debug info.

Thanks,

	Ingo

--===============5363763333779076398==--

