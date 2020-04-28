Content-Type: multipart/mixed; boundary="===============0617529276453566404=="
MIME-Version: 1.0
From: Catalin Marinas <catalin.marinas@arm.com>
To: lkp@lists.01.org
Subject: Re: [mm/debug] fa6726c1e7: kernel_BUG_at_include/linux/mm.h
Date: Tue, 28 Apr 2020 10:21:05 +0100
Message-ID: <20200428092105.GB3868@gaia>
In-Reply-To: <813D7CD3-F31C-4056-92DF-D462633E9D69@lca.pw>
List-Id: <oe-lkp.lists.linux.dev>

--===============0617529276453566404==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2020 at 04:41:11AM -0400, Qian Cai wrote:
> On Apr 28, 2020, at 1:54 AM, Anshuman Khandual <Anshuman.Khandual@arm.c=
om> wrote:
> > That is true. There is a slight change in the rules, making it explicit=
 yes
> > only when both ARCH_HAS_DEBUG_VM_PGTABLE and DEBUG_VM are enabled.
> > =

> > +config DEBUG_VM_PGTABLE
> > +    bool "Debug arch page table for semantics compliance"
> > +    depends on MMU
> > +    depends on !IA64 && !ARM
> > +    depends on ARCH_HAS_DEBUG_VM_PGTABLE || EXPERT
> > +    default y if ARCH_HAS_DEBUG_VM_PGTABLE && DEBUG_VM
> > +    help
> > =

> > The default is really irrelevant as the config option can be set explic=
itly.
> =

> That could also explain. Since not long time ago, it was only =E2=80=9Cde=
fault
> y if DEBUG_VM=E2=80=9D, that caused the robot saved a .config with
> DEBUG_VM_PGTABLE=3Dy by default.
> =

> Even though you changed the rule recently, it has no effect as the
> robot could =E2=80=9Cmake oldconfig=E2=80=9D from the saved config for ea=
ch linux-next
> tree execution and the breakage will go on.

I'm not entirely sure that's the case. This report still points at the
old commit fa6726c1e7 which has:

+       depends on ARCH_HAS_DEBUG_VM_PGTABLE || EXPERT
+       default n if !ARCH_HAS_DEBUG_VM_PGTABLE
+       default y if DEBUG_VM

In -next we now have commit 647d9a0de34c and subsequently modified by
commit 0a8646638865. So hopefully with the latest -next tree we won't
see this report.

We could as well remove the 'depends on ... || EXPERT' part but I'd
rather leave this around with a default n (as in current -next) in case
others want to have a go. If that's still causing problems, we can
remove the '|| EXPERT' part, so there won't be any further regressions.

-- =

Catalin
--===============0617529276453566404==--

