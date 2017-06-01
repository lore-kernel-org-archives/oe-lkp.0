Content-Type: multipart/mixed; boundary="===============8704717232645196588=="
MIME-Version: 1.0
From: Jeff Layton <jlayton@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [fs/locks] 9d21d181d0: will-it-scale.per_process_ops -14.1% regression
Date: Thu, 01 Jun 2017 08:59:21 -0400
Message-ID: <1496321961.2845.6.camel@redhat.com>
In-Reply-To: <8F2C3CFF-5C2D-41B0-A895-B1F074DA7943@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8704717232645196588==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-06-01 at 07:49 -0400, Benjamin Coddington wrote:
> On 1 Jun 2017, at 7:41, Jeff Layton wrote:
> =

> > On Thu, 2017-06-01 at 10:05 +0800, kernel test robot wrote:
> > > Greeting,
> > > =

> > > FYI, we noticed a -14.1% regression of will-it-scale.per_process_ops =

> > > due to commit:
> > > =

> > > =

> > > commit: 9d21d181d06acab9a8e80eac2ec4eed77b656793 ("fs/locks: Set =

> > > fl_nspid at file_lock allocation")
> > > url: =

> > > https://github.com/0day-ci/linux/commits/Benjamin-Coddington/fs-locks=
-Alloc-file_lock-where-practical/20170527-050700
> > > =

> > > =

> > =

> > Ouch, that's a rather nasty performance hit. In hindsight, maybe we
> > shouldn't move those off the stack after all? Heck, if it's that
> > significant, maybe we should move the F_SETLK callers to allocate =

> > these
> > on the stack as well?
> =

> We can do that.  But, I think this is picking up the =

> locks_mandatory_area()
> allocation which is now removed.  The attached config has
> CONFIG_MANDATORY_FILE_LOCKING=3Dy,  so there's allocation on every =

> read/write.
> =


I'm not so sure. That would only be the case if the thing were marked
for manadatory locking (a really rare thing).

The test is really simple and I don't think any read/write activity is
involved:

    https://github.com/antonblanchard/will-it-scale/blob/master/tests/lock1=
.c

...and the 0 day bisected it down to this patch, IIUC:

    https://github.com/0day-ci/linux/commit/9d21d181d06acab9a8e80eac2ec4eed=
77b656793

It seems likely that it's the extra get_pid/put_pid in the allocation
and free codepath. I expected those to be pretty cheap, but maybe
they're not?
-- =

Jeff Layton <jlayton@redhat.com>

--===============8704717232645196588==--

