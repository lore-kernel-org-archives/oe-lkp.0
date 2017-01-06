Content-Type: multipart/mixed; boundary="===============2822281582328844889=="
MIME-Version: 1.0
From: Luis R. Rodriguez <mcgrof@kernel.org>
To: lkp@lists.01.org
Subject: [PATCH 1/4] lib/install.sh: fix shell adapt_packages()
Date: Fri, 06 Jan 2017 11:06:49 -0800
Message-ID: <20170106190652.31544-2-mcgrof@kernel.org>
In-Reply-To: <20170106190652.31544-1-mcgrof@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============2822281582328844889==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

There are only a few packages with architecture specific
annotations right now, they all use a :i386 postfix. The
current ruby adapt_packages() works well, however on shell,
the distro_pkg=3D${mapping#$pkg:} does not work as well as
Ruby's array use and find. Furthermore the bash implementation
allows a final grep to end up giving you more than one package,
so if you have libc-dev but a distro mapping file has a mapping
for both libc-dev and libc-dev:i386 we'd end up with both
mappings. Lastly the mapping for architectures simply does
not work...

Fix this for now by modifying the shell implementation of
adapt_packages() to check if a package we are going to
query is architecture specific or not, and as a general
rule for now just require non-arch packages to go first,
while arch packages go last. The awk query is much better
and will do what we expected.

Long term we should just modify the distro/adaptation/*
files to use a delimiter which can never be part of a package
name, for instance using the pipe "|". That would allow us to
get rid of this small cruft on the bash implementation and
enable both bash and ruby implementations to match much closely.

Since we are sticking to a rule for now of having the arch
packages go last modify the few archs which do have these
mappings to match this rule.

Signed-off-by: Luis R. Rodriguez <mcgrof@kernel.org>
---
 distro/adaptation/archlinux |  2 +-
 distro/adaptation/fedora    |  2 +-
 distro/depends/lkp-dev      |  4 ++++
 lib/install.sh              | 10 ++++++++--
 4 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/distro/adaptation/archlinux b/distro/adaptation/archlinux
index dd8b4ab5967f..0a4ecd5c6d4d 100644
--- a/distro/adaptation/archlinux
+++ b/distro/adaptation/archlinux
@@ -66,6 +66,6 @@ xfslibs-dev: xfsprogs
 libattr1-dev: attr
 libacl1-dev: acl
 libc-dev:i386:
-linux-libc-dev:i386:
 linux-libc-dev:
+linux-libc-dev:i386:
 libklibc-dev:
diff --git a/distro/adaptation/fedora b/distro/adaptation/fedora
index a56ed9d0b870..b3ad3fbcdf20 100644
--- a/distro/adaptation/fedora
+++ b/distro/adaptation/fedora
@@ -69,6 +69,6 @@ libreadline5:
 libtool-bin:
 libnuma-dev: numactl-devel
 libc-dev:i386:
-linux-libc-dev:i386:
 linux-libc-dev:
+linux-libc-dev:i386:
 libklibc-dev:
diff --git a/distro/depends/lkp-dev b/distro/depends/lkp-dev
index 70f3c731787e..f3f27f73a965 100644
--- a/distro/depends/lkp-dev
+++ b/distro/depends/lkp-dev
@@ -1,3 +1,7 @@
+# Put architecture packages after the non architecture specific
+# package. We can change this requiremet if we modify
+# distro/adaptation/* files to use something uniq that is not
+# part of real packages, like: |
 make
 automake
 gcc
diff --git a/lib/install.sh b/lib/install.sh
index d4f8c1feab37..0957f13c9937 100755
--- a/lib/install.sh
+++ b/lib/install.sh
@@ -33,9 +33,15 @@ adapt_packages()
 =

 	for pkg in $generic_packages
 	do
-		local mapping=3D"$(grep "^$pkg:" $distro_file)"
+		local mapping=3D""
+		local is_arch_dep=3D"$(echo $pkg | grep ":")"
+		if [ -n "$is_arch_dep" ]; then
+			mapping=3D"$(grep "^$pkg:" $distro_file | tail -1)"
+		else
+			mapping=3D"$(grep "^$pkg:" $distro_file | head -1)"
+		fi
 		if [ -n "$mapping" ]; then
-			distro_pkg=3D${mapping#$pkg:}
+			distro_pkg=3D$(echo $mapping | awk -F": " '{print $2}')
 			[ -n "$distro_pkg" ] && echo $distro_pkg
 		else
 			echo $pkg
-- =

2.11.0


--===============2822281582328844889==--

