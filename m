Content-Type: multipart/mixed; boundary="===============8431934349045080698=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: 7b5b51e7b3 qemux86-64: can't read binary file (No such file or directory)
Date: Thu, 13 Sep 2018 09:00:27 +0800
Message-ID: <c15bbbd7-0870-1013-16e3-837ec38f6783@intel.com>
In-Reply-To: <CAAeHK+xZ-b3KQhNA5Lp5gvFOjLQ-kq-jVOTw6tjLRJu_Y+ar3g@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8431934349045080698==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 09/12/2018 07:41 PM, Andrey Konovalov wrote:
> That commit only adds noop annotations, so this is most likely a false
> positive. I also can't make anything out of the error log you
> provided.
The issue is thatthe binary paths become garbledfrom this commit,
and it can be reproduced on 0day-ci tree inhigh probability,
It's possible that the commit is influenced by other merged commits.
Could you confirm it on your own tree if you have time?

Best Regards,
Rong Chen

>
> On Wed, Sep 12, 2018 at 3:12 AM, Rong Chen <rong.a.chen@intel.com> wrot=
e:
>> FYI, we noticed the following commit (built with gcc-7):
>>
>> commit 7b5b51e7b3a988741f7f34d5148f1f4fea86434a ("arm64: annotate user
>> pointers casts detected by sparse")
>>
>> https://github.com/0day-ci/linux/commits/Andrey-Konovalov/arm64-untag-us=
er-pointers-passed-to-the-kernel/20180831-042151
>>
>>
>> in testcase: all tests
>>
>> caused below changes (please refer to attached stderr/dmesg.xz for entire
>> log/backtrace):
>>
>>    No such file or directory
>>   : No such file or directory
>>   : No such file or directory
>> : : No such file or directory
>> : : No such file or directory
>> : =CF=AA: No such file or directory
>> : : No such file or directory
>> : invalid date =E2=80=98=E2=80=99
>> =C9=95: 0: Can't open =C9=95
>> : 0: Can't open
>> : syntax error
>> : : failed to set up loop device: No such file or directory
>> : cannot stat '': No such file or directory
>> 8: missing or unknown command
>> n<: /dev/n<: failed to set up loop device: No such file or directory
>> : cannot remove ''$'\037': No such file or directory
>> : cannot remove '': No such file or directory
>> losetup: /dev/loop13: detach failed: No such device or address
>> _U: can't read : No such file or directory
>> : : failed to set up loop device: Success
>> losetup: /dev/loop12: detach failed: No such device or address
>> : syntax error
>> : : failed to set up loop device: No such file or directory
>> : /dev/: failed to set up loop device: No such file or directory
>> losetup: /dev/loop0: detach failed: No such device or address
>> No such file or directory
>>
>> To reproduce:
>>
>>          git clone https://github.com/intel/lkp-tests.git
>>          cd lkp-tests
>>          bin/lkp qemu -k <bzImage> job-script # job-script is attached in
>> this email
>>
>>
>>
>> Thanks,
>> Rong Chen
>>
> _______________________________________________
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp


--===============8431934349045080698==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRl
bnQ9InRleHQvaHRtbDsgY2hhcnNldD11dGYtOCI+CiAgPC9oZWFkPgogIDxib2R5IHRleHQ9IiMw
MDAwMDAiIGJnY29sb3I9IiNGRkZGRkYiPgogICAgPHA+PGJyPgogICAgPC9wPgogICAgPGJyPgog
ICAgPGRpdiBjbGFzcz0ibW96LWNpdGUtcHJlZml4Ij5PbiAwOS8xMi8yMDE4IDA3OjQxIFBNLCBB
bmRyZXkKICAgICAgS29ub3ZhbG92IHdyb3RlOjxicj4KICAgIDwvZGl2PgogICAgPGJsb2NrcXVv
dGUgdHlwZT0iY2l0ZSIKY2l0ZT0ibWlkOkNBQWVISyt4Wi1iM0tRaE5BNUxwNWd2Rk9qTFEta3Et
alZPVHc2dGpMUkp1X1krYXIzZ0BtYWlsLmdtYWlsLmNvbSI+CiAgICAgIDxwcmUgd3JhcD0iIj5U
aGF0IGNvbW1pdCBvbmx5IGFkZHMgbm9vcCBhbm5vdGF0aW9ucywgc28gdGhpcyBpcyBtb3N0IGxp
a2VseSBhIGZhbHNlCnBvc2l0aXZlLiBJIGFsc28gY2FuJ3QgbWFrZSBhbnl0aGluZyBvdXQgb2Yg
dGhlIGVycm9yIGxvZyB5b3UKcHJvdmlkZWQuPC9wcmU+CiAgICA8L2Jsb2NrcXVvdGU+CiAgICBU
aGUgaXNzdWUgaXMgdGhhdDxzcGFuIGlkPSJ3XzQzIiBjbGFzcz0iIj4gPC9zcGFuPnRoZSBiaW5h
cnkgcGF0aHMKICAgIDxzcGFuIGlkPSJ3XzEzIiBjbGFzcz0iIj5iZWNvbWUgPC9zcGFuPjxzcGFu
IGlkPSJ3XzE0IiBjbGFzcz0iIj5nYXJibGVkPC9zcGFuPjxzcGFuCiAgICAgIGlkPSJ3XzQwIiBj
bGFzcz0iIj48L3NwYW4+PHNwYW4gaWQ9IndfNDMiIGNsYXNzPSIiPiA8L3NwYW4+PHNwYW4KICAg
ICAgaWQ9IndfNDMiIGNsYXNzPSIiPjxzcGFuIGlkPSJ3XzQzIiBjbGFzcz0iIj5mcm9tIHRoaXMg
Y29tbWl0PC9zcGFuPiw8YnI+CiAgICAgIGFuZCBpdCBjYW4gYmUgcmVwcm9kdWNlZCBvbiAwZGF5
LWNpIHRyZWUgPC9zcGFuPjxzcGFuIGlkPSJ3XzQzIgogICAgICBjbGFzcz0iIj48c3BhbiBpZD0i
d180MCIgY2xhc3M9IiI+aW48L3NwYW4+PHNwYW4gaWQ9IndfNDEiPiA8L3NwYW4+PHNwYW4KICAg
ICAgICBpZD0id180MiIgY2xhc3M9IiI+aGlnaCA8L3NwYW4+PHNwYW4gaWQ9IndfNDMiIGNsYXNz
PSIiPnByb2JhYmlsaXR5PC9zcGFuPiw8YnI+CiAgICAgIEl0J3MgcG9zc2libGUgdGhhdCB0aGUg
Y29tbWl0IGlzIGluZmx1ZW5jZWQgYnkgb3RoZXIgbWVyZ2VkCiAgICAgIGNvbW1pdHMuPGJyPgog
ICAgICBDb3VsZCB5b3UgY29uZmlybSBpdCBvbiB5b3VyIG93biB0cmVlIGlmIHlvdSBoYXZlIHRp
bWU/PGJyPgogICAgICA8YnI+CiAgICAgIEJlc3QgUmVnYXJkcyw8YnI+CiAgICAgIFJvbmcgQ2hl
bjxicj4KICAgIDwvc3Bhbj48YnI+CiAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIgpjaXRlPSJt
aWQ6Q0FBZUhLK3haLWIzS1FoTkE1THA1Z3ZGT2pMUS1rcS1qVk9UdzZ0akxSSnVfWSthcjNnQG1h
aWwuZ21haWwuY29tIj4KICAgICAgPHByZSB3cmFwPSIiPgoKT24gV2VkLCBTZXAgMTIsIDIwMTgg
YXQgMzoxMiBBTSwgUm9uZyBDaGVuIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhy
ZWY9Im1haWx0bzpyb25nLmEuY2hlbkBpbnRlbC5jb20iPiZsdDtyb25nLmEuY2hlbkBpbnRlbC5j
b20mZ3Q7PC9hPiB3cm90ZToKPC9wcmU+CiAgICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPgog
ICAgICAgIDxwcmUgd3JhcD0iIj5GWUksIHdlIG5vdGljZWQgdGhlIGZvbGxvd2luZyBjb21taXQg
KGJ1aWx0IHdpdGggZ2NjLTcpOgoKY29tbWl0IDdiNWI1MWU3YjNhOTg4NzQxZjdmMzRkNTE0OGYx
ZjRmZWE4NjQzNGEgKCJhcm02NDogYW5ub3RhdGUgdXNlcgpwb2ludGVycyBjYXN0cyBkZXRlY3Rl
ZCBieSBzcGFyc2UiKQoKPGEgY2xhc3M9Im1vei10eHQtbGluay1mcmVldGV4dCIgaHJlZj0iaHR0
cHM6Ly9naXRodWIuY29tLzBkYXktY2kvbGludXgvY29tbWl0cy9BbmRyZXktS29ub3ZhbG92L2Fy
bTY0LXVudGFnLXVzZXItcG9pbnRlcnMtcGFzc2VkLXRvLXRoZS1rZXJuZWwvMjAxODA4MzEtMDQy
MTUxIj5odHRwczovL2dpdGh1Yi5jb20vMGRheS1jaS9saW51eC9jb21taXRzL0FuZHJleS1Lb25v
dmFsb3YvYXJtNjQtdW50YWctdXNlci1wb2ludGVycy1wYXNzZWQtdG8tdGhlLWtlcm5lbC8yMDE4
MDgzMS0wNDIxNTE8L2E+CgoKaW4gdGVzdGNhc2U6IGFsbCB0ZXN0cwoKY2F1c2VkIGJlbG93IGNo
YW5nZXMgKHBsZWFzZSByZWZlciB0byBhdHRhY2hlZCBzdGRlcnIvZG1lc2cueHogZm9yIGVudGly
ZQpsb2cvYmFja3RyYWNlKToKCiAgTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQogOiBObyBzdWNo
IGZpbGUgb3IgZGlyZWN0b3J5CiA6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKOiA6IE5vIHN1
Y2ggZmlsZSBvciBkaXJlY3RvcnkKOiA6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKOiDPqjog
Tm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQo6IDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQo6
IGludmFsaWQgZGF0ZSDigJjigJkKyZU6IDA6IENhbid0IG9wZW4gyZUKOiAwOiBDYW4ndCBvcGVu
Cjogc3ludGF4IGVycm9yCjogOiBmYWlsZWQgdG8gc2V0IHVwIGxvb3AgZGV2aWNlOiBObyBzdWNo
IGZpbGUgb3IgZGlyZWN0b3J5CjogY2Fubm90IHN0YXQgJyc6IE5vIHN1Y2ggZmlsZSBvciBkaXJl
Y3RvcnkKODogbWlzc2luZyBvciB1bmtub3duIGNvbW1hbmQKbiZsdDs6IC9kZXYvbiZsdDs6IGZh
aWxlZCB0byBzZXQgdXAgbG9vcCBkZXZpY2U6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKOiBj
YW5ub3QgcmVtb3ZlICcnJCdcMDM3JzogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQo6IGNhbm5v
dCByZW1vdmUgJyc6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKbG9zZXR1cDogL2Rldi9sb29w
MTM6IGRldGFjaCBmYWlsZWQ6IE5vIHN1Y2ggZGV2aWNlIG9yIGFkZHJlc3MKX1U6IGNhbid0IHJl
YWQgOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5CjogOiBmYWlsZWQgdG8gc2V0IHVwIGxvb3Ag
ZGV2aWNlOiBTdWNjZXNzCmxvc2V0dXA6IC9kZXYvbG9vcDEyOiBkZXRhY2ggZmFpbGVkOiBObyBz
dWNoIGRldmljZSBvciBhZGRyZXNzCjogc3ludGF4IGVycm9yCjogOiBmYWlsZWQgdG8gc2V0IHVw
IGxvb3AgZGV2aWNlOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5CjogL2Rldi86IGZhaWxlZCB0
byBzZXQgdXAgbG9vcCBkZXZpY2U6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKbG9zZXR1cDog
L2Rldi9sb29wMDogZGV0YWNoIGZhaWxlZDogTm8gc3VjaCBkZXZpY2Ugb3IgYWRkcmVzcwpObyBz
dWNoIGZpbGUgb3IgZGlyZWN0b3J5CgpUbyByZXByb2R1Y2U6CgogICAgICAgIGdpdCBjbG9uZSA8
YSBjbGFzcz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0IiBocmVmPSJodHRwczovL2dpdGh1Yi5jb20v
aW50ZWwvbGtwLXRlc3RzLmdpdCI+aHR0cHM6Ly9naXRodWIuY29tL2ludGVsL2xrcC10ZXN0cy5n
aXQ8L2E+CiAgICAgICAgY2QgbGtwLXRlc3RzCiAgICAgICAgYmluL2xrcCBxZW11IC1rICZsdDti
ekltYWdlJmd0OyBqb2Itc2NyaXB0ICMgam9iLXNjcmlwdCBpcyBhdHRhY2hlZCBpbgp0aGlzIGVt
YWlsCgoKClRoYW5rcywKUm9uZyBDaGVuCgo8L3ByZT4KICAgICAgPC9ibG9ja3F1b3RlPgogICAg
ICA8cHJlIHdyYXA9IiI+X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTEtQIG1haWxpbmcgbGlzdAo8YSBjbGFzcz0ibW96LXR4dC1saW5rLWFiYnJldmlhdGVk
IiBocmVmPSJtYWlsdG86TEtQQGxpc3RzLjAxLm9yZyI+TEtQQGxpc3RzLjAxLm9yZzwvYT4KPGEg
Y2xhc3M9Im1vei10eHQtbGluay1mcmVldGV4dCIgaHJlZj0iaHR0cHM6Ly9saXN0cy4wMS5vcmcv
bWFpbG1hbi9saXN0aW5mby9sa3AiPmh0dHBzOi8vbGlzdHMuMDEub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGtwPC9hPgo8L3ByZT4KICAgIDwvYmxvY2txdW90ZT4KICAgIDxicj4KICA8L2JvZHk+Cjwv
aHRtbD4K

--===============8431934349045080698==--

