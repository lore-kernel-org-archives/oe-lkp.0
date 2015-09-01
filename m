Content-Type: multipart/mixed; boundary="===============6008783453563205210=="
MIME-Version: 1.0
From: Thomas Graf <tgraf@suug.ch>
To: lkp@lists.01.org
Subject: Re: [PATCH 2/3] rhashtable-test: retry insert operations in threads
Date: Tue, 01 Sep 2015 16:13:05 +0200
Message-ID: <20150901141305.GA11564@pox.localdomain>
In-Reply-To: <20150901140341.GA13757@gondor.apana.org.au>
List-Id: <oe-lkp.lists.linux.dev>

--===============6008783453563205210==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 09/01/15 at 10:03pm, Herbert Xu wrote:
> On Tue, Sep 01, 2015 at 03:56:18PM +0200, Phil Sutter wrote:
> > =

> > Looking at rhashtable_test.c, I see the initial table size is 8 entries.
> > 70% of that is 5.6 entries, so background expansion is started after the
> > 6th entry has been added, right? Given there are 10 threads running
> > which try to insert 50k entries at the same time, I don't think it's
> > unlikely that three more entries are inserted before the background
> > expansion completes.
> =

> Yes but in that case the GFP_ATOMIC allocation should work because
> the table is so small anyway.

You can easily trigger this outside of the testsuite as well. Open
10K Netlink sockets in a loop and the creation of the sockets will
fail way before memory pressure kicks in.

I agree with you that the user should never retry on memory failure.
That's why I suggested to differentiate between a "permanent" failure
(memory pressure) and non-permanent failure (temporary overload on
background expansion). Hence the proposed difference of return codes
ENOMEM and EBUSY to report this back to the API user.

--===============6008783453563205210==--

