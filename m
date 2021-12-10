Content-Type: multipart/mixed; boundary="===============3505630933344327959=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [fget] 054aa8d439: will-it-scale.per_thread_ops -5.7% regression
Date: Fri, 10 Dec 2021 13:59:08 -0800
Message-ID: <CAHk-=wh5iFv1MOx6r8zyGYkYGfgfxqcPSrUDwfuOCdis+VR+BQ@mail.gmail.com>
In-Reply-To: <CAHk-=wg1uxUTmdEYgTcxWGQ-s6vb_V_Jux+Z+qwoAcVGkCTDYA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3505630933344327959==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 10, 2021 at 1:25 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> We could make a special light-weight version of files_lookup_fd_raw(),
> I guess. We don't need the *whole* "look it up again".  We don't need
> to re-check the array bounds, and we don't need to do the nospec
> lookup - we would have triggered a NULL file pointer if that happened
> the first time around.
>
> So all we'd need to do is "check that fdt is the same, and check that
> fdt->fd[fd] is the same".

This is an ENTIRELY UNTESTED patch to do that.

It basically rewrites __fget_files() from scratch: it really wants to
do the fd array lookup by hand, in order to cache the intermediate fdt
pointer, and in order to cache the intermediate speculation-safe fd
array index etc.

It's not a very complicated function, and rewriting it actually cleans
up the loop to not need the ugly goto.

I made it use a helper wrapper function for the rcu locking, so that
the "meat" of the function can just use plain "return NULL" for the
error cases.

However, not only is it entirely untested, this rewrite also means
that gcc has now decided that the result is so simple and clear that
it will inline it into all the callers.

I guess that's a good sign - writing the code in a way that makes the
compiler say "now it's so trivial that it should be inlined" is
certainly not a bad thing. But it makes it hard to really compare the
asm.

I did try a version with "noinline" just to make it more comparable,
and hey, it all looked sane to me there too.

I added more comments about what is going on.

Again - this is UNTESTED. I've looked at the code, I've looked at the
diff, and I've looked at the code it generates. It all looks fine to
me. But I've looked at it so much that I suspect that I'd be entirely
blind to any completely obvious bug by now.

Comments?

Oliver, does this make any difference in the performance department?

                 Linus

--===============3505630933344327959==
Content-Type: text/x-patch
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="patch.diff"

