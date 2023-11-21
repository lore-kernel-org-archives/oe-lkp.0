Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209B548790
	for <oe-lkp@lists.linux.dev>; Tue, 21 Nov 2023 11:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Yr0XQ7qT"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20231121113102euoutp02ae70c66fa91d704b47e19b9f4caf0750~ZoAF0Wo6B2965229652euoutp022;
	Tue, 21 Nov 2023 11:31:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20231121113102euoutp02ae70c66fa91d704b47e19b9f4caf0750~ZoAF0Wo6B2965229652euoutp022
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1700566262;
	bh=hhMV9+ZiYY2Qo3CgOa3iJmKWXHnHJs/R2T8xdXc3pdE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=Yr0XQ7qTTRQ6wJoDv1ytDJRw+XmMp8nUVB2mjh7KAYL6RI811Avktdxw0raL8P64K
	 JVF3pzXp9onDa2AUgng4gmjtMNR8J7K4JLl9+suK8dLTZpzXBI4sVpfqIyMbwFfnrP
	 0+MF92Hha8iBEU4MAL3xix9MjmT6xmuQ1f8ECk0E=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20231121113102eucas1p1082ab4a1846075bf000a49b321248384~ZoAFpLBzC0737607376eucas1p1P;
	Tue, 21 Nov 2023 11:31:02 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id F7.0C.09552.5F49C556; Tue, 21
	Nov 2023 11:31:02 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20231121113101eucas1p1d34b3fd7580bae40de4e2bc1920260dc~ZoAFEab811094410944eucas1p1C;
	Tue, 21 Nov 2023 11:31:01 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20231121113101eusmtrp1fa520971da1370dd0e07181a5b6c9c9a~ZoAFD3VvZ0366903669eusmtrp1U;
	Tue, 21 Nov 2023 11:31:01 +0000 (GMT)
X-AuditID: cbfec7f5-83dff70000002550-3d-655c94f5b591
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 72.BF.09274.5F49C556; Tue, 21
	Nov 2023 11:31:01 +0000 (GMT)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20231121113101eusmtip1598c368d3581365f053624b4dc352512~ZoAE6J96w0916609166eusmtip1h;
	Tue, 21 Nov 2023 11:31:01 +0000 (GMT)
