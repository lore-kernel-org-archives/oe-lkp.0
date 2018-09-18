Content-Type: multipart/mixed; boundary="===============4652353678881597219=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: 7b5b51e7b3 qemux86-64: can't read binary file (No such file or directory)
Date: Tue, 18 Sep 2018 16:57:07 +0800
Message-ID: <ef6d291d-7fc9-d53f-eb81-99605e9a2886@intel.com>
In-Reply-To: <c15bbbd7-0870-1013-16e3-837ec38f6783@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4652353678881597219==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 09/13/2018 09:00 AM, Rong Chen wrote:
>
>
>
> On 09/12/2018 07:41 PM, Andrey Konovalov wrote:
>> That commit only adds noop annotations, so this is most likely a false
>> positive. I also can't make anything out of the error log you
>> provided.
> The issue is thatthe binary paths become garbledfrom this commit,
> and it can be reproduced on 0day-ci tree inhigh probability,
> It's possible that the commit is influenced by other merged commits.
> Could you confirm it on your own tree if you have time?
>
Hi Andrey,

Any update on this?

Best Regards,
Rong Chen

>
>> On Wed, Sep 12, 2018 at 3:12 AM, Rong Chen<rong.a.chen@intel.com>  wro=
te:
>>> FYI, we noticed the following commit (built with gcc-7):
>>>
>>> commit 7b5b51e7b3a988741f7f34d5148f1f4fea86434a ("arm64: annotate user
>>> pointers casts detected by sparse")
>>>
>>> https://github.com/0day-ci/linux/commits/Andrey-Konovalov/arm64-untag-u=
ser-pointers-passed-to-the-kernel/20180831-042151
>>>
>>>
>>> in testcase: all tests
>>>
>>> caused below changes (please refer to attached stderr/dmesg.xz for enti=
re
>>> log/backtrace):
>>>
>>>    No such file or directory
>>>   : No such file or directory
>>>   : No such file or directory
>>> : : No such file or directory
>>> : : No such file or directory
>>> : =CF=AA: No such file or directory
>>> : : No such file or directory
>>> : invalid date =E2=80=98=E2=80=99
>>> =C9=95: 0: Can't open =C9=95
>>> : 0: Can't open
>>> : syntax error
>>> : : failed to set up loop device: No such file or directory
>>> : cannot stat '': No such file or directory
>>> 8: missing or unknown command
>>> n<: /dev/n<: failed to set up loop device: No such file or directory
>>> : cannot remove ''$'\037': No such file or directory
>>> : cannot remove '': No such file or directory
>>> losetup: /dev/loop13: detach failed: No such device or address
>>> _U: can't read : No such file or directory
>>> : : failed to set up loop device: Success
>>> losetup: /dev/loop12: detach failed: No such device or address
>>> : syntax error
>>> : : failed to set up loop device: No such file or directory
>>> : /dev/: failed to set up loop device: No such file or directory
>>> losetup: /dev/loop0: detach failed: No such device or address
>>> No such file or directory
>>>
>>> To reproduce:
>>>
>>>          git clonehttps://github.com/intel/lkp-tests.git
>>>          cd lkp-tests
>>>          bin/lkp qemu -k <bzImage> job-script # job-script is attached =
in
>>> this email
>>>
>>>
>>>
>>> Thanks,
>>> Rong Chen
>>>
>> _______________________________________________
>> LKP mailing list
>> LKP(a)lists.01.org
>> https://lists.01.org/mailman/listinfo/lkp
>
>
>
> _______________________________________________
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp


--===============4652353678881597219==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRl
bnQ9InRleHQvaHRtbDsgY2hhcnNldD11dGYtOCI+CiAgPC9oZWFkPgogIDxib2R5IHRleHQ9IiMw
MDAwMDAiIGJnY29sb3I9IiNGRkZGRkYiPgogICAgPHA+PGJyPgogICAgPC9wPgogICAgPGJyPgog
ICAgPGRpdiBjbGFzcz0ibW96LWNpdGUtcHJlZml4Ij5PbiAwOS8xMy8yMDE4IDA5OjAwIEFNLCBS
b25nIENoZW4KICAgICAgd3JvdGU6PGJyPgogICAgPC9kaXY+CiAgICA8YmxvY2txdW90ZSB0eXBl
PSJjaXRlIgogICAgICBjaXRlPSJtaWQ6YzE1YmJiZDctMDg3MC0xMDEzLTE2ZTMtODM3ZWMzOGY2
NzgzQGludGVsLmNvbSI+CiAgICAgIDxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29u
dGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4KICAgICAgPHA+PGJyPgogICAgICA8L3A+
CiAgICAgIDxicj4KICAgICAgPGRpdiBjbGFzcz0ibW96LWNpdGUtcHJlZml4Ij5PbiAwOS8xMi8y
MDE4IDA3OjQxIFBNLCBBbmRyZXkKICAgICAgICBLb25vdmFsb3Ygd3JvdGU6PGJyPgogICAgICA8
L2Rpdj4KICAgICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIKY2l0ZT0ibWlkOkNBQWVISyt4Wi1i
M0tRaE5BNUxwNWd2Rk9qTFEta3EtalZPVHc2dGpMUkp1X1krYXIzZ0BtYWlsLmdtYWlsLmNvbSI+
CiAgICAgICAgPHByZSB3cmFwPSIiPlRoYXQgY29tbWl0IG9ubHkgYWRkcyBub29wIGFubm90YXRp
b25zLCBzbyB0aGlzIGlzIG1vc3QgbGlrZWx5IGEgZmFsc2UKcG9zaXRpdmUuIEkgYWxzbyBjYW4n
dCBtYWtlIGFueXRoaW5nIG91dCBvZiB0aGUgZXJyb3IgbG9nIHlvdQpwcm92aWRlZC48L3ByZT4K
ICAgICAgPC9ibG9ja3F1b3RlPgogICAgICBUaGUgaXNzdWUgaXMgdGhhdDxzcGFuIGlkPSJ3XzQz
IiBjbGFzcz0iIj4gPC9zcGFuPnRoZSBiaW5hcnkKICAgICAgcGF0aHMgPHNwYW4gaWQ9IndfMTMi
IGNsYXNzPSIiPmJlY29tZSA8L3NwYW4+PHNwYW4gaWQ9IndfMTQiCiAgICAgICAgY2xhc3M9IiI+
Z2FyYmxlZDwvc3Bhbj48c3BhbiBpZD0id180MCIgY2xhc3M9IiI+PC9zcGFuPjxzcGFuCiAgICAg
ICAgaWQ9IndfNDMiIGNsYXNzPSIiPiA8L3NwYW4+PHNwYW4gaWQ9IndfNDMiIGNsYXNzPSIiPjxz
cGFuCiAgICAgICAgICBpZD0id180MyIgY2xhc3M9IiI+ZnJvbSB0aGlzIGNvbW1pdDwvc3Bhbj4s
PGJyPgogICAgICAgIGFuZCBpdCBjYW4gYmUgcmVwcm9kdWNlZCBvbiAwZGF5LWNpIHRyZWUgPC9z
cGFuPjxzcGFuIGlkPSJ3XzQzIgogICAgICAgIGNsYXNzPSIiPjxzcGFuIGlkPSJ3XzQwIiBjbGFz
cz0iIj5pbjwvc3Bhbj48c3BhbiBpZD0id180MSI+IDwvc3Bhbj48c3BhbgogICAgICAgICAgaWQ9
IndfNDIiIGNsYXNzPSIiPmhpZ2ggPC9zcGFuPjxzcGFuIGlkPSJ3XzQzIiBjbGFzcz0iIj5wcm9i
YWJpbGl0eTwvc3Bhbj4sPGJyPgogICAgICAgIEl0J3MgcG9zc2libGUgdGhhdCB0aGUgY29tbWl0
IGlzIGluZmx1ZW5jZWQgYnkgb3RoZXIgbWVyZ2VkCiAgICAgICAgY29tbWl0cy48YnI+CiAgICAg
ICAgQ291bGQgeW91IGNvbmZpcm0gaXQgb24geW91ciBvd24gdHJlZSBpZiB5b3UgaGF2ZSB0aW1l
Pzxicj4KICAgICAgICA8YnI+CiAgICAgIDwvc3Bhbj48L2Jsb2NrcXVvdGU+CiAgICBIaSBBbmRy
ZXksPGJyPgogICAgPGJyPgogICAgQW55IHVwZGF0ZSBvbiB0aGlzPzxicj4KICAgIDxicj4KICAg
IEJlc3QgUmVnYXJkcyw8YnI+CiAgICBSb25nIENoZW48YnI+CiAgICA8YnI+CiAgICA8YmxvY2tx
dW90ZSB0eXBlPSJjaXRlIgogICAgICBjaXRlPSJtaWQ6YzE1YmJiZDctMDg3MC0xMDEzLTE2ZTMt
ODM3ZWMzOGY2NzgzQGludGVsLmNvbSI+PHNwYW4KICAgICAgICBpZD0id180MyIgY2xhc3M9IiI+
IDwvc3Bhbj48YnI+CiAgICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiCmNpdGU9Im1pZDpDQUFl
SEsreFotYjNLUWhOQTVMcDVndkZPakxRLWtxLWpWT1R3NnRqTFJKdV9ZK2FyM2dAbWFpbC5nbWFp
bC5jb20iPgogICAgICAgIDxwcmUgd3JhcD0iIj4KT24gV2VkLCBTZXAgMTIsIDIwMTggYXQgMzox
MiBBTSwgUm9uZyBDaGVuIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1h
aWx0bzpyb25nLmEuY2hlbkBpbnRlbC5jb20iIG1vei1kby1ub3Qtc2VuZD0idHJ1ZSI+Jmx0O3Jv
bmcuYS5jaGVuQGludGVsLmNvbSZndDs8L2E+IHdyb3RlOgo8L3ByZT4KICAgICAgICA8YmxvY2tx
dW90ZSB0eXBlPSJjaXRlIj4KICAgICAgICAgIDxwcmUgd3JhcD0iIj5GWUksIHdlIG5vdGljZWQg
dGhlIGZvbGxvd2luZyBjb21taXQgKGJ1aWx0IHdpdGggZ2NjLTcpOgoKY29tbWl0IDdiNWI1MWU3
YjNhOTg4NzQxZjdmMzRkNTE0OGYxZjRmZWE4NjQzNGEgKCJhcm02NDogYW5ub3RhdGUgdXNlcgpw
b2ludGVycyBjYXN0cyBkZXRlY3RlZCBieSBzcGFyc2UiKQoKPGEgY2xhc3M9Im1vei10eHQtbGlu
ay1mcmVldGV4dCIgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tLzBkYXktY2kvbGludXgvY29tbWl0
cy9BbmRyZXktS29ub3ZhbG92L2FybTY0LXVudGFnLXVzZXItcG9pbnRlcnMtcGFzc2VkLXRvLXRo
ZS1rZXJuZWwvMjAxODA4MzEtMDQyMTUxIiBtb3otZG8tbm90LXNlbmQ9InRydWUiPmh0dHBzOi8v
Z2l0aHViLmNvbS8wZGF5LWNpL2xpbnV4L2NvbW1pdHMvQW5kcmV5LUtvbm92YWxvdi9hcm02NC11
bnRhZy11c2VyLXBvaW50ZXJzLXBhc3NlZC10by10aGUta2VybmVsLzIwMTgwODMxLTA0MjE1MTwv
YT4KCgppbiB0ZXN0Y2FzZTogYWxsIHRlc3RzCgpjYXVzZWQgYmVsb3cgY2hhbmdlcyAocGxlYXNl
IHJlZmVyIHRvIGF0dGFjaGVkIHN0ZGVyci9kbWVzZy54eiBmb3IgZW50aXJlCmxvZy9iYWNrdHJh
Y2UpOgoKICBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5CiA6IE5vIHN1Y2ggZmlsZSBvciBkaXJl
Y3RvcnkKIDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQo6IDogTm8gc3VjaCBmaWxlIG9yIGRp
cmVjdG9yeQo6IDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQo6IM+qOiBObyBzdWNoIGZpbGUg
b3IgZGlyZWN0b3J5CjogOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5CjogaW52YWxpZCBkYXRl
IOKAmOKAmQrJlTogMDogQ2FuJ3Qgb3BlbiDJlQo6IDA6IENhbid0IG9wZW4KOiBzeW50YXggZXJy
b3IKOiA6IGZhaWxlZCB0byBzZXQgdXAgbG9vcCBkZXZpY2U6IE5vIHN1Y2ggZmlsZSBvciBkaXJl
Y3RvcnkKOiBjYW5ub3Qgc3RhdCAnJzogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQo4OiBtaXNz
aW5nIG9yIHVua25vd24gY29tbWFuZApuJmx0OzogL2Rldi9uJmx0OzogZmFpbGVkIHRvIHNldCB1
cCBsb29wIGRldmljZTogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQo6IGNhbm5vdCByZW1vdmUg
JyckJ1wwMzcnOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5CjogY2Fubm90IHJlbW92ZSAnJzog
Tm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQpsb3NldHVwOiAvZGV2L2xvb3AxMzogZGV0YWNoIGZh
aWxlZDogTm8gc3VjaCBkZXZpY2Ugb3IgYWRkcmVzcwpfVTogY2FuJ3QgcmVhZCA6IE5vIHN1Y2gg
ZmlsZSBvciBkaXJlY3RvcnkKOiA6IGZhaWxlZCB0byBzZXQgdXAgbG9vcCBkZXZpY2U6IFN1Y2Nl
c3MKbG9zZXR1cDogL2Rldi9sb29wMTI6IGRldGFjaCBmYWlsZWQ6IE5vIHN1Y2ggZGV2aWNlIG9y
IGFkZHJlc3MKOiBzeW50YXggZXJyb3IKOiA6IGZhaWxlZCB0byBzZXQgdXAgbG9vcCBkZXZpY2U6
IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKOiAvZGV2LzogZmFpbGVkIHRvIHNldCB1cCBsb29w
IGRldmljZTogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQpsb3NldHVwOiAvZGV2L2xvb3AwOiBk
ZXRhY2ggZmFpbGVkOiBObyBzdWNoIGRldmljZSBvciBhZGRyZXNzCk5vIHN1Y2ggZmlsZSBvciBk
aXJlY3RvcnkKClRvIHJlcHJvZHVjZToKCiAgICAgICAgZ2l0IGNsb25lIDxhIGNsYXNzPSJtb3ot
dHh0LWxpbmstZnJlZXRleHQiIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC9sa3AtdGVz
dHMuZ2l0IiBtb3otZG8tbm90LXNlbmQ9InRydWUiPmh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC9s
a3AtdGVzdHMuZ2l0PC9hPgogICAgICAgIGNkIGxrcC10ZXN0cwogICAgICAgIGJpbi9sa3AgcWVt
dSAtayAmbHQ7YnpJbWFnZSZndDsgam9iLXNjcmlwdCAjIGpvYi1zY3JpcHQgaXMgYXR0YWNoZWQg
aW4KdGhpcyBlbWFpbAoKCgpUaGFua3MsClJvbmcgQ2hlbgoKPC9wcmU+CiAgICAgICAgPC9ibG9j
a3F1b3RlPgogICAgICAgIDxwcmUgd3JhcD0iIj5fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMS1AgbWFpbGluZyBsaXN0CjxhIGNsYXNzPSJtb3otdHh0LWxp
bmstYWJicmV2aWF0ZWQiIGhyZWY9Im1haWx0bzpMS1BAbGlzdHMuMDEub3JnIiBtb3otZG8tbm90
LXNlbmQ9InRydWUiPkxLUEBsaXN0cy4wMS5vcmc8L2E+CjxhIGNsYXNzPSJtb3otdHh0LWxpbmst
ZnJlZXRleHQiIGhyZWY9Imh0dHBzOi8vbGlzdHMuMDEub3JnL21haWxtYW4vbGlzdGluZm8vbGtw
IiBtb3otZG8tbm90LXNlbmQ9InRydWUiPmh0dHBzOi8vbGlzdHMuMDEub3JnL21haWxtYW4vbGlz
dGluZm8vbGtwPC9hPgo8L3ByZT4KICAgICAgPC9ibG9ja3F1b3RlPgogICAgICA8YnI+CiAgICAg
IDxicj4KICAgICAgPGZpZWxkc2V0IGNsYXNzPSJtaW1lQXR0YWNobWVudEhlYWRlciI+PC9maWVs
ZHNldD4KICAgICAgPGJyPgogICAgICA8cHJlIHdyYXA9IiI+X19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTEtQIG1haWxpbmcgbGlzdAo8YSBjbGFzcz0ibW96
LXR4dC1saW5rLWFiYnJldmlhdGVkIiBocmVmPSJtYWlsdG86TEtQQGxpc3RzLjAxLm9yZyI+TEtQ
QGxpc3RzLjAxLm9yZzwvYT4KPGEgY2xhc3M9Im1vei10eHQtbGluay1mcmVldGV4dCIgaHJlZj0i
aHR0cHM6Ly9saXN0cy4wMS5vcmcvbWFpbG1hbi9saXN0aW5mby9sa3AiPmh0dHBzOi8vbGlzdHMu
MDEub3JnL21haWxtYW4vbGlzdGluZm8vbGtwPC9hPgo8L3ByZT4KICAgIDwvYmxvY2txdW90ZT4K
ICAgIDxicj4KICA8L2JvZHk+CjwvaHRtbD4K

--===============4652353678881597219==--

