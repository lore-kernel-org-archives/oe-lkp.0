Content-Type: multipart/mixed; boundary="===============4617594599782691233=="
MIME-Version: 1.0
From: Yu Zhao <yuzhao@google.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2 00/16] Multigenerational LRU Framework
Date: Wed, 14 Apr 2021 13:14:55 -0600
Message-ID: <CAOUHufaRXbDHbEro1uE1CHvpWB4U67iroj0hT8CkUEOSAddzYQ@mail.gmail.com>
In-Reply-To: <e0ad1b48a1ad0b6d3a1e79129f397ddb6c32fe35.camel@surriel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4617594599782691233==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 14, 2021 at 9:59 AM Rik van Riel <riel@surriel.com> wrote:
>
> On Wed, 2021-04-14 at 08:51 -0700, Andi Kleen wrote:
> > >    2) It will not scan PTE tables under non-leaf PMD entries that
> > > do not
> > >       have the accessed bit set, when
> > >       CONFIG_HAVE_ARCH_PARENT_PMD_YOUNG=3Dy.
> >
> > This assumes  that workloads have reasonable locality. Could there
> > be a worst case where only one or two pages in each PTE are used,
> > so this PTE skipping trick doesn't work?
>
> Databases with large shared memory segments shared between
> many processes come to mind as a real-world example of a
> worst case scenario.

Well, I don't think you two are talking about the same thing. Andi was
focusing on sparsity. Your example seems to be about sharing, i.e.,
ihgh mapcount. Of course both can happen at the same time, as I tested
here:
https://lore.kernel.org/linux-mm/YHFuL%2FDdtiml4biw(a)google.com/#t

I'm skeptical that shared memory used by databases is that sparse,
i.e., one page per PTE table, because the extremely low locality would
heavily penalize their performance. But my knowledge in databases is
close to zero. So feel free to enlighten me or just ignore what I
said.
--===============4617594599782691233==--

