Content-Type: multipart/mixed; boundary="===============2342959164356292925=="
MIME-Version: 1.0
From: Bincy Philip <bphilip@mvista.com>
To: lkp@lists.01.org
Subject: Re: lkp ncompare result interpetation
Date: Tue, 04 Feb 2020 13:14:18 +0530
Message-ID: <CACOpkY6q11sWn2i9cS9W0XA7sncnNfz00frmS=MJhOMJ=2=U=w@mail.gmail.com>
In-Reply-To: <20200204064251.GA20734@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2342959164356292925==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks Philip.

I raised the issue here.

https://github.com/intel/lkp-tests/issues/54

On Tue, Feb 4, 2020 at 12:13 PM Philip Li <philip.li@intel.com> wrote:

> On Tue, Feb 04, 2020 at 11:15:11AM +0530, Bincy Philip wrote:
> > *Hi,*
> >
> > *I am new to lkp test suite.I have installed it and found useful in
> > comparing different kernel versions.*
> Thanks Bincy for trying it. Would you mind submitting an issue at
> https://github.com/intel/lkp-tests, we will have member to support it.
>
> Thanks
>
> >
> > *Can somebody help me to understand it better way.Attached is the lkp
> > compare test result.Column headings are unclear to me.*
> >
> > *What does 5322 and 379 mean in the attached result?How can I say which
> > kernel is good from the result?*
> >
> >
> > lkp ncompare -s commit=3D"3.10.0-1062.9.1.el7.x86_64" -o
> commit=3D"3.18.0-rc5" -a
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > compiler/ipc/kconfig/mode/nr_threads/rootfs/tbox_group/testcase:
> >   gcc-7/pipe/x86_64-rhel-7.6/process/1600%/centos/
> bn1dhcp244-49.mvista.com/hackbench
> >
> > commit:
> >   3.10.0-1062.9.1.el7.x86_64
> >   3.18.0-rc5
> >
> > 3.10.0-1062.9.1.                  3.18.0-rc5
> > ---------------- ---------------------------
> >        fail:runs  %reproduction    fail:runs
> >            |             |             |
> >        5322:1      -494373%         379:1     dmesg.timestamp:last
> >        5322:1      -494373%         379:1     kmsg.timestamp:last
> >
> >
> > Thanks in Advance!!!
> >
> > Bincy
>
> > _______________________________________________
> > LKP mailing list -- lkp(a)lists.01.org
> > To unsubscribe send an email to lkp-leave(a)lists.01.org
>
>

