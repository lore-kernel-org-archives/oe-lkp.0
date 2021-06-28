Content-Type: multipart/mixed; boundary="===============8482302701595002571=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [jump_label, x86] e7bf1ba97a: BUG:unable_to_handle_page_fault_for_address
Date: Mon, 28 Jun 2021 11:22:20 +0200
Message-ID: <YNmUzDjX6sECp37P@hirez.programming.kicks-ass.net>
In-Reply-To: <SJ0PR11MB5598608507B7EB38983113BCFB079@SJ0PR11MB5598.namprd11.prod.outlook.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8482302701595002571==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 24, 2021 at 06:32:25AM +0000, Liu, Yujie wrote:
> > > [  222.094341] BUG: unable to handle page fault for address:
> > > ffffffff83ccffe0
> > =

> > I *think* the below might help, can you try?
> =

> Hi Peter Z,
> =

> We try to apply the patch on commit e7bf1ba97afdd (jump_label, x86: Emit =
short JMP)
> A new BUG appeared before reaching the BUG reported in previous mail.
> Full dmesg in attachment.

> > @@ -555,6 +558,7 @@ static int __jump_label_mod_text_reserved(void *sta=
rt, void *end)
> >  	WARN_ON_ONCE(__module_text_address((unsigned long)end) !=3D mod);
> >  	if (!try_module_get(mod))
> >  		mod =3D NULL;
> > +	init =3D mod->state =3D=3D MODULE_STATE_COMING;
> >  	preempt_enable();
> > =

> >  	if (!mod)

*groan*, I'm an idiot... There's an obvious NULL pointer deref right
there.

Let me try locally first before I send yet another dud.
--===============8482302701595002571==--

