Content-Type: multipart/mixed; boundary="===============0652094109208530133=="
MIME-Version: 1.0
From: Yu Zhao <yuzhao@google.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2 00/16] Multigenerational LRU Framework
Date: Wed, 14 Apr 2021 14:08:20 -0600
Message-ID: <CAOUHufY_hHs_dW-5PCGgw5-vnx4jERAmMF7_EoGYFTH-gthy2g@mail.gmail.com>
In-Reply-To: <db2f6f81d30945eb296c4dcc9824b1ad353cc777.camel@surriel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0652094109208530133==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 14, 2021 at 1:42 PM Rik van Riel <riel@surriel.com> wrote:
>
> On Wed, 2021-04-14 at 13:14 -0600, Yu Zhao wrote:
> > On Wed, Apr 14, 2021 at 9:59 AM Rik van Riel <riel@surriel.com>
> > wrote:
> > > On Wed, 2021-04-14 at 08:51 -0700, Andi Kleen wrote:
> > > > >    2) It will not scan PTE tables under non-leaf PMD entries
> > > > > that
> > > > > do not
> > > > >       have the accessed bit set, when
> > > > >       CONFIG_HAVE_ARCH_PARENT_PMD_YOUNG=3Dy.
> > > >
> > > > This assumes  that workloads have reasonable locality. Could
> > > > there
> > > > be a worst case where only one or two pages in each PTE are used,
> > > > so this PTE skipping trick doesn't work?
> > >
> > > Databases with large shared memory segments shared between
> > > many processes come to mind as a real-world example of a
> > > worst case scenario.
> >
> > Well, I don't think you two are talking about the same thing. Andi
> > was
> > focusing on sparsity. Your example seems to be about sharing, i.e.,
> > ihgh mapcount. Of course both can happen at the same time, as I
> > tested
> > here:
> > https://lore.kernel.org/linux-mm/YHFuL%2FDdtiml4biw(a)google.com/#t
> >
> > I'm skeptical that shared memory used by databases is that sparse,
> > i.e., one page per PTE table, because the extremely low locality
> > would
> > heavily penalize their performance. But my knowledge in databases is
> > close to zero. So feel free to enlighten me or just ignore what I
> > said.
>
> A database may have a 200GB shared memory segment,
> and a worker task that gets spun up to handle a
> query might access only 1MB of memory to answer
> that query.
>
> That memory could be from anywhere inside the
> shared memory segment. Maybe some of the accesses
> are more dense, and others more sparse, who knows?
>
> A lot of the locality
> will depend on how memory
> space inside the shared memory segment is reclaimed
> and recycled inside the database.

Thanks. Yeah, I guess we'll just need to see more benchmarks from the
database realm. Stay tuned :)
--===============0652094109208530133==--

