Content-Type: multipart/mixed; boundary="===============4655268438215407982=="
MIME-Version: 1.0
From: Xing, Zhengjun <zhengjun.xing@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] 10befea91b: hackbench.throughput -62.4% regression
Date: Tue, 02 Feb 2021 16:18:27 +0800
Message-ID: <59b6fda7-509a-0afb-112d-46c1e73c589b@intel.com>
In-Reply-To: <20210114031839.GA415540@carbon.dhcp.thefacebook.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4655268438215407982==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 1/14/2021 11:18 AM, Roman Gushchin wrote:
> On Thu, Jan 14, 2021 at 10:51:51AM +0800, kernel test robot wrote:
>> Greeting,
>>
>> FYI, we noticed a -62.4% regression of hackbench.throughput due to commi=
t:
> Hi!
>
> Commit "mm: memcg/slab: optimize objcg stock draining" (currently only in=
 the mm tree,
> so no stable hash) should improve the hackbench regression.
The commit has been merged into Linux mainline :
 =C2=A03de7d4f25a7438f09fef4e71ef111f1805cd8e7c ("mm: memcg/slab: optimize =

objcg stock draining")
I test the regression still existed.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/nr_threads/iterations/mode/ipc/=
cpufreq_governor/ucode:
lkp-csl-2sp7/hackbench/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/gcc-=
9/100%/4/process/socket/performance/0x5003003

commit:
 =C2=A0 286e04b8ed7a04279ae277f0f024430246ea5eec
 =C2=A0 10befea91b61c4e2c2d1df06a2e978d182fcf792
 =C2=A0 3de7d4f25a7438f09fef4e71ef111f1805cd8e7c
 =C2=A0 v5.11-rc6

286e04b8ed7a0427 10befea91b61c4e2c2d1df06a2e =

3de7d4f25a7438f09fef4e71ef1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v5.11-rc6
---------------- --------------------------- --------------------------- =

---------------------------
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev=C2=A0=C2=A0=C2=A0=
=C2=A0 %change=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev=C2=
=A0=C2=A0=C2=A0=C2=A0 %change %stddev=C2=A0=C2=A0=C2=A0=C2=A0 =

%change=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | \=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =

|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 \
 =C2=A0=C2=A0=C2=A0 192062 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0 -62.4%=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 72220 =C2=B1 16%=C2=A0=C2=A0=C2=A0=C2=A0 -63=
.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 71147 =C2=B1=C2=A0 =

2%=C2=A0=C2=A0=C2=A0=C2=A0 -61.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 73626=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hackbench.throughput

>
> Thanks!
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org

-- =

Zhengjun Xing


--===============4655268438215407982==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRl
bnQ9InRleHQvaHRtbDsgY2hhcnNldD1VVEYtOCI+CiAgPC9oZWFkPgogIDxib2R5PgogICAgPGJy
PgogICAgPGJyPgogICAgPGRpdiBjbGFzcz0ibW96LWNpdGUtcHJlZml4Ij5PbiAxLzE0LzIwMjEg
MTE6MTggQU0sIFJvbWFuIEd1c2hjaGluCiAgICAgIHdyb3RlOjxicj4KICAgIDwvZGl2PgogICAg
PGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIKICAgICAgY2l0ZT0ibWlkOjIwMjEwMTE0MDMxODM5LkdB
NDE1NTQwQGNhcmJvbi5kaGNwLnRoZWZhY2Vib29rLmNvbSI+CiAgICAgIDxwcmUgY2xhc3M9Im1v
ei1xdW90ZS1wcmUiIHdyYXA9IiI+T24gVGh1LCBKYW4gMTQsIDIwMjEgYXQgMTA6NTE6NTFBTSAr
MDgwMCwga2VybmVsIHRlc3Qgcm9ib3Qgd3JvdGU6CjwvcHJlPgogICAgICA8YmxvY2txdW90ZSB0
eXBlPSJjaXRlIj4KICAgICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPgpH
cmVldGluZywKCkZZSSwgd2Ugbm90aWNlZCBhIC02Mi40JSByZWdyZXNzaW9uIG9mIGhhY2tiZW5j
aC50aHJvdWdocHV0IGR1ZSB0byBjb21taXQ6CjwvcHJlPgogICAgICA8L2Jsb2NrcXVvdGU+CiAg
ICAgIDxwcmUgY2xhc3M9Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+CkhpIQoKQ29tbWl0ICJtbTog
bWVtY2cvc2xhYjogb3B0aW1pemUgb2JqY2cgc3RvY2sgZHJhaW5pbmciIChjdXJyZW50bHkgb25s
eSBpbiB0aGUgbW0gdHJlZSwKc28gbm8gc3RhYmxlIGhhc2gpIHNob3VsZCBpbXByb3ZlIHRoZSBo
YWNrYmVuY2ggcmVncmVzc2lvbi48L3ByZT4KICAgIDwvYmxvY2txdW90ZT4KICAgIFRoZSBjb21t
aXQgaGFzIGJlZW4gbWVyZ2VkIGludG8gTGludXggbWFpbmxpbmUgOjxicj4KICAgIMKgM2RlN2Q0
ZjI1YTc0MzhmMDlmZWY0ZTcxZWYxMTFmMTgwNWNkOGU3Y8KgIDxzcGFuIHN0eWxlPSJjb2xvcjoK
ICAgICAgcmdiKDUxLCA1MSwgNTEpOyBmb250LWZhbWlseTogc2Fucy1zZXJpZjsgZm9udC1zaXpl
OiAxNi42NjY3cHg7CiAgICAgIGZvbnQtc3R5bGU6IG5vcm1hbDsgZm9udC12YXJpYW50LWxpZ2F0
dXJlczogbm9ybWFsOwogICAgICBmb250LXZhcmlhbnQtY2Fwczogbm9ybWFsOyBmb250LXdlaWdo
dDogNzAwOyBsZXR0ZXItc3BhY2luZzoKICAgICAgbm9ybWFsOyBvcnBoYW5zOiAyOyB0ZXh0LWFs
aWduOiBzdGFydDsgdGV4dC1pbmRlbnQ6IDBweDsKICAgICAgdGV4dC10cmFuc2Zvcm06IG5vbmU7
IHdoaXRlLXNwYWNlOiBub3JtYWw7IHdpZG93czogMjsKICAgICAgd29yZC1zcGFjaW5nOiAwcHg7
IC13ZWJraXQtdGV4dC1zdHJva2Utd2lkdGg6IDBweDsKICAgICAgYmFja2dyb3VuZC1jb2xvcjog
cmdiKDI1NSwgMjU1LCAyNTUpOyB0ZXh0LWRlY29yYXRpb24tdGhpY2tuZXNzOgogICAgICBpbml0
aWFsOyB0ZXh0LWRlY29yYXRpb24tc3R5bGU6IGluaXRpYWw7IHRleHQtZGVjb3JhdGlvbi1jb2xv
cjoKICAgICAgaW5pdGlhbDsgZGlzcGxheTogaW5saW5lICFpbXBvcnRhbnQ7IGZsb2F0OiBub25l
OyI+KCJtbToKICAgICAgbWVtY2cvc2xhYjogb3B0aW1pemUgb2JqY2cgc3RvY2sgZHJhaW5pbmci
KTwvc3Bhbj48YnI+CiAgICBJIHRlc3QgdGhlIHJlZ3Jlc3Npb24gc3RpbGwgZXhpc3RlZC48YnI+
Cj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PGJyPgp0Ym94X2dyb3VwL3Rlc3RjYXNl
L3Jvb3Rmcy9rY29uZmlnL2NvbXBpbGVyL25yX3RocmVhZHMvaXRlcmF0aW9ucy9tb2RlL2lwYy9j
cHVmcmVxX2dvdmVybm9yL3Vjb2RlOjxicj4KICAgIMKgCmxrcC1jc2wtMnNwNy9oYWNrYmVuY2gv
ZGViaWFuLTEwLjQteDg2XzY0LTIwMjAwNjAzLmNnei94ODZfNjQtcmhlbC04LjMvZ2NjLTkvMTAw
JS80L3Byb2Nlc3Mvc29ja2V0L3BlcmZvcm1hbmNlLzB4NTAwMzAwMzxicj4KICAgIDxicj4KICAg
IGNvbW1pdDo8YnI+CiAgICDCoCAyODZlMDRiOGVkN2EwNDI3OWFlMjc3ZjBmMDI0NDMwMjQ2ZWE1
ZWVjPGJyPgogICAgwqAgMTBiZWZlYTkxYjYxYzRlMmMyZDFkZjA2YTJlOTc4ZDE4MmZjZjc5Mjxi
cj4KICAgIMKgIDNkZTdkNGYyNWE3NDM4ZjA5ZmVmNGU3MWVmMTExZjE4MDVjZDhlN2M8YnI+CiAg
ICDCoCB2NS4xMS1yYzY8YnI+CiAgICA8YnI+CiAgICAyODZlMDRiOGVkN2EwNDI3IDEwYmVmZWE5
MWI2MWM0ZTJjMmQxZGYwNmEyZQogICAgM2RlN2Q0ZjI1YTc0MzhmMDlmZWY0ZTcxZWYxwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHY1LjExLXJjNjxicj4KICAgIC0tLS0tLS0t
LS0tLS0tLS0gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAgICAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tPGJyPgogICAgwqDCoMKgwqDC
oMKgwqDCoCAlc3RkZGV2wqDCoMKgwqAgJWNoYW5nZcKgwqDCoMKgwqDCoMKgwqAgJXN0ZGRldsKg
wqDCoMKgICVjaGFuZ2XCoMKgwqDCoMKgwqDCoMKgCiAgICAlc3RkZGV2wqDCoMKgwqAgJWNoYW5n
ZcKgwqDCoMKgwqDCoMKgwqAgJXN0ZGRldjxicj4KICAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBcwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXMKg
wqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgCiAgICBcwqDC
oMKgwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXDxicj4KICAg
IMKgwqDCoCAxOTIwNjIgwrHCoCA5JcKgwqDCoMKgIC02Mi40JcKgwqDCoMKgwqAgNzIyMjAgwrEg
MTYlwqDCoMKgwqAgLTYzLjAlwqDCoMKgwqDCoCA3MTE0NwogICAgwrHCoCAyJcKgwqDCoMKgIC02
MS43JcKgwqDCoMKgwqAgNzM2MjbCoMKgwqDCoMKgwqDCoCBoYWNrYmVuY2gudGhyb3VnaHB1dDxi
cj4KICAgIDxicj4KICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiCiAgICAgIGNpdGU9Im1pZDoy
MDIxMDExNDAzMTgzOS5HQTQxNTU0MEBjYXJib24uZGhjcC50aGVmYWNlYm9vay5jb20iPgogICAg
ICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPgoKVGhhbmtzIQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMS1AgbWFpbGluZyBsaXN0IC0t
IDxhIGNsYXNzPSJtb3otdHh0LWxpbmstYWJicmV2aWF0ZWQiIGhyZWY9Im1haWx0bzpsa3BAbGlz
dHMuMDEub3JnIj5sa3BAbGlzdHMuMDEub3JnPC9hPgpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVt
YWlsIHRvIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstYWJicmV2aWF0ZWQiIGhyZWY9Im1haWx0bzps
a3AtbGVhdmVAbGlzdHMuMDEub3JnIj5sa3AtbGVhdmVAbGlzdHMuMDEub3JnPC9hPgo8L3ByZT4K
ICAgIDwvYmxvY2txdW90ZT4KICAgIDxicj4KICAgIDxwcmUgY2xhc3M9Im1vei1zaWduYXR1cmUi
IGNvbHM9IjcyIj4tLSAKWmhlbmdqdW4gWGluZzwvcHJlPgogIDwvYm9keT4KPC9odG1sPgo=

--===============4655268438215407982==--

