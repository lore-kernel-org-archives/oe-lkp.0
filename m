Content-Type: multipart/mixed; boundary="===============1192754123458605823=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [locks] 6d390e4b5d: will-it-scale.per_process_ops -96.6% regression
Date: Mon, 09 Mar 2020 08:52:41 -0700
Message-ID: <CAHk-=whGK712fPqmQ3FSHxqe3Aqny4bEeWEvfaytLeLV2+ijCQ@mail.gmail.com>
In-Reply-To: <e3783d060c778cb41b77380ad3e278133b52f57e.camel@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============1192754123458605823==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 9, 2020 at 7:36 AM Jeff Layton <jlayton@kernel.org> wrote:
>
> On Sun, 2020-03-08 at 22:03 +0800, kernel test robot wrote:
> >
> > FYI, we noticed a -96.6% regression of will-it-scale.per_process_ops du=
e to commit:
>
> This is not completely unexpected as we're banging on the global
> blocked_lock_lock now for every unlock. This test just thrashes file
> locks and unlocks without doing anything in between, so the workload
> looks pretty artificial [1].
>
> It would be nice to avoid the global lock in this codepath, but it
> doesn't look simple to do. I'll keep thinking about it, but for now I'm
> inclined to ignore this result unless we see a problem in more realistic
> workloads.

That is a _huge_ regression, though.

What about something like the attached? Wouldn't that work? And make
the code actually match the old comment about wow "fl_blocker" being
NULL being special.

The old code seemed to not know about things like memory ordering either.

Patch is entirely untested, but aims to have that "smp_store_release()
means I'm done and not going to touch it any more", making that
smp_load_acquire() test hopefully be valid as per the comment..

Hmm?

                    Linus

--===============1192754123458605823==
Content-Type: text/x-patch
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="patch.diff"

