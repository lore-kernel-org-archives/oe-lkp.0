Content-Type: multipart/mixed; boundary="===============5414738475801716064=="
MIME-Version: 1.0
From: Chen, Rong A <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: c8baae08df ("mm/swap: count a new anonymous page as a .."): [ 4.663710] kernel BUG at mm/swap.c:219!
Date: Tue, 18 Feb 2020 09:18:22 +0800
Message-ID: <a8eb86cd-598f-5c09-3ceb-0494d96b27ad@intel.com>
In-Reply-To: <OF96C10D3B.201A411E-ON49258511.0022A108-49258511.0022A10B@lge.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5414738475801716064==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 2/17/2020 2:18 PM, =EA=B9=80=EC=A4=80=EC=88=98 wrote:
>
> Hello, Chen
>
> See below~
>
> =EF=BB=BF
>
> ---------- Original Message ----------
>
> From : "Chen, Rong A" <rong.a.chen@intel.com>
> To : =EA=B9=80=EC=A4=80=EC=88=98 =EC=B1=85=EC=9E=84=EC=97=B0=EA=B5=AC=EC=
=9B=90(iamjoonsoo.kim), kernel test robot <lkp@intel.com>
> Cc : LKP <lkp@lists.01.org>
> Date : 2020/02/14 22:02:33 [GMT+09:00]
> Subject : Re: [LKP] Re: c8baae08df ("mm/swap: count a new anonymous =

> page as a .."): [ 4.663710] kernel BUG at mm/swap.c:219!
>
>
>
>
> On 2/14/2020 10:24 AM, =EA=B9=80=EC=A4=80=EC=88=98 wrote:
>>
>> Hello, LKP.
>>
>> See below and sorry for inconveniece due to mail client formatting.
>>
>>
>>
>> ---------- Original Message ----------
>>
>> From : kernel test robot <lkp@intel.com> <mailto:lkp@intel.com>
>> To : =EA=B9=80=EC=A4=80=EC=88=98 =EC=B1=85=EC=9E=84=EC=97=B0=EA=B5=AC=EC=
=9B=90(iamjoonsoo.kim)
>> Cc : LKP <lkp@lists.01.org> <mailto:lkp@lists.01.org>
>> Date : 2020/02/13 20:37:00 [GMT+09:00]
>> Subject : c8baae08df ("mm/swap: count a new anonymous page as a .."): =

>> [ 4.663710] kernel BUG at mm/swap.c:219!
>>
>>
>> Greetings, 0day kernel testing robot got the below dmesg and the =

>> first bad commit is https://github.com/JoonsooKim/linux.git =

>> improve-anonymous-lru-management-v1.00-v5.5 commit =

>> c8baae08dfbff1855f3981de3f09a927c0c01736 Author: Joonsoo Kim =

>> <iamjoonsoo.kim@lge.com> <mailto:iamjoonsoo.kim@lge.com> AuthorDate: =

>> Tue Jan 7 10:53:42 2020 +0900 Commit: Joonsoo Kim =

>> <iamjoonsoo.kim@lge.com> <mailto:iamjoonsoo.kim@lge.com> CommitDate: =

>> Tue Feb 11 14:52:12 2020 +0900 mm/swap: count a new anonymous page as =

>> a reclaim_state's rotate reclaim_stat's rotate is used for =

>> controlling the ratio of scanning page between file and anonymous =

>> LRU. All new anonymous pages are counted for rotate before the patch, =

>> protecting anonymous pages on active LRU, and, it makes that reclaim =

>> on anonymous LRU is less happened than file LRU. Now, situation is =

>> changed. all new anonymous pages are not added to the active LRU so =

>> rotate would be far less than before. It will cause that reclaim on =

>> anonymous LRU happens more and it would result in bad effect on some =

>> system that is optimized for previous setting. Therefore, this patch =

>> counts a new anonymous page as a reclaim_state's rotate. Although it =

>> is non-logical to add this count to the reclaim_state's rotate in =

>> current algorithm, reducing the regression would be more important. I =

>> found this regression on kernel-build test and it is roughly 2~5% =

>> performance degradation. With this workaround, performance is =

>> completely restored. Signed-off-by: Joonsoo Kim =

>> <iamjoonsoo.kim@lge.com> <mailto:iamjoonsoo.kim@lge.com> b5d323b5a0 =

>> mm/vmscan: restore active/inactive ratio for anonymous LRU c8baae08df =

>> mm/swap: count a new anonymous page as a reclaim_state's rotate =

>> f4e245c094 mm/workingset: cover-letter =

>> +-----------------------------------------------------------------------=
------+------------+------------+------------+ =

>> | | b5d323b5a0 | c8baae08df | f4e245c094 | =

>> +-----------------------------------------------------------------------=
------+------------+------------+------------+ =

>> | boot_successes | 32 | 0 | 0 | | boot_failures | 2 | 11 | 11 | | =

>> BUG:kernel_hang_in_early-boot_stage,last_printk:early_console_in_setup_c=
ode =

>> | 2 | | | | kernel_BUG_at_mm/swap.c | 0 | 11 | 11 | | =

>> invalid_opcode:#[##] | 0 | 11 | 11 | | EIP:pagevec_lru_move_fn | 0 | =

>> 11 | 11 | | Kernel_panic-not_syncing:Fatal_exception | 0 | 11 | 11 | =

>> +-----------------------------------------------------------------------=
------+------------+------------+------------+ =

>> If you fix the issue, kindly add following tag Reported-by: kernel =

>> test robot <lkp@intel.com> <mailto:lkp@intel.com> [ 4.653568] =

>> software IO TLB: mapped [mem 0xb177a000-0xb577a000] (64MB) [ =

>> 4.655715] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: =

>> 0x26d349e8249, max_idle_ns: 440795288087 ns [ 4.658468] apm: BIOS =

>> version 1.2 Flags 0x03 (Driver version 1.16ac) [ 4.659446] apm: =

>> overridden by ACPI. [ 4.662947] ------------[ cut here ]------------ =

>> [ 4.663710] kernel BUG at mm/swap.c:219!
>>
>> It is the line for VM_BUG_ON().
>>
>> It checks if arg exists when move_fn =3D=3D __pagevec_lru_add_fn.
>>
>> In current code (v5.5 or next/master), there is no code to cause this =

>> error.
>>
>> I suspect that some of merged branch on your test has the code to add =

>> the arg
>>
>> in this case. To check it, could you share the git branch address or =

>> the whole source
>>
>> about this test?
>>
>
> Hi Joonsoo,
>
> We will validate the bad branch again separately once we found a new =

> issue, and this issue can be reproduced in this branch.
>
> https://github.com/JoonsooKim/linux.git =

> improve-anonymous-lru-management-v1.00-v5.5 Do you mean there is =

> another branch triggered this issue?
>
> -----------------------------------------------------------------------
>
> Yes, I think that another branch create a functional conflict to my =

> branch.
>
> I found following bisect log in the first report.
>
> git bisect start 943d6510990c7958a23c1b5e46982d78d14102b0 =

> bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9 -- git bisect bad =

> 867cae08db8a39054b8a2aff263f3eeeee826041 # 13:12 B 0 11 27 0 Merge =

> 'linux-review/Michael-Straube/staging-rtl8188eu-remove-unnecessary-RETURN=
-label/20200208-003542' =

> into devel-hourly-2020021206 git bisect bad =

> 1f19b1d15d4bd74295bc0a9cc70966d434148cb7 # 13:12 B 0 11 27 0 Merge =

> 'linux-review/Chuanhong-Guo/mtd-nand-spi-rework-detect-procedure-for-diff=
erent-read-id-op/20200211-104641' =

> into devel-hourly-2020021206 git bisect bad =

> 17cab4f06acf2461f871bc74fcc396520042b413 # 13:12 B 0 10 27 1 Merge =

> 'linux-review/Benjamin-Gaignard/dt-bindings-touchscreen-Convert-edt-ft5x0=
6-to-json-schema/20200210-160432' =

> into devel-hourly-2020021206 git bisect good =

> c7127f6d1a18501afd091aef89b964b502e7ff34 # 13:12 G 11 0 0 0 Merge =

> 'kraxel/radeonfb-logging' into devel-hourly-2020021206 git bisect bad =

> 999259574aabd6578bf3e071c11c3b36f397d0f9 # 13:13 B 0 11 27 0 Merge =

> 'linux-review/UPDATE-20200210-185948/Florian-Westphal/netfilter-flowtable=
-always-init-block_offload-struct/20200204-051149' =

> into devel-hourly-2020021206 git bisect bad =

> aca170c89162fc8c47b6fb0567c1a8aee3ba381d # 13:13 B 0 11 27 0 Merge =

> 'joonsoo-kim/improve-anonymous-lru-management-v1.00-v5.5' into =

> devel-hourly-2020021206
>
> There are many "Merge 'XXXX'" commit and it looks like that your zero =

> day bot'sbranch includes many out-of-mainline-tree branch.
>
> They can be maintainer's branches or other feature branches like mine.
>
> If your test branch includes another branch, it could create a =

> functional conflict to my branch.
>
> So, I'd like to check the source code. Could you share the whole =

> source code for bad bisect?
>
> For example, the whole source tree for this =

> aca170c89162fc8c47b6fb0567c1a8aee3ba381dcommit.
>

Hi Joonsoo,

The source code is in our internal server, I'm afraid I can't make it =

public.
we just found another branch which also points to this issue:
https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org/thread/OL5H27DL66FV=
V5FQPHM4CPLZ6ESJ6BOC/ =



Could you take a look at it?

Best Regards,
Rong Chen


> Thanks.
>
>


--===============5414738475801716064==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+DQogIDxoZWFkPg0KICAgIDxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29u
dGVudD0idGV4dC9odG1sOyBjaGFyc2V0PVVURi04Ij4NCiAgPC9oZWFkPg0KICA8Ym9keT4NCiAg
ICA8YnI+DQogICAgPGJyPg0KICAgIDxkaXYgY2xhc3M9Im1vei1jaXRlLXByZWZpeCI+T24gMi8x
Ny8yMDIwIDI6MTggUE0sIOq5gOykgOyImCB3cm90ZTo8YnI+DQogICAgPC9kaXY+DQogICAgPGJs
b2NrcXVvdGUgdHlwZT0iY2l0ZSINCmNpdGU9Im1pZDpPRjk2QzEwRDNCLjIwMUE0MTFFLU9ONDky
NTg1MTEuMDAyMkExMDgtNDkyNTg1MTEuMDAyMkExMEJAbGdlLmNvbSI+DQogICAgICA8bWV0YSBo
dHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9InRleHQvaHRtbDsgY2hhcnNldD1VVEYt
OCI+DQogICAgICA8c3R5bGU+cCB7bWFyZ2luOjA7cGFkZGluZzowO30gYm9keSwgdGQsIGJ1dHRv
biwgcCB7IGNvbG9yOiMwMDAwMDA7IGZvbnQtc2l6ZToxMHB0OyBmb250LWZhbWlseTonTWFsZ3Vu
IEdvdGhpYycsJ+unkeydgCDqs6DrlJUnOyBsaW5lLWhlaWdodDpub3JtYWw7IH0gYSwgYTpob3Zl
ciwgYTpsaW5rLCBhOmFjdGl2ZSwgYTp2aXNpdGVkIHsgY29sb3I6IzAwMDAwMDsgfTwvc3R5bGU+
DQogICAgICA8cD5IZWxsbywgQ2hlbjwvcD4NCiAgICAgIDxwPlNlZSBiZWxvd348L3A+DQogICAg
ICA8cD7vu788YnI+DQogICAgICA8L3A+DQogICAgICA8cCBzdHlsZT0iZm9udC1zaXplOiAxMHB0
OyI+LS0tLS0tLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tLS0tLS08YnI+DQogICAgICAgIDxi
cj4NCiAgICAgICAgRnJvbSA6ICJDaGVuLCBSb25nIEEiIDxhIGNsYXNzPSJtb3otdHh0LWxpbmst
cmZjMjM5NkUiIGhyZWY9Im1haWx0bzpyb25nLmEuY2hlbkBpbnRlbC5jb20iPiZsdDtyb25nLmEu
Y2hlbkBpbnRlbC5jb20mZ3Q7PC9hPjxicj4NCiAgICAgICAgVG8gOiDquYDspIDsiJgg7LGF7J6E
7Jew6rWs7JuQKGlhbWpvb25zb28ua2ltKSwga2VybmVsIHRlc3Qgcm9ib3QNCiAgICAgICAgPGEg
Y2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOmxrcEBpbnRlbC5jb20i
PiZsdDtsa3BAaW50ZWwuY29tJmd0OzwvYT48YnI+DQogICAgICAgIENjIDogTEtQIDxhIGNsYXNz
PSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpsa3BAbGlzdHMuMDEub3JnIj4m
bHQ7bGtwQGxpc3RzLjAxLm9yZyZndDs8L2E+PGJyPg0KICAgICAgICBEYXRlIDogMjAyMC8wMi8x
NCAyMjowMjozMyBbR01UKzA5OjAwXTxicj4NCiAgICAgICAgU3ViamVjdCA6IFJlOiBbTEtQXSBS
ZTogYzhiYWFlMDhkZiAoIm1tL3N3YXA6IGNvdW50IGEgbmV3DQogICAgICAgIGFub255bW91cyBw
YWdlIGFzIGEgLi4iKTogWyA0LjY2MzcxMF0ga2VybmVsIEJVRyBhdA0KICAgICAgICBtbS9zd2Fw
LmM6MjE5ITxicj4NCiAgICAgICAgPGJyPg0KICAgICAgICA8YnI+DQogICAgICA8L3A+DQogICAg
ICA8ZGl2IHN0eWxlPSJtYXJnaW46IDBweDsgcGFkZGluZzogMHB4OyBjb2xvcjogcmdiKDAsIDAs
IDApOw0KICAgICAgICBmb250LWZhbWlseTogJnF1b3Q7TWFsZ3VuIEdvdGhpYyZxdW90OywmcXVv
dDvrp5HsnYAg6rOg65SVJnF1b3Q7Ow0KICAgICAgICBmb250LXNpemU6IDEwcHQ7Ij4gPGJyPg0K
ICAgICAgICA8YnI+DQogICAgICAgIDxkaXY+T24gMi8xNC8yMDIwIDEwOjI0IEFNLCDquYDspIDs
iJggd3JvdGU6PGJyPg0KICAgICAgICA8L2Rpdj4NCiAgICAgICAgPGJsb2NrcXVvdGUNCmNpdGU9
Im1pZDpPRjMwQkU1OTNDLjE1QUU5MTVCLU9ONDkyNTg1MEUuMDAwRDQwMzItNDkyNTg1MEUuMDAw
RDQwMzRAbGdlLmNvbSINCiAgICAgICAgICB0eXBlPSJjaXRlIj4NCiAgICAgICAgICA8cCBzdHls
ZT0ibWFyZ2luOiAwcHg7IHBhZGRpbmc6IDBweDsgY29sb3I6IHJnYigwLCAwLCAwKTsNCiAgICAg
ICAgICAgIGxpbmUtaGVpZ2h0OiBub3JtYWw7IGZvbnQtZmFtaWx5OiAmcXVvdDtNYWxndW4NCiAg
ICAgICAgICAgIEdvdGhpYyZxdW90OywmcXVvdDvrp5HsnYAg6rOg65SVJnF1b3Q7OyBmb250LXNp
emU6IDEwcHQ7Ij5IZWxsbywNCiAgICAgICAgICAgIExLUC48L3A+DQogICAgICAgICAgPHAgc3R5
bGU9Im1hcmdpbjogMHB4OyBwYWRkaW5nOiAwcHg7IGNvbG9yOiByZ2IoMCwgMCwgMCk7DQogICAg
ICAgICAgICBsaW5lLWhlaWdodDogbm9ybWFsOyBmb250LWZhbWlseTogJnF1b3Q7TWFsZ3VuDQog
ICAgICAgICAgICBHb3RoaWMmcXVvdDssJnF1b3Q766eR7J2AIOqzoOuUlSZxdW90OzsgZm9udC1z
aXplOiAxMHB0OyI+U2VlIGJlbG93DQogICAgICAgICAgICBhbmQgc29ycnkgZm9yIGluY29udmVu
aWVjZSBkdWUgdG8gbWFpbCBjbGllbnQgZm9ybWF0dGluZy48L3A+DQogICAgICAgICAgPHAgc3R5
bGU9Im1hcmdpbjogMHB4OyBwYWRkaW5nOiAwcHg7IGNvbG9yOiByZ2IoMCwgMCwgMCk7DQogICAg
ICAgICAgICBsaW5lLWhlaWdodDogbm9ybWFsOyBmb250LWZhbWlseTogJnF1b3Q7TWFsZ3VuDQog
ICAgICAgICAgICBHb3RoaWMmcXVvdDssJnF1b3Q766eR7J2AIOqzoOuUlSZxdW90OzsgZm9udC1z
aXplOiAxMHB0OyI+PGJyPg0KICAgICAgICAgICAgPGJyPg0KICAgICAgICAgIDwvcD4NCiAgICAg
ICAgICA8cCBzdHlsZT0ibWFyZ2luOiAwcHg7IHBhZGRpbmc6IDBweDsgY29sb3I6IHJnYigwLCAw
LCAwKTsNCiAgICAgICAgICAgIGxpbmUtaGVpZ2h0OiBub3JtYWw7IGZvbnQtZmFtaWx5OiAmcXVv
dDtNYWxndW4NCiAgICAgICAgICAgIEdvdGhpYyZxdW90OywmcXVvdDvrp5HsnYAg6rOg65SVJnF1
b3Q7OyBmb250LXNpemU6IDEwcHQ7Ij4tLS0tLS0tLS0tDQogICAgICAgICAgICBPcmlnaW5hbCBN
ZXNzYWdlIC0tLS0tLS0tLS08YnI+DQogICAgICAgICAgICA8YnI+DQogICAgICAgICAgICBGcm9t
IDoga2VybmVsIHRlc3Qgcm9ib3QgPGEgc3R5bGU9ImNvbG9yOiByZ2IoMCwgMCwgMCk7Ig0KICAg
ICAgICAgICAgICBocmVmPSJtYWlsdG86bGtwQGludGVsLmNvbSIgbW96LWRvLW5vdC1zZW5kPSJ0
cnVlIj4mbHQ7bGtwQGludGVsLmNvbSZndDs8L2E+PGJyPg0KICAgICAgICAgICAgVG8gOiDquYDs
pIDsiJgg7LGF7J6E7Jew6rWs7JuQKGlhbWpvb25zb28ua2ltKTxicj4NCiAgICAgICAgICAgIENj
IDogTEtQIDxhIHN0eWxlPSJjb2xvcjogcmdiKDAsIDAsIDApOyINCiAgICAgICAgICAgICAgaHJl
Zj0ibWFpbHRvOmxrcEBsaXN0cy4wMS5vcmciIG1vei1kby1ub3Qtc2VuZD0idHJ1ZSI+Jmx0O2xr
cEBsaXN0cy4wMS5vcmcmZ3Q7PC9hPjxicj4NCiAgICAgICAgICAgIERhdGUgOiAyMDIwLzAyLzEz
IDIwOjM3OjAwIFtHTVQrMDk6MDBdPGJyPg0KICAgICAgICAgICAgU3ViamVjdCA6IGM4YmFhZTA4
ZGYgKCJtbS9zd2FwOiBjb3VudCBhIG5ldyBhbm9ueW1vdXMgcGFnZQ0KICAgICAgICAgICAgYXMg
YSAuLiIpOiBbIDQuNjYzNzEwXSBrZXJuZWwgQlVHIGF0IG1tL3N3YXAuYzoyMTkhPGJyPg0KICAg
ICAgICAgICAgPGJyPg0KICAgICAgICAgICAgPGJyPg0KICAgICAgICAgIDwvcD4NCiAgICAgICAg
ICA8cHJlIHN0eWxlPSJ3aGl0ZS1zcGFjZTogcHJlLXdyYXA7IC1tcy13b3JkLWJyZWFrOiBrZWVw
LWFsbDsgLW1zLXdvcmQtd3JhcDogYnJlYWstd29yZDsgb3ZlcmZsb3ctd3JhcDogYnJlYWstd29y
ZDsiPjxwIHN0eWxlPSJtYXJnaW46IDBweDsgcGFkZGluZzogMHB4OyBjb2xvcjogcmdiKDAsIDAs
IDApOyBsaW5lLWhlaWdodDogbm9ybWFsOyBmb250LWZhbWlseTogJnF1b3Q7TWFsZ3VuIEdvdGhp
YyZxdW90OywmcXVvdDvrp5HsnYAg6rOg65SVJnF1b3Q7OyBmb250LXNpemU6IDEwcHQ7Ij5HcmVl
dGluZ3MsDQoNCjBkYXkga2VybmVsIHRlc3Rpbmcgcm9ib3QgZ290IHRoZSBiZWxvdyBkbWVzZyBh
bmQgdGhlIGZpcnN0IGJhZCBjb21taXQgaXMNCg0KPGEgc3R5bGU9ImNvbG9yOiByZ2IoMCwgMCwg
MCk7IiBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vSm9vbnNvb0tpbS9saW51eC5naXQiIG1vei1k
by1ub3Qtc2VuZD0idHJ1ZSI+aHR0cHM6Ly9naXRodWIuY29tL0pvb25zb29LaW0vbGludXguZ2l0
PC9hPiBpbXByb3ZlLWFub255bW91cy1scnUtbWFuYWdlbWVudC12MS4wMC12NS41DQoNCmNvbW1p
dCBjOGJhYWUwOGRmYmZmMTg1NWYzOTgxZGUzZjA5YTkyN2MwYzAxNzM2DQpBdXRob3I6ICAgICBK
b29uc29vIEtpbSA8YSBzdHlsZT0iY29sb3I6IHJnYigwLCAwLCAwKTsiIGhyZWY9Im1haWx0bzpp
YW1qb29uc29vLmtpbUBsZ2UuY29tIiBtb3otZG8tbm90LXNlbmQ9InRydWUiPiZsdDtpYW1qb29u
c29vLmtpbUBsZ2UuY29tJmd0OzwvYT4NCkF1dGhvckRhdGU6IFR1ZSBKYW4gNyAxMDo1Mzo0MiAy
MDIwICswOTAwDQpDb21taXQ6ICAgICBKb29uc29vIEtpbSA8YSBzdHlsZT0iY29sb3I6IHJnYigw
LCAwLCAwKTsiIGhyZWY9Im1haWx0bzppYW1qb29uc29vLmtpbUBsZ2UuY29tIiBtb3otZG8tbm90
LXNlbmQ9InRydWUiPiZsdDtpYW1qb29uc29vLmtpbUBsZ2UuY29tJmd0OzwvYT4NCkNvbW1pdERh
dGU6IFR1ZSBGZWIgMTEgMTQ6NTI6MTIgMjAyMCArMDkwMA0KDQogICAgbW0vc3dhcDogY291bnQg
YSBuZXcgYW5vbnltb3VzIHBhZ2UgYXMgYSByZWNsYWltX3N0YXRlJ3Mgcm90YXRlDQogICAgDQog
ICAgcmVjbGFpbV9zdGF0J3Mgcm90YXRlIGlzIHVzZWQgZm9yIGNvbnRyb2xsaW5nIHRoZSByYXRp
byBvZiBzY2FubmluZyBwYWdlDQogICAgYmV0d2VlbiBmaWxlIGFuZCBhbm9ueW1vdXMgTFJVLiBB
bGwgbmV3IGFub255bW91cyBwYWdlcyBhcmUgY291bnRlZA0KICAgIGZvciByb3RhdGUgYmVmb3Jl
IHRoZSBwYXRjaCwgcHJvdGVjdGluZyBhbm9ueW1vdXMgcGFnZXMgb24gYWN0aXZlIExSVSwgYW5k
LA0KICAgIGl0IG1ha2VzIHRoYXQgcmVjbGFpbSBvbiBhbm9ueW1vdXMgTFJVIGlzIGxlc3MgaGFw
cGVuZWQgdGhhbiBmaWxlIExSVS4NCiAgICANCiAgICBOb3csIHNpdHVhdGlvbiBpcyBjaGFuZ2Vk
LiBhbGwgbmV3IGFub255bW91cyBwYWdlcyBhcmUgbm90IGFkZGVkDQogICAgdG8gdGhlIGFjdGl2
ZSBMUlUgc28gcm90YXRlIHdvdWxkIGJlIGZhciBsZXNzIHRoYW4gYmVmb3JlLiBJdCB3aWxsIGNh
dXNlDQogICAgdGhhdCByZWNsYWltIG9uIGFub255bW91cyBMUlUgaGFwcGVucyBtb3JlIGFuZCBp
dCB3b3VsZCByZXN1bHQgaW4gYmFkDQogICAgZWZmZWN0IG9uIHNvbWUgc3lzdGVtIHRoYXQgaXMg
b3B0aW1pemVkIGZvciBwcmV2aW91cyBzZXR0aW5nLg0KICAgIA0KICAgIFRoZXJlZm9yZSwgdGhp
cyBwYXRjaCBjb3VudHMgYSBuZXcgYW5vbnltb3VzIHBhZ2UgYXMgYSByZWNsYWltX3N0YXRlJ3MN
CiAgICByb3RhdGUuIEFsdGhvdWdoIGl0IGlzIG5vbi1sb2dpY2FsIHRvIGFkZCB0aGlzIGNvdW50
IHRvDQogICAgdGhlIHJlY2xhaW1fc3RhdGUncyByb3RhdGUgaW4gY3VycmVudCBhbGdvcml0aG0s
IHJlZHVjaW5nIHRoZSByZWdyZXNzaW9uDQogICAgd291bGQgYmUgbW9yZSBpbXBvcnRhbnQuDQog
ICAgDQogICAgSSBmb3VuZCB0aGlzIHJlZ3Jlc3Npb24gb24ga2VybmVsLWJ1aWxkIHRlc3QgYW5k
IGl0IGlzIHJvdWdobHkgMn41JQ0KICAgIHBlcmZvcm1hbmNlIGRlZ3JhZGF0aW9uLiBXaXRoIHRo
aXMgd29ya2Fyb3VuZCwgcGVyZm9ybWFuY2UgaXMgY29tcGxldGVseQ0KICAgIHJlc3RvcmVkLg0K
ICAgIA0KICAgIFNpZ25lZC1vZmYtYnk6IEpvb25zb28gS2ltIDxhIHN0eWxlPSJjb2xvcjogcmdi
KDAsIDAsIDApOyIgaHJlZj0ibWFpbHRvOmlhbWpvb25zb28ua2ltQGxnZS5jb20iIG1vei1kby1u
b3Qtc2VuZD0idHJ1ZSI+Jmx0O2lhbWpvb25zb28ua2ltQGxnZS5jb20mZ3Q7PC9hPg0KDQpiNWQz
MjNiNWEwICBtbS92bXNjYW46IHJlc3RvcmUgYWN0aXZlL2luYWN0aXZlIHJhdGlvIGZvciBhbm9u
eW1vdXMgTFJVDQpjOGJhYWUwOGRmICBtbS9zd2FwOiBjb3VudCBhIG5ldyBhbm9ueW1vdXMgcGFn
ZSBhcyBhIHJlY2xhaW1fc3RhdGUncyByb3RhdGUNCmY0ZTI0NWMwOTQgIG1tL3dvcmtpbmdzZXQ6
IGNvdmVyLWxldHRlcg0KKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLSstLS0tLS0t
LS0tLS0rLS0tLS0tLS0tLS0tKw0KfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCBiNWQzMjNiNWEwIHwg
YzhiYWFlMDhkZiB8IGY0ZTI0NWMwOTQgfA0KKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0t
LS0tLSstLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tKw0KfCBib290X3N1Y2Nlc3NlcyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAz
MiAgICAgICAgIHwgMCAgICAgICAgICB8IDAgICAgICAgICAgfA0KfCBib290X2ZhaWx1cmVzICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAyICAgICAgICAgIHwgMTEgICAgICAgICB8IDExICAgICAgICAgfA0KfCBCVUc6a2VybmVs
X2hhbmdfaW5fZWFybHktYm9vdF9zdGFnZSxsYXN0X3ByaW50azplYXJseV9jb25zb2xlX2luX3Nl
dHVwX2NvZGUgfCAyICAgICAgICAgIHwgICAgICAgICAgICB8ICAgICAgICAgICAgfA0KfCBrZXJu
ZWxfQlVHX2F0X21tL3N3YXAuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAwICAgICAgICAgIHwgMTEgICAgICAgICB8IDExICAgICAgICAgfA0K
fCBpbnZhbGlkX29wY29kZTojWyMjXSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAwICAgICAgICAgIHwgMTEgICAgICAgICB8IDExICAgICAg
ICAgfA0KfCBFSVA6cGFnZXZlY19scnVfbW92ZV9mbiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAwICAgICAgICAgIHwgMTEgICAgICAgICB8IDEx
ICAgICAgICAgfA0KfCBLZXJuZWxfcGFuaWMtbm90X3N5bmNpbmc6RmF0YWxfZXhjZXB0aW9uICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAwICAgICAgICAgIHwgMTEgICAgICAg
ICB8IDExICAgICAgICAgfA0KKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLSstLS0t
LS0tLS0tLS0rLS0tLS0tLS0tLS0tKw0KDQpJZiB5b3UgZml4IHRoZSBpc3N1ZSwga2luZGx5IGFk
ZCBmb2xsb3dpbmcgdGFnDQpSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGEgc3R5bGU9
ImNvbG9yOiByZ2IoMCwgMCwgMCk7IiBocmVmPSJtYWlsdG86bGtwQGludGVsLmNvbSIgbW96LWRv
LW5vdC1zZW5kPSJ0cnVlIj4mbHQ7bGtwQGludGVsLmNvbSZndDs8L2E+DQoNClsgICAgNC42NTM1
NjhdIHNvZnR3YXJlIElPIFRMQjogbWFwcGVkIFttZW0gMHhiMTc3YTAwMC0weGI1NzdhMDAwXSAo
NjRNQikNClsgICAgNC42NTU3MTVdIGNsb2Nrc291cmNlOiB0c2M6IG1hc2s6IDB4ZmZmZmZmZmZm
ZmZmZmZmZiBtYXhfY3ljbGVzOiAweDI2ZDM0OWU4MjQ5LCBtYXhfaWRsZV9uczogNDQwNzk1Mjg4
MDg3IG5zDQpbICAgIDQuNjU4NDY4XSBhcG06IEJJT1MgdmVyc2lvbiAxLjIgRmxhZ3MgMHgwMyAo
RHJpdmVyIHZlcnNpb24gMS4xNmFjKQ0KWyAgICA0LjY1OTQ0Nl0gYXBtOiBvdmVycmlkZGVuIGJ5
IEFDUEkuDQpbICAgIDQuNjYyOTQ3XSAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0t
LS0NClsgICAgNC42NjM3MTBdIGtlcm5lbCBCVUcgYXQgbW0vc3dhcC5jOjIxOSE8L3A+PHAgc3R5
bGU9Im1hcmdpbjogMHB4OyBwYWRkaW5nOiAwcHg7IGNvbG9yOiByZ2IoMCwgMCwgMCk7IGxpbmUt
aGVpZ2h0OiBub3JtYWw7IGZvbnQtZmFtaWx5OiAmcXVvdDtNYWxndW4gR290aGljJnF1b3Q7LCZx
dW90O+unkeydgCDqs6DrlJUmcXVvdDs7IGZvbnQtc2l6ZTogMTBwdDsiPg0KPC9wPjxwIHN0eWxl
PSJtYXJnaW46IDBweDsgcGFkZGluZzogMHB4OyBjb2xvcjogcmdiKDAsIDAsIDApOyBsaW5lLWhl
aWdodDogbm9ybWFsOyBmb250LWZhbWlseTogJnF1b3Q7TWFsZ3VuIEdvdGhpYyZxdW90OywmcXVv
dDvrp5HsnYAg6rOg65SVJnF1b3Q7OyBmb250LXNpemU6IDEwcHQ7Ij4NCjwvcD48cCBzdHlsZT0i
bWFyZ2luOiAwcHg7IHBhZGRpbmc6IDBweDsgY29sb3I6IHJnYigwLCAwLCAwKTsgbGluZS1oZWln
aHQ6IG5vcm1hbDsgZm9udC1mYW1pbHk6ICZxdW90O01hbGd1biBHb3RoaWMmcXVvdDssJnF1b3Q7
66eR7J2AIOqzoOuUlSZxdW90OzsgZm9udC1zaXplOiAxMHB0OyI+DQo8L3A+PHAgc3R5bGU9Im1h
cmdpbjogMHB4OyBwYWRkaW5nOiAwcHg7IGNvbG9yOiByZ2IoMCwgMCwgMCk7IGxpbmUtaGVpZ2h0
OiBub3JtYWw7IGZvbnQtZmFtaWx5OiAmcXVvdDtNYWxndW4gR290aGljJnF1b3Q7LCZxdW90O+un
keydgCDqs6DrlJUmcXVvdDs7IGZvbnQtc2l6ZTogMTBwdDsiPg0KPC9wPjxwIHN0eWxlPSJtYXJn
aW46IDBweDsgcGFkZGluZzogMHB4OyBjb2xvcjogcmdiKDAsIDAsIDApOyBsaW5lLWhlaWdodDog
bm9ybWFsOyBmb250LWZhbWlseTogJnF1b3Q7TWFsZ3VuIEdvdGhpYyZxdW90OywmcXVvdDvrp5Hs
nYAg6rOg65SVJnF1b3Q7OyBmb250LXNpemU6IDEwcHQ7Ij5JdCBpcyB0aGUgbGluZSBmb3IgVk1f
QlVHX09OKCkuPC9wPjxwIHN0eWxlPSJtYXJnaW46IDBweDsgcGFkZGluZzogMHB4OyBjb2xvcjog
cmdiKDAsIDAsIDApOyBsaW5lLWhlaWdodDogbm9ybWFsOyBmb250LWZhbWlseTogJnF1b3Q7TWFs
Z3VuIEdvdGhpYyZxdW90OywmcXVvdDvrp5HsnYAg6rOg65SVJnF1b3Q7OyBmb250LXNpemU6IDEw
cHQ7Ij5JdCBjaGVja3MgaWYgYXJnIGV4aXN0cyB3aGVuIG1vdmVfZm4gPT0gX19wYWdldmVjX2xy
dV9hZGRfZm4uPC9wPjxwIHN0eWxlPSJtYXJnaW46IDBweDsgcGFkZGluZzogMHB4OyBjb2xvcjog
cmdiKDAsIDAsIDApOyBsaW5lLWhlaWdodDogbm9ybWFsOyBmb250LWZhbWlseTogJnF1b3Q7TWFs
Z3VuIEdvdGhpYyZxdW90OywmcXVvdDvrp5HsnYAg6rOg65SVJnF1b3Q7OyBmb250LXNpemU6IDEw
cHQ7Ij5JbiBjdXJyZW50IGNvZGUgKHY1LjUgb3IgbmV4dC9tYXN0ZXIpLCB0aGVyZSBpcyBubyBj
b2RlIHRvIGNhdXNlIHRoaXMgZXJyb3IuPC9wPjxwIHN0eWxlPSJtYXJnaW46IDBweDsgcGFkZGlu
ZzogMHB4OyBjb2xvcjogcmdiKDAsIDAsIDApOyBsaW5lLWhlaWdodDogbm9ybWFsOyBmb250LWZh
bWlseTogJnF1b3Q7TWFsZ3VuIEdvdGhpYyZxdW90OywmcXVvdDvrp5HsnYAg6rOg65SVJnF1b3Q7
OyBmb250LXNpemU6IDEwcHQ7Ij5JIHN1c3BlY3QgdGhhdCBzb21lIG9mIG1lcmdlZCBicmFuY2gg
b24geW91ciB0ZXN0IGhhcyB0aGUgY29kZSB0byBhZGQgdGhlIGFyZzwvcD48cCBzdHlsZT0ibWFy
Z2luOiAwcHg7IHBhZGRpbmc6IDBweDsgY29sb3I6IHJnYigwLCAwLCAwKTsgbGluZS1oZWlnaHQ6
IG5vcm1hbDsgZm9udC1mYW1pbHk6ICZxdW90O01hbGd1biBHb3RoaWMmcXVvdDssJnF1b3Q766eR
7J2AIOqzoOuUlSZxdW90OzsgZm9udC1zaXplOiAxMHB0OyI+aW4gdGhpcyBjYXNlLiBUbyBjaGVj
ayBpdCwgY291bGQgeW91IHNoYXJlIHRoZSBnaXQgYnJhbmNoIGFkZHJlc3Mgb3IgdGhlIHdob2xl
IHNvdXJjZTwvcD48cCBzdHlsZT0ibWFyZ2luOiAwcHg7IHBhZGRpbmc6IDBweDsgY29sb3I6IHJn
YigwLCAwLCAwKTsgbGluZS1oZWlnaHQ6IG5vcm1hbDsgZm9udC1mYW1pbHk6ICZxdW90O01hbGd1
biBHb3RoaWMmcXVvdDssJnF1b3Q766eR7J2AIOqzoOuUlSZxdW90OzsgZm9udC1zaXplOiAxMHB0
OyI+YWJvdXQgdGhpcyB0ZXN0PzwvcD48L3ByZT4NCiAgICAgICAgPC9ibG9ja3F1b3RlPg0KICAg
ICAgICA8YnI+DQogICAgICAgIEhpIEpvb25zb28sPGJyPg0KICAgICAgICA8YnI+DQogICAgICAg
IFdlIHdpbGwgdmFsaWRhdGUgdGhlIGJhZCBicmFuY2ggYWdhaW4gc2VwYXJhdGVseSBvbmNlIHdl
IGZvdW5kIGENCiAgICAgICAgbmV3IGlzc3VlLCBhbmQgdGhpcyBpc3N1ZSBjYW4gYmUgcmVwcm9k
dWNlZCBpbiB0aGlzIGJyYW5jaC48YnI+DQogICAgICAgIDxwcmUgc3R5bGU9IndoaXRlLXNwYWNl
OiBwcmUtd3JhcDsgLW1zLXdvcmQtYnJlYWs6IGtlZXAtYWxsOyAtbXMtd29yZC13cmFwOiBicmVh
ay13b3JkOyBvdmVyZmxvdy13cmFwOiBicmVhay13b3JkOyI+PHA+ICA8YSBzdHlsZT0iY29sb3I6
IHJnYigwLCAwLCAwKTsiIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9Kb29uc29vS2ltL2xpbnV4
LmdpdCIgbW96LWRvLW5vdC1zZW5kPSJ0cnVlIj5odHRwczovL2dpdGh1Yi5jb20vSm9vbnNvb0tp
bS9saW51eC5naXQ8L2E+IGltcHJvdmUtYW5vbnltb3VzLWxydS1tYW5hZ2VtZW50LXYxLjAwLXY1
LjUNCg0KRG8geW91IG1lYW4gdGhlcmUgaXMgYW5vdGhlciBicmFuY2ggdHJpZ2dlcmVkIHRoaXMg
aXNzdWU/DQo8L3A+PHA+DQo8L3A+PHA+LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS08L3A+PHA+DQo8L3A+PHA+WWVz
LCBJIHRoaW5rIHRoYXQgYW5vdGhlciBicmFuY2ggY3JlYXRlIGEgZnVuY3Rpb25hbCBjb25mbGlj
dCB0byBteSBicmFuY2guPC9wPjxwPg0KPC9wPjxwPkkgZm91bmQgZm9sbG93aW5nIGJpc2VjdCBs
b2cgaW4gdGhlIGZpcnN0IHJlcG9ydC48L3A+PHA+DQo8L3A+PHA+Z2l0IGJpc2VjdCBzdGFydCA5
NDNkNjUxMDk5MGM3OTU4YTIzYzFiNWU0Njk4MmQ3OGQxNDEwMmIwIGJiNmQzZmIzNTRjNWVlOGQ2
YmRlMmQ1NzZlYjcyMjBlYTA5ODYyYjkgLS0NCmdpdCBiaXNlY3QgIGJhZCA4NjdjYWUwOGRiOGEz
OTA1NGI4YTJhZmYyNjNmM2VlZWVlODI2MDQxICAjIDEzOjEyICBCICAgICAgMCAgICAxMSAgIDI3
ICAgMCAgTWVyZ2UgJ2xpbnV4LXJldmlldy9NaWNoYWVsLVN0cmF1YmUvc3RhZ2luZy1ydGw4MTg4
ZXUtcmVtb3ZlLXVubmVjZXNzYXJ5LVJFVFVSTi1sYWJlbC8yMDIwMDIwOC0wMDM1NDInIGludG8g
ZGV2ZWwtaG91cmx5LTIwMjAwMjEyMDYNCmdpdCBiaXNlY3QgIGJhZCAxZjE5YjFkMTVkNGJkNzQy
OTViYzBhOWNjNzA5NjZkNDM0MTQ4Y2I3ICAjIDEzOjEyICBCICAgICAgMCAgICAxMSAgIDI3ICAg
MCAgTWVyZ2UgJ2xpbnV4LXJldmlldy9DaHVhbmhvbmctR3VvL210ZC1uYW5kLXNwaS1yZXdvcmst
ZGV0ZWN0LXByb2NlZHVyZS1mb3ItZGlmZmVyZW50LXJlYWQtaWQtb3AvMjAyMDAyMTEtMTA0NjQx
JyBpbnRvIGRldmVsLWhvdXJseS0yMDIwMDIxMjA2DQpnaXQgYmlzZWN0ICBiYWQgMTdjYWI0ZjA2
YWNmMjQ2MWY4NzFiYzc0ZmNjMzk2NTIwMDQyYjQxMyAgIyAxMzoxMiAgQiAgICAgIDAgICAgMTAg
ICAyNyAgIDEgIE1lcmdlICdsaW51eC1yZXZpZXcvQmVuamFtaW4tR2FpZ25hcmQvZHQtYmluZGlu
Z3MtdG91Y2hzY3JlZW4tQ29udmVydC1lZHQtZnQ1eDA2LXRvLWpzb24tc2NoZW1hLzIwMjAwMjEw
LTE2MDQzMicgaW50byBkZXZlbC1ob3VybHktMjAyMDAyMTIwNg0KZ2l0IGJpc2VjdCBnb29kIGM3
MTI3ZjZkMWExODUwMWFmZDA5MWFlZjg5Yjk2NGI1MDJlN2ZmMzQgICMgMTM6MTIgIEcgICAgIDEx
ICAgICAwICAgIDAgICAwICBNZXJnZSAna3JheGVsL3JhZGVvbmZiLWxvZ2dpbmcnIGludG8gZGV2
ZWwtaG91cmx5LTIwMjAwMjEyMDYNCmdpdCBiaXNlY3QgIGJhZCA5OTkyNTk1NzRhYWJkNjU3OGJm
M2UwNzFjMTFjM2IzNmYzOTdkMGY5ICAjIDEzOjEzICBCICAgICAgMCAgICAxMSAgIDI3ICAgMCAg
TWVyZ2UgJ2xpbnV4LXJldmlldy9VUERBVEUtMjAyMDAyMTAtMTg1OTQ4L0Zsb3JpYW4tV2VzdHBo
YWwvbmV0ZmlsdGVyLWZsb3d0YWJsZS1hbHdheXMtaW5pdC1ibG9ja19vZmZsb2FkLXN0cnVjdC8y
MDIwMDIwNC0wNTExNDknIGludG8gZGV2ZWwtaG91cmx5LTIwMjAwMjEyMDYNCmdpdCBiaXNlY3Qg
IGJhZCBhY2ExNzBjODkxNjJmYzhjNDdiNmZiMDU2N2MxYThhZWUzYmEzODFkICAjIDEzOjEzICBC
ICAgICAgMCAgICAxMSAgIDI3ICAgMCAgTWVyZ2UgJ2pvb25zb28ta2ltL2ltcHJvdmUtYW5vbnlt
b3VzLWxydS1tYW5hZ2VtZW50LXYxLjAwLXY1LjUnIGludG8gZGV2ZWwtaG91cmx5LTIwMjAwMjEy
MDY8L3A+PHA+DQo8L3A+PHA+VGhlcmUgYXJlIG1hbnkgIk1lcmdlICdYWFhYJyIgY29tbWl0IGFu
ZCBpdCA8c3BhbiBzdHlsZT0iY29sb3I6IHJnYigwLCAwLCAwKTsgZm9udC1mYW1pbHk6ICZxdW90
O01hbGd1biBHb3RoaWMmcXVvdDssJnF1b3Q766eR7J2AIOqzoOuUlSZxdW90OzsgZm9udC1zaXpl
OiAxMHB0OyI+bG9va3MgbGlrZSB0aGF0IHlvdXIgemVybyBkYXkgYm90J3M8L3NwYW4+PHNwYW4g
c3R5bGU9ImNvbG9yOiByZ2IoMCwgMCwgMCk7IGZvbnQtZmFtaWx5OiAmcXVvdDtNYWxndW4gR290
aGljJnF1b3Q7LCZxdW90O+unkeydgCDqs6DrlJUmcXVvdDs7IGZvbnQtc2l6ZTogMTBwdDsiPiBi
cmFuY2ggaW5jbHVkZXMgbWFueSBvdXQtb2YtbWFpbmxpbmUtdHJlZSBicmFuY2guPC9zcGFuPjwv
cD48cD48c3BhbiBzdHlsZT0iY29sb3I6IHJnYigwLCAwLCAwKTsgZm9udC1mYW1pbHk6ICZxdW90
O01hbGd1biBHb3RoaWMmcXVvdDssJnF1b3Q766eR7J2AIOqzoOuUlSZxdW90OzsgZm9udC1zaXpl
OiAxMHB0OyI+VGhleSBjYW4gYmUgbWFpbnRhaW5lcidzIGJyYW5jaGVzIG9yIG90aGVyIGZlYXR1
cmUgYnJhbmNoZXMgbGlrZSBtaW5lLjwvc3Bhbj48L3A+PHA+PHNwYW4gc3R5bGU9ImNvbG9yOiBy
Z2IoMCwgMCwgMCk7IGZvbnQtZmFtaWx5OiAmcXVvdDtNYWxndW4gR290aGljJnF1b3Q7LCZxdW90
O+unkeydgCDqs6DrlJUmcXVvdDs7IGZvbnQtc2l6ZTogMTBwdDsiPklmIHlvdXIgdGVzdCBicmFu
Y2ggaW5jbHVkZXMgYW5vdGhlciBicmFuY2gsIGl0IGNvdWxkIGNyZWF0ZSBhIGZ1bmN0aW9uYWwg
Y29uZmxpY3QgdG8gbXkgYnJhbmNoLjwvc3Bhbj48L3A+PHA+PHNwYW4gc3R5bGU9ImNvbG9yOiBy
Z2IoMCwgMCwgMCk7IGZvbnQtZmFtaWx5OiAmcXVvdDtNYWxndW4gR290aGljJnF1b3Q7LCZxdW90
O+unkeydgCDqs6DrlJUmcXVvdDs7IGZvbnQtc2l6ZTogMTBwdDsiPlNvLCBJJ2QgbGlrZSB0byBj
aGVjayB0aGUgc291cmNlIGNvZGUuIENvdWxkIHlvdSBzaGFyZSB0aGUgd2hvbGUgc291cmNlIGNv
ZGUgZm9yIGJhZCBiaXNlY3Q/PC9zcGFuPjwvcD48cD48c3BhbiBzdHlsZT0iY29sb3I6IHJnYigw
LCAwLCAwKTsgZm9udC1mYW1pbHk6ICZxdW90O01hbGd1biBHb3RoaWMmcXVvdDssJnF1b3Q766eR
7J2AIOqzoOuUlSZxdW90OzsgZm9udC1zaXplOiAxMHB0OyI+Rm9yIGV4YW1wbGUsIHRoZSB3aG9s
ZSBzb3VyY2UgdHJlZSBmb3IgdGhpcyA8Zm9udCBmYWNlPSJDb3VyaWVyIE5ldyI+YWNhMTcwYzg5
MTYyZmM4YzQ3YjZmYjA1NjdjMWE4YWVlM2JhMzgxZDwvZm9udD48Zm9udCBmYWNlPSJDb3VyaWVy
IE5ldyI+IGNvbW1pdC48L2ZvbnQ+PC9zcGFuPjwvcD48L3ByZT4NCiAgICAgIDwvZGl2Pg0KICAg
IDwvYmxvY2txdW90ZT4NCiAgICA8YnI+DQogICAgPGZvbnQgZmFjZT0iQ291cmllciBOZXciPkhp
IEpvb25zb28sPGJyPg0KICAgICAgPGJyPg0KICAgICAgVGhlIHNvdXJjZSBjb2RlIGlzIGluIG91
ciBpbnRlcm5hbCBzZXJ2ZXIsIEknbSBhZnJhaWQgSSBjYW4ndCBtYWtlDQogICAgICBpdCBwdWJs
aWMuIDxicj4NCiAgICAgIHdlIGp1c3QgZm91bmQgYW5vdGhlciBicmFuY2ggd2hpY2ggYWxzbyBw
b2ludHMgdG8gdGhpcyBpc3N1ZTo8YnI+DQogICAgICDCoMKgIDwvZm9udD48Zm9udCBmYWNlPSJD
b3VyaWVyIE5ldyI+PGENCmhyZWY9Imh0dHBzOi8vbGlzdHMuMDEub3JnL2h5cGVya2l0dHkvbGlz
dC9sa3BAbGlzdHMuMDEub3JnL3RocmVhZC9PTDVIMjdETDY2RlZWNUZRUEhNNENQTFo2RVNKNkJP
Qy8iPmh0dHBzOi8vbGlzdHMuMDEub3JnL2h5cGVya2l0dHkvbGlzdC9sa3BAbGlzdHMuMDEub3Jn
L3RocmVhZC9PTDVIMjdETDY2RlZWNUZRUEhNNENQTFo2RVNKNkJPQy88L2E+DQogICAgICA8YnI+
DQogICAgICA8YnI+DQogICAgICBDb3VsZCB5b3UgdGFrZSBhIGxvb2sgYXQgaXQ/PGJyPg0KICAg
ICAgPGJyPg0KICAgICAgQmVzdCBSZWdhcmRzLDxicj4NCiAgICAgIFJvbmcgQ2hlbjxicj4NCiAg
ICAgIDxicj4NCiAgICAgIDxicj4NCiAgICA8L2ZvbnQ+DQogICAgPGJsb2NrcXVvdGUgdHlwZT0i
Y2l0ZSINCmNpdGU9Im1pZDpPRjk2QzEwRDNCLjIwMUE0MTFFLU9ONDkyNTg1MTEuMDAyMkExMDgt
NDkyNTg1MTEuMDAyMkExMEJAbGdlLmNvbSI+DQogICAgICA8ZGl2IHN0eWxlPSJtYXJnaW46IDBw
eDsgcGFkZGluZzogMHB4OyBjb2xvcjogcmdiKDAsIDAsIDApOw0KICAgICAgICBmb250LWZhbWls
eTogJnF1b3Q7TWFsZ3VuIEdvdGhpYyZxdW90OywmcXVvdDvrp5HsnYAg6rOg65SVJnF1b3Q7Ow0K
ICAgICAgICBmb250LXNpemU6IDEwcHQ7Ij4NCiAgICAgICAgPHByZSBzdHlsZT0id2hpdGUtc3Bh
Y2U6IHByZS13cmFwOyAtbXMtd29yZC1icmVhazoga2VlcC1hbGw7IC1tcy13b3JkLXdyYXA6IGJy
ZWFrLXdvcmQ7IG92ZXJmbG93LXdyYXA6IGJyZWFrLXdvcmQ7Ij48cD4NCjwvcD48cD5UaGFua3Mu
PC9wPjwvcHJlPg0KICAgICAgICA8cD48YnI+DQogICAgICAgIDwvcD4NCiAgICAgIDwvZGl2Pg0K
ICAgIDwvYmxvY2txdW90ZT4NCiAgICA8YnI+DQogIDwvYm9keT4NCjwvaHRtbD4NCg==

--===============5414738475801716064==--

