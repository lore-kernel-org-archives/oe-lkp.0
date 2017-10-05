Content-Type: multipart/mixed; boundary="===============5293578254702271075=="
MIME-Version: 1.0
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lockdep] b09be676e0 BUG: unable to handle kernel NULL pointer dereference at 000001f2
Date: Thu, 05 Oct 2017 09:54:14 -0500
Message-ID: <20171005145414.4bbcr3jornabes7c@treble>
In-Reply-To: <20171005130146.pmayo6owv362zfai@treble>
List-Id: <oe-lkp.lists.linux.dev>

--===============5293578254702271075==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 05, 2017 at 08:01:46AM -0500, Josh Poimboeuf wrote:
> On Tue, Oct 03, 2017 at 09:54:31AM -0700, Linus Torvalds wrote:
> > On Tue, Oct 3, 2017 at 7:06 AM, Fengguang Wu <fengguang.wu@intel.com>=
 wrote:
> > >
> > > This patch triggers a NULL-dereference bug at update_stack_state().
> > > Although its parent commit also has a NULL-dereference bug, however
> > > the call stack looks rather different. Both dmesg files are attached.
> > >
> > > It also triggers this warning, which is being discussed in another
> > > thread, so CC Josh. The full dmesg attached, too.
> > >
> > >         Please press Enter to activate this console.
> > >         [  138.605622] WARNING: kernel stack regs at be299c9a in proc=
d:340 has bad 'bp' value 000001be
> > >         [  138.605627] unwind stack type:0 next_sp:  (null) mask:0x2 =
graph_idx:0
> > >         [  138.605631] be299c9a: 299ceb00 (0x299ceb00)
> > >         [  138.605633] be299c9e: 2281f1be (0x2281f1be)
> > >         [  138.605634] be299ca2: 299cebb6 (0x299cebb6)
> > >
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git ma=
ster
> > >
> > > commit b09be676e0ff25bd6d2e7637e26d349f9109ad75
> > >      locking/lockdep: Implement the 'crossrelease' feature
> > =

> > Can we consider just reverting the crossrelease thing?
> > =

> > The apparent stack corruption really worries me, and what worries me
> > most is that commit wasn't even supposed to change anything as far as
> > I can tell - it only adds infrastructure, no actual users that *set*
> > the cross-lock thing.
> > =

> > So the fact that it actually seems to cause behavioural changes seems
> > to be _really_ scary, and indicates that the code is completely
> > broken.
> > =

> > Or am I missing something?
> =

> So I gave crossrelease a bad rap here.  Going back and looking at the
> panics and stack dumps, what I thought was "stack corruption" was
> actually the GCC unaligned stack pointer thing.
> =

> I suspect those commits were implicated in the bisections because they
> started doing more stack traces in general, revealing some existing
> 32-bit unwinder/GCC/frame pointer bugs in the process.
> =

> So I just wanted to clarify that crossrelease seems to be innocent in
> all this.  Sorry for the confusion!

Ok, I may have spoken too soon :-)

There were so many issues here that it's been hard for me to untangle
them all.

