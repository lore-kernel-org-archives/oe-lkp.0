Content-Type: multipart/mixed; boundary="===============8501052923802446031=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [futex] 65d8fc777f: +25.6% will-it-scale.per_process_ops
Date: Mon, 21 Mar 2016 10:53:03 +0800
Message-ID: <87io0gh78w.fsf@yhuang-dev.intel.com>
In-Reply-To: <alpine.DEB.2.11.1603180849150.3978@nanos>
List-Id: <oe-lkp.lists.linux.dev>

--===============8501052923802446031==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Thomas,

Thanks a lot for your valuable input!

Thomas Gleixner <tglx@linutronix.de> writes:

> On Fri, 18 Mar 2016, Huang, Ying wrote:
>> Usually we will put most important change we think in the subject of the
>> mail, for this email, it is,
>> =

>> +25.6% will-it-scale.per_process_ops
>
> That is confusing on it's own, because the reader does not know at all wh=
ether
> this is an improvement or a regression.
>
> So something like this might be useful:
>
> Subject: subsystem: 12digitsha1: 25% performance improvement
>
> or in some other case
>
> Subject: subsystem: 12digitsha1: 25% performance regression
>
> So in the latter case I will look into that mail immediately. The improve=
ment
> one can wait until I have cared about urgent stuff.
>
> In the subject line it is pretty much irrelevant which foo-bla-ops test h=
as
> produced that result. It really does not matter. If it's a regression, it=
's
> urgent. If it's an improvement it's informal and it can wait to be read.
>
> So in that case it would be:
>
> futex: 65d8fc777f6d: 25% performance improvement
>
> You can grab the subsystem prefix from the commit.

We will include regression/improvement information in subject at least.

>> and, we try to put most important changes at the top of the comparison
>> result below.  That is the will-it-scale.xxx below.
>> =

>> We are thinking about how to improve this.  You input is valuable for
>> us.  We are thinking change the "below changes" line to something like
>> below.
>> =

>> FYI, we noticed the +25.6% will-it-scale.per_process_ops improvement on
>> ...
>> =

>> Does this looks better?
>
> A bit, but it still does not tell me much. It's completely non obvious wh=
at
> 'will-it-scale.per_process_ops' means.

will-it-scale is a test suite, per_process_ops is one of its results.
That is the convention used in original report.

> Let me give you an example how a useful
> and easy to understand summary of the change could look like:
>
>
>  FYI, we noticed 25.6% performance improvement due to commit
>
>    65d8fc777f6d "futex: Remove requirement for lock_page() in get_futex_k=
ey()"
>
>  in the will-it-scale.per_process_ops test.
>
>  will-it-scale.per_process_ops tests the futex operations for process sha=
red
>  futexes (Or whatever that test really does).

There is a futex sub test case for will-it-scale test suite.  But I got your
point, we need some description for the test case.  If email is not too
limited for the full description, we will put it in some web site and
include short description and link to the full description in email.

>  The commit has no significant impact on any other test in the test suite.

Sorry, we have no enough machine power to test all test cases for each
bisect result.  So we will have no such information until we find a way
to do that.

> So those few lines tell precisely what this is about. It's something I al=
ready
> expected, so I really can skip the rest of the mail unless I'm interested=
 in
> reproducing the result.

We will put important information at first of the email.  And details
later.  Better to have clear mark.  So people can get important
information and ignore the details if they don't want.

> Now lets look at a performance regression.
>
> Subject: futex: 65d8fc777f6d: 25% performance regression
>
>  FYI, we noticed a 25.2% performance regression due to commit
>
>  65d8fc777f6d "futex: Remove requirement for lock_page() in get_futex_key=
()"
>
>  in the will-it-scale.per_process_ops test.
>
>  will-it-scale.per_process_ops tests the futex operations for process sha=
red
>  futexes (Or whatever that test really does).
>
>  The commit has no significant impact on any other test in the test suite.
>
> In that case I will certainly be interested how to reproduce that test. S=
o I
> need the following information:
>
> Machine description: Intel IvyBridge 2 sockets, 32 cores, 64G RAM
> Config file: http://wherever.you.store/your/results/test-nr/config

We have some information about this before.  But not organized good
enough, will improve it.

> Test: http://wherever.you.store/your/tests/will-it-scale.per_process_ops.=
tar.bz2
>
> That tarball should contain:
>
>      README
>      test_script.sh
>      test_binary
>
> README should tell:
>
>    will-it-scale.per_process_ops
>
>    Short explanation of the test
>
>    Preliminaries: =

>    	- perf
> 	- whatever
>
> So that allows me to reproduce that test more or less with no effort. And
> that's the really important part.

For reproducing, now we use lkp-tests tool, which includes scripts to
build the test case, run the test, collect various information, compare
the test result, with the job file attached with the report email.  That
is not the easiest way, we will continuously improve it.

> You can provide nice charts and full comparison tables for all tests on a=
 web
> site for those who are interested in large stats and pretty charts.
>
> Full results: http://wherever.you.store/your/results/test-nr/results

Before we have a website for detailed information, we will still put
some details into report email.

> So now lets look at a scenario where that commit results in a performance
> improvement on will-it-scale.per_process_ops and a regression on
> will-it-scale.per_task.
>
> Subject: futex: 65d8fc777f6d: 25% performance regression
>
>  FYI, we noticed a 25.2% performance regression due to commit
>
>  65d8fc777f6d "futex: Remove requirement for lock_page() in get_futex_key=
()"
>
>  in the will-it-scale.per_task test.
>
>  will-it-scale.per_tasks tests the futex operations for process private
>  futexes (Or whatever that test really does).
>
>  The commit has significant impact on the following tests in the test sui=
te:
>  =

> 	will-it-scale.per_process_ops: 25% improvement
>
> The 25% improvement is really not interesting. What's interesting is the
> regression. That's what people need to look at. You still can provide the
> information about all the tests including the 25% improvement data on =

>
> Full results: http://wherever.you.store/your/results/test-nr/results
>
> Now, if you have commits which have mixed impact on various tests, then i=
t's
> important to point out the most relevant issue clearly in the
> summary. I.e. you need to filter the tests for the maximum
> regression/improvement and use that as the main information. You still can
> provide the information about the impact on other tests in a very condens=
ed
> form.
>
>  The commit has significant impact on the following tests in the test sui=
te:
>
>      test1: 	0.5% Regression
>      test2:	2.0% Improvement
>      ....
>      testN:	0.2% Regression
>
> That's useful information, but it might be completely irrelevant if the
> primary impact is, e.g. a 10% Regression. Then it's nice to know, that it=
 gave
> a 2% improvement on test2, but that's about it. The important information=
 is
> the 10% regression, which needs to be addressed urgently.

Yes.  We will separate summary and details.  And put most important
information at the front of of the summary.

> Hope that helps.

That really help us a lot!  Thanks a lot!

Best Regards,
Huang, Ying

> Thanks,
>
> 	tglx

--===============8501052923802446031==--

