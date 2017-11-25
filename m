Content-Type: multipart/mixed; boundary="===============8500966209522603379=="
MIME-Version: 1.0
From: David Miller <davem@davemloft.net>
To: lkp@lists.01.org
Subject: Re: [PATCH net] net: dsa: fix 'increment on 0' warning
Date: Sun, 26 Nov 2017 04:24:15 +0900
Message-ID: <20171126.042415.1930556995301127898.davem@davemloft.net>
In-Reply-To: <20171124163606.11212-1-vivien.didelot@savoirfairelinux.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8500966209522603379==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Fri, 24 Nov 2017 11:36:06 -0500

> Setting the refcount to 0 when allocating a tree to match the number of
> switch devices it holds may cause an 'increment on 0; use-after-free',
> if CONFIG_REFCOUNT_FULL is enabled.
> =

> To fix this, do not decrement the refcount of a newly allocated tree,
> increment it when an already allocated tree is found, and decrement it
> after the probing of a switch, as done with the previous behavior.
> =

> At the same time, make dsa_tree_get and dsa_tree_put accept a NULL
> argument to simplify callers, and return the tree after incrementation,
> as most kref users like of_node_get and of_node_put do.
> =

> Fixes: 8e5bf9759a06 ("net: dsa: simplify tree reference counting")
> Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>

Applied, thanks Vivien.

--===============8500966209522603379==--

