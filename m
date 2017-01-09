Content-Type: multipart/mixed; boundary="===============4136724221046804576=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [PATCH 3/4] lib/install.*: make package dependency list uniq
Date: Mon, 09 Jan 2017 15:40:30 +0800
Message-ID: <20170109074030.GS690@yexl-desktop>
In-Reply-To: <20170106190652.31544-4-mcgrof@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============4136724221046804576==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Ye Xiaolong <xiaolong.ye@intel.com>

Thanks,
Xiaolong

On 01/06, Luis R. Rodriguez wrote:
>This provides a small optimization to reduce the list of
>package dependencies we give back to the distribution installer
>by making the list uniq. Since bash is rather stupid we need to
>first sort the list prior to passing it to sort.
>
>Signed-off-by: Luis R. Rodriguez <mcgrof@kernel.org>
>---
> lib/install.rb | 2 +-
> lib/install.sh | 2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/lib/install.rb b/lib/install.rb
>index 63b11ad1a5b2..8f40e3e902bc 100755
>--- a/lib/install.rb
>+++ b/lib/install.rb
>@@ -31,5 +31,5 @@ def get_dependency_packages(distro, script)
> =

> 	packages =3D adapt_packages(distro, generic_packages)
> =

>-	return packages.flatten.compact
>+	return packages.flatten.compact.uniq
> end
>diff --git a/lib/install.sh b/lib/install.sh
>index 0b090f8b82bf..cb9a8d0ea530 100755
>--- a/lib/install.sh
>+++ b/lib/install.sh
>@@ -61,5 +61,5 @@ get_dependency_packages()
> =

> 	local generic_packages=3D"$(sed 's/#.*//' "$base_file")"
> =

>-	adapt_packages
>+	adapt_packages | sort | uniq
> }
>-- =

>2.11.0
>

--===============4136724221046804576==--

