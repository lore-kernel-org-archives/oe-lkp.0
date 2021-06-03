Content-Type: multipart/mixed; boundary="===============0348839398984951449=="
MIME-Version: 1.0
From: Jan Kara <jack@suse.cz>
To: lkp@lists.01.org
Subject: Re: [ext4] 05c2c00f37: aim7.jobs-per-min -11.8% regression
Date: Thu, 03 Jun 2021 18:10:04 +0200
Message-ID: <20210603161004.GL23647@quack2.suse.cz>
In-Reply-To: <20210531165746.GA2610@quack2.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============0348839398984951449==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon 31-05-21 18:57:46, Jan Kara wrote:
> On Tue 25-05-21 11:22:05, Jan Kara wrote:
> > On Fri 21-05-21 12:42:16, Theodore Y. Ts'o wrote:
> > > On Fri, May 21, 2021 at 11:27:30AM +0200, Jan Kara wrote:
> > > > =

> > > > OK, thanks for testing. So the orphan code is indeed the likely cau=
se of
> > > > this regression but I probably did not guess correctly what is the
> > > > contention point there. Then I guess I need to reproduce and do more
> > > > digging why the contention happens...
> > > =

> > > Hmm... what if we only recalculate the superblock checksum when we do
> > > a commit, via the callback function from the jbd2 layer to file
> > > system?
> > =

> > I actually have to check whether the regression is there because of the
> > additional locking of the buffer_head (because that's the only thing th=
at
> > was added to that code in fact, adding some atomic instructions, bounci=
ng
> > another cacheline) or because of the checksum computation that moved fr=
om
> > ext4_handle_dirty_super() closer to actual superblock update under those
> > locks.
> =

> So I did a few experiments on my test machine. I saw the biggest regressi=
on
> for creat_clo workload for 7 threads. The results look like:
> =

>                          orig                   patched                ha=
ck1                  hack2
> Hmean     creat_clo-7    36458.33 (   0.00%)    23836.55 * -34.62%*    32=
608.70 * -10.56%*    37300.18 (   2.31%)
> =

> where hack1 means I've removed the lock_buffer() calls from orphan handli=
ng
> code and hack2 means I've additionally moved checksum recalculation from
> under orphan lock. Take the numbers with a grain of salt as they are rath=
er
> variable and this is just an average of 5 runs but the tendency is pretty
> clear. Both these changes contribute to the regression significantly,
> additional locking of the buffer head contributes somewhat more.
> =

> I will see how various variants of reducing the contention look like (e.g.
> if just using bh lock for everything helps at all). But honestly I don't
> want to jump through too big hoops just for this workload - the orphan li=
st
> contention is pretty pathological here and if we seriously care about
> workload like this we should rather revive the patchset with hashed orphan
> list I wrote couple years back... That was able to give like 3x speedup to
> workloads like this.

So I did some more testing. I've found out that due to a configuration
mistake ramdisk created for previous round of test was tiny (8M instead of
8G) so I've now rerun all the tests and a few more:

                         Orig                   Patched                Hack=
1                  Hack2                  BH orphan lock
Hmean     creat_clo-1    12875.54 (   0.00%)    12765.96 (  -0.85%)    1276=
5.96 (  -0.85%)    12820.51 (  -0.43%)    12875.54 (   0.00%)
Hmean     creat_clo-2    20761.25 (   0.00%)    19736.84 *  -4.93%*    2040=
8.16 (  -1.70%)    19736.84 *  -4.93%*    20477.82 (  -1.37%)
Hmean     creat_clo-3    22727.27 (   0.00%)    22500.00 (  -1.00%)    2439=
0.24 (   7.32%)    23255.81 (   2.33%)    21176.47 (  -6.82%)
Hmean     creat_clo-4    27149.32 (   0.00%)    24539.88 *  -9.61%*    2727=
2.73 (   0.45%)    25806.45 (  -4.95%)    21660.65 * -20.22%*
Hmean     creat_clo-5    32397.41 (   0.00%)    27985.08 * -13.62%*    2895=
7.53 ( -10.62%)    29821.07 *  -7.95%*    23771.79 * -26.62%*
Hmean     creat_clo-6    33898.30 (   0.00%)    30769.23 (  -9.23%)    3098=
1.07 (  -8.61%)    31858.41 (  -6.02%)    26086.96 * -23.04%*
Hmean     creat_clo-7    29005.52 (   0.00%)    29661.02 (   2.26%)    3074=
6.71 (   6.00%)    33175.35 (  14.38%)    24970.27 ( -13.91%)
Hmean     creat_clo-8    30573.25 (   0.00%)    32000.00 (   4.67%)    2970=
2.97 (  -2.85%)    34139.40 (  11.66%)    23668.64 * -22.58%*

Similarly to previous test, 'Orig' is the original state before 05c2c00f37,
'Patched' is a state after commit 05c2c00f37, 'Hack1' is 05c2c00f37 but with
lock_buffer() calls removed from orphan handling, 'Hack2' is 05c2c00f37 with
lock_buffer() calls removed and checksumming moved from under orphan_lock,
'BH orphan lock' is 05c2c00f37 with orphan_lock replaced with sb buffer
lock.

As we can see with fixed filesystem size, the regression isn't actually
that big anymore but it about matches what 0-day reported. Replacing orphan
lock with superblock buffer_head lock makes things even much worse - not
really surprising given we are replacing optimized mutex implementation
with a bitlock. Just removing buffer lock (Hack1 test) doesn't seem to
improve the results noticeably so that is not a problem. Moving
checksumming out from under the orphan_lock would probably help noticeably
(Hack2 test) but there's the problem when to compute checksums for
nojournal mode and also we'd need to be very careful with all the other
places updating superblock so that they serialize against orphan operations
so that they cannot invalidate the checksum - IMO not very compelling.

So as we chatted on today's call probably the best option is to leave the
code as is for now and instead work on moving away from orphan list
altogether. I'll revive my patches to do that.

								Honza
-- =

Jan Kara <jack@suse.com>
SUSE Labs, CR
--===============0348839398984951449==--

