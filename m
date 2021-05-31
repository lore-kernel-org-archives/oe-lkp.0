Content-Type: multipart/mixed; boundary="===============2240809378713486754=="
MIME-Version: 1.0
From: Jan Kara <jack@suse.cz>
To: lkp@lists.01.org
Subject: Re: [ext4] 05c2c00f37: aim7.jobs-per-min -11.8% regression
Date: Mon, 31 May 2021 18:57:46 +0200
Message-ID: <20210531165746.GA2610@quack2.suse.cz>
In-Reply-To: <20210525092205.GA4112@quack2.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============2240809378713486754==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue 25-05-21 11:22:05, Jan Kara wrote:
> On Fri 21-05-21 12:42:16, Theodore Y. Ts'o wrote:
> > On Fri, May 21, 2021 at 11:27:30AM +0200, Jan Kara wrote:
> > > =

> > > OK, thanks for testing. So the orphan code is indeed the likely cause=
 of
> > > this regression but I probably did not guess correctly what is the
> > > contention point there. Then I guess I need to reproduce and do more
> > > digging why the contention happens...
> > =

> > Hmm... what if we only recalculate the superblock checksum when we do
> > a commit, via the callback function from the jbd2 layer to file
> > system?
> =

> I actually have to check whether the regression is there because of the
> additional locking of the buffer_head (because that's the only thing that
> was added to that code in fact, adding some atomic instructions, bouncing
> another cacheline) or because of the checksum computation that moved from
> ext4_handle_dirty_super() closer to actual superblock update under those
> locks.

So I did a few experiments on my test machine. I saw the biggest regression
for creat_clo workload for 7 threads. The results look like:

                         orig                   patched                hack=
1                  hack2
Hmean     creat_clo-7    36458.33 (   0.00%)    23836.55 * -34.62%*    3260=
8.70 * -10.56%*    37300.18 (   2.31%)

where hack1 means I've removed the lock_buffer() calls from orphan handling
code and hack2 means I've additionally moved checksum recalculation from
under orphan lock. Take the numbers with a grain of salt as they are rather
variable and this is just an average of 5 runs but the tendency is pretty
clear. Both these changes contribute to the regression significantly,
additional locking of the buffer head contributes somewhat more.

I will see how various variants of reducing the contention look like (e.g.
if just using bh lock for everything helps at all). But honestly I don't
want to jump through too big hoops just for this workload - the orphan list
contention is pretty pathological here and if we seriously care about
workload like this we should rather revive the patchset with hashed orphan
list I wrote couple years back... That was able to give like 3x speedup to
workloads like this.

								Honza
-- =

Jan Kara <jack@suse.com>
SUSE Labs, CR
--===============2240809378713486754==--

