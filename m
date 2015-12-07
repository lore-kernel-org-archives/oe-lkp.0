Content-Type: multipart/mixed; boundary="===============0670515421920982035=="
MIME-Version: 1.0
From: David Miller <davem@davemloft.net>
To: lkp@lists.01.org
Subject: Re: rhashtable: Use __vmalloc with GFP_ATOMIC for table allocation
Date: Mon, 07 Dec 2015 14:29:53 -0500
Message-ID: <20151207.142953.387889541116696974.davem@davemloft.net>
In-Reply-To: <20151207153524.GA22032@pox.localdomain>
List-Id: <oe-lkp.lists.linux.dev>

--===============0670515421920982035==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Thomas Graf <tgraf@suug.ch>
Date: Mon, 7 Dec 2015 16:35:24 +0100

> Did you look into what __vmalloc prevents to work with BH disabled?

You can't issue the cross-cpu TLB flushes from atomic contexts.
It's the kernel page table updates that create the restriction.

--===============0670515421920982035==--

