Content-Type: multipart/mixed; boundary="===============2106742134647284818=="
MIME-Version: 1.0
From: Catalin Marinas <catalin.marinas@arm.com>
To: lkp@lists.01.org
Subject: Re: [mm/debug] fa6726c1e7: kernel_BUG_at_include/linux/mm.h
Date: Wed, 29 Apr 2020 19:15:51 +0100
Message-ID: <20200429181550.GF10651@gaia>
In-Reply-To: <07ea0efd-0145-eaaf-c628-e48957154a2c@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2106742134647284818==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2020 at 08:52:25PM +0800, Chen, Rong A wrote:
> On 4/29/2020 11:28 AM, Anshuman Khandual wrote:
> > On 04/28/2020 02:51 PM, Catalin Marinas wrote:
> > > On Tue, Apr 28, 2020 at 04:41:11AM -0400, Qian Cai wrote:
> > > > On Apr 28, 2020, at 1:54 AM, Anshuman Khandual <Anshuman.Khandual(a=
)arm.com> wrote:
> > > > > That is true. There is a slight change in the rules, making it ex=
plicit yes
> > > > > only when both ARCH_HAS_DEBUG_VM_PGTABLE and DEBUG_VM are enabled.
> > > > > =

> > > > > +config DEBUG_VM_PGTABLE
> > > > > +    bool "Debug arch page table for semantics compliance"
> > > > > +    depends on MMU
> > > > > +    depends on !IA64 && !ARM
> > > > > +    depends on ARCH_HAS_DEBUG_VM_PGTABLE || EXPERT
> > > > > +    default y if ARCH_HAS_DEBUG_VM_PGTABLE && DEBUG_VM
> > > > > +    help
> > > > > =

> > > > > The default is really irrelevant as the config option can be set =
explicitly.
> > > > That could also explain. Since not long time ago, it was only =E2=
=80=9Cdefault
> > > > y if DEBUG_VM=E2=80=9D, that caused the robot saved a .config with
> > > > DEBUG_VM_PGTABLE=3Dy by default.
> > > > =

> > > > Even though you changed the rule recently, it has no effect as the
> > > > robot could =E2=80=9Cmake oldconfig=E2=80=9D from the saved config =
for each linux-next
> > > > tree execution and the breakage will go on.
> > > I'm not entirely sure that's the case. This report still points at the
> > > old commit fa6726c1e7 which has:
> > > =

> > > +       depends on ARCH_HAS_DEBUG_VM_PGTABLE || EXPERT
> > > +       default n if !ARCH_HAS_DEBUG_VM_PGTABLE
> > > +       default y if DEBUG_VM
> > > =

> > > In -next we now have commit 647d9a0de34c and subsequently modified by
> > > commit 0a8646638865. So hopefully with the latest -next tree we won't
> > > see this report.
> > Could some one from LKP test framework, please confirm if this still ca=
uses
> > above problem on the latest linux-next by default ?
> =

> The .config is a rand config, the problem is still exist if run "make
> oldconfig" for the config with commit 0a8646638865.

Is randconfig expected to boot? I don't think it is but I guess it
should not trigger a BUG_ON during boot.

> $ grep -e CONFIG_MMU=3D -e CONFIG_EXPERT=3D -e CONFIG_ARCH_HAS_DEBUG_VM_P=
GTABLE=3D
> -e CONFIG_DEBUG_VM=3D .config
> CONFIG_EXPERT=3Dy
> CONFIG_MMU=3Dy
> CONFIG_DEBUG_VM=3Dy
> =

> should we disable DEBUG_VM_PGTABLE by default?

If that's the only case where this fails in LKP, I'd rather remove the
EXPERT dependency so that it cannot be enabled. Architectures that want
to experiment with this feature will have to select
ARCH_HAS_DEBUG_VM_PGTABLE explicitly.

-- =

Catalin
--===============2106742134647284818==--

