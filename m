Content-Type: multipart/mixed; boundary="===============5406044049875237222=="
MIME-Version: 1.0
From: Luis Chamberlain <mcgrof@kernel.org>
To: lkp@lists.01.org
Subject: Re: [ocfs2] c42ff46f97: sysctl_table_check_failed
Date: Tue, 01 Feb 2022 18:39:23 -0800
Message-ID: <Yfnu216aFQibbZ25@bombadil.infradead.org>
In-Reply-To: <CAHk-=wjzWVW1xvVLCOvw-MMoVK9kiRn5CUx2am8jPdo09mHgjA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5406044049875237222==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 28, 2022 at 07:16:21PM +0200, Linus Torvalds wrote:
> On Fri, Jan 28, 2022 at 6:49 PM Eric W. Biederman <ebiederm@xmission.co=
m> wrote:
> >
> > Yes.  There is a register_sysctl_paths that can be used if you want/need
> > the embedded directories.  That probably would have been a better
> > choice for an automated conversion.
> >
> > But since this there is only the single file in a single directory
> > register_sysctl() with the full path is perfectly fine in this case.
> >
> > Reviewed-by: "Eric W. Biederman" <ebiederm@xmission.com>
> =

> I was doing filesystem pull requests anyway, and as a result (I tend
> to group things by topic if there's multiple things pending) I already
> committed that patch of mine based on Jan's reviewed/tested-by, so
> this reviewed-by ended up not in the tree.
> =

> But maybe somebody should check the other automated conversions for
> the same issue? Hint hint.

I just double checked and indeed, the issue was that ocfs had a path
underneath it, so indeed register_sysctl_paths() would have been better.
The other drivers which were converted do not have paths underneath so
they are safe.

> Also, I'm somewhat unhappy about the fact that apparently the kernel
> test robot already found this issue back in November of last year, yet
> it made it to mainline several months later without being fixed.
> =

> It's hard to tell from this link:
> =

>   https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org/thread/KQ2F6TPJ=
WMDVEXJM4WTUC4DU3EH3YJVT/
> =

> but it does look like that original report only made it to that lkp
> list and not the actual people listed on the commit itself? That would
> explain why the report was overlooked.

Odd, no I got Cc'd on the email as I get 0day testing on all my branches
prior to pushing patches out. For some reason this failure fell through
the cracks. Sorry about that!

  Luis
--===============5406044049875237222==--

