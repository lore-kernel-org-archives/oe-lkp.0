Content-Type: multipart/mixed; boundary="===============1089605197387652516=="
MIME-Version: 1.0
From: Johannes Weiner <hannes@cmpxchg.org>
To: lkp@lists.01.org
Subject: Re: acb32a95a9: BUG: kernel hang in test stage
Date: Wed, 19 Apr 2017 13:39:53 -0400
Message-ID: <20170419173953.GA5517@cmpxchg.org>
In-Reply-To: <20170419102744.077ca9821540db6dc0f1b439@linux-foundation.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============1089605197387652516==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 19, 2017 at 10:27:44AM -0700, Andrew Morton wrote:
> On Wed, 19 Apr 2017 12:46:02 -0400 Johannes Weiner <hannes@cmpxchg.org>=
 wrote:
> =

> > Hi,
> > =

> > On Thu, Apr 20, 2017 at 12:05:32AM +0800, kernel test robot wrote:
> > > Greetings,
> > > =

> > > 0day kernel testing robot got the below dmesg and the first bad commi=
t is
> > > =

> > > git://git.cmpxchg.org/linux-mmotm.git master
> > > =

> > > commit acb32a95a90a6f88860eb344d04e1634ebbc2170
> > > Author:     mmotm auto import <mm-commits@vger.kernel.org>
> > > AuthorDate: Thu Apr 13 22:02:16 2017 +0000
> > > Commit:     Johannes Weiner <hannes@cmpxchg.org>
> > > CommitDate: Thu Apr 13 22:02:16 2017 +0000
> > > =

> > >     linux-next
> > =

> > Hm, you'd think the linux-next commit in the mm tree would produce
> > problems more often, but this is the first time I've seen it as the
> > culprit in a problem report.
> > =

> > Do problems usually get spotted inside linux-next.git first and then
> > the same issues are not reported against the -mm tree?
> > =

> > I also just noticed that <mm-commits@vger.kernel.org> might be a bad
> > author email since AFAIK it drops everything but akpm-mail.
> =

> yup, that's how davem originally set it up.  It's never caused a
> problem but it's a bit odd and I guess we could ask hmi to change it.
> =

> > Andrew,
> > would it be better to set you as the Author of these import patches?
> > Easy enough to change my scripts.
> =

> Sure, that works.

Okay, fixed.

http://git.cmpxchg.org/cgit.cgi/linux-mmots.git/commit/?id=3D9cffa970e59a20=
315c8b73944dd93e37d2ecd785
vs.
http://git.cmpxchg.org/cgit.cgi/linux-mmots.git/commit/?id=3Dc31d75472e61d0=
de0d9490bebd6d7167ae2eb5d6

--===============1089605197387652516==--

