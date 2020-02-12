Content-Type: multipart/mixed; boundary="===============3134655331211898715=="
MIME-Version: 1.0
From: Steven Rostedt <rostedt@goodmis.org>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] tracing: Remove bogus 64-bit synth_event_trace() vararg assumption
Date: Wed, 12 Feb 2020 16:08:59 -0500
Message-ID: <20200212160859.705723d2@gandalf.local.home>
In-Reply-To: <1581538382.25773.5.camel@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3134655331211898715==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 12 Feb 2020 14:13:02 -0600
Tom Zanussi <tzanussi@gmail.com> wrote:

> The vararg code in synth_event_trace() assumed the args were 64 bit
> which is not the case on 32-bit systems.  Just use long which should
> work on every system.
> =

> Also remove all the u64 casts from the synth event test module, which
> also cause compile warnings on 32-bit compiles.
> =

> This fixes the bug reported by the kernel test robot/Rong Chen as
> reported here:
> =

> https://lore.kernel.org/lkml/20200212113444.GS12867(a)shao2-debian/
> =

> With this commit, the lkp-tests tests now pass, as do the synth/kprobe
> event test modules and selftests on x86_64.

Did you test this on 32 bit? I just ran it on a 32 bit kernel, and I
get this in the tracing output:

        modprobe-1731  [003] ....   919.039758: gen_synth_test: next_pid_fi=
eld=3D777(null)next_comm_field=3Dhula hoops ts_ns=3D1000000 ts_ms=3D1000 cp=
u=3D3(null)my_string_field=3Dthneed my_int_field=3D598(null)
        modprobe-1731  [003] ....   919.039904: empty_synth_test: next_pid_=
field=3D777(null)next_comm_field=3Dtiddlywinks ts_ns=3D1000000 ts_ms=3D1000=
 cpu=3D3(null)my_string_field=3Dthneed_2.0 my_int_field=3D399(null)
        modprobe-1731  [003] ....   919.040055: create_synth_test: next_pid=
_field=3D777(null)next_comm_field=3Dtiddlywinks ts_ns=3D1000000 ts_ms=3D100=
0 cpu=3D3(null)my_string_field=3Dthneed my_int_field=3D398(null)
        modprobe-1731  [003] ....   919.040055: gen_synth_test: next_pid_fi=
eld=3D777(null)next_comm_field=3Dslinky ts_ns=3D1000000 ts_ms=3D1000 cpu=3D=
3(null)my_string_field=3Dthneed_2.01 my_int_field=3D395(null)
        modprobe-1731  [003] ....   919.040056: gen_synth_test: next_pid_fi=
eld=3D777(null)next_comm_field=3Dsilly putty ts_ns=3D1000000 ts_ms=3D1000 c=
pu=3D3(null)my_string_field=3Dthneed_9 my_int_field=3D3999(null)
        modprobe-1731  [003] ....   919.040057: create_synth_test: next_pid=
_field=3D444(null)next_comm_field=3Dclackers ts_ns=3D1000000 ts_ms=3D1000 c=
pu=3D3(null)my_string_field=3DThneed my_int_field=3D999(null)

-- Steve

> =

> Reported-by: kernel test robot <rong.a.chen@intel.com>
> Signed-off-by: Tom Zanussi <zanussi@kernel.org>
> ---
>  kernel/trace/synth_event_gen_test.c | 24 ++++++++++++------------
>  kernel/trace/trace_events_hist.c    |  6 +++---
>  2 files changed, 15 insertions(+), 15 deletions(-)
> =

> diff --git a/kernel/trace/synth_event_gen_test.c b/kernel/trace/synth_eve=
nt_gen_test.c
> index 4aefe003cb7c..f0e14106048c 100644
> --- a/kernel/trace/synth_event_gen_test.c
> +++ b/kernel/trace/synth_event_gen_test.c
> @@ -111,11 +111,11 @@ static int __init test_gen_synth_cmd(void)
>  	/* Create some bogus values just for testing */
>  =

>  	vals[0] =3D 777;			/* next_pid_field */
> -	vals[1] =3D (u64)"hula hoops";	/* next_comm_field */
> +	vals[1] =3D (long)"hula hoops";	/* next_comm_field */
>  	vals[2] =3D 1000000;		/* ts_ns */
>  	vals[3] =3D 1000;			/* ts_ms */
>  	vals[4] =3D smp_processor_id();	/* cpu */
> -	vals[5] =3D (u64)"thneed";	/* my_string_field */
> +	vals[5] =3D (long)"thneed";	/* my_string_field */
>  	vals[6] =3D 598;			/* my_int_field */
>  =

