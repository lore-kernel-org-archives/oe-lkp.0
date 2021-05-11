Content-Type: multipart/mixed; boundary="===============5176479747367973078=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [percpu] ace7e70901: aim9.sync_disk_rw.ops_per_sec -2.3% regression
Date: Tue, 11 May 2021 10:13:06 +0800
Message-ID: <20210511021306.GA8539@xsang-OptiPlex-9020>
In-Reply-To: <YJV+Vn9eGfIlxDQE@carbon.dhcp.thefacebook.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5176479747367973078==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Roman,

On Fri, May 07, 2021 at 10:52:22AM -0700, Roman Gushchin wrote:
> On Fri, May 07, 2021 at 11:06:06AM +0800, Oliver Sang wrote:
> > hi Roman,
> >  =

> > On Thu, May 06, 2021 at 12:54:59AM +0000, Roman Gushchin wrote:
> > > Ping
> > =

> > sorry for late.
> > =

> > the new patch makes the performance a little better but still has
> > 1.9% regression comparing to
> > f183324133 ("percpu: implement partial chunk depopulation")
> =

> Hi Oliver!
> =

> Thank you for testing it!
> =

> Btw, can you, please, confirm that the regression is coming specifically
> from ace7e70901 ("percpu: use reclaim threshold instead of running for ev=
ery page")?
> I do see *some* regression in my setup, but the data is very noisy, so I'=
m not sure
> I can confirm it.
> =

> Thanks!

sorry for late. according to our tests, the answer seems be yes.
let me explain our test a little, we found the KPI (here is aim9)
droped, then an automatic bisection was triggered. the ace7e70901
was finally recognized as the commit introduced the change.

since it's a bisection result, we have test data for both parent
and this commit. (BTW, we make sure the config for both kernels are
same)

for this bisect, we tested 6 times for both parent and ace7e70901,
and the data is stable, as below:

parent:
f183324133ea535db4127f9fad3e19725ca88bf3/avg.json:  "aim9.sync_disk_rw.ops_=
per_sec": 103531.76166666666,

f183324133ea535db4127f9fad3e19725ca88bf3/matrix.json:  "aim9.sync_disk_rw.o=
ps_per_sec": [
f183324133ea535db4127f9fad3e19725ca88bf3/matrix.json-    103673.09,
f183324133ea535db4127f9fad3e19725ca88bf3/matrix.json-    102188.39,
f183324133ea535db4127f9fad3e19725ca88bf3/matrix.json-    104325.06,
f183324133ea535db4127f9fad3e19725ca88bf3/matrix.json-    104038.4,
f183324133ea535db4127f9fad3e19725ca88bf3/matrix.json-    102908.57,
f183324133ea535db4127f9fad3e19725ca88bf3/matrix.json-    104057.06
f183324133ea535db4127f9fad3e19725ca88bf3/matrix.json-  ],

ace7e70901:
ace7e7090137ee996757eb5eebc94439b0e2803a/avg.json:  "aim9.sync_disk_rw.ops_=
per_sec": 101102.73857142858,

ace7e7090137ee996757eb5eebc94439b0e2803a/matrix.json:  "aim9.sync_disk_rw.o=
ps_per_sec": [
ace7e7090137ee996757eb5eebc94439b0e2803a/matrix.json-    101193.43,
ace7e7090137ee996757eb5eebc94439b0e2803a/matrix.json-    100689.98,
ace7e7090137ee996757eb5eebc94439b0e2803a/matrix.json-    100988.63,
ace7e7090137ee996757eb5eebc94439b0e2803a/matrix.json-    100732.64,
ace7e7090137ee996757eb5eebc94439b0e2803a/matrix.json-    101389.69,
ace7e7090137ee996757eb5eebc94439b0e2803a/matrix.json-    101662.74,
ace7e7090137ee996757eb5eebc94439b0e2803a/matrix.json-    101062.06
ace7e7090137ee996757eb5eebc94439b0e2803a/matrix.json-  ],

--===============5176479747367973078==--

