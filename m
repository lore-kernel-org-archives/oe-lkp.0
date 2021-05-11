Content-Type: multipart/mixed; boundary="===============0853780413458123940=="
MIME-Version: 1.0
From: Dennis Zhou <dennis@kernel.org>
To: lkp@lists.01.org
Subject: Re: [percpu] ace7e70901: aim9.sync_disk_rw.ops_per_sec -2.3% regression
Date: Tue, 11 May 2021 01:27:06 +0000
Message-ID: <YJndaqy7AbBYnjPh@google.com>
In-Reply-To: <YJnaQcgZaC8qJhOB@carbon.DHCP.thefacebook.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0853780413458123940==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, May 10, 2021 at 06:13:37PM -0700, Roman Gushchin wrote:
> On Tue, May 11, 2021 at 12:44:18AM +0000, Dennis Zhou wrote:
> > On Mon, May 10, 2021 at 05:34:38PM -0700, Roman Gushchin wrote:
> > > On Fri, May 07, 2021 at 07:08:03PM +0000, Dennis Zhou wrote:
> > > > On Fri, May 07, 2021 at 10:52:22AM -0700, Roman Gushchin wrote:
> > > > > On Fri, May 07, 2021 at 11:06:06AM +0800, Oliver Sang wrote:
> > > > > > hi Roman,
> > > > > >  =

> > > > > > On Thu, May 06, 2021 at 12:54:59AM +0000, Roman Gushchin wrote:
> > > > > > > Ping
> > > > > > =

> > > > > > sorry for late.
> > > > > > =

> > > > > > the new patch makes the performance a little better but still h=
as
> > > > > > 1.9% regression comparing to
> > > > > > f183324133 ("percpu: implement partial chunk depopulation")
> > > > > =

> > > > > Hi Oliver!
> > > > > =

> > > > > Thank you for testing it!
> > > > > =

> > > > > Btw, can you, please, confirm that the regression is coming speci=
fically
> > > > > from ace7e70901 ("percpu: use reclaim threshold instead of runnin=
g for every page")?
> > > > > I do see *some* regression in my setup, but the data is very nois=
y, so I'm not sure
> > > > > I can confirm it.
> > > > > =

> > > > > Thanks!
> > > > =

> > > > Thanks Oliver and Roman. If this is the case, I'll drop the final p=
atch
> > > > and just merge up to f183324133 ("percpu: implement partial chunk
> > > > depopulation") into for-next as this is v5.14 anyway.
> > > =

> > > I doubt it's a good idea. I reran the test with some debug added and =
it looks
> > > like it doesn't  trigger any depopulation at all. Everything else loo=
ked sane
> > > too.
> > > =

> > =

> > Well that's awkward...
> > =

> > > Dropping a reasonable patch doing a good thing without any understand=
inding how
> > > it affects (or even can affect in theory) some benchmark sounds like =
a bad idea.
> > > We'll never learn this. It could be that the regression is caused my =
some
> > > tiny alignment difference or something like this, so any other change=
 can
> > > trigger it too (I can be totally wrong here, but I don't have any bet=
ter
> > > explanation either).
> > > =

> > =

> > So I'm not 100% thrilled with the final patch anyway. Particularly the
> > lock dancing I'd rather figure something out a little cleaner. I'm going
> > to take some time later this week and sort it out. If I can't think of
> > anthing better I'll just reapply the final patch.
> > =

> > I've currently merged everything up into the last patch for-5.14. Should
> > at least give us some very preliminary testing.
> =

> Sounds good to me!
> =

> But if under final you mean the batching, I'd include my locking optimiza=
tion
> patch or something similar to it. We shouldn't grab and release the pcpu_=
lock
> many times for no reason.

Yeah, I have that in mind + a few renamings in addition to the batching
batch.

> =

> Thanks!
--===============0853780413458123940==--

