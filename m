Content-Type: multipart/mixed; boundary="===============8729558327083206411=="
MIME-Version: 1.0
From: Petr Mladek <pmladek@suse.com>
To: lkp@lists.01.org
Subject: Re: livepatching selftests failure on current master branch
Date: Tue, 11 Jun 2019 09:42:57 +0200
Message-ID: <20190611074257.kogayuriz5aovv4b@pathway.suse.cz>
In-Reply-To: <20190606004943.GA30795@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8729558327083206411==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu 2019-06-06 08:49:43, Philip Li wrote:
> On Wed, Jun 05, 2019 at 10:51:53AM -0400, Joe Lawrence wrote:
> > On 6/5/19 10:31 AM, Philip Li wrote:
> > >On Wed, Jun 05, 2019 at 09:48:02AM -0400, Joe Lawrence wrote:
> > That's okay, though I guess I'm not clear why there wasn't an email
> > reporting that the livepatching selftests failed after
> > livepatching.git was recently updated to include tglx's stack trace
> > fixes.
> > =

> > Do the tests only run for unique commits (ie, will it skip when
> > livepatching.git updates/merges latest linux tree ??)
> it will not skip, though we are not testing commit by commit. If the issue
> is found, and bisect to the bad commit, we will report to author of that
> commit for information.

Bisecting might take a lot of time or even fail. But each selftest
should get associated with a kernel subsystem. It would be helpful
to always inform the subsystem maintainers. Or at least the author
of the selftest that failed.

Best Regards,
Petr

--===============8729558327083206411==--

