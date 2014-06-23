Content-Type: multipart/mixed; boundary="===============5834978430822849380=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [clockevents] WARNING: CPU: 0 PID: 0 at kernel/time/tick-oneshot.c:32 tick_stop_event()
Date: Mon, 23 Jun 2014 17:39:25 +0800
Message-ID: <20140623093925.GA1454@localhost>
In-Reply-To: <CAKohpomtHuXP0Q9QnWvJj1d2O=AewMR+nVNE3N_KFJkMpcCHYA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5834978430822849380==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Viresh,

On Mon, Jun 23, 2014 at 02:02:25PM +0530, Viresh Kumar wrote:
> On 23 June 2014 13:50, Jet Chen <jet.chen@intel.com> wrote:
> > Hi Viresh,
> >
> > 0day kernel testing robot got the below dmesg and the first bad commit =
is
> >
> > git://git.linaro.org/people/vireshk/linux tick/ONESHOT-STOPPED
> =

> Hi Jet/Fengguang,
> =

> Why did your scripts Cc'd LKML for this report? It never used to
> happen for my trees Atleast.

Yeah our build error reports are mostly private emails. However we do
CC LKML for runtime regressions - because there is no easy way for us
to tell whether the reported regression has reached more people.

> These patches haven't been posted to LKML yet and sending
> reports there for these wouldn't be good for their fate :)

Sorry if it hurts. :)

> Anyway, will look at what broke. Thanks.

Thank you!

Cheers,
Fengguang

--===============5834978430822849380==--

