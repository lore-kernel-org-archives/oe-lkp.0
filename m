Content-Type: multipart/mixed; boundary="===============5925638047521366512=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] 486ad79630 [ 15.532543] BUG: unable to handle kernel NULL pointer dereference at 0000000000000004
Date: Wed, 02 May 2018 22:44:37 -0700
Message-ID: <20180502224437.18fe3ebb9e6955f321638f82@linux-foundation.org>
In-Reply-To: <CAM_iQpVDtrGCqd7NQ1vJXTuLMdz=GwbnN77vdkmY+PxtFmKHTw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5925638047521366512==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 2 May 2018 21:58:25 -0700 Cong Wang <xiyou.wangcong@gmail.com> wr=
ote:

> On Wed, May 2, 2018 at 9:27 PM, Andrew Morton <akpm@linux-foundation.or=
g> wrote:
> >
> > So it's saying that something which got committed into Linus's tree
> > after 4.17-rc3 has caused a NULL deref in
> > sock_release->llc_ui_release+0x3a/0xd0
> =

> Do you mean it contains commit 3a04ce7130a7
> ("llc: fix NULL pointer deref for SOCK_ZAPPED")?

That was in 4.17-rc3 so if this report's bisection is correct, that
patch is innocent.

origin.patch (http://ozlabs.org/~akpm/mmots/broken-out/origin.patch)
contains no changes to net/llc/af_llc.c so perhaps this crash is also
occurring in 4.17-rc3 base.

--===============5925638047521366512==--

