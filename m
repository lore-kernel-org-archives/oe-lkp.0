Content-Type: multipart/mixed; boundary="===============5355366229696255995=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] x86/entry_32: Fix segment exceptions
Date: Thu, 13 Jan 2022 20:55:37 +0100
Message-ID: <YeCDudla868Ipf++@hirez.programming.kicks-ass.net>
In-Reply-To: <73020277-d49f-7aae-22db-945e040a31a2@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============5355366229696255995==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 13, 2022 at 10:54:39AM -0800, Andy Lutomirski wrote:
> On 1/12/22 07:42, Borislav Petkov wrote:
> > On Wed, Jan 12, 2022 at 11:55:41AM +0100, Peter Zijlstra wrote:
> > > Full and proper patch below. Boris, if you could merge in x86/core th=
at
> > > branch should then be ready for a pull req.
> > =

> > I've got this as the final version. Scream if something's wrong.
> =

> AAAAAAAAAAAAAAAAAAAAAHHHHHHHHHHHHHHHHHHHHHH!!!!!!!!!!!

:-)

> > +	/*
> > +	 * There is no _ASM_EXTABLE_TYPE_REG() for ASM, however since this is
> > +	 * ASM the registers are known and we can trivially hard-code them.
> > +	 */
> > +	_ASM_EXTABLE_TYPE(1b, 2b, EX_TYPE_POP_ZERO|EX_REG_DS)
> > +	_ASM_EXTABLE_TYPE(2b, 3b, EX_TYPE_POP_ZERO|EX_REG_ES)
> > +	_ASM_EXTABLE_TYPE(3b, 4b, EX_TYPE_POP_ZERO|EX_REG_FS)
> =

> Aside from POP_ZERO being a bit mystifying to a naive reader...
> =

> >   .endm
> >   .macro RESTORE_ALL_NMI cr3_reg:req pop=3D0
> > diff --git a/arch/x86/include/asm/extable_fixup_types.h b/arch/x86/incl=
ude/asm/extable_fixup_types.h
> > index b5ab333e064a..503622627400 100644
> > --- a/arch/x86/include/asm/extable_fixup_types.h
> > +++ b/arch/x86/include/asm/extable_fixup_types.h
> > @@ -16,9 +16,16 @@
> >   #define EX_DATA_FLAG_SHIFT		12
> >   #define EX_DATA_IMM_SHIFT		16
> > +#define EX_DATA_REG(reg)		((reg) << EX_DATA_REG_SHIFT)
> >   #define EX_DATA_FLAG(flag)		((flag) << EX_DATA_FLAG_SHIFT)
> >   #define EX_DATA_IMM(imm)		((imm) << EX_DATA_IMM_SHIFT)
> > +/* segment regs */
> > +#define EX_REG_DS			EX_DATA_REG(8)
> > +#define EX_REG_ES			EX_DATA_REG(9)
> > +#define EX_REG_FS			EX_DATA_REG(10)
> =

> These three seem likely to work

On IRC Andrew also noted that these EX_REG_* things should be __i386__
only. Previosly when they lived as open-coded EX_DATA_REG() usage in
entry_32.S that was implied, but now ...
--===============5355366229696255995==--

