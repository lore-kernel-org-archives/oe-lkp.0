Content-Type: multipart/mixed; boundary="===============5967750736284697897=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
To: lkp@lists.01.org
Subject: Re: [rcu] [ INFO: suspicious RCU usage. ]
Date: Wed, 04 Feb 2015 16:22:28 +0100
Message-ID: <1423063348.24415.10.camel@AMDC1943>
In-Reply-To: <20150204151028.GD5370@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5967750736284697897==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On =C5=9Bro, 2015-02-04 at 07:10 -0800, Paul E. McKenney wrote:
> On Wed, Feb 04, 2015 at 03:16:27PM +0100, Krzysztof Kozlowski wrote:
> > On =C5=9Bro, 2015-02-04 at 05:14 -0800, Paul E. McKenney wrote:
> > > On Wed, Feb 04, 2015 at 01:00:18PM +0000, Russell King - ARM Linux wr=
ote:
> > > > On Wed, Feb 04, 2015 at 12:39:07PM +0100, Krzysztof Kozlowski wrote:
> > > > > +Cc some ARM people
> > > > =

> > > > I wish that people would CC this list with problems seen on ARM.  I=
'm
> > > > minded to just ignore this message because of this in the hope that=
 by
> > > > doing so, people will learn something...
> > > > =

> > > > > > Another thing I could do would be to have an arch-specific Kcon=
fig
> > > > > > variable that made ARM responsible for informing RCU that the C=
PU
> > > > > > was departing, which would allow a call to as follows to be pla=
ced
> > > > > > immediately after the complete():
> > > > > > =

> > > > > > rcu_cpu_notify(NULL, CPU_DYING_IDLE, (void *)(long)smp_processo=
r_id());
> > > > > > =

> > > > > > Note:  This absolutely requires that the rcu_cpu_notify() -alwa=
ys-
> > > > > > be allowed to execute!!!  This will not work if there is -any- =
possibility
> > > > > > of __cpu_die() powering off the outgoing CPU before the call to
> > > > > > rcu_cpu_notify() returns.
> > > > =

> > > > Exactly, so that's not going to be possible.  The completion at that
> > > > point marks the point at which power _could_ be removed from the CPU
> > > > going down.
> > > =

> > > OK, sounds like a polling loop is required.
> > =

> > I thought about using wait_on_bit() in __cpu_die() (the waiting thread)
> > and clearing the bit on CPU being powered down. What do you think about
> > such idea?
> =

> Hmmm...  It looks to me that wait_on_bit() calls out_of_line_wait_on_bit(=
),
> which in turn calls __wait_on_bit(), which calls prepare_to_wait() and
> finish_wait().  These are in the scheduler, but this is being called from
> the CPU that remains online, so that should be OK.
> =

> But what do you invoke on the outgoing CPU?  Can you get away with
> simply clearing the bit, or do you also have to do a wakeup?  It looks
> to me like a wakeup is required, which would be illegal on the outgoing
> CPU, which is at a point where it cannot legally invoke the scheduler.
> Or am I missing something?

Actually the timeout versions but I think that doesn't matter.
The wait_on_bit will busy-loop with testing for the bit. Inside the loop
it calls the 'action' which in my case will be bit_wait_io_timeout().
This calls schedule_timeout().

See proof of concept in attachment. One observed issue: hot unplug from
commandline takes a lot more time. About 7 seconds instead of ~0.5.
Probably I did something wrong.

> =

> You know, this situation is giving me a bad case of nostalgia for the
> old Sequent Symmetry and NUMA-Q hardware.  On those platforms, the
> outgoing CPU could turn itself off, and thus didn't need to tell some
> other CPU when it was ready to be turned off.  Seems to me that this
> self-turn-off capability would be a great feature for future systems!

There are a lot more issues with hotplug on ARM...

Patch/RFC attached.


--===============5967750736284697897==
Content-Type: text/x-patch
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ARM-Don-t-use-complete-during-__cpu_die.patch"