IGZzL2ZpbGUuYyB8IDY5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKy0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUzIGluc2VydGlvbnMoKyks
IDE2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2ZzL2ZpbGUuYyBiL2ZzL2ZpbGUuYwppbmRl
eCBhZDRhOGJmM2NmMTAuLjcwNjYyZmIxYWIzMiAxMDA2NDQKLS0tIGEvZnMvZmlsZS5jCisrKyBi
L2ZzL2ZpbGUuYwpAQCAtODQxLDI4ICs4NDEsNjUgQEAgdm9pZCBkb19jbG9zZV9vbl9leGVjKHN0
cnVjdCBmaWxlc19zdHJ1Y3QgKmZpbGVzKQogCXNwaW5fdW5sb2NrKCZmaWxlcy0+ZmlsZV9sb2Nr
KTsKIH0KIAorc3RhdGljIGlubGluZSBzdHJ1Y3QgZmlsZSAqX19mZ2V0X2ZpbGVzX3JjdShzdHJ1
Y3QgZmlsZXNfc3RydWN0ICpmaWxlcywKKwl1bnNpZ25lZCBpbnQgZmQsIGZtb2RlX3QgbWFzaywg
dW5zaWduZWQgaW50IHJlZnMpCit7CisJZm9yICg7OykgeworCQlzdHJ1Y3QgZmlsZSAqZmlsZTsK
KwkJc3RydWN0IGZkdGFibGUgKmZkdCA9IHJjdV9kZXJlZmVyZW5jZV9yYXcoZmlsZXMtPmZkdCk7
CisJCXN0cnVjdCBmaWxlIF9fcmN1ICoqZmRlbnRyeTsKKworCQlpZiAodW5saWtlbHkoZmQgPj0g
ZmR0LT5tYXhfZmRzKSkKKwkJCXJldHVybiBOVUxMOworCisJCWZkZW50cnkgPSBmZHQtPmZkICsg
YXJyYXlfaW5kZXhfbm9zcGVjKGZkLCBmZHQtPm1heF9mZHMpOworCQlmaWxlID0gcmN1X2RlcmVm
ZXJlbmNlX3JhdygqZmRlbnRyeSk7CisJCWlmICh1bmxpa2VseSghZmlsZSkpCisJCQlyZXR1cm4g
TlVMTDsKKworCQlpZiAodW5saWtlbHkoZmlsZS0+Zl9tb2RlICYgbWFzaykpCisJCQlyZXR1cm4g
TlVMTDsKKworCQkvKgorCQkgKiBPaywgd2UgaGF2ZSBhIGZpbGUgcG9pbnRlci4gSG93ZXZlciwg
YmVjYXVzZSB3ZSBkbworCQkgKiB0aGlzIGFsbCBsb2NrbGVzc2x5IHVuZGVyIFJDVSwgd2UgbWF5
IGJlIHJhY2luZyB3aXRoCisJCSAqIHRoYXQgZmlsZSBiZWluZyBjbG9zZWQuCisJCSAqCisJCSAq
IFN1Y2ggYSByYWNlIGNhbiB0YWtlIHR3byBmb3JtczoKKwkJICoKKwkJICogIChhKSB0aGUgZmls
ZSByZWYgYWxyZWFkeSB3ZW50IGRvd24gdG8gemVybywKKwkJICogICAgICBhbmQgZ2V0X2ZpbGVf
cmN1X21hbnkoKSBmYWlscy4gSnVzdCB0cnkKKwkJICogICAgICBhZ2FpbjoKKwkJICovCisJCWlm
ICh1bmxpa2VseSghZ2V0X2ZpbGVfcmN1X21hbnkoZmlsZSwgcmVmcykpKQorCQkJY29udGludWU7
CisKKwkJLyoKKwkJICogIChiKSB0aGUgZmlsZSB0YWJsZSBlbnRyeSBoYXMgY2hhbmdlZCB1bmRl
ciB1cy4KKwkJICoKKwkJICogSWYgc28sIHdlIG5lZWQgdG8gcHV0IG91ciByZWZzIGFuZCB0cnkg
YWdhaW4uCisJCSAqLworCQlpZiAodW5saWtlbHkocmN1X2RlcmVmZXJlbmNlX3JhdyhmaWxlcy0+
ZmR0KSAhPSBmZHQpIHx8CisJCSAgICB1bmxpa2VseShyY3VfZGVyZWZlcmVuY2VfcmF3KCpmZGVu
dHJ5KSAhPSBmaWxlKSkgeworCQkJZnB1dF9tYW55KGZpbGUsIHJlZnMpOworCQkJY29udGludWU7
CisJCX0KKworCQkvKgorCQkgKiBPaywgd2UgaGF2ZSBhIHJlZiB0byB0aGUgZmlsZSwgYW5kIGNo
ZWNrZWQgdGhhdCBpdAorCQkgKiBzdGlsbCBleGlzdHMuCisJCSAqLworCQlyZXR1cm4gZmlsZTsK
Kwl9Cit9CisKIHN0YXRpYyBzdHJ1Y3QgZmlsZSAqX19mZ2V0X2ZpbGVzKHN0cnVjdCBmaWxlc19z
dHJ1Y3QgKmZpbGVzLCB1bnNpZ25lZCBpbnQgZmQsCiAJCQkJIGZtb2RlX3QgbWFzaywgdW5zaWdu
ZWQgaW50IHJlZnMpCiB7CiAJc3RydWN0IGZpbGUgKmZpbGU7CiAKIAlyY3VfcmVhZF9sb2NrKCk7
Ci1sb29wOgotCWZpbGUgPSBmaWxlc19sb29rdXBfZmRfcmN1KGZpbGVzLCBmZCk7Ci0JaWYgKGZp
bGUpIHsKLQkJLyogRmlsZSBvYmplY3QgcmVmIGNvdWxkbid0IGJlIHRha2VuLgotCQkgKiBkdXAy
KCkgYXRvbWljaXR5IGd1YXJhbnRlZSBpcyB0aGUgcmVhc29uCi0JCSAqIHdlIGxvb3AgdG8gY2F0
Y2ggdGhlIG5ldyBmaWxlIChvciBOVUxMIHBvaW50ZXIpCi0JCSAqLwotCQlpZiAoZmlsZS0+Zl9t
b2RlICYgbWFzaykKLQkJCWZpbGUgPSBOVUxMOwotCQllbHNlIGlmICghZ2V0X2ZpbGVfcmN1X21h
bnkoZmlsZSwgcmVmcykpCi0JCQlnb3RvIGxvb3A7Ci0JCWVsc2UgaWYgKGZpbGVzX2xvb2t1cF9m
ZF9yYXcoZmlsZXMsIGZkKSAhPSBmaWxlKSB7Ci0JCQlmcHV0X21hbnkoZmlsZSwgcmVmcyk7Ci0J
CQlnb3RvIGxvb3A7Ci0JCX0KLQl9CisJZmlsZSA9IF9fZmdldF9maWxlc19yY3UoZmlsZXMsIGZk
LCBtYXNrLCByZWZzKTsKIAlyY3VfcmVhZF91bmxvY2soKTsKIAogCXJldHVybiBmaWxlOwo=

--===============3505630933344327959==--

