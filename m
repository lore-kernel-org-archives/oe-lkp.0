Content-Type: multipart/mixed; boundary="===============4966794628757464579=="
MIME-Version: 1.0
From: huang ying <huang.ying.caritas@gmail.com>
To: lkp@lists.01.org
Subject: Re: [timer] 17cdf560f27: +4.0% boot-meminfo.VmallocUsed
Date: Fri, 03 Apr 2015 09:03:48 +0800
Message-ID: <CAC=cRTNjmJF6icPUrWdgJu8wcX-fKpgTo9V4o6wA5z-8sfncwA@mail.gmail.com>
In-Reply-To: <20150402075443.GR23123@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============4966794628757464579==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2015 at 3:54 PM, Peter Zijlstra <peterz@infradead.org> wro=
te:

> On Thu, Apr 02, 2015 at 09:06:09AM +0800, Huang Ying wrote:
> > FYI, we noticed the below changes on
> >
> > git://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git
> timer/alloc_tvec_statically
> > commit 17cdf560f2727f687ab159707d0aa591f8a2f82d ("timer: Allocate
> per-cpu tvec_base's statically")
> >
> >
> > testbox/testcase/testparams: lkp-sbx04/boot/performance-1
> >
> > c5e77f5216abdd1d  17cdf560f2727f687ab159707d
> > ----------------  --------------------------
> >          %stddev     %change         %stddev
> >              \          |                \
> >     410996 =C2=B1  0%      +4.0%     427412 =C2=B1  0%  boot-meminfo.Vm=
allocUsed
> >
> > testbox/testcase/testparams: wsm/boot/performance-1
> >
> > c5e77f5216abdd1d  17cdf560f2727f687ab159707d
> > ----------------  --------------------------
> >      85712 =C2=B1  0%      +2.4%      87772 =C2=B1  0%  boot-meminfo.Vm=
allocUsed
> >
> > testbox/testcase/testparams: lkp-snb01/boot/performance-1
> >
> > c5e77f5216abdd1d  17cdf560f2727f687ab159707d
> > ----------------  --------------------------
> >     447001 =C2=B1  0%      -1.0%     442558 =C2=B1  0%  boot-slabinfo.n=
um_objs
> >     125616 =C2=B1  5%     -13.5%     108720 =C2=B1  4%  boot-meminfo.Di=
rectMap4k
> >     347196 =C2=B1  0%      +4.7%     363612 =C2=B1  0%  boot-meminfo.Vm=
allocUsed
> >
>
> well, duh.. it changes a dynamic allocation into a static per-cpu one.
> What did you expect?
>

Just FYI.  This may be the expected behavior.  If so, you have a third
party test report.

Best Regards,
Huang, Yin

--===============4966794628757464579==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBjbGFzcz0iZ21haWxfZXh0cmEiPjxkaXYgY2xhc3M9ImdtYWls
X3F1b3RlIj5PbiBUaHUsIEFwciAyLCAyMDE1IGF0IDM6NTQgUE0sIFBldGVyIFppamxzdHJhIDxz
cGFuIGRpcj0ibHRyIj4mbHQ7PGEgaHJlZj0ibWFpbHRvOnBldGVyekBpbmZyYWRlYWQub3JnIiB0
YXJnZXQ9Il9ibGFuayI+cGV0ZXJ6QGluZnJhZGVhZC5vcmc8L2E+Jmd0Ozwvc3Bhbj4gd3JvdGU6
PGJyPjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAu
OGV4O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPjxzcGFuIGNs
YXNzPSIiPk9uIFRodSwgQXByIDAyLCAyMDE1IGF0IDA5OjA2OjA5QU0gKzA4MDAsIEh1YW5nIFlp
bmcgd3JvdGU6PGJyPgomZ3Q7IEZZSSwgd2Ugbm90aWNlZCB0aGUgYmVsb3cgY2hhbmdlcyBvbjxi
cj4KJmd0Ozxicj4KJmd0OyBnaXQ6Ly88YSBocmVmPSJodHRwOi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L3ZpcmVzaGsvbGludXguZ2l0IiB0YXJnZXQ9Il9ibGFuayI+
Z2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3ZpcmVzaGsvbGludXguZ2l0
PC9hPiB0aW1lci9hbGxvY190dmVjX3N0YXRpY2FsbHk8YnI+CiZndDsgY29tbWl0IDE3Y2RmNTYw
ZjI3MjdmNjg3YWIxNTk3MDdkMGFhNTkxZjhhMmY4MmQgKCZxdW90O3RpbWVyOiBBbGxvY2F0ZSBw
ZXItY3B1IHR2ZWNfYmFzZSYjMzk7cyBzdGF0aWNhbGx5JnF1b3Q7KTxicj4KJmd0Ozxicj4KJmd0
Ozxicj4KJmd0OyB0ZXN0Ym94L3Rlc3RjYXNlL3Rlc3RwYXJhbXM6IGxrcC1zYngwNC9ib290L3Bl
cmZvcm1hbmNlLTE8YnI+CiZndDs8YnI+CiZndDsgYzVlNzdmNTIxNmFiZGQxZMKgIDE3Y2RmNTYw
ZjI3MjdmNjg3YWIxNTk3MDdkPGJyPgomZ3Q7IC0tLS0tLS0tLS0tLS0tLS3CoCAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLTxicj4KJmd0O8KgIMKgIMKgIMKgIMKgICVzdGRkZXbCoCDCoCDCoCVj
aGFuZ2XCoCDCoCDCoCDCoCDCoCVzdGRkZXY8YnI+CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCBc
wqAgwqAgwqAgwqAgwqAgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFw8YnI+CiZndDvCoCDCoCDC
oDQxMDk5NiDCscKgIDAlwqAgwqAgwqAgKzQuMCXCoCDCoCDCoDQyNzQxMiDCscKgIDAlwqAgYm9v
dC1tZW1pbmZvLlZtYWxsb2NVc2VkPGJyPgomZ3Q7PGJyPgomZ3Q7IHRlc3Rib3gvdGVzdGNhc2Uv
dGVzdHBhcmFtczogd3NtL2Jvb3QvcGVyZm9ybWFuY2UtMTxicj4KJmd0Ozxicj4KJmd0OyBjNWU3
N2Y1MjE2YWJkZDFkwqAgMTdjZGY1NjBmMjcyN2Y2ODdhYjE1OTcwN2Q8YnI+CiZndDsgLS0tLS0t
LS0tLS0tLS0tLcKgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tPGJyPgomZ3Q7wqAgwqAgwqAg
ODU3MTIgwrHCoCAwJcKgIMKgIMKgICsyLjQlwqAgwqAgwqAgODc3NzIgwrHCoCAwJcKgIGJvb3Qt
bWVtaW5mby5WbWFsbG9jVXNlZDxicj4KJmd0Ozxicj4KJmd0OyB0ZXN0Ym94L3Rlc3RjYXNlL3Rl
c3RwYXJhbXM6IGxrcC1zbmIwMS9ib290L3BlcmZvcm1hbmNlLTE8YnI+CiZndDs8YnI+CiZndDsg
YzVlNzdmNTIxNmFiZGQxZMKgIDE3Y2RmNTYwZjI3MjdmNjg3YWIxNTk3MDdkPGJyPgomZ3Q7IC0t
LS0tLS0tLS0tLS0tLS3CoCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLTxicj4KJmd0O8KgIMKg
IMKgNDQ3MDAxIMKxwqAgMCXCoCDCoCDCoCAtMS4wJcKgIMKgIMKgNDQyNTU4IMKxwqAgMCXCoCBi
b290LXNsYWJpbmZvLm51bV9vYmpzPGJyPgomZ3Q7wqAgwqAgwqAxMjU2MTYgwrHCoCA1JcKgIMKg
IMKgLTEzLjUlwqAgwqAgwqAxMDg3MjAgwrHCoCA0JcKgIGJvb3QtbWVtaW5mby5EaXJlY3RNYXA0
azxicj4KJmd0O8KgIMKgIMKgMzQ3MTk2IMKxwqAgMCXCoCDCoCDCoCArNC43JcKgIMKgIMKgMzYz
NjEyIMKxwqAgMCXCoCBib290LW1lbWluZm8uVm1hbGxvY1VzZWQ8YnI+CiZndDs8YnI+Cjxicj4K
PC9zcGFuPndlbGwsIGR1aC4uIGl0IGNoYW5nZXMgYSBkeW5hbWljIGFsbG9jYXRpb24gaW50byBh
IHN0YXRpYyBwZXItY3B1IG9uZS48YnI+CldoYXQgZGlkIHlvdSBleHBlY3Q/PGJyPjwvYmxvY2tx
dW90ZT48L2Rpdj48YnI+PC9kaXY+PGRpdiBjbGFzcz0iZ21haWxfZXh0cmEiPkp1c3QgRllJLsKg
IFRoaXMgbWF5IGJlIHRoZSBleHBlY3RlZCBiZWhhdmlvci7CoCBJZiBzbywgeW91IGhhdmUgYSB0
aGlyZCBwYXJ0eSB0ZXN0IHJlcG9ydC48YnI+PGJyPjwvZGl2PjxkaXYgY2xhc3M9ImdtYWlsX2V4
dHJhIj5CZXN0IFJlZ2FyZHMsPGJyPjwvZGl2PjxkaXYgY2xhc3M9ImdtYWlsX2V4dHJhIj5IdWFu
ZywgWWluPGJyPjxicj48L2Rpdj48L2Rpdj4K

--===============4966794628757464579==--

