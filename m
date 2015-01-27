Content-Type: multipart/mixed; boundary="===============1333158288392635806=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [kernel] fc7f0dd3817: -2.1% will-it-scale.per_thread_ops
Date: Tue, 27 Jan 2015 09:17:11 +0800
Message-ID: <1422321431.24875.35.camel@intel.com>
In-Reply-To: <23E39399-135D-485B-8AF6-FB5D2B874A9A@me.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1333158288392635806==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 2015-01-26 at 12:36 -0700, Louis Langholtz wrote:
> Hi Huang (and others on the lkp(a)01.org mailing list),
> =

> Not sure how to interpret the numbers you provided. Is there a web
> page that you would suggest looking at that I might read up?

Sorry we have no web page.  Most words in the email is straightforward.

testbox/testcase/testparams: lituya/will-it-scale/powersave-mmap2

test machine: lituya, it is a Haswell-EP machine
test case: will-it-scale (a benchmark to measure performance via
invoking some system call in a loop)
test params: powersave-mmap2: powersave CPU frequency governor is used,
the sub test case in will-it-scale is: mmap2

7ad4b4ae5757b896  fc7f0dd381720ea5ee5818645f  =


Here is the parent commit ID and the commit ID for your patch.

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

    252693 =C2=B1  0%      -2.2%     247031 =C2=B1  0%  will-it-scale.per_t=
hread_ops

252693 and 247031 is the score from the benchmark
0% is the standard deviation for the score
-2.2% is the change between the parent and your patch.

> It wouldn't surprise me if the changes made resulted in slightly
> decreased performance - the number of commands shown in disassembly of
> the code not surprisingly increases.

Best Regards,
Huang, Ying

> On Jan 21, 2015, at 7:39 PM, Huang Ying <ying.huang@intel.com> wrote:
> =

> > FYI, we noticed the below changes on
> > =

> > commit fc7f0dd381720ea5ee5818645f7d0e9dece41cb0 ("kernel: avoid overflo=
w in cmp_range")
> > =

> > =

> > testbox/testcase/testparams: lituya/will-it-scale/powersave-mmap2
> > =

> > 7ad4b4ae5757b896  fc7f0dd381720ea5ee5818645f  =

> > ----------------  --------------------------  =

> >         %stddev     %change         %stddev
> >             \          |                \  ...
> > Disclaimer:
> > Results have been estimated based on internal Intel analysis and are pr=
ovided
> > for informational purposes only. Any difference in system hardware or s=
oftware
> > design or configuration may affect actual performance.
> > =

> > =

> > Thanks,
> > Huang, Ying
> > =

> > <job.yaml><reproduce.txt>_______________________________________________
> > LKP mailing list
> > LKP(a)linux.intel.com
> > =

> =




--===============1333158288392635806==--

