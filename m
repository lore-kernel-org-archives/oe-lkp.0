Content-Type: multipart/mixed; boundary="===============2187303856890932542=="
MIME-Version: 1.0
From: Ming Lei <ming.lei@redhat.com>
To: lkp@lists.01.org
Subject: Re: [scsi] 74eb6c22dc: suspend_stress.fail
Date: Thu, 14 Nov 2019 09:25:32 +0800
Message-ID: <20191114012532.GA14190@ming.t460p>
In-Reply-To: <cb814a0c-c636-e9f4-654a-3f21bd0db646@acm.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============2187303856890932542==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2019 at 09:00:29AM -0800, Bart Van Assche wrote:
> On 11/4/19 10:11 PM, Ming Lei wrote:
> > On Mon, Nov 04, 2019 at 07:52:59PM -0800, Bart Van Assche wrote:
> > > On 2019-11-04 00:50, kernel test robot wrote:
> > > > FYI, we noticed the following commit (built with gcc-7):
> > > > =

> > > > commit: 74eb6c22dc70e395b333c9ca579855cd88db8845 ("[RFC PATCH V3 2/=
2] scsi: core: don't limit per-LUN queue depth for SSD")
> > > > url: https://github.com/0day-ci/linux/commits/Ming-Lei/scsi-core-av=
oid-host-wide-host_busy-counter-for-scsi_mq/20191009-015827
> > > > base: https://git.kernel.org/cgit/linux/kernel/git/jejb/scsi.git fo=
r-next
> > > > =

> > > > in testcase: suspend_stress
> > > > with following parameters:
> > > > =

> > > > 	mode: freeze
> > > > 	iterations: 10
> > > =

> > > Hi Ming,
> > > =

> > > This is the second report by the build robot that this patch causes t=
he
> > > suspend_stress test to fail. I assume that that means that that test
> > > failure is not a coincidence. The previous report (Oct-22) is availab=
le
> > > at https://lore.kernel.org/linux-scsi/20191023003027.GD12647(a)shao2-=
debian/.
> > =

> > Yeah, it should be one real issue, and there are other issues too. I wi=
ll work
> > out a new version for addressing all.
> =

> Hi Ming,
> =

> Have you already made any progress? I'm asking because the v5.5 merge win=
dow
> is expected to open soon (this weekend).

Hi Bart,

I am busy on other things, and may not have time to look at this issue
for v5.5.

If you have idea for making the patch into mergeable, please go ahead.


thanks,
Ming

--===============2187303856890932542==--

