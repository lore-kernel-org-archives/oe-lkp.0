Content-Type: multipart/mixed; boundary="===============3026024559904350205=="
MIME-Version: 1.0
From: Thomas Graf <tgraf@suug.ch>
To: lkp@lists.01.org
Subject: Re: rhashtable: Use __vmalloc with GFP_ATOMIC for table allocation
Date: Mon, 07 Dec 2015 16:35:24 +0100
Message-ID: <20151207153524.GA22032@pox.localdomain>
In-Reply-To: <20151205070603.GB23255@gondor.apana.org.au>
List-Id: <oe-lkp.lists.linux.dev>

--===============3026024559904350205==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12/05/15 at 03:06pm, Herbert Xu wrote:
> On Fri, Dec 04, 2015 at 07:15:55PM +0100, Phil Sutter wrote:
> >
> > > Only one should really do this, while others are waiting.
> > =

> > Sure, that was my previous understanding of how this thing works.
> =

> Yes that's clearly how it should be.  Unfortunately while adding
> the locking to do this, I found out that you can't actually call
> __vmalloc with BH disabled so this is a no-go.
> =

> Unless we can make __vmalloc work with BH disabled, I guess we'll
> have to go back to multi-level lookups unless someone has a better
> suggestion.

Thanks for fixing the race.

As for the remaining problem, I think we'll have to find a way to
serve a hard pounding user if we want to convert TCP hashtables
later on.

Did you look into what __vmalloc prevents to work with BH disabled?

--===============3026024559904350205==--

