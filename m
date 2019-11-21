Content-Type: multipart/mixed; boundary="===============1198923687839687769=="
MIME-Version: 1.0
From: Ming Lei <ming.lei@redhat.com>
To: lkp@lists.01.org
Subject: Re: [scsi] 74eb6c22dc: suspend_stress.fail
Date: Thu, 21 Nov 2019 15:36:34 +0800
Message-ID: <20191121073634.GA4755@ming.t460p>
In-Reply-To: <20191121065000.GA9619@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============1198923687839687769==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 21, 2019 at 02:50:00PM +0800, Oliver Sang wrote:
> On Sat, Nov 16, 2019 at 04:54:43PM +0800, Ming Lei wrote:
> > Hello Oliver,
> > =

> > On Mon, Nov 04, 2019 at 04:50:21PM +0800, kernel test robot wrote:
> > > FYI, we noticed the following commit (built with gcc-7):
> > > =

> > > commit: 74eb6c22dc70e395b333c9ca579855cd88db8845 ("[RFC PATCH V3 2/2]=
 scsi: core: don't limit per-LUN queue depth for SSD")
> > > url: https://github.com/0day-ci/linux/commits/Ming-Lei/scsi-core-avoi=
d-host-wide-host_busy-counter-for-scsi_mq/20191009-015827
> > > base: https://git.kernel.org/cgit/linux/kernel/git/jejb/scsi.git for-=
next
> > > =

> > > in testcase: suspend_stress
> > > with following parameters:
> > > =

> > > 	mode: freeze
> > > 	iterations: 10
> > > =

> > > =

> > > =

> > > on test machine: 4 threads Skylake with 8G memory
> > > =

> > > caused below changes (please refer to attached dmesg/kmsg for entire =
log/backtrace):
> > > =

> > > =

> > > =

> > > =

> > > If you fix the issue, kindly add following tag
> > > Reported-by: kernel test robot <oliver.sang@intel.com>
> > > =

> > > test started
> > > =

> > > (then just like hang)
> > > (below is what looks like if test can pass
> > > SUSPEND RESUME TEST STARTED
> > > Suspend to freeze 1/10:
> > > ...
> > > Done
> > > Sleep for 10 seconds
> > > Suspend to freeze 2/10:
> > > ...
> > > Suspend to freeze 10/10:
> > > ...
> > > Sleep for 10 seconds
> > > SUSPEND RESUME TEST SUCCESS)
> > =

> > From the dmesg via 'zcat kmsg.xz', looks there isn't any failure found.
> > 'Suspend to freeze' has run successfully 10 times, and finally the
> > message of 'SUSPEND RESUME TEST SUCCESS' does show in the log.
> > =

> > Could you double check if it is a valid report?
> =

> Hi Ming, sorry for confusion. this case didn't always fail in our tests, =
and unfortunately,
> due to some code problem, the kmsg.xz attached in the original mail is fr=
om PASS test.
> (In failed tests, we cannot generate the kmsg so far actually)
> =

> However, in our tests, the regression is clear, for parent commit, the te=
st all passed,
> for this commit, the tests are easy to fail.
> 69fdd747ae1fa088  74eb6c22dc70e395b333c9ca57  =

> ----------------  --------------------------  =

>            :18          50%           9:18    suspend_stress.fail
> =

> @Rui also helped double confirm the regression by another power test - an=
alyze_suspend, which
> also shows this clear regression. Rui maybe could supply more information=
. Thanks!

OK.

Now I have posted the following new patchset, and this one has been
obsolete, so please drop it in your tree, then test new patches
and see if the failure can be reproduced. If yes, post us the dmesg
log.

https://lore.kernel.org/linux-scsi/20191118103117.978-1-ming.lei(a)redhat.c=
om/T/#t

Thanks,
Ming

--===============1198923687839687769==--

