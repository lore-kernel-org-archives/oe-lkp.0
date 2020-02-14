Content-Type: multipart/mixed; boundary="===============6713347277851631736=="
MIME-Version: 1.0
From: Chen, Rong A <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: c8baae08df ("mm/swap: count a new anonymous page as a .."): [ 4.663710] kernel BUG at mm/swap.c:219!
Date: Fri, 14 Feb 2020 21:02:26 +0800
Message-ID: <495df309-322b-93a0-e178-cf3dc5916606@intel.com>
In-Reply-To: <OF30BE593C.15AE915B-ON4925850E.000D4032-4925850E.000D4034@lge.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6713347277851631736==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 2/14/2020 10:24 AM, =EA=B9=80=EC=A4=80=EC=88=98 wrote:
>
> Hello, LKP.
>
> See below and sorry for inconveniece due to mail client formatting.
>
> =EF=BB=BF
>
> ---------- Original Message ----------
>
> From : kernel test robot <lkp@intel.com>
> To : =EA=B9=80=EC=A4=80=EC=88=98 =EC=B1=85=EC=9E=84=EC=97=B0=EA=B5=AC=EC=
=9B=90(iamjoonsoo.kim)
> Cc : LKP <lkp@lists.01.org>
> Date : 2020/02/13 20:37:00 [GMT+09:00]
> Subject : c8baae08df ("mm/swap: count a new anonymous page as a .."): =

> [ 4.663710] kernel BUG at mm/swap.c:219!
>
>
> Greetings, 0day kernel testing robot got the below dmesg and the first =

> bad commit is https://github.com/JoonsooKim/linux.git =

> improve-anonymous-lru-management-v1.00-v5.5 commit =

> c8baae08dfbff1855f3981de3f09a927c0c01736 Author: Joonsoo Kim =

> <iamjoonsoo.kim@lge.com> AuthorDate: Tue Jan 7 10:53:42 2020 +0900 =

> Commit: Joonsoo Kim <iamjoonsoo.kim@lge.com> CommitDate: Tue Feb 11 =

> 14:52:12 2020 +0900 mm/swap: count a new anonymous page as a =

> reclaim_state's rotate reclaim_stat's rotate is used for controlling =

> the ratio of scanning page between file and anonymous LRU. All new =

> anonymous pages are counted for rotate before the patch, protecting =

> anonymous pages on active LRU, and, it makes that reclaim on anonymous =

> LRU is less happened than file LRU. Now, situation is changed. all new =

> anonymous pages are not added to the active LRU so rotate would be far =

> less than before. It will cause that reclaim on anonymous LRU happens =

> more and it would result in bad effect on some system that is =

> optimized for previous setting. Therefore, this patch counts a new =

> anonymous page as a reclaim_state's rotate. Although it is non-logical =

> to add this count to the reclaim_state's rotate in current algorithm, =

> reducing the regression would be more important. I found this =

> regression on kernel-build test and it is roughly 2~5% performance =

> degradation. With this workaround, performance is completely restored. =

> Signed-off-by: Joonsoo Kim <iamjoonsoo.kim@lge.com> b5d323b5a0 =

> mm/vmscan: restore active/inactive ratio for anonymous LRU c8baae08df =

> mm/swap: count a new anonymous page as a reclaim_state's rotate =

> f4e245c094 mm/workingset: cover-letter =

> +------------------------------------------------------------------------=
-----+------------+------------+------------+ =

> | | b5d323b5a0 | c8baae08df | f4e245c094 | =

> +------------------------------------------------------------------------=
-----+------------+------------+------------+ =

> | boot_successes | 32 | 0 | 0 | | boot_failures | 2 | 11 | 11 | | =

> BUG:kernel_hang_in_early-boot_stage,last_printk:early_console_in_setup_co=
de =

> | 2 | | | | kernel_BUG_at_mm/swap.c | 0 | 11 | 11 | | =

> invalid_opcode:#[##] | 0 | 11 | 11 | | EIP:pagevec_lru_move_fn | 0 | =

> 11 | 11 | | Kernel_panic-not_syncing:Fatal_exception | 0 | 11 | 11 | =

> +------------------------------------------------------------------------=
-----+------------+------------+------------+ =

> If you fix the issue, kindly add following tag Reported-by: kernel =

