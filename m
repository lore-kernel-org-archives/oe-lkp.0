Content-Type: multipart/mixed; boundary="===============4922440986231358729=="
MIME-Version: 1.0
From: Tom Zanussi <zanussi@kernel.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] tracing: Remove bogus 64-bit synth_event_trace() vararg assumption
Date: Wed, 12 Feb 2020 14:10:25 -0600
Message-ID: <1581538225.25773.3.camel@kernel.org>
In-Reply-To: <20200212145026.0cbaa86b@gandalf.local.home>
List-Id: <oe-lkp.lists.linux.dev>

--===============4922440986231358729==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Steve,

On Wed, 2020-02-12 at 14:50 -0500, Steven Rostedt wrote:
> From: Tom Zanussi <zanussi@kernel.org>
> =

> [ Tom, please send patches normally, and not embedded in a reply.
> Otherwise it will not be picked up by my patchwork, and may be lost.
> ]

Sorry about that.  I just finished getting my 32-bit test system up and
running and this does fix the problem, although I do have an updated
patch that also fixes some compile warnings on 32-bit compiles that I
saw in the test module.

I'll post that as a separate patch, of course.

Tom


> =

> The vararg code in synth_event_trace() assumed the args were 64 bit
> which is not the case on 32 bit systems.  Just use long which should
> work on every system, and remove the u64 casts from the synth event
> test module.
> =

> Reported-by: kernel test robot <rong.a.chen@intel.com>
> Signed-off-by: Tom Zanussi <zanussi@kernel.org>
> ---
>  kernel/trace/synth_event_gen_test.c | 4 ++--
>  kernel/trace/trace_events_hist.c    | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
> =

> diff --git a/kernel/trace/synth_event_gen_test.c
> b/kernel/trace/synth_event_gen_test.c
> index 4aefe003cb7c..2a7465569a43 100644
> --- a/kernel/trace/synth_event_gen_test.c
> +++ b/kernel/trace/synth_event_gen_test.c
> @@ -424,11 +424,11 @@ static int __init test_trace_synth_event(void)
>  	/* Trace some bogus values just for testing */
>  	ret =3D synth_event_trace(create_synth_test, 7,	/*
> number of values */
>  				444,			/*
> next_pid_field */
> -				(u64)"clackers",	/*
> next_comm_field */
> +				"clackers",		/*
> next_comm_field */
>  				1000000,		/* ts_ns */
>  				1000,			/*
> ts_ms */
>  				smp_processor_id(),	/* cpu */
> -				(u64)"Thneed",		/*
> my_string_field */
> +				"Thneed",		/*
> my_string_field */
>  				999);			/*
> my_int_field */
>  	return ret;
>  }
> diff --git a/kernel/trace/trace_events_hist.c
> b/kernel/trace/trace_events_hist.c
> index 2fcb755e900a..e65276c3c9d1 100644
> --- a/kernel/trace/trace_events_hist.c
> +++ b/kernel/trace/trace_events_hist.c
> @@ -1883,12 +1883,12 @@ int synth_event_trace(struct trace_event_file
> *file, unsigned int n_vals, ...)
>  =

>  	va_start(args, n_vals);
>  	for (i =3D 0, n_u64 =3D 0; i < state.event->n_fields; i++) {
> -		u64 val;
> +		long val;
>  =

> -		val =3D va_arg(args, u64);
> +		val =3D va_arg(args, long);
>  =

>  		if (state.event->fields[i]->is_string) {
> -			char *str_val =3D (char *)(long)val;
> +			char *str_val =3D (char *)val;
>  			char *str_field =3D (char *)&state.entry-
> >fields[n_u64];
>  =

>  			strscpy(str_field, str_val,
> STR_VAR_LEN_MAX);
--===============4922440986231358729==--

