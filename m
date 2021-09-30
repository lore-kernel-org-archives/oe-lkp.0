Content-Type: multipart/mixed; boundary="===============8788876565163782263=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: lkp@lists.01.org
Subject: Re: [driver core] eedc73d4f3: BUG:kernel_reboot-without-warning_in_boot_stage
Date: Thu, 30 Sep 2021 16:05:23 +0800
Message-ID: <YVVtnrEn4wg7QVGs@rli9-dbox>
In-Reply-To: <YVVX3ir2DHg0FUxF@kroah.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8788876565163782263==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 30, 2021 at 08:23:26AM +0200, Greg KH wrote:
> On Thu, Sep 30, 2021 at 01:59:44PM +0800, Oliver Sang wrote:
> > Hi, Greg KH,
> > =

> > On Wed, Sep 29, 2021 at 05:13:55PM +0200, Greg KH wrote:
> > > On Wed, Sep 29, 2021 at 11:02:40PM +0800, kernel test robot wrote:
> > > > =

> > > > =

> > > > Greeting,
> > > > =

> > > > FYI, we noticed the following commit (built with gcc-9):
> > > > =

> > > > commit: eedc73d4f330cf7a8d18d64f327837ae9a00d003 ("[PATCH] driver c=
ore: Switch to using the new API kobj_to_dev()")
> > > > url: https://github.com/0day-ci/linux/commits/Yang-Li/driver-core-S=
witch-to-using-the-new-API-kobj_to_dev/20210929-102216
> > > > base: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.g=
it 5816b3e6577eaa676ceb00a848f0fd65fe2adc29
> > > =

> > > There is no such commit in my tree, or anywhere else I can see, so I
> > > have no idea what is happening here :(
> > > =

> > =

> > this report was sent to Yang Li, who is the patch author.
> > https://lore.kernel.org/lkml/1614590004-69592-1-git-send-email-yang.lee=
(a)linux.alibaba.com/
> > =

> > since Yang sent the patch to you, so our Rot automatically add you in
> > the Cc list.
> =

> That patch was sent back on March 1.  And was instantly rejected for the
> obvious reason it was never tested :)
> =

> Why is 0-day running on such old changes now?
sorry about this Greg, that we have a storage crash in last 5 days, and
the data seems not consistent after we recovered that old patches are
re-scanned to be tested. We will manually check the existing data to
avoid test old ones.

> =

> And it is not obvious that this is being run on an email submission at
> all, where would I have found that information in this response?  I see
> a git id that points to a kernel tree.  No email link at all.
We will improve this in our report to point out the original patch mail
link whenever possible. Currently we show the git to provide the branch
that we apply such mail patch for author to reproduce. But definitely,
it is clearer to show explicitly that this is test against the mail patch.

> =

> thanks,
> =

> greg k-h
--===============8788876565163782263==--

