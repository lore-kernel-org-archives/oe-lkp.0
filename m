Content-Type: multipart/mixed; boundary="===============9105405660805193324=="
MIME-Version: 1.0
From: Bincy Philip <bphilip@mvista.com>
To: lkp@lists.01.org
Subject: lkp ncompare result interpetation
Date: Tue, 04 Feb 2020 11:15:11 +0530
Message-ID: <CACOpkY697dr7H6Q58gADTDLDKtb1iUbC6-Dr=Z63RUuEEmyR5w@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9105405660805193324==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

*Hi,*

*I am new to lkp test suite.I have installed it and found useful in
comparing different kernel versions.*

*Can somebody help me to understand it better way.Attached is the lkp
compare test result.Column headings are unclear to me.*

*What does 5322 and 379 mean in the attached result?How can I say which
kernel is good from the result?*


lkp ncompare -s commit=3D"3.10.0-1062.9.1.el7.x86_64" -o commit=3D"3.18.0-r=
c5" -a
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/ipc/kconfig/mode/nr_threads/rootfs/tbox_group/testcase:
  gcc-7/pipe/x86_64-rhel-7.6/process/1600%/centos/bn1dhcp244-49.mvista.com/=
hackbench

commit:
  3.10.0-1062.9.1.el7.x86_64
  3.18.0-rc5

3.10.0-1062.9.1.                  3.18.0-rc5
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
       5322:1      -494373%         379:1     dmesg.timestamp:last
       5322:1      -494373%         379:1     kmsg.timestamp:last


Thanks in Advance!!!

Bincy

--===============9105405660805193324==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+PGRpdj48c3BhbiBjbGFzcz0iZ21haWwtc3QiPjxlbT5IaSw8L2VtPjwv
c3Bhbj48L2Rpdj48ZGl2PjxzcGFuIGNsYXNzPSJnbWFpbC1zdCI+PGVtPjxicj48L2VtPjwvc3Bh
bj48L2Rpdj48ZGl2PjxzcGFuIGNsYXNzPSJnbWFpbC1zdCI+PGVtPkkgYW0gbmV3IHRvIGxrcCB0
ZXN0IHN1aXRlLkkgaGF2ZSBpbnN0YWxsZWQgaXQgYW5kIGZvdW5kIHVzZWZ1bCBpbiBjb21wYXJp
bmcgZGlmZmVyZW50IGtlcm5lbCB2ZXJzaW9ucy48L2VtPjwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFu
IGNsYXNzPSJnbWFpbC1zdCI+PGVtPjxicj48L2VtPjwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuIGNs
YXNzPSJnbWFpbC1zdCI+PGVtPkNhbiBzb21lYm9keSBoZWxwIG1lIHRvIHVuZGVyc3RhbmQgaXQg
YmV0dGVyIHdheS5BdHRhY2hlZCBpcyB0aGUgbGtwIGNvbXBhcmUgdGVzdCByZXN1bHQuQ29sdW1u
IGhlYWRpbmdzIGFyZSB1bmNsZWFyIHRvIG1lLjwvZW0+PC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4g
Y2xhc3M9ImdtYWlsLXN0Ij48ZW0+PGJyPjwvZW0+PC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4gY2xh
c3M9ImdtYWlsLXN0Ij48ZW0+V2hhdCBkb2VzIDUzMjIgYW5kIDM3OSBtZWFuIGluIHRoZSBhdHRh
Y2hlZCByZXN1bHQ/SG93IGNhbiBJIHNheSB3aGljaCBrZXJuZWwgaXMgZ29vZCBmcm9tIHRoZSBy
ZXN1bHQ/PC9lbT48L3NwYW4+PC9kaXY+PGRpdj48c3BhbiBjbGFzcz0iZ21haWwtc3QiPjxlbT48
YnI+PC9lbT48L3NwYW4+PC9kaXY+PGRpdj48c3BhbiBjbGFzcz0iZ21haWwtc3QiPjxlbT48YnI+
PC9lbT48L3NwYW4+PC9kaXY+PGRpdj48cHJlPmxrcCBuY29tcGFyZSAtcyBjb21taXQ9JnF1b3Q7
My4xMC4wLTEwNjIuOS4xLmVsNy54ODZfNjQmcXVvdDsgLW8gY29tbWl0PSZxdW90OzMuMTguMC1y
YzUmcXVvdDsgLWE8YnI+PT09PT09PT09PT09PT09PT09PT09PT0gPT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PGJyPmNvbXBp
bGVyL2lwYy9rY29uZmlnL21vZGUvbnJfdGhyZWFkcy9yb290ZnMvdGJveF9ncm91cC90ZXN0Y2Fz
ZTo8YnI+wqAgZ2NjLTcvcGlwZS94ODZfNjQtcmhlbC03LjYvcHJvY2Vzcy8xNjAwJS9jZW50b3Mv
PGEgaHJlZj0iaHR0cDovL2JuMWRoY3AyNDQtNDkubXZpc3RhLmNvbS9oYWNrYmVuY2giIHRhcmdl
dD0iX2JsYW5rIj5ibjFkaGNwMjQ0LTQ5Lm12aXN0YS5jb20vaGFja2JlbmNoPC9hPjxicj48YnI+
Y29tbWl0OiA8YnI+wqAgMy4xMC4wLTEwNjIuOS4xLmVsNy54ODZfNjQ8YnI+wqAgMy4xOC4wLXJj
NTxicj48YnI+My4xMC4wLTEwNjIuOS4xLiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDMuMTgu
MC1yYzUgPGJyPi0tLS0tLS0tLS0tLS0tLS0gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIDxi
cj7CoCDCoCDCoCDCoGZhaWw6cnVucyDCoCVyZXByb2R1Y3Rpb24gwqAgwqBmYWlsOnJ1bnM8YnI+
wqAgwqAgwqAgwqAgwqAgwqB8IMKgIMKgIMKgIMKgIMKgIMKgIHwgwqAgwqAgwqAgwqAgwqAgwqAg
fCDCoCDCoDxicj7CoCDCoCDCoCDCoDUzMjI6MSDCoCDCoCDCoC00OTQzNzMlIMKgIMKgIMKgIMKg
IDM3OToxIMKgIMKgIGRtZXNnLnRpbWVzdGFtcDpsYXN0PGJyPsKgIMKgIMKgIMKgNTMyMjoxIMKg
IMKgIMKgLTQ5NDM3MyUgwqAgwqAgwqAgwqAgMzc5OjEgwqAgwqAga21zZy50aW1lc3RhbXA6bGFz
dDxicj48YnI+PGJyPjwvcHJlPjxwcmU+VGhhbmtzIGluIEFkdmFuY2UhISE8YnI+PGJyPjwvcHJl
PjxwcmU+QmluY3k8YnI+PC9wcmU+PHNwYW4gY2xhc3M9ImdtYWlsLXN0Ij48ZW0+PC9lbT48L3Nw
YW4+PC9kaXY+PGRpdj48c3BhbiBjbGFzcz0iZ21haWwtc3QiPjxlbT48YnI+PC9lbT48L3NwYW4+
PC9kaXY+PGRpdj48c3BhbiBjbGFzcz0iZ21haWwtc3QiPjxlbT48L2VtPjwvc3Bhbj48L2Rpdj48
L2Rpdj4K

--===============9105405660805193324==--

