Content-Type: multipart/mixed; boundary="===============4854809680729442380=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [PATCH 1/1] slob: Only use list functions when safe to do so
Date: Mon, 01 Apr 2019 21:41:28 -0700
Message-ID: <20190401214128.c671d1126b14745a43937969@linux-foundation.org>
In-Reply-To: <20190402032957.26249-2-tobin@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============4854809680729442380==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue,  2 Apr 2019 14:29:57 +1100 "Tobin C. Harding" <tobin@kernel.org> =
wrote:

> Currently we call (indirectly) list_del() then we manually try to combat
> the fact that the list may be in an undefined state by getting 'prev'
> and 'next' pointers in a somewhat contrived manner.  It is hard to
> verify that this works for all initial states of the list.  Clearly the
> author (me) got it wrong the first time because the 0day kernel testing
> robot managed to crash the kernel thanks to this code.
> =

> All this is done in order to do an optimisation aimed at preventing
> fragmentation at the start of a slab.  We can just skip this
> optimisation any time the list is put into an undefined state since this
> only occurs when an allocation completely fills the slab and in this
> case the optimisation is unnecessary since we have not fragmented the slab
> by this allocation.
> =

> Change the page pointer passed to slob_alloc_page() to be a double
> pointer so that we can set it to NULL to indicate that the page was
> removed from the list.  Skip the optimisation if the page was removed.
> =

> Found thanks to the kernel test robot, email subject:
> =

> 	340d3d6178 ("mm/slob.c: respect list_head abstraction layer"):  kernel B=
UG at lib/list_debug.c:31!
> =


It's regrettable that this fixes
slob-respect-list_head-abstraction-layer.patch but doesn't apply to
that patch - slob-use-slab_list-instead-of-lru.patch gets in the way. =

So we end up with a patch series which introduces a bug and later
fixes it.

I guess we can live with that but if the need comes to respin this
series, please do simply fix
slob-respect-list_head-abstraction-layer.patch so we get a clean
series.


--===============4854809680729442380==--

