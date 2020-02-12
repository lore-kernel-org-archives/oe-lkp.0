Content-Type: multipart/mixed; boundary="===============6718367601554003078=="
MIME-Version: 1.0
From: Tom Zanussi <zanussi@kernel.org>
To: lkp@lists.01.org
Subject: Re: [tracing] 9fe41efaca: BUG:unable_to_handle_page_fault_for_address
Date: Wed, 12 Feb 2020 09:59:04 -0600
Message-ID: <1581523144.8740.8.camel@kernel.org>
In-Reply-To: <20200212113444.GS12867@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============6718367601554003078==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, 2020-02-12 at 19:34 +0800, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 9fe41efaca08416657efa8731c0d47ccb6a3f3eb ("tracing: Add synth
> event generation test module")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git
> master
> =

> in testcase: rcuperf
> with following parameters:
> =

> 	runtime: 300s
> 	perf_type: rcu
> =

> =

> =

> on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2
> -m 8G
> =


I think the below patch should fix this, but I'm not able to build and
test on a 32-bit system at the moment - my system needs an update to be
able to run the qemu lkp-tests and my real 32-bit system is also having
problems of its own.  I'll verify that this actually works on the lkp-
tests once I get to the point of being able to test this on i386.

Thanks,

Tom


Subject: [PATCH] tracing: Remove bogus 64-bit synth_event_trace() vararg
 assumption

The vararg code in synth_event_trace() assumed the args were 64 bit
which is not the case on 32 bit systems.  Just use long which should
work on every system, and remove the u64 casts from the synth event
test module.

Reported-by: kernel test robot <rong.a.chen@intel.com>
Signed-off-by: Tom Zanussi <zanussi@kernel.org>
---
 kernel/trace/synth_event_gen_test.c | 4 ++--
 kernel/trace/trace_events_hist.c    | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/trace/synth_event_gen_test.c b/kernel/trace/synth_event=
_gen_test.c
index 4aefe003cb7c..2a7465569a43 100644
--- a/kernel/trace/synth_event_gen_test.c
+++ b/kernel/trace/synth_event_gen_test.c
@@ -424,11 +424,11 @@ static int __init test_trace_synth_event(void)
 	/* Trace some bogus values just for testing */
 	ret =3D synth_event_trace(create_synth_test, 7,	/* number of values */
 				444,			/* next_pid_field */
-				(u64)"clackers",	/* next_comm_field */
+				"clackers",		/* next_comm_field */
 				1000000,		/* ts_ns */
 				1000,			/* ts_ms */
 				smp_processor_id(),	/* cpu */
-				(u64)"Thneed",		/* my_string_field */
+				"Thneed",		/* my_string_field */
 				999);			/* my_int_field */
 	return ret;
 }
diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_h=
ist.c
index 2fcb755e900a..e65276c3c9d1 100644
--- a/kernel/trace/trace_events_hist.c
+++ b/kernel/trace/trace_events_hist.c
@@ -1883,12 +1883,12 @@ int synth_event_trace(struct trace_event_file *file=
, unsigned int n_vals, ...)
 =

 	va_start(args, n_vals);
 	for (i =3D 0, n_u64 =3D 0; i < state.event->n_fields; i++) {
-		u64 val;
+		long val;
 =

-		val =3D va_arg(args, u64);
+		val =3D va_arg(args, long);
 =

 		if (state.event->fields[i]->is_string) {
-			char *str_val =3D (char *)(long)val;
+			char *str_val =3D (char *)val;
 			char *str_field =3D (char *)&state.entry->fields[n_u64];
 =

 			strscpy(str_field, str_val, STR_VAR_LEN_MAX);
-- =

2.14.1

--===============6718367601554003078==--

