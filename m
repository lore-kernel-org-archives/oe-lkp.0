Content-Type: multipart/mixed; boundary="===============8636975633499592437=="
MIME-Version: 1.0
From: Eryu Guan <guaneryu@gmail.com>
To: lkp@lists.01.org
Subject: Re: [fs] 6141b4d642: xfstests.generic.079.fail
Date: Tue, 09 Aug 2016 23:39:29 +0800
Message-ID: <20160809153929.GA2462@eguan.usersys.redhat.com>
In-Reply-To: <20160809151438.GG11220@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============8636975633499592437==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 09, 2016 at 11:14:38PM +0800, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git for-linus
> commit 6141b4d64295ec08a1b48c7fcac8a566658cd64f ("fs: return EPERM on imm=
utable inode")
> =

> in testcase: xfstests
> with following parameters:
> =

> 	disk: 4HDD
> 	fs: btrfs
> 	test: generic-quick1
> =

> =

> on test machine: 4 threads Sandy Bridge with 6G memory
> =

> caused below changes:

I think generic/079 needs update, because the expected errno was changed
after this commit. I've sent a patch to fstests(a)vger.kernel.org.

Thanks,
Eryu

--===============8636975633499592437==--