Received: from localhost (106.210.248.67) by CAMSVWEXC02.scsc.local
	(2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
	Tue, 21 Nov 2023 11:31:00 +0000
Date: Tue, 21 Nov 2023 12:30:59 +0100
From: Joel Granados <j.granados@samsung.com>
To: kernel test robot <oliver.sang@intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>
Subject: Re: [joelgranados:jag/sysctl_remove_empty_elem_kernel] [scheduler]
 423f75083a: BUG:KASAN:global-out-of-bounds_in_insert_header
Message-ID: <20231121113059.npwf2l5kkwrk2wgg@localhost>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="gbbdt36qqhqnq6s3"
Content-Disposition: inline
In-Reply-To: <202311201431.57aae8f3-oliver.sang@intel.com>
X-Originating-IP: [106.210.248.67]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
	CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFKsWRmVeSWpSXmKPExsWy7djP87rfpsSkGtycwGXxqvkRm8W1jdYW
	Cz79ZXFg9li85yWTx4vNMxkDmKK4bFJSczLLUov07RK4Mrb+OcdWsMamYvqzaUwNjN3GXYyc
	HBICJhJXuxcwg9hCAisYJbonO0DYXxgl/m3z7GLkArI/M0q8m/CKCaZh+bTvzBCJ5YwSkzfe
	ZoKr2r5qITuEs4VR4sO9RYwgLSwCqhITGyeAtbMJ6Eicf3MHbJ+IgK7Es7uPWUBsZiD73oy1
	jCDNwgKdjBIf37eCFfEKmEucnbecEcIWlDg58wlUQ4XEjBv/gWo4gGxpieX/OEDCnAJWEgcv
	97JAnKoksejAOkYIu1bi1JZbYJdKCDzgkJj9cC1UwkXixdy9zBC2sMSr41vYIWwZidOTe1gg
	GiYzSuz/94EdwlnNKLGs8Ss0NKwlWq48YQe5QkLAUWLjqVgIk0/ixltBiDv5JCZtm84MEeaV
	6GgTgmhUk1h97w3LBEblWUg+m4Xks1kIn0GEdSQW7P7EhiGsLbFs4WtmCNtWYt269ywLGNlX
	MYqnlhbnpqcWG+ellusVJ+YWl+al6yXn525iBCah0/+Of93BuOLVR71DjEwcjIcYVYCaH21Y
	fYFRiiUvPy9VSYR3C3tMqhBvSmJlVWpRfnxRaU5q8SFGaQ4WJXFe1RT5VCGB9MSS1OzU1ILU
	IpgsEwenVAOTXcSh/ef40mvW5Up4bPQ41Mw0+wunF+uc/m2SnfrzHLtvVh1a92Prjv5OL4mZ
	HFHRoTcdDtz4XOfH6l9RtZ1x51k5i2VH9dIPdVV/mTwtc/ucrlfCqx2yzUyTORubWBUmipdM
	a5mrFLPJNlqDffbLgP8LPBl1XgQXmcn4OXrddlzs4ZWRu9Nc9p3OF9XQFz+1GD68Djlw5sZt
	q4Yjtx8ad6Zqsyd/bJ4T7HEsuYdRfvLGCrlzudurJl8zM9PgL3968SnHYaWNXIKGbnOWiBy5
	dMa3SEw8/NvJTXPtIgpW/Dn80nximkGpw8W4eW3bhVnWrv3mvGCxysv5t6W4n/hIfF3k/Tyr
	aPqPn7M/+v1XYinOSDTUYi4qTgQATp76IL0DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRmVeSWpSXmKPExsVy+t/xu7pfp8SkGmxao2jxqvkRm8W1jdYW
	Cz79ZXFg9li85yWTx4vNMxkDmKL0bIryS0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1jrYxM
	lfTtbFJSczLLUov07RL0Mu7ue8BUsMqmYlHTH6YGxk7jLkZODgkBE4nl074zdzFycQgJLGWU
	uPqqnxEiISOx8ctVVghbWOLPtS42iKKPjBJbLpxmgnC2MEo8vXafGaSKRUBVYmLjBCYQm01A
	R+L8mztgcREBXYlndx+zgNjMQPa9GWsZQZqFBToZJT6+bwUr4hUwlzg7bznYaiGBXkaJeV/8
	IOKCEidnPoFqLpN423ESqIYDyJaWWP6PAyTMKWAlcfByLwvEpUoSiw6sg/qgVuLz32eMExiF
	ZyGZNAvJpFkIkyDCWhI3/r1kwhDWlli28DUzhG0rsW7de5YFjOyrGEVSS4tz03OLjfSKE3OL
	S/PS9ZLzczcxAqNx27GfW3Ywrnz1Ue8QIxMH4yFGFaDORxtWX2CUYsnLz0tVEuHdwh6TKsSb
	klhZlVqUH19UmpNafIjRFBiKE5mlRJPzgWkiryTe0MzA1NDEzNLA1NLMWEmc17OgI1FIID2x
	JDU7NbUgtQimj4mDU6qBae9P7zl7be42vv21fLGDIJOlv/VPI78nd5Zfv/d4+4LHvqm33v0u
	O5Ux7/Ddm5Y3H3D4y+/T8vrhZTXX8lfAswUhCo9Ew3oE+rfcCGQIYmQUC+LLUlacsPJP3bXF
	t7a1vbpsfvHq7xcLpi9TMvR9Mf112rO/TXXtU3a3v9Q/Yef2qav5iYLAxJOtVWKZy1ls9nwX
	rBXLVOzWnr1uu9ixblNuU7N7qzNDjz5jfOaYP01w5TTFDbo8a6Y4djn+61XRVbRcFmNw/XN+
	rcjzylaN38aGMoqrLvy6ZZZSLtKpvspcNuZMT0Ou1Uyn7+mTTosYs3bWieVyzq8q1+EP443a
	kMjTYXx8xa+48nPLVU38lViKMxINtZiLihMB0wyjnlsDAAA=
X-CMS-MailID: 20231121113101eucas1p1d34b3fd7580bae40de4e2bc1920260dc
X-Msg-Generator: CA
X-RootMTR: 20231120064830eucas1p2f6c2f84c271f3abd926d365cc0448b5c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231120064830eucas1p2f6c2f84c271f3abd926d365cc0448b5c
References: <CGME20231120064830eucas1p2f6c2f84c271f3abd926d365cc0448b5c@eucas1p2.samsung.com>
	<202311201431.57aae8f3-oliver.sang@intel.com>

--gbbdt36qqhqnq6s3
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

this is address in
https://lore.kernel.org/all/20231121-jag-fix_out_of_bounds_insert-v1-0-571e=
76d51316@samsung.com
Best

On Mon, Nov 20, 2023 at 02:48:14PM +0800, kernel test robot wrote:
>=20
>=20
> Hello,
>=20
> kernel test robot noticed "BUG:KASAN:global-out-of-bounds_in_insert_heade=
r" on:
>=20
> commit: 423f75083acd947804c8d5c31ad1e1b5fcb3c020 ("scheduler:  Remove the=
 now superfluous sentinel elements from ctl_table array")
> https://protect2.fireeye.com/v1/url?k=3Df16b7e8b-9010d41c-f16af5c4-74fe48=
60001d-9593d622a157bf33&q=3D1&e=3D8a7fa261-c965-4e86-9b45-a85e043a6025&u=3D=
https%3A%2F%2Fgithub.com%2FJoelgranados%2Flinux.git jag/sysctl_remove_empty=
_elem_kernel
>=20
> in testcase: boot
>=20
> compiler: gcc-9
> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 1=
6G
>=20
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>=20
>=20
> +---------------------------------------------------+------------+-------=
-----+
> |                                                   | 9bd138a89a | 423f75=
083a |
> +---------------------------------------------------+------------+-------=
-----+
> | BUG:KASAN:global-out-of-bounds_in_insert_header   | 0          | 14    =
     |
> +---------------------------------------------------+------------+-------=
-----+
>=20
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202311201431.57aae8f3-oliver.san=
g@intel.com
>=20
>=20
> [ 19.917748][ T1] BUG: KASAN: global-out-of-bounds in insert_header (fs/p=
roc/proc_sysctl.c:236)=20
> [   19.917748][    T1] Read of size 4 at addr ffffffff86ade6b8 by task sw=
apper/0/1
> [   19.917748][    T1]
> [   19.917748][    T1] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 6.6.0-rc=
2-00030-g423f75083acd #1 ed4fb2c8ca9b9b9984dcf540593bcadd356bb772
> [   19.917748][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 19=
96), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> [   19.917748][    T1] Call Trace:
> [   19.917748][    T1]  <TASK>
> [ 19.917748][ T1] dump_stack_lvl (lib/dump_stack.c:108)=20
> [ 19.917748][ T1] print_address_description+0x66/0x390=20
> [ 19.917748][ T1] ? insert_header (fs/proc/proc_sysctl.c:236)=20
> [ 19.917748][ T1] print_report (mm/kasan/report.c:476)=20
> [ 19.917748][ T1] ? kasan_addr_to_slab (mm/kasan/common.c:35)=20
> [ 19.917748][ T1] kasan_report (mm/kasan/report.c:590)=20
> [ 19.917748][ T1] ? insert_header (fs/proc/proc_sysctl.c:236)=20
> [ 19.917748][ T1] insert_header (fs/proc/proc_sysctl.c:236)=20
> [ 19.917748][ T1] ? do_raw_spin_lock (arch/x86/include/asm/atomic.h:115 i=
nclude/linux/atomic/atomic-arch-fallback.h:2155 include/linux/atomic/atomic=
-instrumented.h:1296 include/asm-generic/qspinlock.h:111 kernel/locking/spi=
nlock_debug.c:115)=20
> [ 19.917748][ T1] ? __kasan_kmalloc (mm/kasan/common.c:384)=20
> [ 19.917748][ T1] __register_sysctl_table (fs/proc/proc_sysctl.c:1395)=20
> [ 19.917748][ T1] ? mix_pool_bytes (drivers/char/random.c:918)=20
> [ 19.917748][ T1] __register_sysctl_init (fs/proc/proc_sysctl.c:1454)=20
> [ 19.917748][ T1] ? user_namespace_sysctl_init (kernel/sched/core.c:4717)=
=20
> [ 19.917748][ T1] sched_core_sysctl_init (kernel/sched/core.c:4720)=20
> [ 19.917748][ T1] do_one_initcall (init/main.c:1236)=20
> [ 19.917748][ T1] ? trace_event_raw_event_initcall_level (init/main.c:122=
7)=20
> [ 19.917748][ T1] ? parameq (kernel/params.c:171)=20
> [ 19.917748][ T1] ? _raw_spin_trylock_bh (include/linux/spinlock_api_smp.=
h:174 kernel/locking/spinlock.c:146)=20
> [ 19.917748][ T1] ? kasan_set_track (mm/kasan/common.c:52)=20
> [ 19.917748][ T1] ? __kasan_kmalloc (mm/kasan/common.c:384)=20
> [ 19.917748][ T1] kernel_init_freeable (init/main.c:1297 init/main.c:1314=
 init/main.c:1333 init/main.c:1551)=20
> [ 19.917748][ T1] ? rest_init (init/main.c:1433)=20
> [ 19.917748][ T1] kernel_init (init/main.c:1443)=20
> [ 19.917748][ T1] ? _raw_spin_unlock_irq (arch/x86/include/asm/irqflags.h=
:42 arch/x86/include/asm/irqflags.h:77 include/linux/spinlock_api_smp.h:159=
 kernel/locking/spinlock.c:202)=20
> [ 19.917748][ T1] ret_from_fork (arch/x86/kernel/process.c:153)=20
> [ 19.917748][ T1] ? rest_init (init/main.c:1433)=20
> [ 19.917748][ T1] ret_from_fork_asm (arch/x86/entry/entry_64.S:312)=20
> [   19.917748][    T1]  </TASK>
> [   19.917748][    T1]
> [   19.917748][    T1] The buggy address belongs to the variable:
> [ 19.917748][ T1] sched_core_sysctls+0x18/0x20=20
> [   19.917748][    T1]
> [   19.917748][    T1] The buggy address belongs to the physical page:
> [   19.917748][    T1] page:ffffea00001ab780 refcount:1 mapcount:0 mappin=
g:0000000000000000 index:0x0 pfn:0x6ade
> [   19.917748][    T1] flags: 0x4000000000004000(reserved|zone=3D1)
> [   19.917748][    T1] page_type: 0xffffffff()
> [   19.917748][    T1] raw: 4000000000004000 ffffea00001ab788 ffffea00001=
ab788 0000000000000000
> [   19.917748][    T1] raw: 0000000000000000 0000000000000000 00000001fff=
fffff 0000000000000000
> [   19.917748][    T1] page dumped because: kasan: bad access detected
> [   19.917748][    T1] page_owner info is not present (never set?)
> [   19.917748][    T1]
> [   19.917748][    T1] Memory state around the buggy address:
> [   19.917748][    T1]  ffffffff86ade580: 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 00
> [   19.917748][    T1]  ffffffff86ade600: 00 00 00 00 00 00 00 00 f9 f9 f=
9 f9 04 f9 f9 f9
> [   19.917748][    T1] >ffffffff86ade680: f9 f9 f9 f9 f9 f9 f9 f9 00 00 f=
9 f9 f9 f9 f9 f9
> [   19.917748][    T1]                                         ^
> [   19.917748][    T1]  ffffffff86ade700: 00 f9 f9 f9 f9 f9 f9 f9 04 f9 f=
9 f9 f9 f9 f9 f9
> [   19.917748][    T1]  ffffffff86ade780: 00 00 f9 f9 f9 f9 f9 f9 00 00 f=
9 f9 f9 f9 f9 f9
> [   19.917748][    T1] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   19.956634][    T1] Disabling lock debugging due to kernel taint
>=20
>=20
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20231120/202311201431.57aae8f3-ol=
iver.sang@intel.com
>=20
>=20
>=20
> --=20
> 0-DAY CI Kernel Test Service
> https://protect2.fireeye.com/v1/url?k=3Daffeaf70-ce8505e7-afff243f-74fe48=
60001d-3fbea93df14d4e36&q=3D1&e=3D8a7fa261-c965-4e86-9b45-a85e043a6025&u=3D=
https%3A%2F%2Fgithub.com%2Fintel%2Flkp-tests%2Fwiki
>=20

--=20

Joel Granados

--gbbdt36qqhqnq6s3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmVclPMACgkQupfNUreW
QU+F0Qv8DFu/ez+cwjsRJs+upTbOcQX520WNH259ujlYobQ6zAMw1OicTHdB0cHw
OweLV87UrCg9Zclknjz72EdlawO7bF7hGiQ1t7W9AmwXn1BV5Vhh8SLRgKTtl6i8
KXHLzQP4bvR51y7KxtZEWc9d5kcx9lQOr5D3Qm+rWgB0tjiz3aom+sxqB7gf37Xb
3BRkzIEIQ9ZcGV7c+qJ4f9S1ogGfIJkb963mpFqqyRMk1zXjGI8nfR/T1AvkYmD7
MZrPdJmA16rp0UAatHC/d7yW17pa1kmsfxnDmoP3xBeHDm7rmRw1+3kb3s+Jtzgx
Hc5X0muzz9Y/ZX7KBazyjOL2Ls7CniGxfBtDiMZIVu8Zh+Yijn2oj3Mpg+7Xc7hv
ZH9Xj6JFbMNat899lgvSYtpjZvFwVVQkVUia023vjRTfELpMC5mrSlgTCRGTID2M
LkBw7Ah5KYZgQO3zABwO1sCgEpGsMn7GqDMemOowxON+/gLxqFlTjsTYKVeCZ9ot
vvqoMQAt
=SecF
-----END PGP SIGNATURE-----

--gbbdt36qqhqnq6s3--
