Content-Type: multipart/mixed; boundary="===============6977893605096670719=="
MIME-Version: 1.0
From: Rik van Riel <riel@surriel.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2 00/16] Multigenerational LRU Framework
Date: Wed, 14 Apr 2021 11:58:53 -0400
Message-ID: <e0ad1b48a1ad0b6d3a1e79129f397ddb6c32fe35.camel@surriel.com>
In-Reply-To: <20210414155130.GU3762101@tassilo.jf.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6977893605096670719==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-04-14 at 08:51 -0700, Andi Kleen wrote:
> >    2) It will not scan PTE tables under non-leaf PMD entries that
> > do not
> >       have the accessed bit set, when
> >       CONFIG_HAVE_ARCH_PARENT_PMD_YOUNG=3Dy.
> =

> This assumes  that workloads have reasonable locality. Could there
> be a worst case where only one or two pages in each PTE are used,
> so this PTE skipping trick doesn't work?

Databases with large shared memory segments shared between
many processes come to mind as a real-world example of a
worst case scenario.

-- =

All Rights Reversed.

--===============6977893605096670719==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUFCQ0FBZEZpRUVLUjczcENDdEo1
WGozeUFEem5uZWtvVEUzb01GQW1CM0VUMEFDZ2tRem5uZWtvVEUKM29PV213ZitOTGRIeE9rTUVm
VXNhQ3UwVmxpUzBBdE9oUlcvcnM2eGxEZVZWS1VOMVpVdTBFV3EwOTB0c0VtdQo5SG9yenRZOTUx
N2lNb1FHNGFTZXdFNWVGZG9UQTREem5VUzlNVTNFLzdlc3A5U3c2emJRbGcxd0hpZi9DYy93CnFv
am5mdUV2QTR0akNaWGlVS1dKQS9xcHN2U1JtcjR0WGhtWmVKWWhCdy9WNzhXSlRxMGNaMVlLV2h1
Sit3dTcKeWVROWxtdDdGWTM3MXdhMzhoSEdaMEI1YVpxS2ZYcUk0Ym9hUkFwa1ZCejNLSzRwQVRR
Q2U3a0kzbEgwVFk4KwpYUy85aDVESGd6NURhb3ZDMlA1TFJ3bVpRRzlaWnF5dE5QeTRjWWdDdDlT
U2cvakZXUk1LTTdYbm9iVkhJaHNxCnpxTWkvRVFVWHkvYm5uSE5IUjVxOENjc2pyWm1mQT09Cj1H
V1FMCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============6977893605096670719==--

