Content-Type: multipart/mixed; boundary="===============2286698379898822568=="
MIME-Version: 1.0
From: Jiri Olsa <jolsa@redhat.com>
To: lkp@lists.01.org
Subject: Re: [drm/i915/gt] 8c3b1ba0e7: perf-sanity-tests.Parse_event_definition_strings.fail
Date: Thu, 25 Feb 2021 19:16:39 +0100
Message-ID: <YDfph8b9p8sSk1AF@krava>
In-Reply-To: <YDenRVGzh5Dv1pC2@krava>
List-Id: <oe-lkp.lists.linux.dev>

--===============2286698379898822568==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 25, 2021 at 02:33:57PM +0100, Jiri Olsa wrote:
> On Thu, Feb 25, 2021 at 04:06:23PM +0800, Jin, Yao wrote:
> > Hi Chris, Arnaldo, Jiri,
> > =

> > We observe the parsing error for "software/xxx/" on some platforms.
> > =

> > For example,
> > =

> > # perf stat -e software/r1a/ -a -- sleep 1
> > event syntax error: 'software/r1a/'
> >                      \___ parser error
> > Run 'perf list' for a list of valid events
> > =

> >  Usage: perf stat [<options>] [<command>]
> > =

> >     -e, --event <event>   event selector. use 'perf list' to list avail=
able events
> > =

> > And perf test is failed too.
> > =

> > # perf test 6 -vv
> > ...
> > running test 4 'software/r1a/'failed to parse event 'software/r1a/', er=
r 1, str 'parser error'
> > event syntax error: 'software/r1a/'
> >                      \___ parser error
> > =

> > running test 4 'software/r0x1a/'failed to parse event 'software/r0x1a/'=
, err 1, str 'parser error'
> > event syntax error: 'software/r0x1a/'
> >                      \___ parser error
> > ...
> > =

> > The issue should be the conflict between event "i915/software-gt-awake-=
time/" and pmu "software".
> > =

> > # perf list | grep i915/software
> >   i915/software-gt-awake-time/                       [Kernel PMU event]
> > =

> > Perf supports the event format as "prefix-xxx-suffix", so the "software"
> > string in "software-gt-awake-time" is added to perf_pmu_events_list as
> > PMU_EVENT_SYMBOL_PREFIX. When parsing the string such as "software/xxx/=
",
> > it=E2=80=99s parsed as PMU_EVENT_SYMBOL_PREFIX for "software", then it =
would error
> > out in next processing.
> > =

> > So the easy way is to rename "software-gt-awake-time" to "gt-awake-time=
",
> > right? Otherwise we have to hardcode something in perf tool.
> > =

> > What do you think of this issue and the solution?
> > =

> > BTW, as the robot reported, it's related to the commit 8c3b1ba0e7ea
> > ("drm/i915/gt: Track the overall awake/busy time").
> =

> yes, I think you're right.. I'll try to reproduce and check on this
> =

> I'm still not clear why is that parsing fail if those 2 events are
> distinguished by - and / ... but yep, we are asking for trouble in
> here ;-)
> =

> I think we could either prioritaze one or add extra check when we
> add prefix-xxx-suffix events and do not add ones that have conflict..
> that seems like best solution to me now

would patch below work for you?

jirka


---
diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
index 42c84adeb2fb..e1d0f1028401 100644
--- a/tools/perf/util/parse-events.c
+++ b/tools/perf/util/parse-events.c
@@ -2041,8 +2041,16 @@ static void perf_pmu__parse_init(void)
 			char *tmp =3D strchr(alias->name, '-');
 =

 			if (tmp !=3D NULL) {
-				SET_SYMBOL(strndup(alias->name, tmp - alias->name),
-						PMU_EVENT_SYMBOL_PREFIX);
+				char *prefix =3D strndup(alias->name, tmp - alias->name);
+
+				if (perf_pmu__find(prefix)) {
+					pr_debug("perf_pmu__parse_init: skipping conflicting alias '%s'\n",
+						 alias->name);
+					free(prefix);
+					continue;
+				}
+
+				SET_SYMBOL(prefix, PMU_EVENT_SYMBOL_PREFIX);
 				p++;
 				SET_SYMBOL(strdup(++tmp), PMU_EVENT_SYMBOL_SUFFIX);
 				len +=3D 2;

--===============2286698379898822568==--

