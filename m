Content-Type: multipart/mixed; boundary="===============8940561787838229805=="
MIME-Version: 1.0
From: Al Viro <viro@zeniv.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: c25aa432ff: aim9.dir_rtns_1.ops_per_sec -24.5% regression
Date: Wed, 18 Sep 2019 02:23:00 +0100
Message-ID: <20190918012300.GI1131@ZenIV.linux.org.uk>
In-Reply-To: <20190918001736.GK15734@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============8940561787838229805==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 18, 2019 at 08:17:36AM +0800, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed a -24.5% regression of aim9.dir_rtns_1.ops_per_sec due to=
 commit:
> =

> =

> commit: c25aa432ff56e179bf5414edff3aa430d2b260c0 ("Fix the locking in dca=
che_readdir() and friends")
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.=
git master

... and that, folks, is ->d_lock on the parent.  I.e. the original reason f=
or
trying to do the damn thing lockless.

I'd really like to do a lockless variant, properly.  First we'd need to sort
the misuses of d_subdirs/d_child, though - there are several outright bugs
in the mainline.  And right now it looks like it wants to grow a series of
cleanups in autofs.  Oh, well...

--===============8940561787838229805==--

