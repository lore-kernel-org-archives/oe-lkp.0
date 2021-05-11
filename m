Content-Type: multipart/mixed; boundary="===============8184397028950455832=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [percpu] ace7e70901: aim9.sync_disk_rw.ops_per_sec -2.3% regression
Date: Tue, 11 May 2021 10:26:14 +0800
Message-ID: <20210511022614.GB8539@xsang-OptiPlex-9020>
In-Reply-To: <YJWQE8AFjyYpsLYA@google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8184397028950455832==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Dennis,

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
> =

> Oliver, is there a way to trigger the kernel test robot for a specific
> test?

sorry for late.
not sure what kind of specific test you want robot to do?
if you mean for-next branch, if the branch is monitored by kernel test robo=
t,
after merge, it will be tested by robot automatically and the bisect will be
triggered if there is still regression.

I found the ace7e70901 has already been dropped from original branch (denni=
s-percpu/for-5.14),
and we have data for this branch as below. from data, the f183324133 (curre=
nt
branch tip) doesn't introduce regression comparing 5.12-rc7 in our tests.

f183324133ea5 percpu: implement partial chunk depopulation                 =
103673.09 102188.39 104325.06 104038.4 102908.57 104057.06
1c29a3ceaf5f0 percpu: use pcpu_free_slot instead of pcpu_nr_slots - 1      =
104777.31 102225.93 101657.6
8ea2e1e35d1eb percpu: factor out pcpu_check_block_hint()                   =
102290.78 101853.87 102541.65
d434405aaab7d Linux 5.12-rc7                                               =
102103.06 102248.12 101906.81 103033.13 102043.33


> =

> Thanks,
> Dennis
--===============8184397028950455832==--

