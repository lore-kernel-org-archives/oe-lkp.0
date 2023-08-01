Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97E5620
	for <oe-lkp@lists.linux.dev>; Tue,  1 Aug 2023 00:14:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60F48C433C8;
	Tue,  1 Aug 2023 00:14:38 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.96)
	(envelope-from <rostedt@goodmis.org>)
	id 1qQd24-003g8f-2n;
	Mon, 31 Jul 2023 20:14:36 -0400
Message-ID: <20230801001349.520930329@goodmis.org>
User-Agent: quilt/0.66
Date: Mon, 31 Jul 2023 20:13:49 -0400
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
Subject: [PATCH 0/2] tracing: Remove eventfs_files by use of callbacks
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>


This patch set is on top of:

https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git/
  trace/core

The first patch adds a file to tracefs that shows all the event_files
that have been allocated for the dynamic eventfs file system. It also
shows the dentries that were created and their current ref counts. This
is useful for debugging and knowing when a dentry has been created and
freed.

I plan on adding the first patch to the next merge window. The second
patch I plan on adding to the merge window after that.

The second patch is a bit of a redesign of the way the eventfs is
created. It no longer creates a descriptor representing every file but
instead just the directories. These descriptors get an array of
entries that represent the files within it (but not for sub directories).
Each entry has a name and a callback, where the name is the name of the
file (used for lookup) and a callback that is used to create the dentry
and inode for the file. This saves more memory, this approach may
be possible to create a dynamic way of doing this for other pseudo file
systems.

Steven Rostedt (Google) (2):
      tracefs: Add show_events_dentries
      eventfs: Remove eventfs_file and just use eventfs_inode

----
 fs/tracefs/Makefile          |   1 +
 fs/tracefs/event_inode.c     | 781 ++++++++++++++++++++++---------------------
 fs/tracefs/event_show.c      | 125 +++++++
 fs/tracefs/inode.c           |   2 +-
 fs/tracefs/internal.h        |  34 +-
 include/linux/trace_events.h |   2 +-
 include/linux/tracefs.h      |  31 +-
 kernel/trace/trace.h         |   4 +-
 kernel/trace/trace_events.c  | 309 ++++++++++++-----
 9 files changed, 795 insertions(+), 494 deletions(-)
 create mode 100644 fs/tracefs/event_show.c
