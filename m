Content-Type: multipart/mixed; boundary="===============7315198882832505943=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [futex] 65d8fc777f: +25.6% will-it-scale.per_process_ops
Date: Fri, 18 Mar 2016 09:35:21 +0100
Message-ID: <alpine.DEB.2.11.1603180849150.3978@nanos>
In-Reply-To: <87d1qsgvpw.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7315198882832505943==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 18 Mar 2016, Huang, Ying wrote:
> Usually we will put most important change we think in the subject of the
> mail, for this email, it is,
> =

> +25.6% will-it-scale.per_process_ops

That is confusing on it's own, because the reader does not know at all whet=
her
this is an improvement or a regression.

So something like this might be useful:

Subject: subsystem: 12digitsha1: 25% performance improvement

or in some other case

Subject: subsystem: 12digitsha1: 25% performance regression

So in the latter case I will look into that mail immediately. The improveme=
nt
one can wait until I have cared about urgent stuff.

In the subject line it is pretty much irrelevant which foo-bla-ops test has
produced that result. It really does not matter. If it's a regression, it's
urgent. If it's an improvement it's informal and it can wait to be read.

So in that case it would be:

futex: 65d8fc777f6d: 25% performance improvement

You can grab the subsystem prefix from the commit.

> and, we try to put most important changes at the top of the comparison
> result below.  That is the will-it-scale.xxx below.
> =

> We are thinking about how to improve this.  You input is valuable for
> us.  We are thinking change the "below changes" line to something like
> below.
> =

> FYI, we noticed the +25.6% will-it-scale.per_process_ops improvement on
> ...
> =

> Does this looks better?

A bit, but it still does not tell me much. It's completely non obvious what
'will-it-scale.per_process_ops' means. Let me give you an example how a use=
ful
and easy to understand summary of the change could look like:


 FYI, we noticed 25.6% performance improvement due to commit

   65d8fc777f6d "futex: Remove requirement for lock_page() in get_futex_key=
()"

 in the will-it-scale.per_process_ops test.

 will-it-scale.per_process_ops tests the futex operations for process shared
 futexes (Or whatever that test really does).

 The commit has no significant impact on any other test in the test suite.

So those few lines tell precisely what this is about. It's something I alre=
ady
expected, so I really can skip the rest of the mail unless I'm interested in
reproducing the result.

Now lets look at a performance regression.

Subject: futex: 65d8fc777f6d: 25% performance regression

 FYI, we noticed a 25.2% performance regression due to commit

 65d8fc777f6d "futex: Remove requirement for lock_page() in get_futex_key()"

 in the will-it-scale.per_process_ops test.

 will-it-scale.per_process_ops tests the futex operations for process shared
 futexes (Or whatever that test really does).

 The commit has no significant impact on any other test in the test suite.

In that case I will certainly be interested how to reproduce that test. So I
need the following information:

Machine description: Intel IvyBridge 2 sockets, 32 cores, 64G RAM
Config file: http://wherever.you.store/your/results/test-nr/config
Test: http://wherever.you.store/your/tests/will-it-scale.per_process_ops.ta=
r.bz2

That tarball should contain:

     README
     test_script.sh
     test_binary

README should tell:

   will-it-scale.per_process_ops

   Short explanation of the test

   Preliminaries: =

   	- perf
	- whatever

So that allows me to reproduce that test more or less with no effort. And
that's the really important part.

You can provide nice charts and full comparison tables for all tests on a w=
eb
site for those who are interested in large stats and pretty charts.

Full results: http://wherever.you.store/your/results/test-nr/results

So now lets look at a scenario where that commit results in a performance
improvement on will-it-scale.per_process_ops and a regression on
will-it-scale.per_task.

Subject: futex: 65d8fc777f6d: 25% performance regression

 FYI, we noticed a 25.2% performance regression due to commit

 65d8fc777f6d "futex: Remove requirement for lock_page() in get_futex_key()"

 in the will-it-scale.per_task test.

 will-it-scale.per_tasks tests the futex operations for process private
 futexes (Or whatever that test really does).

 The commit has significant impact on the following tests in the test suite:
 =

	will-it-scale.per_process_ops: 25% improvement

The 25% improvement is really not interesting. What's interesting is the
regression. That's what people need to look at. You still can provide the
information about all the tests including the 25% improvement data on =


Full results: http://wherever.you.store/your/results/test-nr/results

Now, if you have commits which have mixed impact on various tests, then it's
important to point out the most relevant issue clearly in the
summary. I.e. you need to filter the tests for the maximum
regression/improvement and use that as the main information. You still can
provide the information about the impact on other tests in a very condensed
form.

 The commit has significant impact on the following tests in the test suite:

     test1: 	0.5% Regression
     test2:	2.0% Improvement
     ....
     testN:	0.2% Regression

That's useful information, but it might be completely irrelevant if the
primary impact is, e.g. a 10% Regression. Then it's nice to know, that it g=
ave
a 2% improvement on test2, but that's about it. The important information is
the 10% regression, which needs to be addressed urgently.

Hope that helps.

Thanks,

	tglx


--===============7315198882832505943==--

