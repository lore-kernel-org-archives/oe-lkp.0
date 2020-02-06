Content-Type: multipart/mixed; boundary="===============1592033102436557444=="
MIME-Version: 1.0
From: Li, Philip <philip.li@intel.com>
To: lkp@lists.01.org
Subject: Re: [perf x86] b77491648e: will-it-scale.per_process_ops -2.1% regression
Date: Thu, 06 Feb 2020 03:07:15 +0000
Message-ID: <831EE4E5E37DCC428EB295A351E6624952397CEA@shsmsx102.ccr.corp.intel.com>
In-Reply-To: <87tv44danp.fsf@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1592033102436557444==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> Subject: [LKP] Re: [perf x86] b77491648e: will-it-scale.per_process_ops -=
2.1%
> regression
> =

> kernel test robot <rong.a.chen@intel.com> writes:
> =

> > Greeting,
> >
> > FYI, we noticed a -2.1% regression of will-it-scale.per_process_ops due=
 to
> commit:
> >
> >
> > commit: b77491648e6eb2f26b6edf5eaea859adc17f4dcc ("perf x86: Infrastruc=
ture
> for exposing an Uncore unit to PMON mapping")
> > https://github.com/0day-ci/linux/commits/roman-sudarikov-linux-intel-co=
m/perf-
> x86-Exposing-IO-stack-to-IO-PMON-mapping-through-sysfs/20200118-075508
> =

> Seems to be spurious bisect. I don't think that commit could change
> anything performance related.
Hi Andi, we will look into this as early as possible, we also receive anoth=
er input from
Pater Z that he got false positive of will-it-scale.per_process_ops perform=
ance
regression. We will investigate them.

> =

> -Andi
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org
--===============1592033102436557444==--

