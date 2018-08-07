Content-Type: multipart/mixed; boundary="===============2136716754744753409=="
MIME-Version: 1.0
From: J. Bruce Fields <bfields@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [nfsd4] 517dc52baa: fsmark.files_per_sec 32.4% improvement
Date: Tue, 07 Aug 2018 10:16:25 -0400
Message-ID: <20180807141625.GA22937@parsley.fieldses.org>
In-Reply-To: <63c5dff1-ab1d-3caa-682e-c8b5ff7025d5@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2136716754744753409==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 07, 2018 at 01:02:16PM +0800, Rong Chen wrote:
> =

> =

> On 08/01/2018 07:46 PM, J. Bruce Fields wrote:
> > On Fri, Jul 27, 2018 at 08:22:25AM +0800, Ye Xiaolong wrote:
> > > On 07/16, Ye Xiaolong wrote:
> > > > On 07/04, Huang, Ying wrote:
> > > > > "J. Bruce Fields" <bfields@redhat.com> writes:
> > > > > =

> > > > > > Thanks!
> > > > > > =

> > > > > > On Wed, Jun 20, 2018 at 02:52:43PM +0800, kernel test robot wro=
te:
> > > > > > > FYI, we noticed a 32.4% improvement of fsmark.files_per_sec d=
ue to commit:
> > > > > > > =

> > > > > > > =

> > > > > > > commit: 517dc52baa2a508c82f68bbc7219b48169e6b29f ("nfsd4: sho=
rtern default lease period")
> > > > > > > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.=
git master
> > > > > > That doesn't make any sense....
> > > > > > =

> > > > > > OK, I think I see the problem:
> > > > > > =

> > > > > > > in testcase: fsmark
> > > > > > > on test machine: 48 threads Intel(R) Xeon(R) CPU E5-2697 v2 @=
 2.70GHz with 64G memory
> > > > > > > with following parameters:
> > > > > > > =

> > > > > > > 	iterations: 1x
> > > > > > > 	nr_threads: 1t
> > > > > > > 	disk: 1BRD_48G
> > > > > > > 	fs: f2fs
> > > > > > > 	fs2: nfsv4
> > > > > > > 	filesize: 4M
> > > > > > > 	test_size: 40G
> > > > > > > 	sync_method: fsyncBeforeClose
> > > > > > > 	cpufreq_governor: performance
> > > > > > > =

> > > > > > > test-description: The fsmark is a file system benchmark to te=
st synchronous write workloads, for example, mail servers workload.
> > > > > > > test-url: https://sourceforge.net/projects/fsmark/
> > > > > > > =

> > > > > > > =

> > > > > > > =

> > > > > > > Details are as below:
> > > > > > > -------------------------------------------------------------=
------------------------------------->
> > > > > > > =

> > > > > > > =

> > > > > > > To reproduce:
> > > > > > > =

> > > > > > >          git clone https://github.com/intel/lkp-tests.git
> > > > > > >          cd lkp-tests
> > > > > > >          bin/lkp install job.yaml  # job file is attached in =
this email
> > > > > > >          bin/lkp run     job.yaml
> > > > > > > =

> > > > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > > compiler/cpufreq_governor/disk/filesize/fs2/fs/iterations/kco=
nfig/nr_threads/rootfs/sync_method/tbox_group/test_size/testcase:
> > > > > > >    gcc-7/performance/1BRD_48G/4M/nfsv4/f2fs/1x/x86_64-rhel-7.=
2/1t/debian-x86_64-2016-08-31.cgz/fsyncBeforeClose/ivb44/40G/fsmark
> > > > > > > =

> > > > > > > commit:
> > > > > > >    c2993a1d7d ("nfsd4: extend reclaim period for reclaiming c=
lients")
> > > > > > >    517dc52baa ("nfsd4: shortern default lease period")
> > > > > > > =

> > > > > > > c2993a1d7d6687fd 517dc52baa2a508c82f68bbc72
> > > > > > > ---------------- --------------------------
> > > > > > >           %stddev     %change         %stddev
> > > > > > >               \          |                \
> > > > > > >       53.60           +32.4%      70.95        fsmark.files_p=
er_sec
> > > > > > >      191.89           -24.4%     145.16        fsmark.time.el=
apsed_time
> > > > > > >      191.89           -24.4%     145.16        fsmark.time.el=
apsed_time.max
> > > > > > So what happened is the test took about 45 seconds less.
> > > > > > =

> > > > > > I suspect you're starting the nfs server and then immediately r=
unning
> > > > > > this test.
> > > > > Yes.
> > > > > =

> > > > > > The problem is that if there's a grace period on startup, any o=
pen will
> > > > > > just hang until the grace period ends.
> > > > > > =

> > > > > > This patch changed the default grace period from 90 seconds to =
45, so
> > > > > > that would explain the change.
> > > > > > =

> > > > > > In my testing I usually
> > > > > > =

> > > > > > 	start the nfs server
> > > > > > 	on the client:
> > > > > > 		mount the server
> > > > > > 		touch a file
> > > > > > =

> > > > > > When the touch returns, I know any grace period has completed, =
and then
> > > > > > I can run any tests normally.
> > > > I've modified our test to touch a file before running the actual wo=
rkload, then
> > > > requeue tests for both commit 517dc52baa and its parent c2993a1d7d,=
 but the
> > > > result seems persistent which shows a ~30% improvement of fsmark.fi=
les_per_sec.
> > > > =

> > > Any suggestions?	=

> > You're sure you only start timing after the "touch" returns?
> The result is normal after retesting, thank you for helping us improve the
> test.

Great, thanks for following up.

--b.

--===============2136716754744753409==--

