Content-Type: multipart/mixed; boundary="===============8544418590026134450=="
MIME-Version: 1.0
From: Rik van Riel <riel@surriel.com>
To: lkp@lists.01.org
Subject: Re: [mm] f35b5d7d67: will-it-scale.per_process_ops -95.5% regression
Date: Thu, 20 Oct 2022 11:28:16 -0400
Message-ID: <366045a27a96e01d0526d63fd78d4f3c5d1f530b.camel@surriel.com>
In-Reply-To: <871qr3nkw2.fsf@yhuang6-desk2.ccr.corp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8544418590026134450==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 2022-10-20 at 13:07 +0800, Huang, Ying wrote:
> =

> Nathan Chancellor <nathan@kernel.org> writes:
> > =

> > For what it's worth, I just bisected a massive and visible
> > performance
> > regression on my Threadripper 3990X workstation to commit
> > f35b5d7d676e
> > ("mm: align larger anonymous mappings on THP boundaries"), which
> > seems
> > directly related to this report/analysis. I initially noticed this
> > because my full set of kernel builds against mainline went from 2
> > hours
> > and 20 minutes or so to over 3 hours. Zeroing in on x86_64
> > allmodconfig,
> > which I used for the bisect:
> > =

> > @ 7b5a0b664ebe ("mm/page_ext: remove unused variable in
> > offline_page_ext"):
> > =

> > Benchmark 1: make -skj128 LLVM=3D1 allmodconfig all
> > =C2=A0 Time (mean =C2=B1 =CF=83):=C2=A0=C2=A0=C2=A0=C2=A0 318.172 s =C2=
=B1=C2=A0 0.730 s=C2=A0=C2=A0=C2=A0 [User: 31750.902 s,
> > System: 4564.246 s]
> > =C2=A0 Range (min =E2=80=A6 max):=C2=A0=C2=A0 317.332 s =E2=80=A6 318.6=
62 s=C2=A0=C2=A0=C2=A0 3 runs
> > =

> > @ f35b5d7d676e ("mm: align larger anonymous mappings on THP
> > boundaries"):
> > =

> > Benchmark 1: make -skj128 LLVM=3D1 allmodconfig all
> >   Time (mean =C2=B1 =CF=83):     406.688 s =C2=B1  0.676 s    [User: 31=
819.526 s,
System: 16327.022 s]
> >   Range (min =E2=80=A6 max):   405.954 s =E2=80=A6 407.284 s    3 run
> =

> Have you tried to build with gcc?=C2=A0 Want to check whether is this
> clang
> specific issue or not.

This may indeed be something LLVM specific. In previous tests,
GCC has generally seen a benefit from increased THP usage.
Many other applications also benefit from getting more THPs.

LLVM showing 10% system time before this change, and a whopping
30% system time after that change, suggests that LLVM is behaving
quite differently from GCC in some ways.

If we can figure out what these differences are, maybe we can
just fine tune the code to avoid this issue.

I'll try to play around with LLVM compilation a little bit next
week, to see if I can figure out what might be going on. I wonder
if LLVM is doing lots of mremap calls or something...

-- =

All Rights Reversed.

--===============8544418590026134450==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUFCQ0FBZEZpRUVLUjczcENDdEo1
WGozeUFEem5uZWtvVEUzb01GQW1OUmFSQUFDZ2tRem5uZWtvVEUKM29QaStRZ0FnZ2xDRElyM25U
dGM5QjNkZExuaGRibXpwMGNocTV5S3VyT0xRSjM5Rk5DOEhEN2lhdWtSWVhqdQp0b05WTWhJZlQ1
SnVseElPL2JwYzF6UDN0TDErSkRaQ0J3dHF5b2dMWmZoZHJRUUtTYU00YitKcW5BS0tFRGQ3Cktv
WmZpclg3RG9WeENDVFp6ZHVxbnRtaFdVc2gxeEtKZG9TdVVHWHJTYTNQZkJGYUc4bHYrVk1RRFBC
NDVhTnEKU08zaFpkZ1RFTW02dTRMZ3NzcEU4QWs2b0tMaFJxZ0h0ZjJLcjJEdWpkUXRMVXZtbjhI
ZEtOUk9jWlNhR3BJSgpkYmY3NFNDVWU3bFozT3YzVlpzVFJSL0NWNkZlR2lLUWJLWk9zM1ZhM1hp
bWErYUNrVlR4S0V4eWFlRlNoSnlpCkZIS3l5dHhKb1pGR3V4VjBuS3I3WlZRZFRlYkhCQT09Cj1F
YjBkCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============8544418590026134450==--

