Content-Type: multipart/mixed; boundary="===============5326252423642130274=="
MIME-Version: 1.0
From: Al Viro <viro@ZenIV.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [memdup_user_nul] kernel BUG at mm/slab.c:2735!
Date: Tue, 29 Dec 2015 14:39:47 +0000
Message-ID: <20151229143946.GA9938@ZenIV.linux.org.uk>
In-Reply-To: <20151229123843.GA4678@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5326252423642130274==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 29, 2015 at 08:38:43PM +0800, Fengguang Wu wrote:
> Hi Al,
> =

> It looks this patch has various impacts. Here are some more bug messages.
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git work.misc
> =

> commit c7af9d5728bed29ef614324e67e066896d087c8f

The version in vfs.git has been ad8e00e50cbda2ce3831a4badc239ad014eec69 for
a couple of days already...

--===============5326252423642130274==--

