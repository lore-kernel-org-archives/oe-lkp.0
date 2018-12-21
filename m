Content-Type: multipart/mixed; boundary="===============7648445711848230241=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [xarray] 93eb07f72c: RIP:__sanitizer_cov_trace_pc
Date: Fri, 21 Dec 2018 08:45:19 +0800
Message-ID: <53db30d2-cd28-4689-89bf-5f7a25a26ca4@intel.com>
In-Reply-To: <20181214135000.GA10600@bombadil.infradead.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============7648445711848230241==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On 12/14/2018 09:50 PM, Matthew Wilcox wrote:
> On Fri, Dec 14, 2018 at 04:31:36PM +0800, kernel test robot wrote:
>> initrds=3D(
>> 	/osimage/quantal/quantal-core-x86_64-2018-11-09.cgz
>> 	/lkp/lkp/lkp-x86_64.cgz
>> 	/osimage/pkg/debian-x86_64-2016-08-31.cgz/trinity-static-x86_64-x86_64-=
6ddabfd2_2017-11-10.cgz
>> )
>>
>> HTTP_PREFIX=3Dhttps://download.01.org/0day-ci/lkp-qemu
>> wget --timestamping "${initrds[@]/#/$HTTP_PREFIX}"
> I love that you're providing this service, but seriously, this is the
> third report in a row that's just wrong.
It's a discarding script, we have replace it with 'lkp qemu' tool.

>
> --2018-12-14 08:48:21--  https://download.01.org/0day-ci/lkp-qemu/osimage=
/quantal/quantal-core-x86_64-2018-11-09.cgz
> Resolving download.01.org (download.01.org)... 104.90.64.218, 2600:1408:3=
000:28b::ae6, 2600:1408:3000:291::ae6
> Connecting to download.01.org (download.01.org)|104.90.64.218|:443... con=
nected.
> HTTP request sent, awaiting response... 404 Not Found
> 2018-12-14 08:48:21 ERROR 404: Not Found.
>
> --2018-12-14 08:48:21--  https://download.01.org/0day-ci/lkp-qemu/lkp/lkp=
/lkp-x86_64.cgz
> Reusing existing connection to download.01.org:443.
> HTTP request sent, awaiting response... 404 Not Found
> 2018-12-14 08:48:21 ERROR 404: Not Found.
>
>
>

It should be a false positive, we can't reproduce the issue on local =

desktop.
The test VM are usually overloaded much to improve test density, we will =

pay attention to the issue.

Best Regards,
Rong Chen

