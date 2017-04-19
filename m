Content-Type: multipart/mixed; boundary="===============8624570353724899609=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: acb32a95a9: BUG: kernel hang in test stage
Date: Wed, 19 Apr 2017 10:27:44 -0700
Message-ID: <20170419102744.077ca9821540db6dc0f1b439@linux-foundation.org>
In-Reply-To: <20170419164602.GA4821@cmpxchg.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============8624570353724899609==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 19 Apr 2017 12:46:02 -0400 Johannes Weiner <hannes@cmpxchg.org> w=
rote:

> Hi,
> =

> On Thu, Apr 20, 2017 at 12:05:32AM +0800, kernel test robot wrote:
> > Greetings,
> > =

> > 0day kernel testing robot got the below dmesg and the first bad commit =
is
> > =

> > git://git.cmpxchg.org/linux-mmotm.git master
> > =

> > commit acb32a95a90a6f88860eb344d04e1634ebbc2170
> > Author:     mmotm auto import <mm-commits@vger.kernel.org>
> > AuthorDate: Thu Apr 13 22:02:16 2017 +0000
> > Commit:     Johannes Weiner <hannes@cmpxchg.org>
> > CommitDate: Thu Apr 13 22:02:16 2017 +0000
> > =

> >     linux-next
> =

> Hm, you'd think the linux-next commit in the mm tree would produce
> problems more often, but this is the first time I've seen it as the
> culprit in a problem report.
> =

> Do problems usually get spotted inside linux-next.git first and then
> the same issues are not reported against the -mm tree?
> =

> I also just noticed that <mm-commits@vger.kernel.org> might be a bad
> author email since AFAIK it drops everything but akpm-mail.

yup, that's how davem originally set it up.  It's never caused a
problem but it's a bit odd and I guess we could ask hmi to change it.

> Andrew,
> would it be better to set you as the Author of these import patches?
> Easy enough to change my scripts.

Sure, that works.

--===============8624570353724899609==--

