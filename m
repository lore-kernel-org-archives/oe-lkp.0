Content-Type: multipart/mixed; boundary="===============6312447919477871711=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: lkp@lists.01.org
Subject: Re: livepatching selftests failure on current master branch
Date: Thu, 06 Jun 2019 08:49:43 +0800
Message-ID: <20190606004943.GA30795@intel.com>
In-Reply-To: <e264efb1-0b6e-c860-7a6d-ce92bde8efa2@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6312447919477871711==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 05, 2019 at 10:51:53AM -0400, Joe Lawrence wrote:
> On 6/5/19 10:31 AM, Philip Li wrote:
> >On Wed, Jun 05, 2019 at 09:48:02AM -0400, Joe Lawrence wrote:
> >>On 5/17/19 10:17 AM, Miroslav Benes wrote:
> >>>Hi,
> >>>
> >>>I noticed that livepatching selftests fail on our master branch
> >>>(https://git.kernel.org/pub/scm/linux/kernel/git/livepatching/livepatc=
hing.git/).
> >>>
> >>>...
> >>
> >>[ adding lkp(a)01.org to this email ]
> >>
> >>lkp folks, I was wondering if the kernel selftests were included as
> >>part of the test-bot and if so, do we need to do anything specific
> >yes, kernel selftest is part of regular execution, which includes the li=
vepatching
> > test. Also the livepatching.git is under our testing...
> =

> Hi Philip,
> =

> Good to hear.  My github tree and Josh's kernel.org tree are
> included as (perhaps other livepatching dev trees as well), so the
> more coverage the better :)
> =

> >                                                  ... But we may not suc=
cessfully
> >bisect all failures.
> =

> That's okay, though I guess I'm not clear why there wasn't an email
> reporting that the livepatching selftests failed after
> livepatching.git was recently updated to include tglx's stack trace
> fixes.
> =

> Do the tests only run for unique commits (ie, will it skip when
> livepatching.git updates/merges latest linux tree ??)
it will not skip, though we are not testing commit by commit. If the issue
is found, and bisect to the bad commit, we will report to author of that
commit for information.

> =

> Thanks,
> =

> -- Joe

--===============6312447919477871711==--

