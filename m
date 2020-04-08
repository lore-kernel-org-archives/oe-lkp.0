Content-Type: multipart/mixed; boundary="===============8601327188251688317=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: lkp@lists.01.org
Subject: Re: Linux distro used for lkp test
Date: Wed, 08 Apr 2020 13:35:07 +0800
Message-ID: <20200408053506.GA30359@intel.com>
In-Reply-To: <CANmdEh05innChK5rURZgaGZy5fxEpB72qHkMP-U1+bit8c1Dzw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8601327188251688317==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 08, 2020 at 10:15:39AM +0530, Deepa B wrote:
> Hello,
> Can you let us know which platform(precisely linux distro) is  used to
> run LKP tests?
we use debian 10 based distro as regular testing, some pkg can
be found at https://download.01.org/0day-ci/lkp-qemu/osimage/debian/.

> =

> On Ubuntu 16.04 lts, there are some regressions for kernel validation
> (LTP, kselftests). Want to achieve 100% pass for them.
right, it can be environment problem like lacking of packages, we welcome
any pull request to make the support of other os better. Or you can
submit issue to https://github.com/intel/lkp-tests.

> =

> Thanks,
> Deepa
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org
--===============8601327188251688317==--

