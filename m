Content-Type: multipart/mixed; boundary="===============5174068374027341454=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [PATCH 2/4] distro: add initial opensuse support
Date: Mon, 09 Jan 2017 15:40:02 +0800
Message-ID: <20170109074002.GR690@yexl-desktop>
In-Reply-To: <20170106190652.31544-3-mcgrof@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============5174068374027341454==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Ye Xiaolong <xiaolong.ye@intel.com>

Thanks,
Xiaolong

On 01/06, Luis R. Rodriguez wrote:
>Tested with:
>
>export LKP_SRC=3D$PWD
>export PATH=3D$PATH:$LKP_SRC/bin
>lkp install jobs/trinity.yaml
>
>Signed-off-by: Luis R. Rodriguez <mcgrof@kernel.org>
>---
> README.md                  | 22 ++++++++++++++++++++++
> distro/adaptation/opensuse | 14 ++++++++++++++
> distro/installer/opensuse  |  3 +++
> lib/install.sh             |  2 ++
> 4 files changed, 41 insertions(+)
> create mode 100644 distro/adaptation/opensuse
> create mode 100755 distro/installer/opensuse
>
>diff --git a/README.md b/README.md
>index 8031c867c0af..b45a3f6bb91f 100644
>--- a/README.md
>+++ b/README.md
>@@ -50,4 +50,26 @@ Most test cases should install/run well in
> - Ubuntu 14.04
> - Archlinux
> =

>+There is however some initial support for:
>+
>+- OpenSUSE:
>+	- jobs/trinity.yaml
>+- Fedora
>+
> As for now, lkp-tests still needs to run as root.
>+
>+## Adding distribution support
>+
>+If you want to add support for your Linux distribution you will need
>+an installer file which allows us to install dependencies per job. For
>+examples look at: distro/installer/* files.
>+
>+Since packages can have different names we provide an adaptation mapping =
for a
>+base Ubuntu package (since development started with that) to your own
>+distribution package name, for example adaptation files see:
>+distro/adaptation/*. For now adaptation files must have the architecture
>+dependent packages (ie, that ends with the postfix :i386) towards the end
>+of the adaptation file.
>+
>+You will also want to add a case for your distribution on sync_distro_sou=
rces()
>+on the file lib/install.sh.
>diff --git a/distro/adaptation/opensuse b/distro/adaptation/opensuse
>new file mode 100644
>index 000000000000..c4543bf92b66
>--- /dev/null
>+++ b/distro/adaptation/opensuse
>@@ -0,0 +1,14 @@
>+# Go get it yourself:
>+# https://github.com/schacon/ruby-git
>+# We have no package for it yet
>+ruby-git:
>+linux-libc-dev: glibc-devel
>+linux-perf: perf
>+build-essential:
>+libc6-dev: glibc-devel
>+libc6-dev:i386: glibc-devel-32bit
>+libc-dev: glibc-devel
>+libc-dev:i386: glibc-devel-32bit
>+linux-libc-dev: glibc-devel
>+linux-libc-dev:i386: glibc-devel-32bit
>+libklibc-dev:
>diff --git a/distro/installer/opensuse b/distro/installer/opensuse
>new file mode 100755
>index 000000000000..a909f3e39c05
>--- /dev/null
>+++ b/distro/installer/opensuse
>@@ -0,0 +1,3 @@
>+#!/bin/bash
>+
>+sudo zypper install -y $*
>diff --git a/lib/install.sh b/lib/install.sh
>index 0957f13c9937..0b090f8b82bf 100755
>--- a/lib/install.sh
>+++ b/lib/install.sh
>@@ -17,6 +17,8 @@ sync_distro_sources()
> 			yum update
> 		fi ;;
> 	archlinux) yaourt -Sy ;;
>+	opensuse)
>+		zypper update ;;
> 	*) echo "Not support $distro to do update" ;;
> 	esac
> }
>-- =

>2.11.0
>

--===============5174068374027341454==--

