Content-Type: multipart/mixed; boundary="===============1699164606084840555=="
MIME-Version: 1.0
From: Jiri Olsa <jolsa@redhat.com>
To: lkp@lists.01.org
Subject: Re: [drm/i915/gt] 8c3b1ba0e7: perf-sanity-tests.Parse_event_definition_strings.fail
Date: Thu, 25 Feb 2021 19:50:41 +0100
Message-ID: <YDfxgfi5DBDMFgwu@krava>
In-Reply-To: <YDfph8b9p8sSk1AF@krava>
List-Id: <oe-lkp.lists.linux.dev>

--===============1699164606084840555==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 25, 2021 at 07:16:44PM +0100, Jiri Olsa wrote:
> On Thu, Feb 25, 2021 at 02:33:57PM +0100, Jiri Olsa wrote:
> > On Thu, Feb 25, 2021 at 04:06:23PM +0800, Jin, Yao wrote:
> > > Hi Chris, Arnaldo, Jiri,
> > > =

> > > We observe the parsing error for "software/xxx/" on some platforms.
> > > =

> > > For example,
> > > =

> > > # perf stat -e software/r1a/ -a -- sleep 1
> > > event syntax error: 'software/r1a/'
> > >                      \___ parser error
> > > Run 'perf list' for a list of valid events
> > > =

> > >  Usage: perf stat [<options>] [<command>]
> > > =

> > >     -e, --event <event>   event selector. use 'perf list' to list ava=
ilable events
> > > =

> > > And perf test is failed too.
> > > =

> > > # perf test 6 -vv
> > > ...
> > > running test 4 'software/r1a/'failed to parse event 'software/r1a/', =
err 1, str 'parser error'
> > > event syntax error: 'software/r1a/'
> > >                      \___ parser error
> > > =

> > > running test 4 'software/r0x1a/'failed to parse event 'software/r0x1a=
/', err 1, str 'parser error'
> > > event syntax error: 'software/r0x1a/'
> > >                      \___ parser error
> > > ...
> > > =

> > > The issue should be the conflict between event "i915/software-gt-awak=
e-time/" and pmu "software".
> > > =

> > > # perf list | grep i915/software
> > >   i915/software-gt-awake-time/                       [Kernel PMU even=
t]
> > > =

> > > Perf supports the event format as "prefix-xxx-suffix", so the "softwa=
re"
> > > string in "software-gt-awake-time" is added to perf_pmu_events_list as
> > > PMU_EVENT_SYMBOL_PREFIX. When parsing the string such as "software/xx=
x/",
> > > it=E2=80=99s parsed as PMU_EVENT_SYMBOL_PREFIX for "software", then i=
t would error
> > > out in next processing.
> > > =

> > > So the easy way is to rename "software-gt-awake-time" to "gt-awake-ti=
me",
> > > right? Otherwise we have to hardcode something in perf tool.
> > > =

> > > What do you think of this issue and the solution?
> > > =

> > > BTW, as the robot reported, it's related to the commit 8c3b1ba0e7ea
> > > ("drm/i915/gt: Track the overall awake/busy time").
> > =

> > yes, I think you're right.. I'll try to reproduce and check on this
> > =

> > I'm still not clear why is that parsing fail if those 2 events are
> > distinguished by - and / ... but yep, we are asking for trouble in
> > here ;-)
> > =

> > I think we could either prioritaze one or add extra check when we
> > add prefix-xxx-suffix events and do not add ones that have conflict..
> > that seems like best solution to me now
> =

> would patch below work for you?
> =

> jirka

and now with more fixes after I ran tests ;-)

we should perhaps add also same check for non '-' aliases, I'll check

jirka


---
diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
index 42c84adeb2fb..0b5d355ad4f6 100644
--- a/tools/perf/util/parse-events.c
+++ b/tools/perf/util/parse-events.c
@@ -2028,10 +2028,9 @@ static void perf_pmu__parse_init(void)
 		perf_pmu_events_list_num =3D -1;
 		return;
 	}
-	perf_pmu_events_list =3D malloc(sizeof(struct perf_pmu_event_symbol) * le=
n);
+	perf_pmu_events_list =3D zalloc(sizeof(struct perf_pmu_event_symbol) * le=
n);
 	if (!perf_pmu_events_list)
 		return;
-	perf_pmu_events_list_num =3D len;
 =

 	len =3D 0;
 	pmu =3D NULL;
@@ -2041,8 +2040,16 @@ static void perf_pmu__parse_init(void)
 			char *tmp =3D strchr(alias->name, '-');
 =

 			if (tmp !=3D NULL) {
-				SET_SYMBOL(strndup(alias->name, tmp - alias->name),
-						PMU_EVENT_SYMBOL_PREFIX);
+				char *prefix =3D strndup(alias->name, tmp - alias->name);
+
+				if (perf_pmu__find(prefix)) {
+					pr_debug2("perf_pmu__parse_init: skipping conflicting alias '%s'\n",
+						  alias->name);
+					free(prefix);
+					continue;
+				}
+
+				SET_SYMBOL(prefix, PMU_EVENT_SYMBOL_PREFIX);
 				p++;
 				SET_SYMBOL(strdup(++tmp), PMU_EVENT_SYMBOL_SUFFIX);
 				len +=3D 2;
@@ -2052,6 +2059,12 @@ static void perf_pmu__parse_init(void)
 			}
 		}
 	}
+
+	/* unlikely, but still.. */
+	if (!len)
+		goto err;
+	perf_pmu_events_list_num =3D len;
+
 	qsort(perf_pmu_events_list, len,
 		sizeof(struct perf_pmu_event_symbol), comp_pmu);
=20

--===============1699164606084840555==--

