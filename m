Content-Type: multipart/mixed; boundary="===============7225854393549019597=="
MIME-Version: 1.0
From: David Miller <davem@davemloft.net>
To: lkp@lists.01.org
Subject: Re: [PATCH net-next] rhashtable: Lower/upper bucket may map to same lock while shrinking
Date: Tue, 13 Jan 2015 00:25:39 -0500
Message-ID: <20150113.002539.865888654705925013.davem@davemloft.net>
In-Reply-To: <20150112235821.GB16617@casper.infradead.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============7225854393549019597==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Thomas Graf <tgraf@suug.ch>
Date: Mon, 12 Jan 2015 23:58:21 +0000

> Each per bucket lock covers a configurable number of buckets. While
> shrinking, two buckets in the old table contain entries for a single
> bucket in the new table. We need to lock down both while linking.
> Check if they are protected by different locks to avoid a recursive
> lock.
> =

> Fixes: 97defe1e ("rhashtable: Per bucket locks & deferred expansion/shrin=
king")
> Reported-by: Fengguang Wu <fengguang.wu@intel.com>
> Signed-off-by: Thomas Graf <tgraf@suug.ch>

Applied.

--===============7225854393549019597==--

