Content-Type: multipart/mixed; boundary="===============2530600534118484069=="
MIME-Version: 1.0
From: Jiri Olsa <jolsa@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [perf tools] 600b7378cf: perf-sanity-tests.Share_thread_mg.fail
Date: Mon, 23 Jul 2018 08:59:10 +0200
Message-ID: <20180723065910.GA7523@krava>
In-Reply-To: <20180722075323.GB23613@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============2530600534118484069==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 22, 2018 at 03:53:24PM +0800, kernel test robot wrote:
> =

> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 600b7378cf43f522e88027874f11f63b6fbf53d8 ("[PATCH 2/4] perf tools=
: Add threads__get_last_match function")
> url: https://github.com/0day-ci/linux/commits/Jiri-Olsa/perf-tools-Fix-to=
p-crashes/20180714-075809

SNIP

>   LD       plugin_function-in.o
>   LINK     plugin_function.so
>   CC       plugin_xen.o
>   LD       plugin_xen-in.o
>   LINK     plugin_xen.so
>   CC       plugin_scsi.o
>   LD       plugin_scsi-in.o
>   LINK     plugin_scsi.so
>   CC       plugin_cfg80211.o
>   LD       plugin_cfg80211-in.o
>   LINK     plugin_cfg80211.so
>   GEN      libtraceevent-dynamic-list
>   LINK     perf
>   GEN      perf-archive
>   GEN      perf-with-kcore
>   GEN      python/perf.so
> make: Leaving directory '/usr/src/linux-perf-x86_64-randconfig-s5-0716043=
4-600b7378cf43f522e88027874f11f63b6fbf53d8/tools/perf'
> 2018-07-16 20:55:35 cd /usr/src/linux-perf-x86_64-randconfig-s5-07160434-=
600b7378cf43f522e88027874f11f63b6fbf53d8/tools/perf
> 2018-07-16 20:55:35 mkdir -p /pkg
> 2018-07-16 20:55:36 mkdir -p /kbuild/obj/consumer/x86_64-randconfig-s5-07=
160434
> 2018-07-16 20:55:36 cp /pkg/linux/x86_64-randconfig-s5-07160434/gcc-7/600=
b7378cf43f522e88027874f11f63b6fbf53d8/vmlinux.xz /tmp
> 2018-07-16 20:55:37 unxz -k /tmp/vmlinux.xz
> 2018-07-16 20:55:40 cp /tmp/vmlinux /kbuild/obj/consumer/x86_64-randconfi=
g-s5-07160434
> ignored_by_lkp: BPF filter
> ignored_by_lkp: LLVM search and compile
> ignored_by_lkp: Add vfs_getname probe to get syscall args filenames
> ignored_by_lkp: Use vfs_getname probe to get syscall args filenames
> ignored_by_lkp: Check open filename arg using perf trace + vfs_getname
> ignored_by_lkp: builtin clang support
> 2018-07-16 20:55:41 sudo /usr/src/linux-perf-x86_64-randconfig-s5-0716043=
4-600b7378cf43f522e88027874f11f63b6fbf53d8/tools/perf/perf test 1
>  1: vmlinux symtab matches kallsyms                       : Ok
> 2018-07-16 20:55:43 sudo /usr/src/linux-perf-x86_64-randconfig-s5-0716043=
4-600b7378cf43f522e88027874f11f63b6fbf53d8/tools/perf/perf test 2
>  2: Detect openat syscall event                           : FAILED!
> 2018-07-16 20:55:43 sudo /usr/src/linux-perf-x86_64-randconfig-s5-0716043=
4-600b7378cf43f522e88027874f11f63b6fbf53d8/tools/perf/perf test 3
>  3: Detect openat syscall event on all cpus               : FAILED!
> 2018-07-16 20:55:43 sudo /usr/src/linux-perf-x86_64-randconfig-s5-0716043=
4-600b7378cf43f522e88027874f11f63b6fbf53d8/tools/perf/perf test 4
>  4: Read samples using the mmap interface                 : FAILED!
> 2018-07-16 20:55:43 sudo /usr/src/linux-perf-x86_64-randconfig-s5-0716043=
4-600b7378cf43f522e88027874f11f63b6fbf53d8/tools/perf/perf test 5
>  5: Test data source output                               : Ok
> 2018-07-16 20:55:44 sudo /usr/src/linux-perf-x86_64-randconfig-s5-0716043=
4-600b7378cf43f522e88027874f11f63b6fbf53d8/tools/perf/perf test 6
>  6: Parse event definition strings                        : FAILED!

yea, there's v2 already pulled in by Arnaldo,
that fixes this

thanks,
jirka

--===============2530600534118484069==--

