Content-Type: multipart/mixed; boundary="===============8517396713487276855=="
MIME-Version: 1.0
From: Jiri Olsa <jolsa@redhat.com>
To: lkp@lists.01.org
Subject: Re: [drm/i915/gt] 8c3b1ba0e7: perf-sanity-tests.Parse_event_definition_strings.fail
Date: Sat, 27 Feb 2021 11:21:25 +0100
Message-ID: <YDodJb4CXDT8VemG@krava>
In-Reply-To: <d416a908-6a54-5e4c-e377-dc9d2b778941@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8517396713487276855==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 26, 2021 at 08:41:26AM +0800, Jin, Yao wrote:

SNIP

> > +				SET_SYMBOL(prefix, PMU_EVENT_SYMBOL);
> >   				len++;
> >   			}
> >   		}
> >   	}
> > +
> > +	/* unlikely, but still.. */
> > +	if (!len)
> > +		goto err;
> > +	perf_pmu_events_list_num =3D len;
> > +
> >   	qsort(perf_pmu_events_list, len,
> >   		sizeof(struct perf_pmu_event_symbol), comp_pmu);
> > =

> =

> Thanks so much for the patch! It works with my tests.
> =

> # ./perf test 6
>  6: Parse event definition strings                                  : Ok
> =

> # ./perf stat -e software/r1a/ -a -- sleep 1
> =

>  Performance counter stats for 'system wide':
> =

>    <not supported>      software/r1a/
> =

>        1.000940433 seconds time elapsed
> =

> In theory, do we also need to check suffix as well? I think returning
> PMU_EVENT_SYMBOL_SUFFIX may also confuse the parser. But yes, we don't ha=
ve
> this case now.

yep, let's wait for use case ;-) you can't have suffix
without prefix, and that's the one failing, so I think
we are fine

thanks,
jirka

--===============8517396713487276855==--

