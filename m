Content-Type: multipart/mixed; boundary="===============5846562178988828581=="
MIME-Version: 1.0
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: lkp@lists.01.org
Subject: [PATCH v2 2/4] fsnotify: stop walking child dentries if remaining tail is negative
Date: Mon, 31 Jan 2022 13:19:41 -0800
Message-ID: <20220131211943.34788-3-stephen.s.brennan@oracle.com>
In-Reply-To: <20220131211943.34788-1-stephen.s.brennan@oracle.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5846562178988828581==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>

When notification starts/stops listening events from inode's children it
has to update dentry->d_flags of all positive child dentries. Scanning
may take a long time if the directory has a lot of negative child
dentries. Use the new tail negative flag to detect when the remainder of
the children are negative, and skip them. This speeds up
fsnotify/inotify watch creation, and in some extreme cases can avoid a
soft lockup, for example, with 200 million negative dentries in a single
directory:

 watchdog: BUG: soft lockup - CPU#20 stuck for 9s! [inotifywait:9528]
 CPU: 20 PID: 9528 Comm: inotifywait Kdump: loaded Not tainted 5.16.0-rc4.2=
0211208.el8uek.rc1.x86_64 #1
 Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.4.1 12/03/20=
20
 RIP: 0010:__fsnotify_update_child_dentry_flags+0xad/0x120
 Call Trace:
  <TASK>
  fsnotify_add_mark_locked+0x113/0x160
  inotify_new_watch+0x130/0x190
  inotify_update_watch+0x11a/0x140
  __x64_sys_inotify_add_watch+0xef/0x140
  do_syscall_64+0x3b/0x90
  entry_SYSCALL_64_after_hwframe+0x44/0xae

Co-authored-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
Co-authored-by: Gautham Ananthakrishna <gautham.ananthakrishna@oracle.com>
Signed-off-by: Stephen Brennan <stephen.s.brennan@oracle.com>
---
 fs/notify/fsnotify.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/notify/fsnotify.c b/fs/notify/fsnotify.c
index ab81a0776ece..1f314f85f4c1 100644
--- a/fs/notify/fsnotify.c
+++ b/fs/notify/fsnotify.c
@@ -127,8 +127,12 @@ void __fsnotify_update_child_dentry_flags(struct inode=
 *inode)
 		 * original inode) */
 		spin_lock(&alias->d_lock);
 		list_for_each_entry(child, &alias->d_subdirs, d_child) {
-			if (!child->d_inode)
+			if (!child->d_inode) {
+				/* all remaining children are negative */
+				if (d_is_tail_negative(child))
+					break;
 				continue;
+			}
 =

 			spin_lock_nested(&child->d_lock, DENTRY_D_LOCK_NESTED);
 			if (watched)
-- =

2.30.2

--===============5846562178988828581==--

