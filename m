Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2AD81E
	for <oe-lkp@lists.linux.dev>; Wed, 13 Sep 2023 03:00:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6331C433C9;
	Wed, 13 Sep 2023 03:00:02 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.96)
	(envelope-from <rostedt@goodmis.org>)
	id 1qgG74-000QQc-0U;
	Tue, 12 Sep 2023 23:00:22 -0400
Message-ID: <20230913030021.967983629@goodmis.org>
User-Agent: quilt/0.66
Date: Tue, 12 Sep 2023 22:58:58 -0400
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
Subject: [PATCH 3/3] tracing/selftests: Update kprobe args char/string to match new
 functions
References: <20230913025855.615399273@goodmis.org>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: "Steven Rostedt (Google)" <rostedt@goodmis.org>

The function that the kprobe_args_char and kprobes_arg_string attaches to
for its test has changed its name once again. Now we need to check for
eventfs_create_dir(), and if it exists, use that, otherwise check for
eventfs_add_dir() and if that exists use that, otherwise use the original
tracefs_create_dir()!

Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 .../selftests/ftrace/test.d/kprobe/kprobe_args_char.tc        | 4 +++-
 .../selftests/ftrace/test.d/kprobe/kprobe_args_string.tc      | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_char.tc b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_char.tc
index ff7499eb98d6..c639c6c8ca03 100644
--- a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_char.tc
+++ b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_char.tc
@@ -34,7 +34,9 @@ mips*)
 esac
 
 : "Test get argument (1)"
-if grep -q eventfs_add_dir available_filter_functions; then
+if grep -q eventfs_create_dir available_filter_functions; then
+  DIR_NAME="eventfs_create_dir"
+elif grep -q eventfs_add_dir available_filter_functions; then
   DIR_NAME="eventfs_add_dir"
 else
   DIR_NAME="tracefs_create_dir"
diff --git a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_string.tc b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_string.tc
index a202b2ea4baf..a5ab4d5c74ac 100644
--- a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_string.tc
+++ b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_string.tc
@@ -37,7 +37,9 @@ loongarch*)
 esac
 
 : "Test get argument (1)"
-if grep -q eventfs_add_dir available_filter_functions; then
+if grep -q eventfs_create_dir available_filter_functions; then
+  DIR_NAME="eventfs_create_dir"
+elif grep -q eventfs_add_dir available_filter_functions; then
   DIR_NAME="eventfs_add_dir"
 else
   DIR_NAME="tracefs_create_dir"
-- 
2.40.1