>  	/* Now generate a gen_synth_test event */
> @@ -218,11 +218,11 @@ static int __init test_empty_synth_event(void)
>  	/* Create some bogus values just for testing */
>  =

>  	vals[0] =3D 777;			/* next_pid_field */
> -	vals[1] =3D (u64)"tiddlywinks";	/* next_comm_field */
> +	vals[1] =3D (long)"tiddlywinks";	/* next_comm_field */
>  	vals[2] =3D 1000000;		/* ts_ns */
>  	vals[3] =3D 1000;			/* ts_ms */
>  	vals[4] =3D smp_processor_id();	/* cpu */
> -	vals[5] =3D (u64)"thneed_2.0";	/* my_string_field */
> +	vals[5] =3D (long)"thneed_2.0";	/* my_string_field */
>  	vals[6] =3D 399;			/* my_int_field */
>  =

>  	/* Now trace an empty_synth_test event */
> @@ -290,11 +290,11 @@ static int __init test_create_synth_event(void)
>  	/* Create some bogus values just for testing */
>  =

>  	vals[0] =3D 777;			/* next_pid_field */
> -	vals[1] =3D (u64)"tiddlywinks";	/* next_comm_field */
> +	vals[1] =3D (long)"tiddlywinks";	/* next_comm_field */
>  	vals[2] =3D 1000000;		/* ts_ns */
>  	vals[3] =3D 1000;			/* ts_ms */
>  	vals[4] =3D smp_processor_id();	/* cpu */
> -	vals[5] =3D (u64)"thneed";	/* my_string_field */
> +	vals[5] =3D (long)"thneed";	/* my_string_field */
>  	vals[6] =3D 398;			/* my_int_field */
>  =

>  	/* Now generate a create_synth_test event */
> @@ -330,7 +330,7 @@ static int __init test_add_next_synth_val(void)
>  		goto out;
>  =

>  	/* next_comm_field */
> -	ret =3D synth_event_add_next_val((u64)"slinky", &trace_state);
> +	ret =3D synth_event_add_next_val((long)"slinky", &trace_state);
>  	if (ret)
>  		goto out;
>  =

> @@ -350,7 +350,7 @@ static int __init test_add_next_synth_val(void)
>  		goto out;
>  =

>  	/* my_string_field */
> -	ret =3D synth_event_add_next_val((u64)"thneed_2.01", &trace_state);
> +	ret =3D synth_event_add_next_val((long)"thneed_2.01", &trace_state);
>  	if (ret)
>  		goto out;
>  =

> @@ -396,12 +396,12 @@ static int __init test_add_synth_val(void)
>  	if (ret)
>  		goto out;
>  =

> -	ret =3D synth_event_add_val("next_comm_field", (u64)"silly putty",
> +	ret =3D synth_event_add_val("next_comm_field", (long)"silly putty",
>  				  &trace_state);
>  	if (ret)
>  		goto out;
>  =

> -	ret =3D synth_event_add_val("my_string_field", (u64)"thneed_9",
> +	ret =3D synth_event_add_val("my_string_field", (long)"thneed_9",
>  				  &trace_state);
>  	if (ret)
>  		goto out;
> @@ -424,11 +424,11 @@ static int __init test_trace_synth_event(void)
>  	/* Trace some bogus values just for testing */
>  	ret =3D synth_event_trace(create_synth_test, 7,	/* number of values */
>  				444,			/* next_pid_field */
> -				(u64)"clackers",	/* next_comm_field */
> +				"clackers",		/* next_comm_field */
>  				1000000,		/* ts_ns */
>  				1000,			/* ts_ms */
>  				smp_processor_id(),	/* cpu */
> -				(u64)"Thneed",		/* my_string_field */
> +				"Thneed",		/* my_string_field */
>  				999);			/* my_int_field */
>  	return ret;
>  }
> diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events=
_hist.c
> index 483b3fd1094f..b8dd28f546d8 100644
> --- a/kernel/trace/trace_events_hist.c
> +++ b/kernel/trace/trace_events_hist.c
> @@ -1887,12 +1887,12 @@ int synth_event_trace(struct trace_event_file *fi=
le, unsigned int n_vals, ...)
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
>  			char *str_field =3D (char *)&state.entry->fields[n_u64];
>  =

>  			strscpy(str_field, str_val, STR_VAR_LEN_MAX);

--===============3134655331211898715==--

