Content-Type: multipart/mixed; boundary="===============3273369585245373545=="
MIME-Version: 1.0
From: Casey Schaufler <casey@schaufler-ca.com>
To: lkp@lists.01.org
Subject: Re: [LSM] Kernel panic - not syncing: No working init found.
Date: Mon, 17 Nov 2014 08:28:24 -0800
Message-ID: <546A2228.1080509@schaufler-ca.com>
In-Reply-To: <20141117060836.GB3938@yliu-dev.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3273369585245373545==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/16/2014 10:08 PM, Yuanhan Liu wrote:
> FYI, we noticed the below changes on(TBH, I don't know the bisect is
> correct or not; sorry for the noise if not)

The patch below fixes this problem.

>
> git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git lsm/stacking
> commit 58c4f9e3be81a85839ea229b1dd36bf55232d440 ("LSM: Refactor existing =
LSM stacking")
>
>
> +------------------------------------------------+------------+----------=
--+
> |                                                | c9979f3c6e | 58c4f9e3b=
e |
> +------------------------------------------------+------------+----------=
--+
> | boot_successes                                 | 15         | 0        =
  |
> | early-boot-hang                                | 1          |          =
  |
> | boot_failures                                  | 0          | 15       =
  |
> | Kernel_panic-not_syncing:No_working_init_found | 0          | 15       =
  |
> | backtrace:panic                                | 0          | 15       =
  |
> +------------------------------------------------+------------+----------=
--+
>
>
> [    3.437279] Starting init: /sbin/init exists but couldn't execute it (=
error -12)
> [    3.438655] Starting init: /etc/init exists but couldn't execute it (e=
rror -13)
> [    3.440136] Starting init: /bin/sh exists but couldn't execute it (err=
or -12)
> [    3.441487] Kernel panic - not syncing: No working init found.  Try pa=
ssing init=3D option to kernel. See Linux Documentation/init.txt for guidan=
ce.
> [    3.443352] CPU: 0 PID: 1 Comm: swapper Not tainted 3.18.0-rc4-g49aba5=
3 #1949
> [    3.443352]  00000000 f783d540 80017f88 8138c3bd 80017fa0 8138b30b 815=
e1f40 f783d540
> [    3.443352]  815e1f40 00000000 80017fac 81389523 8152ab4d 80016000 813=
918e0 81389474
> [    3.443352]  00000000 00000000 00000000 00000000 00000000 00000000 000=
0007b 0000007b
> [    3.443352] Call Trace:
> [    3.443352]  [<8138c3bd>] dump_stack+0x16/0x18
> [    3.443352]  [<8138b30b>] panic+0x86/0x19e
> [    3.443352]  [<81389523>] kernel_init+0xaf/0xb3
> [    3.443352]  [<813918e0>] ret_from_kernel_thread+0x20/0x30
> [    3.443352]  [<81389474>] ? rest_init+0xa2/0xa2
> [    3.443352] Kernel Offset: 0x0 from 0x81000000 (relocation range: 0x80=
000000-0x947fdfff)
>
> Elapsed time: 10
>
>
>
> 	--yliu
>
>
> _______________________________________________
> LKP mailing list
> LKP(a)linux.intel.com

 include/linux/security.h |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/security.h b/include/linux/security.h
index 5a6c839..5cd3e93 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -27,6 +27,7 @@
 #include <linux/slab.h>
 #include <linux/err.h>
 #include <linux/string.h>
+#include <linux/mm.h>
 =

 struct linux_binprm;
 struct cred;
