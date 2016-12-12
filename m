Content-Type: multipart/mixed; boundary="===============1769933649437515085=="
MIME-Version: 1.0
From: Jan Kara <jack@suse.cz>
To: lkp@lists.01.org
Subject: Re: [ext4] e2ae766c1b: BUG:sleeping_function_called_from_invalid_context_at_kernel/locking/rwsem.c
Date: Mon, 12 Dec 2016 17:35:18 +0100
Message-ID: <20161212163518.GA20728@quack2.suse.cz>
In-Reply-To: <20161212101321.GA37214@inn.lkp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1769933649437515085==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon 12-12-16 18:13:21, kernel test robot wrote:
> FYI, we noticed the following commit:
> =

> commit: e2ae766c1b030271b5099b25674e2131d1d1e8c1 ("ext4: convert DAX faul=
ts to iomap infrastructure")
> https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
> =

> in testcase: nvml
> with following parameters:
> =

> 	group: vmem
> 	test: pmem
> 	nr_pmem: 1
> 	fs: ext4
> 	mount_option: dax
> =

> =

> =

> on test machine: 64 threads Intel(R) Xeon(R) CPU E5-4650 0 @ 2.70GHz with=
 64G memory
> =

> caused below changes:
> =

> =

> +------------------------------------------------+------------+----------=
--+
> |                                                | 96f8ba3dd6 | e2ae766c1=
b |
> +------------------------------------------------+------------+----------=
--+
> | boot_successes                                 | 2          | 2        =
  |
> | boot_failures                                  | 2          | 2        =
  |
> | BUG:kernel_hang_in_test_stage                  | 2          |          =
  |
> | WARNING:at_fs/sysfs/dir.c:#sysfs_warn_dup      | 0          | 2        =
  |
> | calltrace:parport_pc_init                      | 0          | 2        =
  |
> | calltrace:SyS_finit_module                     | 0          | 2        =
  |
> | WARNING:at_lib/kobject.c:#kobject_add_internal | 0          | 2        =
  |
> +------------------------------------------------+------------+----------=
--+
> =

> =

> =

> user  :notice: [  325.592182] vmem_aligned_alloc/TEST1: SETUP (check/pmem=
/debug)
> =

> user  :notice: [  325.603973] vmem_aligned_alloc/TEST1: START: vmem_align=
ed_alloc
> kern  :err   : [  325.608906] BUG: sleeping function called from invalid =
context at kernel/locking/rwsem.c:51
> kern  :err   : [  325.608908] in_atomic(): 1, irqs_disabled(): 0, pid: 24=
813, name: vmem_aligned_al
> kern  :warn  : [  325.608914] CPU: 44 PID: 24813 Comm: vmem_aligned_al Ta=
inted: G           O    4.9.0-rc4-00045-ge2ae766 #1
> kern  :warn  : [  325.608916] Hardware name: Intel Corporation LH Pass/S4=
600LH...., BIOS SE5C600.86B.99.02.1047.032320122259 03/23/2012
> kern  :warn  : [  325.608922]  ffffc9002c1f7be0
> kern  :warn  : [  325.608923]  ffffffff81466af9
> kern  :warn  : [  325.608924]  ffff880fea2425c0

I think this is actually a bug introduced by Ross' PMD support. Attached
patch should fix it. Ross, can you check it please?

								Honza
-- =

Jan Kara <jack@suse.com>
SUSE Labs, CR

--===============1769933649437515085==
Content-Type: text/x-patch
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dax-Fix-sleep-in-atomic-contex-in-grab_mapping_entry.patch"

PkZyb20gYzNkNjdkYzc1NDNhYmMwMzE2MWY2Y2YzNTcwMzlhZDllNTY3ODNjYSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKRnJvbTogSmFuIEthcmEgPGphY2tAc3VzZS5jej4KRGF0ZTogTW9uLCAx
MiBEZWMgMjAxNiAxNjozMjoyMyArMDEwMApTdWJqZWN0OiBbUEFUQ0hdIGRheDogRml4IHNsZWVw
IGluIGF0b21pYyBjb250ZXggaW4gZ3JhYl9tYXBwaW5nX2VudHJ5KCkKCkNvbW1pdCA3YjViOGM5
YzRhYzkgImRheDogYWRkIHN0cnVjdCBpb21hcCBiYXNlZCBEQVggUE1EIHN1cHBvcnQiIGhhcwpp
bnRyb2R1Y2VkIHVubWFwcGluZyBvZiBwYWdlIHRhYmxlcyBpZiBodWdlIHBhZ2UgbmVlZHMgdG8g
YmUgc3BsaXQgaW4KZ3JhYl9tYXBwaW5nX2VudHJ5KCkuIEhvd2V2ZXIgdGhlIHVubWFwcGluZyBo
YXBwZW5zIGFmdGVyCnJhZGl4X3RyZWVfcHJlbG9hZCgpIGNhbGwgd2hpY2ggZGlzYWJsZXMgcHJl
ZW1wdGlvbiBhbmQgdGh1cwp1bm1hcF9tYXBwaW5nX3JhbmdlKCkgdHJpZXMgdG8gYWNxdWlyZSBp
X21tYXBfbG9jayBpbiBhdG9taWMgY29udGV4dAp3aGljaCBpcyBhIGJ1Zy4gRml4IHRoZSBwcm9i
bGVtIGJ5IG1vdmluZyB1bm1hcHBpbmcgYmVmb3JlCnJhZGl4X3RyZWVfcHJlbG9hZCgpIGNhbGwu
CgpGaXhlczogN2I1YjhjOWM0YWM5NzE2ZmU5ZDc3ZWM1NmFlNWQ5NjIxOTJiYTAzMApTaWduZWQt
b2ZmLWJ5OiBKYW4gS2FyYSA8amFja0BzdXNlLmN6PgotLS0KIGZzL2RheC5jIHwgMTUgKysrKysr
Ky0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2ZzL2RheC5jIGIvZnMvZGF4LmMKaW5kZXggNTFiMDNlOTFkM2UyLi41
Yzc0ZjYwZDBhNTAgMTAwNjQ0Ci0tLSBhL2ZzL2RheC5jCisrKyBiL2ZzL2RheC5jCkBAIC0zNTEs
MTQgKzM1MSw2IEBAIHN0YXRpYyB2b2lkICpncmFiX21hcHBpbmdfZW50cnkoc3RydWN0IGFkZHJl
c3Nfc3BhY2UgKm1hcHBpbmcsIHBnb2ZmX3QgaW5kZXgsCiAJCX0KIAogCQlzcGluX3VubG9ja19p
cnEoJm1hcHBpbmctPnRyZWVfbG9jayk7Ci0JCWVyciA9IHJhZGl4X3RyZWVfcHJlbG9hZCgKLQkJ
CQltYXBwaW5nX2dmcF9tYXNrKG1hcHBpbmcpICYgfl9fR0ZQX0hJR0hNRU0pOwotCQlpZiAoZXJy
KSB7Ci0JCQlpZiAocG1kX2Rvd25ncmFkZSkKLQkJCQlwdXRfbG9ja2VkX21hcHBpbmdfZW50cnko
bWFwcGluZywgaW5kZXgsIGVudHJ5KTsKLQkJCXJldHVybiBFUlJfUFRSKGVycik7Ci0JCX0KLQog
CQkvKgogCQkgKiBCZXNpZGVzIGh1Z2UgemVybyBwYWdlcyB0aGUgb25seSBvdGhlciB0aGluZyB0
aGF0IGdldHMKIAkJICogZG93bmdyYWRlZCBhcmUgZW1wdHkgZW50cmllcyB3aGljaCBkb24ndCBu
ZWVkIHRvIGJlCkBAIC0zNjgsNiArMzYwLDEzIEBAIHN0YXRpYyB2b2lkICpncmFiX21hcHBpbmdf
ZW50cnkoc3RydWN0IGFkZHJlc3Nfc3BhY2UgKm1hcHBpbmcsIHBnb2ZmX3QgaW5kZXgsCiAJCQl1
bm1hcF9tYXBwaW5nX3JhbmdlKG1hcHBpbmcsCiAJCQkJKGluZGV4IDw8IFBBR0VfU0hJRlQpICYg
UE1EX01BU0ssIFBNRF9TSVpFLCAwKTsKIAorCQllcnIgPSByYWRpeF90cmVlX3ByZWxvYWQoCisJ
CQkJbWFwcGluZ19nZnBfbWFzayhtYXBwaW5nKSAmIH5fX0dGUF9ISUdITUVNKTsKKwkJaWYgKGVy
cikgeworCQkJaWYgKHBtZF9kb3duZ3JhZGUpCisJCQkJcHV0X2xvY2tlZF9tYXBwaW5nX2VudHJ5
KG1hcHBpbmcsIGluZGV4LCBlbnRyeSk7CisJCQlyZXR1cm4gRVJSX1BUUihlcnIpOworCQl9CiAJ
CXNwaW5fbG9ja19pcnEoJm1hcHBpbmctPnRyZWVfbG9jayk7CiAKIAkJaWYgKHBtZF9kb3duZ3Jh
ZGUpIHsKLS0gCjIuMTAuMgoK

--===============1769933649437515085==--

