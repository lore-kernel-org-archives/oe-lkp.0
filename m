Content-Type: multipart/mixed; boundary="===============1714574178362407432=="
MIME-Version: 1.0
From: Rik van Riel <riel@surriel.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2 00/16] Multigenerational LRU Framework
Date: Wed, 14 Apr 2021 15:41:46 -0400
Message-ID: <db2f6f81d30945eb296c4dcc9824b1ad353cc777.camel@surriel.com>
In-Reply-To: <CAOUHufaRXbDHbEro1uE1CHvpWB4U67iroj0hT8CkUEOSAddzYQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1714574178362407432==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-04-14 at 13:14 -0600, Yu Zhao wrote:
> On Wed, Apr 14, 2021 at 9:59 AM Rik van Riel <riel@surriel.com>
> wrote:
> > On Wed, 2021-04-14 at 08:51 -0700, Andi Kleen wrote:
> > > >    2) It will not scan PTE tables under non-leaf PMD entries
> > > > that
> > > > do not
> > > >       have the accessed bit set, when
> > > >       CONFIG_HAVE_ARCH_PARENT_PMD_YOUNG=3Dy.
> > > =

> > > This assumes  that workloads have reasonable locality. Could
> > > there
> > > be a worst case where only one or two pages in each PTE are used,
> > > so this PTE skipping trick doesn't work?
> > =

> > Databases with large shared memory segments shared between
> > many processes come to mind as a real-world example of a
> > worst case scenario.
> =

> Well, I don't think you two are talking about the same thing. Andi
> was
> focusing on sparsity. Your example seems to be about sharing, i.e.,
> ihgh mapcount. Of course both can happen at the same time, as I
> tested
> here:
> https://lore.kernel.org/linux-mm/YHFuL%2FDdtiml4biw(a)google.com/#t
> =

> I'm skeptical that shared memory used by databases is that sparse,
> i.e., one page per PTE table, because the extremely low locality
> would
> heavily penalize their performance. But my knowledge in databases is
> close to zero. So feel free to enlighten me or just ignore what I
> said.

A database may have a 200GB shared memory segment,
and a worker task that gets spun up to handle a
query might access only 1MB of memory to answer
that query.

That memory could be from anywhere inside the
shared memory segment. Maybe some of the accesses
are more dense, and others more sparse, who knows?

A lot of the locality
will depend on how memory
space inside the shared memory segment is reclaimed
and recycled inside the database.

-- =

All Rights Reversed.

--===============1714574178362407432==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUFCQ0FBZEZpRUVLUjczcENDdEo1
WGozeUFEem5uZWtvVEUzb01GQW1CM1JYc0FDZ2tRem5uZWtvVEUKM29PUUtnZi9jSFllR1lMK3ZF
R28ydWpSN1FKMUlPMEt6V1FvVnY5VGpXY2ZZY3RpVFhsK2p6WWYvZnV5QkxxaApIaytWaGdJK2p4
a1FsamJqZzdUaGExODNnUVJseWtkanJnaEdJOG9qUUZrTkl5MXNOUkgvSllBZWl1cWN3L3paCjNZ
VUpoeFM3V0ZjemdJN0tRNStpTFhGVFFlYnIrVVFFL0x3ZlMrRlc5Z1RZVmc4T3dpeklmZVFkQ293
UW9pQXQKcURiYVZLUVJDbEZ5R1lMN20zRkthODRTb2RFWEZmMEpJWStxUHJUcU9XTXdIOTNsaU8w
clFoTU5KSWN3OVhCeApWZDZOczE4WVhPQ2sydFVsdjlsVk1WQlBNK2NNN1B4RkRQamdhWmYrTDVO
MkI3ei9IMkE0VXNpalVuMVpEZTlVClJ6Y0lROXJ0UDNIRjB0RC9sd1c0QzBwbkJMQXdMZz09Cj1C
ZU53Ci0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============1714574178362407432==--

