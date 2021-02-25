Content-Type: multipart/mixed; boundary="===============7766093501410750492=="
MIME-Version: 1.0
From: Jiri Olsa <jolsa@redhat.com>
To: lkp@lists.01.org
Subject: Re: [drm/i915/gt] 8c3b1ba0e7: perf-sanity-tests.Parse_event_definition_strings.fail
Date: Thu, 25 Feb 2021 14:33:57 +0100
Message-ID: <YDenRVGzh5Dv1pC2@krava>
In-Reply-To: <cabd8692-07ca-13c8-efb5-e088b4547f80@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7766093501410750492==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 25, 2021 at 04:06:23PM +0800, Jin, Yao wrote:
> Hi Chris, Arnaldo, Jiri,
> =

> We observe the parsing error for "software/xxx/" on some platforms.
> =

> For example,
> =

> # perf stat -e software/r1a/ -a -- sleep 1
> event syntax error: 'software/r1a/'
>                      \___ parser error
> Run 'perf list' for a list of valid events
> =

>  Usage: perf stat [<options>] [<command>]
> =

>     -e, --event <event>   event selector. use 'perf list' to list availab=
le events
> =

> And perf test is failed too.
> =

> # perf test 6 -vv
> ...
> running test 4 'software/r1a/'failed to parse event 'software/r1a/', err =
1, str 'parser error'
> event syntax error: 'software/r1a/'
>                      \___ parser error
> =

> running test 4 'software/r0x1a/'failed to parse event 'software/r0x1a/', =
err 1, str 'parser error'
> event syntax error: 'software/r0x1a/'
>                      \___ parser error
> ...
> =

> The issue should be the conflict between event "i915/software-gt-awake-ti=
me/" and pmu "software".
> =

> # perf list | grep i915/software
>   i915/software-gt-awake-time/                       [Kernel PMU event]
> =

> Perf supports the event format as "prefix-xxx-suffix", so the "software"
> string in "software-gt-awake-time" is added to perf_pmu_events_list as
> PMU_EVENT_SYMBOL_PREFIX. When parsing the string such as "software/xxx/",
> it=E2=80=99s parsed as PMU_EVENT_SYMBOL_PREFIX for "software", then it wo=
uld error
> out in next processing.
> =

> So the easy way is to rename "software-gt-awake-time" to "gt-awake-time",
> right? Otherwise we have to hardcode something in perf tool.
> =

> What do you think of this issue and the solution?
> =

> BTW, as the robot reported, it's related to the commit 8c3b1ba0e7ea
> ("drm/i915/gt: Track the overall awake/busy time").

yes, I think you're right.. I'll try to reproduce and check on this

I'm still not clear why is that parsing fail if those 2 events are
distinguished by - and / ... but yep, we are asking for trouble in
here ;-)

I think we could either prioritaze one or add extra check when we
add prefix-xxx-suffix events and do not add ones that have conflict..
that seems like best solution to me now

thanks,
jirka

--===============7766093501410750492==--

