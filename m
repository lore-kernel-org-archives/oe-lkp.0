Content-Type: multipart/mixed; boundary="===============3521339385346095235=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [perf/x86] 81ec3f3c4c: will-it-scale.per_process_ops -5.5% regression
Date: Mon, 24 Feb 2020 12:09:04 -0800
Message-ID: <CAHk-=wifdJHrfnmwwzPpH-0X6SaZxtdmRWpSNwf8xsXD2iE4dA@mail.gmail.com>
In-Reply-To: <CAHk-=wjkSb1OkiCSn_fzf2v7A=K0bNsUEeQa+06XMhTO+oQUaA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3521339385346095235==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2020 at 11:24 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I don't know. This does not seem to be a particularly serious load.
> But it does feel like it should be possible to combine the two atomic
> accesses into one, where you don't need to do the refcount thing
> except for the case where sigcount goes from zero to non-zero (and
> back to zero again).

Ok, that looks just as simple as I thought it would be.

TOTALLY UNTESTED patch attached. It may be completely buggy garbage,
but it _looks_ trivial enough. Just make the rule be that "if we have
any user->sigpending cases, we'll get a ref to the user for the first
one, and drop it only when getting rid of the last one".

So it might be worth testing this. But again: I have NOT done so.

There might be some silly reason why this doesn't work because I just
did the tests wrong or missed some case.

Or there might be some subtle reason why it doesn't work because I
didn't think this through properly.

But it _looks_ obvious and simple enough. And it compiles for me. So
maybe it works.

              Linus

--===============3521339385346095235==
Content-Type: text/x-patch
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="patch.diff"

IGtlcm5lbC9zaWduYWwuYyB8IDE3ICsrKysrKysrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MTEgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9rZXJuZWwvc2ln
bmFsLmMgYi9rZXJuZWwvc2lnbmFsLmMKaW5kZXggOWFkOGRlYTkzZGJiLi4wMGFkZGFhODMxOWYg
MTAwNjQ0Ci0tLSBhL2tlcm5lbC9zaWduYWwuYworKysgYi9rZXJuZWwvc2lnbmFsLmMKQEAgLTQx
NywxMCArNDE3LDE1IEBAIF9fc2lncXVldWVfYWxsb2MoaW50IHNpZywgc3RydWN0IHRhc2tfc3Ry
dWN0ICp0LCBnZnBfdCBmbGFncywgaW50IG92ZXJyaWRlX3JsaW1pCiAJLyoKIAkgKiBQcm90ZWN0
IGFjY2VzcyB0byBAdCBjcmVkZW50aWFscy4gVGhpcyBjYW4gZ28gYXdheSB3aGVuIGFsbAogCSAq
IGNhbGxlcnMgaG9sZCByY3UgcmVhZCBsb2NrLgorCSAqCisJICogTk9URSEgQSBwZW5kaW5nIHNp
Z25hbCB3aWxsIGhvbGQgb24gdG8gdGhlIHVzZXIgcmVmY291bnQsCisJICogYW5kIHdlIGdldC9w
dXQgdGhlIHJlZmNvdW50IG9ubHkgd2hlbiB0aGUgc2lncGVuZGluZyBjb3VudAorCSAqIGNoYW5n
ZXMgZnJvbS90byB6ZXJvLgogCSAqLwogCXJjdV9yZWFkX2xvY2soKTsKLQl1c2VyID0gZ2V0X3Vp
ZChfX3Rhc2tfY3JlZCh0KS0+dXNlcik7Ci0JYXRvbWljX2luYygmdXNlci0+c2lncGVuZGluZyk7
CisJdXNlciA9IF9fdGFza19jcmVkKHQpLT51c2VyOworCWlmIChhdG9taWNfaW5jX3JldHVybigm
dXNlci0+c2lncGVuZGluZykgPT0gMSkKKwkJZ2V0X3VpZCh1c2VyKTsKIAlyY3VfcmVhZF91bmxv
Y2soKTsKIAogCWlmIChvdmVycmlkZV9ybGltaXQgfHwKQEAgLTQzMiw4ICs0MzcsOCBAQCBfX3Np
Z3F1ZXVlX2FsbG9jKGludCBzaWcsIHN0cnVjdCB0YXNrX3N0cnVjdCAqdCwgZ2ZwX3QgZmxhZ3Ms
IGludCBvdmVycmlkZV9ybGltaQogCX0KIAogCWlmICh1bmxpa2VseShxID09IE5VTEwpKSB7Ci0J
CWF0b21pY19kZWMoJnVzZXItPnNpZ3BlbmRpbmcpOwotCQlmcmVlX3VpZCh1c2VyKTsKKwkJaWYg
KGF0b21pY19kZWNfYW5kX3Rlc3QoJnVzZXItPnNpZ3BlbmRpbmcpKQorCQkJZnJlZV91aWQodXNl
cik7CiAJfSBlbHNlIHsKIAkJSU5JVF9MSVNUX0hFQUQoJnEtPmxpc3QpOwogCQlxLT5mbGFncyA9
IDA7CkBAIC00NDcsOCArNDUyLDggQEAgc3RhdGljIHZvaWQgX19zaWdxdWV1ZV9mcmVlKHN0cnVj
dCBzaWdxdWV1ZSAqcSkKIHsKIAlpZiAocS0+ZmxhZ3MgJiBTSUdRVUVVRV9QUkVBTExPQykKIAkJ
cmV0dXJuOwotCWF0b21pY19kZWMoJnEtPnVzZXItPnNpZ3BlbmRpbmcpOwotCWZyZWVfdWlkKHEt
PnVzZXIpOworCWlmIChhdG9taWNfZGVjX2FuZF90ZXN0KCZxLT51c2VyLT5zaWdwZW5kaW5nKSkK
KwkJZnJlZV91aWQocS0+dXNlcik7CiAJa21lbV9jYWNoZV9mcmVlKHNpZ3F1ZXVlX2NhY2hlcCwg
cSk7CiB9CiAK

--===============3521339385346095235==--

