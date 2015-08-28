Content-Type: multipart/mixed; boundary="===============3204278011995261615=="
MIME-Version: 1.0
From: Thomas Graf <tgraf@suug.ch>
To: lkp@lists.01.org
Subject: Re: [PATCH 2/3] rhashtable-test: retry insert operations in threads
Date: Sat, 29 Aug 2015 00:43:03 +0200
Message-ID: <20150828224303.GD32001@pox.localdomain>
In-Reply-To: <20150828133437.GM20760@orbit.nwl.cc>
List-Id: <oe-lkp.lists.linux.dev>

--===============3204278011995261615==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 08/28/15 at 03:34pm, Phil Sutter wrote:
> Quite ugly, IMHO: rhashtable_insert_fast() may return -ENOMEM as
> non-permanent error, if allocation in GFP_ATOMIC failed. In this case,
> allocation in GFP_KERNEL is retried by rht_deferred_worker(). Sadly,
> there is no way to determine if that has already been tried and failed.
> =

> The thread test triggers GFP_ATOMIC allocation failure quite easily, so
> I can't really just ignore this issue. :)

Return EBUSY or ENOBUFS in the non-permanent case? It is definitely
helpful if the API allows to differ between permanent and
non-permanent errors.

--===============3204278011995261615==--

