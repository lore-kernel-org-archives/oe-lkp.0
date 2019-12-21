Content-Type: multipart/mixed; boundary="===============7053428630612708013=="
MIME-Version: 1.0
From: Al Viro <viro@zeniv.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: b627d4975b ("fs_parse: get rid of ->enums"): WARNING: CPU: 0 PID: 0 at kernel/workqueue.c:2772 flush_workqueue
Date: Sat, 21 Dec 2019 23:33:48 +0000
Message-ID: <20191221233348.GM4203@ZenIV.linux.org.uk>
In-Reply-To: <5dfe9809.1GGeRwsj2rLAPLkE%lkp@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7053428630612708013==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 22, 2019 at 06:09:13AM +0800, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git untested.fs_=
parse
> =

> commit b627d4975bcc97ba468d0094ecf99961d7450db4
> Author:     Al Viro <viro@zeniv.linux.org.uk>
> AuthorDate: Fri Sep 6 22:12:08 2019 -0400
> Commit:     Al Viro <viro@zeniv.linux.org.uk>
> CommitDate: Tue Dec 17 14:17:53 2019 -0500
> =

>     fs_parse: get rid of ->enums
>     =

>     Don't do a single array; attach them to fsparam_enum() entry
>     instead.  And don't bother trying to embed the names into those -
>     it actually loses memory, with no real speedup worth mentioning.
>     =

>     Simplifies validation as well.
>     =

>     Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

Already fixed in
commit 91f2f56785ffe215e74ffdfb5ff5435ec5774810
Author:     Al Viro <viro@zeniv.linux.org.uk>
AuthorDate: Fri Sep 6 22:12:08 2019 -0400
Commit:     Al Viro <viro@zeniv.linux.org.uk>
CommitDate: Sat Dec 21 11:41:55 2019 -0500

    fs_parse: get rid of ->enums

--===============7053428630612708013==--

