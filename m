Content-Type: multipart/mixed; boundary="===============5590044754581230444=="
MIME-Version: 1.0
From: Sean Christopherson <seanjc@google.com>
To: lkp@lists.01.org
Subject: Re: [KVM] 21d4c575eb: perf-sanity-tests.Test_event_parsing.fail
Date: Mon, 10 Oct 2022 16:41:20 +0000
Message-ID: <Y0RLMJW27AmKTgLQ@google.com>
In-Reply-To: <202210091636.2f13027d-yujie.liu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5590044754581230444==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 09, 2022, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-11):
> =

> commit: 21d4c575eb4a1e6d956b61b5e9c162895fa7d4ba ("KVM: x86: Print error =
code in exception injection tracepoint iff valid")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: perf-sanity-tests
> version: =

> with following parameters:
> =

> 	perf_compiler: gcc
> =

> on test machine: 4 threads Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz (Skyla=
ke) with 32G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):

What exactly is changing?  I see some "FAILED!" entries, but I don't see ho=
w a
commit that only affects tracepoint string output can be related to things =
like
"Lookup mmap thread".  If the issue is that the output change caused
"Parse event definition strings" to fail, and that propagated to everything=
 else,
then this is effectively "working as intended".

diff --git a/arch/x86/kvm/trace.h b/arch/x86/kvm/trace.h
index d07428e660e3..385436d12024 100644
--- a/arch/x86/kvm/trace.h
+++ b/arch/x86/kvm/trace.h
@@ -376,10 +376,11 @@ TRACE_EVENT(kvm_inj_exception,
                __entry->reinjected     =3D reinjected;
        ),
 =

-       TP_printk("%s (0x%x)%s",
+       TP_printk("%s%s%s%s%s",
                  __print_symbolic(__entry->exception, kvm_trace_sym_exc),
-                 /* FIXME: don't print error_code if not present */
-                 __entry->has_error ? __entry->error_code : 0,
+                 !__entry->has_error ? "" : " (",
+                 !__entry->has_error ? "" : __print_symbolic(__entry->erro=
r_code, { }),
+                 !__entry->has_error ? "" : ")",
                  __entry->reinjected ? " [reinjected]" : "")
 );

> 2022-10-08 04:47:24 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-func-21d=
4c575eb4a1e6d956b61b5e9c162895fa7d4ba/tools/perf/perf test 6
>   6: Parse event definition strings                                  :
>   6.1: Test event parsing                                            : FA=
ILED!

> 2022-10-08 04:48:12 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-func-21d=
4c575eb4a1e6d956b61b5e9c162895fa7d4ba/tools/perf/perf test 19
>  19: 'import perf' in python                                         : FA=
ILED!

> 2022-10-08 04:48:36 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-func-21d=
4c575eb4a1e6d956b61b5e9c162895fa7d4ba/tools/perf/perf test 31
>  31: Lookup mmap thread                                              : FA=
ILED!

> 2022-10-08 04:48:45 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-func-21d=
4c575eb4a1e6d956b61b5e9c162895fa7d4ba/tools/perf/perf test 72
>  72: dlfilter C API                                                  : FA=
ILED!

> 2022-10-08 04:48:46 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-func-21d=
4c575eb4a1e6d956b61b5e9c162895fa7d4ba/tools/perf/perf test 75
>  75: Test dwarf unwind                                               : FA=
ILED!

> 2022-10-08 04:48:47 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-func-21d=
4c575eb4a1e6d956b61b5e9c162895fa7d4ba/tools/perf/perf test 80
>  80: build id cache operations                                       : FA=
ILED!

> 2022-10-08 04:49:27 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-func-21d=
4c575eb4a1e6d956b61b5e9c162895fa7d4ba/tools/perf/perf test 89
>  89: perf stat CSV output linter                                     : FA=
ILED!

> 2022-10-08 04:49:51 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-func-21d=
4c575eb4a1e6d956b61b5e9c162895fa7d4ba/tools/perf/perf test 94
>  94: perf all metrics test                                           : FA=
ILED!

> 2022-10-08 04:56:05 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-func-21d=
4c575eb4a1e6d956b61b5e9c162895fa7d4ba/tools/perf/perf test 101
> 101: Miscellaneous Intel PT testing                                  : FA=
ILED!
--===============5590044754581230444==--

