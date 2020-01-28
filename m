Content-Type: multipart/mixed; boundary="===============2930880836880313368=="
MIME-Version: 1.0
From: Al Viro <viro@zeniv.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: e56b43b971 ("reimplement path_mountpoint() with less magic"): kernel BUG at fs/namei.c:676!
Date: Tue, 28 Jan 2020 13:25:50 +0000
Message-ID: <20200128132550.GS23230@ZenIV.linux.org.uk>
In-Reply-To: <831EE4E5E37DCC428EB295A351E662495237317A@shsmsx102.ccr.corp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2930880836880313368==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2020 at 01:09:01PM +0000, Li, Philip wrote:
> > Subject: Re: e56b43b971 ("reimplement path_mountpoint() with less magic=
"):
> > kernel BUG at fs/namei.c:676!
> > =

> > On Tue, Jan 28, 2020 at 04:14:09PM +0800, kernel test robot wrote:
> > > Greetings,
> > >
> > > 0day kernel testing robot got the below dmesg and the first bad commi=
t is
> > >
> > > https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git fixes
> > >
> > > commit e56b43b971a7c08762fceab330a52b7245041dbc
> > > Author:     Al Viro <viro@zeniv.linux.org.uk>
> > > AuthorDate: Fri Jan 10 17:17:19 2020 -0500
> > > Commit:     Al Viro <viro@zeniv.linux.org.uk>
> > > CommitDate: Fri Jan 10 17:43:05 2020 -0500
> > >
> > >     reimplement path_mountpoint() with less magic
> > =

> > *blink*
> > =

> > Which tree are you looking at?  The one you've mentioned has a version
> the testing was conducted on "fixed" branch, which has below commits
> =

> commit d0cb50185ae942b03c4327be322055d622dc79f6
> Author: Al Viro <viro@zeniv.linux.org.uk>
> Date:   Sun Jan 26 09:29:34 2020 -0500
> =

>     do_last(): fetch directory ->i_mode and ->i_uid before it's too late
> =

> commit 508c8772760d4ef9c1a044519b564710c3684fc5
> Author: Al Viro <viro@zeniv.linux.org.uk>
> Date:   Tue Jan 14 22:09:57 2020 -0500
> =

>     fix autofs regression caused by follow_managed() changes
> =

> commit c64cd6e34ea340adbb2a0a2f99cc884b96dcdca5
> Author: Al Viro <viro@zeniv.linux.org.uk>
> Date:   Fri Jan 10 17:17:19 2020 -0500
> =

>     reimplement path_mountpoint() with less magic
> =

> > of that commit with fix folded in, and had it there for nearly two week=
s -
> > replacement is
> thanks, this is a problem we will look into, why it reports out old commi=
t. =

> =

> > commit c64cd6e34ea340adbb2a0a2f99cc884b96dcdca5
> > Author:     Al Viro <viro@zeniv.linux.org.uk>
> > AuthorDate: Fri Jan 10 17:17:19 2020 -0500
> > Commit:     Al Viro <viro@zeniv.linux.org.uk>
> > CommitDate: Wed Jan 15 01:36:06 2020 -0500
> > =

> >     reimplement path_mountpoint() with less magic
> > =

> > Moreover, that fixed commit has been pulled into mainline since then, so
> Typically if the head of mainline works without the same issue, we should=
 not report it.
> Kindly ignore this report. We will also check the bisection detail to und=
erstand
> what can possibly be wrong here.

FWIW, there are 4 branches in vfs.git with names similar to that:
fixes       fixes-2     fixes-old   fixes1      =

The last two do not contain anything of that sort (#fixes-old is from May 2=
018
and #fixes1 - Nov 2019) and as for the rest...
; git show vfs/fixes^^|head -5
commit c64cd6e34ea340adbb2a0a2f99cc884b96dcdca5
Author: Al Viro <viro@zeniv.linux.org.uk>
Date:   Fri Jan 10 17:17:19 2020 -0500

    reimplement path_mountpoint() with less magic
; git show vfs/fixes-2^^^^|head -5
commit c64cd6e34ea340adbb2a0a2f99cc884b96dcdca5
Author: Al Viro <viro@zeniv.linux.org.uk>
Date:   Fri Jan 10 17:17:19 2020 -0500

    reimplement path_mountpoint() with less magic
;

IOW, both contain the replacement and had it there since Jan 15, when oops
had been reported (very shortly after linux-next had picked a broken
variant) and fixed...  So either it's started testing that tree two
weeks ago and hadn't caught anything until now, or you have a seriously
out-of-date mirror...

FWIW, oops is correctly bisected and absolutely recognizable - if you
check the diff between broken and fixed variants of that commit,
you'll see
-       if (!err)
+       if (!err && (nd->flags & LOOKUP_RCU))
                err =3D unlazy_walk(nd);
in path_mountpoint(), i.e. prevention of unlazy_walk() call in
non-RCU mode, which is precisely what the BUG_ON() in unlazy_walk()
is supposed to catch.  So the only question had been "where has
it managed to run into that version of commit?"  Well, should be
"where and when", I guess...
--===============2930880836880313368==--

