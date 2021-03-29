Content-Type: multipart/mixed; boundary="===============2896330930776424138=="
MIME-Version: 1.0
From: jim.cromie@gmail.com
To: lkp@lists.01.org
Subject: patch testing service here ?
Date: Mon, 29 Mar 2021 13:31:35 -0600
Message-ID: <CAJfuBxy0RxC-e_jVnN46r9TdbMJUM5uwSQrM3MwR-341q=vz6w@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2896330930776424138==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hi all,

I think im in the right place.

I recently sent a patchset to LKML, and the robot found some
crap that betrays my lack of automatic alt-config testing.

does the kernel test robot watch this list too ?
if so, can/should I use it for infant-mortality testing of revisions ?

is there a FAQ somewhere about auto-testing service,
what lists are watched, how to submit a github repo for testing ?
in case thats so, Ive pushed my next rev

https://github.com/jimc/linux.git /lkp-test/dyndbg-diet

and since Im getting oriented (I hope)
whats the right usage of Reported-by ?

-v5 fix !CONFIG_DYNAMIC_DEBUG fn-stub
Reported-by: kernel test robot <lkp@intel.com>
or maybe
Reported-by: <lkp@intel.com> # fix !CONFIG_DYNAMIC_DEBUG fn-stub

lastly, my patchset needs CONFIG_DYNAMIC_DEBUG=3Dy for active testing, does
the robot know that from context ?
or is there a simple way to tell it ?

--===============2896330930776424138==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+aGkgYWxsLDxkaXY+PGJyPjwvZGl2PjxkaXY+SSB0aGluayBpbSBpbiB0
aGUgcmlnaHQgcGxhY2UuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5JIHJlY2VudGx5IHNlbnQg
YSBwYXRjaHNldCB0byBMS01MLCBhbmQgdGhlIHJvYm90IGZvdW5kIHNvbWU8L2Rpdj48ZGl2PmNy
YXAgdGhhdCBiZXRyYXlzIG15IGxhY2sgb2YgYXV0b21hdGljIGFsdC1jb25maWcgdGVzdGluZy48
L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PmRvZXMgdGhlIGtlcm5lbCB0ZXN0IHJvYm90IHdhdGNo
IHRoaXMgbGlzdCB0b28gPzwvZGl2PjxkaXY+aWYgc28sIGNhbi9zaG91bGQgSSB1c2UgaXQgZm9y
IGluZmFudC1tb3J0YWxpdHkgdGVzdGluZyBvZiByZXZpc2lvbnMgPzwvZGl2PjxkaXY+PGJyPjwv
ZGl2PjxkaXY+aXMgdGhlcmUgYSBGQVEgc29tZXdoZXJlIGFib3V0IGF1dG8tdGVzdGluZyBzZXJ2
aWNlLDwvZGl2PjxkaXY+d2hhdCBsaXN0cyBhcmUgd2F0Y2hlZCwgaG93IHRvIHN1Ym1pdCBhIGdp
dGh1YiByZXBvIGZvciB0ZXN0aW5nID88L2Rpdj48ZGl2PmluIGNhc2UgdGhhdHMgc28sIEl2ZSBw
dXNoZWQgbXkgbmV4dCByZXY8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PjxhIGhyZWY9Imh0dHBz
Oi8vZ2l0aHViLmNvbS9qaW1jL2xpbnV4LmdpdCI+aHR0cHM6Ly9naXRodWIuY29tL2ppbWMvbGlu
dXguZ2l0PC9hPiAvbGtwLXRlc3QvZHluZGJnLWRpZXQ8YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+
PGRpdj5hbmQgc2luY2UgSW0gZ2V0dGluZyBvcmllbnRlZCAoSSBob3BlKTwvZGl2PjxkaXY+d2hh
dHMgdGhlIHJpZ2h0IHVzYWdlIG9mIFJlcG9ydGVkLWJ5ID88L2Rpdj48ZGl2Pjxicj48L2Rpdj48
ZGl2Pi12NSBmaXggIUNPTkZJR19EWU5BTUlDX0RFQlVHIGZuLXN0dWI8YnI+UmVwb3J0ZWQtYnk6
IGtlcm5lbCB0ZXN0IHJvYm90ICZsdDs8YSBocmVmPSJtYWlsdG86bGtwQGludGVsLmNvbSI+bGtw
QGludGVsLmNvbTwvYT4mZ3Q7PGJyPjwvZGl2PjxkaXY+b3IgbWF5YmU8L2Rpdj48ZGl2PjxkaXY+
UmVwb3J0ZWQtYnk6ICZsdDs8YSBocmVmPSJtYWlsdG86bGtwQGludGVsLmNvbSI+bGtwQGludGVs
LmNvbTwvYT4mZ3Q7ICMgZml4ICFDT05GSUdfRFlOQU1JQ19ERUJVRyBmbi1zdHViPGJyPjwvZGl2
Pjxicj48ZGl2PjwvZGl2PjwvZGl2PjxkaXY+bGFzdGx5LCBteSBwYXRjaHNldCBuZWVkcyBDT05G
SUdfRFlOQU1JQ19ERUJVRz15IGZvciBhY3RpdmUgdGVzdGluZywgZG9lcyB0aGUgcm9ib3Qga25v
dyB0aGF0IGZyb20gY29udGV4dCA/PC9kaXY+PGRpdj5vciBpcyB0aGVyZSBhIHNpbXBsZSB3YXkg
dG8gdGVsbCBpdCA/PC9kaXY+PC9kaXY+Cg==

--===============2896330930776424138==--

