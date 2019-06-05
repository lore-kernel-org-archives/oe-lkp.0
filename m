Content-Type: multipart/mixed; boundary="===============0239089342668337995=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: lkp@lists.01.org
Subject: Re: livepatching selftests failure on current master branch
Date: Wed, 05 Jun 2019 22:31:17 +0800
Message-ID: <20190605143117.GC19267@intel.com>
In-Reply-To: <c3a528e2-40f1-5a3d-38d7-6acb188bbd88@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0239089342668337995==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 05, 2019 at 09:48:02AM -0400, Joe Lawrence wrote:
> On 5/17/19 10:17 AM, Miroslav Benes wrote:
> >Hi,
> >
> >I noticed that livepatching selftests fail on our master branch
> >(https://git.kernel.org/pub/scm/linux/kernel/git/livepatching/livepatchi=
ng.git/).
> >
> >...
> =

> [ adding lkp(a)01.org to this email ]
> =

> lkp folks, I was wondering if the kernel selftests were included as
> part of the test-bot and if so, do we need to do anything specific
yes, kernel selftest is part of regular execution, which includes the livep=
atching
test. Also the livepatching.git is under our testing. But we may not succes=
sfully
bisect all failures.

The mails related to livepatching test or livepatch  in last two months are

https://lists.01.org/pipermail/lkp/2019-April/010026.html
https://lists.01.org/pipermail/lkp/2019-May/010218.html

Thanks

> to include the livepatching selftests?
> =

> Thanks,
> =

> -- Joe
> _______________________________________________
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp

--===============0239089342668337995==--

