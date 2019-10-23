Content-Type: multipart/mixed; boundary="===============8330889226881474014=="
MIME-Version: 1.0
From: Vincent Guittot <vincent.guittot@linaro.org>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 04dfd1bca6: unixbench.score -17.7% regression
Date: Wed, 23 Oct 2019 09:28:57 +0200
Message-ID: <CAKfTPtCs94J7jKSwPm9BTSrXOWPtVzv=JuaF0O==OZ=c_-sySQ@mail.gmail.com>
In-Reply-To: <20191023032430.GE12647@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============8330889226881474014==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Ron,

On Wed, 23 Oct 2019 at 05:25, kernel test robot <rong.a.chen@intel.com> w=
rote:
>
> On Tue, Oct 22, 2019 at 03:02:25PM +0200, Vincent Guittot wrote:
> > Hi Rong,
> >
> >
> > On Mon, 21 Oct 2019 at 10:49, kernel test robot <rong.a.chen@intel.co=
m> wrote:
> > >
> > > Greeting,
> > >
> > > FYI, we noticed a -17.7% regression of unixbench.score due to commit:
> > >
> >
> > Thanks for testing and reporting the regression.
> >
> > I have pushed a patch on the branch that should fix the regression.
> > Could you rerun the test with the fix ?
> >
> > The new top commit of the branch is:
> > commit: ff61a177adcf60c6bbc96f4bf3d74f980c699558 ("sched/fair: fix
> > rework of find_idlest_group()")
>
> Hi Vincent,
>
> Thanks for the quick response, the commit can fix the regression.
>
> 2871f4abd7cefa0c  04dfd1bca609c5d1c8b7e073f7  ff61a177adcf60c6bbc96f4bf3 =
 testcase/testparams/testbox
> ----------------  --------------------------  -------------------------- =
 ---------------------------
>          %stddev      change         %stddev      change         %stddev
>              \          |                \          |                \
>       1070             -18%        881                        1060       =
 unixbench/performance-1-300s-execl/lkp-skl-fpga01
>       1070             -18%        881                        1060       =
 GEO-MEAN unixbench.score

Thanks for the testing
Would you mind replying in the mailing list to add your tested-by on
the patch ? I have cced you

Regards,
Vincent
>
> Best Regards,
> Rong Chen
--===============8330889226881474014==--

