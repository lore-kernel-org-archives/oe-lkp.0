Content-Type: multipart/mixed; boundary="===============6940115260218162550=="
MIME-Version: 1.0
From: Thomas Graf <tgraf@suug.ch>
To: lkp@lists.01.org
Subject: Re: rhashtable: Use __vmalloc with GFP_ATOMIC for table allocation
Date: Wed, 09 Dec 2015 03:42:48 +0100
Message-ID: <20151209024248.GA20213@pox.localdomain>
In-Reply-To: <20151209023844.GA24736@gondor.apana.org.au>
List-Id: <oe-lkp.lists.linux.dev>

--===============6940115260218162550==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12/09/15 at 10:38am, Herbert Xu wrote:
> On Wed, Dec 09, 2015 at 03:36:32AM +0100, Thomas Graf wrote:
> > =

> > Without knowing your exact implementation plans: introducing an
> > additional reference indirection for every lookup will have a
> > huge performance penalty as well.
> > =

> > Is your plan to only introduce the master table after an
> > allocation has failed?
> =

> Right, obviously the extra indirections would only come into play
> after a failed allocation.  As soon as we can run the worker thread
> it'll try to remove the extra indirections by doing vmalloc.

OK, this sounds like a good compromise. The penalty is isolated
for the duration of the atomic burst.

--===============6940115260218162550==--

