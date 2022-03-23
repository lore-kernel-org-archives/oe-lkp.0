Content-Type: multipart/mixed; boundary="===============3675027481950984195=="
MIME-Version: 1.0
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: lkp@lists.01.org
Subject: [PATCH] tracing: Avoid adding duplicated tracer options when update_tracer_options is running in parallel
Date: Wed, 23 Mar 2022 11:24:42 +0800
Message-ID: <20220323032442.22082-1-mark-pk.tsai@mediatek.com>
In-Reply-To: <20220322133339.GA32582@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============3675027481950984195==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

When update_tracer_options is running in parallel,
tr->tops might be updated before the trace_types list traversal.
Let update_tracer_options traverse the trace_types list safely in
kernel init time and avoid the tr->tops update before it finish.

Link: https://lore.kernel.org/lkml/20220322133339.GA32582(a)xsang-OptiPlex-=
9020/
Reported-by: kernel test robot <oliver.sang@intel.com>
Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
---
 kernel/trace/trace.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index adb37e437a05..2974ae056068 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -6317,12 +6317,18 @@ static void tracing_set_nop(struct trace_array *tr)
 	tr->current_trace =3D &nop_trace;
 }
 =

+static bool tracer_options_updated;
+
 static void add_tracer_options(struct trace_array *tr, struct tracer *t)
 {
 	/* Only enable if the directory has been created already. */
 	if (!tr->dir)
 		return;
 =

+	/* Only create trace option files after update_tracer_options finish */
+	if (!tracer_options_updated)
+		return;
+
 	create_trace_option_files(tr, t);
 }
 =

@@ -9133,6 +9139,7 @@ static void update_tracer_options(struct trace_array =
*tr)
 {
 	mutex_lock(&trace_types_lock);
 	__update_tracer_options(tr);
+	tracer_options_updated =3D true;
 	mutex_unlock(&trace_types_lock);
 }
 =

-- =

2.18.0

--===============3675027481950984195==--

