Content-Type: multipart/mixed; boundary="===============1238813282090434941=="
MIME-Version: 1.0
From: David Howells <dhowells@redhat.com>
To: lkp@lists.01.org
Subject: Re: ffbe758dbb [ 0.052456] Kernel panic - not syncing: Can't create rootfs
Date: Thu, 02 Aug 2018 09:54:35 +0100
Message-ID: <23713.1533200075@warthog.procyon.org.uk>
In-Reply-To: <20180802021453.GA26770@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============1238813282090434941==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot <rong.a.chen@intel.com> wrote:

> [    0.052449] smack: Unknown parameter 'source'

That is the actual problem.  I think this should be fixed by the attached
patch.  I can replicate it with SELinux by removing the equivalent line from
there.

David
---
diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
index 339ac4d42785..c325c89be68e 100644
--- a/security/smack/smack_lsm.c
+++ b/security/smack/smack_lsm.c
@@ -678,6 +678,7 @@ static const struct fs_parameter_description smack_fs_p=
arameters =3D {
 	.nr_keys	=3D ARRAY_SIZE(smack_param_keys),
 	.keys		=3D smack_param_keys,
 	.specs		=3D smack_param_specs,
+	.ignore_unknown	=3D true,
 };
 =

 /**

--===============1238813282090434941==--

