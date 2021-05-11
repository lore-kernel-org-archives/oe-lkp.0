Content-Type: multipart/mixed; boundary="===============1030672651712076132=="
MIME-Version: 1.0
From: Dennis Zhou <dennis@kernel.org>
To: lkp@lists.01.org
Subject: Re: [percpu] ace7e70901: aim9.sync_disk_rw.ops_per_sec -2.3% regression
Date: Tue, 11 May 2021 00:44:18 +0000
Message-ID: <YJnTYicu2TaVqVmi@google.com>
In-Reply-To: <YJnRHhK+2AVTMOfh@carbon.DHCP.thefacebook.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1030672651712076132==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, May 10, 2021 at 05:34:38PM -0700, Roman Gushchin wrote:
> On Fri, May 07, 2021 at 07:08:03PM +0000, Dennis Zhou wrote:
> > On Fri, May 07, 2021 at 10:52:22AM -0700, Roman Gushchin wrote:
> > > On Fri, May 07, 2021 at 11:06:06AM +0800, Oliver Sang wrote:
> > > > hi Roman,
> > > >  =

> > > > On Thu, May 06, 2021 at 12:54:59AM +0000, Roman Gushchin wrote:
> > > > > Ping
> > > > =

> > > > sorry for late.
> > > > =

> > > > the new patch makes the performance a little better but still has
> > > > 1.9% regression comparing to
> > > > f183324133 ("percpu: implement partial chunk depopulation")
> > > =

> > > Hi Oliver!
> > > =

> > > Thank you for testing it!
> > > =

> > > Btw, can you, please, confirm that the regression is coming specifica=
lly
> > > from ace7e70901 ("percpu: use reclaim threshold instead of running fo=
r every page")?
> > > I do see *some* regression in my setup, but the data is very noisy, s=
o I'm not sure
> > > I can confirm it.
> > > =

> > > Thanks!
> > =

> > Thanks Oliver and Roman. If this is the case, I'll drop the final patch
> > and just merge up to f183324133 ("percpu: implement partial chunk
> > depopulation") into for-next as this is v5.14 anyway.
> =

> I doubt it's a good idea. I reran the test with some debug added and it l=
ooks
> like it doesn't  trigger any depopulation at all. Everything else looked =
sane
> too.
> =


Well that's awkward...

> Dropping a reasonable patch doing a good thing without any understandindi=
ng how
> it affects (or even can affect in theory) some benchmark sounds like a ba=
d idea.
> We'll never learn this. It could be that the regression is caused my some
> tiny alignment difference or something like this, so any other change can
> trigger it too (I can be totally wrong here, but I don't have any better
> explanation either).
> =


So I'm not 100% thrilled with the final patch anyway. Particularly the
lock dancing I'd rather figure something out a little cleaner. I'm going
to take some time later this week and sort it out. If I can't think of
anthing better I'll just reapply the final patch.

I've currently merged everything up into the last patch for-5.14. Should
at least give us some very preliminary testing.

> Btw, do we have any similar tests?
> =

> Thanks!

Thanks,
Dennis
--===============1030672651712076132==--

