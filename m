Content-Type: multipart/mixed; boundary="===============7996436839188350715=="
MIME-Version: 1.0
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: lkp@lists.01.org
Subject: Re: [i2c: i2c-core] f3eab42515: WARNING: CPU: 0 PID: 1 at drivers/i2c/i2c-core.c:1930 i2c_register_driver()
Date: Mon, 07 Mar 2016 22:20:53 +0530
Message-ID: <56DDB16D.4090801@gmail.com>
In-Reply-To: <56dd78c0.TTFkFGk8/5jhg0wS%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7996436839188350715==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Monday 07 March 2016 06:19 PM, kernel test robot wrote:
> Greetings,
>
> 0day kernel testing robot got the below dmesg and the first bad commit is
>
> https://github.com/0day-ci/linux Sudip-Mukherjee/i2c-i2c-core-do-not-use-=
bus-internal-data/20160307-195104
>
> commit f3eab4251515a492aa38e515d9a2322c535ce358
> Author:     Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> AuthorDate: Mon Mar 7 17:19:17 2016 +0530
> Commit:     0day robot <fengguang.wu@intel.com>
> CommitDate: Mon Mar 7 19:51:06 2016 +0800
>
>      i2c: i2c-core: do not use bus internal data
>
>      The variable p is a data structure which is used by the driver core
>      internally and it is not expected that busses will be directly acces=
sing
>      these driver core internal only data.
>
>      Signed-off-by: Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>

The warnings and stacktrace are expected as there was a WARN_ON() in it. =

But can you please check if the attached patch fixes the BUG: and the =

null pointer dereference. The patch will apply on top of my previous =

patch (i2c: i2c-core: do not use bus internal data).

regards
sudip




--===============7996436839188350715==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="patch.ksh"

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2kyYy1jb3JlLmMgYi9kcml2ZXJzL2kyYy9pMmMtY29y
ZS5jCmluZGV4IDJmMzFmYjUuLjgwMjM1ZGIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaTJjL2kyYy1j
b3JlLmMKKysrIGIvZHJpdmVycy9pMmMvaTJjLWNvcmUuYwpAQCAtNzUsNiArNzUsMTIgQEAgc3Rh
dGljIGludCBpMmNfZGV0ZWN0KHN0cnVjdCBpMmNfYWRhcHRlciAqYWRhcHRlciwgc3RydWN0IGky
Y19kcml2ZXIgKmRyaXZlcik7CiBzdGF0aWMgc3RydWN0IHN0YXRpY19rZXkgaTJjX3RyYWNlX21z
ZyA9IFNUQVRJQ19LRVlfSU5JVF9GQUxTRTsKIHN0YXRpYyBib29sIGlzX3JlZ2lzdGVyZWQ7CiAK
K2Jvb2wgaXNfaTJjX3JlZ2lzdGVyZWQodm9pZCkKK3sKKwlyZXR1cm4gaXNfcmVnaXN0ZXJlZDsK
K30KK0VYUE9SVF9TWU1CT0woaXNfaTJjX3JlZ2lzdGVyZWQpOworCiB2b2lkIGkyY190cmFuc2Zl
cl90cmFjZV9yZWcodm9pZCkKIHsKIAlzdGF0aWNfa2V5X3Nsb3dfaW5jKCZpMmNfdHJhY2VfbXNn
KTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2kyYy1kZXYuYyBiL2RyaXZlcnMvaTJjL2kyYy1k
ZXYuYwppbmRleCAwYjExMDhkLi4xOTM5ODI3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2kyYy9pMmMt
ZGV2LmMKKysrIGIvZHJpdmVycy9pMmMvaTJjLWRldi5jCkBAIC02MjAsNiArNjIwLDkgQEAgc3Rh
dGljIGludCBfX2luaXQgaTJjX2Rldl9pbml0KHZvaWQpCiAKIAlwcmludGsoS0VSTl9JTkZPICJp
MmMgL2RldiBlbnRyaWVzIGRyaXZlclxuIik7CiAKKwlpZiAoIWlzX2kyY19yZWdpc3RlcmVkKCkp
CisJCXJldHVybiAtRUFHQUlOOworCiAJcmVzID0gcmVnaXN0ZXJfY2hyZGV2KEkyQ19NQUpPUiwg
ImkyYyIsICZpMmNkZXZfZm9wcyk7CiAJaWYgKHJlcykKIAkJZ290byBvdXQ7CmRpZmYgLS1naXQg
YS9pbmNsdWRlL2xpbnV4L2kyYy5oIGIvaW5jbHVkZS9saW51eC9pMmMuaAppbmRleCAyMDBjZjEz
Yi4uMjRiNDJmZiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9pMmMuaAorKysgYi9pbmNsdWRl
L2xpbnV4L2kyYy5oCkBAIC0zNiw2ICszNiw3IEBACiAKIGV4dGVybiBzdHJ1Y3QgYnVzX3R5cGUg
aTJjX2J1c190eXBlOwogZXh0ZXJuIHN0cnVjdCBkZXZpY2VfdHlwZSBpMmNfYWRhcHRlcl90eXBl
OworYm9vbCBpc19pMmNfcmVnaXN0ZXJlZCh2b2lkKTsKIAogLyogLS0tIEdlbmVyYWwgb3B0aW9u
cyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0JKi8KIAo=

--===============7996436839188350715==--

