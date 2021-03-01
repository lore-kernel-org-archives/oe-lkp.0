Content-Type: multipart/mixed; boundary="===============3510303110033603850=="
MIME-Version: 1.0
From: Jin, Yao <yao.jin@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [drm/i915/gt] 8c3b1ba0e7: perf-sanity-tests.Parse_event_definition_strings.fail
Date: Mon, 01 Mar 2021 09:12:01 +0800
Message-ID: <d2a9769e-0632-0cfd-99e5-ab6ff2a54e46@linux.intel.com>
In-Reply-To: <YDtjgCcP9mLBcu/y@krava>
List-Id: <oe-lkp.lists.linux.dev>

--===============3510303110033603850==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Jiri,

On 2/28/2021 5:33 PM, Jiri Olsa wrote:
> On Sat, Feb 27, 2021 at 11:21:25AM +0100, Jiri Olsa wrote:
>> On Fri, Feb 26, 2021 at 08:41:26AM +0800, Jin, Yao wrote:
>>
>> SNIP
>>
>>>> +				SET_SYMBOL(prefix, PMU_EVENT_SYMBOL);
>>>>    				len++;
>>>>    			}
>>>>    		}
>>>>    	}
>>>> +
>>>> +	/* unlikely, but still.. */
>>>> +	if (!len)
>>>> +		goto err;
>>>> +	perf_pmu_events_list_num =3D len;
>>>> +
>>>>    	qsort(perf_pmu_events_list, len,
>>>>    		sizeof(struct perf_pmu_event_symbol), comp_pmu);
>>>>
>>>
>>> Thanks so much for the patch! It works with my tests.
>>>
>>> # ./perf test 6
>>>   6: Parse event definition strings                                  : =
Ok
>>>
>>> # ./perf stat -e software/r1a/ -a -- sleep 1
>>>
>>>   Performance counter stats for 'system wide':
>>>
>>>     <not supported>      software/r1a/
>>>
>>>         1.000940433 seconds time elapsed
>>>
>>> In theory, do we also need to check suffix as well? I think returning
>>> PMU_EVENT_SYMBOL_SUFFIX may also confuse the parser. But yes, we don't =
have
>>> this case now.
>>
>> yep, let's wait for use case ;-) you can't have suffix
>> without prefix, and that's the one failing, so I think
>> we are fine
> =

> actualy this one seems to work as well, could you plz check
> =

> thanks,
> jirka
> =

> =

> ---
> diff --git a/tools/perf/util/parse-events.y b/tools/perf/util/parse-event=
s.y
> index d5b6aff82f21..d57ac86ce7ca 100644
> --- a/tools/perf/util/parse-events.y
> +++ b/tools/perf/util/parse-events.y
> @@ -89,6 +89,7 @@ static void inc_group_count(struct list_head *list,
>   %type <str> PE_EVENT_NAME
>   %type <str> PE_PMU_EVENT_PRE PE_PMU_EVENT_SUF PE_KERNEL_PMU_EVENT PE_PM=
U_EVENT_FAKE
>   %type <str> PE_DRV_CFG_TERM
> +%type <str> event_pmu_name
>   %destructor { free ($$); } <str>
>   %type <term> event_term
>   %destructor { parse_events_term__delete ($$); } <term>
> @@ -272,8 +273,11 @@ event_def: event_pmu |
>   	   event_legacy_raw sep_dc |
>   	   event_bpf_file
>   =

> +event_pmu_name:
> +PE_NAME | PE_PMU_EVENT_PRE
> +
>   event_pmu:
> -PE_NAME opt_pmu_config
> +event_pmu_name opt_pmu_config
>   {
>   	struct parse_events_state *parse_state =3D _parse_state;
>   	struct parse_events_error *error =3D parse_state->error;
> =


This fix looks good.

[root(a)p-tglr02 perf]# ./perf list | grep i915/software-gt-awake-time/
   i915/software-gt-awake-time/                       [Kernel PMU event]

[root(a)p-tglr02 perf]# ./perf test 6
  6: Parse event definition strings                                  : Ok

[root(a)p-tglr02 perf]# ./perf stat -e software/r1a/ -a -- sleep 1

  Performance counter stats for 'system wide':

    <not supported>      software/r1a/

        1.001379319 seconds time elapsed

Thanks
Jin Yao
--===============3510303110033603850==--

