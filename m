Content-Type: multipart/mixed; boundary="===============1144652741477455273=="
MIME-Version: 1.0
From: Florian Fainelli <f.fainelli@gmail.com>
To: lkp@lists.01.org
Subject: Re: [PATCH net] net: dsa: fix 'increment on 0' warning
Date: Fri, 24 Nov 2017 13:21:20 -0800
Message-ID: <64d9f179-7635-b51a-7688-9bd546e2059f@gmail.com>
In-Reply-To: <20171124163606.11212-1-vivien.didelot@savoirfairelinux.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1144652741477455273==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 11/24/2017 08:36 AM, Vivien Didelot wrote:
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

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Tested-by: Florian Fainelli <f.fainelli@gmail.com>

Thanks!
-- =

Florian

--===============1144652741477455273==--

