Content-Type: multipart/mixed; boundary="===============7005177749418184728=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [futex] 76835b0ebf8: -8.1% will-it-scale.per_thread_ops
Date: Fri, 27 Feb 2015 11:28:51 +0800
Message-ID: <1425007731.10337.50.camel@intel.com>
In-Reply-To: <20150226095812.GA32538@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============7005177749418184728==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Catalin,

On Thu, 2015-02-26 at 09:58 +0000, Catalin Marinas wrote:
> On Thu, Feb 26, 2015 at 05:16:53AM +0000, Huang Ying wrote:
> > FYI, we noticed the below changes on
> > =

> > git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > commit 76835b0ebf8a7fe85beb03c75121419a7dec52f0 ("futex: Ensure get_fut=
ex_key_refs() always implies a barrier")
> > =

> > =

> > testbox/testcase/testparams: lkp-wsx01/will-it-scale/performance-futex4
> > =

> > 0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751
> > ----------------  --------------------------
> >          %stddev     %change         %stddev
> >              \          |                \
> >    6314259 =C2=B1  0%      -8.1%    5800079 =C2=B1  0%  will-it-scale.p=
er_thread_ops
> >    6274871 =C2=B1  0%      -8.1%    5768747 =C2=B1  0%  will-it-scale.p=
er_process_ops
> =

> This was raised before but I'm not sure we can do much about it:
> =

> https://lkml.org/lkml/2014/10/26/189

Sorry for duplicated report.

> It would be interesting to know the difference in performance with the
> code prior to commits b0c29f79ecea and 11d4616bd07f which optimised the
> futex code but missed a barrier.

I will do some test for that.

Best Regards,
Huang, Ying



--===============7005177749418184728==--

