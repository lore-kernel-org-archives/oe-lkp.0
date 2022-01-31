Content-Type: multipart/mixed; boundary="===============4087432580754333392=="
MIME-Version: 1.0
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: lkp@lists.01.org
Subject: [PATCH v2 0/4] Fix softlockup when adding inotify watch
Date: Mon, 31 Jan 2022 13:19:39 -0800
Message-ID: <20220131211943.34788-1-stephen.s.brennan@oracle.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4087432580754333392==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I'd like to request re-testing this series on LKP, before posting my v2
more broadly. The 0-day bot detected a warning on my v1 posting[1]. I
believe v2 should address the warning but I'm still working on
reproducing it via the information included in the email. According to
the LKP website [2] it's possible to request testing by directly mailing
this list, so I wanted to try that in case I can't reproduce the
original.

[1]: https://lore.kernel.org/linux-fsdevel/20211218081736.GA1071(a)xsang-Op=
tiPlex-9020/
[2]: https://01.org/lkp/documentation/0-day-test-service

Thanks,
Stephen

(series summary below)

When a system with large amounts of memory has several millions of
negative dentries in a single directory, a softlockup can occur while
adding an inotify watch:

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

v1 of this series can be found at:
https://lore.kernel.org/linux-fsdevel/20211214005337.161885-1-stephen.s.bre=
nnan(a)oracle.com/
v1 itself is based on a prior series:
https://lore.kernel.org/linux-fsdevel/1611235185-1685-1-git-send-email-gaut=
ham.ananthakrishna(a)oracle.com/

The strategy employed by this series is to move negative dentries to the
end of the d_subdirs list, and mark them with a flag as "tail negative".
Then, readers of the d_subdirs list, which are only interested in
positive dentries, can stop reading once they reach the first tail
negative dentry. By applying this patch, I'm able to avoid the above
softlockup caused by 200 million negative dentries on my test system.
Inotify watches are set up nearly instantly.

Previously, Al expressed concern for:

1. Possible memory corruption due to use of lock_parent() in
sweep_negative(), see patch 01 for fix.
2. The previous patch didn't catch all ways a negative dentry could
become positive (d_add, d_instantiate_new), see patch 01.
3. The previous series contained a new negative dentry limit, which
capped the negative dentry count at around 3 per hash bucket. I've
dropped this patch from the series.

Patches 2-4 are unmodified from the previous posting.

Konstantin Khlebnikov (3):
  fsnotify: stop walking child dentries if remaining tail is negative
  dcache: add action D_WALK_SKIP_SIBLINGS to d_walk()
  dcache: stop walking siblings if remaining dentries all negative

Stephen Brennan (1):
  dcache: sweep cached negative dentries to the end of list of siblings

 fs/dcache.c            | 96 ++++++++++++++++++++++++++++++++++++++++--
 fs/libfs.c             |  3 ++
 fs/notify/fsnotify.c   |  6 ++-
 include/linux/dcache.h |  6 +++
 4 files changed, 106 insertions(+), 5 deletions(-)

-- =

2.30.2

--===============4087432580754333392==--

