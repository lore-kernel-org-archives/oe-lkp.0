Content-Type: multipart/mixed; boundary="===============8528557556826665304=="
MIME-Version: 1.0
From: Li, Aubrey <aubrey.li@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/platform, acpi] 7486341a98f: genirq: Flags mismatch irq 8. 00000080 (mmc0) vs. 00000000 (rtc0)
Date: Mon, 30 Mar 2015 16:28:00 +0800
Message-ID: <55190910.3010905@linux.intel.com>
In-Reply-To: <5513F807.7070304@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8528557556826665304==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Ying,

can you please try this patch to see if the problem is gone on your side?

Thanks,
-Aubrey


On 2015/3/26 20:13, Li, Aubrey wrote:
> On 2015/3/25 15:22, Huang Ying wrote:
>> [   28.745155] genirq: Flags mismatch irq 8. 00000080 (mmc0) vs. 0000000=
0 (rtc0)
> =

> okay, I replicated this on my side now.
> =

> Firstly, I don't think the patch did anything wrong. However, the patch
> exposes a few issues FWICT currently:
> =

> - Should we enable RTC Alarm the kind of Fixed hardware event in
> hardware-reduced ACPI mode? I found RTC required registers in ACPI PM
> block are not valid(register address =3D 0)
> =

> - I checked RTC device in ACPI table, there is no interrupt resource
> under RTC(firmware bug?), So irq 8 should be a hardcoded number. The
> question is, shouldn't we update bitmap of allocated_irqs here? Or we
> assume irq0~15 is reserved? If we assume IRQ0~15 is reserved, then
> requesting IRQ8 without updating bitmap of allocated_irqs is fine.
> =

> - Because we don't update bitmap of allocated_irqs when RTC request
> IRQ8, so when MMC driver allocate irq resource, it's possible it gets
> irq8, so we saw "genirq: Flags mismatch irq 8. 00000080 (mmc0) vs.
> 00000000 (rtc0)". So here is another question, when we dynamically
> allocate irq from irq domain, shouldn't we start from IRQ16? Yes, if
> allocated_irqs bitmap is updated, then it should be fine if we start
> from IRQ1.
> =

> What the patch does is, it changes the behavior of how we allocate irq
> from irq domain. Previously we have legacy IRQs so we statically assign
> IRQ numbers for IOAPICs to host legacy IRQs, and now we allocate every
> IRQ dynamically.
> =

> For me I think I can deliver a patch against RTC driver to update
> allocated_irqs bitmap, also, we should free irq when we found RTC ACPI
> registers are not valid.
> =

> Certainly I'm open to any suggestions.
> =

> Thanks,
> -Aubrey
> =



--===============8528557556826665304==
Content-Type: text/x-patch
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-x86-platform-acpi-Statically-assign-IRQ-numbers-in-A.patch"

