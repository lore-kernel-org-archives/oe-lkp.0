Content-Type: multipart/mixed; boundary="===============7504934264960209685=="
MIME-Version: 1.0
From: Matthew Wilcox <willy@infradead.org>
To: lkp@lists.01.org
Subject: Re: [xarray] b803b42823: BUG:soft_lockup-CPU##stuck_for#s
Date: Mon, 24 Dec 2018 05:01:30 -0800
Message-ID: <20181224130130.GM10600@bombadil.infradead.org>
In-Reply-To: <20181224125620.guph2apbk4snhirq@inn2.lkp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7504934264960209685==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 24, 2018 at 08:56:20PM +0800, kernel test robot wrote:
> [   51.886077] Call Trace:
> [   51.886077]  ? xas_find+0x11b/0x240
> [   51.886077]  ? xa_find+0xc2/0xe0
> [   51.886077]  ? check_find+0x11a/0x420
> [   51.886077]  ? check_multi_store+0xa40/0xa40
> [   51.886077]  ? xarray_checks+0x30/0x70
> [   51.886077]  ? do_one_initcall+0x68/0x253

Since you're running the selftests at 51 seconds in, I'm putting this
in the same bucket as the others -- spurious report due to overloaded
test machine.



--===============7504934264960209685==--

