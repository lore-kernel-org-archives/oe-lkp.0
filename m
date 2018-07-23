Content-Type: multipart/mixed; boundary="===============0221825989331286519=="
MIME-Version: 1.0
From: Chen, Rong A <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [perf] 100c2d1c34: perf-sanity-tests.'import_perf'_in_python.fail
Date: Mon, 23 Jul 2018 01:04:59 +0000
Message-ID: <2CF7BCD57CBDC945B73460FDFF53554401078797@SHSMSX101.ccr.corp.intel.com>
In-Reply-To: <20180722074221.GA23613@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============0221825989331286519==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, all

this is a bug of 0day environment, please ignore the report.

Thanks,
Rong, Chen

-----Original Message-----
From: LKP [mailto:lkp-bounces(a)lists.01.org] On Behalf Of kernel test robot
Sent: Sunday, July 22, 2018 3:42 PM
To: Dominique Martinet <asmadeus@codewreck.org>
Cc: lkp(a)01.org; lkp <lkp@intel.com>; LKML <linux-kernel@vger.kernel.o=
rg>
Subject: [LKP] [lkp-robot] [perf] 100c2d1c34: perf-sanity-tests.'import_per=
f'_in_python.fail


FYI, we noticed the following commit (built with gcc-7):

commit: 100c2d1c348d3a0499b635a79d22518326a00619 ("perf: change strncpy+tru=
ncation to strlcpy") https://github.com/0day-ci/linux UPDATE-20180720-10494=
1/Dominique-Martinet/coccinelle-change-strncpy-truncation-to-strlcpy/201807=
14-082532

in testcase: perf-sanity-tests
with following parameters:

	perf_compiler: gcc



on test machine: qemu-system-x86_64 -enable-kvm -cpu kvm64,+ssse3 -smp 2 -m=
 8G

caused below changes (please refer to attached dmesg/kmsg for entire log/ba=
cktrace):




2018-07-21 05:35:26 make ARCH=3D -C /usr/src/linux-perf-x86_64-rhel-100c2d1=
c348d3a0499b635a79d22518326a00619/tools/perf
make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-100c2d1c348d3=
a0499b635a79d22518326a00619/tools/perf'
  BUILD:   Doing 'make =1B[33m-j2=1B[m' parallel build
  HOSTCC   fixdep.o
  HOSTLD   fixdep-in.o
  LINK     fixdep

Auto-detecting system features:
...                         dwarf: [ =1B[32mon=1B[m  ]
...            dwarf_getlocations: [ =1B[32mon=1B[m  ]
...                         glibc: [ =1B[32mon=1B[m  ]
...                          gtk2: [ =1B[31mOFF=1B[m ]
...                      libaudit: [ =1B[32mon=1B[m  ]
...                        libbfd: [ =1B[32mon=1B[m  ]
...                        libelf: [ =1B[32mon=1B[m  ]
...                       libnuma: [ =1B[32mon=1B[m  ]
...        numa_num_possible_cpus: [ =1B[32mon=1B[m  ]
...                       libperl: [ =1B[31mOFF=1B[m ]
...                     libpython: [ =1B[32mon=1B[m  ]
...                      libslang: [ =1B[31mOFF=1B[m ]
...                     libcrypto: [ =1B[31mOFF=1B[m ]
...                     libunwind: [ =1B[32mon=1B[m  ]
...            libdw-dwarf-unwind: [ =1B[32mon=1B[m  ]
...                          zlib: [ =1B[32mon=1B[m  ]
...                          lzma: [ =1B[32mon=1B[m  ]
...                     get_cpuid: [ =1B[32mon=1B[m  ]
...                           bpf: [ =1B[32mon=1B[m  ]

  GEN      common-cmds.h
  CC       fd/array.o
  LD       fd/libapi-in.o
  CC       fs/fs.o
  CC       fs/tracing_path.o
  LD       fs/libapi-in.o
  CC       cpu.o
  CC       event-parse.o
  CC       debug.o
  CC       str_error_r.o
  LD       libapi-in.o
  AR       libapi.a
  CC       exec-cmd.o
  CC       help.o
  CC       event-plugin.o
  CC       pager.o
  CC       trace-seq.o
  CC       parse-options.o
  CC       parse-filter.o
  CC       parse-utils.o
  CC       kbuffer-parse.o
  LD       libtraceevent-in.o
  LINK     libtraceevent.a
  CC       libbpf.o
  CC       run-command.o
  CC       bpf.o
  CC       sigchain.o
  CC       nlattr.o
  CC       subcmd-config.o
  LD       libsubcmd-in.o
  CC       btf.o
  AR       libsubcmd.a
  HOSTCC   pmu-events/json.o
  HOSTCC   pmu-events/jsmn.o
  LD       libbpf-in.o
  LINK     libbpf.a
  CC       plugin_jbd2.o
  HOSTCC   pmu-events/jevents.o
  LD       plugin_jbd2-in.o
  CC       plugin_hrtimer.o
  LD       plugin_hrtimer-in.o
  CC       plugin_kmem.o
  HOSTLD   pmu-events/jevents-in.o
  GEN      perf-archive
  GEN      perf-with-kcore
  LD       plugin_kmem-in.o
  CC       util/annotate.o
  CC       plugin_kvm.o
  LD       plugin_kvm-in.o
  CC       plugin_mac80211.o
  LD       plugin_mac80211-in.o
  CC       plugin_sched_switch.o
  LD       plugin_sched_switch-in.o
  CC       plugin_function.o
  LD       plugin_function-in.o
  CC       plugin_xen.o
  LD       plugin_xen-in.o
  CC       plugin_scsi.o
  LD       plugin_scsi-in.o
  CC       plugin_cfg80211.o
  LD       plugin_cfg80211-in.o
  LINK     plugin_jbd2.so
  LINK     plugin_hrtimer.so
  LINK     plugin_kmem.so
  LINK     plugin_kvm.so
  LINK     plugin_mac80211.so
  LINK     plugin_sched_switch.so
  LINK     plugin_function.so
  LINK     plugin_xen.so
  LINK     plugin_scsi.so
  LINK     plugin_cfg80211.so
  CC       builtin-bench.o
  CC       builtin-annotate.o
  CC       builtin-config.o
  CC       util/block-range.o
  CC       builtin-diff.o
  CC       util/build-id.o
  CC       builtin-evlist.o
  CC       util/config.o
  CC       builtin-ftrace.o
  CC       util/ctype.o
  CC       util/db-export.o
  CC       builtin-help.o
  CC       builtin-sched.o
  CC       util/env.o
  CC       util/event.o
  CC       util/evlist.o
  CC       builtin-buildid-list.o
  CC       builtin-buildid-cache.o
  CC       util/evsel.o
  CC       builtin-kallsyms.o
  CC       builtin-list.o
  CC       builtin-record.o
  CC       builtin-report.o
  CC       util/evsel_fprintf.o
  CC       util/find_bit.o
  CC       util/kallsyms.o
  CC       builtin-stat.o
  CC       util/levenshtein.o
  CC       util/llvm-utils.o
  CC       util/mmap.o
  CC       util/memswap.o
  BISON    util/parse-events-bison.c
  CC       util/perf_regs.o
  CC       util/path.o
  CC       util/print_binary.o
  CC       util/rbtree.o
  CC       util/libstring.o
  CC       util/bitmap.o
  CC       util/hweight.o
  CC       util/smt.o
  CC       builtin-timechart.o
  CC       util/strbuf.o
  CC       util/string.o
  CC       util/strlist.o
  CC       util/strfilter.o
  CC       util/top.o
  CC       builtin-top.o
  CC       util/usage.o
  CC       util/dso.o
  CC       builtin-script.o
  CC       util/symbol.o
  CC       util/symbol_fprintf.o
  CC       util/color.o
  CC       util/metricgroup.o
  CC       util/header.o
  CC       builtin-kmem.o
  CC       builtin-lock.o
  CC       builtin-kvm.o
  CC       builtin-inject.o
  CC       util/callchain.o
  CC       builtin-mem.o
  CC       builtin-data.o
  CC       builtin-version.o
  CC       builtin-c2c.o
  CC       util/values.o
  CC       builtin-trace.o
  CC       util/debug.o
  CC       util/machine.o
  CC       util/map.o
  CC       builtin-probe.o
  CC       util/pstack.o
  CC       util/session.o
  CC       bench/sched-messaging.o
  CC       bench/sched-pipe.o
  CC       bench/mem-functions.o
  CC       bench/futex-hash.o
  CC       bench/futex-wake.o
  CC       util/syscalltbl.o
  CC       bench/futex-wake-parallel.o
  CC       util/ordered-events.o
  CC       bench/futex-requeue.o
  CC       util/namespaces.o
  CC       bench/futex-lock-pi.o
  CC       util/comm.o
  CC       bench/mem-memcpy-x86-64-asm.o
  CC       bench/mem-memset-x86-64-asm.o
  CC       bench/numa.o
  CC       util/thread.o
  CC       util/thread_map.o
  CC       util/trace-event-parse.o
  LD       bench/perf-in.o
  CC       tests/builtin-test.o
  CC       util/parse-events-bison.o
  CC       tests/parse-events.o
  BISON    util/pmu-bison.c
  CC       util/trace-event-read.o
  CC       util/trace-event-info.o
  CC       util/trace-event-scripting.o
  CC       util/trace-event.o
  CC       tests/dso-data.o
  CC       util/svghelper.o
  CC       tests/attr.o
  CC       tests/vmlinux-kallsyms.o
  CC       util/sort.o
  CC       tests/openat-syscall.o
  CC       tests/openat-syscall-all-cpus.o
  CC       tests/openat-syscall-tp-fields.o
  CC       tests/mmap-basic.o
  CC       tests/perf-record.o
  CC       tests/evsel-roundtrip-name.o
  CC       util/hist.o
  CC       tests/evsel-tp-sched.o
  CC       tests/fdarray.o
  CC       tests/pmu.o
  CC       tests/hists_common.o
  CC       tests/hists_link.o
  CC       tests/hists_filter.o
  CC       util/util.o
  CC       tests/hists_output.o
  CC       util/xyarray.o
  CC       util/cpumap.o
  CC       tests/hists_cumulate.o
  CC       util/cgroup.o
  CC       tests/python-use.o
  CC       tests/bp_signal.o
  CC       util/target.o
  CC       util/rblist.o
  CC       tests/bp_signal_overflow.o
  CC       util/intlist.o
  CC       tests/bp_account.o
  CC       util/vdso.o
  CC       tests/task-exit.o
  CC       util/counts.o
  CC       util/stat.o
  CC       tests/sw-clock.o
  CC       tests/mmap-thread-lookup.o
  CC       util/stat-shadow.o
  CC       tests/thread-mg-share.o
  CC       tests/switch-tracking.o
  CC       util/record.o
  CC       tests/keep-tracking.o
  CC       util/srcline.o
  CC       tests/code-reading.o
  CC       tests/sample-parsing.o
  CC       util/data.o
  CC       util/tsc.o
  CC       tests/parse-no-sample-id-all.o
  CC       util/cloexec.o
  CC       util/call-path.o
  CC       tests/kmod-path.o
  CC       util/rwsem.o
  CC       util/thread-stack.o
  CC       tests/thread-map.o
  CC       tests/llvm.o
  CC       util/auxtrace.o
  CC       tests/bpf.o
  CC       tests/topology.o
  CC       tests/mem.o
  CC       tests/cpumap.o
  CC       util/intel-pt-decoder/intel-pt-pkt-decoder.o
  CC       tests/stat.o
  CC       tests/event_update.o
  GEN      util/intel-pt-decoder/inat-tables.c
  CC       util/intel-pt-decoder/intel-pt-log.o
  CC       util/intel-pt-decoder/intel-pt-decoder.o
  CC       tests/event-times.o
  CC       tests/expr.o
  CC       tests/backward-ring-buffer.o
  CC       tests/sdt.o
  CC       tests/is_printable_array.o
  CC       util/intel-pt-decoder/intel-pt-insn-decoder.o
  CC       tests/bitmap.o
  CC       tests/perf-hooks.o
  CC       tests/clang.o
  CC       tests/unit_number__scnprintf.o
  CC       tests/mem2node.o
  CC       tests/dwarf-unwind.o
  LD       util/intel-pt-decoder/libperf-in.o
  CC       util/scripting-engines/trace-event-python.o
  CC       tests/llvm-src-base.o
  CC       tests/llvm-src-kbuild.o
  CC       tests/llvm-src-prologue.o
  CC       tests/llvm-src-relocation.o
  LD       tests/perf-in.o
  CC       perf.o
  LD       perf-in.o
  LINK     pmu-events/jevents
  CC       arch/common.o
  CC       arch/x86/util/header.o
  CC       arch/x86/util/tsc.o
  LD       util/scripting-engines/libperf-in.o
  CC       util/intel-pt.o
  CC       arch/x86/util/pmu.o
  CC       arch/x86/util/kvm-stat.o
  CC       arch/x86/util/perf_regs.o
  CC       arch/x86/util/group.o
  CC       arch/x86/util/machine.o
  CC       arch/x86/util/event.o
  CC       util/intel-bts.o
  CC       arch/x86/util/dwarf-regs.o
  CC       arch/x86/util/unwind-libunwind.o
  CC       arch/x86/util/auxtrace.o
  CC       util/arm-spe.o
  CC       arch/x86/util/intel-pt.o
  CC       util/arm-spe-pkt-decoder.o
  CC       util/parse-branch-options.o
  CC       util/dump-insn.o
  CC       util/parse-regs-options.o
  CC       arch/x86/util/intel-bts.o
  CC       util/term.o
  CC       util/help-unknown-cmd.o
  CC       util/mem-events.o
  LD       arch/x86/util/libperf-in.o
  CC       arch/x86/tests/regs_load.o
  CC       arch/x86/tests/dwarf-unwind.o
  CC       util/vsprintf.o
  CC       arch/x86/tests/arch-tests.o
  CC       arch/x86/tests/rdpmc.o
  CC       util/drv_configs.o
  CC       util/units.o
  CC       arch/x86/tests/perf-time-to-tsc.o
  CC       util/time-utils.o
  CC       arch/x86/tests/insn-x86.o
  BISON    util/expr-bison.c
  CC       util/branch.o
  LD       arch/x86/tests/libperf-in.o
  LD       arch/x86/libperf-in.o
  LD       arch/libperf-in.o
  GEN      libtraceevent-dynamic-list
  CC       ui/setup.o
  CC       util/mem2node.o
  CC       ui/helpline.o
  CC       util/bpf-loader.o
  CC       ui/progress.o
  CC       ui/util.o
  CC       ui/hist.o
  CC       util/bpf-prologue.o
  CC       util/symbol-elf.o
  CC       ui/stdio/hist.o
  CC       util/probe-file.o
  LD       ui/libperf-in.o
  GEN      pmu-events/pmu-events.c
  CC       pmu-events/pmu-events.o
  CC       util/probe-event.o
  LD       pmu-events/pmu-events-in.o
  CC       scripts/python/Perf-Trace-Util/Context.o
  LD       scripts/python/Perf-Trace-Util/libperf-in.o
  LD       scripts/libperf-in.o
  GEN      python/perf.so
  CC       util/probe-finder.o
  CC       util/dwarf-aux.o
  CC       util/dwarf-regs.o
  CC       util/unwind-libunwind-local.o
  CC       util/unwind-libunwind.o
  CC       util/zlib.o
  CC       util/lzma.o
  CC       util/demangle-java.o
  CC       util/demangle-rust.o
  CC       util/jitdump.o
  CC       util/genelf.o
  CC       util/genelf_debug.o
  CC       util/perf-hooks.o
  FLEX     util/parse-events-flex.c
  FLEX     util/pmu-flex.c
  CC       util/pmu-bison.o
  CC       util/expr-bison.o
  CC       util/parse-events.o
  CC       trace/beauty/clone.o
  CC       trace/beauty/fcntl.o
  CC       trace/beauty/flock.o
  CC       trace/beauty/ioctl.o
  CC       trace/beauty/kcmp.o
  CC       trace/beauty/pkey_alloc.o
  CC       trace/beauty/prctl.o
  CC       trace/beauty/statx.o
  CC       util/parse-events-flex.o
  LD       trace/beauty/libperf-in.o
  CC       util/pmu.o
  CC       util/pmu-flex.o
  LD       util/libperf-in.o
  LD       libperf-in.o
  AR       libperf.a
  LINK     perf
make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-100c2d1c348d3a=
0499b635a79d22518326a00619/tools/perf'
2018-07-21 05:38:15 cd /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499b6=
35a79d22518326a00619/tools/perf
2018-07-21 05:38:15 mkdir -p /pkg
2018-07-21 05:38:15 mkdir -p /kbuild/obj/lkp/x86_64-rhel
2018-07-21 05:38:22 cp /pkg/linux/x86_64-rhel/gcc-7/100c2d1c348d3a0499b635a=
79d22518326a00619/vmlinux.xz /tmp
2018-07-21 05:38:28 unxz -k /tmp/vmlinux.xz
2018-07-21 05:38:32 cp /tmp/vmlinux /kbuild/obj/lkp/x86_64-rhel
ignored_by_lkp: BPF filter
ignored_by_lkp: LLVM search and compile
ignored_by_lkp: Add vfs_getname probe to get syscall args filenames
ignored_by_lkp: Use vfs_getname probe to get syscall args filenames
ignored_by_lkp: Check open filename arg using perf trace + vfs_getname
ignored_by_lkp: builtin clang support
2018-07-21 05:38:32 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 1
 1: vmlinux symtab matches kallsyms                       : Ok
2018-07-21 05:38:33 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 2
 2: Detect openat syscall event                           : Ok
2018-07-21 05:38:33 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 3
 3: Detect openat syscall event on all cpus               : Ok
2018-07-21 05:38:33 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 4
 4: Read samples using the mmap interface                 : Ok
2018-07-21 05:38:33 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 5
 5: Test data source output                               : Ok
2018-07-21 05:38:33 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 6
 6: Parse event definition strings                        : Ok
2018-07-21 05:38:33 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 7
 7: Simple expression parser                              : Ok
2018-07-21 05:38:33 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 8
 8: PERF_RECORD_* events & perf_sample fields             : Ok
2018-07-21 05:38:35 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 9
 9: Parse perf pmu format                                 : Ok
2018-07-21 05:38:35 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 10
10: DSO data read                                         : Ok
2018-07-21 05:38:35 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 11
11: DSO data cache                                        : Ok
2018-07-21 05:38:35 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 12
12: DSO data reopen                                       : Ok
2018-07-21 05:38:35 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 13
13: Roundtrip evsel->name                                 : Ok
2018-07-21 05:38:35 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 14
14: Parse sched tracepoints fields                        : Ok
2018-07-21 05:38:35 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 15
15: syscalls:sys_enter_openat event fields                : Ok
2018-07-21 05:38:35 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 16
16: Setup struct perf_event_attr                          : Ok
2018-07-21 05:38:42 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 17
17: Match and link multiple hists                         : Ok
2018-07-21 05:38:42 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 18
18: 'import perf' in python                               : FAILED!
2018-07-21 05:38:42 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 19
19: Breakpoint overflow signal handler                    : Ok
2018-07-21 05:38:42 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 20
20: Breakpoint overflow sampling                          : Ok
2018-07-21 05:38:42 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 21
21: Breakpoint accounting                                 : Ok
2018-07-21 05:38:42 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 22
22: Number of exit events of a simple workload            : Skip
2018-07-21 05:38:42 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 23
23: Software clock events period values                   : Ok
2018-07-21 05:38:42 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 24
24: Object code reading                                   : FAILED!
2018-07-21 05:38:42 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 25
25: Sample parsing                                        : Ok
2018-07-21 05:38:42 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 26
26: Use a dummy software event to keep tracking           : Skip
2018-07-21 05:38:42 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 27
27: Parse with no sample_id_all bit set                   : Ok
2018-07-21 05:38:42 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 28
28: Filter hist entries                                   : Ok
2018-07-21 05:38:42 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 29
29: Lookup mmap thread                                    : Ok
2018-07-21 05:38:43 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 30
30: Share thread mg                                       : Ok
2018-07-21 05:38:43 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 31
31: Sort output of hist entries                           : Ok
2018-07-21 05:38:43 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 32
32: Cumulate child hist entries                           : Ok
2018-07-21 05:38:43 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 33
33: Track with sched_switch                               : Ok
2018-07-21 05:38:43 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 34
34: Filter fds with revents mask in a fdarray             : Ok
2018-07-21 05:38:43 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 35
35: Add fd to a fdarray, making it autogrow               : Ok
2018-07-21 05:38:43 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 36
36: kmod_path__parse                                      : Ok
2018-07-21 05:38:43 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 37
37: Thread map                                            : Ok
2018-07-21 05:38:43 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 39
39: Session topology                                      : Ok
2018-07-21 05:38:43 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 41
41: Synthesize thread map                                 : Ok
2018-07-21 05:38:43 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 42
42: Remove thread map                                     : Ok
2018-07-21 05:38:43 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 43
43: Synthesize cpu map                                    : Ok
2018-07-21 05:38:43 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 44
44: Synthesize stat config                                : Ok
2018-07-21 05:38:43 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 45
45: Synthesize stat                                       : Ok
2018-07-21 05:38:43 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 46
46: Synthesize stat round                                 : Ok
2018-07-21 05:38:43 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 47
47: Synthesize attr update                                : Ok
2018-07-21 05:38:43 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 48
48: Event times                                           : Ok
2018-07-21 05:38:43 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 49
49: Read backward ring buffer                             : Ok
2018-07-21 05:38:43 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 50
50: Print cpu map                                         : Ok
2018-07-21 05:38:43 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 51
51: Probe SDT events                                      : Ok
2018-07-21 05:38:43 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 52
52: is_printable_array                                    : Ok
2018-07-21 05:38:43 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 53
53: Print bitmap                                          : Ok
2018-07-21 05:38:43 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 54
54: perf hooks                                            : Ok
2018-07-21 05:38:43 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 56
56: unit_number__scnprintf                                : Ok
2018-07-21 05:38:44 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 57
57: mem2node                                              : Ok
2018-07-21 05:38:44 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 58
58: x86 rdpmc                                             : FAILED!
2018-07-21 05:38:44 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 59
59: Convert perf time to TSC                              : FAILED!
2018-07-21 05:38:44 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 60
60: DWARF unwind                                          : Ok
2018-07-21 05:38:44 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 61
61: x86 instruction decoder - new instructions            : Ok
2018-07-21 05:38:44 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 62
62: probe libc's inet_pton & backtrace it with ping       : FAILED!
2018-07-21 05:38:44 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 66
2018-07-21 05:38:44 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 67
2018-07-21 05:38:44 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 68
2018-07-21 05:38:44 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 69
2018-07-21 05:38:44 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 70
2018-07-21 05:38:44 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 71
2018-07-21 05:38:44 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 72
2018-07-21 05:38:44 sudo /usr/src/linux-perf-x86_64-rhel-100c2d1c348d3a0499=
b635a79d22518326a00619/tools/perf/perf test 73



To reproduce:

        git clone https://github.com/intel/lkp-tests.git
        cd lkp-tests
        bin/lkp qemu -k <bzImage> job-script # job-script is attached in th=
is email



Thanks,
Rong, Chen

--===============0221825989331286519==--