> test robot <lkp@intel.com> [ 4.653568] software IO TLB: mapped [mem =

> 0xb177a000-0xb577a000] (64MB) [ 4.655715] clocksource: tsc: mask: =

> 0xffffffffffffffff max_cycles: 0x26d349e8249, max_idle_ns: =

> 440795288087 ns [ 4.658468] apm: BIOS version 1.2 Flags 0x03 (Driver =

> version 1.16ac) [ 4.659446] apm: overridden by ACPI. [ 4.662947] =

> ------------[ cut here ]------------ [ 4.663710] kernel BUG at =

> mm/swap.c:219!
>
> It is the line for VM_BUG_ON().
>
> It checks if arg exists when move_fn =3D=3D __pagevec_lru_add_fn.
>
> In current code (v5.5 or next/master), there is no code to cause this =

> error.
>
> I suspect that some of merged branch on your test has the code to add =

> the arg
>
> in this case. To check it, could you share the git branch address or =

> the whole source
>
> about this test?
>

Hi Joonsoo,

We will validate the bad branch again separately once we found a new =

issue, and this issue can be reproduced in this branch.

   https://github.com/JoonsooKim/linux.git improve-anonymous-lru-management=
-v1.00-v5.5

Do you mean there is another branch triggered this issue?

Best Regards,
Rong CHen

> Anyway, I will re-implement this patch to avoid this conflict.
>
> Thanks.
>
>
>
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org


