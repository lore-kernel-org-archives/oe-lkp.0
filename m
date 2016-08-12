Content-Type: multipart/mixed; boundary="===============2829950137363320045=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Fri, 12 Aug 2016 11:03:33 -0700
Message-ID: <CA+55aFwYcjXn7kpLFWQ=jF0sSrhEfZhqNsjR+6O89OOH9qRNOw@mail.gmail.com>
In-Reply-To: <20160812035645.GQ19025@dastard>
List-Id: <oe-lkp.lists.linux.dev>

--===============2829950137363320045==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 11, 2016 at 8:56 PM, Dave Chinner <david@fromorbit.com> wrote:
> On Thu, Aug 11, 2016 at 07:27:52PM -0700, Linus Torvalds wrote:
>>
>> I don't recall having ever seen the mapping tree_lock as a contention
>> point before, but it's not like I've tried that load either. So it
>> might be a regression (going back long, I suspect), or just an unusual
>> load that nobody has traditionally tested much.
>>
>> Single-threaded big file write one page at a time, was it?
>
> Yup. On a 4 node NUMA system.

Ok, I can't see any real contention on my single-node workstation
(running ext4 too, so there may be filesystem differences), but I
guess that shouldn't surprise me. The cacheline bouncing just isn't
expensive enough when it all stays on-die.

I can see the tree_lock in my profiles (just not very high), and at
least for ext4 the main caller ssems to be
__set_page_dirty_nobuffers().

And yes, looking at that, the biggest cost by _far_ inside the
spinlock seems to be the accounting.

Which doesn't even have to be inside the mapping lock, as far as I can
tell, and as far as comments go.

So a stupid patch to just move the dirty page accounting to outside
the spinlock might help a lot.

Does this attached patch help your contention numbers?

Adding a few people who get blamed for account_page_dirtied() and
inode_attach_wb() just to make sure that nobody expected the
mapping_lock spinlock to be held when calling account_page_dirtied().