--===============2342959164356292925==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+PGRpdj5UaGFua3MgUGhpbGlwLjwvZGl2PjxkaXY+PGJyPjwvZGl2Pjxk
aXY+SSByYWlzZWQgdGhlIGlzc3VlIGhlcmUuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48YSBo
cmVmPSJodHRwczovL2dpdGh1Yi5jb20vaW50ZWwvbGtwLXRlc3RzL2lzc3Vlcy81NCI+aHR0cHM6
Ly9naXRodWIuY29tL2ludGVsL2xrcC10ZXN0cy9pc3N1ZXMvNTQ8L2E+PC9kaXY+PC9kaXY+PGJy
PjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0
ciI+T24gVHVlLCBGZWIgNCwgMjAyMCBhdCAxMjoxMyBQTSBQaGlsaXAgTGkgJmx0OzxhIGhyZWY9
Im1haWx0bzpwaGlsaXAubGlAaW50ZWwuY29tIj5waGlsaXAubGlAaW50ZWwuY29tPC9hPiZndDsg
d3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1h
cmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQs
MjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij5PbiBUdWUsIEZlYiAwNCwgMjAyMCBhdCAxMToxNToxMUFN
ICswNTMwLCBCaW5jeSBQaGlsaXAgd3JvdGU6PGJyPgomZ3Q7ICpIaSwqPGJyPgomZ3Q7IDxicj4K
Jmd0OyAqSSBhbSBuZXcgdG8gbGtwIHRlc3Qgc3VpdGUuSSBoYXZlIGluc3RhbGxlZCBpdCBhbmQg
Zm91bmQgdXNlZnVsIGluPGJyPgomZ3Q7IGNvbXBhcmluZyBkaWZmZXJlbnQga2VybmVsIHZlcnNp
b25zLio8YnI+ClRoYW5rcyBCaW5jeSBmb3IgdHJ5aW5nIGl0LiBXb3VsZCB5b3UgbWluZCBzdWJt
aXR0aW5nIGFuIGlzc3VlIGF0PGJyPgo8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vaW50ZWwv
bGtwLXRlc3RzIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dpdGh1
Yi5jb20vaW50ZWwvbGtwLXRlc3RzPC9hPiwgd2Ugd2lsbCBoYXZlIG1lbWJlciB0byBzdXBwb3J0
IGl0Ljxicj4KPGJyPgpUaGFua3M8YnI+Cjxicj4KJmd0OyA8YnI+CiZndDsgKkNhbiBzb21lYm9k
eSBoZWxwIG1lIHRvIHVuZGVyc3RhbmQgaXQgYmV0dGVyIHdheS5BdHRhY2hlZCBpcyB0aGUgbGtw
PGJyPgomZ3Q7IGNvbXBhcmUgdGVzdCByZXN1bHQuQ29sdW1uIGhlYWRpbmdzIGFyZSB1bmNsZWFy
IHRvIG1lLio8YnI+CiZndDsgPGJyPgomZ3Q7ICpXaGF0IGRvZXMgNTMyMiBhbmQgMzc5IG1lYW4g
aW4gdGhlIGF0dGFjaGVkIHJlc3VsdD9Ib3cgY2FuIEkgc2F5IHdoaWNoPGJyPgomZ3Q7IGtlcm5l
bCBpcyBnb29kIGZyb20gdGhlIHJlc3VsdD8qPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsg
bGtwIG5jb21wYXJlIC1zIGNvbW1pdD0mcXVvdDszLjEwLjAtMTA2Mi45LjEuZWw3Lng4Nl82NCZx
dW90OyAtbyBjb21taXQ9JnF1b3Q7My4xOC4wLXJjNSZxdW90OyAtYTxicj4KJmd0OyA9PT09PT09
PT09PT09PT09PT09PT09PTxicj4KJmd0OyA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT08YnI+CiZndDsgY29tcGlsZXIvaXBj
L2tjb25maWcvbW9kZS9ucl90aHJlYWRzL3Jvb3Rmcy90Ym94X2dyb3VwL3Rlc3RjYXNlOjxicj4K
Jmd0O8KgIMKgZ2NjLTcvcGlwZS94ODZfNjQtcmhlbC03LjYvcHJvY2Vzcy8xNjAwJS9jZW50b3Mv
PGEgaHJlZj0iaHR0cDovL2JuMWRoY3AyNDQtNDkubXZpc3RhLmNvbS9oYWNrYmVuY2giIHJlbD0i
bm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmJuMWRoY3AyNDQtNDkubXZpc3RhLmNvbS9oYWNr
YmVuY2g8L2E+PGJyPgomZ3Q7IDxicj4KJmd0OyBjb21taXQ6PGJyPgomZ3Q7wqAgwqAzLjEwLjAt
MTA2Mi45LjEuZWw3Lng4Nl82NDxicj4KJmd0O8KgIMKgMy4xOC4wLXJjNTxicj4KJmd0OyA8YnI+
CiZndDsgMy4xMC4wLTEwNjIuOS4xLsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDMuMTguMC1y
YzU8YnI+CiZndDsgLS0tLS0tLS0tLS0tLS0tLSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS08
YnI+CiZndDvCoCDCoCDCoCDCoCBmYWlsOnJ1bnPCoCAlcmVwcm9kdWN0aW9uwqAgwqAgZmFpbDpy
dW5zPGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgfMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKg
IMKgIMKgIMKgIMKgIMKgfDxicj4KJmd0O8KgIMKgIMKgIMKgIDUzMjI6McKgIMKgIMKgIC00OTQz
NzMlwqAgwqAgwqAgwqAgwqAzNzk6McKgIMKgIMKgZG1lc2cudGltZXN0YW1wOmxhc3Q8YnI+CiZn
dDvCoCDCoCDCoCDCoCA1MzIyOjHCoCDCoCDCoCAtNDk0MzczJcKgIMKgIMKgIMKgIMKgMzc5OjHC
oCDCoCDCoGttc2cudGltZXN0YW1wOmxhc3Q8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyBU
aGFua3MgaW4gQWR2YW5jZSEhITxicj4KJmd0OyA8YnI+CiZndDsgQmluY3k8YnI+Cjxicj4KJmd0
OyBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXzxicj4KJmd0
OyBMS1AgbWFpbGluZyBsaXN0IC0tIDxhIGhyZWY9Im1haWx0bzpsa3BAbGlzdHMuMDEub3JnIiB0
YXJnZXQ9Il9ibGFuayI+bGtwQGxpc3RzLjAxLm9yZzwvYT48YnI+CiZndDsgVG8gdW5zdWJzY3Jp
YmUgc2VuZCBhbiBlbWFpbCB0byA8YSBocmVmPSJtYWlsdG86bGtwLWxlYXZlQGxpc3RzLjAxLm9y
ZyIgdGFyZ2V0PSJfYmxhbmsiPmxrcC1sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+PGJyPgo8YnI+Cjwv
YmxvY2txdW90ZT48L2Rpdj4K

--===============2342959164356292925==--

