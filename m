Content-Type: multipart/mixed; boundary="===============1022028557950413513=="
MIME-Version: 1.0
From: Cong Wang <xiyou.wangcong@gmail.com>
To: lkp@lists.01.org
Subject: Re: [cxgb4i] INFO: suspicious RCU usage. ]
Date: Fri, 01 Aug 2014 10:27:13 -0700
Message-ID: <CAM_iQpVz_UsFfyv2kjDbgt=KgSQHS8G6mEmjM63rvFnTFjDmoQ@mail.gmail.com>
In-Reply-To: <20140801123225.GA6728@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============1022028557950413513==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 1, 2014 at 5:32 AM, Fengguang Wu <fengguang.wu@intel.com> wro=
te:
> Hi Anish,
>
> FYI, here is one more bug message for
>
> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> commit 759a0cc5a3e1bc2cc48fa3c0b91bdcad8b8f87d6 ("cxgb4i: Add ipv6 code t=
o driver, call into libcxgbi ipv6 api")
>

I don't see the point of holding rcu read lock in cxgbi_inet6addr_handler(),
I think we can just remove it.

--===============1022028557950413513==--