PkZyb20gNDY1MjRhY2U5NGVhZjY4Yzk3MTk3MjU0NzJhYjRlYTI4ZDA3OWE3YiBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKRnJvbTogQXVicmV5IExpIDxhdWJyZXkubGlAaW50ZWwuY29tPgpEYXRl
OiBNb24sIDMwIE1hciAyMDE1IDEwOjUwOjA5IC0wNTAwClN1YmplY3Q6IFtQQVRDSF0geDg2L3Bs
YXRmb3JtLCBhY3BpOiBTdGF0aWNhbGx5IGFzc2lnbiBJUlEgbnVtYmVycyBpbiBBQ1BJCiBoYXJk
d2FyZSByZWR1Y2VkIG1vZGUKCldlIHNob3VsZCBiZSBhYmxlIHRvIGR5bmFtaWNhbGx5IGFzc2ln
biBJUlEgbnVtYmVyIG9uIHRoZSBwbGF0Zm9ybSBpbiBBQ1BJCkhhcmR3YXJlLXJlZHVjZWQgbW9k
ZSwgYnV0IG9uIHRoZSBCYXkgVHJhaWwtVChBU1VTLVQxMDApIHBsYXRmb3JtLCB0aGVyZSBpcwph
IFJUQyBkZXZpY2Ugc3RpbGwgdXNpbmcgdGhlIGxlZ2FjeSBoYXJkY29kZWQgSVJROCwgd2hpY2gg
Y291bGQgY2F1c2UgdGhlCmZvbGxvd2luZyBlcnJvcjoKCjc0ODYzNDFhOThmOiBnZW5pcnE6IEZs
YWdzIG1pc21hdGNoIGlycSA4LiAwMDAwMDA4MCAobW1jMCkgdnMuIDAwMDAwMDAwIChydGMwKQoK
U28gd2Ugd2FudCB0byBzdGF0aWNhbGx5IGFzc2lnbiBJUlEgbnVtYmVycyBpbiBBQ1BJIGhhcmR3
YXJlIHJlZHVjZWQgbW9kZSB0bwpmaXggdGhpcyBlcnJvcgoKU2lnbmVkLW9mZi1ieTogTGkgQXVi
cmV5IDxhdWJyZXkubGlAbGludXguaW50ZWwuY29tPgpDYzogQWxhbiBDb3ggPGFsYW5AbGludXgu
aW50ZWwuY29tPgpDYzogTGVuIEJyb3duIDxsZW4uYnJvd25AaW50ZWwuY29tPgpDYzogUmFmYWVs
IEouIFd5c29ja2kgPHJhZmFlbC5qLnd5c29ja2lAaW50ZWwuY29tPgpDYzogQXJqYW4gdmFuIGRl
IFZlbiA8YXJqYW5AbGludXguaW50ZWwuY29tPgotLS0KIGFyY2gveDg2L2tlcm5lbC9hY3BpL2Jv
b3QuYyB8IDggKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva2VybmVsL2FjcGkvYm9vdC5jIGIvYXJj
aC94ODYva2VybmVsL2FjcGkvYm9vdC5jCmluZGV4IDgwM2I2ODQuLjRjZDA3NjEgMTAwNjQ0Ci0t
LSBhL2FyY2gveDg2L2tlcm5lbC9hY3BpL2Jvb3QuYworKysgYi9hcmNoL3g4Ni9rZXJuZWwvYWNw
aS9ib290LmMKQEAgLTQ2MCw4ICs0NjAsMTIgQEAgYWNwaV9wYXJzZV9pb2FwaWMoc3RydWN0IGFj
cGlfc3VidGFibGVfaGVhZGVyICogaGVhZGVyLCBjb25zdCB1bnNpZ25lZCBsb25nIGVuZCkKIAog
CWFjcGlfdGFibGVfcHJpbnRfbWFkdF9lbnRyeShoZWFkZXIpOwogCi0JLyogU3RhdGljYWxseSBh
c3NpZ24gSVJRIG51bWJlcnMgZm9yIElPQVBJQ3MgaG9zdGluZyBsZWdhY3kgSVJRcyAqLwotCWlm
IChpb2FwaWMtPmdsb2JhbF9pcnFfYmFzZSA8IG5yX2xlZ2FjeV9pcnFzKCkpCisJLyoKKwkgKiBT
dGF0aWNhbGx5IGFzc2lnbiBJUlEgbnVtYmVycyBmb3IgSU9BUElDcyBob3N0aW5nIGxlZ2FjeSBJ
UlFzLAorCSAqIE9yIGZvciB0aGUgcGxhdGZvcm0gaW4gSGFyZHdhcmUtcmVkdWNlZCBBQ1BJIG1v
ZGVsCisJICovCisJaWYgKGlvYXBpYy0+Z2xvYmFsX2lycV9iYXNlIDwgbnJfbGVnYWN5X2lycXMo
KSB8fAorCQlhY3BpX2dibF9yZWR1Y2VkX2hhcmR3YXJlKQogCQljZmcudHlwZSA9IElPQVBJQ19E
T01BSU5fTEVHQUNZOwogCiAJbXBfcmVnaXN0ZXJfaW9hcGljKGlvYXBpYy0+aWQsIGlvYXBpYy0+
YWRkcmVzcywgaW9hcGljLT5nbG9iYWxfaXJxX2Jhc2UsCi0tIAoxLjkuMQoK

--===============8528557556826665304==--

