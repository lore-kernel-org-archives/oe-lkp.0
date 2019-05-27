Content-Type: multipart/mixed; boundary="===============1652651782761062881=="
MIME-Version: 1.0
From: Veronika Kabatova <vkabatov@redhat.com>
To: lkp@lists.01.org
Subject: Re: CKI hackfest @Plumbers invite
Date: Mon, 27 May 2019 07:52:13 -0400
Message-ID: <1442701383.22077553.1558957933273.JavaMail.zimbra@redhat.com>
In-Reply-To: <ECADFF3FD767C149AD96A924E7EA6EAF9772760D@USCULXMSG01.am.sony.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1652651782761062881==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



----- Original Message -----
> From: "Tim Bird" <Tim.Bird@sony.com>
> To: vkabatov(a)redhat.com, automated-testing(a)yoctoproject.org, info(a)k=
ernelci.org, khilamn(a)baylibre.org,
> syzkaller(a)googlegroups.com, lkp(a)lists.01.org, stable(a)vger.kernel.or=
g, labbott(a)redhat.com
> Cc: eslobodo(a)redhat.com, cki-project(a)redhat.com
> Sent: Friday, May 24, 2019 10:17:04 PM
> Subject: RE: CKI hackfest @Plumbers invite
> =

> =

> =

> > -----Original Message-----
> > From: Veronika Kabatova
> > =

> > Hi,
> > =

> > as some of you have heard, CKI Project is planning hackfest CI meetings
> > after
> > Plumbers conference this year (Sept. 12-13). We would like to invite
> > everyone
> > who has interest in CI for kernel to come and join us.
> > =

> > The early agenda with summary is at the end of the email. If you think
> > there's
> > something important missing let us know! Also let us know in case you'd
> > want to
> > lead any of the sessions, we'd be happy to delegate out some work :)
> > =

> > =

> > Please send us an email as soon as you decide to come and feel free to
> > invite
> > other people who should be present. We are not planning to cap the
> > attendance
> > right now but need to solve the logistics based on the interest. The ev=
ent
> > is
> > free to attend, no additional registration except letting us know is
> > needed.
> > =

> > Feel free to contact us if you have any questions,
> =

> I plan to come to the event.
> =

> > -----------------------------------------------------------
> > Here is an early agenda we put together:
> > - Introductions
> > - Common place for upstream results, result publishing in general
> >   - The discussion on the mailing list is going strong so we might be a=
ble
> >   to
> >     substitute this session for a different one in case everything is
> >     solved by
> >     September.
> > - Test result interpretation and bug detection
> >   - How to autodetect infrastructure failures, regressions/new bugs and
> >   test
> >     bugs? How to handle continuous failures due to known bugs in both t=
ests
> > and
> >     kernel? What's your solution? Can people always trust the results t=
hey
> >     receive?
> > - Getting results to developers/maintainers
> >   - Aimed at kernel developers and maintainers, share your feedback and
> >     expectations.
> >   - How much data should be sent in the initial communication vs. a cli=
ck
> >   away
> >     in a dashboard? Do you want incremental emails with new results as =
they
> > come
> >     in?
> >   - What about adding checks to tested patches in Patchwork when patch
> > series
> >     are being tested?
> >   - Providing enough data/script to reproduce the failure. What if spec=
ial
> >   HW
> >     is needed?
> > - Onboarding new kernel trees to test
> >   - Aimed at kernel developers and maintainers.
> >   - Which trees are most prone to bring in new problems? Which are the =
most
> >     critical ones? Do you want them to be tested? Which tests do you fe=
el
> >     are
> >     most beneficial for specific trees or in general?
> > - Security when testing untrusted patches
> >   - How do we merge, compile, and test patches that have untrusted code=
 in
> > them
> >     and have not yet been reviewed? How do we avoid abuse of systems,
> >     information theft, or other damage?
> >   - Check out the original patch that sparked the discussion at
> >     https://patchwork.ozlabs.org/patch/862123/
> > - Avoiding effort duplication
> >   - Food for thought by GregKH
> >   - X different CI systems running ${TEST} on latest stable kernel on
> >   x86_64
> >     might look useless on the first look but is it? AMD/Intel CPUs,
> >     different
> >     network cards, different graphic drivers, compilers, kernel
> >     configuration...
> >     How do we distribute the workload to avoid doing the same thing all
> >     over
> >     again while still running in enough different environments to get t=
he
> >     most
> >     coverage?
> > - Common hardware pools
> >   - Is this something people are interested in? Would be helpful especi=
ally
> >   for
> >     HW that's hard to access, eg. ppc64le or s390x systems. Companies c=
ould
> > also
> >     sing up to share their HW for testing to ensure kernel works with t=
heir
> >     products.
> =

> I have strong opinions on some of these, but maybe only useful experience
> in a few areas.  Fuego has 2 separate notions, which we call "skiplists"
> and "pass criteria", which have to do with this bullet:
> =

> - How to autodetect infrastructure failures, regressions/new bugs and test
>      bugs? How to handle continuous failures due to known bugs in both
>      tests and kernel? What's your solution? Can people always trust the
>      results they
>      receive?
> =

> I'd be happy to discuss this, if it's desired.
> =

> Otherwise, I've recently been working on standards for "test definition",
> which defines the data and meta-data associated with a test.   I could ta=
lk
> about where I'm at with that, if people are interested.
> =


Sounds great! I added both your points to the agenda as I do think they have
a place here. The list of items is growing so I hope we can still fit
everything into the two days we planned :)


See you there!
Veronika

> Let me know what you think.
>  -- Tim
> =

>=20

--===============1652651782761062881==--

