Content-Type: multipart/mixed; boundary="===============0919852690623673196=="
MIME-Version: 1.0
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: lkp@lists.01.org
Subject: Re: 7457c0da02 [ 0.733186] BUG: KASAN: unknown-crash in unwind_next_frame
Date: Tue, 09 Jul 2019 07:17:18 -0500
Message-ID: <20190709121718.4omsyxcowfmeyrww@treble>
In-Reply-To: <CAG_fn=VDBbGbtuedYaviq0HfQ3Wm5DciwFO2uSL-ncQS4ZjTLQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0919852690623673196==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 09, 2019 at 02:03:07PM +0200, Alexander Potapenko wrote:
> On Tue, Jul 9, 2019 at 11:15 AM Peter Zijlstra <peterz@infradead.org> w=
rote:
> >
> > On Mon, Jul 08, 2019 at 02:21:27PM -0500, Josh Poimboeuf wrote:
> > > On Mon, Jul 08, 2019 at 12:07:12PM -0500, Josh Poimboeuf wrote:
> > > > I recreated with the attached script.  It looks like the unwinder
> > > > encountered a corrupt frame pointer on the stack.  The unwinder tho=
ught
> > > > it was an "encoded" pt_regs pointer because it had bit 1 set, so it=
 then
> > > > tried to read the embedded pt_regs (which wasn't actually there) on=
 the
> > > > same stack, apparently causing the kasan error.
> > > >
> > > > So, IIUC, the unwinder isn't trying to access memory beyond the sta=
ck
> > > > page, it's just trying to access memory in the middle of a stack fr=
ame,
> > > > which KASAN is flagging.  So the unwinder bounds checks don't seem =
to be
> > > > broken.  It isn't doing a "bad" memory access per se.
> > > >
> > > > However... what I can't yet explain is why the original unwind fail=
ed,
> > > > but then the KASAN unwind succeeded.  With a corrupt frame pointer,=
 the
> > > > KASAN unwind should have stopped early and fallen back to the "gues=
s"
> > > > unwind, so the KASAN unwind should have had a lot of '?' entries.
> > > >
> > > > So something doesn't quite add up, but at first glance it does seem=
 to
> > > > be some kind of stack corruption, and the call emulation code is lo=
oking
> > > > quite guilty.
> > > >
> > > > I can dig more into it later today.
> > >
> > > Figured it out.  The KASAN-ified version of int3_magic() clobbers many
> > > more registers than you would imagine:
> > >
> > > ffffffff850138ed <int3_magic>:
> > > ffffffff850138ed:       55                      push   %rbp
> > > ffffffff850138ee:       48 89 e5                mov    %rsp,%rbp
> > > ffffffff850138f1:       41 54                   push   %r12
> > > ffffffff850138f3:       53                      push   %rbx
> > > ffffffff850138f4:       49 89 fc                mov    %rdi,%r12
> > > ffffffff850138f7:       48 8b 1d e2 0e 51 ff    mov    -0xaef11e(%rip=
),%rbx        # ffffffff845247e0 <latent_entropy>
> > > ffffffff850138fe:       48 31 eb                xor    %rbp,%rbx
> > > ffffffff85013901:       e8 de 87 2d fc          callq  ffffffff812ec0=
e4 <__asan_store4>
> > > ffffffff85013906:       41 c7 04 24 01 00 00    movl   $0x1,(%r12)
> > > ffffffff8501390d:       00
> > > ffffffff8501390e:       48 8b 05 cb 0e 51 ff    mov    -0xaef135(%rip=
),%rax        # ffffffff845247e0 <latent_entropy>
> > > ffffffff85013915:       48 ba 33 d9 81 a7 e7    movabs $0x1db2d7e7a78=
1d933,%rdx
> > > ffffffff8501391c:       d7 b2 1d
> > > ffffffff8501391f:       48 31 d3                xor    %rdx,%rbx
> > > ffffffff85013922:       48 01 c3                add    %rax,%rbx
> > > ffffffff85013925:       48 89 1d b4 0e 51 ff    mov    %rbx,-0xaef14c=
(%rip)        # ffffffff845247e0 <latent_entropy>
> > > ffffffff8501392c:       5b                      pop    %rbx
> > > ffffffff8501392d:       41 5c                   pop    %r12
> > > ffffffff8501392f:       5d                      pop    %rbp
> > > ffffffff85013930:       c3                      retq
> > >
> > > And it calls __asan_store4() which clobbers even more.
> > >
> > > One way to fix it (doesn't compile on 32-bit obviously):
> > >
> > > diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternat=
ive.c
> > > index 99ef8b6f9a1a..0a074d207720 100644
> > > --- a/arch/x86/kernel/alternative.c
> > > +++ b/arch/x86/kernel/alternative.c
> > > @@ -676,7 +676,7 @@ static void __init int3_selftest(void)
> > >                     "int3_selftest_ip:\n\t"
> > >                     __ASM_SEL(.long, .quad) " 1b\n\t"
> > >                     ".popsection\n\t"
> > > -                   : : __ASM_SEL_RAW(a, D) (&val) : "memory");
> > > +                   : : __ASM_SEL_RAW(a, D) (&val) : "memory", "rax",=
 "rcx", "rdx", "rsi", "r8", "r9", "r10", "r11");
> >
> > ARGH!!!
> >
> > How about we stick int3_magic() in asm isntead and control the calling
> > convetion that way?
> Won't it be enough to just annotate int3_magic() with __no_sanitize_addre=
ss?

The problem isn't necessarily specific to KASAN.  You never know what
some other compiler feature/plugin will do.

-- =

Josh

--===============0919852690623673196==--

