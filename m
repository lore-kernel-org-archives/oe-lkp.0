Content-Type: multipart/mixed; boundary="===============2727183218089217645=="
MIME-Version: 1.0
From: Shawn Guo <shawnguo@kernel.org>
To: lkp@lists.01.org
Subject: Re: [scatterlist] c38ecfb12e: kernel BUG at crypto/scatterwalk.c:37!
Date: Wed, 13 Apr 2016 10:38:50 +0800
Message-ID: <20160413023850.GF28903@tiger>
In-Reply-To: <20160413014202.GA659@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============2727183218089217645==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 13, 2016 at 09:42:02AM +0800, kernel test robot wrote:
> FYI, we noticed the below changes on
> =

> https://github.com/0day-ci/linux Shawn-Guo/scatterlist-use-sg_dma_len-in-=
sg_set_page/20160411-105225
> commit c38ecfb12e9a4c0c17d0879090741d6ce2a200de ("scatterlist: use sg_dma=
_len() in sg_set_page()")

Yes, the patch is wrong, and has been discarded.  The patch should
really be tagged with RFC from the beginning.  Thanks for reporting
anyway.

Shawn

--===============2727183218089217645==--

