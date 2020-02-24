Content-Type: multipart/mixed; boundary="===============7094899717955851565=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [perf/x86] 81ec3f3c4c: will-it-scale.per_process_ops -5.5% regression
Date: Mon, 24 Feb 2020 12:47:14 -0800
Message-ID: <CAHk-=wgbR4ocHAOiaj7x+V7dVoYr-mD2N7Y_MRPJ+Q+GohDYeg@mail.gmail.com>
In-Reply-To: <CAHk-=wifdJHrfnmwwzPpH-0X6SaZxtdmRWpSNwf8xsXD2iE4dA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7094899717955851565==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

[ Adding a few more people that tend to be involved in signal
handling. Just in case - even if they probably don't care ]

On Mon, Feb 24, 2020 at 12:09 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> TOTALLY UNTESTED patch attached. It may be completely buggy garbage,
> but it _looks_ trivial enough.

I've tested it, and the profiles on the silly microbenchmark look much
nicer. Now it's just the sigpending update shows up, the refcount case
clearly still occasionally happens, but it's now in the noise.

I made slight changes to the __sigqueue_alloc() case to generate
better code: since we now use that atomic_inc_return() anyway, we
might as well then use the value that is returned for the
RLIMIT_SIGPENDING check too, instead of reading it again.

That might avoid another potential cacheline bounce, plus the
generated code just looks better.

Updated (and now slightly tested!) patch attached.

It would be interesting if this is noticeable on your benchmark
numbers. I didn't actually _time_ anything, I just looked at profiles.

But my setup clearly isn't going to see the horrible contention case
anyway, so my timing numbers wouldn't be all that interesting.

             Linus

--===============7094899717955851565==
Content-Type: text/x-patch
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="patch.diff"

IGtlcm5lbC9zaWduYWwuYyB8IDIzICsrKysrKysrKysrKysrLS0tLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9rZXJu
ZWwvc2lnbmFsLmMgYi9rZXJuZWwvc2lnbmFsLmMKaW5kZXggOWFkOGRlYTkzZGJiLi41YjIzOTYz
NTBkZDEgMTAwNjQ0Ci0tLSBhL2tlcm5lbC9zaWduYWwuYworKysgYi9rZXJuZWwvc2lnbmFsLmMK
QEAgLTQxMywyNyArNDEzLDMyIEBAIF9fc2lncXVldWVfYWxsb2MoaW50IHNpZywgc3RydWN0IHRh
c2tfc3RydWN0ICp0LCBnZnBfdCBmbGFncywgaW50IG92ZXJyaWRlX3JsaW1pCiB7CiAJc3RydWN0
IHNpZ3F1ZXVlICpxID0gTlVMTDsKIAlzdHJ1Y3QgdXNlcl9zdHJ1Y3QgKnVzZXI7CisJaW50IHNp
Z3BlbmRpbmc7CiAKIAkvKgogCSAqIFByb3RlY3QgYWNjZXNzIHRvIEB0IGNyZWRlbnRpYWxzLiBU
aGlzIGNhbiBnbyBhd2F5IHdoZW4gYWxsCiAJICogY2FsbGVycyBob2xkIHJjdSByZWFkIGxvY2su
CisJICoKKwkgKiBOT1RFISBBIHBlbmRpbmcgc2lnbmFsIHdpbGwgaG9sZCBvbiB0byB0aGUgdXNl
ciByZWZjb3VudCwKKwkgKiBhbmQgd2UgZ2V0L3B1dCB0aGUgcmVmY291bnQgb25seSB3aGVuIHRo
ZSBzaWdwZW5kaW5nIGNvdW50CisJICogY2hhbmdlcyBmcm9tL3RvIHplcm8uCiAJICovCiAJcmN1
X3JlYWRfbG9jaygpOwotCXVzZXIgPSBnZXRfdWlkKF9fdGFza19jcmVkKHQpLT51c2VyKTsKLQlh
dG9taWNfaW5jKCZ1c2VyLT5zaWdwZW5kaW5nKTsKKwl1c2VyID0gX190YXNrX2NyZWQodCktPnVz
ZXI7CisJc2lncGVuZGluZyA9IGF0b21pY19pbmNfcmV0dXJuKCZ1c2VyLT5zaWdwZW5kaW5nKTsK
KwlpZiAoc2lncGVuZGluZyA9PSAxKQorCQlnZXRfdWlkKHVzZXIpOwogCXJjdV9yZWFkX3VubG9j
aygpOwogCi0JaWYgKG92ZXJyaWRlX3JsaW1pdCB8fAotCSAgICBhdG9taWNfcmVhZCgmdXNlci0+
c2lncGVuZGluZykgPD0KLQkJCXRhc2tfcmxpbWl0KHQsIFJMSU1JVF9TSUdQRU5ESU5HKSkgewor
CWlmIChvdmVycmlkZV9ybGltaXQgfHwgbGlrZWx5KHNpZ3BlbmRpbmcgPD0gdGFza19ybGltaXQo
dCwgUkxJTUlUX1NJR1BFTkRJTkcpKSkgewogCQlxID0ga21lbV9jYWNoZV9hbGxvYyhzaWdxdWV1
ZV9jYWNoZXAsIGZsYWdzKTsKIAl9IGVsc2UgewogCQlwcmludF9kcm9wcGVkX3NpZ25hbChzaWcp
OwogCX0KIAogCWlmICh1bmxpa2VseShxID09IE5VTEwpKSB7Ci0JCWF0b21pY19kZWMoJnVzZXIt
PnNpZ3BlbmRpbmcpOwotCQlmcmVlX3VpZCh1c2VyKTsKKwkJaWYgKGF0b21pY19kZWNfYW5kX3Rl
c3QoJnVzZXItPnNpZ3BlbmRpbmcpKQorCQkJZnJlZV91aWQodXNlcik7CiAJfSBlbHNlIHsKIAkJ
SU5JVF9MSVNUX0hFQUQoJnEtPmxpc3QpOwogCQlxLT5mbGFncyA9IDA7CkBAIC00NDcsOCArNDUy
LDggQEAgc3RhdGljIHZvaWQgX19zaWdxdWV1ZV9mcmVlKHN0cnVjdCBzaWdxdWV1ZSAqcSkKIHsK
IAlpZiAocS0+ZmxhZ3MgJiBTSUdRVUVVRV9QUkVBTExPQykKIAkJcmV0dXJuOwotCWF0b21pY19k
ZWMoJnEtPnVzZXItPnNpZ3BlbmRpbmcpOwotCWZyZWVfdWlkKHEtPnVzZXIpOworCWlmIChhdG9t
aWNfZGVjX2FuZF90ZXN0KCZxLT51c2VyLT5zaWdwZW5kaW5nKSkKKwkJZnJlZV91aWQocS0+dXNl
cik7CiAJa21lbV9jYWNoZV9mcmVlKHNpZ3F1ZXVlX2NhY2hlcCwgcSk7CiB9CiAK

--===============7094899717955851565==--

