Content-Type: multipart/mixed; boundary="===============1158956805174324396=="
MIME-Version: 1.0
From: Paul Moore <pmoore@redhat.com>
To: lkp@lists.01.org
Subject: Re: [fs] swapper/0: page allocation failure: order:0, mode:0x50
Date: Tue, 27 Jan 2015 11:13:16 -0500
Message-ID: <3589184.gcKqz6adq7@sifl>
In-Reply-To: <1422341985.24875.42.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1158956805174324396==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tuesday, January 27, 2015 02:59:45 PM Huang Ying wrote:
> FYI, we noticed the below changes on
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> commit 6aaca9bab6116a2b392e7a07b5ff209741bc248f ("fs: create proper filen=
ame
> objects using getname_kernel()")
> =

> There are new kernel message as follow, that may have relationship with y=
our
> patch.
> =

> [    4.798286] uvesafb: failed to execute /sbin/v86d
> [    4.799010] uvesafb: make sure that the v86d helper is installed and
> executable

Why are you applying this patch to 3.16?  It is currently in vfs#for-next a=
nd =

not marked for -stable?

Do you see the same problem when you test linux-next?  Although you may wan=
t =

to wait for today's linux-next release.

-- =

paul moore
security @ redhat


--===============1158956805174324396==--

