Content-Type: multipart/mixed; boundary="===============2440908787752162818=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm, oom] 6209f6fc62: general_protection_fault:#[##]
Date: Tue, 25 Sep 2018 16:09:27 +0800
Message-ID: <2fe393f8-663f-21c8-34ae-5afeb44d8b6c@intel.com>
In-Reply-To: <20180925075939.GP18685@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============2440908787752162818==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 09/25/2018 03:59 PM, Michal Hocko wrote:
> On Tue 25-09-18 15:43:22, Rong Chen wrote:
>>
>> On 09/25/2018 03:31 PM, Michal Hocko wrote:
>>> On Tue 25-09-18 15:00:15, Rong Chen wrote:
>>>> On 09/25/2018 02:06 PM, Michal Hocko wrote:
>>>>> On Tue 25-09-18 13:48:20, kernel test robot wrote:
>>>>>> FYI, we noticed the following commit (built with gcc-7):
>>>>>>
>>>>>> commit: 6209f6fc62835d84c2a92d237588a114e39436ce ("mm, oom: rework m=
map_exit vs. oom_reaper synchronization")
>>>>>> https://github.com/0day-ci/linux UPDATE-20180911-024633/Tetsuo-Handa=
/mm-oom-Fix-unnecessary-killing-of-additional-processes/20180910-163452
>>>>> Do you have a msg-id to the patch that has been tested?
>>>> message_id: 20180910125513.311-2-mhocko(a)kernel.org
>>> Thanks! It woudl be really great if this was a part of the report when
>>> testing patches which are not mainline yet.
>>>
>>> This patch resulting in a crash is quite surprising. The patch is RFC
>>> and not tested yet but I will definitely have a look. Could you help me
>>> some more and give faddr2line __oom_reap_task_mm+0x40 please?
>> $ faddr2line ./vmlinux __oom_reap_task_mm+0x40
>> __oom_reap_task_mm+0x40/0x175:
>> can_madv_dontneed_vma at mm/internal.h:48
>>  =C2=A0(inlined by) __oom_reap_task_mm at mm/oom_kill.c:505
> OK, this suggests the vma is gone. The problem is that I have removed
> MMF_OOM_SKIP from the exit path and mm->mmap still points to the freed
> memory. Later patch in the series does the later so the resulting code
> is safe but not bisect safe. I will return MMF_OOM_SKIP setting to the
> exit_mmap path and that should cure the issue.

Thanks for the explanation, that's great!

Best Regards,
Rong Chen

--===============2440908787752162818==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRl
bnQ9InRleHQvaHRtbDsgY2hhcnNldD11dGYtOCI+CiAgPC9oZWFkPgogIDxib2R5IHRleHQ9IiMw
MDAwMDAiIGJnY29sb3I9IiNGRkZGRkYiPgogICAgPHA+PGJyPgogICAgPC9wPgogICAgPGJyPgog
ICAgPGRpdiBjbGFzcz0ibW96LWNpdGUtcHJlZml4Ij5PbiAwOS8yNS8yMDE4IDAzOjU5IFBNLCBN
aWNoYWwgSG9ja28KICAgICAgd3JvdGU6PGJyPgogICAgPC9kaXY+CiAgICA8YmxvY2txdW90ZSB0
eXBlPSJjaXRlIgogICAgICBjaXRlPSJtaWQ6MjAxODA5MjUwNzU5MzkuR1AxODY4NUBkaGNwMjIu
c3VzZS5jeiI+CiAgICAgIDxwcmUgd3JhcD0iIj5PbiBUdWUgMjUtMDktMTggMTU6NDM6MjIsIFJv
bmcgQ2hlbiB3cm90ZToKPC9wcmU+CiAgICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPgogICAg
ICAgIDxwcmUgd3JhcD0iIj4KCk9uIDA5LzI1LzIwMTggMDM6MzEgUE0sIE1pY2hhbCBIb2NrbyB3
cm90ZToKPC9wcmU+CiAgICAgICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+CiAgICAgICAgICA8
cHJlIHdyYXA9IiI+T24gVHVlIDI1LTA5LTE4IDE1OjAwOjE1LCBSb25nIENoZW4gd3JvdGU6Cjwv
cHJlPgogICAgICAgICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+CiAgICAgICAgICAgIDxwcmUg
d3JhcD0iIj4KT24gMDkvMjUvMjAxOCAwMjowNiBQTSwgTWljaGFsIEhvY2tvIHdyb3RlOgo8L3By
ZT4KICAgICAgICAgICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+CiAgICAgICAgICAgICAgPHBy
ZSB3cmFwPSIiPk9uIFR1ZSAyNS0wOS0xOCAxMzo0ODoyMCwga2VybmVsIHRlc3Qgcm9ib3Qgd3Jv
dGU6CjwvcHJlPgogICAgICAgICAgICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPgogICAgICAg
ICAgICAgICAgPHByZSB3cmFwPSIiPkZZSSwgd2Ugbm90aWNlZCB0aGUgZm9sbG93aW5nIGNvbW1p
dCAoYnVpbHQgd2l0aCBnY2MtNyk6Cgpjb21taXQ6IDYyMDlmNmZjNjI4MzVkODRjMmE5MmQyMzc1
ODhhMTE0ZTM5NDM2Y2UgKCJtbSwgb29tOiByZXdvcmsgbW1hcF9leGl0IHZzLiBvb21fcmVhcGVy
IHN5bmNocm9uaXphdGlvbiIpCjxhIGNsYXNzPSJtb3otdHh0LWxpbmstZnJlZXRleHQiIGhyZWY9
Imh0dHBzOi8vZ2l0aHViLmNvbS8wZGF5LWNpL2xpbnV4Ij5odHRwczovL2dpdGh1Yi5jb20vMGRh
eS1jaS9saW51eDwvYT4gVVBEQVRFLTIwMTgwOTExLTAyNDYzMy9UZXRzdW8tSGFuZGEvbW0tb29t
LUZpeC11bm5lY2Vzc2FyeS1raWxsaW5nLW9mLWFkZGl0aW9uYWwtcHJvY2Vzc2VzLzIwMTgwOTEw
LTE2MzQ1Mgo8L3ByZT4KICAgICAgICAgICAgICA8L2Jsb2NrcXVvdGU+CiAgICAgICAgICAgICAg
PHByZSB3cmFwPSIiPkRvIHlvdSBoYXZlIGEgbXNnLWlkIHRvIHRoZSBwYXRjaCB0aGF0IGhhcyBi
ZWVuIHRlc3RlZD8KPC9wcmU+CiAgICAgICAgICAgIDwvYmxvY2txdW90ZT4KICAgICAgICAgICAg
PHByZSB3cmFwPSIiPm1lc3NhZ2VfaWQ6IDxhIGNsYXNzPSJtb3otdHh0LWxpbmstYWJicmV2aWF0
ZWQiIGhyZWY9Im1haWx0bzoyMDE4MDkxMDEyNTUxMy4zMTEtMi1taG9ja29Aa2VybmVsLm9yZyI+
MjAxODA5MTAxMjU1MTMuMzExLTItbWhvY2tvQGtlcm5lbC5vcmc8L2E+CjwvcHJlPgogICAgICAg
ICAgPC9ibG9ja3F1b3RlPgogICAgICAgICAgPHByZSB3cmFwPSIiPlRoYW5rcyEgSXQgd291ZGwg
YmUgcmVhbGx5IGdyZWF0IGlmIHRoaXMgd2FzIGEgcGFydCBvZiB0aGUgcmVwb3J0IHdoZW4KdGVz
dGluZyBwYXRjaGVzIHdoaWNoIGFyZSBub3QgbWFpbmxpbmUgeWV0LgoKVGhpcyBwYXRjaCByZXN1
bHRpbmcgaW4gYSBjcmFzaCBpcyBxdWl0ZSBzdXJwcmlzaW5nLiBUaGUgcGF0Y2ggaXMgUkZDCmFu
ZCBub3QgdGVzdGVkIHlldCBidXQgSSB3aWxsIGRlZmluaXRlbHkgaGF2ZSBhIGxvb2suIENvdWxk
IHlvdSBoZWxwIG1lCnNvbWUgbW9yZSBhbmQgZ2l2ZSBmYWRkcjJsaW5lIF9fb29tX3JlYXBfdGFz
a19tbSsweDQwIHBsZWFzZT8KPC9wcmU+CiAgICAgICAgPC9ibG9ja3F1b3RlPgogICAgICAgIDxw
cmUgd3JhcD0iIj4kIGZhZGRyMmxpbmUgLi92bWxpbnV4IF9fb29tX3JlYXBfdGFza19tbSsweDQw
Cl9fb29tX3JlYXBfdGFza19tbSsweDQwLzB4MTc1OgpjYW5fbWFkdl9kb250bmVlZF92bWEgYXQg
bW0vaW50ZXJuYWwuaDo0OArCoChpbmxpbmVkIGJ5KSBfX29vbV9yZWFwX3Rhc2tfbW0gYXQgbW0v
b29tX2tpbGwuYzo1MDUKPC9wcmU+CiAgICAgIDwvYmxvY2txdW90ZT4KICAgICAgPHByZSB3cmFw
PSIiPgpPSywgdGhpcyBzdWdnZXN0cyB0aGUgdm1hIGlzIGdvbmUuIFRoZSBwcm9ibGVtIGlzIHRo
YXQgSSBoYXZlIHJlbW92ZWQKTU1GX09PTV9TS0lQIGZyb20gdGhlIGV4aXQgcGF0aCBhbmQgbW0t
Jmd0O21tYXAgc3RpbGwgcG9pbnRzIHRvIHRoZSBmcmVlZAptZW1vcnkuIExhdGVyIHBhdGNoIGlu
IHRoZSBzZXJpZXMgZG9lcyB0aGUgbGF0ZXIgc28gdGhlIHJlc3VsdGluZyBjb2RlCmlzIHNhZmUg
YnV0IG5vdCBiaXNlY3Qgc2FmZS4gSSB3aWxsIHJldHVybiBNTUZfT09NX1NLSVAgc2V0dGluZyB0
byB0aGUKZXhpdF9tbWFwIHBhdGggYW5kIHRoYXQgc2hvdWxkIGN1cmUgdGhlIGlzc3VlLgo8L3By
ZT4KICAgIDwvYmxvY2txdW90ZT4KICAgIDxicj4KICAgIDxzcGFuIGlkPSJ3XzEwIiBjbGFzcz0i
Ij5UaGFua3MgPC9zcGFuPjxzcGFuIGlkPSJ3XzExIiBjbGFzcz0iIj5mb3IKICAgIDwvc3Bhbj48
c3BhbiBpZD0id18xMiIgY2xhc3M9IiI+dGhlIDwvc3Bhbj48c3BhbiBpZD0id18xMyIgY2xhc3M9
IiI+ZXhwbGFuYXRpb24sCiAgICAgIHRoYXQncyBncmVhdCE8YnI+CiAgICAgIDxicj4KICAgICAg
QmVzdCBSZWdhcmRzLDxicj4KICAgICAgUm9uZyBDaGVuPGJyPgogICAgPC9zcGFuPgogIDwvYm9k
eT4KPC9odG1sPgo=

--===============2440908787752162818==--

