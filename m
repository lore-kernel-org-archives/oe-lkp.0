Content-Type: multipart/mixed; boundary="===============4281451292707340135=="
MIME-Version: 1.0
From: Song Liu <songliubraving@fb.com>
To: lkp@lists.01.org
Subject: Re: [perf] 64a7f64478: perf-event-tests.check_reset_mpx.failed
Date: Thu, 26 Mar 2020 23:13:41 +0000
Message-ID: <87B78E5B-655C-4B01-B98C-C2EC3D20C8C6@fb.com>
In-Reply-To: <20200318124933.GM11705@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============4281451292707340135==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks for the report. =


> On Mar 18, 2020, at 5:49 AM, kernel test robot <rong.a.chen@intel.com> =
wrote:

[...]

> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <rong.a.chen@intel.com>
> =

> =

> * Checking for corner-cases in the ABI (not necessarily bugs)
>  + tests/corner_cases/multiple_active
>    Testing multiple simultaneous measurements...              PASSED
>  + tests/corner_cases/max_num_events
>    Testing max events that can be created...                  PASSED
>  + tests/corner_cases/max_multiplex
>    Testing limit of multiplexing...                           PASSED
>  + tests/corner_cases/reset_leader
>    Testing reset on group leader...                           PASSED
>  + tests/corner_cases/check_reset_mpx
>    Testing if reset clears multiplex fields...                FAILED

This is an easy fix. =


>  + tests/corner_cases/huge_events_start
>    Testing start of max events...                             PASSED
>  + tests/corner_cases/huge_group_start
>    Testing start of max event group...                        PASSED
>  + tests/corner_cases/signal_after_close
>    Testing signal after close...                              PASSED
> =

> * Checking for fast RDPMC support
>  + tests/rdpmc/rdpmc_support
>    Testing if userspace rdpmc reads are supported...          PASSED
>  + tests/rdpmc/rdpmc_validation
>    Testing if userspace rdpmc reads give expected results...  PASSED
>  + tests/rdpmc/rdpmc_multiplexing
>    Testing if userspace rdpmc multiplexing works...           PASSED
>  + tests/rdpmc/rdpmc_reset
>    Testing if resetting while using rdpmc works...            FAILED
>  + tests/rdpmc/rdpmc_group
>    Testing if rdpmc works with event groups...                FAILED
>  + tests/rdpmc/rdpmc_attach
>    Testing if rdpmc attach works...                           PASSED
>  + tests/rdpmc/rdpmc_attach_cpu
>    Testing if rdpmc behavior on attach CPU...                 FAILED
>  + tests/rdpmc/rdpmc_attach_global_cpu
>    Running on CPU 4
> Testing if rdpmc behavior on attach all procs on other CPU... FAILED
>  + tests/rdpmc/rdpmc_attach_other_cpu
>    Testing if rdpmc behavior on attach other CPU...           FAILED
>  + tests/rdpmc/rdpmc_multiattach
>    Testing if rdpmc multi-attach works...                     PASSED
>  + tests/rdpmc/rdpmc_multiattach_papi
>    Testing if rdpmc papi-multi-attach works...                PASSED
>  + tests/rdpmc/rdpmc_pthreads
>    Testing if rdpmc with pthreads works...                    PASSED
>  + tests/rdpmc/rdpmc_pthreads_group
>    Testing if rdpmc with pthreads works...                    PASSED
>  + tests/rdpmc/rdpmc_attach_multi_enable
>    Testing if minimized rdpmc papi-multi-attach works...      PASSED
>  + tests/rdpmc/rdpmc_exec
>    Testing if we can rdpmc in execed process...               PASSED
>  + tests/rdpmc/rdpmc_exec_papi
>    Testing if we can rdpmc in execed process (PAPI) ...       PASSED

The RDPMC break is trickier. =


IIUC, there is a critical call of perf_event_update_userpage() from =

x86_pmu_enable(), which is not easy to fix.

Peter, do you have suggestions on how to fix this? =


Thanks,
Song
--===============4281451292707340135==--

