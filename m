Content-Type: multipart/mixed; boundary="===============2901875586224948883=="
MIME-Version: 1.0
From: Dmitry Vyukov <dvyukov@google.com>
To: lkp@lists.01.org
Subject: Re: CKI hackfest @Plumbers invite
Date: Mon, 27 May 2019 16:39:16 +0200
Message-ID: <CACT4Y+bDmqkCezoE7gJ9sP6q7wF1Ff2iRYzdODKa5g3uSfnQHg@mail.gmail.com>
In-Reply-To: <1442701383.22077553.1558957933273.JavaMail.zimbra@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2901875586224948883==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2019 at 1:52 PM Veronika Kabatova <vkabatov@redhat.com> w=
rote:
> ----- Original Message -----
> > From: "Tim Bird" <Tim.Bird@sony.com>
> > To: vkabatov(a)redhat.com, automated-testing(a)yoctoproject.org, info(a=
)kernelci.org, khilamn(a)baylibre.org,
> > syzkaller(a)googlegroups.com, lkp(a)lists.01.org, stable(a)vger.kernel.=
org, labbott(a)redhat.com
> > Cc: eslobodo(a)redhat.com, cki-project(a)redhat.com
> > Sent: Friday, May 24, 2019 10:17:04 PM
> > Subject: RE: CKI hackfest @Plumbers invite
> >
> >
> >
> > > -----Original Message-----
> > > From: Veronika Kabatova
> > >
> > > Hi,
> > >
> > > as some of you have heard, CKI Project is planning hackfest CI meetin=
gs
> > > after
> > > Plumbers conference this year (Sept. 12-13). We would like to invite
> > > everyone
> > > who has interest in CI for kernel to come and join us.
> > >
> > > The early agenda with summary is at the end of the email. If you think
> > > there's
> > > something important missing let us know! Also let us know in case you=
'd
> > > want to
> > > lead any of the sessions, we'd be happy to delegate out some work :)
> > >
> > >
> > > Please send us an email as soon as you decide to come and feel free to
> > > invite
> > > other people who should be present. We are not planning to cap the
> > > attendance
> > > right now but need to solve the logistics based on the interest. The =
event
> > > is
> > > free to attend, no additional registration except letting us know is
> > > needed.
> > >
> > > Feel free to contact us if you have any questions,
> >
> > I plan to come to the event.
> >
> > > -----------------------------------------------------------
> > > Here is an early agenda we put together:
> > > - Introductions
> > > - Common place for upstream results, result publishing in general
> > >   - The discussion on the mailing list is going strong so we might be=
 able
> > >   to
> > >     substitute this session for a different one in case everything is
> > >     solved by
> > >     September.
> > > - Test result interpretation and bug detection
> > >   - How to autodetect infrastructure failures, regressions/new bugs a=
nd
> > >   test
> > >     bugs? How to handle continuous failures due to known bugs in both=
 tests
> > > and
> > >     kernel? What's your solution? Can people always trust the results=
 they
> > >     receive?
> > > - Getting results to developers/maintainers
> > >   - Aimed at kernel developers and maintainers, share your feedback a=
nd
> > >     expectations.
> > >   - How much data should be sent in the initial communication vs. a c=
lick
> > >   away
> > >     in a dashboard? Do you want incremental emails with new results a=
s they
> > > come
> > >     in?
> > >   - What about adding checks to tested patches in Patchwork when patch
> > > series
> > >     are being tested?
> > >   - Providing enough data/script to reproduce the failure. What if sp=
ecial
> > >   HW
> > >     is needed?
> > > - Onboarding new kernel trees to test
> > >   - Aimed at kernel developers and maintainers.
> > >   - Which trees are most prone to bring in new problems? Which are th=
e most
> > >     critical ones? Do you want them to be tested? Which tests do you =
feel
> > >     are
> > >     most beneficial for specific trees or in general?
> > > - Security when testing untrusted patches
> > >   - How do we merge, compile, and test patches that have untrusted co=
de in
> > > them
> > >     and have not yet been reviewed? How do we avoid abuse of systems,
> > >     information theft, or other damage?
> > >   - Check out the original patch that sparked the discussion at
> > >     https://patchwork.ozlabs.org/patch/862123/
> > > - Avoiding effort duplication
> > >   - Food for thought by GregKH
> > >   - X different CI systems running ${TEST} on latest stable kernel on
> > >   x86_64
> > >     might look useless on the first look but is it? AMD/Intel CPUs,
> > >     different
> > >     network cards, different graphic drivers, compilers, kernel
> > >     configuration...
> > >     How do we distribute the workload to avoid doing the same thing a=
ll
> > >     over
> > >     again while still running in enough different environments to get=
 the
