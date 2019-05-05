Content-Type: multipart/mixed; boundary="===============0498936853148487056=="
MIME-Version: 1.0
From: Al Viro <viro@zeniv.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [PATCH] fsnotify: fix unlink performance regression
Date: Sun, 05 May 2019 14:05:29 +0100
Message-ID: <20190505130528.GA23075@ZenIV.linux.org.uk>
In-Reply-To: <20190505091549.1934-1-amir73il@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0498936853148487056==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, May 05, 2019 at 12:15:49PM +0300, Amir Goldstein wrote:
> __fsnotify_parent() has an optimization in place to avoid unneeded
> take_dentry_name_snapshot().  When fsnotify_nameremove() was changed
> not to call __fsnotify_parent(), we left out the optimization.
> Kernel test robot reported a 5% performance regression in concurrent
> unlink() workload.
> =

> Reported-by: kernel test robot <rong.a.chen@intel.com>
> Link: https://lore.kernel.org/lkml/20190505062153.GG29809(a)shao2-debian/
> Link: https://lore.kernel.org/linux-fsdevel/20190104090357.GD22409(a)quac=
k2.suse.cz/
> Fixes: 5f02a8776384 ("fsnotify: annotate directory entry modification eve=
nts")
> Signed-off-by: Amir Goldstein <amir73il@gmail.com>
> ---
> =

> Jan,
> =

> The linked 5.1-rc1 performance regression report came with bad timing.
> Not sure if Linus is planning an rc8. If not, you will probably not
> see this before the 5.1 release and we shall have to queue it for 5.2
> and backport to stable 5.1.
> =

> I crafted the patch so it applies cleanly both to master and Al's
> for-next branch (there are some fsnotify changes in work.dcache).

Charming...  What about rename() and matching regressions there?

--===============0498936853148487056==--

