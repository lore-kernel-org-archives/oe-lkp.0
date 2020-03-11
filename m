Content-Type: multipart/mixed; boundary="===============6055946228263624094=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v3 1/2] modpost: rework and consolidate logging interface
Date: Wed, 11 Mar 2020 12:28:20 +0000
Message-ID: <20200311122609.GL1463@intel.com>
In-Reply-To: <CAK7LNAQM1WF1rk5H+26J87-jC4ghYvdEs1UQSNy+C87myS94DQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6055946228263624094==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2020 at 10:00:11AM +0900, Masahiro Yamada wrote:
> On Wed, Mar 11, 2020 at 12:56 AM Philip Li <philip.li@intel.com> wrote:
> >
> > On Tue, Mar 10, 2020 at 12:32:00PM +0100, Jessica Yu wrote:
> > > +++ Masahiro Yamada [09/03/20 20:03 +0900]:
> > > > On Mon, Mar 9, 2020 at 7:58 PM Jessica Yu <jeyu@kernel.org> wrote:
> > > > >
> > > > > +++ Masahiro Yamada [09/03/20 19:49 +0900]:
> > > > > >On Mon, Mar 9, 2020 at 7:39 PM Jessica Yu <jeyu@kernel.org> wr=
ote:
> > > > > >>
> > > > > >> Ah, sorry, I mean the kbuild 0-day bot errors. I am just reali=
zing
> > > > > >> the 0-day bot emails are not CC'd to lkml. Here is the error I=
 got
> > > > > >> from the bot:
> > > > > >>
> > > > > >> ---
> > > > > >>
> > > > > >> I love your patch! Yet something to improve:
> > > > > >>
> > > > > >> [auto build test ERROR on linus/master]
> > > > > >> [also build test ERROR on v5.6-rc4 next-20200306]
> > > > > >> [if your patch is applied to the wrong git tree, please drop u=
s a note to help
> > > > > >> improve the system. BTW, we also suggest to use '--base' optio=
n to specify the
> > > > > >> base tree in git format-patch, please see https://stackoverflo=
w.com/a/37406982]
> > > > > >>
> > > > > >> url:    https://github.com/0day-ci/linux/commits/Jessica-Yu/mo=
dpost-rework-and-consolidate-logging-interface/20200307-052346
> > > > > >> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git 30fe0d07fd7b27d41d9b31a224052cc4e910947a
> > > > > >> config: sh-randconfig-a001-20200306 (attached as .config)
> > > > > >> compiler: sh4-linux-gcc (GCC) 7.5.0
> > > > > >> reproduce:
> > > > > >>         wget https://raw.githubusercontent.com/intel/lkp-tests=
/master/sbin/make.cross -O ~/bin/make.cross
> > > > > >>         chmod +x ~/bin/make.cross
> > > > > >>         # save the attached .config to linux build tree
> > > > > >>         GCC_VERSION=3D7.5.0 make.cross ARCH=3Dsh
> > > > > >>
> > > > > >> If you fix the issue, kindly add following tag
> > > > > >> Reported-by: kbuild test robot <lkp@intel.com>
> > > > > >>
> > > > > >> All errors (new ones prefixed by >>):
> > > > > >>
> > > > > >> >> ERROR: modpost: "adc_single" [arch/sh/boards/mach-hp6xx/hp6=
xx_apm.ko] undefined!
> > > > > >
> > > > > >
> > > > > >Indeed, this one is odd.
> > > > > >I have no idea...
> > > > >
> > > > > I've pushed the patches to a branch to let the kbuild bot run thr=
ough its
> > > > > build tests again, and if I have extra time today I will try to
> > > > > reproduce this and let you know the results.
> > > > >
> > > > > Thanks,
> > > > >
> > > > > Jessica
> > > >
> > > >
> > > > Ah, Now I see.
> > > >
> > > >
> > > > Because you added "modpost:" prefix.
> > > >
> > > >
> > > >
> > > > The previous error message:
> > > >
> > > > ERROR: "adc_single" [arch/sh/boards/mach-hp6xx/hp6xx_apm.ko] undefi=
ned!
> > > >
> > > >
> > > > The new error message:
> > > >
> > > > ERROR: modpost: "adc_single" [arch/sh/boards/mach-hp6xx/hp6xx_apm.k=
o] undefined!
> > > >
> > > >
> > > >
> > > > So, the bot assumed it was a new error.
> > >
> > > Nice catch! Hm, I suppose we need to let the LKP folks know about the
> > > change in error message. CC'd LKP mailing list.
> > Thanks for the info, we will look into this to handle the
> > changed error.
> >
> > >
> > > Jessica
> > > _______________________________________________
> > > LKP mailing list -- lkp(a)lists.01.org
> > > To unsubscribe send an email to lkp-leave(a)lists.01.org
> =

> =

> =

> Could you improve the report by adding more context?
> =

> Currently, only new errors/warnings are shown by '>>'.
> =

> =

> If fixed ones had been shown by '<<',
> we would have easily noticed that
> this was just a matter of message format.
thanks for the suggestion, we will think of this, though
it may not be a quick implemention for current code base :-)

> =

> << ERROR: "adc_single" [arch/sh/boards/mach-hp6xx/hp6xx_apm.ko] undefined!
> >> ERROR: modpost: "adc_single" [arch/sh/boards/mach-hp6xx/hp6xx_apm.ko] =
undefined!
> =

> =

> =

> =

> -- =

> Best Regards
> Masahiro Yamada
--===============6055946228263624094==--

