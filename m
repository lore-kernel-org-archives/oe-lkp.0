Content-Type: multipart/mixed; boundary="===============0542593148129619353=="
MIME-Version: 1.0
From: Rik van Riel <riel@redhat.com>
To: lkp@lists.01.org
Subject: Re: [sched/numa] a43455a1d57: +94.1% proc-vmstat.numa_hint_faults_local
Date: Sat, 02 Aug 2014 00:17:05 -0400
Message-ID: <53DC6641.2050904@redhat.com>
In-Reply-To: <53DC06FA.8030104@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0542593148129619353==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08/01/2014 05:30 PM, Jirka Hladky wrote:

> I see the regression only on this box. It has 4 "Ivy Bridge-EX"
> Xeon E7-4890 v2 CPUs.
> =

> http://ark.intel.com/products/75251 =

> http://en.wikipedia.org/wiki/List_of_Intel_Xeon_microprocessors#.22Ivy_Br=
idge-EX.22_.2822_nm.29_Expandable_2
>
> =

> =

> Please rerun the test on box with Ivy Bridge CPUs. It seems that
> older CPU generations are not affected.

That would have been good info to know :)

I've been spending about a month trying to reproduce your issue on a
Westmere E7-4860.

Good thing I found all kinds of other scheduler issues along the way...

- -- =

All rights reversed
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJT3GZBAAoJEM553pKExN6D4FcH/2c/kYOZkbJeLBEWJHB0yWNR
tqI2Lt/qxPxOKADlDylJwj2Dq8R19Cc4tnJZAdPh+wgCivFefseQY0MI1TI8CO/Z
vEH+dCG8hokygFxKqAX9udI0MD1OxfTKKIk4fdjInZ632JG+JHnqVH6qWxBsriXD
151jzCR/zQEjg6gyCc8YsL06Q9YHyVv7dakggtRkYnE1GIUAtTDhFttRpNYoiVQQ
y/d32adq//PywTmsyWwJMu1ZGe1eGC57JBYzjoUo2iOlFQ9QR+fe4W2/6ZCbekwK
O8ZYbrJzDGrNQP2yDYd+o040KeVfzYkOtwz7+/40TYIvqFiuvKxEAxbJ32+krxA=3D
=3DXxCE
-----END PGP SIGNATURE-----

--===============0542593148129619353==--

