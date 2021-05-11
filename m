Content-Type: multipart/mixed; boundary="===============8900297499643845068=="
MIME-Version: 1.0
From: Roman Gushchin <guro@fb.com>
To: lkp@lists.01.org
Subject: Re: [percpu] ace7e70901: aim9.sync_disk_rw.ops_per_sec -2.3% regression
Date: Mon, 10 May 2021 18:13:37 -0700
Message-ID: <YJnaQcgZaC8qJhOB@carbon.DHCP.thefacebook.com>
In-Reply-To: <YJnTYicu2TaVqVmi@google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8900297499643845068==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 11, 2021 at 12:44:18AM +0000, Dennis Zhou wrote:
> On Mon, May 10, 2021 at 05:34:38PM -0700, Roman Gushchin wrote:
> > On Fri, May 07, 2021 at 07:08:03PM +0000, Dennis Zhou wrote:
> > > On Fri, May 07, 2021 at 10:52:22AM -0700, Roman Gushchin wrote:
> > > > On Fri, May 07, 2021 at 11:06:06AM +0800, Oliver Sang wrote:
> > > > > hi Roman,
> > > > >  =

> > > > > On Thu, May 06, 2021 at 12:54:59AM +0000, Roman Gushchin wrote:
> > > > > > Ping
> > > > > =

> > > > > sorry for late.
> > > > > =

> > > > > the new patch makes the performance a little better but still has
> > > > > 1.9% regression comparing to
> > > > > f183324133 ("percpu: implement partial chunk depopulation")
> > > > =

> > > > Hi Oliver!
> > > > =

> > > > Thank you for testing it!
> > > > =

> > > > Btw, can you, please, confirm that the regression is coming specifi=
cally
> > > > from ace7e70901 ("percpu: use reclaim threshold instead of running =
for every page")?
> > > > I do see *some* regression in my setup, but the data is very noisy,=
 so I'm not sure
> > > > I can confirm it.
> > > > =

> > > > Thanks!
> > > =

> > > Thanks Oliver and Roman. If this is the case, I'll drop the final pat=
ch
> > > and just merge up to f183324133 ("percpu: implement partial chunk
> > > depopulation") into for-next as this is v5.14 anyway.
> > =

> > I doubt it's a good idea. I reran the test with some debug added and it=
 looks
> > like it doesn't  trigger any depopulation at all. Everything else looke=
d sane
> > too.
> > =

> =

> Well that's awkward...
> =

> > Dropping a reasonable patch doing a good thing without any understandin=
ding how
> > it affects (or even can affect in theory) some benchmark sounds like a =
bad idea.
> > We'll never learn this. It could be that the regression is caused my so=
me
> > tiny alignment difference or something like this, so any other change c=
an
> > trigger it too (I can be totally wrong here, but I don't have any better
> > explanation either).
> > =

> =

> So I'm not 100% thrilled with the final patch anyway. Particularly the
> lock dancing I'd rather figure something out a little cleaner. I'm going
> to take some time later this week and sort it out. If I can't think of
> anthing better I'll just reapply the final patch.
> =

> I've currently merged everything up into the last patch for-5.14. Should
> at least give us some very preliminary testing.

Sounds good to me!

But if under final you mean the batching, I'd include my locking optimizati=
on
patch or something similar to it. We shouldn't grab and release the pcpu_lo=
ck
many times for no reason.

Thanks!
--===============8900297499643845068==--

