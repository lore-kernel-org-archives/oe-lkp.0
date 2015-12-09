Content-Type: multipart/mixed; boundary="===============6939222000360770378=="
MIME-Version: 1.0
From: Thomas Graf <tgraf@suug.ch>
To: lkp@lists.01.org
Subject: Re: rhashtable: Use __vmalloc with GFP_ATOMIC for table allocation
Date: Wed, 09 Dec 2015 03:18:26 +0100
Message-ID: <20151209021826.GC19097@pox.localdomain>
In-Reply-To: <20151207.142953.387889541116696974.davem@davemloft.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============6939222000360770378==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On 12/05/15 at 03:06pm, Herbert Xu wrote:
> Unless we can make __vmalloc work with BH disabled, I guess we'll
> have to go back to multi-level lookups unless someone has a better
> suggestion.

Assuming that we only encounter this scenario with very large
table sizes, it might be OK to assume that deferring the actual
resize via the worker thread while continuing to insert above
100% utilization in atomic context is safe.

On 12/07/15 at 02:29pm, David Miller wrote:
> You can't issue the cross-cpu TLB flushes from atomic contexts.
> It's the kernel page table updates that create the restriction.

--===============6939222000360770378==--

