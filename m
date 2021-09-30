Content-Type: multipart/mixed; boundary="===============6984262914217261607=="
MIME-Version: 1.0
From: Greg KH <gregkh@linuxfoundation.org>
To: lkp@lists.01.org
Subject: Re: [driver core] eedc73d4f3: BUG:kernel_reboot-without-warning_in_boot_stage
Date: Thu, 30 Sep 2021 08:23:26 +0200
Message-ID: <YVVX3ir2DHg0FUxF@kroah.com>
In-Reply-To: <20210930055944.GA29843@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============6984262914217261607==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 30, 2021 at 01:59:44PM +0800, Oliver Sang wrote:
> Hi, Greg KH,
> =

> On Wed, Sep 29, 2021 at 05:13:55PM +0200, Greg KH wrote:
> > On Wed, Sep 29, 2021 at 11:02:40PM +0800, kernel test robot wrote:
> > > =

> > > =

> > > Greeting,
> > > =

> > > FYI, we noticed the following commit (built with gcc-9):
> > > =

> > > commit: eedc73d4f330cf7a8d18d64f327837ae9a00d003 ("[PATCH] driver cor=
e: Switch to using the new API kobj_to_dev()")
> > > url: https://github.com/0day-ci/linux/commits/Yang-Li/driver-core-Swi=
tch-to-using-the-new-API-kobj_to_dev/20210929-102216
> > > base: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git=
 5816b3e6577eaa676ceb00a848f0fd65fe2adc29
> > =

> > There is no such commit in my tree, or anywhere else I can see, so I
> > have no idea what is happening here :(
> > =

> =

> this report was sent to Yang Li, who is the patch author.
> https://lore.kernel.org/lkml/1614590004-69592-1-git-send-email-yang.lee(a=
)linux.alibaba.com/
> =

> since Yang sent the patch to you, so our Rot automatically add you in
> the Cc list.

That patch was sent back on March 1.  And was instantly rejected for the
obvious reason it was never tested :)

Why is 0-day running on such old changes now?

And it is not obvious that this is being run on an email submission at
all, where would I have found that information in this response?  I see
a git id that points to a kernel tree.  No email link at all.

thanks,

greg k-h
--===============6984262914217261607==--

