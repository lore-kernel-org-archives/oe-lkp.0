Content-Type: multipart/mixed; boundary="===============5605503924031799617=="
MIME-Version: 1.0
From: Veronika Kabatova <vkabatov@redhat.com>
To: lkp@lists.01.org
Subject: CKI hackfest @Plumbers invite
Date: Tue, 21 May 2019 10:54:12 -0400
Message-ID: <1667759567.21267950.1558450452057.JavaMail.zimbra@redhat.com>
In-Reply-To: <1204558561.21265703.1558449611621.JavaMail.zimbra@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5605503924031799617==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

as some of you have heard, CKI Project is planning hackfest CI meetings aft=
er
Plumbers conference this year (Sept. 12-13). We would like to invite everyo=
ne
who has interest in CI for kernel to come and join us.

The early agenda with summary is at the end of the email. If you think ther=
e's
something important missing let us know! Also let us know in case you'd wan=
t to
lead any of the sessions, we'd be happy to delegate out some work :)


Please send us an email as soon as you decide to come and feel free to invi=
te
other people who should be present. We are not planning to cap the attendan=
ce
right now but need to solve the logistics based on the interest. The event =
is
free to attend, no additional registration except letting us know is needed.

Feel free to contact us if you have any questions,
Veronika
CKI Project


-----------------------------------------------------------
Here is an early agenda we put together:
- Introductions
- Common place for upstream results, result publishing in general
  - The discussion on the mailing list is going strong so we might be able =
to
    substitute this session for a different one in case everything is solve=
d by
    September.
- Test result interpretation and bug detection
  - How to autodetect infrastructure failures, regressions/new bugs and test
    bugs? How to handle continuous failures due to known bugs in both tests=
 and
    kernel? What's your solution? Can people always trust the results they
    receive?
- Getting results to developers/maintainers
  - Aimed at kernel developers and maintainers, share your feedback and
    expectations.
  - How much data should be sent in the initial communication vs. a click a=
way
    in a dashboard? Do you want incremental emails with new results as they=
 come
    in?
  - What about adding checks to tested patches in Patchwork when patch seri=
es
    are being tested?
  - Providing enough data/script to reproduce the failure. What if special =
HW
    is needed?
- Onboarding new kernel trees to test
  - Aimed at kernel developers and maintainers.
  - Which trees are most prone to bring in new problems? Which are the most
    critical ones? Do you want them to be tested? Which tests do you feel a=
re
    most beneficial for specific trees or in general?
- Security when testing untrusted patches
  - How do we merge, compile, and test patches that have untrusted code in =
them
    and have not yet been reviewed? How do we avoid abuse of systems,
    information theft, or other damage?
  - Check out the original patch that sparked the discussion at
    https://patchwork.ozlabs.org/patch/862123/
- Avoiding effort duplication
  - Food for thought by GregKH
  - X different CI systems running ${TEST} on latest stable kernel on x86_64
    might look useless on the first look but is it? AMD/Intel CPUs, differe=
nt
    network cards, different graphic drivers, compilers, kernel configurati=
on...
    How do we distribute the workload to avoid doing the same thing all over
    again while still running in enough different environments to get the m=
ost
    coverage?
- Common hardware pools
  - Is this something people are interested in? Would be helpful especially=
 for
    HW that's hard to access, eg. ppc64le or s390x systems. Companies could=
 also
    sing up to share their HW for testing to ensure kernel works with their
    products.

--===============5605503924031799617==--

