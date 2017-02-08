Content-Type: multipart/mixed; boundary="===============3912120253052134255=="
MIME-Version: 1.0
From: Cao Shufeng <caosf.fnst@cn.fujitsu.com>
To: lkp@lists.01.org
Subject: [PATCH_v4.1_0_3] Make core_pattern support namespace
Date: Wed, 08 Feb 2017 11:00:54 +0800
Message-ID: <1486522857-9946-1-git-send-email-caosf.fnst@cn.fujitsu.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3912120253052134255==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This patchset includes following function points:
1: Let usermodehelper function possible to set pid namespace
   done by: [PATCH v4 1/3] Make call_usermodehelper_exec possible
   to set pid namespace.
2: Let pipe_type core_pattern write dump into container's rootfs
   done by: [PATCH v4 2/3] Limit dump_pipe program's permission to
   init for container.
2: Make separate core_pattern setting for each container
   done by: [PATCH v4 3/3] Make core_pattern support namespace
3: Compatibility with current system
   also included in: [PATCH v4 3/3] Make core_pattern support namespace
   If container hadn't change core_pattern setting, it will keep
   same setting with host.

Test:
1: Pass a test script for each function of this patchset
   ## TEST IN HOST ##
   [root(a)kerneldev dumptest]# ./test_host
   Set file core_pattern: OK
   ./test_host: line 41:  2366 Segmentation fault      (core dumped) "$SCRI=
=3D
PT_BASE_DIR"/make_dump
   Checking dumpfile: OK
   Set file core_pattern: OK
   ./test_host: line 41:  2369 Segmentation fault      (core dumped) "$SCRI=
=3D
PT_BASE_DIR"/make_dump
   Checking dump_pipe triggered: OK
   Checking rootfs: OK
   Checking dumpfile: OK
   Checking namespace: OK
   Checking process list: OK
   Checking capabilities: OK

   ## TEST IN GUEST ##
   # ./test
   Segmentation fault (core dumped)
   Checking dump_pipe triggered: OK
   Checking rootfs: OK
   Checking dumpfile: OK
   Checking namespace: OK
   Checking process list: OK
   Checking cg pids: OK
   Checking capabilities: OK
   [   64.940734] make_dump[2432]: segfault at 0 ip 000000000040049d sp 000=
=3D
07ffc4af025f0 error 6 in make_dump[400000+a6000]
   #
2: Pass other test(which is not easy to do in script) by hand.

Changelog v4-v4.1:
1. Fix kernel panic pointed out by:
   xiaolong.ye(a)intel.com

Changelog v3.1-v4:
1. remove extra fork pointed out by:
   Andrei Vagin <avagin@gmail.com>

Changelog v3-v3.1:
1. Switch "pwd" of pipe program to container's root fs.
2. Rebase on top of v4.9-rc1

Changelog v2->v3:
1: Fix problem of setting pid namespace, pointed out by:
   Andrei Vagin <avagin@gmail.com>

Changelog v1(RFC)->v2:
1: Add [PATCH 2/2] which was todo in [RFC v1].
2: Pass a test script for each function.
3: Rebase on top of v4.7.

Suggested-by: Eric W. Biederman <ebiederm@xmission.com>
Suggested-by: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
Signed-off-by: Zhao Lei <zhaolei@cn.fujitsu.com>
Signed-off-by: Cao Shufeng <caosf.fnst@cn.fujitsu.com>

Cao Shufeng (2):
  Make call_usermodehelper_exec possible to set namespaces
  Limit dump_pipe program's permission to init for container

Zhao Lei (1):
  Make core_pattern support namespace

 fs/coredump.c                 | 150 ++++++++++++++++++++++++++++++++++++++=
+---
 include/linux/binfmts.h       |   2 +
 include/linux/kmod.h          |   5 ++
 include/linux/pid_namespace.h |   3 +
 init/do_mounts_initrd.c       |   3 +-
 kernel/kmod.c                 |  55 +++++++++++++---
 kernel/pid.c                  |   2 +
 kernel/pid_namespace.c        |   2 +
 kernel/sysctl.c               |  50 ++++++++++++--
 lib/kobject_uevent.c          |   3 +-
 security/keys/request_key.c   |   4 +-
 11 files changed, 253 insertions(+), 26 deletions(-)

-- =

2.9.3




--===============3912120253052134255==--

