Content-Type: multipart/mixed; boundary="===============8422205941928276751=="
MIME-Version: 1.0
From: Thomas Graf <tgraf@suug.ch>
To: lkp@lists.01.org
Subject: Re: [PATCH 2/3] rhashtable-test: retry insert operations in threads
Date: Tue, 01 Sep 2015 16:51:24 +0200
Message-ID: <20150901145124.GC11564@pox.localdomain>
In-Reply-To: <20150901141639.GA13856@gondor.apana.org.au>
List-Id: <oe-lkp.lists.linux.dev>

--===============8422205941928276751==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 09/01/15 at 10:16pm, Herbert Xu wrote:
> On Tue, Sep 01, 2015 at 04:13:05PM +0200, Thomas Graf wrote:
> >
> > You can easily trigger this outside of the testsuite as well. Open
> > 10K Netlink sockets in a loop and the creation of the sockets will
> > fail way before memory pressure kicks in.
> =

> That means our implementation is buggy.  Do you have a test program?

1. The current in-kernel self-test
2. bind_netlink.c: https://github.com/tgraf/rhashtable

--===============8422205941928276751==--

