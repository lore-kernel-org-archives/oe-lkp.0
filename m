Content-Type: multipart/mixed; boundary="===============7028987870108614196=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: lkp@lists.01.org
Subject: Re: livepatching selftests failure on current master branch
Date: Fri, 14 Jun 2019 14:55:57 +0800
Message-ID: <20190614065557.GA12282@intel.com>
In-Reply-To: <20190611074257.kogayuriz5aovv4b@pathway.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============7028987870108614196==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2019 at 09:42:57AM +0200, Petr Mladek wrote:
> On Thu 2019-06-06 08:49:43, Philip Li wrote:
> > On Wed, Jun 05, 2019 at 10:51:53AM -0400, Joe Lawrence wrote:
> > > On 6/5/19 10:31 AM, Philip Li wrote:
> > > >On Wed, Jun 05, 2019 at 09:48:02AM -0400, Joe Lawrence wrote:
> > > That's okay, though I guess I'm not clear why there wasn't an email
> > > reporting that the livepatching selftests failed after
> > > livepatching.git was recently updated to include tglx's stack trace
> > > fixes.
> > > =

> > > Do the tests only run for unique commits (ie, will it skip when
> > > livepatching.git updates/merges latest linux tree ??)
> > it will not skip, though we are not testing commit by commit. If the is=
sue
> > is found, and bisect to the bad commit, we will report to author of that
> > commit for information.
> =

> Bisecting might take a lot of time or even fail. But each selftest
> should get associated with a kernel subsystem. It would be helpful
> to always inform the subsystem maintainers. Or at least the author
> of the selftest that failed.
thanks for the suggestion, we haven't done this yet that we uses merging
approach (merge different repos together to test) to speed up the testing,
so we need to bisect to make sure the issue is reproducible and not related
to merge. But anyway, we will consider this for future todo.

> =

> Best Regards,
> Petr

--===============7028987870108614196==--

