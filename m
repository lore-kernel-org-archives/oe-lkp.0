Content-Type: multipart/mixed; boundary="===============1809676175474086389=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched] 143e1e28cb4: +17.9% aim7.jobs-per-min, -9.7% hackbench.throughput
Date: Sun, 10 Aug 2014 09:59:15 +0200
Message-ID: <20140810075915.GR9918@twins.programming.kicks-ass.net>
In-Reply-To: <20140810044127.GB11810@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============1809676175474086389==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 10, 2014 at 12:41:27PM +0800, Fengguang Wu wrote:
> Hi Vincent,
> =

> FYI, we noticed some performance ups/downs on
> =

> commit 143e1e28cb40bed836b0a06567208bd7347c9672 ("sched: Rework sched_dom=
ain topology definition")
> =

>     128529 =C2=B1 1%     +17.9%     151594 =C2=B1 0%  brickland1/aim7/600=
0-page_test
>      76064 =C2=B1 3%     -32.2%      51572 =C2=B1 6%  brickland1/aim7/600=
0-page_test
>   59366697 =C2=B1 3%     -46.1%   32017187 =C2=B1 7%  brickland1/aim7/600=
0-page_test
>       2561 =C2=B1 7%     -42.9%       1463 =C2=B1 9%  brickland1/aim7/600=
0-page_test
>       9926 =C2=B1 2%     -43.8%       5577 =C2=B1 4%  brickland1/aim7/600=
0-page_test
>      19542 =C2=B1 9%     -38.3%      12057 =C2=B1 4%  brickland1/aim7/600=
0-page_test
>     993654 =C2=B1 2%     -19.9%     795962 =C2=B1 3%  brickland1/aim7/600=
0-page_test

etc..

how does one read that? afaict its a random number generator..

--===============1809676175474086389==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.sig"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEuNC4xMiAoR05V
L0xpbnV4KQoKaVFJY0JBRUJBZ0FHQlFKVDV5WlBBQW9KRUhaSDRhUkx3T1M2N1VBUC9ScTNER0x0
RmFqU1dzaWZGS2VKcFhvegpTWTlLOWZPMksxaW9qVzBsc1FmdklSV2QyMFdabXgrNHVpOXBXVUtE
a05iZW84ZDdsa3U5Qnk3NEJRWnpxV3E3CklTQTllZ3FuQlVpWFN3VEUvUi8vcW5rME9PWDlZbVFy
MEk4TTRCWC84ODk1YXdzaTVNbG1PQitEaFNyVkUvUUYKKy9FVzg1ckFsMG1BOU9HQjdvMHQ0NGwx
TGlWUFBnZTRkYWhyU2orR3lncWhZc3VVeUFiWkxDMnhRamlVcUFsVApQT2pDb21QWEpLNW5Ka095
SWp0MWlCT2ppSXkyZHhqdEVKejlWV2M1Q20vSkdTazdtOGU5alYxbDYrd1dVMm5kCjZhbkdvbDNX
NHRBMHUvMVloNWFrODhKOEVIK3prd2tzeWkvWVdOdHlZZUNhT056NHBkSmJ6T3VzU1U3UnJpcVoK
VGI0a3RscmkyQ2Nld1FqKzhrdWkxdmt1TlVUMXNoV1RZNlh1RG56YXNvUXA3bnp0VWhMUm5xcExJ
NXpFWHp6RQpYVEw0QUFqUVgrTjdpT3k0dVRhMDlpaUErd3BmaVczenJqNXcrdG1WRE5oOGIwZGt5
ZDFRckVwSnM2Mi9FTU5rCjBPU2hJVmx1UUlFS1dUY2NZUkZWdlRtS0pyME5zcFFXTXFjS1Q3RHM2
VmMwRGI5N2JWZHVZeEZvTnFCNmZRMEEKNHQxa1RyTitXN1RYWVlQQndaalp5N0FHUFh5U25XdkYy
QzB6WnphMUF4WEN5a1pDaEVRODR5UFVjWHBTNW80MwpnT202Z2ZrQmpqcWhyWGZTVXY2SFVwVnpE
MXRNQzJ5eGVMcmMzSnBSNkl6MTYxQTVKamNTY2MydWtvcWNhOWdkCmVkUy9hRjhVVVBlWGRIallD
cGcwCj02Zk5CCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============1809676175474086389==--

