Content-Type: multipart/mixed; boundary="===============7431127019971663017=="
MIME-Version: 1.0
From: Darren Hart <dvhart@infradead.org>
To: lkp@lists.01.org
Subject: Re: [futex] 65d8fc777f: +25.6% will-it-scale.per_process_ops
Date: Mon, 28 Mar 2016 22:17:10 -0700
Message-ID: <20160329051710.GA20901@dvhart-mobl5.amr.corp.intel.com>
In-Reply-To: <87lh52jdd3.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7431127019971663017==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 29, 2016 at 09:12:56AM +0800, Huang, Ying wrote:
> Darren Hart <dvhart@infradead.org> writes:
> =

> > On Mon, Mar 21, 2016 at 04:42:47PM +0800, Huang, Ying wrote:
> >> Thomas Gleixner <tglx@linutronix.de> writes:
> >> =

> >> > On Mon, 21 Mar 2016, Huang, Ying wrote:
> >> >> >  FYI, we noticed 25.6% performance improvement due to commit
> >> >> >
> >> >> >    65d8fc777f6d "futex: Remove requirement for lock_page() in get=
_futex_key()"
> >> >> >
> >> >> >  in the will-it-scale.per_process_ops test.
> >> >> >
> >> >> >  will-it-scale.per_process_ops tests the futex operations for pro=
cess shared
> >> >> >  futexes (Or whatever that test really does).
> >> >> =

> >> >> There is a futex sub test case for will-it-scale test suite.  But I=
 got your
> >> >> point, we need some description for the test case.  If email is not=
 too
> >> >> limited for the full description, we will put it in some web site a=
nd
> >> >> include short description and link to the full description in email.
> >> >
> >> > Ok. Just make sure the short description gives enough information fo=
r the
> >> > casual reader.
> >> >  =

> >> >> >  The commit has no significant impact on any other test in the te=
st suite.
> >> >> =

> >> >> Sorry, we have no enough machine power to test all test cases for e=
ach
> >> >> bisect result.  So we will have no such information until we find a=
 way
> >> >> to do that.
> >> >
> >> > Well, then I really have to ask how I should interpret the data here:
> >> >
> >> >    5076304 .  0%     +25.6%    6374220 .  0%  will-it-scale.per_proc=
ess_ops
> >> >
> >> >    ^^^ That's the reason why you sent the mail in the first place
> >> >
> >> >    1194117 .  0%     +14.4%    1366153 .  1%  will-it-scale.per_thre=
ad_ops
> >> >       0.58 .  0%      -2.0%       0.57 .  0%  will-it-scale.scalabil=
ity
> >> >       6820 .  0%     -19.6%       5483 . 15%  meminfo.AnonHugePages
> >> >       2652 .  5%     -10.4%       2375 .  2%  vmstat.system.cs
> >> >       2848 . 32%    +141.2%       6870 . 65%  numa-meminfo.node1.Act=
ive(anon)
> >> >       2832 . 31%     +57.6%       4465 . 27%  numa-meminfo.node1.Ano=
nPages
> >> >      15018 . 12%     -23.3%      11515 . 15%  numa-meminfo.node2.Ano=
nPages
> >> >       1214 . 14%     -22.8%     936.75 . 20%  numa-meminfo.node3.Pag=
eTables
> >> >     712.25 . 32%    +141.2%       1718 . 65%  numa-vmstat.node1.nr_a=
ctive_anon
> >> >     708.25 . 31%     +57.7%       1116 . 27%  numa-vmstat.node1.nr_a=
non_pages
> >> >
> >> > How is this related and what should I do about this information? =

> >> =

> >> For each will-it-scale sub test case, it will be run in both process
> >> mode and thread mode, and task number will change from 1 to CPU number.
> >> will-it-scale.per_thread_ops shows thread mode main result.
> >> will-it-scale.scalability is calculated to measure how per_process_ops
> >> and per_thread_ops scaled along with the task number.  These are defau=
lt
> >> behavior of will-it-scale test suite.
> >> =

> >> Others are monitors output.  That is, other information collected duri=
ng
> >> test.  For example, meminfo is a monitor to sampling /proc/meminfo
> >> contents,  AnonHugePages is a line in it.  meminfo.AnonHugePages is for
> >> the average value of AnonHugePages line of /proc/meminfo.  Similarly
> >> vmstat.system.cs is the average value of cs column of system column
> >> group of /usr/bin/vmstat.
> >> =

> >> We hope these information are helpful for root causing the regression.
> >> =

> >> >  If it's important then I have to admit, that I fail to understand w=
hy.
> >> >
> >> >  If it's not important then I have to ask why is this included.
> >> >
> >> >> > So that allows me to reproduce that test more or less with no eff=
ort. And
> >> >> > that's the really important part.
> >> >> =

> >> >> For reproducing, now we use lkp-tests tool, which includes scripts =
to
> >> >> build the test case, run the test, collect various information, com=
pare
> >> >> the test result, with the job file attached with the report email. =
 That
> >> >> is not the easiest way, we will continuously improve it.
> >> >
> >> > I know and lkp-tests is a pain to work with. So please look into a w=
ay to
> >> > extract the relevant binaries, so it's simple for developers to repr=
oduce.
> >> =

> >> OK.  We will try to improve on this side.  But it is not an easy task
> >> for us to provided easy to use simple binaries.  Do you think something
> >> like Docker image is easy to use?
> >
> > Thomas, I presume you are interested in binaries to be positive we're
> > reproducing with exactly the same bits? I agree that's good to have. I'=
d also
> > want to have or be pointed to the sources with a straight forward way to
> > rebuild and to inspect what exactly the test is doing. (I assume this is
> > implied, but just to make sure it's stated).
> =

> lkp-tests has the scripts to download the source, apply some patch, and
> build the binary.  It is not a very straight forward way, but the script
> is quite simple.
> =

> > Huang, what makes the binaries difficult to package? And how would dock=
er make
> > that any simpler?
> =

> The binaries is not difficult to package.  But the test is not only
> benchmark binary.  We may do some setup for the specific test, for
> example, change the cpu frequency governor, mkfs on a partition (may be
> ramdisk), etc.  And we have mechanism to collect various information
> during the test, for example, run vmstat, sampling /proc/sched_debug,
> etc.

In that case, it would be really useful to document your setup and include a
link to that in every report you send out. It should include things like the
partition layout (which ideally would have normalized symlinks to facilitate
reproduction outside your lab) (/dev/testpart -> /dev/sde3) and the
scripts/tests should only use the symlinks. That's an over simplification of
course, but that kind of configuration and documentation would be very help=
ful
in reducing the barrier to getting people to look at the issues your testing
discovers - and that, of course, is the whole point.

Thank you for doing the work and accepting all this feedback.

> As for docker, we just want to reduce the pain of using lkp-tests.
>  =


Sometimes docker is pain as well. It became completely unusable on my Debia=
n 8
system not too long ago. That can become another barrier if it isn't also
documented without docker, even if it requires more steps.

-- =

Darren Hart
Intel Open Source Technology Center

--===============7431127019971663017==--

