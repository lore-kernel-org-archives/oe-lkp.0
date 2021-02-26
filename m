Content-Type: multipart/mixed; boundary="===============9112985487007076790=="
MIME-Version: 1.0
From: Jin, Yao <yao.jin@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [drm/i915/gt] 8c3b1ba0e7: perf-sanity-tests.Parse_event_definition_strings.fail
Date: Fri, 26 Feb 2021 08:41:26 +0800
Message-ID: <d416a908-6a54-5e4c-e377-dc9d2b778941@linux.intel.com>
In-Reply-To: <YDf0fP8XmnTrkIT8@krava>
List-Id: <oe-lkp.lists.linux.dev>

--===============9112985487007076790==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Jiri,

On 2/26/2021 3:03 AM, Jiri Olsa wrote:
> On Thu, Feb 25, 2021 at 07:50:46PM +0100, Jiri Olsa wrote:
>> On Thu, Feb 25, 2021 at 07:16:44PM +0100, Jiri Olsa wrote:
>>> On Thu, Feb 25, 2021 at 02:33:57PM +0100, Jiri Olsa wrote:
>>>> On Thu, Feb 25, 2021 at 04:06:23PM +0800, Jin, Yao wrote:
>>>>> Hi Chris, Arnaldo, Jiri,
>>>>>
>>>>> We observe the parsing error for "software/xxx/" on some platforms.
>>>>>
>>>>> For example,
>>>>>
>>>>> # perf stat -e software/r1a/ -a -- sleep 1
>>>>> event syntax error: 'software/r1a/'
>>>>>                       \___ parser error
>>>>> Run 'perf list' for a list of valid events
>>>>>
>>>>>   Usage: perf stat [<options>] [<command>]
>>>>>
>>>>>      -e, --event <event>   event selector. use 'perf list' to list av=
ailable events
>>>>>
>>>>> And perf test is failed too.
>>>>>
>>>>> # perf test 6 -vv
>>>>> ...
>>>>> running test 4 'software/r1a/'failed to parse event 'software/r1a/', =
err 1, str 'parser error'
>>>>> event syntax error: 'software/r1a/'
>>>>>                       \___ parser error
>>>>>
>>>>> running test 4 'software/r0x1a/'failed to parse event 'software/r0x1a=
/', err 1, str 'parser error'
>>>>> event syntax error: 'software/r0x1a/'
>>>>>                       \___ parser error
>>>>> ...
>>>>>
>>>>> The issue should be the conflict between event "i915/software-gt-awak=
e-time/" and pmu "software".
>>>>>
>>>>> # perf list | grep i915/software
>>>>>    i915/software-gt-awake-time/                       [Kernel PMU eve=
nt]
>>>>>
>>>>> Perf supports the event format as "prefix-xxx-suffix", so the "softwa=
re"
>>>>> string in "software-gt-awake-time" is added to perf_pmu_events_list as
>>>>> PMU_EVENT_SYMBOL_PREFIX. When parsing the string such as "software/xx=
x/",
>>>>> it=E2=80=99s parsed as PMU_EVENT_SYMBOL_PREFIX for "software", then i=
t would error
>>>>> out in next processing.
>>>>>
>>>>> So the easy way is to rename "software-gt-awake-time" to "gt-awake-ti=
me",
>>>>> right? Otherwise we have to hardcode something in perf tool.
>>>>>
>>>>> What do you think of this issue and the solution?
>>>>>
>>>>> BTW, as the robot reported, it's related to the commit 8c3b1ba0e7ea
>>>>> ("drm/i915/gt: Track the overall awake/busy time").
>>>>
>>>> yes, I think you're right.. I'll try to reproduce and check on this
>>>>
>>>> I'm still not clear why is that parsing fail if those 2 events are
>>>> distinguished by - and / ... but yep, we are asking for trouble in
>>>> here ;-)
>>>>
>>>> I think we could either prioritaze one or add extra check when we
>>>> add prefix-xxx-suffix events and do not add ones that have conflict..
>>>> that seems like best solution to me now
>>>
>>> would patch below work for you?
>>>
>>> jirka
>>
>> and now with more fixes after I ran tests ;-)
>>
>> we should perhaps add also same check for non '-' aliases, I'll check
> =

> and one more version ;-)
> =

> jirka
> =

> =

> ---
> diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-event=
s.c
> index 42c84adeb2fb..d9e795056d15 100644
> --- a/tools/perf/util/parse-events.c
> +++ b/tools/perf/util/parse-events.c
> @@ -2028,30 +2028,49 @@ static void perf_pmu__parse_init(void)
>   		perf_pmu_events_list_num =3D -1;
>   		return;
>   	}
> -	perf_pmu_events_list =3D malloc(sizeof(struct perf_pmu_event_symbol) * =
len);
> +	perf_pmu_events_list =3D zalloc(sizeof(struct perf_pmu_event_symbol) * =
len);
>   	if (!perf_pmu_events_list)
>   		return;
> -	perf_pmu_events_list_num =3D len;
>   =

>   	len =3D 0;
>   	pmu =3D NULL;
>   	while ((pmu =3D perf_pmu__scan(pmu)) !=3D NULL) {
>   		list_for_each_entry(alias, &pmu->aliases, list) {
>   			struct perf_pmu_event_symbol *p =3D perf_pmu_events_list + len;
> -			char *tmp =3D strchr(alias->name, '-');
> +			char *prefix =3D strdup(alias->name);
> +			char *tmp =3D strchr(prefix, '-');
> +
> +			if (tmp !=3D NULL)
> +				*tmp =3D 0;
> +
> +			/*
> +			 * Skip any prefix that conflicts with pmu name,
> +			 * otherwise the event parser gets confused.
> +			 */
> +			if (perf_pmu__find(prefix)) {
> +				pr_debug2("perf_pmu__parse_init: skipping conflicting alias '%s'\n",
> +					  alias->name);
> +				free(prefix);
> +				continue;
> +			}
>   =

>   			if (tmp !=3D NULL) {
> -				SET_SYMBOL(strndup(alias->name, tmp - alias->name),
> -						PMU_EVENT_SYMBOL_PREFIX);
> +				SET_SYMBOL(prefix, PMU_EVENT_SYMBOL_PREFIX);
>   				p++;
>   				SET_SYMBOL(strdup(++tmp), PMU_EVENT_SYMBOL_SUFFIX);
>   				len +=3D 2;
>   			} else {
> -				SET_SYMBOL(strdup(alias->name), PMU_EVENT_SYMBOL);
> +				SET_SYMBOL(prefix, PMU_EVENT_SYMBOL);
>   				len++;
>   			}
>   		}
>   	}
> +
> +	/* unlikely, but still.. */
> +	if (!len)
> +		goto err;
> +	perf_pmu_events_list_num =3D len;
> +
>   	qsort(perf_pmu_events_list, len,
>   		sizeof(struct perf_pmu_event_symbol), comp_pmu);
>   =

> =


Thanks so much for the patch! It works with my tests.

# ./perf test 6
  6: Parse event definition strings                                  : Ok

# ./perf stat -e software/r1a/ -a -- sleep 1

  Performance counter stats for 'system wide':

    <not supported>      software/r1a/

        1.000940433 seconds time elapsed

In theory, do we also need to check suffix as well? I think returning PMU_E=
VENT_SYMBOL_SUFFIX may =

also confuse the parser. But yes, we don't have this case now.

Thanks
Jin Yao

--===============9112985487007076790==--

