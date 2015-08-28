Content-Type: multipart/mixed; boundary="===============4208844210235121926=="
MIME-Version: 1.0
From: Thomas Graf <tgraf@suug.ch>
To: lkp@lists.01.org
Subject: Re: [PATCH 3/3] rhashtable-test: calculate max_entries value by default
Date: Fri, 28 Aug 2015 13:11:53 +0200
Message-ID: <20150828111153.GJ32206@pox.localdomain>
In-Reply-To: <1440757685-14241-3-git-send-email-phil@nwl.cc>
List-Id: <oe-lkp.lists.linux.dev>

--===============4208844210235121926==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 08/28/15 at 12:28pm, Phil Sutter wrote:
> A maximum table size of 64k entries is insufficient for the multiple
> threads test even in default configuration (10 threads * 50000 objects =
=3D
> 500000 objects in total). Since we know how many objects will be
> inserted, calculate the max size unless overridden by parameter.
> =

> Note that specifying the exact number of objects upon table init won't
> suffice as that value is being rounded down to the next power of two -
> anticipate this by rounding up to the next power of two in beforehand.
> =

> Signed-off-by: Phil Sutter <phil@nwl.cc>

Acked-by: Thomas Graf <tgraf@suug.ch>

Thanks for doing this work.

--===============4208844210235121926==--

