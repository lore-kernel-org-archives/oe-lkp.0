Content-Type: multipart/mixed; boundary="===============3533481787527411856=="
MIME-Version: 1.0
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: lkp@lists.01.org
Subject: Re: [sched.h] 317419b91e: perf-sanity-tests.Parse_sched_tracepoints_fields.fail
Date: Tue, 19 Oct 2021 13:51:27 -0300
Message-ID: <YW73j66QbG9i0MV+@kernel.org>
In-Reply-To: <1529739526.13983.1634215325995.JavaMail.zimbra@efficios.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3533481787527411856==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Em Thu, Oct 14, 2021 at 08:42:05AM -0400, Mathieu Desnoyers escreveu:
> ----- On Oct 14, 2021, at 5:24 AM, Yafang Shao laoar.shao(a)gmail.com wro=
te:
> > On Thu, Oct 14, 2021 at 3:08 PM kernel test robot <oliver.sang@intel.=
com> wrote:
> > That issue is caused by another hardcode 16 ...

> > Seems we should make some change as below,

> > diff --git a/tools/perf/tests/evsel-tp-sched.c
> > b/tools/perf/tests/evsel-tp-sched.c
> > index f9e34bd26cf3..401a737b1d85 100644
> > --- a/tools/perf/tests/evsel-tp-sched.c
> > +++ b/tools/perf/tests/evsel-tp-sched.c
> > @@ -42,7 +42,7 @@ int test__perf_evsel__tp_sched_test(struct test
> > *test __maybe_unused, int subtes
> >                return -1;
> >        }

> > -       if (evsel__test_field(evsel, "prev_comm", 16, false))
> > +       if (evsel__test_field(evsel, "prev_comm", TASK_COMM_LEN, false))
> =

> tools/perf/tests/* contains userspace test programs. This means it gets t=
he
> TASK_COMM_LEN from the uapi. The fix you propose won't do any good here.

That specific test is just checking if the parsing is being done as
expected, i.e. we know beforehand that COMMs have 16 bytes, so the test
expects that.

Now that it can have a different size, then the test should accept the
two sizes as possible and pass if it is 16 or 24.

Like in this patch:

diff --git a/tools/perf/tests/evsel-tp-sched.c b/tools/perf/tests/evsel-tp-=
sched.c
index f9e34bd26cf33536..182328f3f7f70e0e 100644
--- a/tools/perf/tests/evsel-tp-sched.c
+++ b/tools/perf/tests/evsel-tp-sched.c
@@ -5,7 +5,7 @@
 #include "tests.h"
 #include "debug.h"
 =

-static int evsel__test_field(struct evsel *evsel, const char *name, int si=
ze, bool should_be_signed)
+static int evsel__test_field_alt(struct evsel *evsel, const char *name, in=
t size, int alternate_size, bool should_be_signed)
 {
 	struct tep_format_field *field =3D evsel__field(evsel, name);
 	int is_signed;
@@ -23,15 +23,23 @@ static int evsel__test_field(struct evsel *evsel, const=
 char *name, int size, bo
 		ret =3D -1;
 	}
 =

-	if (field->size !=3D size) {
-		pr_debug("%s: \"%s\" size (%d) should be %d!\n",
+	if (field->size !=3D size && field->size !=3D alternate_size) {
+		pr_debug("%s: \"%s\" size (%d) should be %d",
 			 evsel->name, name, field->size, size);
+		if (alternate_size > 0)
+			pr_debug(" or %d", alternate_size);
+		pr_debug("!\n");
 		ret =3D -1;
 	}
 =

 	return ret;
 }
 =

+static int evsel__test_field(struct evsel *evsel, const char *name, int si=
ze, bool should_be_signed)
+{
+	return evsel__test_field_alt(evsel, name, size, -1, should_be_signed);
+}
+
 int test__perf_evsel__tp_sched_test(struct test *test __maybe_unused, int =
subtest __maybe_unused)
 {
 	struct evsel *evsel =3D evsel__newtp("sched", "sched_switch");
@@ -42,7 +50,7 @@ int test__perf_evsel__tp_sched_test(struct test *test __m=
aybe_unused, int subtes
 		return -1;
 	}
 =

-	if (evsel__test_field(evsel, "prev_comm", 16, false))
+	if (evsel__test_field_alt(evsel, "prev_comm", 16, 24, false))
 		ret =3D -1;
 =

 	if (evsel__test_field(evsel, "prev_pid", 4, true))
@@ -54,7 +62,7 @@ int test__perf_evsel__tp_sched_test(struct test *test __m=
aybe_unused, int subtes
 	if (evsel__test_field(evsel, "prev_state", sizeof(long), true))
 		ret =3D -1;
 =

-	if (evsel__test_field(evsel, "next_comm", 16, false))
+	if (evsel__test_field_alt(evsel, "next_comm", 16, 24, false))
 		ret =3D -1;
 =

 	if (evsel__test_field(evsel, "next_pid", 4, true))
@@ -72,7 +80,7 @@ int test__perf_evsel__tp_sched_test(struct test *test __m=
aybe_unused, int subtes
 		return -1;
 	}
 =

-	if (evsel__test_field(evsel, "comm", 16, false))
+	if (evsel__test_field_alt(evsel, "comm", 16, 24, false))
 		ret =3D -1;
 =

 	if (evsel__test_field(evsel, "pid", 4, true))
--===============3533481787527411856==--

