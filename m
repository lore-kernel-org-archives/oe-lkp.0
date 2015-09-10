Content-Type: multipart/mixed; boundary="===============4752142782671784168=="
MIME-Version: 1.0
From: Herbert Xu <herbert@gondor.apana.org.au>
To: lkp@lists.01.org
Subject: Re: [PATCH 2/3] rhashtable-test: retry insert operations in threads
Date: Thu, 10 Sep 2015 16:03:44 +0800
Message-ID: <20150910080344.GA28214@gondor.apana.org.au>
In-Reply-To: <20150901145124.GC11564@pox.localdomain>
List-Id: <oe-lkp.lists.linux.dev>

--===============4752142782671784168==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 01, 2015 at 04:51:24PM +0200, Thomas Graf wrote:
> =

> 1. The current in-kernel self-test
> 2. bind_netlink.c: https://github.com/tgraf/rhashtable

I can't reproduce it:

$ while :; do ./bind_netlink 10000 12345; done
Ports successfully created, terminating
Create 10000 ports
Created 1000 ports
Created 2000 ports
Created 3000 ports
Created 4000 ports
Created 5000 ports
Created 6000 ports
Created 7000 ports
Created 8000 ports
Created 9000 ports
Created 10000 ports
Ports successfully created, terminating
...

So what am I missing?

Thanks,
-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--===============4752142782671784168==--

