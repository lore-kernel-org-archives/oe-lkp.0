Content-Type: multipart/mixed; boundary="===============8158328962011705682=="
MIME-Version: 1.0
From: Alexander Potapenko <glider@google.com>
To: lkp@lists.01.org
Subject: Re: [PATCH] mm: slub: Fix slab walking for init_on_free
Date: Thu, 01 Aug 2019 13:28:31 +0200
Message-ID: <CAG_fn=VJm7M0wzMTti5RoegW56CY2YpikjEZryt8gMN5nOiyqw@mail.gmail.com>
In-Reply-To: <201907311304.2AAF454F5C@keescook>
List-Id: <oe-lkp.lists.linux.dev>

--===============8158328962011705682==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2019 at 10:05 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Wed, Jul 31, 2019 at 12:35:09PM -0700, Matthew Wilcox wrote:
> > On Wed, Jul 31, 2019 at 03:32:40PM -0400, Laura Abbott wrote:
> > > Fix this by ensuring the value we set with set_freepointer is either =
NULL
> > > or another value in the chain.
> > >
> > > Reported-by: kernel test robot <rong.a.chen@intel.com>
> > > Signed-off-by: Laura Abbott <labbott@redhat.com>
> >
> > Fixes: 6471384af2a6 ("mm: security: introduce init_on_alloc=3D1 and ini=
t_on_free=3D1 boot options")
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Alexander Potapenko <glider@google.com>
>
> --
> Kees Cook



-- =

Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Halimah DeLaine Prado
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg

--===============8158328962011705682==--

