Content-Type: multipart/mixed; boundary="===============7258085667028174453=="
MIME-Version: 1.0
From: Rusty Russell <rusty@rustcorp.com.au>
To: lkp@lists.01.org
Subject: Re: [params] RIP: 0010:[<ffffffff811c1a04>] [<ffffffff811c1a04>] sysfs_add_file_mode_ns+0x64/0x1f0
Date: Tue, 13 Jan 2015 13:38:11 +1030
Message-ID: <871tmzz8bo.fsf@rustcorp.com.au>
In-Reply-To: <1421030743.6201.154.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7258085667028174453==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Huang Ying <ying.huang@intel.com> writes:
> FYI, we noticed the below changes on
>
> commit 18eb74fa94161380c1acc9cf562cb835c4e54a25 ("params: cleanup sysfs a=
llocation")

Thanks!

This is caused by CONFIG_DEBUG_LOCK_ALLOC, which adds fields to
'struct attribute'.  In particular ignore_lockdep is never initialized.

If we memset to 0 before calling sysfs_attr_init() (which doesn't
actually initialize the attribute!), this is fixed.

Cheers,
Rusty.

Subject: param: fix uninitialized read with CONFIG_DEBUG_LOCK_ALLOC

ignore_lockdep is uninitialized, and sysfs_attr_init() doesn't initialize
it, so memset to 0.

Reported-by: Huang Ying <ying.huang@intel.com>
Cc: Eric W. Biederman <ebiederm@xmission.com>
Signed-off-by: Rusty Russell <rusty@rustcorp.com.au>

diff --git a/kernel/params.c b/kernel/params.c
index bd65d136a470..728e05b167de 100644
--- a/kernel/params.c
+++ b/kernel/params.c
@@ -642,6 +642,7 @@ static __modinit int add_sysfs_param(struct module_kobj=
ect *mk,
 	mk->mp->grp.attrs =3D new_attrs;
 =

 	/* Tack new one on the end. */
+	memset(&mk->mp->attrs[mk->mp->num], 0, sizeof(mk->mp->attrs[0]));
 	sysfs_attr_init(&mk->mp->attrs[mk->mp->num].mattr.attr);
 	mk->mp->attrs[mk->mp->num].param =3D kp;
 	mk->mp->attrs[mk->mp->num].mattr.show =3D param_attr_show;

--===============7258085667028174453==--

