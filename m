Content-Type: multipart/mixed; boundary="===============0979266436084194991=="
MIME-Version: 1.0
From: kernel test robot <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 04dfd1bca6: unixbench.score -17.7% regression
Date: Wed, 23 Oct 2019 11:24:30 +0800
Message-ID: <20191023032430.GE12647@shao2-debian>
In-Reply-To: <CAKfTPtCpxnQvhDaCeqN09Br3EdmH50cbGP7fV8+m3USRZtYkOA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0979266436084194991==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2019 at 03:02:25PM +0200, Vincent Guittot wrote:
> Hi Rong,
> =

> =

> On Mon, 21 Oct 2019 at 10:49, kernel test robot <rong.a.chen@intel.com>=
 wrote:
> >
> > Greeting,
> >
> > FYI, we noticed a -17.7% regression of unixbench.score due to commit:
> >
> =

> Thanks for testing and reporting the regression.
> =

> I have pushed a patch on the branch that should fix the regression.
> Could you rerun the test with the fix ?
> =

> The new top commit of the branch is:
> commit: ff61a177adcf60c6bbc96f4bf3d74f980c699558 ("sched/fair: fix
> rework of find_idlest_group()")

Hi Vincent,

Thanks for the quick response, the commit can fix the regression.

2871f4abd7cefa0c  04dfd1bca609c5d1c8b7e073f7  ff61a177adcf60c6bbc96f4bf3  t=
estcase/testparams/testbox
----------------  --------------------------  --------------------------  -=
--------------------------
         %stddev      change         %stddev      change         %stddev
             \          |                \          |                \  =

      1070             -18%        881                        1060        u=
nixbench/performance-1-300s-execl/lkp-skl-fpga01
      1070             -18%        881                        1060        G=
EO-MEAN unixbench.score

Best Regards,
Rong Chen
--===============0979266436084194991==--

