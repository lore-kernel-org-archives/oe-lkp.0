Content-Type: multipart/mixed; boundary="===============1461386129130032682=="
MIME-Version: 1.0
From: Ian Kent <raven@themaw.net>
To: lkp@lists.01.org
Subject: Re: [kernfs] ea7c5fc39a: stress-ng.stream.ops_per_sec 11827.2% improvement
Date: Thu, 11 Jun 2020 11:02:30 +0800
Message-ID: <41e9ea55fad97df81393df544343a20c466c7917.camel@themaw.net>
In-Reply-To: <20200611020657.GI12456@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============1461386129130032682==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-06-11 at 10:06 +0800, kernel test robot wrote:
> On Sun, Jun 07, 2020 at 09:13:08AM +0800, Ian Kent wrote:
> > On Sat, 2020-06-06 at 20:18 +0200, Greg Kroah-Hartman wrote:
> > > On Sat, Jun 06, 2020 at 11:52:16PM +0800, kernel test robot
> > > wrote:
> > > > Greeting,
> > > > =

> > > > FYI, we noticed a 11827.2% improvement of stress-
> > > > ng.stream.ops_per_sec due to commit:
> > > > =

> > > > =

> > > > commit: ea7c5fc39ab005b501e0c7666c29db36321e4f74 ("[PATCH 1/4]
> > > > kernfs: switch kernfs to use an rwsem")
> > > > url: =

> > > > https://github.com/0day-ci/linux/commits/Ian-Kent/kernfs-proposed-l=
ocking-and-concurrency-improvement/20200525-134849
> > > > =

> > > =

> > > Seriously?  That's a huge performance increase, and one that
> > > feels
> > > really odd.  Why would a stress-ng test be touching sysfs?
> > =

> > That is unusually high even if there's a lot of sysfs or kernfs
> > activity and that patch shouldn't improve VFS path walk contention
> > very much even if it is present.
> > =

> > Maybe I've missed something, and the information provided doesn't
> > seem to be quite enough to even make a start on it.
> > =

> > That's going to need some analysis which, for my part, will need to
> > wait probably until around rc1 time frame to allow me to get
> > through
> > the push down stack (reactive, postponed due to other priorities)
> > of
> > jobs I have in order to get back to the fifo queue (longer term
> > tasks,
> > of which this is one) list of jobs I need to do as well, ;)
> > =

> > Please, kernel test robot, more information about this test and
> > what
> > it's doing.
> > =

> =

> Hi Ian,
> =

> We increased the timeout of stress-ng from 1s to 32s, and there's
> only
> 3% improvement of stress-ng.stream.ops_per_sec:
> =

> fefcfc968723caf9  ea7c5fc39ab005b501e0c7666c  testcase/testparams/tes
> tbox
> ----------------  --------------------------  -----------------------
> ----
>          %stddev      change         %stddev
>              \          |                \  =

>      10686               3%      11037        stress-ng/cpu-cache-
> performance-1HDD-100%-32s-ucode=3D0x500002c/lkp-csl-2sp5
>      10686               3%      11037        GEO-MEAN stress-
> ng.stream.ops_per_sec
> =

> It seems the result of stress-ng is inaccurate if test time too
> short, we'll increase the test time to avoid unreasonable results,
> sorry for the inconvenience.

Haha, I was worried there wasn't anything that could be done to
work out what was wrong.

I had tried to reproduce it, and failed since the job file specifies
a host config that I simply don't have, and I don't get how to alter
the job to suit, or how to specify a host definition file.

I also couldn't work out what parameters where used in running the
test so I was about to ask on the lkp list after working through
this in a VM.

So your timing on looking into this is fortunate, for sure.
Thank you very much for that.

Now, Greg, there's that locking I changed around kernfs_refresh_inode()
that I need to fix which I re-considered as a result of this, so that's
a plus for the testing because it's certainly wrong.

I'll have another look at that and boot test it on a couple of systems
then post a v2 for you to consider. What I've done might offend your
sensibilities as it does mine, or perhaps not so much.

Ian

--===============1461386129130032682==--

