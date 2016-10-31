Content-Type: multipart/mixed; boundary="===============4549519726537859206=="
MIME-Version: 1.0
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: lkp@lists.01.org
Subject: Re: [f2fs] ec795418c4: fsmark.files_per_sec -36.3% regression
Date: Mon, 31 Oct 2016 10:42:09 -0700
Message-ID: <20161031174209.GA12400@jaegeuk>
In-Reply-To: <87bmy15hvy.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4549519726537859206==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 31, 2016 at 11:14:57AM +0800, Huang, Ying wrote:
> Hi, Kim,
> =

> Jaegeuk Kim <jaegeuk@kernel.org> writes:
> =

> > On Tue, Sep 27, 2016 at 08:50:02AM +0800, Huang, Ying wrote:
> >> Jaegeuk Kim <jaegeuk@kernel.org> writes:
> >> =

> >> > On Mon, Sep 26, 2016 at 02:26:06PM +0800, Huang, Ying wrote:
> >> >> Hi, Jaegeuk,
> >> >> =

> >> >> "Huang, Ying" <ying.huang@intel.com> writes:
> >> >> =

> >> >> > Jaegeuk Kim <jaegeuk@kernel.org> writes:
> >> >> >
> >> >> >> Hello,
> >> >> >>
> >> >> >> On Sat, Aug 27, 2016 at 10:13:34AM +0800, Fengguang Wu wrote:
> >> >> >>> Hi Jaegeuk,
> >> >> >>> =

> >> >> >>> > > >> > - [lkp] [f2fs] b93f771286: aim7.jobs-per-min -81.2% re=
gression
> >> >> >>> > > >> >
> >> >> >>> > > >> > The disk is 4 12G ram disk, and setup RAID0 on them vi=
a mdadm.  The
> >> >> >>> > > >> > steps for aim7 is,
> >> >> >>> > > >> >
> >> >> >>> > > >> > cat > workfile <<EOF
> >> >> >>> > > >> > FILESIZE: 1M
> >> >> >>> > > >> > POOLSIZE: 10M
> >> >> >>> > > >> > 10 sync_disk_rw
> >> >> >>> > > >> > EOF
> >> >> >>> > > >> >
> >> >> >>> > > >> > (
> >> >> >>> > > >> >     echo $HOSTNAME
> >> >> >>> > > >> >     echo sync_disk_rw
> >> >> >>> > > >> >
> >> >> >>> > > >> >     echo 1
> >> >> >>> > > >> >     echo 600
> >> >> >>> > > >> >     echo 2
> >> >> >>> > > >> >     echo 600
> >> >> >>> > > >> >     echo 1
> >> >> >>> > > >> > ) | ./multitask -t &
> >> >> >>> > > >>
> >> >> >>> > > >> Any update on these 2 regressions?  Is the information i=
s enough for you
> >> >> >>> > > >> to reproduce?
> >> >> >>> > > >
> >> >> >>> > > > Sorry, I've had no time to dig this due to business trave=
l now.
> >> >> >>> > > > I'll check that when back to US.
> >> >> >>> > > =

> >> >> >>> > > Any update?
> >> >> >>> > =

> >> >> >>> > Sorry, how can I get multitask binary?
> >> >> >>> =

> >> >> >>> It's part of aim7, which can be downloaded here:
> >> >> >>> =

> >> >> >>> http://nchc.dl.sourceforge.net/project/aimbench/aim-suite7/Init=
ial%20release/s7110.tar.Z
> >> >> >>
> >> >> >> Thank you for the codes.
> >> >> >>
> >> >> >> I've run this workload on the latest f2fs and compared performan=
ce having
> >> >> >> without the reported patch. (1TB nvme SSD, 16 cores, 16GB DRAM)
> >> >> >> Interestingly, I could find slight performance improvement rathe=
r than
> >> >> >> regression. :(
> >> >> >> Not sure how to reproduce this.
> >> >> >
> >> >> > I think the difference lies on disk used.  The ramdisk is used in=
 the
> >> >> > original test, but it appears that your memory is too small to se=
tup the
> >> >> > RAM disk for test.  So it may be impossible for you to reproduce =
the
> >> >> > test unless you can find more memory :)
> >> >> >
> >> >> > But we can help you to root cause the issue.  What additional dat=
a do
> >> >> > you want?  perf-profile data before and after the patch?
> >> >> =

> >> >> Any update to this regression?
> >> >
> >> > Sorry, no. But meanwhile, I've purchased more DRAMs. :)
> >> > Now I'm with 128GB DRAM. I can configure 64GB as pmem.
> >> > Is it worth to try the test again?
> >> =

> >> I think you are the decision maker for this.  You can judge whether the
> >> test is reasonable.  And we can adjust our test accordingly.
> >> =

> >> BTW: For this test, we use brd ram disk and raid to test.
> >
> > Okay, let me try this again.
> =

> Any update on this?

Still in my to-do list. Let you know, if I can get some info.

Thanks,

> =

> Best Regards,
> Huang, Ying

--===============4549519726537859206==--

