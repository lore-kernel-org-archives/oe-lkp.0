Content-Type: multipart/mixed; boundary="===============3425893318525430621=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [perf/x86] 81ec3f3c4c: will-it-scale.per_process_ops -5.5% regression
Date: Sat, 22 Feb 2020 20:43:59 +0800
Message-ID: <20200222124359.GA86836@shbuild999.sh.intel.com>
In-Reply-To: <E8ECBC65D0B2554DAD44EBE43059B3740F1EAC@ORSMSX110.amr.corp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3425893318525430621==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Andi,

On Sat, Feb 22, 2020 at 02:05:02AM +0800, Kleen, Andi wrote:
> =

> =

> >So likely, this commit changes the layout of the kernel text
> >and data, =

> =

> It should be only data here. text changes all the time anyways,
> but data tends to be more stable.
 =

Yes, I also did en experiment by modifying the gcc option to let
all functions address aligned to 32 or 64, and the 5.5% gap still
exist for the 2 commmits.

> > which may trigger some cacheline level change. From
> >the system map of the 2 kernels, a big trunk of symbol's address
> >changes which follow the global "pmu",
> =

> I wonder if it's the effect Andrew predicted a long time ago from
> using __read_mostly. If all the __read_mostlies are moved somewhere
> else the remaining read/write variables will get more sensitive to false =
sharing.
> =

> A simple experiment would be to add a __cacheline_aligned to align it,
> and then add
> =

> ____cacheline_aligned char dummy[0]; =

> =

> at the end to pad it to 64bytes.

Thanks for the suggestion, I tried this and the 5.5 regrssion is gone!
which also confirms the offset for the bulk of stuff following "pmu" =

causes the performance drop.

> =

> Or hopefully Jiri can figure it out from the C2C data.

I'm also trying to debug following Jiri's "perf c2c" suggestion.

Thanks,
Feng

--===============3425893318525430621==--

