Content-Type: multipart/mixed; boundary="===============5630300187405593803=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [fs] e1bbcd277a: xfstests.generic.633.fail
Date: Fri, 10 Jun 2022 10:59:52 +0800
Message-ID: <20220610025952.GB6844@xsang-OptiPlex-9020>
In-Reply-To: <20220609083945.c2ezz7ldvqofunpm@wittgenstein>
List-Id: <oe-lkp.lists.linux.dev>

--===============5630300187405593803==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hi, Christian,
 =

On Thu, Jun 09, 2022 at 10:39:45AM +0200, Christian Brauner wrote:
> =

> Since e1bbcd277a53 ("fs: hold writers when changing mount's idmapping")
> this behavior is expected and is explained in detail in the pull request
> that contained this patch.
> =

> Upstream xfstests has been updated in commit
> 781bb995a149 ("vfs/idmapped-mounts: remove invalid test")
> and would not fail.

Thanks for information! we would upgrade our xfstests.

> =

> Thanks!
> Christian
--===============5630300187405593803==--