--===============7648445711848230241==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRl
bnQ9InRleHQvaHRtbDsgY2hhcnNldD11dGYtOCI+CiAgPC9oZWFkPgogIDxib2R5IHRleHQ9IiMw
MDAwMDAiIGJnY29sb3I9IiNGRkZGRkYiPgogICAgPHA+IDwvcD4KICAgIEhpLDxicj4KICAgIDxi
cj4KICAgIDxkaXYgY2xhc3M9Im1vei1jaXRlLXByZWZpeCI+T24gMTIvMTQvMjAxOCAwOTo1MCBQ
TSwgTWF0dGhldyBXaWxjb3gKICAgICAgd3JvdGU6PGJyPgogICAgPC9kaXY+CiAgICA8YmxvY2tx
dW90ZSB0eXBlPSJjaXRlIgogICAgICBjaXRlPSJtaWQ6MjAxODEyMTQxMzUwMDAuR0ExMDYwMEBi
b21iYWRpbC5pbmZyYWRlYWQub3JnIj4KICAgICAgPHByZSB3cmFwPSIiPk9uIEZyaSwgRGVjIDE0
LCAyMDE4IGF0IDA0OjMxOjM2UE0gKzA4MDAsIGtlcm5lbCB0ZXN0IHJvYm90IHdyb3RlOgo8L3By
ZT4KICAgICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+CiAgICAgICAgPHByZSB3cmFwPSIiPmlu
aXRyZHM9KAoJL29zaW1hZ2UvcXVhbnRhbC9xdWFudGFsLWNvcmUteDg2XzY0LTIwMTgtMTEtMDku
Y2d6CgkvbGtwL2xrcC9sa3AteDg2XzY0LmNnegoJL29zaW1hZ2UvcGtnL2RlYmlhbi14ODZfNjQt
MjAxNi0wOC0zMS5jZ3ovdHJpbml0eS1zdGF0aWMteDg2XzY0LXg4Nl82NC02ZGRhYmZkMl8yMDE3
LTExLTEwLmNnegopCgpIVFRQX1BSRUZJWD08YSBjbGFzcz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0
IiBocmVmPSJodHRwczovL2Rvd25sb2FkLjAxLm9yZy8wZGF5LWNpL2xrcC1xZW11Ij5odHRwczov
L2Rvd25sb2FkLjAxLm9yZy8wZGF5LWNpL2xrcC1xZW11PC9hPgp3Z2V0IC0tdGltZXN0YW1waW5n
ICIke2luaXRyZHNbQF0vIy8kSFRUUF9QUkVGSVh9Igo8L3ByZT4KICAgICAgPC9ibG9ja3F1b3Rl
PgogICAgICA8cHJlIHdyYXA9IiI+CkkgbG92ZSB0aGF0IHlvdSdyZSBwcm92aWRpbmcgdGhpcyBz
ZXJ2aWNlLCBidXQgc2VyaW91c2x5LCB0aGlzIGlzIHRoZQp0aGlyZCByZXBvcnQgaW4gYSByb3cg
dGhhdCdzIGp1c3Qgd3JvbmcuPC9wcmU+CiAgICA8L2Jsb2NrcXVvdGU+CiAgICBJdCdzIGEgZGlz
Y2FyZGluZyBzY3JpcHQsIHdlIGhhdmUgcmVwbGFjZSBpdCB3aXRoICdsa3AgcWVtdScgdG9vbC48
YnI+CiAgICA8YnI+CiAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIgogICAgICBjaXRlPSJtaWQ6
MjAxODEyMTQxMzUwMDAuR0ExMDYwMEBib21iYWRpbC5pbmZyYWRlYWQub3JnIj4KICAgICAgPHBy
ZSB3cmFwPSIiPgoKLS0yMDE4LTEyLTE0IDA4OjQ4OjIxLS0gIDxhIGNsYXNzPSJtb3otdHh0LWxp
bmstZnJlZXRleHQiIGhyZWY9Imh0dHBzOi8vZG93bmxvYWQuMDEub3JnLzBkYXktY2kvbGtwLXFl
bXUvb3NpbWFnZS9xdWFudGFsL3F1YW50YWwtY29yZS14ODZfNjQtMjAxOC0xMS0wOS5jZ3oiPmh0
dHBzOi8vZG93bmxvYWQuMDEub3JnLzBkYXktY2kvbGtwLXFlbXUvb3NpbWFnZS9xdWFudGFsL3F1
YW50YWwtY29yZS14ODZfNjQtMjAxOC0xMS0wOS5jZ3o8L2E+ClJlc29sdmluZyBkb3dubG9hZC4w
MS5vcmcgKGRvd25sb2FkLjAxLm9yZykuLi4gMTA0LjkwLjY0LjIxOCwgMjYwMDoxNDA4OjMwMDA6
MjhiOjphZTYsIDI2MDA6MTQwODozMDAwOjI5MTo6YWU2CkNvbm5lY3RpbmcgdG8gZG93bmxvYWQu
MDEub3JnIChkb3dubG9hZC4wMS5vcmcpfDEwNC45MC42NC4yMTh8OjQ0My4uLiBjb25uZWN0ZWQu
CkhUVFAgcmVxdWVzdCBzZW50LCBhd2FpdGluZyByZXNwb25zZS4uLiA0MDQgTm90IEZvdW5kCjIw
MTgtMTItMTQgMDg6NDg6MjEgRVJST1IgNDA0OiBOb3QgRm91bmQuCgotLTIwMTgtMTItMTQgMDg6
NDg6MjEtLSAgPGEgY2xhc3M9Im1vei10eHQtbGluay1mcmVldGV4dCIgaHJlZj0iaHR0cHM6Ly9k
b3dubG9hZC4wMS5vcmcvMGRheS1jaS9sa3AtcWVtdS9sa3AvbGtwL2xrcC14ODZfNjQuY2d6Ij5o
dHRwczovL2Rvd25sb2FkLjAxLm9yZy8wZGF5LWNpL2xrcC1xZW11L2xrcC9sa3AvbGtwLXg4Nl82
NC5jZ3o8L2E+ClJldXNpbmcgZXhpc3RpbmcgY29ubmVjdGlvbiB0byBkb3dubG9hZC4wMS5vcmc6
NDQzLgpIVFRQIHJlcXVlc3Qgc2VudCwgYXdhaXRpbmcgcmVzcG9uc2UuLi4gNDA0IE5vdCBGb3Vu
ZAoyMDE4LTEyLTE0IDA4OjQ4OjIxIEVSUk9SIDQwNDogTm90IEZvdW5kLgoKCgo8L3ByZT4KICAg
IDwvYmxvY2txdW90ZT4KICAgIDxicj4KICAgIEl0IHNob3VsZCBiZSBhIGZhbHNlIHBvc2l0aXZl
LCB3ZSBjYW4ndCByZXByb2R1Y2UgdGhlIGlzc3VlIG9uIGxvY2FsCiAgICA8c3BhbiBpZD0id18x
MjQiIGNsYXNzPSIiPmRlc2t0b3A8L3NwYW4+Ljxicj4KICAgIFRoZSB0ZXN0IFZNIGFyZSB1c3Vh
bGx5IG92ZXJsb2FkZWQgbXVjaCB0byBpbXByb3ZlIHRlc3QgZGVuc2l0eSwgd2UKICAgIHdpbGwg
cGF5IGF0dGVudGlvbiB0byB0aGUgaXNzdWUuPGJyPgogICAgPGJyPgogICAgQmVzdCBSZWdhcmRz
LDxicj4KICAgIFJvbmcgQ2hlbiA8YnI+CiAgPC9ib2R5Pgo8L2h0bWw+Cg==

--===============7648445711848230241==--

