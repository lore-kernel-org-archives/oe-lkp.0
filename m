Content-Type: multipart/mixed; boundary="===============4288893435438059571=="
MIME-Version: 1.0
From: Dave Hansen <dave.hansen@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: 2f47e7e19f ("x86/mm/kaiser: Use PCID feature to make user and .."): WARNING: CPU: 0 PID: 1 at mm/early_ioremap.c:114 __early_ioremap
Date: Mon, 27 Nov 2017 08:14:35 -0800
Message-ID: <bdfdf131-ca57-68c3-3a6c-039cd21c3bb5@linux.intel.com>
In-Reply-To: <20171127101814.jsglrh7typy3pxxp@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4288893435438059571==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/27/2017 02:18 AM, Ingo Molnar wrote:
> [    0.031000] Call Trace:
> [    0.031000]  ? kernfs_add_one+0x1d9/0x1f0
> [    0.031000]  early_memremap+0x33/0x3d
> [    0.031000]  ? cnb20le_res+0x2f2/0x2f2
> [    0.031000]  __acpi_map_table+0x1d/0x28
> [    0.031000]  acpi_os_map_iomem+0x1cf/0x2a0
> [    0.031000]  ? cnb20le_res+0x2f2/0x2f2
> [    0.031000]  acpi_os_map_memory+0xd/0x20
> [    0.031000]  acpi_find_root_pointer+0x1f/0x1ec
> [    0.031000]  ? cnb20le_res+0x2f2/0x2f2
> [    0.031000]  acpi_os_get_root_pointer+0x18/0x25
> [    0.031000]  broadcom_postcore_init+0xc/0x6c
> [    0.031000]  do_one_initcall+0xc4/0x1f7
> [    0.031000]  kernel_init_freeable+0x1c2/0x2b2
> [    0.031000]  ? rest_init+0x1a0/0x1a0
> [    0.031000]  kernel_init+0xd/0x1bc
> [    0.031000]  ret_from_fork+0x1f/0x30

I've been able to reproduce this.  The bug here (at least on my system)
is that we're calling into the ACPI code while 'acpi_disabled=3D1'.  The
ACPI code then notices that it hasn't been initialized (because it
should be off) and calls into the early_ioremap() code thinking that
it's in early boot.

I don't know why the bisect pinned this on the kaiser patches, or why
it's only showing up now.  It's possible that some botched TLB flush
_caused_ ACPI to get disabled at a weird time which then caused this
warning.

There are some recent changes around broadcom_postcore_init().

ACPI folks, any suggestions on what to do here?  Should we be bailing
out of acpi_os_get_root_pointer() like the attached patch?

It might also be worth an audit of all of the 'acpi_permanent_mmap'
call-sites to make sure they check acpi_disabled first.

--===============4288893435438059571==
Content-Type: text/x-patch
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="acpi-off-but-still-called.patch"

CgotLS0KCiBiL2RyaXZlcnMvYWNwaS9vc2wuYyB8ICAgIDQgKysrKwogMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtcHVOIGRyaXZlcnMvYWNwaS9vc2wuY35hY3BpLW9mZi1i
dXQtc3RpbGwtY2FsbGVkIGRyaXZlcnMvYWNwaS9vc2wuYwotLS0gYS9kcml2ZXJzL2FjcGkvb3Ns
LmN+YWNwaS1vZmYtYnV0LXN0aWxsLWNhbGxlZAkyMDE3LTExLTI3IDA4OjA1OjUzLjE2MTYxMTE2
NCAtMDgwMAorKysgYi9kcml2ZXJzL2FjcGkvb3NsLmMJMjAxNy0xMS0yNyAwODowNjo1NS4yODg2
MTEwMDkgLTA4MDAKQEAgLTE5MSw2ICsxOTEsOCBAQCBhY3BpX3BoeXNpY2FsX2FkZHJlc3MgX19p
bml0IGFjcGlfb3NfZ2V0CiB7CiAJYWNwaV9waHlzaWNhbF9hZGRyZXNzIHBhID0gMDsKIAorCWlm
IChhY3BpX2Rpc2FibGVkKQorCQlyZXR1cm4gcGE7CiAjaWZkZWYgQ09ORklHX0tFWEVDCiAJaWYg
KGFjcGlfcnNkcCkKIAkJcmV0dXJuIGFjcGlfcnNkcDsKQEAgLTMxOCw2ICszMjAsOCBAQCBhY3Bp
X29zX21hcF9pb21lbShhY3BpX3BoeXNpY2FsX2FkZHJlc3MKIAlhY3BpX3BoeXNpY2FsX2FkZHJl
c3MgcGdfb2ZmOwogCWFjcGlfc2l6ZSBwZ19zejsKIAorCVdBUk5fT04oYWNwaV9kaXNhYmxlZCk7
CisKIAlpZiAocGh5cyA+IFVMT05HX01BWCkgewogCQlwcmludGsoS0VSTl9FUlIgUFJFRklYICJD
YW5ub3QgbWFwIG1lbW9yeSB0aGF0IGhpZ2hcbiIpOwogCQlyZXR1cm4gTlVMTDsKXwo=

--===============4288893435438059571==--

