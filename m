Content-Type: multipart/mixed; boundary="===============8768054511731940466=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/lru] [confidence: ] dab70bdf66: BUG:sleeping_function_called_from_invalid_context_at_mm/filemap.c
Date: Mon, 18 Nov 2019 13:19:41 +0800
Message-ID: <20191118051940.GA14693@xsang-OptiPlex-9020>
In-Reply-To: <12d94aec-e0b8-f70f-0b01-de484eeb9286@linux.alibaba.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8768054511731940466==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2019 at 02:05:27PM +0800, Alex Shi wrote:
> hi Oliver,
> =

> Did you find this error happens on other situations?
> =


Hi Alex, sorry for late. for commit dab70bdf66 we double confirmed the issue
is reproducable in our system (with default gcc 7).
However, when we want to do more manual check, we found your repo was rebas=
ed,
right? there is no dab70bdf66 any longer, and we found a similar commit
63c496b29f, but not sure whether it's meaningful to test upon it. have you
rewritten the patch and do you have a commit want us to check? Thanks

> Thanks
> Alex
> =

> =E5=9C=A8 2019/11/11 =E4=B8=8B=E5=8D=887:38, Alex Shi =E5=86=99=E9=81=93:
> > Hi Oliver,
> > =

> > Thanks for report!
> > =

> > I have no gcc-7 version. so I tried the gcc 6.5 with your attached conf=
ig and there is nothing failed except no rootfs for my image.
> > =

> > Did you try the gcc 6 or other version for this issue?
> > =

> > And there is another boot failure on 80e0cd52a0? Is there are a bug on =
that?
> > =

> > Thanks!
> > Alex
> > =

> > =

> > =E5=9C=A8 2019/11/5 =E4=B8=8B=E5=8D=882:50, kernel test robot =E5=86=99=
=E9=81=93:
> >> FYI, we noticed the following commit (built with gcc-7):
> >>
> >> commit: dab70bdf6650e91a5ec88e1ade261c708620f4d0 ("mm/lru: only change=
 the lru_lock iff page's lruvec is different")
> >> https://github.com/alexshi/linux.git lru_lock
> >>
> >> in testcase: boot
> >>
> >> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp =
2 -m 8G
--===============8768054511731940466==--

