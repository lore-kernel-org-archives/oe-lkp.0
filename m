Content-Type: multipart/mixed; boundary="===============1993763283503762975=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: lkp@lists.01.org
Subject: Re: [xfs] a1df10d42b: xfstests.generic.31*.fail
Date: Tue, 11 Oct 2022 09:25:08 +0800
Message-ID: <Y0TF9DlJMFSESfrO@rli9-MOBL1.ccr.corp.intel.com>
In-Reply-To: <20221010205440.GV3600936@dread.disaster.area>
List-Id: <oe-lkp.lists.linux.dev>

--===============1993763283503762975==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 11, 2022 at 07:54:40AM +1100, Dave Chinner wrote:
> On Mon, Oct 10, 2022 at 08:32:41AM +0800, Philip Li wrote:
> > On Mon, Oct 10, 2022 at 11:07:40AM +1100, Dave Chinner wrote:
> > > On Sun, Oct 09, 2022 at 03:17:55PM +0800, Oliver Sang wrote:
> > > > Hi Dave,
> > > > =

> > > > On Thu, Oct 06, 2022 at 08:35:43AM +1100, Dave Chinner wrote:
> > > > > On Wed, Oct 05, 2022 at 09:45:12PM +0800, kernel test robot wrote:
> > > > > > =

> > > > > > Greeting,
> > > > > > =

> > > > > > FYI, we noticed the following commit (built with gcc-11):
> > > > > > =

> > > > > > commit: a1df10d42ba99c946f6a574d4d31951bc0a57e33 ("xfs: fix exc=
eption caused by unexpected illegal bestcount in leaf dir")
> > > > > > url: https://github.com/intel-lab-lkp/linux/commits/UPDATE-2022=
0929-162751/Guo-Xuenan/xfs-fix-uaf-when-leaf-dir-bestcount-not-match-with-d=
ir-data-blocks/20220831-195920
> > > > > > =

> [....]
> =

> > > commit a1df10d42ba99c946f6a574d4d31951bc0a57e33 *does not exist in
> > > the upstream xfs-dev tree*. The URL provided pointing to the commit
> > > above resolves to a "404 page not found" error, so I have not idea
> > > what code was even being tested here.
> > > =

> > > AFAICT, the patch being tested is this one (based on the github url
> > > matching the patch title:
> > > =

> > > https://lore.kernel.org/linux-xfs/20220831121639.3060527-1-guoxuenan(=
a)huawei.com/
> > > =

> > > Which I NACKed almost a whole month ago! The latest revision of the
> > > patch was posted 2 days ago here:
> > > =

> > > https://lore.kernel.org/linux-xfs/20221008033624.1237390-1-guoxuenan(=
a)huawei.com/
> > > =

> > > Intel kernel robot maintainers: I've just wasted the best part of 2
> > > hours trying to reproduce and track down a corruption bug that this
> > > report lead me to beleive was in the upstream XFS tree.
> > =

> > hi Dave, we are very sorry to waste your time on this report. It's our =
fault to not
> > make it clear that this is testing a review patch in mailing list. And =
we also
> > miss the NACKed information in your review, and send out this meaningle=
ss report.
> =

> The biggest issue was how it was presented.
> =

> Normally I see reports from the kernel robot for specific
> uncommitted patches like this as a threaded reply to the specific

We did a review for this case, this was our fault that the generated report
didn't reply with the right in-reply-to message id, thus it was not connect=
ed
to original patch. We need be careful to double check the report when sendi=
ng out.

Thread overview: 9+ messages / expand[flat|nested]  mbox.gz  Atom feed  top
2022-08-31 12:16 [PATCH v2] xfs: fix uaf when leaf dir bestcount not match =
with dir data blocks Guo Xuenan
2022-09-12  1:31 ` Dave Chinner [this message]
2022-09-14 16:30   ` Darrick J. Wong
2022-09-28 10:06   ` [PATCH v3] xfs: fix expection caused by unexpected ill=
egal bestcount in leaf dir Guo Xuenan
2022-09-29  8:51   ` [PATCH v4] xfs: fix exception " Guo Xuenan
2022-09-29 20:50     ` Darrick J. Wong
2022-10-07 11:33       ` Guo Xuenan
2022-10-07 16:30         ` Darrick J. Wong
2022-10-08  3:36           ` [PATCH v5] " Guo Xuenan

> patch that was identified as having a problem.  And normally this
> sort of standalone test failure report comes from a failure bisected
> to a commit already in an upstream tree. =

> =

> So my confusion here is largely because a bug in an uncommitted
> patch was reported in the same manner as an upstream regression
> would be reported - as a standalone bug report...

We also did a discussion internally, this is confusing with the same style
of report subject "$commit id: $issue", which is hard to distinguish. We
should update the subject to mention it is from mailing list, and add lore
link as you suggested below.

> =

> =

> > > You need to make it very clear that your bug report is for a commit
> > > that *hasn't been merged into an upstream tree*. The CI robot
> > > noticed a bug in an *old* NACKed patch, not a bug in a new upstream
> > > commit. Please make it *VERY CLEAR* where the code the CI robot is
> > > testing has come from.
> > =

> > We will correct our process ASAP to =

> > =

> > 1) make it clear, what is tested from, a review patch or a patch on ups=
tream tree
> =

> Yes, commit ID by itself is not sufficient to identify the issue,
> nor is a pointer to the CI tree the robot built. For a patch pulled
> from a list, it should not be reported as a "commit that failed".
> It should be reported as "uncommitted patch that failed", with:
> =

> - a lore link to the patch that was identified as having an issue;
> - a pointer to the base tree the patch(es) were applied to (e.g.
>   linus-v5.19-rc7, linux-next-2022-25-09, etc)
> - a pointer to the CI integration tree (that doesn't) the patch was
>   applied to and tested.

thanks a lot for the detail instructions, we will follow up all these to up=
date
the report information to make it clear for a review patch.

> =

> For an upstream commit that failed, reporting "<commit id> failed"
> is a good start, but it really needs to include the tree as the
> robot might be testing dev trees or linux-next rather than Linus's
> tree. i.e. report as "<tree, commit id> failed <test>".

Got it, we will do this, and to align the runtime report like our kbuild
report to add tree information.

> =

> > 2) do not send such report, if the patch has already been NACKed
> =

> That's not so much a problem. The real problem that needs solving is
> ensuring that the recipients of the bug report are able to quickly
> and obviously identify what was being tested when the issue was hit.

Got it, thanks for the advice, we will make above changes asap.

> =

> Cheers,
> =

> Dave.
> -- =

> Dave Chinner
> david(a)fromorbit.com
--===============1993763283503762975==--

