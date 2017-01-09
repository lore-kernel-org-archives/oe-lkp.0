Content-Type: multipart/mixed; boundary="===============2103058666795652524=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: lkp@lists.01.org
Subject: Re: [PATCH 0/4] lkp: add initial opensuse support
Date: Mon, 09 Jan 2017 16:48:38 +0800
Message-ID: <20170109084838.GA5826@intel.com>
In-Reply-To: <20170106190652.31544-1-mcgrof@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============2103058666795652524==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 06, 2017 at 11:06:48AM -0800, Luis R. Rodriguez wrote:
> I received a failed test results notice from 0-day LKP test suite
> using trinity, however it was pretty hard to get reproduce given
> the LKP did not have OpenSUSE support to start off with, but the
> second issue I've stubmled upon is beyond me -- running either:
> =

> ./bin/lkp qemu -k ~mcgrof/linux-next/arch/x86/boot/bzImage job-script
> =

> or
> =

> lkp qemu jobs/trinity.yaml =

> =

> ends up creating calling a few subroutines or files which are
> clearly not present, then tries to create a cpio archive but
> clearly there are a few files which LKP tree expects you to have
> and are not present such as lkp and lkp/scheduled.
> =

> This is a run on OpenSUSE, first we install the dependencies for
> trinity.yaml deps:
> =

>  # lkp install jobs/trinity.yaml =

> =

> Then we try to run it:
> =

>  # lkp qemu jobs/trinity.yaml =

> jobs/trinity.yaml: line 1: suite:: command not found
> jobs/trinity.yaml: line 2: testcase:: command not found
> jobs/trinity.yaml: line 4: runtime:: command not found
> jobs/trinity.yaml: line 6: kmsg:: command not found
> jobs/trinity.yaml: line 7: rootfs:: command not found
> jobs/trinity.yaml: line 9: trinity:: command not found
> make: Entering directory '/home/mcgrof/devel/lkp-tests/bin/event'
> klcc    -c -o wakeup.o wakeup.c
> klcc  -static -o wakeup wakeup.o
> rm -f wakeup.o
> strip wakeup
> make: Leaving directory '/home/mcgrof/devel/lkp-tests/bin/event'
> cpio: lkp: Cannot stat: No such file or directory
> cpio: lkp/scheduled: Cannot stat: No such file or directory
> cpio: blank line ignored
> cpio: File /dev/mqueue/=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD shrunk by 20 =
bytes, padding with zeros
> =

> This never complets, it just sits there.
> =

> Either way these patches help start to add OpenSUSE support.
> =

> Luis R. Rodriguez (4):
>   lib/install.sh: fix shell adapt_packages()
>   distro: add initial opensuse support
>   lib/install.*: make package dependency list uniq
>   .gitignore: add bin/event/wakeup

thanks a lot, all 4 patches applied

> =

>  .gitignore                  |  1 +
>  README.md                   | 22 ++++++++++++++++++++++
>  distro/adaptation/archlinux |  2 +-
>  distro/adaptation/fedora    |  2 +-
>  distro/adaptation/opensuse  | 14 ++++++++++++++
>  distro/depends/lkp-dev      |  4 ++++
>  distro/installer/opensuse   |  3 +++
>  lib/install.rb              |  2 +-
>  lib/install.sh              | 14 +++++++++++---
>  9 files changed, 58 insertions(+), 6 deletions(-)
>  create mode 100644 distro/adaptation/opensuse
>  create mode 100755 distro/installer/opensuse
> =

> -- =

> 2.11.0
>=20

--===============2103058666795652524==--

