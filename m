Content-Type: multipart/mixed; boundary="===============3118205796470379274=="
MIME-Version: 1.0
From: Michael Ellerman <mpe@ellerman.id.au>
To: lkp@lists.01.org
Subject: Re: [PATCH] powerpc: secondary CPUs signal to master before setting active and online (fixes kernel BUG at kernel/smpboot.c:134!)
Date: Thu, 11 Dec 2014 10:06:29 +1100
Message-ID: <1418252789.26146.0.camel@ellerman.id.au>
In-Reply-To: <CA+55aFyR5PzNkojvEej1NXnpEFOPOYfnxCcPDAjg1rE79tQv7A@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3118205796470379274==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 2014-12-09 at 12:54 -0800, Linus Torvalds wrote:
> On Mon, Dec 8, 2014 at 3:58 PM, Anton Blanchard <anton@samba.org> wrote:
> > Hi Ingo,
> >
> >> At that point I thought the previous task_cpu() was somewhat ingrained
> >> in the scheduler and came up with the patch. If not, we could go on a
> >> hunt to see what else needs fixing.
> >
> > I had another look. The scheduled does indeed make assumptions about the
> > previous task_cpu, but we have a hammer to fix it up called
> > select_fallback_rq.
> >
> > I annotated select_fallback_rq, and did hit a case where the CPU was
> > not active. ppc64 patch below.
> =

> Anton, I'll assume I will get this through the usual powerpc pull request=
s?

Yeah I'll put it in my tree unless Anton objects.

cheers



--===============3118205796470379274==--

