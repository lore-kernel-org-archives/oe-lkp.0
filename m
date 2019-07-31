Content-Type: multipart/mixed; boundary="===============6707206897039441978=="
MIME-Version: 1.0
From: Matthew Wilcox <willy@infradead.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] mm: slub: Fix slab walking for init_on_free
Date: Wed, 31 Jul 2019 12:35:09 -0700
Message-ID: <20190731193509.GG4700@bombadil.infradead.org>
In-Reply-To: <20190731193240.29477-1-labbott@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6707206897039441978==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2019 at 03:32:40PM -0400, Laura Abbott wrote:
> Fix this by ensuring the value we set with set_freepointer is either NULL
> or another value in the chain.
> =

> Reported-by: kernel test robot <rong.a.chen@intel.com>
> Signed-off-by: Laura Abbott <labbott@redhat.com>

Fixes: 6471384af2a6 ("mm: security: introduce init_on_alloc=3D1 and init_on=
_free=3D1 boot options")


--===============6707206897039441978==--