There's one panic which seems different than the others:

  BUG: unable to handle kernel NULL pointer dereference at 00000020
  IP: iput+0x544/0x650
  *pde =3D 00000000
  =

  Oops: 0000 [#1] PREEMPT SMP
  CPU: 0 PID: 29697 Comm: umount Not tainted 4.13.0-rc4-00169-gce07a941 #627
  Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.9.3-2016102=
5_171302-gandalf 04/01/2014
  task: c0a0ba00 task.stack: c0a1e000
  EIP: iput+0x544/0x650
  EFLAGS: 00010246 CPU: 0
  EAX: 00000001 EBX: c0100218 ECX: 00000000 EDX: 00000000
  ESI: 00000000 EDI: 00000000 EBP: c0a1fdd8 ESP: c0a1fdc0
   DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
  CR0: 80050033 CR2: 00000020 CR3: 10a03000 CR4: 00000690
  Call Trace:
   dentry_unlink_inode+0x176/0x180
   ? preempt_count_sub+0x1c5/0x2e0
   __dentry_kill+0x207/0x330
   shrink_dentry_list+0x5df/0x610
   shrink_dcache_parent+0x65/0x80
   do_one_tree+0x13/0x40
   shrink_dcache_for_umount+0x84/0xe0
   generic_shutdown_super+0x3e/0x1b0
   kill_anon_super+0x11/0x20
   kernfs_kill_sb+0x6c/0x80
   sysfs_kill_sb+0x1a/0x30
   deactivate_locked_super+0x4c/0x80
   deactivate_super+0x100/0x110
   cleanup_mnt+0xc0/0xe0
   __cleanup_mnt+0x10/0x20
   task_work_run+0x7f/0xa0
   exit_to_usermode_loop+0x100/0x16f
   do_int80_syscall_32+0x27f/0x2e0
   entry_INT80_32+0x2f/0x2f
  EIP: 0xa7f34a69
  EFLAGS: 00000292 CPU: 0
  EAX: 00000000 EBX: 080960f0 ECX: a7f76ff4 EDX: 080960d0
  ESI: 080960d0 EDI: 080960f0 EBP: afe22258 ESP: afe22208
   DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b
  Code: b5 20 56 3c b7 0f 84 64 fe ff ff e9 6b fe ff ff 8d b4 26 00 00 00 0=
0 8b 7b 1c c1 ee 03 31 c9 83 05 ac 56 3c b7 01 83 e6 01 89 f2 <8b> 47 20 89=
 45 ec b8 c0 1f 30 b7 c7 04 24 00 00 00 00 e8 15 89
  EIP: iput+0x544/0x650 SS:ESP: 0068:c0a1fdc0
  CR2: 0000000000000020
  ---[ end trace 0bfc95b7cf7c8ea4 ]---
  Kernel panic - not syncing: Fatal exception

And it was bisected to:

  ce07a9415f26 ("locking/lockdep: Make check_prev_add() able to handle exte=
rnal stack_trace")

That commit hadn't added the crossrelease feature yet, so it presumably
didn't trigger the extra unwinder issues.

Peter and I found some issues with that patch, and Peter came up with a
fix.  It would be good to know if Peter's patch makes that panic go
away.

I've rebased the fixes on top of the ce07a9415f26 commit and attached
them to this email.

Fengguang, if you're still listening, could you please rerun the tests
on top of ce07a9415f26, with the attached patches also applied?

-- =

Josh

--===============5293578254702271075==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-unwinder-fixes.patch"

PkZyb20gZTc4NDBhZDc2NTE1ZjBiNTA2MWZjZGQwOThiNTdiN2MwMWI2MTQ4MiBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKTWVzc2FnZS1JZDogPGU3ODQwYWQ3NjUxNWYwYjUwNjFmY2RkMDk4YjU3
YjdjMDFiNjE0ODIuMTUwNzIxNTE5Ni5naXQuanBvaW1ib2VAcmVkaGF0LmNvbT4KRnJvbTogSm9z
aCBQb2ltYm9ldWYgPGpwb2ltYm9lQHJlZGhhdC5jb20+CkRhdGU6IFRodSwgNSBPY3QgMjAxNyAw
OTo0Mzo1OSAtMDUwMApTdWJqZWN0OiBbUEFUQ0ggMS8yXSB1bndpbmRlciBmaXhlcwoKLS0tCiBh
cmNoL3g4Ni9rZXJuZWwvdW53aW5kX2ZyYW1lLmMgfCAzMyArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2tlcm5lbC91bndpbmRfZnJhbWUuYyBiL2FyY2gv
eDg2L2tlcm5lbC91bndpbmRfZnJhbWUuYwppbmRleCBiOTM4OWQ3MmIyZjcuLjBlY2M0MmUzNGNj
NCAxMDA2NDQKLS0tIGEvYXJjaC94ODYva2VybmVsL3Vud2luZF9mcmFtZS5jCisrKyBiL2FyY2gv
eDg2L2tlcm5lbC91bndpbmRfZnJhbWUuYwpAQCAtMzMsNyArMzMsNyBAQCBzdGF0aWMgdm9pZCB1
bndpbmRfZHVtcChzdHJ1Y3QgdW53aW5kX3N0YXRlICpzdGF0ZSkKIAlzdHJ1Y3Qgc3RhY2tfaW5m
byBzdGFja19pbmZvID0gezB9OwogCXVuc2lnbmVkIGxvbmcgdmlzaXRfbWFzayA9IDA7CiAKLQlp
ZiAoZHVtcGVkX2JlZm9yZSkKKwlpZiAoSVNfRU5BQkxFRChDT05GSUdfWDg2XzMyKSB8fCBkdW1w
ZWRfYmVmb3JlKQogCQlyZXR1cm47CiAKIAlkdW1wZWRfYmVmb3JlID0gdHJ1ZTsKQEAgLTQyLDcg
KzQyLDggQEAgc3RhdGljIHZvaWQgdW53aW5kX2R1bXAoc3RydWN0IHVud2luZF9zdGF0ZSAqc3Rh
dGUpCiAJCQlzdGF0ZS0+c3RhY2tfaW5mby50eXBlLCBzdGF0ZS0+c3RhY2tfaW5mby5uZXh0X3Nw
LAogCQkJc3RhdGUtPnN0YWNrX21hc2ssIHN0YXRlLT5ncmFwaF9pZHgpOwogCi0JZm9yIChzcCA9
IHN0YXRlLT5vcmlnX3NwOyBzcDsgc3AgPSBQVFJfQUxJR04oc3RhY2tfaW5mby5uZXh0X3NwLCBz
aXplb2YobG9uZykpKSB7CisJZm9yIChzcCA9IFBUUl9BTElHTihzdGF0ZS0+b3JpZ19zcCwgc2l6
ZW9mKGxvbmcpKTsgc3A7CisJICAgICBzcCA9IFBUUl9BTElHTihzdGFja19pbmZvLm5leHRfc3As
IHNpemVvZihsb25nKSkpIHsKIAkJaWYgKGdldF9zdGFja19pbmZvKHNwLCBzdGF0ZS0+dGFzaywg
JnN0YWNrX2luZm8sICZ2aXNpdF9tYXNrKSkKIAkJCWJyZWFrOwogCkBAIC04NCw2ICs4NSwxMiBA
QCBzdGF0aWMgc2l6ZV90IHJlZ3Nfc2l6ZShzdHJ1Y3QgcHRfcmVncyAqcmVncykKIAlyZXR1cm4g
c2l6ZW9mKCpyZWdzKTsKIH0KIAorI2lmZGVmIENPTkZJR19YODZfMzIKKyNkZWZpbmUgS0VSTkVM
X1JFR1NfU0laRSAoc2l6ZW9mKHN0cnVjdCBwdF9yZWdzKSAtIDIqc2l6ZW9mKGxvbmcpKQorI2Vs
c2UKKyNkZWZpbmUgS0VSTkVMX1JFR1NfU0laRSAoc2l6ZW9mKHN0cnVjdCBwdF9yZWdzKSkKKyNl
bmRpZgorCiBzdGF0aWMgYm9vbCBpbl9lbnRyeV9jb2RlKHVuc2lnbmVkIGxvbmcgaXApCiB7CiAJ
Y2hhciAqYWRkciA9IChjaGFyICopaXA7CkBAIC0xODMsNiArMTkwLDcgQEAgc3RhdGljIGJvb2wg
aXNfbGFzdF90YXNrX2ZyYW1lKHN0cnVjdCB1bndpbmRfc3RhdGUgKnN0YXRlKQogICogVGhpcyBk
ZXRlcm1pbmVzIGlmIHRoZSBmcmFtZSBwb2ludGVyIGFjdHVhbGx5IGNvbnRhaW5zIGFuIGVuY29k
ZWQgcG9pbnRlciB0bwogICogcHRfcmVncyBvbiB0aGUgc3RhY2suICBTZWUgRU5DT0RFX0ZSQU1F
X1BPSU5URVIuCiAgKi8KKyNpZmRlZiBDT05GSUdfWDg2XzY0CiBzdGF0aWMgc3RydWN0IHB0X3Jl
Z3MgKmRlY29kZV9mcmFtZV9wb2ludGVyKHVuc2lnbmVkIGxvbmcgKmJwKQogewogCXVuc2lnbmVk
IGxvbmcgcmVncyA9ICh1bnNpZ25lZCBsb25nKWJwOwpAQCAtMTkyLDYgKzIwMCwxNyBAQCBzdGF0
aWMgc3RydWN0IHB0X3JlZ3MgKmRlY29kZV9mcmFtZV9wb2ludGVyKHVuc2lnbmVkIGxvbmcgKmJw
KQogCiAJcmV0dXJuIChzdHJ1Y3QgcHRfcmVncyAqKShyZWdzICYgfjB4MSk7CiB9CisjZWxzZQor
c3RhdGljIHN0cnVjdCBwdF9yZWdzICpkZWNvZGVfZnJhbWVfcG9pbnRlcih1bnNpZ25lZCBsb25n
ICpicCkKK3sKKwl1bnNpZ25lZCBsb25nIHJlZ3MgPSAodW5zaWduZWQgbG9uZylicDsKKworCWlm
IChyZWdzICYgMHg4MDAwMDAwMCkKKwkJcmV0dXJuIE5VTEw7CisKKwlyZXR1cm4gKHN0cnVjdCBw
dF9yZWdzICopKHJlZ3MgfCAweDgwMDAwMDAwKTsKK30KKyNlbmRpZgogCiBzdGF0aWMgYm9vbCB1
cGRhdGVfc3RhY2tfc3RhdGUoc3RydWN0IHVud2luZF9zdGF0ZSAqc3RhdGUsCiAJCQkgICAgICAg
dW5zaWduZWQgbG9uZyAqbmV4dF9icCkKQEAgLTIxMSw3ICsyMzAsNyBAQCBzdGF0aWMgYm9vbCB1
cGRhdGVfc3RhY2tfc3RhdGUoc3RydWN0IHVud2luZF9zdGF0ZSAqc3RhdGUsCiAJcmVncyA9IGRl
Y29kZV9mcmFtZV9wb2ludGVyKG5leHRfYnApOwogCWlmIChyZWdzKSB7CiAJCWZyYW1lID0gKHVu
c2lnbmVkIGxvbmcgKilyZWdzOwotCQlsZW4gPSByZWdzX3NpemUocmVncyk7CisJCWxlbiA9IEtF
Uk5FTF9SRUdTX1NJWkU7CiAJCXN0YXRlLT5nb3RfaXJxID0gdHJ1ZTsKIAl9IGVsc2UgewogCQlm
cmFtZSA9IG5leHRfYnA7CkBAIC0yMzUsNiArMjU0LDE0IEBAIHN0YXRpYyBib29sIHVwZGF0ZV9z
dGFja19zdGF0ZShzdHJ1Y3QgdW53aW5kX3N0YXRlICpzdGF0ZSwKIAkgICAgZnJhbWUgPCBwcmV2
X2ZyYW1lX2VuZCkKIAkJcmV0dXJuIGZhbHNlOwogCisJLyoKKwkgKiBPbiAzMi1iaXQgd2l0aCB1
c2VyIG1vZGUgcmVncywgbWFrZSBzdXJlIHRoZSBsYXN0IHR3byByZWdzIGFyZSBzYWZlCisJICog
dG8gYWNjZXNzOgorCSAqLworCWlmIChJU19FTkFCTEVEKENPTkZJR19YODZfMzIpICYmIHJlZ3Mg
JiYgdXNlcl9tb2RlKHJlZ3MpICYmCisJICAgICFvbl9zdGFjayhpbmZvLCBmcmFtZSwgbGVuICsg
MipzaXplb2YobG9uZykpKQorCQlyZXR1cm4gZmFsc2U7CisKIAkvKiBNb3ZlIHN0YXRlIHRvIHRo
ZSBuZXh0IGZyYW1lOiAqLwogCWlmIChyZWdzKSB7CiAJCXN0YXRlLT5yZWdzID0gcmVnczsKLS0g
CjIuMTMuNgoK

--===============5293578254702271075==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0002-lockdep-fixes.patch"

PkZyb20gNjIxMDU1NTA2MzJiZmJkMmU1ZTJmMzc2OGEzNzk1OGE2ODcyZWMxZSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKTWVzc2FnZS1JZDogPDYyMTA1NTUwNjMyYmZiZDJlNWUyZjM3NjhhMzc5
NThhNjg3MmVjMWUuMTUwNzIxNTE5Ni5naXQuanBvaW1ib2VAcmVkaGF0LmNvbT4KSW4tUmVwbHkt
VG86IDxlNzg0MGFkNzY1MTVmMGI1MDYxZmNkZDA5OGI1N2I3YzAxYjYxNDgyLjE1MDcyMTUxOTYu
Z2l0Lmpwb2ltYm9lQHJlZGhhdC5jb20+ClJlZmVyZW5jZXM6IDxlNzg0MGFkNzY1MTVmMGI1MDYx
ZmNkZDA5OGI1N2I3YzAxYjYxNDgyLjE1MDcyMTUxOTYuZ2l0Lmpwb2ltYm9lQHJlZGhhdC5jb20+
CkZyb206IFBldGVyIFppamxzdHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4KRGF0ZTogVGh1LCA1
IE9jdCAyMDE3IDA5OjQ0OjMzIC0wNTAwClN1YmplY3Q6IFtQQVRDSCAyLzJdIGxvY2tkZXAgZml4
ZXMKCi0tLQoga2VybmVsL2xvY2tpbmcvbG9ja2RlcC5jIHwgNDggKysrKysrKysrKysrKysrKysr
KystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0
aW9ucygrKSwgMjggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEva2VybmVsL2xvY2tpbmcvbG9j
a2RlcC5jIGIva2VybmVsL2xvY2tpbmcvbG9ja2RlcC5jCmluZGV4IDg0MTgyOGJhMzViOS4uNmQ1
NDBiZGIyNGIzIDEwMDY0NAotLS0gYS9rZXJuZWwvbG9ja2luZy9sb2NrZGVwLmMKKysrIGIva2Vy
bmVsL2xvY2tpbmcvbG9ja2RlcC5jCkBAIC0xODI3LDEwICsxODI3LDEwIEBAIGNoZWNrX3ByZXZf
YWRkKHN0cnVjdCB0YXNrX3N0cnVjdCAqY3Vyciwgc3RydWN0IGhlbGRfbG9jayAqcHJldiwKIAkg
ICAgICAgc3RydWN0IGhlbGRfbG9jayAqbmV4dCwgaW50IGRpc3RhbmNlLCBzdHJ1Y3Qgc3RhY2tf
dHJhY2UgKnRyYWNlLAogCSAgICAgICBpbnQgKCpzYXZlKShzdHJ1Y3Qgc3RhY2tfdHJhY2UgKnRy
YWNlKSkKIHsKKwlzdHJ1Y3QgbG9ja19saXN0ICp1bmluaXRpYWxpemVkX3Zhcih0YXJnZXRfZW50
cnkpOwogCXN0cnVjdCBsb2NrX2xpc3QgKmVudHJ5OwotCWludCByZXQ7CiAJc3RydWN0IGxvY2tf
bGlzdCB0aGlzOwotCXN0cnVjdCBsb2NrX2xpc3QgKnVuaW5pdGlhbGl6ZWRfdmFyKHRhcmdldF9l
bnRyeSk7CisJaW50IHJldDsKIAogCS8qCiAJICogUHJvdmUgdGhhdCB0aGUgbmV3IDxwcmV2PiAt
PiA8bmV4dD4gZGVwZW5kZW5jeSB3b3VsZCBub3QKQEAgLTE4NDQsOCArMTg0NCwxNyBAQCBjaGVj
a19wcmV2X2FkZChzdHJ1Y3QgdGFza19zdHJ1Y3QgKmN1cnIsIHN0cnVjdCBoZWxkX2xvY2sgKnBy
ZXYsCiAJdGhpcy5jbGFzcyA9IGhsb2NrX2NsYXNzKG5leHQpOwogCXRoaXMucGFyZW50ID0gTlVM
TDsKIAlyZXQgPSBjaGVja19ub25jaXJjdWxhcigmdGhpcywgaGxvY2tfY2xhc3MocHJldiksICZ0
YXJnZXRfZW50cnkpOwotCWlmICh1bmxpa2VseSghcmV0KSkKKwlpZiAodW5saWtlbHkoIXJldCkp
IHsKKwkJaWYgKCF0cmFjZS0+ZW50cmllcykgeworCQkJLyoKKwkJCSAqIElmIEBzYXZlIGZhaWxz
IGhlcmUsIHRoZSBwcmludGluZyBtaWdodCB0cmlnZ2VyCisJCQkgKiBhIFdBUk4gYnV0IGJlY2F1
c2Ugb2YgdGhlICFucl9lbnRyaWVzIGl0IHNob3VsZAorCQkJICogbm90IGRvIGJhZCB0aGluZ3Mu
CisJCQkgKi8KKwkJCXNhdmUodHJhY2UpOworCQl9CiAJCXJldHVybiBwcmludF9jaXJjdWxhcl9i
dWcoJnRoaXMsIHRhcmdldF9lbnRyeSwgbmV4dCwgcHJldik7CisJfQogCWVsc2UgaWYgKHVubGlr
ZWx5KHJldCA8IDApKQogCQlyZXR1cm4gcHJpbnRfYmZzX2J1ZyhyZXQpOwogCkBAIC0xODkyLDcg
KzE5MDEsNyBAQCBjaGVja19wcmV2X2FkZChzdHJ1Y3QgdGFza19zdHJ1Y3QgKmN1cnIsIHN0cnVj
dCBoZWxkX2xvY2sgKnByZXYsCiAJCXJldHVybiBwcmludF9iZnNfYnVnKHJldCk7CiAKIAotCWlm
IChzYXZlICYmICFzYXZlKHRyYWNlKSkKKwlpZiAoIXRyYWNlLT5lbnRyaWVzICYmICFzYXZlKHRy
YWNlKSkKIAkJcmV0dXJuIDA7CiAKIAkvKgpAQCAtMTkxMiwyMCArMTkyMSw2IEBAIGNoZWNrX3By
ZXZfYWRkKHN0cnVjdCB0YXNrX3N0cnVjdCAqY3Vyciwgc3RydWN0IGhlbGRfbG9jayAqcHJldiwK
IAlpZiAoIXJldCkKIAkJcmV0dXJuIDA7CiAKLQkvKgotCSAqIERlYnVnZ2luZyBwcmludG91dHM6
Ci0JICovCi0JaWYgKHZlcmJvc2UoaGxvY2tfY2xhc3MocHJldikpIHx8IHZlcmJvc2UoaGxvY2tf
Y2xhc3MobmV4dCkpKSB7Ci0JCWdyYXBoX3VubG9jaygpOwotCQlwcmludGsoIlxuIG5ldyBkZXBl
bmRlbmN5OiAiKTsKLQkJcHJpbnRfbG9ja19uYW1lKGhsb2NrX2NsYXNzKHByZXYpKTsKLQkJcHJp
bnRrKEtFUk5fQ09OVCAiID0+ICIpOwotCQlwcmludF9sb2NrX25hbWUoaGxvY2tfY2xhc3MobmV4
dCkpOwotCQlwcmludGsoS0VSTl9DT05UICJcbiIpOwotCQlkdW1wX3N0YWNrKCk7Ci0JCWlmICgh
Z3JhcGhfbG9jaygpKQotCQkJcmV0dXJuIDA7Ci0JfQogCXJldHVybiAyOwogfQogCkBAIC0xOTQw
LDggKzE5MzUsMTIgQEAgY2hlY2tfcHJldnNfYWRkKHN0cnVjdCB0YXNrX3N0cnVjdCAqY3Vyciwg
c3RydWN0IGhlbGRfbG9jayAqbmV4dCkKIHsKIAlpbnQgZGVwdGggPSBjdXJyLT5sb2NrZGVwX2Rl
cHRoOwogCXN0cnVjdCBoZWxkX2xvY2sgKmhsb2NrOwotCXN0cnVjdCBzdGFja190cmFjZSB0cmFj
ZTsKLQlpbnQgKCpzYXZlKShzdHJ1Y3Qgc3RhY2tfdHJhY2UgKnRyYWNlKSA9IHNhdmVfdHJhY2U7
CisJc3RydWN0IHN0YWNrX3RyYWNlIHRyYWNlID0geworCQkubnJfZW50cmllcyA9IDAsCisJCS5t
YXhfZW50cmllcyA9IDAsCisJCS5lbnRyaWVzID0gTlVMTCwKKwkJLnNraXAgPSAwLAorCX07CiAK
IAkvKgogCSAqIERlYnVnZ2luZyBjaGVja3MuCkBAIC0xOTY3LDE4ICsxOTY2LDExIEBAIGNoZWNr
X3ByZXZzX2FkZChzdHJ1Y3QgdGFza19zdHJ1Y3QgKmN1cnIsIHN0cnVjdCBoZWxkX2xvY2sgKm5l
eHQpCiAJCSAqLwogCQlpZiAoaGxvY2stPnJlYWQgIT0gMiAmJiBobG9jay0+Y2hlY2spIHsKIAkJ
CWludCByZXQgPSBjaGVja19wcmV2X2FkZChjdXJyLCBobG9jaywgbmV4dCwKLQkJCQkJCWRpc3Rh
bmNlLCAmdHJhY2UsIHNhdmUpOworCQkJCQkJZGlzdGFuY2UsICZ0cmFjZSwgc2F2ZV90cmFjZSk7
CiAJCQlpZiAoIXJldCkKIAkJCQlyZXR1cm4gMDsKIAogCQkJLyoKLQkJCSAqIFN0b3Agc2F2aW5n
IHN0YWNrX3RyYWNlIGlmIHNhdmVfdHJhY2UoKSB3YXMKLQkJCSAqIGNhbGxlZCBhdCBsZWFzdCBv
bmNlOgotCQkJICovCi0JCQlpZiAoc2F2ZSAmJiByZXQgPT0gMikKLQkJCQlzYXZlID0gTlVMTDsK
LQotCQkJLyoKIAkJCSAqIFN0b3AgYWZ0ZXIgdGhlIGZpcnN0IG5vbi10cnlsb2NrIGVudHJ5LAog
CQkJICogYXMgbm9uLXRyeWxvY2sgZW50cmllcyBoYXZlIGFkZGVkIHRoZWlyCiAJCQkgKiBvd24g
ZGlyZWN0IGRlcGVuZGVuY2llcyBhbHJlYWR5LCBzbyB0aGlzCi0tIAoyLjEzLjYKCg==

--===============5293578254702271075==--