> > >     most
> > >     coverage?


Hi Veronika,

All are great questions that we need to resolve!

I am also very much concerned about duplication in 2 other dimensions
with the current approach to kernel testing:

1. If X different CI systems running ${TEST}, developers receive X
reports about the same breakage from X different directions, in
different formats, of different quality, at slightly different times
and somebody needs to act on all of them in some way. The more CI
systems we have, the more run meaningful number of tests and do
automatic reporting, the more and more duplicates developers get.

2. Effort duplication between implementation of different CI systems.
Doing a proper and really good CI is very hard. This includes all
questions that you mentioned here, and fine tuning of all of that,
refining reporting, bisection, onboarding of different test suites,
onboarding of different dynamic/static analysis tools and much more.
Last but not least is duplication of processes related to these CIs.
Speaking of my experience with syzbot, this is extremely hard and
takes years. And we really can't expose a developer to 27 different
systems and slightly different processes (this would mean they follow
0 of these processes).
This is further complicated by the fact that kernel tests are
fragmented, so it's not possible to, say, simply run all kernel tests.
And kernel processes are fragmented, e.g. you mentioned patchwork, but
not all subsystems use patchwork, so it's not possible to simply
extend a CI to all subsystems. And some aspects of the current kernel
development process notoriously complicate automation of things that
really should be trivial. For example, if you have
github/gitlab/gerrit, you can hook into arrival of each new change and
pull exact code state. Done. For kernel some changes appear on
patchwork, some don't, some are duplicated on multiple patchworks,
some duplicated in a weird way on the same patchwork, some non-patches
appear on patchwork because it's confused, and last but not least you
can't really apply any of them because none of them include base
tree/commit info. Handling just this requires lots of effort, guessing
on coffee grounds and heuristics that need to be refined over time.
The total complexity of doing it just once, with all resources
combined and dev process re-shaped to cooperate is close to off-scale.

Do you see these points as a problem too? Or am I exaggerating matters?






> > > - Common hardware pools
> > >   - Is this something people are interested in? Would be helpful espe=
cially
> > >   for
> > >     HW that's hard to access, eg. ppc64le or s390x systems. Companies=
 could
> > > also
> > >     sing up to share their HW for testing to ensure kernel works with=
 their
> > >     products.
> >
> > I have strong opinions on some of these, but maybe only useful experien=
ce
> > in a few areas.  Fuego has 2 separate notions, which we call "skiplists"
> > and "pass criteria", which have to do with this bullet:
> >
> > - How to autodetect infrastructure failures, regressions/new bugs and t=
est
> >      bugs? How to handle continuous failures due to known bugs in both
> >      tests and kernel? What's your solution? Can people always trust the
> >      results they
> >      receive?
> >
> > I'd be happy to discuss this, if it's desired.
> >
> > Otherwise, I've recently been working on standards for "test definition=
",
> > which defines the data and meta-data associated with a test.   I could =
talk
> > about where I'm at with that, if people are interested.
> >
>
> Sounds great! I added both your points to the agenda as I do think they h=
ave
> a place here. The list of items is growing so I hope we can still fit
> everything into the two days we planned :)
>
>
> See you there!
> Veronika
>
> > Let me know what you think.
> >  -- Tim

--===============2901875586224948883==--