@@ -1995,7 +1996,7 @@ static inline int security_settime(const struct times=
pec *ts,
 =

 static inline int security_vm_enough_memory_mm(struct mm_struct *mm, long =
pages)
 {
-	return cap_vm_enough_memory(mm, pages);
+	return __vm_enough_memory(mm, pages, cap_vm_enough_memory(mm, pages));
 }
 =

 static inline int security_bprm_set_creds(struct linux_binprm *bprm)


--===============3273369585245373545==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9SVNP
LTg4NTktMSIKICAgICAgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIj4KICA8L2hlYWQ+CiAgPGJv
ZHkgYmdjb2xvcj0iI0ZGRkZGRiIgdGV4dD0iIzAwMDAwMCI+CiAgICA8ZGl2IGNsYXNzPSJtb3ot
Y2l0ZS1wcmVmaXgiPk9uIDExLzE2LzIwMTQgMTA6MDggUE0sIFl1YW5oYW4gTGl1CiAgICAgIHdy
b3RlOjxicj4KICAgIDwvZGl2PgogICAgPGJsb2NrcXVvdGUgY2l0ZT0ibWlkOjIwMTQxMTE3MDYw
ODM2LkdCMzkzOEB5bGl1LWRldi5zaC5pbnRlbC5jb20iCiAgICAgIHR5cGU9ImNpdGUiPgogICAg
ICA8cHJlIHdyYXA9IiI+RllJLCB3ZSBub3RpY2VkIHRoZSBiZWxvdyBjaGFuZ2VzIG9uKFRCSCwg
SSBkb24ndCBrbm93IHRoZSBiaXNlY3QgaXMKY29ycmVjdCBvciBub3Q7IHNvcnJ5IGZvciB0aGUg
bm9pc2UgaWYgbm90KTwvcHJlPgogICAgPC9ibG9ja3F1b3RlPgogICAgPHByZT5UaGUgcGF0Y2gg
YmVsb3cgZml4ZXMgdGhpcyBwcm9ibGVtLgoKPC9wcmU+CiAgICA8YmxvY2txdW90ZSBjaXRlPSJt
aWQ6MjAxNDExMTcwNjA4MzYuR0IzOTM4QHlsaXUtZGV2LnNoLmludGVsLmNvbSIKICAgICAgdHlw
ZT0iY2l0ZSI+CiAgICAgIDxwcmUgd3JhcD0iIj4KCmdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9rZWVzL2xpbnV4LmdpdCBsc20vc3RhY2tpbmcKY29tbWl0IDU4
YzRmOWUzYmU4MWE4NTgzOWVhMjI5YjFkZDM2YmY1NTIzMmQ0NDAgKCJMU006IFJlZmFjdG9yIGV4
aXN0aW5nIExTTSBzdGFja2luZyIpCgoKKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tKwp8ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCBjOTk3OWYzYzZlIHwgNThjNGY5
ZTNiZSB8CistLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0r
LS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLSsKfCBib290X3N1Y2Nlc3NlcyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgMTUgICAgICAgICB8IDAgICAgICAgICAgfAp8IGVhcmx5LWJv
b3QtaGFuZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxICAgICAgICAgIHwgICAg
ICAgICAgICB8CnwgYm9vdF9mYWlsdXJlcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8IDAgICAgICAgICAgfCAxNSAgICAgICAgIHwKfCBLZXJuZWxfcGFuaWMtbm90X3N5bmNpbmc6
Tm9fd29ya2luZ19pbml0X2ZvdW5kIHwgMCAgICAgICAgICB8IDE1ICAgICAgICAgfAp8IGJhY2t0
cmFjZTpwYW5pYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAwICAgICAgICAgIHwg
MTUgICAgICAgICB8CistLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0rLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLSsKCgpbICAgIDMuNDM3Mjc5XSBTdGFydGlu
ZyBpbml0OiAvc2Jpbi9pbml0IGV4aXN0cyBidXQgY291bGRuJ3QgZXhlY3V0ZSBpdCAoZXJyb3Ig
LTEyKQpbICAgIDMuNDM4NjU1XSBTdGFydGluZyBpbml0OiAvZXRjL2luaXQgZXhpc3RzIGJ1dCBj
b3VsZG4ndCBleGVjdXRlIGl0IChlcnJvciAtMTMpClsgICAgMy40NDAxMzZdIFN0YXJ0aW5nIGlu
aXQ6IC9iaW4vc2ggZXhpc3RzIGJ1dCBjb3VsZG4ndCBleGVjdXRlIGl0IChlcnJvciAtMTIpClsg
ICAgMy40NDE0ODddIEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5nOiBObyB3b3JraW5nIGluaXQg
Zm91bmQuICBUcnkgcGFzc2luZyBpbml0PSBvcHRpb24gdG8ga2VybmVsLiBTZWUgTGludXggRG9j
dW1lbnRhdGlvbi9pbml0LnR4dCBmb3IgZ3VpZGFuY2UuClsgICAgMy40NDMzNTJdIENQVTogMCBQ
SUQ6IDEgQ29tbTogc3dhcHBlciBOb3QgdGFpbnRlZCAzLjE4LjAtcmM0LWc0OWFiYTUzICMxOTQ5
ClsgICAgMy40NDMzNTJdICAwMDAwMDAwMCBmNzgzZDU0MCA4MDAxN2Y4OCA4MTM4YzNiZCA4MDAx
N2ZhMCA4MTM4YjMwYiA4MTVlMWY0MCBmNzgzZDU0MApbICAgIDMuNDQzMzUyXSAgODE1ZTFmNDAg
MDAwMDAwMDAgODAwMTdmYWMgODEzODk1MjMgODE1MmFiNGQgODAwMTYwMDAgODEzOTE4ZTAgODEz
ODk0NzQKWyAgICAzLjQ0MzM1Ml0gIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAw
IDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDdiIDAwMDAwMDdiClsgICAgMy40NDMzNTJdIENhbGwg
VHJhY2U6ClsgICAgMy40NDMzNTJdICBbJmx0OzgxMzhjM2JkJmd0O10gZHVtcF9zdGFjaysweDE2
LzB4MTgKWyAgICAzLjQ0MzM1Ml0gIFsmbHQ7ODEzOGIzMGImZ3Q7XSBwYW5pYysweDg2LzB4MTll
ClsgICAgMy40NDMzNTJdICBbJmx0OzgxMzg5NTIzJmd0O10ga2VybmVsX2luaXQrMHhhZi8weGIz
ClsgICAgMy40NDMzNTJdICBbJmx0OzgxMzkxOGUwJmd0O10gcmV0X2Zyb21fa2VybmVsX3RocmVh
ZCsweDIwLzB4MzAKWyAgICAzLjQ0MzM1Ml0gIFsmbHQ7ODEzODk0NzQmZ3Q7XSA/IHJlc3RfaW5p
dCsweGEyLzB4YTIKWyAgICAzLjQ0MzM1Ml0gS2VybmVsIE9mZnNldDogMHgwIGZyb20gMHg4MTAw
MDAwMCAocmVsb2NhdGlvbiByYW5nZTogMHg4MDAwMDAwMC0weDk0N2ZkZmZmKQoKRWxhcHNlZCB0
aW1lOiAxMAoKCgoJLS15bGl1CjwvcHJlPgogICAgICA8YnI+CiAgICAgIDxmaWVsZHNldCBjbGFz
cz0ibWltZUF0dGFjaG1lbnRIZWFkZXIiPjwvZmllbGRzZXQ+CiAgICAgIDxicj4KICAgICAgPHBy
ZSB3cmFwPSIiPl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxLUCBtYWlsaW5nIGxpc3QKPGEgY2xhc3M9Im1vei10eHQtbGluay1hYmJyZXZpYXRlZCIgaHJl
Zj0ibWFpbHRvOkxLUEBsaW51eC5pbnRlbC5jb20iPkxLUEBsaW51eC5pbnRlbC5jb208L2E+Cjwv
cHJlPgogICAgPC9ibG9ja3F1b3RlPgogICAgPHByZT4gaW5jbHVkZS9saW51eC9zZWN1cml0eS5o
IHwgICAgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3NlY3VyaXR5LmggYi9pbmNsdWRlL2xpbnV4
L3NlY3VyaXR5LmgKaW5kZXggNWE2YzgzOS4uNWNkM2U5MyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9s
aW51eC9zZWN1cml0eS5oCisrKyBiL2luY2x1ZGUvbGludXgvc2VjdXJpdHkuaApAQCAtMjcsNiAr
MjcsNyBAQAogI2luY2x1ZGUgJmx0O2xpbnV4L3NsYWIuaCZndDsKICNpbmNsdWRlICZsdDtsaW51
eC9lcnIuaCZndDsKICNpbmNsdWRlICZsdDtsaW51eC9zdHJpbmcuaCZndDsKKyNpbmNsdWRlICZs
dDtsaW51eC9tbS5oJmd0OwogCiBzdHJ1Y3QgbGludXhfYmlucHJtOwogc3RydWN0IGNyZWQ7CkBA
IC0xOTk1LDcgKzE5OTYsNyBAQCBzdGF0aWMgaW5saW5lIGludCBzZWN1cml0eV9zZXR0aW1lKGNv
bnN0IHN0cnVjdCB0aW1lc3BlYyAqdHMsCiAKIHN0YXRpYyBpbmxpbmUgaW50IHNlY3VyaXR5X3Zt
X2Vub3VnaF9tZW1vcnlfbW0oc3RydWN0IG1tX3N0cnVjdCAqbW0sIGxvbmcgcGFnZXMpCiB7Ci0J
cmV0dXJuIGNhcF92bV9lbm91Z2hfbWVtb3J5KG1tLCBwYWdlcyk7CisJcmV0dXJuIF9fdm1fZW5v
dWdoX21lbW9yeShtbSwgcGFnZXMsIGNhcF92bV9lbm91Z2hfbWVtb3J5KG1tLCBwYWdlcykpOwog
fQogCiBzdGF0aWMgaW5saW5lIGludCBzZWN1cml0eV9icHJtX3NldF9jcmVkcyhzdHJ1Y3QgbGlu
dXhfYmlucHJtICpicHJtKQoKPC9wcmU+CiAgPC9ib2R5Pgo8L2h0bWw+Cg==

--===============3273369585245373545==--