I realize that this has nothing to do with the AIM7 regression (the
spinlock just isn't high enough in that profile), but your contention
numbers just aren't right, and updating accounting statistics inside a
critical spinlock when not needed is just wrong.

                Linus

--===============2829950137363320045==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="patch.diff"

IGZzL2J1ZmZlci5jICAgICAgICAgfCA1ICsrKystCiBmcy94ZnMveGZzX2FvcHMuYyAgIHwgNSAr
KysrLQogbW0vcGFnZS13cml0ZWJhY2suYyB8IDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgOSBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2ZzL2J1ZmZlci5jIGIvZnMv
YnVmZmVyLmMKaW5kZXggOWM4ZWI5YjZkYjZhLi5mNzlhOWQyNDE1ODkgMTAwNjQ0Ci0tLSBhL2Zz
L2J1ZmZlci5jCisrKyBiL2ZzL2J1ZmZlci5jCkBAIC02MjgsMTUgKzYyOCwxOCBAQCBzdGF0aWMg
dm9pZCBfX3NldF9wYWdlX2RpcnR5KHN0cnVjdCBwYWdlICpwYWdlLCBzdHJ1Y3QgYWRkcmVzc19z
cGFjZSAqbWFwcGluZywKIAkJCSAgICAgaW50IHdhcm4pCiB7CiAJdW5zaWduZWQgbG9uZyBmbGFn
czsKKwlib29sIGFjY291bnQgPSBmYWxzZTsKIAogCXNwaW5fbG9ja19pcnFzYXZlKCZtYXBwaW5n
LT50cmVlX2xvY2ssIGZsYWdzKTsKIAlpZiAocGFnZS0+bWFwcGluZykgewkvKiBSYWNlIHdpdGgg
dHJ1bmNhdGU/ICovCiAJCVdBUk5fT05fT05DRSh3YXJuICYmICFQYWdlVXB0b2RhdGUocGFnZSkp
OwotCQlhY2NvdW50X3BhZ2VfZGlydGllZChwYWdlLCBtYXBwaW5nKTsKIAkJcmFkaXhfdHJlZV90
YWdfc2V0KCZtYXBwaW5nLT5wYWdlX3RyZWUsCiAJCQkJcGFnZV9pbmRleChwYWdlKSwgUEFHRUNB
Q0hFX1RBR19ESVJUWSk7CisJCWFjY291bnQgPSB0cnVlOwogCX0KIAlzcGluX3VubG9ja19pcnFy
ZXN0b3JlKCZtYXBwaW5nLT50cmVlX2xvY2ssIGZsYWdzKTsKKwlpZiAoYWNjb3VudCkKKwkJYWNj
b3VudF9wYWdlX2RpcnRpZWQocGFnZSwgbWFwcGluZyk7CiB9CiAKIC8qCmRpZmYgLS1naXQgYS9m
cy94ZnMveGZzX2FvcHMuYyBiL2ZzL3hmcy94ZnNfYW9wcy5jCmluZGV4IDc1NzVjZmMzYWQxNS4u
NTkxNjljMzY3NjVlIDEwMDY0NAotLS0gYS9mcy94ZnMveGZzX2FvcHMuYworKysgYi9mcy94ZnMv
eGZzX2FvcHMuYwpAQCAtMTQ5MCwxNSArMTQ5MCwxOCBAQCB4ZnNfdm1fc2V0X3BhZ2VfZGlydHko
CiAJaWYgKG5ld2x5X2RpcnR5KSB7CiAJCS8qIHNpZ2ggLSBfX3NldF9wYWdlX2RpcnR5KCkgaXMg
c3RhdGljLCBzbyBjb3B5IGl0IGhlcmUsIHRvbyAqLwogCQl1bnNpZ25lZCBsb25nIGZsYWdzOwor
CQlib29sIGFjY291bnQgPSBmYWxzZTsKIAogCQlzcGluX2xvY2tfaXJxc2F2ZSgmbWFwcGluZy0+
dHJlZV9sb2NrLCBmbGFncyk7CiAJCWlmIChwYWdlLT5tYXBwaW5nKSB7CS8qIFJhY2Ugd2l0aCB0
cnVuY2F0ZT8gKi8KIAkJCVdBUk5fT05fT05DRSghUGFnZVVwdG9kYXRlKHBhZ2UpKTsKLQkJCWFj
Y291bnRfcGFnZV9kaXJ0aWVkKHBhZ2UsIG1hcHBpbmcpOwogCQkJcmFkaXhfdHJlZV90YWdfc2V0
KCZtYXBwaW5nLT5wYWdlX3RyZWUsCiAJCQkJCXBhZ2VfaW5kZXgocGFnZSksIFBBR0VDQUNIRV9U
QUdfRElSVFkpOworCQkJYWNjb3VudCA9IHRydWU7CiAJCX0KIAkJc3Bpbl91bmxvY2tfaXJxcmVz
dG9yZSgmbWFwcGluZy0+dHJlZV9sb2NrLCBmbGFncyk7CisJCWlmIChhY2NvdW50KQorCQkJYWNj
b3VudF9wYWdlX2RpcnRpZWQocGFnZSwgbWFwcGluZyk7CiAJfQogCXVubG9ja19wYWdlX21lbWNn
KHBhZ2UpOwogCWlmIChuZXdseV9kaXJ0eSkKZGlmZiAtLWdpdCBhL21tL3BhZ2Utd3JpdGViYWNr
LmMgYi9tbS9wYWdlLXdyaXRlYmFjay5jCmluZGV4IGY0Y2Q3ZDgwMDVjOS4uOWE2YTZiOTlhY2Zl
IDEwMDY0NAotLS0gYS9tbS9wYWdlLXdyaXRlYmFjay5jCisrKyBiL21tL3BhZ2Utd3JpdGViYWNr
LmMKQEAgLTI1MTcsMTAgKzI1MTcsMTAgQEAgaW50IF9fc2V0X3BhZ2VfZGlydHlfbm9idWZmZXJz
KHN0cnVjdCBwYWdlICpwYWdlKQogCQlzcGluX2xvY2tfaXJxc2F2ZSgmbWFwcGluZy0+dHJlZV9s
b2NrLCBmbGFncyk7CiAJCUJVR19PTihwYWdlX21hcHBpbmcocGFnZSkgIT0gbWFwcGluZyk7CiAJ
CVdBUk5fT05fT05DRSghUGFnZVByaXZhdGUocGFnZSkgJiYgIVBhZ2VVcHRvZGF0ZShwYWdlKSk7
Ci0JCWFjY291bnRfcGFnZV9kaXJ0aWVkKHBhZ2UsIG1hcHBpbmcpOwogCQlyYWRpeF90cmVlX3Rh
Z19zZXQoJm1hcHBpbmctPnBhZ2VfdHJlZSwgcGFnZV9pbmRleChwYWdlKSwKIAkJCQkgICBQQUdF
Q0FDSEVfVEFHX0RJUlRZKTsKIAkJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmbWFwcGluZy0+dHJl
ZV9sb2NrLCBmbGFncyk7CisJCWFjY291bnRfcGFnZV9kaXJ0aWVkKHBhZ2UsIG1hcHBpbmcpOwog
CQl1bmxvY2tfcGFnZV9tZW1jZyhwYWdlKTsKIAogCQlpZiAobWFwcGluZy0+aG9zdCkgewo=

--===============2829950137363320045==--

