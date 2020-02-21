Content-Type: multipart/mixed; boundary="===============0201198097496174900=="
MIME-Version: 1.0
From: Jiri Olsa <jolsa@redhat.com>
To: lkp@lists.01.org
Subject: Re: [perf/x86] 81ec3f3c4c: will-it-scale.per_process_ops -5.5% regression
Date: Fri, 21 Feb 2020 14:20:48 +0100
Message-ID: <20200221132048.GE652992@krava>
In-Reply-To: <20200221080325.GA67807@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0201198097496174900==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2020 at 04:03:25PM +0800, Feng Tang wrote:
> =

> On Wed, Feb 05, 2020 at 01:58:04PM +0100, Peter Zijlstra wrote:
> > On Wed, Feb 05, 2020 at 08:32:16PM +0800, kernel test robot wrote:
> > > Greeting,
> > > =

> > > FYI, we noticed a -5.5% regression of will-it-scale.per_process_ops d=
ue to commit:
> > > =

> > > =

> > > commit: 81ec3f3c4c4d78f2d3b6689c9816bfbdf7417dbb ("perf/x86: Add chec=
k_period PMU callback")
> > > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> > > =

> > =

> > I'm fairly sure this bisect/result is bogus.
> =

> =

> Hi Peter,
> =

> Some updates:
> =

> We checked more on this. We run 14 times test for it, and the
> results are consistent about the 5.5% degradation, and we
> run the same test on several other platforms, whose test results
> are also consistent, though there are no such -5.5% seen.
> =

> We are also curious that the commit seems to be completely not
> relative to this scalability test of signal, which starts a task
> for each online CPU, and keeps calling raise(), and calculating
> the run numbers.
> =

> One experiment we did is checking which part of the commit
> really affects the test, and it turned out to be the change of
> "struct pmu". Effectively, applying this patch upon 5.0-rc6 =

> which triggers the same regression.
> =

> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
> index 1d5c551..e1a0517 100644
> --- a/include/linux/perf_event.h
> +++ b/include/linux/perf_event.h
> @@ -447,6 +447,11 @@ struct pmu {
>  	 * Filter events for PMU-specific reasons.
>  	 */
>  	int (*filter_match)		(struct perf_event *event); /* optional */
> +
> +	/*
> +	 * Check period value for PERF_EVENT_IOC_PERIOD ioctl.
> +	 */
> +	int (*check_period)		(struct perf_event *event, u64 value); /* optional=
 */
>  };
> =

> So likely, this commit changes the layout of the kernel text
> and data, which may trigger some cacheline level change. From
> the system map of the 2 kernels, a big trunk of symbol's address
> changes which follow the global "pmu",

nice, I wonder we could see that in perf c2c output ;-)
I'll try to run and check

thanks,
jirka

> =

> 5.0-rc6-systemap:
> =

> ffffffff8221d000 d pmu
> ffffffff8221d100 d pmc_reserve_mutex
> ffffffff8221d120 d amd_f15_PMC53
> ffffffff8221d160 d amd_f15_PMC50
> =

> 5.0-rc6+pmu-change-systemap:
> =

> ffffffff8221d000 d pmu
> ffffffff8221d120 d pmc_reserve_mutex
> ffffffff8221d140 d amd_f15_PMC53
> ffffffff8221d180 d amd_f15_PMC50
> =

> But we can hardly identify which exact symbol is responsible
> for the change, as too many symbols are offseted. =

> =

> btw, we've seen similar case that an irrelevant commit changes
> the benchmark, like a hugetlb patch improves pagefault test on
> a platform that never uses hugetlb https://lkml.org/lkml/2020/1/14/150  =

> =

> Thanks,
> Feng
> =

> > _______________________________________________
> > LKP mailing list -- lkp(a)lists.01.org
> > To unsubscribe send an email to lkp-leave(a)lists.01.org
>=20

--===============0201198097496174900==--

