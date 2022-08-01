Content-Type: multipart/mixed; boundary="===============2586895994887740430=="
MIME-Version: 1.0
From: Christoph Lameter <cl@gentwo.de>
To: lkp@lists.01.org
Subject: Re: [mm/slub] 3616799128: BUG_kmalloc-#(Not_tainted):kmalloc_Redzone_overwritten
Date: Mon, 01 Aug 2022 10:13:04 +0200
Message-ID: <alpine.DEB.2.22.394.2208011011120.2493025@gentwo.de>
In-Reply-To: <YueFZm1JHDZOKVw/@feng-skl>
List-Id: <oe-lkp.lists.linux.dev>

--===============2586895994887740430==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 1 Aug 2022, Feng Tang wrote:

> > Or does it make sense to prohibit KASAN+SLUB_DEBUG combination? Does
> > SLUB_DEBUG add anything on top of KASAN?
>
> I did a quick glance, seems the KASAN will select SLUB_DEBUG in
> many cases, as shown in the lib/Kconfig.kasan:
>
> 	config KASAN_GENERIC
> 		...
> 		select SLUB_DEBUG if SLUB
>
> 	config KASAN_SW_TAGS
> 		...
> 		select SLUB_DEBUG if SLUB

SLUB_DEBUG is on by default on all distros. This just means that debugging
support is compiled in but not activated. Kasan etc could depend on
SLUB_DEBUG. Without SLUB_DEBUG the debugging infrastructure of SLUB that
is use by Kasan is not included.

If you want to enable debugging on bootup then you need to set
SLUB_DEBUG_ON.


--===============2586895994887740430==--

