Content-Type: multipart/mixed; boundary="===============8181041839116396694=="
MIME-Version: 1.0
From: Marco Elver <elver@google.com>
To: lkp@lists.01.org
Subject: Re: [x86/mm/64] f154f29085: BUG:kernel_reboot-without-warning_in_boot_stage - clang KCOV?
Date: Tue, 21 Dec 2021 16:10:31 +0100
Message-ID: <CANpmjNO4hs1B9eDY9edGGOXY45a8smdtYfYfbDRnGWSYch4wGg@mail.gmail.com>
In-Reply-To: <20211221143153.GA4676@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8181041839116396694==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 21 Dec 2021 at 15:34, Carel Si <beibei.si@intel.com> wrote:
>
> Hi Boris,
>
> On Fri, Dec 17, 2021 at 08:52:53PM +0800, Borislav Petkov wrote:
> > ---
> > diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
> > index 0083464de5e3..79b3d67addcc 100644
> > --- a/arch/x86/kernel/cpu/common.c
> > +++ b/arch/x86/kernel/cpu/common.c
> > @@ -384,7 +384,7 @@ void native_write_cr0(unsigned long val)
> >  }
> >  EXPORT_SYMBOL(native_write_cr0);
> >
> > -void native_write_cr4(unsigned long val)
> > +void __no_profile native_write_cr4(unsigned long val)
> >  {
> >       unsigned long bits_changed =3D 0;
> >
> > diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
> > index 75acb6027a87..68d2b7f9a913 100644
> > --- a/arch/x86/kernel/head64.c
> > +++ b/arch/x86/kernel/head64.c
> > @@ -483,7 +483,7 @@ asmlinkage __visible void __init x86_64_start_kerne=
l(char * real_mode_data)
> >       /* Kill off the identity-map trampoline */
> >       reset_early_page_tables();
> >
> > -     __native_tlb_flush_global(native_read_cr4());
> > +     __native_tlb_flush_global(this_cpu_read(cpu_tlbstate.cr4));
> >
> >       clear_bss();

Also double-check the Makefile-based solution: the Makefiles in both
directories already contain various KCOV_INSTRUMENT/K*SAN_SANITIZE :=3D
n, so perhaps adding GCOV_PROFILE or GCOV_PROFILE_whicheverfile.o :=3D n
may be more appropriate should the functions that should not be
instrumented be a moving target, and prone to breakage again in
future.
--===============8181041839116396694==--

