Content-Type: multipart/mixed; boundary="===============4435391486235713005=="
MIME-Version: 1.0
From: atrajeev <atrajeev@imap.linux.ibm.com>
To: lkp@lists.01.org
Subject: Re: [perf tools] 06e5ca746c: Direct leak of ### byte(s) in # object(s) allocated from: __interceptor_realloc/strbuf_grow/strbuf_add/strbuf_addstr/add_key/add_sort_string/
Date: Sun, 23 May 2021 17:29:12 +0530
Message-ID: <ab7ea0d4d440b8cb45b374534b24c2d7@imap.linux.ibm.com>
In-Reply-To: <20210521070335.GD25531@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============4435391486235713005==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2021-05-21 12:33, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 06e5ca746c07380dfe0e4c3e10c34a6daa69eae6 ("perf tools: Support
> pipeline stage cycles for powerpc")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> =

> in testcase: perf-test
> version: perf-test-x86_64-git-1_20210508
> with following parameters:
> =

> 	type: lkp
> 	ucode: 0xde
> =

> test-description: The internal Perf Test suite.
> =

> =

> on test machine: 4 threads 1 sockets Intel(R) Core(TM) i7-7567U CPU @
> 3.50GHz with 32G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire
> log/backtrace):
> =

> =

> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> Direct leak of 736 byte(s) in 1 object(s) allocated from:
>     #0 0x7f9cb9a16720 in __interceptor_realloc
> (/usr/lib/x86_64-linux-gnu/libasan.so.5+0xe9720)
>     #1 0x55e00bbd08ca in strbuf_grow util/strbuf.c:64
>     #2 0x55e00bbd0d42 in strbuf_add util/strbuf.c:86
>     #3 0x55e00bd458be in strbuf_addstr util/strbuf.h:87
>     #4 0x55e00bd66ddb in add_key util/sort.c:3329
>     #5 0x55e00bd67045 in add_sort_string util/sort.c:3342
>     #6 0x55e00bd67369 in sort_help util/sort.c:3368
>     #7 0x55e00b8a1f00 in cmd_report
> /usr/src/perf_selftests-x86_64-rhel-8.3-06e5ca746c07380dfe0e4c3e10c34a6da=
a69eae6/tools/perf/builtin-report.c:1177
>     #8 0x55e00bae47e2 in run_builtin
> /usr/src/perf_selftests-x86_64-rhel-8.3-06e5ca746c07380dfe0e4c3e10c34a6da=
a69eae6/tools/perf/perf.c:313
>     #9 0x55e00bae4f8d in handle_internal_command
> /usr/src/perf_selftests-x86_64-rhel-8.3-06e5ca746c07380dfe0e4c3e10c34a6da=
a69eae6/tools/perf/perf.c:365
>     #10 0x55e00bae54af in run_argv
> /usr/src/perf_selftests-x86_64-rhel-8.3-06e5ca746c07380dfe0e4c3e10c34a6da=
a69eae6/tools/perf/perf.c:409
>     #11 0x55e00bae5e8f in main
> /usr/src/perf_selftests-x86_64-rhel-8.3-06e5ca746c07380dfe0e4c3e10c34a6da=
a69eae6/tools/perf/perf.c:539
>     #12 0x7f9cb8c0309a in __libc_start_main
> (/lib/x86_64-linux-gnu/libc.so.6+0x2409a)
> =


Hi,

With upstream perf tool compiled with "-fsanitize=3Dundefined =

-fsanitize=3Daddress"
and running "perf mem report=E2=80=9D, I could reproduce the above trace. =

However I found we have
already existing similar traces apart from new one reported. Example:

Direct leak of 736 byte(s) in 1 object(s) allocated from:
    #0 0x7fce92e16ffe in __interceptor_realloc =

(/lib/x86_64-linux-gnu/libasan.so.5+0x10dffe)
    #1 0x563b86f16cbc in strbuf_grow util/strbuf.c:64
    #2 0x563b86f16cbc in strbuf_addv util/strbuf.c:112
    #3 0x563b86f1953d in strbuf_addf util/strbuf.c:134
    #4 0x563b871124c3 in add_key util/sort.c:3351
    #5 0x563b871124c3 in add_sort_string util/sort.c:3361
    #6 0x563b871124c3 in sort_help util/sort.c:3387
    #7 0x563b86bc9b7c in cmd_report =

/home/athira/linux/tools/perf/builtin-report.c:1205
    #8 0x563b86c9a36a in report_events =

/home/athira/linux/tools/perf/builtin-mem.c:350
    #9 0x563b86c9a36a in cmd_mem =

/home/athira/linux/tools/perf/builtin-mem.c:492
    #10 0x563b86dfdc37 in run_builtin =

/home/athira/linux/tools/perf/perf.c:313
    #11 0x563b86dfe769 in handle_internal_command =

/home/athira/linux/tools/perf/perf.c:365
    #12 0x563b86b49ca1 in run_argv =

/home/athira/linux/tools/perf/perf.c:409
    #13 0x563b86b49ca1 in main /home/athira/linux/tools/perf/perf.c:539
    #14 0x7fce922a90b2 in __libc_start_main =

(/lib/x86_64-linux-gnu/libc.so.6+0x270b2)

Here it is from "strbuf_addf" . The new trace from =E2=80=9Cstrbuf_addstr" =

started appearing since the patch:
commit: 06e5ca746c07380dfe0e4c3e10c34a6daa69eae6 ("perf tools: Support =

pipeline stage cycles for powerpc")
added a new sort key and code is now touching =E2=80=9Cstrbuf_addstr" also.=
 But =

the reason for detected leak in
both cases are same.

Checking further, these doesn't seems a real memory leak issue. This is =

actually used for sort order help string
and IIUC there is no need to explicitly free it.

Thanks
Athira

> =

> =

> To reproduce:
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp install                job.yaml  # job file is
> attached in this email
>         bin/lkp split-job --compatible job.yaml  # generate the yaml
> file for lkp run
>         bin/lkp run                    generated-yaml-file
> =

> =

> =

> ---
> 0DAY/LKP+ Test Infrastructure                   Open Source Technology =

> Center
> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel =

> Corporation
> =

> Thanks,
> Oliver Sang
--===============4435391486235713005==--