IGZzL2xvY2tzLmMgfCAyOSArKysrKysrKysrKysrKysrKysrKysrKysrKysrLQogMSBmaWxlIGNo
YW5nZWQsIDI4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9mcy9s
b2Nrcy5jIGIvZnMvbG9ja3MuYwppbmRleCA0MjZiNTVkMzMzZDUuLmJjNWNhNTRhMDc0OSAxMDA2
NDQKLS0tIGEvZnMvbG9ja3MuYworKysgYi9mcy9sb2Nrcy5jCkBAIC03MjUsNyArNzI1LDYgQEAg
c3RhdGljIHZvaWQgX19sb2Nrc19kZWxldGVfYmxvY2soc3RydWN0IGZpbGVfbG9jayAqd2FpdGVy
KQogewogCWxvY2tzX2RlbGV0ZV9nbG9iYWxfYmxvY2tlZCh3YWl0ZXIpOwogCWxpc3RfZGVsX2lu
aXQoJndhaXRlci0+ZmxfYmxvY2tlZF9tZW1iZXIpOwotCXdhaXRlci0+ZmxfYmxvY2tlciA9IE5V
TEw7CiB9CiAKIHN0YXRpYyB2b2lkIF9fbG9ja3Nfd2FrZV91cF9ibG9ja3Moc3RydWN0IGZpbGVf
bG9jayAqYmxvY2tlcikKQEAgLTc0MCw2ICs3MzksMTIgQEAgc3RhdGljIHZvaWQgX19sb2Nrc193
YWtlX3VwX2Jsb2NrcyhzdHJ1Y3QgZmlsZV9sb2NrICpibG9ja2VyKQogCQkJd2FpdGVyLT5mbF9s
bW9wcy0+bG1fbm90aWZ5KHdhaXRlcik7CiAJCWVsc2UKIAkJCXdha2VfdXAoJndhaXRlci0+Zmxf
d2FpdCk7CisKKwkJLyoKKwkJICogVGVsbCB0aGUgd29ybGQgd2UncmUgZG9uZSB3aXRoIGl0IC0g
c2VlIGNvbW1lbnQgYXQKKwkJICogdG9wIG9mIGxvY2tzX2RlbGV0ZV9ibG9jaygpLgorCQkgKi8K
KwkJc21wX3N0b3JlX3JlbGVhc2UoJndhaXRlci0+ZmxfYmxvY2tlciwgTlVMTCk7CiAJfQogfQog
CkBAIC03NTMsMTEgKzc1OCwzMyBAQCBpbnQgbG9ja3NfZGVsZXRlX2Jsb2NrKHN0cnVjdCBmaWxl
X2xvY2sgKndhaXRlcikKIHsKIAlpbnQgc3RhdHVzID0gLUVOT0VOVDsKIAorCS8qCisJICogSWYg
ZmxfYmxvY2tlciBpcyBOVUxMLCBpdCB3b24ndCBiZSBzZXQgYWdhaW4gYXMgdGhpcyB0aHJlYWQK
KwkgKiAib3ducyIgdGhlIGxvY2sgYW5kIGlzIHRoZSBvbmx5IG9uZSB0aGF0IG1pZ2h0IHRyeSB0
byBjbGFpbQorCSAqIHRoZSBsb2NrLiAgU28gaXQgaXMgc2FmZSB0byB0ZXN0IGZsX2Jsb2NrZXIg
bG9ja2xlc3NseS4KKwkgKiBBbHNvIGlmIGZsX2Jsb2NrZXIgaXMgTlVMTCwgdGhpcyB3YWl0ZXIg
aXMgbm90IGxpc3RlZCBvbgorCSAqIGZsX2Jsb2NrZWRfcmVxdWVzdHMgZm9yIHNvbWUgbG9jaywg
c28gbm8gb3RoZXIgcmVxdWVzdCBjYW4KKwkgKiBiZSBhZGRlZCB0byB0aGUgbGlzdCBvZiBmbF9i
bG9ja2VkX3JlcXVlc3RzIGZvciB0aGlzCisJICogcmVxdWVzdC4gIFNvIGlmIGZsX2Jsb2NrZXIg
aXMgTlVMTCwgaXQgaXMgc2FmZSB0bworCSAqIGxvY2tsZXNzbHkgY2hlY2sgaWYgZmxfYmxvY2tl
ZF9yZXF1ZXN0cyBpcyBlbXB0eS4gIElmIGJvdGgKKwkgKiBvZiB0aGVzZSBjaGVja3Mgc3VjY2Vl
ZCwgdGhlcmUgaXMgbm8gbmVlZCB0byB0YWtlIHRoZSBsb2NrLgorCSAqLworCWlmICghc21wX2xv
YWRfYWNxdWlyZSgmd2FpdGVyLT5mbF9ibG9ja2VyKSkgeworCQlpZiAobGlzdF9lbXB0eSgmd2Fp
dGVyLT5mbF9ibG9ja2VkX3JlcXVlc3RzKSkKKwkJICAgICAgICByZXR1cm4gc3RhdHVzOworCX0K
KwogCXNwaW5fbG9jaygmYmxvY2tlZF9sb2NrX2xvY2spOwogCWlmICh3YWl0ZXItPmZsX2Jsb2Nr
ZXIpCiAJCXN0YXR1cyA9IDA7CiAJX19sb2Nrc193YWtlX3VwX2Jsb2Nrcyh3YWl0ZXIpOwogCV9f
bG9ja3NfZGVsZXRlX2Jsb2NrKHdhaXRlcik7CisKKwkvKgorCSAqIFRlbGwgdGhlIHdvcmxkIHdl
J3JlIGRvbmUgd2l0aCBpdCAtIHNlZSBjb21taXQgYXQgdG9wCisJICogb2YgdGhpcyBmdW5jdGlv
bgorCSAqLworCXNtcF9zdG9yZV9yZWxlYXNlKCZ3YWl0ZXItPmZsX2Jsb2NrZXIsIE5VTEwpOwog
CXNwaW5fdW5sb2NrKCZibG9ja2VkX2xvY2tfbG9jayk7CiAJcmV0dXJuIHN0YXR1czsKIH0K

--===============1192754123458605823==--

