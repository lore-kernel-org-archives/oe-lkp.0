Content-Type: multipart/mixed; boundary="===============7831945264360659519=="
MIME-Version: 1.0
From: Christian Brauner <brauner@kernel.org>
To: lkp@lists.01.org
Subject: Re: [ovl] 30f9ef9479: BUG:kernel_NULL_pointer_dereference, address
Date: Wed, 13 Apr 2022 09:30:12 +0200
Message-ID: <20220413073012.qwtlopbcbbkffaby@wittgenstein>
In-Reply-To: <20220411090719.GA21954@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============7831945264360659519==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 11, 2022 at 05:07:19PM +0800, Oliver Sang wrote:
> hi, Christian,
> =

> On Thu, Apr 07, 2022 at 12:26:05PM +0200, Christian Brauner wrote:
> > On Thu, Apr 07, 2022 at 05:40:23PM +0800, kernel test robot wrote:
> > > =

> > > =

> > > Greeting,
> > > =

> > > FYI, we noticed the following commit (built with gcc-11):
> > > =

> > > commit: 30f9ef94795008e5146f69d2eb043922a512bf85 ("ovl: support idmap=
ped layers")
> > > https://github.com/ammarfaizi2/linux-block brauner/linux/fs.idmapped.=
overlayfs.v3
> > =

> > That's an old branch. :)
> > Anything that has a *.v<idx> appended is basically an old version in my
> > tree. The base branch is always the branch name without the *.v<idx>
> > suffix.
> =

> got it. so there is no need to test these *.v<idx> branches, whatever bui=
ld,
> boot or function, right? If so, we will disable it.

Yeah, I maintain *.v<idx> branches around. Each time I need to send a
new version of a patchset I do:

git checkout -b base.branch.v<idx> base.branch

and then continue working on

git checkout base.branch

for the new version. :)

I try to make sure to only push base.branch to git.kernel.org once I
know it builds fine. Before that I only push to other code-hosting
platforms. One of the reasons being that I try to avoid upsetting the
various build bots. :)
--===============7831945264360659519==--

