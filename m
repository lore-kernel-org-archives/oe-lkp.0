Content-Type: multipart/mixed; boundary="===============1804280688312074318=="
MIME-Version: 1.0
From: Eric Dumazet <eric.dumazet@gmail.com>
To: lkp@lists.01.org
Subject: Re: [flow_dissector] 6a74fcf426f: RIP: 0010:[<ffffffff8177ffc9>] [<ffffffff8177ffc9>] __skb_flow_dissect+0x659/0x830
Date: Mon, 15 Jun 2015 11:18:31 -0700
Message-ID: <1434392311.27504.140.camel@edumazet-glaptop2.roam.corp.google.com>
In-Reply-To: <557E6CB2.5050909@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1804280688312074318==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 2015-06-15 at 14:12 +0800, Huang Ying wrote:
> FYI, we noticed the below changes on
> =

> git://flatbed.openfabrics.org/~amirv/linux.git for-upstream
> commit 6a74fcf426f51aaa569f0b973d10ac20468df238 ("flow_dissector: add sup=
port for dst, hop-by-hop and routing ext hdrs")

This was fixed by :

http://git.kernel.org/cgit/linux/kernel/git/davem/net-next.git/commit/?id=
=3D1e98a0f08abddde87f0f93237f10629ecb4880ef



--===============1804280688312074318==--

