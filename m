Content-Type: multipart/mixed; boundary="===============3921095484776597738=="
MIME-Version: 1.0
From: Aaron Tomlin <atomlin@redhat.com>
To: lkp@lists.01.org
Subject: [RFC PATCH v3 00/13] module: core code clean up
Date: Fri, 28 Jan 2022 12:50:33 +0000
Message-ID: <20220128125046.497173-1-atomlin@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3921095484776597738==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Luis,

[Note: Cc'd live-patching for feedback on livepatch specific changes]

Firstly, apologies for the delay.

As per your suggestion [1], this is an attempt to refactor and split
optional code out of core module support code into separate components.
This version is based on branch mcgrof/modules-next since a97ac8cb24a3/or
modules-5.17-rc1. Please let me know your thoughts.

Changes since v1 [2]:

  - Moved module version support code into a new file

Changes since v2 [3]:

 - Move module decompress support to a separate file
 - Make check_modinfo_livepatch() generic (Petr Mladek)
 - Remove filename from each newly created file (Luis Chamberlain)
 - Addressed some (i.e. --ignore=3DASSIGN_IN_IF,AVOID_BUG was used)
   minor scripts/checkpatch.pl concerns e.g., use strscpy over
   strlcpy and missing a blank line after declarations (Allen)

[1]: https://lore.kernel.org/lkml/YbEZ4HgSYQEPuRmS(a)bombadil.infradead.org/
[2]: https://lore.kernel.org/lkml/20211228213041.1356334-1-atomlin(a)redhat=
.com/
[3]: https://lore.kernel.org/lkml/20220106234319.2067842-1-atomlin(a)redhat=
.com/


Aaron Tomlin (13):
  module: Move all into module/
  module: Simple refactor in preparation for split
  module: Move livepatch support to a separate file
  module: Move latched RB-tree support to a separate file
  module: Move arch strict rwx support to a separate file
  module: Move strict rwx support to a separate file
  module: Move extra signature support out of core code
  module: Move kmemleak support to a separate file
  module: Move kallsyms support into a separate file
  module: Move procfs support into a separate file
  module: Move sysfs support into a separate file
  module: Move kdb_modules list out of core code
  module: Move version support into a separate file

 MAINTAINERS                                   |    2 +-
 include/linux/module.h                        |   92 +-
 kernel/Makefile                               |    5 +-
 kernel/debug/kdb/kdb_main.c                   |    5 +
 kernel/module-internal.h                      |   50 -
 kernel/module/Makefile                        |   18 +
 kernel/module/arch_strict_rwx.c               |   44 +
 kernel/module/debug_kmemleak.c                |   30 +
 .../decompress.c}                             |    2 +-
 kernel/module/internal.h                      |  203 ++
 kernel/module/kallsyms.c                      |  502 +++++
 kernel/module/livepatch.c                     |   74 +
 kernel/{module.c =3D> module/main.c}            | 1879 +----------------
 kernel/module/procfs.c                        |  142 ++
 .../signature.c}                              |    0
 kernel/module/signing.c                       |  120 ++
 kernel/module/strict_rwx.c                    |   83 +
 kernel/module/sysfs.c                         |  425 ++++
 kernel/module/tree_lookup.c                   |  108 +
 kernel/module/version.c                       |  110 +
 kernel/module_signing.c                       |   45 -
 21 files changed, 2033 insertions(+), 1906 deletions(-)
 delete mode 100644 kernel/module-internal.h
 create mode 100644 kernel/module/Makefile
 create mode 100644 kernel/module/arch_strict_rwx.c
 create mode 100644 kernel/module/debug_kmemleak.c
 rename kernel/{module_decompress.c =3D> module/decompress.c} (99%)
 create mode 100644 kernel/module/internal.h
 create mode 100644 kernel/module/kallsyms.c
 create mode 100644 kernel/module/livepatch.c
 rename kernel/{module.c =3D> module/main.c} (63%)
 create mode 100644 kernel/module/procfs.c
 rename kernel/{module_signature.c =3D> module/signature.c} (100%)
 create mode 100644 kernel/module/signing.c
 create mode 100644 kernel/module/strict_rwx.c
 create mode 100644 kernel/module/sysfs.c
 create mode 100644 kernel/module/tree_lookup.c
 create mode 100644 kernel/module/version.c
 delete mode 100644 kernel/module_signing.c


base-commit: a97ac8cb24a3c3ad74794adb83717ef1605d1b47
-- =

2.34.1

--===============3921095484776597738==--

