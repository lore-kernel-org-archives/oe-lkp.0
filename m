Content-Type: multipart/mixed; boundary="===============6369287262885357145=="
MIME-Version: 1.0
From: Sumit Garg <sumit.garg@linaro.org>
To: lkp@lists.01.org
Subject: Re: [KEYS] 4a00e5e212: WARNING:at_arch/x86/kernel/static_call.c:#__static_call_validate
Date: Thu, 18 Mar 2021 16:33:38 +0530
Message-ID: <CAFA6WYMygaEygikpjzYT0rj=T5B4GDucV0KmvvQsudCQv23rBQ@mail.gmail.com>
In-Reply-To: <YFMqn0PvTO6FTpQK@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============6369287262885357145==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 18 Mar 2021 at 15:55, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Wed, Mar 17, 2021 at 09:41:22AM +0100, Peter Zijlstra wrote:
> > On Wed, Mar 17, 2021 at 12:55:02PM +0530, Sumit Garg wrote:
> > > > [    0.000000] ------------[ cut here ]------------
> > > > [    0.000000] unexpected static_call insn opcode 0xe9 at cleanup_t=
rusted+0x0/0x5
> > >
> > > Here 0xe9 belongs to JMP32_INSN_OPCODE but I am not sure why it's
> > > considered incorrect given following snippet and corresponding
> > > objdump:
> > >
> > > Snippet:
> > >
> > > static void __exit cleanup_trusted(void)
> > > {
> > >         static_call_cond(trusted_key_exit)();
> > > }
> > >
> > > module_exit(cleanup_trusted);
> > >
> > > Objdump:
> > >
> > > ffffffff832d91fc <cleanup_trusted>:
> > > ffffffff832d91fc:       e9 ef 83 b2 fe          jmpq
> > > ffffffff81e015f0 <__SCT__trusted_key_exit>
> > >
> > > Maintainers,
> > >
> > > Do you have any clue here?
> >
> > It's an __exit function.. and we have:
> >
> >       /*
> >        * .exit.text is discarded at runtime, not link time, to deal with
> >        *  references from .altinstructions
> >        */
> >       .exit.text : AT(ADDR(.exit.text) - LOAD_OFFSET) {
> >               EXIT_TEXT
> >       }
> >
> > So could it be the text is no longer actually there?
> >
> > We have special handling for __init, but I don't think we have anything
> > for __exit.
>
> OK, ignore this and everything else.. Let's start over.
>
> So I gave up and tried to reproduce...
>
> <rant>
> 0day email I got quoted on has a git:// link that doesn't actually work,
> had the .config trimmed and 0day stuff isn't archived on lore
> </rant>
>
> There's actually 2 splats when you boot this. One during
> static_call_init() and one later during static_call_update(), both for
> the same site, the by now notorious __exit function.
>
> Now, when built-in __exit is placed in the initmem range which will be
> freed right before be exec init. Both static_call and jump_label use
> init_section_contains() to detect code that will be freed at that time.
> Therefore both __init and __exit code is marked INIT.
>
> And here we have the first bug; static_call_set_init() looses the TAIL
> tag and our site happens to be a tail-call.
>
> Once we fix that, the second splat remains, so continue looking.. turns
> out the init skipping is slightly wonky.. fix that, still no joy.
>
> Turns out that kernel_text_address(), which both static_call and
> jump_label use to sanity check the address we're about to patch is
> actually text doesn't match init_section_contains(). Specifically it
> only includes __init, so our __exit text is reported as bad. Obviously
> we don't have actual markers for __exit, because that would be
> convenient :/ So fudge that and...
>
> \o/
>
> OK, lemme go clean-up and write Changelogs, this is 4-5 patches worth :/

Thanks Peter for putting this effort to fix static calls from __exit
function. So I will drop mine patch to convert static to normal call
in __exit function as well.

-Sumit
--===============6369287262885357145==--

