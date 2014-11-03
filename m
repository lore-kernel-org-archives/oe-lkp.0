Content-Type: multipart/mixed; boundary="===============7871671053160026582=="
MIME-Version: 1.0
From: Al Viro <viro@ZenIV.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [vfs] WARNING: CPU: 0 PID: 3 at fs/dcache.c:255 __d_free()
Date: Mon, 03 Nov 2014 07:17:11 +0000
Message-ID: <20141103071711.GZ7996@ZenIV.linux.org.uk>
In-Reply-To: <20141103070142.GB1189@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7871671053160026582==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 03, 2014 at 03:01:42PM +0800, Fengguang Wu wrote:
> Hi Al,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git for-next
> =

> commit ff1995cbc0eb7c4beeca313a150111e3e3622e2c
> Author:     Al Viro <viro@zeniv.linux.org.uk>
> AuthorDate: Sun Oct 26 19:19:16 2014 -0400
> Commit:     Al Viro <viro@zeniv.linux.org.uk>
> CommitDate: Fri Oct 31 13:04:16 2014 -0400
> =


Right, but the warning is a false positive - both of these WARN_ON should
be moved to dentry_free() (both the __d_free() and __d_free_external() ones,
that is).  Will fix and push tomorrow morning...

--===============7871671053160026582==--

