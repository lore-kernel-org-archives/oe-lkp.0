Content-Type: multipart/mixed; boundary="===============0548174911664711794=="
MIME-Version: 1.0
From: Al Viro <viro@ZenIV.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [fs] 45ec18d5c7: BUG: KASAN: user-memory-access on address 00007f90291c7ec0
Date: Tue, 09 Aug 2016 02:27:56 +0100
Message-ID: <20160809012756.GO2356@ZenIV.linux.org.uk>
In-Reply-To: <20160809011758.GE8581@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============0548174911664711794==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 09, 2016 at 09:17:58AM +0800, Ye Xiaolong wrote:
> On 08/08, Valdis.Kletnieks(a)vt.edu wrote:
> >On Sun, 07 Aug 2016 22:02:42 +0800, kernel test robot said:
> >
> >> FYI, we noticed the following commit:
> >>
> >> https://github.com/0day-ci/linux
> >> Nicholas-Krause/fs-Fix-kmemleak-leak-warning-in-getname_flags-about-wo=
rking-on-unitialized-memory/20160804-055054
> >> commit 45ec18d5c713bccb9807782f0dca29b92ba99784 ("fs:Fix kmemleak leak=
 warning in getname_flags about working on unitialized memory")
> >
> >The real question here is why the 0day system was even bothering to try
> >compiling and booting a patch from somebody who has a long record of fai=
ling
> >to do so with patches before submission.  Actually looking at the patch
> >in question shows that little or no thought or testing was done (hint:
> >look at it, and wonder in amazement why there's a dump_stack() call where
> >it is....)
> >
> >In other words - how did this patch get into a tree that 0day listens to?
> =

> 0Day has a service to automatically capture every patchset sent to LKML, =
and convert
> email patchset to git branches by applying them on top of different
> trees heuristically.

*raised eyebrows*

I really hope they are doing both builds and testing in a heavily isolated
environments, then.  Because you've just described an attack vector it's
vulnerable to...

--===============0548174911664711794==--

