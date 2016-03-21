Content-Type: multipart/mixed; boundary="===============5479714436709867249=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [futex] 65d8fc777f: +25.6% will-it-scale.per_process_ops
Date: Mon, 21 Mar 2016 09:00:12 +0100
Message-ID: <alpine.DEB.2.11.1603210841260.3978@nanos>
In-Reply-To: <87io0gh78w.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5479714436709867249==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 21 Mar 2016, Huang, Ying wrote:
> >  FYI, we noticed 25.6% performance improvement due to commit
> >
> >    65d8fc777f6d "futex: Remove requirement for lock_page() in get_futex=
_key()"
> >
> >  in the will-it-scale.per_process_ops test.
> >
> >  will-it-scale.per_process_ops tests the futex operations for process s=
hared
> >  futexes (Or whatever that test really does).
> =

> There is a futex sub test case for will-it-scale test suite.  But I got y=
our
> point, we need some description for the test case.  If email is not too
> limited for the full description, we will put it in some web site and
> include short description and link to the full description in email.

Ok. Just make sure the short description gives enough information for the
casual reader.
 =

> >  The commit has no significant impact on any other test in the test sui=
te.
> =

> Sorry, we have no enough machine power to test all test cases for each
> bisect result.  So we will have no such information until we find a way
> to do that.

Well, then I really have to ask how I should interpret the data here:

   5076304 =C2=B1  0%     +25.6%    6374220 =C2=B1  0%  will-it-scale.per_p=
rocess_ops

   ^^^ That's the reason why you sent the mail in the first place

   1194117 =C2=B1  0%     +14.4%    1366153 =C2=B1  1%  will-it-scale.per_t=
hread_ops
      0.58 =C2=B1  0%      -2.0%       0.57 =C2=B1  0%  will-it-scale.scala=
bility
      6820 =C2=B1  0%     -19.6%       5483 =C2=B1 15%  meminfo.AnonHugePag=
es
      2652 =C2=B1  5%     -10.4%       2375 =C2=B1  2%  vmstat.system.cs
      2848 =C2=B1 32%    +141.2%       6870 =C2=B1 65%  numa-meminfo.node1.=
Active(anon)
      2832 =C2=B1 31%     +57.6%       4465 =C2=B1 27%  numa-meminfo.node1.=
AnonPages
     15018 =C2=B1 12%     -23.3%      11515 =C2=B1 15%  numa-meminfo.node2.=
AnonPages
      1214 =C2=B1 14%     -22.8%     936.75 =C2=B1 20%  numa-meminfo.node3.=
PageTables
    712.25 =C2=B1 32%    +141.2%       1718 =C2=B1 65%  numa-vmstat.node1.n=
r_active_anon
    708.25 =C2=B1 31%     +57.7%       1116 =C2=B1 27%  numa-vmstat.node1.n=
r_anon_pages

How is this related and what should I do about this information? =

 =

 If it's important then I have to admit, that I fail to understand why.

 If it's not important then I have to ask why is this included.

> > So that allows me to reproduce that test more or less with no effort. A=
nd
> > that's the really important part.
> =

> For reproducing, now we use lkp-tests tool, which includes scripts to
> build the test case, run the test, collect various information, compare
> the test result, with the job file attached with the report email.  That
> is not the easiest way, we will continuously improve it.

I know and lkp-tests is a pain to work with. So please look into a way to
extract the relevant binaries, so it's simple for developers to reproduce.
 =

> > You can provide nice charts and full comparison tables for all tests on=
 a web
> > site for those who are interested in large stats and pretty charts.
> >
> > Full results: http://wherever.you.store/your/results/test-nr/results
> =

> Before we have a website for detailed information, we will still put
> some details into report email.

Ok, but please make them understandable for mere mortals.
 =

Thanks,

	tglx

--===============5479714436709867249==--

