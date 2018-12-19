Content-Type: multipart/mixed; boundary="===============7622325810007973640=="
MIME-Version: 1.0
From: Matthew Wilcox <willy@infradead.org>
To: lkp@lists.01.org
Subject: Re: 5404a7f1c2 [ 90.902541] watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [swapper:1]
Date: Wed, 19 Dec 2018 04:42:47 -0800
Message-ID: <20181219124247.GX10600@bombadil.infradead.org>
In-Reply-To: <38ee8a35-1bb3-7a63-8ef6-75f0ff46d198@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7622325810007973640==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 19, 2018 at 06:03:45PM +0800, Rong Chen wrote:
> On 12/18/2018 08:17 PM, Matthew Wilcox wrote:
> > On Tue, Dec 18, 2018 at 08:20:28AM +0800, kernel test robot wrote:
> > > Greetings,
> > > =

> > > 0day kernel testing robot got the below dmesg and the first bad commi=
t is
> > > =

> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git ma=
ster
> > > =

> > > commit 5404a7f1c21cfda061712bedf2d06cc0f6c755e9
> > I feel like you're wasting my time.  This is the fourth time in a row
> > you've reported something I can't reproduce.  At least this time the
> > instructions work, but I've tried it a dozen times and it doesn't produ=
ce
> > the error you're showing.
> > =

> > $ git branch
> > * (HEAD detached at 5404a7f1c21c)
> > ...
> > [    0.000000] Linux version 4.20.0-rc1-00012-g5404a7f1c21c (willy(a)bo=
bo) (gcc version 8.2.0 (Debian 8.2.0-9)) #4 Mon Dec 17 23:28:21 EST 2018
> > ...
> > [    9.848471] test_uuid: all 18 tests passed
> > [   11.019267] XArray: 19496249 of 19496249 tests passed
> > =

> > Your logs show it failing every time.  I can't help but wonder if it's
> > something else in your setup that's causing it to fail -- maybe the
> > machines doing the testing are overloaded?
> =

> Please accept my apologies for taking your time, it might be a false
> positive,
> we have uploaded the original bzImage(https://download.01.org/0day-ci/lkp=
-qemu/fbc/5404a7f1c21cfda061712bedf2d06cc0f6c755e9/)
> for your reference.

Yes, it doesn't fail here:

[    9.044254] test_uuid: all 18 tests passed
[   10.685486] XArray: 19496249 of 19496249 tests passed
[   10.794246] test_memcat_p: test passed

I notice your logs show it taking over 30 seconds to reach this same
point in boot, so I'm relatively confident in my diagnosis that your
testing machines are overloaded and that's inducing this problem.

--===============7622325810007973640==--