--===============6713347277851631736==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRl
bnQ9InRleHQvaHRtbDsgY2hhcnNldD1VVEYtOCI+CiAgPC9oZWFkPgogIDxib2R5PgogICAgPGJy
PgogICAgPGJyPgogICAgPGRpdiBjbGFzcz0ibW96LWNpdGUtcHJlZml4Ij5PbiAyLzE0LzIwMjAg
MTA6MjQgQU0sIOq5gOykgOyImCB3cm90ZTo8YnI+CiAgICA8L2Rpdj4KICAgIDxibG9ja3F1b3Rl
IHR5cGU9ImNpdGUiCmNpdGU9Im1pZDpPRjMwQkU1OTNDLjE1QUU5MTVCLU9ONDkyNTg1MEUuMDAw
RDQwMzItNDkyNTg1MEUuMDAwRDQwMzRAbGdlLmNvbSI+CiAgICAgIDxtZXRhIGh0dHAtZXF1aXY9
IkNvbnRlbnQtVHlwZSIgY29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PVVURi04Ij4KICAgICAg
PHN0eWxlPnAge21hcmdpbjowO3BhZGRpbmc6MDt9IGJvZHksIHRkLCBidXR0b24sIHAgeyBjb2xv
cjojMDAwMDAwOyBmb250LXNpemU6MTBwdDsgZm9udC1mYW1pbHk6J01hbGd1biBHb3RoaWMnLCfr
p5HsnYAg6rOg65SVJzsgbGluZS1oZWlnaHQ6bm9ybWFsOyB9IGEsIGE6aG92ZXIsIGE6bGluaywg
YTphY3RpdmUsIGE6dmlzaXRlZCB7IGNvbG9yOiMwMDAwMDA7IH08L3N0eWxlPgogICAgICA8cD5I
ZWxsbywgTEtQLjwvcD4KICAgICAgPHA+U2VlIGJlbG93IGFuZCBzb3JyeSBmb3IgaW5jb252ZW5p
ZWNlIGR1ZSB0byBtYWlsIGNsaWVudAogICAgICAgIGZvcm1hdHRpbmcuPC9wPgogICAgICA8cD7v
u788YnI+CiAgICAgIDwvcD4KICAgICAgPHAgc3R5bGU9ImZvbnQtc2l6ZTogMTBwdDsiPi0tLS0t
LS0tLS0gT3JpZ2luYWwgTWVzc2FnZSAtLS0tLS0tLS0tPGJyPgogICAgICAgIDxicj4KICAgICAg
ICBGcm9tIDoga2VybmVsIHRlc3Qgcm9ib3QgPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2
RSIgaHJlZj0ibWFpbHRvOmxrcEBpbnRlbC5jb20iPiZsdDtsa3BAaW50ZWwuY29tJmd0OzwvYT48
YnI+CiAgICAgICAgVG8gOiDquYDspIDsiJgg7LGF7J6E7Jew6rWs7JuQKGlhbWpvb25zb28ua2lt
KTxicj4KICAgICAgICBDYyA6IExLUCA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBo
cmVmPSJtYWlsdG86bGtwQGxpc3RzLjAxLm9yZyI+Jmx0O2xrcEBsaXN0cy4wMS5vcmcmZ3Q7PC9h
Pjxicj4KICAgICAgICBEYXRlIDogMjAyMC8wMi8xMyAyMDozNzowMCBbR01UKzA5OjAwXTxicj4K
ICAgICAgICBTdWJqZWN0IDogYzhiYWFlMDhkZiAoIm1tL3N3YXA6IGNvdW50IGEgbmV3IGFub255
bW91cyBwYWdlIGFzIGEKICAgICAgICAuLiIpOiBbIDQuNjYzNzEwXSBrZXJuZWwgQlVHIGF0IG1t
L3N3YXAuYzoyMTkhPGJyPgogICAgICAgIDxicj4KICAgICAgICA8YnI+CiAgICAgIDwvcD4KICAg
ICAgPHByZSBzdHlsZT0id2hpdGUtc3BhY2U6IHByZS13cmFwOyAtbXMtd29yZC1icmVhazoga2Vl
cC1hbGw7IC1tcy13b3JkLXdyYXA6IGJyZWFrLXdvcmQ7IG92ZXJmbG93LXdyYXA6IGJyZWFrLXdv
cmQ7Ij48cD5HcmVldGluZ3MsCgowZGF5IGtlcm5lbCB0ZXN0aW5nIHJvYm90IGdvdCB0aGUgYmVs
b3cgZG1lc2cgYW5kIHRoZSBmaXJzdCBiYWQgY29tbWl0IGlzCgo8YSBjbGFzcz0ibW96LXR4dC1s
aW5rLWZyZWV0ZXh0IiBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vSm9vbnNvb0tpbS9saW51eC5n
aXQiPmh0dHBzOi8vZ2l0aHViLmNvbS9Kb29uc29vS2ltL2xpbnV4LmdpdDwvYT4gaW1wcm92ZS1h
bm9ueW1vdXMtbHJ1LW1hbmFnZW1lbnQtdjEuMDAtdjUuNQoKY29tbWl0IGM4YmFhZTA4ZGZiZmYx
ODU1ZjM5ODFkZTNmMDlhOTI3YzBjMDE3MzYKQXV0aG9yOiAgICAgSm9vbnNvbyBLaW0gPGEgY2xh
c3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOmlhbWpvb25zb28ua2ltQGxn
ZS5jb20iPiZsdDtpYW1qb29uc29vLmtpbUBsZ2UuY29tJmd0OzwvYT4KQXV0aG9yRGF0ZTogVHVl
IEphbiA3IDEwOjUzOjQyIDIwMjAgKzA5MDAKQ29tbWl0OiAgICAgSm9vbnNvbyBLaW0gPGEgY2xh
c3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOmlhbWpvb25zb28ua2ltQGxn
ZS5jb20iPiZsdDtpYW1qb29uc29vLmtpbUBsZ2UuY29tJmd0OzwvYT4KQ29tbWl0RGF0ZTogVHVl
IEZlYiAxMSAxNDo1MjoxMiAyMDIwICswOTAwCgogICAgbW0vc3dhcDogY291bnQgYSBuZXcgYW5v
bnltb3VzIHBhZ2UgYXMgYSByZWNsYWltX3N0YXRlJ3Mgcm90YXRlCiAgICAKICAgIHJlY2xhaW1f
c3RhdCdzIHJvdGF0ZSBpcyB1c2VkIGZvciBjb250cm9sbGluZyB0aGUgcmF0aW8gb2Ygc2Nhbm5p
bmcgcGFnZQogICAgYmV0d2VlbiBmaWxlIGFuZCBhbm9ueW1vdXMgTFJVLiBBbGwgbmV3IGFub255
bW91cyBwYWdlcyBhcmUgY291bnRlZAogICAgZm9yIHJvdGF0ZSBiZWZvcmUgdGhlIHBhdGNoLCBw
cm90ZWN0aW5nIGFub255bW91cyBwYWdlcyBvbiBhY3RpdmUgTFJVLCBhbmQsCiAgICBpdCBtYWtl
cyB0aGF0IHJlY2xhaW0gb24gYW5vbnltb3VzIExSVSBpcyBsZXNzIGhhcHBlbmVkIHRoYW4gZmls
ZSBMUlUuCiAgICAKICAgIE5vdywgc2l0dWF0aW9uIGlzIGNoYW5nZWQuIGFsbCBuZXcgYW5vbnlt
b3VzIHBhZ2VzIGFyZSBub3QgYWRkZWQKICAgIHRvIHRoZSBhY3RpdmUgTFJVIHNvIHJvdGF0ZSB3
b3VsZCBiZSBmYXIgbGVzcyB0aGFuIGJlZm9yZS4gSXQgd2lsbCBjYXVzZQogICAgdGhhdCByZWNs
YWltIG9uIGFub255bW91cyBMUlUgaGFwcGVucyBtb3JlIGFuZCBpdCB3b3VsZCByZXN1bHQgaW4g
YmFkCiAgICBlZmZlY3Qgb24gc29tZSBzeXN0ZW0gdGhhdCBpcyBvcHRpbWl6ZWQgZm9yIHByZXZp
b3VzIHNldHRpbmcuCiAgICAKICAgIFRoZXJlZm9yZSwgdGhpcyBwYXRjaCBjb3VudHMgYSBuZXcg
YW5vbnltb3VzIHBhZ2UgYXMgYSByZWNsYWltX3N0YXRlJ3MKICAgIHJvdGF0ZS4gQWx0aG91Z2gg
aXQgaXMgbm9uLWxvZ2ljYWwgdG8gYWRkIHRoaXMgY291bnQgdG8KICAgIHRoZSByZWNsYWltX3N0
YXRlJ3Mgcm90YXRlIGluIGN1cnJlbnQgYWxnb3JpdGhtLCByZWR1Y2luZyB0aGUgcmVncmVzc2lv
bgogICAgd291bGQgYmUgbW9yZSBpbXBvcnRhbnQuCiAgICAKICAgIEkgZm91bmQgdGhpcyByZWdy
ZXNzaW9uIG9uIGtlcm5lbC1idWlsZCB0ZXN0IGFuZCBpdCBpcyByb3VnaGx5IDJ+NSUKICAgIHBl
cmZvcm1hbmNlIGRlZ3JhZGF0aW9uLiBXaXRoIHRoaXMgd29ya2Fyb3VuZCwgcGVyZm9ybWFuY2Ug
aXMgY29tcGxldGVseQogICAgcmVzdG9yZWQuCiAgICAKICAgIFNpZ25lZC1vZmYtYnk6IEpvb25z
b28gS2ltIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzppYW1q
b29uc29vLmtpbUBsZ2UuY29tIj4mbHQ7aWFtam9vbnNvby5raW1AbGdlLmNvbSZndDs8L2E+Cgpi
NWQzMjNiNWEwICBtbS92bXNjYW46IHJlc3RvcmUgYWN0aXZlL2luYWN0aXZlIHJhdGlvIGZvciBh
bm9ueW1vdXMgTFJVCmM4YmFhZTA4ZGYgIG1tL3N3YXA6IGNvdW50IGEgbmV3IGFub255bW91cyBw
YWdlIGFzIGEgcmVjbGFpbV9zdGF0ZSdzIHJvdGF0ZQpmNGUyNDVjMDk0ICBtbS93b3JraW5nc2V0
OiBjb3Zlci1sZXR0ZXIKKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLSstLS0tLS0t
LS0tLS0rLS0tLS0tLS0tLS0tKwp8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IGI1ZDMyM2I1YTAgfCBj
OGJhYWUwOGRmIHwgZjRlMjQ1YzA5NCB8CistLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0t
LS0rLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLSsKfCBib290X3N1Y2Nlc3NlcyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAzMiAg
ICAgICAgIHwgMCAgICAgICAgICB8IDAgICAgICAgICAgfAp8IGJvb3RfZmFpbHVyZXMgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
IDIgICAgICAgICAgfCAxMSAgICAgICAgIHwgMTEgICAgICAgICB8CnwgQlVHOmtlcm5lbF9oYW5n
X2luX2Vhcmx5LWJvb3Rfc3RhZ2UsbGFzdF9wcmludGs6ZWFybHlfY29uc29sZV9pbl9zZXR1cF9j
b2RlIHwgMiAgICAgICAgICB8ICAgICAgICAgICAgfCAgICAgICAgICAgIHwKfCBrZXJuZWxfQlVH
X2F0X21tL3N3YXAuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAwICAgICAgICAgIHwgMTEgICAgICAgICB8IDExICAgICAgICAgfAp8IGludmFs
aWRfb3Bjb2RlOiNbIyNdICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8IDAgICAgICAgICAgfCAxMSAgICAgICAgIHwgMTEgICAgICAgICB8Cnwg
RUlQOnBhZ2V2ZWNfbHJ1X21vdmVfZm4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgMCAgICAgICAgICB8IDExICAgICAgICAgfCAxMSAgICAgICAg
IHwKfCBLZXJuZWxfcGFuaWMtbm90X3N5bmNpbmc6RmF0YWxfZXhjZXB0aW9uICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAwICAgICAgICAgIHwgMTEgICAgICAgICB8IDExICAg
ICAgICAgfAorLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLSst
LS0tLS0tLS0tLS0rCgpJZiB5b3UgZml4IHRoZSBpc3N1ZSwga2luZGx5IGFkZCBmb2xsb3dpbmcg
dGFnClJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8YSBjbGFzcz0ibW96LXR4dC1saW5r
LXJmYzIzOTZFIiBocmVmPSJtYWlsdG86bGtwQGludGVsLmNvbSI+Jmx0O2xrcEBpbnRlbC5jb20m
Z3Q7PC9hPgoKWyAgICA0LjY1MzU2OF0gc29mdHdhcmUgSU8gVExCOiBtYXBwZWQgW21lbSAweGIx
NzdhMDAwLTB4YjU3N2EwMDBdICg2NE1CKQpbICAgIDQuNjU1NzE1XSBjbG9ja3NvdXJjZTogdHNj
OiBtYXNrOiAweGZmZmZmZmZmZmZmZmZmZmYgbWF4X2N5Y2xlczogMHgyNmQzNDllODI0OSwgbWF4
X2lkbGVfbnM6IDQ0MDc5NTI4ODA4NyBucwpbICAgIDQuNjU4NDY4XSBhcG06IEJJT1MgdmVyc2lv
biAxLjIgRmxhZ3MgMHgwMyAoRHJpdmVyIHZlcnNpb24gMS4xNmFjKQpbICAgIDQuNjU5NDQ2XSBh
cG06IG92ZXJyaWRkZW4gYnkgQUNQSS4KWyAgICA0LjY2Mjk0N10gLS0tLS0tLS0tLS0tWyBjdXQg
aGVyZSBdLS0tLS0tLS0tLS0tClsgICAgNC42NjM3MTBdIGtlcm5lbCBCVUcgYXQgbW0vc3dhcC5j
OjIxOSE8L3A+PHA+CjwvcD48cD4KPC9wPjxwPgo8L3A+PHA+CjwvcD48cD5JdCBpcyB0aGUgbGlu
ZSBmb3IgVk1fQlVHX09OKCkuPC9wPjxwPkl0IGNoZWNrcyBpZiBhcmcgZXhpc3RzIHdoZW4gbW92
ZV9mbiA9PSBfX3BhZ2V2ZWNfbHJ1X2FkZF9mbi48L3A+PHA+SW4gY3VycmVudCBjb2RlICh2NS41
IG9yIG5leHQvbWFzdGVyKSwgdGhlcmUgaXMgbm8gY29kZSB0byBjYXVzZSB0aGlzIGVycm9yLjwv
cD48cD5JIHN1c3BlY3QgdGhhdCBzb21lIG9mIG1lcmdlZCBicmFuY2ggb24geW91ciB0ZXN0IGhh
cyB0aGUgY29kZSB0byBhZGQgdGhlIGFyZzwvcD48cD5pbiB0aGlzIGNhc2UuIFRvIGNoZWNrIGl0
LCBjb3VsZCB5b3Ugc2hhcmUgdGhlIGdpdCBicmFuY2ggYWRkcmVzcyBvciB0aGUgd2hvbGUgc291
cmNlPC9wPjxwPmFib3V0IHRoaXMgdGVzdD88L3A+PC9wcmU+CiAgICA8L2Jsb2NrcXVvdGU+CiAg
ICA8YnI+CiAgICBIaSBKb29uc29vLDxicj4KICAgIDxicj4KICAgIFdlIHdpbGwgdmFsaWRhdGUg
dGhlIGJhZCBicmFuY2ggYWdhaW4gc2VwYXJhdGVseSBvbmNlIHdlIGZvdW5kIGEgbmV3CiAgICBp
c3N1ZSwgYW5kIHRoaXMgaXNzdWUgY2FuIGJlIHJlcHJvZHVjZWQgaW4gdGhpcyBicmFuY2guPGJy
PgogICAgPHByZSBzdHlsZT0id2hpdGUtc3BhY2U6IHByZS13cmFwOyAtbXMtd29yZC1icmVhazog
a2VlcC1hbGw7IC1tcy13b3JkLXdyYXA6IGJyZWFrLXdvcmQ7IG92ZXJmbG93LXdyYXA6IGJyZWFr
LXdvcmQ7Ij4gIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstZnJlZXRleHQiIGhyZWY9Imh0dHBzOi8v
Z2l0aHViLmNvbS9Kb29uc29vS2ltL2xpbnV4LmdpdCI+aHR0cHM6Ly9naXRodWIuY29tL0pvb25z
b29LaW0vbGludXguZ2l0PC9hPiBpbXByb3ZlLWFub255bW91cy1scnUtbWFuYWdlbWVudC12MS4w
MC12NS41CgpEbyB5b3UgbWVhbiB0aGVyZSBpcyBhbm90aGVyIGJyYW5jaCB0cmlnZ2VyZWQgdGhp
cyBpc3N1ZT8KCkJlc3QgUmVnYXJkcywKUm9uZyBDSGVuCgo8L3ByZT4KICAgIDxibG9ja3F1b3Rl
IHR5cGU9ImNpdGUiCmNpdGU9Im1pZDpPRjMwQkU1OTNDLjE1QUU5MTVCLU9ONDkyNTg1MEUuMDAw
RDQwMzItNDkyNTg1MEUuMDAwRDQwMzRAbGdlLmNvbSI+CiAgICAgIDxwcmUgc3R5bGU9IndoaXRl
LXNwYWNlOiBwcmUtd3JhcDsgLW1zLXdvcmQtYnJlYWs6IGtlZXAtYWxsOyAtbXMtd29yZC13cmFw
OiBicmVhay13b3JkOyBvdmVyZmxvdy13cmFwOiBicmVhay13b3JkOyI+PHA+CjwvcD48cD5Bbnl3
YXksIEkgd2lsbCByZS1pbXBsZW1lbnQgdGhpcyBwYXRjaCB0byBhdm9pZCB0aGlzIGNvbmZsaWN0
LjwvcD48cD4KPC9wPjxwPlRoYW5rcy4KPC9wPjwvcHJlPgogICAgICA8cD48YnI+CiAgICAgIDwv
cD4KICAgICAgPGJyPgogICAgICA8ZmllbGRzZXQgY2xhc3M9Im1pbWVBdHRhY2htZW50SGVhZGVy
Ij48L2ZpZWxkc2V0PgogICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxLUCBtYWlsaW5n
IGxpc3QgLS0gPGEgY2xhc3M9Im1vei10eHQtbGluay1hYmJyZXZpYXRlZCIgaHJlZj0ibWFpbHRv
OmxrcEBsaXN0cy4wMS5vcmciPmxrcEBsaXN0cy4wMS5vcmc8L2E+ClRvIHVuc3Vic2NyaWJlIHNl
bmQgYW4gZW1haWwgdG8gPGEgY2xhc3M9Im1vei10eHQtbGluay1hYmJyZXZpYXRlZCIgaHJlZj0i
bWFpbHRvOmxrcC1sZWF2ZUBsaXN0cy4wMS5vcmciPmxrcC1sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+
CjwvcHJlPgogICAgPC9ibG9ja3F1b3RlPgogICAgPGJyPgogIDwvYm9keT4KPC9odG1sPgo=

--===============6713347277851631736==--

