Content-Type: multipart/mixed; boundary="===============5423410257114185251=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [ovl] 30f9ef9479: BUG:kernel_NULL_pointer_dereference, address
Date: Mon, 11 Apr 2022 17:07:19 +0800
Message-ID: <20220411090719.GA21954@xsang-OptiPlex-9020>
In-Reply-To: <20220407102605.ipstobkadq34gmzg@wittgenstein>
List-Id: <oe-lkp.lists.linux.dev>

--===============5423410257114185251==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hi, Christian,

On Thu, Apr 07, 2022 at 12:26:05PM +0200, Christian Brauner wrote:
> On Thu, Apr 07, 2022 at 05:40:23PM +0800, kernel test robot wrote:
> > =

> > =

> > Greeting,
> > =

> > FYI, we noticed the following commit (built with gcc-11):
> > =

> > commit: 30f9ef94795008e5146f69d2eb043922a512bf85 ("ovl: support idmappe=
d layers")
> > https://github.com/ammarfaizi2/linux-block brauner/linux/fs.idmapped.ov=
erlayfs.v3
> =

> That's an old branch. :)
> Anything that has a *.v<idx> appended is basically an old version in my
> tree. The base branch is always the branch name without the *.v<idx>
> suffix.

got it. so there is no need to test these *.v<idx> branches, whatever build,
boot or function, right? If so, we will disable it.

> =

> Thanks!
> Christian
--===============5423410257114185251==--