PkZyb20gZmVhYWQxOGE0ODM4NzE3NDcxNzBmYTc5N2Y4MGI0OTU5MjQ4OWFkMSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8ay5rb3psb3dza2lAc2Ft
c3VuZy5jb20+CkRhdGU6IFdlZCwgNCBGZWIgMjAxNSAxNjoxNDo0MSArMDEwMApTdWJqZWN0OiBb
UkZDXSBBUk06IERvbid0IHVzZSBjb21wbGV0ZSgpIGR1cmluZyBfX2NwdV9kaWUKClRoZSBjb21w
bGV0ZSgpIHNob3VsZCBub3QgYmUgdXNlZCBvbiBvZmZsaW5lZCBDUFUuCgpTaWduZWQtb2ZmLWJ5
OiBLcnp5c3p0b2YgS296bG93c2tpIDxrLmtvemxvd3NraUBzYW1zdW5nLmNvbT4KLS0tCiBhcmNo
L2FybS9rZXJuZWwvc21wLmMgfCAyMiArKysrKysrKysrKysrKysrKystLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNo
L2FybS9rZXJuZWwvc21wLmMgYi9hcmNoL2FybS9rZXJuZWwvc21wLmMKaW5kZXggODZlZjI0NGM1
YTI0Li5mM2E1YWQ4MGEyNTMgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2tlcm5lbC9zbXAuYworKysg
Yi9hcmNoL2FybS9rZXJuZWwvc21wLmMKQEAgLTI2LDYgKzI2LDcgQEAKICNpbmNsdWRlIDxsaW51
eC9jb21wbGV0aW9uLmg+CiAjaW5jbHVkZSA8bGludXgvY3B1ZnJlcS5oPgogI2luY2x1ZGUgPGxp
bnV4L2lycV93b3JrLmg+CisjaW5jbHVkZSA8bGludXgvd2FpdC5oPgogCiAjaW5jbHVkZSA8bGlu
dXgvYXRvbWljLmg+CiAjaW5jbHVkZSA8YXNtL3NtcC5oPgpAQCAtNzYsNiArNzcsOSBAQCBlbnVt
IGlwaV9tc2dfdHlwZSB7CiAKIHN0YXRpYyBERUNMQVJFX0NPTVBMRVRJT04oY3B1X3J1bm5pbmcp
OwogCisjZGVmaW5lIENQVV9ESUVfV0FJVF9CSVQJCTAKK3N0YXRpYyB1bnNpZ25lZCBsb25nIHdh
aXRfY3B1X2RpZTsKKwogc3RhdGljIHN0cnVjdCBzbXBfb3BlcmF0aW9ucyBzbXBfb3BzOwogCiB2
b2lkIF9faW5pdCBzbXBfc2V0X29wcyhzdHJ1Y3Qgc21wX29wZXJhdGlvbnMgKm9wcykKQEAgLTEz
Myw3ICsxMzcsNyBAQCBpbnQgX19jcHVfdXAodW5zaWduZWQgaW50IGNwdSwgc3RydWN0IHRhc2tf
c3RydWN0ICppZGxlKQogCQlwcl9lcnIoIkNQVSV1OiBmYWlsZWQgdG8gYm9vdDogJWRcbiIsIGNw
dSwgcmV0KTsKIAl9CiAKLQorCXNldF9iaXQoQ1BVX0RJRV9XQUlUX0JJVCwgJndhaXRfY3B1X2Rp
ZSk7CiAJbWVtc2V0KCZzZWNvbmRhcnlfZGF0YSwgMCwgc2l6ZW9mKHNlY29uZGFyeV9kYXRhKSk7
CiAJcmV0dXJuIHJldDsKIH0KQEAgLTIxMyw3ICsyMTcsMTcgQEAgaW50IF9fY3B1X2Rpc2FibGUo
dm9pZCkKIAlyZXR1cm4gMDsKIH0KIAotc3RhdGljIERFQ0xBUkVfQ09NUExFVElPTihjcHVfZGll
ZCk7CitzdGF0aWMgaW50IHdhaXRfZm9yX2NwdV9kaWUodm9pZCkKK3sKKwltaWdodF9zbGVlcCgp
OworCisJaWYgKCF0ZXN0X2JpdChDUFVfRElFX1dBSVRfQklULCAmd2FpdF9jcHVfZGllKSkKKwkJ
cmV0dXJuIDA7CisKKwlyZXR1cm4gb3V0X29mX2xpbmVfd2FpdF9vbl9iaXRfdGltZW91dCgmd2Fp
dF9jcHVfZGllLCBDUFVfRElFX1dBSVRfQklULAorCQkJCQliaXRfd2FpdF90aW1lb3V0LCBUQVNL
X1VOSU5URVJSVVBUSUJMRSwKKwkJCQkJbXNlY3NfdG9famlmZmllcyg1MDAwKSk7Cit9CiAKIC8q
CiAgKiBjYWxsZWQgb24gdGhlIHRocmVhZCB3aGljaCBpcyBhc2tpbmcgZm9yIGEgQ1BVIHRvIGJl
IHNodXRkb3duIC0KQEAgLTIyMSw3ICsyMzUsNyBAQCBzdGF0aWMgREVDTEFSRV9DT01QTEVUSU9O
KGNwdV9kaWVkKTsKICAqLwogdm9pZCBfX2NwdV9kaWUodW5zaWduZWQgaW50IGNwdSkKIHsKLQlp
ZiAoIXdhaXRfZm9yX2NvbXBsZXRpb25fdGltZW91dCgmY3B1X2RpZWQsIG1zZWNzX3RvX2ppZmZp
ZXMoNTAwMCkpKSB7CisJaWYgKHdhaXRfZm9yX2NwdV9kaWUoKSkgewogCQlwcl9lcnIoIkNQVSV1
OiBjcHUgZGlkbid0IGRpZVxuIiwgY3B1KTsKIAkJcmV0dXJuOwogCX0KQEAgLTI2Nyw3ICsyODEs
NyBAQCB2b2lkIF9fcmVmIGNwdV9kaWUodm9pZCkKIAkgKiB0aGlzIHJldHVybnMsIHBvd2VyIGFu
ZC9vciBjbG9ja3MgY2FuIGJlIHJlbW92ZWQgYXQgYW55IHBvaW50CiAJICogZnJvbSB0aGlzIENQ
VSBhbmQgaXRzIGNhY2hlIGJ5IHBsYXRmb3JtX2NwdV9raWxsKCkuCiAJICovCi0JY29tcGxldGUo
JmNwdV9kaWVkKTsKKwljbGVhcl9iaXQoQ1BVX0RJRV9XQUlUX0JJVCwgJndhaXRfY3B1X2RpZSk7
CiAKIAkvKgogCSAqIEVuc3VyZSB0aGF0IHRoZSBjYWNoZSBsaW5lcyBhc3NvY2lhdGVkIHdpdGgg
dGhhdCBjb21wbGV0aW9uIGFyZQotLSAKMS45LjEKCg==

--===============5967750736284697897==--

