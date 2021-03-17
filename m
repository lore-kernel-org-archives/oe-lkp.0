Content-Type: multipart/mixed; boundary="===============2424279663821401933=="
MIME-Version: 1.0
From: Jarkko Sakkinen <jarkko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [KEYS] 4a00e5e212: WARNING:at_arch/x86/kernel/static_call.c:#__static_call_validate
Date: Wed, 17 Mar 2021 23:00:41 +0200
Message-ID: <YFJt+eRHG6K/hwGu@kernel.org>
In-Reply-To: <CAFA6WYNs-rQLUGPMwc-p0q_KRvR16rm-x55gDqw828c7-C1qeA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2424279663821401933==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 17, 2021 at 05:25:48PM +0530, Sumit Garg wrote:
> On Wed, 17 Mar 2021 at 14:32, Peter Zijlstra <peterz@infradead.org> wro=
te:
> >
> > On Wed, Mar 17, 2021 at 09:59:32AM +0100, Peter Zijlstra wrote:
> > > diff --git a/tools/objtool/check.c b/tools/objtool/check.c
> > > index 5e5388a38e2a..6fef1155e73a 100644
> > > --- a/tools/objtool/check.c
> > > +++ b/tools/objtool/check.c
> > > @@ -850,6 +850,21 @@ static int add_ignore_alternatives(struct objtoo=
l_file *file)
> > >       return 0;
> > >  }
> > >
> > > +static inline void static_call_add(struct instruction *insn,
> > > +                                struct objtool_file *file)
> > > +{
> > > +     if (!strcmp(insn->sec->name, ".exit.text")) {
> > > +             WARN_FUNC("static_call in .exit.text, skipping inline p=
aching",
> > > +                       insn->sec, insn->offset);
> > > +             return;
> > > +     }
> >
> > Duh, that needs to be in the below condition... /me goes fetch more
> > wake-up juice :/
> >
> > > +     if (insn->call_dest->static_call_tramp) {
> > > +             list_add_tail(&insn->static_call_node,
> > > +                           &file->static_call_list);
> > > +     }
> > > +}
> >
> > ---
> >  tools/objtool/check.c | 32 ++++++++++++++++++++------------
> >  1 file changed, 20 insertions(+), 12 deletions(-)
> >
> =

> Thanks Peter for this fix. It does work for me on qemu for x86. Can
> you turn this into a proper fix patch? BTW, feel free to add:
> =

> Tested-by: Sumit Garg <sumit.garg@linaro.org>

Peter, if possible, please also CC the proper fix to me, I'll ack the fix.
Relevant for keyring.

Thanks!

/Jarkko


> =

> -Sumit
> =

> > diff --git a/tools/objtool/check.c b/tools/objtool/check.c
> > index 5e5388a38e2a..70cfd8bf95fd 100644
> > --- a/tools/objtool/check.c
> > +++ b/tools/objtool/check.c
> > @@ -850,6 +850,22 @@ static int add_ignore_alternatives(struct objtool_=
file *file)
> >         return 0;
> >  }
> >
> > +static inline void static_call_add(struct instruction *insn,
> > +                                  struct objtool_file *file)
> > +{
> > +       if (!insn->call_dest->static_call_tramp)
> > +               return;
> > +
> > +       if (!strcmp(insn->sec->name, ".exit.text")) {
> > +               WARN_FUNC("static_call in .exit.text, skipping inline p=
aching",
> > +                         insn->sec, insn->offset);
> > +               return;
> > +       }
> > +
> > +       list_add_tail(&insn->static_call_node,
> > +                     &file->static_call_list);
> > +}
> > +
> >  /*
> >   * Find the destination instructions for all jumps.
> >   */
> > @@ -888,10 +904,7 @@ static int add_jump_destinations(struct objtool_fi=
le *file)
> >                 } else if (insn->func) {
> >                         /* internal or external sibling call (with relo=
c) */
> >                         insn->call_dest =3D reloc->sym;
> > -                       if (insn->call_dest->static_call_tramp) {
> > -                               list_add_tail(&insn->static_call_node,
> > -                                             &file->static_call_list);
> > -                       }
> > +                       static_call_add(insn, file);
> >                         continue;
> >                 } else if (reloc->sym->sec->idx) {
> >                         dest_sec =3D reloc->sym->sec;
> > @@ -950,10 +963,7 @@ static int add_jump_destinations(struct objtool_fi=
le *file)
> >
> >                                 /* internal sibling call (without reloc=
) */
> >                                 insn->call_dest =3D insn->jump_dest->fu=
nc;
> > -                               if (insn->call_dest->static_call_tramp)=
 {
> > -                                       list_add_tail(&insn->static_cal=
l_node,
> > -                                                     &file->static_cal=
l_list);
> > -                               }
> > +                               static_call_add(insn, file);
> >                         }
> >                 }
> >         }
> > @@ -2746,10 +2756,8 @@ static int validate_branch(struct objtool_file *=
file, struct symbol *func,
> >                         if (dead_end_function(file, insn->call_dest))
> >                                 return 0;
> >
> > -                       if (insn->type =3D=3D INSN_CALL && insn->call_d=
est->static_call_tramp) {
> > -                               list_add_tail(&insn->static_call_node,
> > -                                             &file->static_call_list);
> > -                       }
> > +                       if (insn->type =3D=3D INSN_CALL)
> > +                               static_call_add(insn, file);
> >
> >                         break;
> >
>=20
--===============2424279663821401933==--

