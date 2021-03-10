Content-Type: multipart/mixed; boundary="===============3918902624584909227=="
MIME-Version: 1.0
From: Christoph Lameter <cl@gentwo.de>
To: lkp@lists.01.org
Subject: Re: [mm, slub] 8ff60eb052: stress-ng.rawpkt.ops_per_sec -47.9% regression
Date: Wed, 10 Mar 2021 07:59:51 +0100
Message-ID: <alpine.DEB.2.22.394.2103100757530.128125@gentwo.de>
In-Reply-To: <CAHk-=wh+RFzJqa51aO2zgGFhgV7=WjTs82B2wFfCMEHPs4B49g@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3918902624584909227==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 9 Mar 2021, Linus Torvalds wrote:

> So when you wrote:
>
>     However, the current code accidentally stops looking at the partial l=
ist
>     completely in that case.  Especially on kernels without CONFIG_NUMA s=
et,
>     this means that get_partial() fails and new_slab_objects() falls back=
 to
>     new_slab(), allocating new pages.  This could lead to an unnecessary
>     increase in memory fragmentation.
>
> it really looks like this might well have been very intentional
> indeed. Or at least very beneficial for _some_ loads.
>
> Comments?

Yes the thought was that adding an additional page when contention is
there on the page objects will increase possible concurrency while
avoiding locks and increase the ability to allocate / free concurrently
from a multitude of objects.

--===============3918902624584909227==--

