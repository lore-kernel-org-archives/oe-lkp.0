Content-Type: multipart/mixed; boundary="===============3089840652555447130=="
MIME-Version: 1.0
From: Steven Rostedt <rostedt@goodmis.org>
To: lkp@lists.01.org
Subject: Re: [tracing] 06e0a548ba: WARNING:at_kernel/trace/ring_buffer.c:#ring_buffer_iter_peek
Date: Wed, 13 May 2020 15:30:33 -0400
Message-ID: <20200513153033.3be208ec@gandalf.local.home>
In-Reply-To: <20200513161557.GA73453@tuxmaker.boeblingen.de.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3089840652555447130==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 13 May 2020 18:15:57 +0200
Sven Schnelle <svens@linux.ibm.com> wrote:

> Thanks for looking into this. I've attached my /proc/config.gz to this Ma=
il.
> The x86 system is my Laptop which is a Thinkpad X280 with 4 HT CPUs (so 8=
 cpus
> in total). I've tried disabling preemption, but this didn't help.
> =

> It's always this check that causes the loop:
> =

> if (iter->head >=3D rb_page_size(iter->head_page)) {
> 	rb_inc_iter(iter);
> 	goto again;
> }
> =

> On the first loop iter->head is some value > 0 and rb_page_size returns
> 0, afterwards it gets twice to this check with both values 0. The third
> time the warning is triggered. Maybe that information helps.

I figured out what was causing this, and that's just that the writer and
the iterator could end up almost "in sync" where the writer writes to each
of the pages the iterator is trying to read, and this can trigger the three
failures of "zero commits" per page.

I had a way to detect this, but then realized that it may be possible for
an active writer to possibly trigger the other failures to get an event,
that I just decided to force it to try three times, and simply return NULL
if an active writer is messing with the iterator. The iterator is a "best
effort" to read the buffer if there's an active writer. The consumer read
(trace_pipe) is made for that.

This patch should solve you issues.

(care to give a Tested-by: if it works for you?)

-- Steve

>From 29b36cd00ddcae278430e70e55dd64855e9a54b3 Mon Sep 17 00:00:00 2001
From: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
Date: Wed, 13 May 2020 15:18:01 -0400
Subject: [PATCH] ring-buffer: Don't deactivate the ring buffer on failed
 iterator reads

If the function tracer is running and the trace file is read (which uses the
ring buffer iterator), the iterator can get in sync with the writes, and
caues it to fail to find a page with content it can read three times. This
causes a warning and deactivation of the ring buffer code.

Looking at the other cases of failure to get an event, it appears that
there's a chance that the writer could cause them too. Since the iterator is
a "best effort" to read the ring buffer if there's an active writer (the
consumer reader is made for this case "see trace_pipe"), if it fails to get
an event after three tries, simply give up and return NULL. Don't warn, nor
disable the ring buffer on this failure.

Link: https://lore.kernel.org/r/20200429090508.GG5770(a)shao2-debian

Reported-by: kernel test robot <lkp@intel.com>
Fixes: ff84c50cfb4b ("ring-buffer: Do not die if rb_iter_peek() fails more =
than thrice")
Signed-off-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
---
 kernel/trace/ring_buffer.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 6f0b42ceeb00..448d5f528764 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -4034,7 +4034,6 @@ rb_iter_peek(struct ring_buffer_iter *iter, u64 *ts)
 	struct ring_buffer_per_cpu *cpu_buffer;
 	struct ring_buffer_event *event;
 	int nr_loops =3D 0;
-	bool failed =3D false;
 =

 	if (ts)
 		*ts =3D 0;
@@ -4056,19 +4055,14 @@ rb_iter_peek(struct ring_buffer_iter *iter, u64 *ts)
 		return NULL;
 =

 	/*
-	 * We repeat when a time extend is encountered or we hit
-	 * the end of the page. Since the time extend is always attached
-	 * to a data event, we should never loop more than three times.
-	 * Once for going to next page, once on time extend, and
-	 * finally once to get the event.
-	 * We should never hit the following condition more than thrice,
-	 * unless the buffer is very small, and there's a writer
-	 * that is causing the reader to fail getting an event.
+	 * As the writer can mess with what the iterator is trying
+	 * to read, just give up if we fail to get an event after
+	 * three tries. The iterator is not as reliable when reading
+	 * the ring buffer with an active write as the consumer is.
+	 * Do not warn if the three failures is reached.
 	 */
-	if (++nr_loops > 3) {
-		RB_WARN_ON(cpu_buffer, !failed);
+	if (++nr_loops > 3)
 		return NULL;
-	}
 =

 	if (rb_per_cpu_empty(cpu_buffer))
 		return NULL;
@@ -4079,10 +4073,8 @@ rb_iter_peek(struct ring_buffer_iter *iter, u64 *ts)
 	}
 =

 	event =3D rb_iter_head_event(iter);
-	if (!event) {
-		failed =3D true;
+	if (!event)
 		goto again;
-	}
 =

 	switch (event->type_len) {
 	case RINGBUF_TYPE_PADDING:
-- =

2.20.1


--===============3089840652555447130==--

