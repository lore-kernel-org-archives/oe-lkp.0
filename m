Content-Type: multipart/mixed; boundary="===============1986803739869628360=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@infradead.org>
To: lkp@lists.01.org
Subject: Re: [fs] BUG: unable to handle kernel NULL pointer dereference at 00000104
Date: Wed, 30 Jul 2014 04:14:20 -0700
Message-ID: <20140730111420.GA759@infradead.org>
In-Reply-To: <20140730041235.GJ16537@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============1986803739869628360==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2014 at 12:12:35PM +0800, Fengguang Wu wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is

Where is this coming from?  Bloating struct file for device specific
stuff really isn't acceptable anyway.


--===============1986803739869628360==--

