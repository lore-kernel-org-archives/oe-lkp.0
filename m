Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD33803
	for <oe-lkp@lists.linux.dev>; Wed, 13 Sep 2023 03:00:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 609C8C433C8;
	Wed, 13 Sep 2023 03:00:02 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.96)
	(envelope-from <rostedt@goodmis.org>)
	id 1qgG73-000QOv-1f;
	Tue, 12 Sep 2023 23:00:21 -0400
Message-ID: <20230913025855.615399273@goodmis.org>
User-Agent: quilt/0.66
Date: Tue, 12 Sep 2023 22:58:55 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Ajay Kaher <akaher@vmware.com>,
 chinglinyu@google.com,
 lkp@intel.com,
 namit@vmware.com,
 oe-lkp@lists.linux.dev,
 amakhalov@vmware.com,
 er.ajay.kaher@gmail.com,
 srivatsa@csail.mit.edu,
 tkundu@vmware.com,
 vsirnapalli@vmware.com
Subject: [PATCH 0/3] tracing: Remove eventfs_files by use of callbacks
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>

The first patch adds a file to tracefs that shows all the event_files
that have been allocated for the dynamic eventfs file system. It also
shows the dentries that were created and their current ref counts. This
is useful for debugging and knowing when a dentry has been created and
freed.

I was suppose to add the first patch to this merge window. As it
is an aid for debugging, I may push it still in my next pull request.

The second patch is a bit of a redesign of the way the eventfs is
created. It no longer creates a descriptor representing every file but
instead just the directories. These descriptors get an array of
entries that represent the files within it (but not for sub directories).
Each entry has a name and a callback, where the name is the name of the
file (used for lookup) and a callback that is used to create the dentry
and inode for the file. This saves more memory, this approach may
be possible to create a dynamic way of doing this for other pseudo file
systems.

The third patch fixes the kprobe selftests yet again, and the function
that it uses to attach to was renamed once again.

Changes since v1: https://lore.kernel.org/all/20230801001349.520930329@goodmis.org/

 - Rebased on mainline and some minor clean ups.
 - Fixed kprobe selftest

Steven Rostedt (Google) (3):
      tracefs: Add show_events_dentries
      eventfs: Remove eventfs_file and just use eventfs_inode
      tracing/selftests: Update kprobe args char/string to match new functions

----
 fs/tracefs/Makefile                                |   1 +
 fs/tracefs/event_inode.c                           | 809 ++++++++++-----------
 fs/tracefs/event_show.c                            | 125 ++++
 fs/tracefs/inode.c                                 |   2 +-
 fs/tracefs/internal.h                              |  40 +-
 include/linux/trace_events.h                       |   2 +-
 include/linux/tracefs.h                            |  31 +-
 kernel/trace/trace.c                               |   7 +-
 kernel/trace/trace.h                               |   4 +-
 kernel/trace/trace_events.c                        | 314 +++++---
 .../ftrace/test.d/kprobe/kprobe_args_char.tc       |   4 +-
 .../ftrace/test.d/kprobe/kprobe_args_string.tc     |   4 +-
 12 files changed, 812 insertions(+), 531 deletions(-)
 create mode 100644 fs/tracefs/event_show.c
