Content-Type: multipart/mixed; boundary="===============1607448502201661361=="
MIME-Version: 1.0
From: Roman Gushchin <guro@fb.com>
To: lkp@lists.01.org
Subject: Re: [percpu] ace7e70901: aim9.sync_disk_rw.ops_per_sec -2.3% regression
Date: Mon, 10 May 2021 17:34:38 -0700
Message-ID: <YJnRHhK+2AVTMOfh@carbon.DHCP.thefacebook.com>
In-Reply-To: <YJWQE8AFjyYpsLYA@google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1607448502201661361==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, May 07, 2021 at 07:08:03PM +0000, Dennis Zhou wrote:
> On Fri, May 07, 2021 at 10:52:22AM -0700, Roman Gushchin wrote:
> > On Fri, May 07, 2021 at 11:06:06AM +0800, Oliver Sang wrote:
> > > hi Roman,
> > >  =

> > > On Thu, May 06, 2021 at 12:54:59AM +0000, Roman Gushchin wrote:
> > > > Ping
> > > =

> > > sorry for late.
> > > =

> > > the new patch makes the performance a little better but still has
> > > 1.9% regression comparing to
> > > f183324133 ("percpu: implement partial chunk depopulation")
> > =

> > Hi Oliver!
> > =

> > Thank you for testing it!
> > =

> > Btw, can you, please, confirm that the regression is coming specifically
> > from ace7e70901 ("percpu: use reclaim threshold instead of running for =
every page")?
> > I do see *some* regression in my setup, but the data is very noisy, so =
I'm not sure
> > I can confirm it.
> > =

> > Thanks!
> =

> Thanks Oliver and Roman. If this is the case, I'll drop the final patch
> and just merge up to f183324133 ("percpu: implement partial chunk
> depopulation") into for-next as this is v5.14 anyway.

I doubt it's a good idea. I reran the test with some debug added and it loo=
ks
like it doesn't  trigger any depopulation at all. Everything else looked sa=
ne
too.

Dropping a reasonable patch doing a good thing without any understandinding=
 how
it affects (or even can affect in theory) some benchmark sounds like a bad =
idea.
We'll never learn this. It could be that the regression is caused my some
tiny alignment difference or something like this, so any other change can
trigger it too (I can be totally wrong here, but I don't have any better
explanation either).

Btw, do we have any similar tests?

Thanks!
--===============1607448502201661361==--

