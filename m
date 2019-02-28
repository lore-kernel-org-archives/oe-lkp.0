Content-Type: multipart/mixed; boundary="===============3501675162898948283=="
MIME-Version: 1.0
From: John Hubbard <jhubbard@nvidia.com>
To: lkp@lists.01.org
Subject: Re: [mm/gup] cdaa813278: kernel_selftests.memfd.run_fuse_test.sh.fail
Date: Thu, 28 Feb 2019 11:47:20 -0800
Message-ID: <9d007b77-4ad0-2327-fde7-1c50b42f9fe4@nvidia.com>
In-Reply-To: <20190228121602.GI10770@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============3501675162898948283==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2/28/19 4:16 AM, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: cdaa813278ddc616ee201eacda77f63996b5dd2d ("[PATCH 4/6] mm/gup: tr=
ack gup-pinned pages")

Hi,

This patch is part of a series that is titled "RFC", and as such,
patches after the first two are not really runnable. That's because
the remaining 100+ call site conversions have not yet been done.

I wonder if LKP might want to avoid RFC patchsets, just to save
machine time and avoid false positives? Just a thought.

thanks,
-- =

John Hubbard
NVIDIA

> url: https://github.com/0day-ci/linux/commits/john-hubbard-gmail-com/RFC-=
v2-mm-gup-dma-tracking/20190205-001101
> =

> =

> in testcase: kernel_selftests
> with following parameters:
> =

> 	group: kselftests-02
> =

> test-description: The kernel contains a set of "self tests" under the too=
ls/testing/selftests/ directory. These are intended to be small unit tests =
to exercise individual code paths in the kernel.
> test-url: https://www.kernel.org/doc/Documentation/kselftest.txt
> =

> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 4G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> =

> =

> KERNEL SELFTESTS: linux_headers_dir is /usr/src/linux-headers-x86_64-rhel=
-7.2-cdaa813278ddc616ee201eacda77f63996b5dd2d
> 2019-02-19 00:14:39 ln -sf /usr/bin/clang-7 /usr/bin/clang
> 2019-02-19 00:14:39 ln -sf /usr/bin/llc-7 /usr/bin/llc
> media_tests test: not in Makefile
> 2019-02-19 00:14:39 make TARGETS=3Dmedia_tests
> make[1]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa=
813278ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/media_tests'
> gcc -I../ -I../../../../usr/include/    media_device_test.c  -o /usr/src/=
perf_selftests-x86_64-rhel-7.2-cdaa813278ddc616ee201eacda77f63996b5dd2d/too=
ls/testing/selftests/media_tests/media_device_test
> gcc -I../ -I../../../../usr/include/    media_device_open.c  -o /usr/src/=
perf_selftests-x86_64-rhel-7.2-cdaa813278ddc616ee201eacda77f63996b5dd2d/too=
ls/testing/selftests/media_tests/media_device_open
> gcc -I../ -I../../../../usr/include/    video_device_test.c  -o /usr/src/=
perf_selftests-x86_64-rhel-7.2-cdaa813278ddc616ee201eacda77f63996b5dd2d/too=
ls/testing/selftests/media_tests/video_device_test
> make[1]: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa8=
13278ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/media_tests'
> ignored_by_lkp media_tests test
> =

> 2019-02-19 00:14:40 make run_tests -C membarrier
> make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813=
278ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/membarrier'
> gcc -g -I../../../../usr/include/    membarrier_test.c  -o /usr/src/perf_=
selftests-x86_64-rhel-7.2-cdaa813278ddc616ee201eacda77f63996b5dd2d/tools/te=
sting/selftests/membarrier/membarrier_test
> TAP version 13
> selftests: membarrier: membarrier_test
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ok 1 sys_membarrier available
> ok 2 sys membarrier invalid command test: command =3D -1, flags =3D 0, er=
rno =3D 22. Failed as expected
> ok 3 sys membarrier MEMBARRIER_CMD_QUERY invalid flags test: flags =3D 1,=
 errno =3D 22. Failed as expected
> ok 4 sys membarrier MEMBARRIER_CMD_GLOBAL test: flags =3D 0
> ok 5 sys membarrier MEMBARRIER_CMD_PRIVATE_EXPEDITED not registered failu=
re test: flags =3D 0, errno =3D 1
> ok 6 sys membarrier MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED test: flags=
 =3D 0
> ok 7 sys membarrier MEMBARRIER_CMD_PRIVATE_EXPEDITED test: flags =3D 0
> ok 8 sys membarrier MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE not regist=
ered failure test: flags =3D 0, errno =3D 1
> ok 9 sys membarrier MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED_SYNC_CORE t=
est: flags =3D 0
> ok 10 sys membarrier MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE test: fla=
gs =3D 0
> ok 11 sys membarrier MEMBARRIER_CMD_GLOBAL_EXPEDITED test: flags =3D 0
> ok 12 sys membarrier MEMBARRIER_CMD_REGISTER_GLOBAL_EXPEDITED test: flags=
 =3D 0
> ok 13 sys membarrier MEMBARRIER_CMD_GLOBAL_EXPEDITED test: flags =3D 0
> Pass 13 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
> 1..13
> ok 1..1 selftests: membarrier: membarrier_test [PASS]
> make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa8132=
78ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/membarrier'
> =

> 2019-02-19 00:14:40 make run_tests -C memfd
> make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813=
278ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/memfd'
> gcc -D_FILE_OFFSET_BITS=3D64 -I../../../../include/uapi/ -I../../../../in=
clude/ -I../../../../usr/include/   -c -o common.o common.c
> gcc -D_FILE_OFFSET_BITS=3D64 -I../../../../include/uapi/ -I../../../../in=
clude/ -I../../../../usr/include/    memfd_test.c common.o  -o /usr/src/per=
f_selftests-x86_64-rhel-7.2-cdaa813278ddc616ee201eacda77f63996b5dd2d/tools/=
testing/selftests/memfd/memfd_test
> memfd_test.c: In function =E2=80=98mfd_assert_get_seals=E2=80=99:
> memfd_test.c:74:6: warning: implicit declaration of function =E2=80=98fcn=
tl=E2=80=99 [-Wimplicit-function-declaration]
>    r =3D fcntl(fd, F_GET_SEALS);
>        ^~~~~
> memfd_test.c: In function =E2=80=98mfd_assert_open=E2=80=99:
> memfd_test.c:197:6: warning: implicit declaration of function =E2=80=98op=
en=E2=80=99 [-Wimplicit-function-declaration]
>    r =3D open(buf, flags, mode);
>        ^~~~
> memfd_test.c: In function =E2=80=98mfd_assert_write=E2=80=99:
> memfd_test.c:328:6: warning: implicit declaration of function =E2=80=98fa=
llocate=E2=80=99 [-Wimplicit-function-declaration]
>    r =3D fallocate(fd,
>        ^~~~~~~~~
> gcc -D_FILE_OFFSET_BITS=3D64 -I../../../../include/uapi/ -I../../../../in=
clude/ -I../../../../usr/include/    fuse_mnt.c -lfuse -pthread -o /usr/src=
/perf_selftests-x86_64-rhel-7.2-cdaa813278ddc616ee201eacda77f63996b5dd2d/to=
ols/testing/selftests/memfd/fuse_mnt
> gcc -D_FILE_OFFSET_BITS=3D64 -I../../../../include/uapi/ -I../../../../in=
clude/ -I../../../../usr/include/    fuse_test.c common.o  -o /usr/src/perf=
_selftests-x86_64-rhel-7.2-cdaa813278ddc616ee201eacda77f63996b5dd2d/tools/t=
esting/selftests/memfd/fuse_test
> fuse_test.c: In function =E2=80=98mfd_assert_get_seals=E2=80=99:
> fuse_test.c:67:6: warning: implicit declaration of function =E2=80=98fcnt=
l=E2=80=99 [-Wimplicit-function-declaration]
>    r =3D fcntl(fd, F_GET_SEALS);
>        ^~~~~
> fuse_test.c: In function =E2=80=98main=E2=80=99:
> fuse_test.c:261:7: warning: implicit declaration of function =E2=80=98ope=
n=E2=80=99 [-Wimplicit-function-declaration]
>    fd =3D open(argv[1], O_RDONLY | O_CLOEXEC);
>         ^~~~
> TAP version 13
> selftests: memfd: memfd_test
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> memfd: CREATE
> memfd: BASIC
> memfd: SEAL-WRITE
> memfd: SEAL-SHRINK
> memfd: SEAL-GROW
> memfd: SEAL-RESIZE
> memfd: SHARE-DUP
> memfd: SHARE-MMAP
> memfd: SHARE-OPEN
> memfd: SHARE-FORK
> memfd: SHARE-DUP (shared file-table)
> memfd: SHARE-MMAP (shared file-table)
> memfd: SHARE-OPEN (shared file-table)
> memfd: SHARE-FORK (shared file-table)
> memfd: DONE
> ok 1..1 selftests: memfd: memfd_test [PASS]
> selftests: memfd: run_fuse_test.sh
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Aborted
> not ok 1..2 selftests: memfd: run_fuse_test.sh [FAIL]
> selftests: memfd: run_hugetlbfs_test.sh
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> memfd-hugetlb: CREATE
> memfd-hugetlb: BASIC
> memfd-hugetlb: SEAL-WRITE
> memfd-hugetlb: SEAL-SHRINK
> memfd-hugetlb: SEAL-GROW
> memfd-hugetlb: SEAL-RESIZE
> memfd-hugetlb: SHARE-DUP
> memfd-hugetlb: SHARE-MMAP
> memfd-hugetlb: SHARE-OPEN
> memfd-hugetlb: SHARE-FORK
> memfd-hugetlb: SHARE-DUP (shared file-table)
> memfd-hugetlb: SHARE-MMAP (shared file-table)
> memfd-hugetlb: SHARE-OPEN (shared file-table)
> memfd-hugetlb: SHARE-FORK (shared file-table)
> memfd: DONE
> opening: ./mnt/memfd
> fuse: DONE
> ok 1..3 selftests: memfd: run_hugetlbfs_test.sh [PASS]
> make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa8132=
78ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/memfd'
> =

> 2019-02-19 00:14:44 make run_tests -C memory-hotplug
> make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813=
278ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/memory-hotplug'
> TAP version 13
> selftests: memory-hotplug: mem-on-off-test.sh
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Test scope: 2% hotplug memory
> 	 online all hot-pluggable memory in offline state:
> 		 SKIPPED - no hot-pluggable memory in offline state
> 	 offline 2% hot-pluggable memory in online state
> 	 trying to offline 1 out of 14 memory block(s):
> online->offline memory1
> 	 online all hot-pluggable memory in offline state:
> offline->online memory1
> 	 Test with memory notifier error injection
> ok 1..1 selftests: memory-hotplug: mem-on-off-test.sh [PASS]
> make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa8132=
78ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/memory-hotplug'
> =

> 2019-02-19 00:14:45 make run_tests -C mount
> make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813=
278ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/mount'
> gcc -Wall -O2    unprivileged-remount-test.c  -o /usr/src/perf_selftests-=
x86_64-rhel-7.2-cdaa813278ddc616ee201eacda77f63996b5dd2d/tools/testing/self=
tests/mount/unprivileged-remount-test
> TAP version 13
> selftests: mount: run_tests.sh
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ok 1..1 selftests: mount: run_tests.sh [PASS]
> make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa8132=
78ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/mount'
> =

> 2019-02-19 00:14:46 make run_tests -C mqueue
> make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813=
278ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/mqueue'
> gcc -O2    mq_open_tests.c -lrt -lpthread -lpopt -o /usr/src/perf_selftes=
ts-x86_64-rhel-7.2-cdaa813278ddc616ee201eacda77f63996b5dd2d/tools/testing/s=
elftests/mqueue/mq_open_tests
> gcc -O2    mq_perf_tests.c -lrt -lpthread -lpopt -o /usr/src/perf_selftes=
ts-x86_64-rhel-7.2-cdaa813278ddc616ee201eacda77f63996b5dd2d/tools/testing/s=
elftests/mqueue/mq_perf_tests
> TAP version 13
> selftests: mqueue: mq_open_tests
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Using Default queue path - /test1
> =

> Initial system state:
> 	Using queue path:		/test1
> 	RLIMIT_MSGQUEUE(soft):		819200
> 	RLIMIT_MSGQUEUE(hard):		819200
> 	Maximum Message Size:		8192
> 	Maximum Queue Size:		10
> 	Default Message Size:		8192
> 	Default Queue Size:		10
> =

> Adjusted system state for testing:
> 	RLIMIT_MSGQUEUE(soft):		819200
> 	RLIMIT_MSGQUEUE(hard):		819200
> 	Maximum Message Size:		8192
> 	Maximum Queue Size:		10
> 	Default Message Size:		8192
> 	Default Queue Size:		10
> =

> =

> Test series 1, behavior when no attr struct passed to mq_open:
> Kernel supports setting defaults separately from maximums:		PASS
> Given sane values, mq_open without an attr struct succeeds:		PASS
> Kernel properly honors default setting knobs:				PASS
> Kernel properly limits default values to lesser of default/max:		PASS
> Kernel properly fails to create queue when defaults would
> exceed rlimit:								PASS
> =

> =

> Test series 2, behavior when attr struct is passed to mq_open:
> Queue open in excess of rlimit max when euid =3D 0 failed:		PASS
> Queue open with mq_maxmsg > limit when euid =3D 0 succeeded:		PASS
> Queue open with mq_msgsize > limit when euid =3D 0 succeeded:		PASS
> Queue open with total size > 2GB when euid =3D 0 failed:			PASS
> Queue open in excess of rlimit max when euid =3D 99 failed:		PASS
> Queue open with mq_maxmsg > limit when euid =3D 99 failed:		PASS
> Queue open with mq_msgsize > limit when euid =3D 99 failed:		PASS
> Queue open with total size > 2GB when euid =3D 99 failed:			PASS
> ok 1..1 selftests: mqueue: mq_open_tests [PASS]
> selftests: mqueue: mq_perf_tests
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =

> Initial system state:
> 	Using queue path:			/mq_perf_tests
> 	RLIMIT_MSGQUEUE(soft):			819200
> 	RLIMIT_MSGQUEUE(hard):			819200
> 	Maximum Message Size:			8192
> 	Maximum Queue Size:			10
> 	Nice value:				0
> =

> Adjusted system state for testing:
> 	RLIMIT_MSGQUEUE(soft):			(unlimited)
> 	RLIMIT_MSGQUEUE(hard):			(unlimited)
> 	Maximum Message Size:			16777216
> 	Maximum Queue Size:			65530
> 	Nice value:				-20
> 	Continuous mode:			(disabled)
> 	CPUs to pin:				1
> =

> 	Queue /mq_perf_tests created:
> 		mq_flags:			O_NONBLOCK
> 		mq_maxmsg:			65530
> 		mq_msgsize:			16
> 		mq_curmsgs:			0
> =

> 	Started mqueue performance test thread on CPU 1
> 		Max priorities:			32768
> 		Clock resolution:		1 nsec
> =

> 	Test #1: Time send/recv message, queue empty
> 		(10000000 iterations)
> 		Send msg:			20.769811987s total time
> 						2076 nsec/msg
> 		Recv msg:			21.57018776s total time
> 						2105 nsec/msg
> =

> 	Test #2a: Time send/recv message, queue full, constant prio
> :
> 		(100000 iterations)
> 		Filling queue...done.		0.69102850s
> 		Testing...done.
> 		Send msg:			0.207365476s total time
> 						2073 nsec/msg
> 		Recv msg:			0.208501734s total time
> 						2085 nsec/msg
> 		Draining queue...done.		0.68079024s
> =

> 	Test #2b: Time send/recv message, queue full, increasing prio
> :
> 		(100000 iterations)
> 		Filling queue...done.		0.86926345s
> 		Testing...done.
> 		Send msg:			0.234621580s total time
> 						2346 nsec/msg
> 		Recv msg:			0.223862917s total time
> 						2238 nsec/msg
> 		Draining queue...done.		0.72429194s
> =

> 	Test #2c: Time send/recv message, queue full, decreasing prio
> :
> 		(100000 iterations)
> 		Filling queue...done.		0.85459740s
> 		Testing...done.
> 		Send msg:			0.238305053s total time
> 						2383 nsec/msg
> 		Recv msg:			0.223585734s total time
> 						2235 nsec/msg
> 		Draining queue...done.		0.78872582s
> =

> 	Test #2d: Time send/recv message, queue full, random prio
> :
> 		(100000 iterations)
> 		Filling queue...done.		0.91103960s
> 		Testing...done.
> 		Send msg:			0.238946474s total time
> 						2389 nsec/msg
> 		Recv msg:			0.217763880s total time
> 						2177 nsec/msg
> 		Draining queue...done.		0.77818648s
> ok 1..2 selftests: mqueue: mq_perf_tests [PASS]
> make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa8132=
78ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/mqueue'
> =

> 2019-02-19 00:15:43 make run_tests -C net
> make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813=
278ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/net'
> make ARCH=3Dx86 -C ../../../.. headers_install
> make[1]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa=
813278ddc616ee201eacda77f63996b5dd2d'
>    HOSTCC  scripts/basic/fixdep
>    WRAP    arch/x86/include/generated/uapi/asm/bpf_perf_event.h
>    WRAP    arch/x86/include/generated/uapi/asm/poll.h
>    SYSTBL  arch/x86/include/generated/asm/syscalls_32.h
>    SYSHDR  arch/x86/include/generated/uapi/asm/unistd_32.h
>    SYSHDR  arch/x86/include/generated/uapi/asm/unistd_64.h
>    SYSHDR  arch/x86/include/generated/uapi/asm/unistd_x32.h
>    HOSTCC  arch/x86/tools/relocs_32.o
>    HOSTCC  arch/x86/tools/relocs_64.o
>    HOSTCC  arch/x86/tools/relocs_common.o
>    HOSTLD  arch/x86/tools/relocs
>    UPD     include/generated/uapi/linux/version.h
>    HOSTCC  scripts/unifdef
>    INSTALL usr/include/asm-generic/ (37 files)
>    INSTALL usr/include/drm/ (26 files)
>    INSTALL usr/include/linux/ (503 files)
>    INSTALL usr/include/linux/android/ (2 files)
>    INSTALL usr/include/linux/byteorder/ (2 files)
>    INSTALL usr/include/linux/caif/ (2 files)
>    INSTALL usr/include/linux/can/ (6 files)
>    INSTALL usr/include/linux/cifs/ (1 file)
>    INSTALL usr/include/linux/dvb/ (8 files)
>    INSTALL usr/include/linux/genwqe/ (1 file)
>    INSTALL usr/include/linux/hdlc/ (1 file)
>    INSTALL usr/include/linux/hsi/ (2 files)
>    INSTALL usr/include/linux/iio/ (2 files)
>    INSTALL usr/include/linux/isdn/ (1 file)
>    INSTALL usr/include/linux/mmc/ (1 file)
>    INSTALL usr/include/linux/netfilter/ (88 files)
>    INSTALL usr/include/linux/netfilter/ipset/ (4 files)
>    INSTALL usr/include/linux/netfilter_arp/ (2 files)
>    INSTALL usr/include/linux/netfilter_bridge/ (17 files)
>    INSTALL usr/include/linux/netfilter_ipv4/ (9 files)
>    INSTALL usr/include/linux/netfilter_ipv6/ (13 files)
>    INSTALL usr/include/linux/nfsd/ (5 files)
>    INSTALL usr/include/linux/raid/ (2 files)
>    INSTALL usr/include/linux/sched/ (1 file)
>    INSTALL usr/include/linux/spi/ (1 file)
>    INSTALL usr/include/linux/sunrpc/ (1 file)
>    INSTALL usr/include/linux/tc_act/ (15 files)
>    INSTALL usr/include/linux/tc_ematch/ (5 files)
>    INSTALL usr/include/linux/usb/ (13 files)
>    INSTALL usr/include/linux/wimax/ (1 file)
>    INSTALL usr/include/misc/ (2 files)
>    INSTALL usr/include/mtd/ (5 files)
>    INSTALL usr/include/rdma/ (25 files)
>    INSTALL usr/include/rdma/hfi/ (2 files)
>    INSTALL usr/include/scsi/ (5 files)
>    INSTALL usr/include/scsi/fc/ (4 files)
>    INSTALL usr/include/sound/ (16 files)
>    INSTALL usr/include/video/ (3 files)
>    INSTALL usr/include/xen/ (4 files)
>    INSTALL usr/include/asm/ (62 files)
> make[1]: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa8=
13278ddc616ee201eacda77f63996b5dd2d'
> gcc -Wall -Wl,--no-as-needed -O2 -g -I../../../../usr/include/    reusepo=
rt_bpf.c  -o /usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813278ddc616ee201e=
acda77f63996b5dd2d/tools/testing/selftests/net/reuseport_bpf
> gcc -Wall -Wl,--no-as-needed -O2 -g -I../../../../usr/include/    reusepo=
rt_bpf_cpu.c  -o /usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813278ddc616ee=
201eacda77f63996b5dd2d/tools/testing/selftests/net/reuseport_bpf_cpu
> gcc -Wall -Wl,--no-as-needed -O2 -g -I../../../../usr/include/  -lnuma  r=
euseport_bpf_numa.c  -o /usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813278d=
dc616ee201eacda77f63996b5dd2d/tools/testing/selftests/net/reuseport_bpf_numa
> gcc -Wall -Wl,--no-as-needed -O2 -g -I../../../../usr/include/    reusepo=
rt_dualstack.c  -o /usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813278ddc616=
ee201eacda77f63996b5dd2d/tools/testing/selftests/net/reuseport_dualstack
> gcc -Wall -Wl,--no-as-needed -O2 -g -I../../../../usr/include/    reusead=
dr_conflict.c  -o /usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813278ddc616e=
e201eacda77f63996b5dd2d/tools/testing/selftests/net/reuseaddr_conflict
> gcc -Wall -Wl,--no-as-needed -O2 -g -I../../../../usr/include/    tls.c  =
-o /usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813278ddc616ee201eacda77f639=
96b5dd2d/tools/testing/selftests/net/tls
> gcc -Wall -Wl,--no-as-needed -O2 -g -I../../../../usr/include/    socket.=
c  -o /usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813278ddc616ee201eacda77f=
63996b5dd2d/tools/testing/selftests/net/socket
> gcc -Wall -Wl,--no-as-needed -O2 -g -I../../../../usr/include/    psock_f=
anout.c  -o /usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813278ddc616ee201ea=
cda77f63996b5dd2d/tools/testing/selftests/net/psock_fanout
> gcc -Wall -Wl,--no-as-needed -O2 -g -I../../../../usr/include/    psock_t=
packet.c  -o /usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813278ddc616ee201e=
acda77f63996b5dd2d/tools/testing/selftests/net/psock_tpacket
> gcc -Wall -Wl,--no-as-needed -O2 -g -I../../../../usr/include/    msg_zer=
ocopy.c  -o /usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813278ddc616ee201ea=
cda77f63996b5dd2d/tools/testing/selftests/net/msg_zerocopy
> gcc -Wall -Wl,--no-as-needed -O2 -g -I../../../../usr/include/    reusepo=
rt_addr_any.c  -o /usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813278ddc616e=
e201eacda77f63996b5dd2d/tools/testing/selftests/net/reuseport_addr_any
> gcc -Wall -Wl,--no-as-needed -O2 -g -I../../../../usr/include/  -lpthread=
  tcp_mmap.c  -o /usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813278ddc616ee=
201eacda77f63996b5dd2d/tools/testing/selftests/net/tcp_mmap
> gcc -Wall -Wl,--no-as-needed -O2 -g -I../../../../usr/include/  -lpthread=
  tcp_inq.c  -o /usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813278ddc616ee2=
01eacda77f63996b5dd2d/tools/testing/selftests/net/tcp_inq
> tcp_inq.c: In function =E2=80=98main=E2=80=99:
> tcp_inq.c:178:4: warning: dereferencing type-punned pointer will break st=
rict-aliasing rules [-Wstrict-aliasing]
>      inq =3D *((int *) CMSG_DATA(cm));
>      ^~~
> gcc -Wall -Wl,--no-as-needed -O2 -g -I../../../../usr/include/    psock_s=
nd.c  -o /usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813278ddc616ee201eacda=
77f63996b5dd2d/tools/testing/selftests/net/psock_snd
> gcc -Wall -Wl,--no-as-needed -O2 -g -I../../../../usr/include/    txring_=
overwrite.c  -o /usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813278ddc616ee2=
01eacda77f63996b5dd2d/tools/testing/selftests/net/txring_overwrite
> gcc -Wall -Wl,--no-as-needed -O2 -g -I../../../../usr/include/    udpgso.=
c  -o /usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813278ddc616ee201eacda77f=
63996b5dd2d/tools/testing/selftests/net/udpgso
> udpgso.c: In function =E2=80=98send_one=E2=80=99:
> udpgso.c:484:3: warning: dereferencing type-punned pointer will break str=
ict-aliasing rules [-Wstrict-aliasing]
>     *((uint16_t *) CMSG_DATA(cm)) =3D gso_len;
>     ^
> gcc -Wall -Wl,--no-as-needed -O2 -g -I../../../../usr/include/    udpgso_=
bench_tx.c  -o /usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813278ddc616ee20=
1eacda77f63996b5dd2d/tools/testing/selftests/net/udpgso_bench_tx
> gcc -Wall -Wl,--no-as-needed -O2 -g -I../../../../usr/include/    udpgso_=
bench_rx.c  -o /usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813278ddc616ee20=
1eacda77f63996b5dd2d/tools/testing/selftests/net/udpgso_bench_rx
> gcc -Wall -Wl,--no-as-needed -O2 -g -I../../../../usr/include/    ip_defr=
ag.c  -o /usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813278ddc616ee201eacda=
77f63996b5dd2d/tools/testing/selftests/net/ip_defrag
> TAP version 13
> selftests: net: reuseport_bpf
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- IPv4 UDP ----
> Testing EBPF mod 10...
> Socket 0: 0
> Socket 1: 1
> Socket 2: 2
> Socket 3: 3
> Socket 4: 4
> Socket 5: 5
> Socket 6: 6
> Socket 7: 7
> Socket 8: 8
> Socket 9: 9
> Socket 0: 10
> Socket 1: 11
> Socket 2: 12
> Socket 3: 13
> Socket 4: 14
> Socket 5: 15
> Socket 6: 16
> Socket 7: 17
> Socket 8: 18
> Socket 9: 19
> Reprograming, testing mod 5...
> Socket 0: 0
> Socket 1: 1
> Socket 2: 2
> Socket 3: 3
> Socket 4: 4
> Socket 0: 5
> Socket 1: 6
> Socket 2: 7
> Socket 3: 8
> Socket 4: 9
> Socket 0: 10
> Socket 1: 11
> Socket 2: 12
> Socket 3: 13
> Socket 4: 14
> Socket 0: 15
> Socket 1: 16
> Socket 2: 17
> Socket 3: 18
> Socket 4: 19
> Testing EBPF mod 20...
> Socket 0: 0
> Socket 1: 1
> Socket 2: 2
> Socket 3: 3
> Socket 4: 4
> Socket 5: 5
> Socket 6: 6
> Socket 7: 7
> Socket 8: 8
> Socket 9: 9
> Socket 10: 10
> Socket 11: 11
> Socket 12: 12
> Socket 13: 13
> Socket 14: 14
> Socket 15: 15
> Socket 16: 16
> Socket 17: 17
> Socket 18: 18
> Socket 19: 19
> Socket 0: 20
> Socket 1: 21
> Socket 2: 22
> Socket 3: 23
> Socket 4: 24
> Socket 5: 25
> Socket 6: 26
> Socket 7: 27
> Socket 8: 28
> Socket 9: 29
> Socket 10: 30
> Socket 11: 31
> Socket 12: 32
> Socket 13: 33
> Socket 14: 34
> Socket 15: 35
> Socket 16: 36
> Socket 17: 37
> Socket 18: 38
> Socket 19: 39
> Reprograming, testing mod 10...
> Socket 0: 0
> Socket 1: 1
> Socket 2: 2
> Socket 3: 3
> Socket 4: 4
> Socket 5: 5
> Socket 6: 6
> Socket 7: 7
> Socket 8: 8
> Socket 9: 9
> Socket 0: 10
> Socket 1: 11
> Socket 2: 12
> Socket 3: 13
> Socket 4: 14
> Socket 5: 15
> Socket 6: 16
> Socket 7: 17
> Socket 8: 18
> Socket 9: 19
> Socket 0: 20
> Socket 1: 21
> Socket 2: 22
> Socket 3: 23
> Socket 4: 24
> Socket 5: 25
> Socket 6: 26
> Socket 7: 27
> Socket 8: 28
> Socket 9: 29
> Socket 0: 30
> Socket 1: 31
> Socket 2: 32
> Socket 3: 33
> Socket 4: 34
> Socket 5: 35
> Socket 6: 36
> Socket 7: 37
> Socket 8: 38
> Socket 9: 39
> Testing CBPF mod 10...
> Socket 0: 0
> Socket 1: 1
> Socket 2: 2
> Socket 3: 3
> Socket 4: 4
> Socket 5: 5
> Socket 6: 6
> Socket 7: 7
> Socket 8: 8
> Socket 9: 9
> Socket 0: 10
> Socket 1: 11
> Socket 2: 12
> Socket 3: 13
> Socket 4: 14
> Socket 5: 15
> Socket 6: 16
> Socket 7: 17
> Socket 8: 18
> Socket 9: 19
> Reprograming, testing mod 5...
> Socket 0: 0
> Socket 1: 1
> Socket 2: 2
> Socket 3: 3
> Socket 4: 4
> Socket 0: 5
> Socket 1: 6
> Socket 2: 7
> Socket 3: 8
> Socket 4: 9
> Socket 0: 10
> Socket 1: 11
> Socket 2: 12
> Socket 3: 13
> Socket 4: 14
> Socket 0: 15
> Socket 1: 16
> Socket 2: 17
> Socket 3: 18
> Socket 4: 19
> Testing CBPF mod 20...
> Socket 0: 0
> Socket 1: 1
> Socket 2: 2
> Socket 3: 3
> Socket 4: 4
> Socket 5: 5
> Socket 6: 6
> Socket 7: 7
> Socket 8: 8
> Socket 9: 9
> Socket 10: 10
> Socket 11: 11
> Socket 12: 12
> Socket 13: 13
> Socket 14: 14
> Socket 15: 15
> Socket 16: 16
> Socket 17: 17
> Socket 18: 18
> Socket 19: 19
> Socket 0: 20
> Socket 1: 21
> Socket 2: 22
> Socket 3: 23
> Socket 4: 24
> Socket 5: 25
> Socket 6: 26
> Socket 7: 27
> Socket 8: 28
> Socket 9: 29
> Socket 10: 30
> Socket 11: 31
> Socket 12: 32
> Socket 13: 33
> Socket 14: 34
> Socket 15: 35
> Socket 16: 36
> Socket 17: 37
> Socket 18: 38
> Socket 19: 39
> Reprograming, testing mod 10...
> Socket 0: 0
> Socket 1: 1
> Socket 2: 2
> Socket 3: 3
> Socket 4: 4
> Socket 5: 5
> Socket 6: 6
> Socket 7: 7
> Socket 8: 8
> Socket 9: 9
> Socket 0: 10
> Socket 1: 11
> Socket 2: 12
> Socket 3: 13
> Socket 4: 14
> Socket 5: 15
> Socket 6: 16
> Socket 7: 17
> Socket 8: 18
> Socket 9: 19
> Socket 0: 20
> Socket 1: 21
> Socket 2: 22
> Socket 3: 23
> Socket 4: 24
> Socket 5: 25
> Socket 6: 26
> Socket 7: 27
> Socket 8: 28
> Socket 9: 29
> Socket 0: 30
> Socket 1: 31
> Socket 2: 32
> Socket 3: 33
> Socket 4: 34
> Socket 5: 35
> Socket 6: 36
> Socket 7: 37
> Socket 8: 38
> Socket 9: 39
> Testing too many filters...
> Testing filters on non-SO_REUSEPORT socket...
> ---- IPv6 UDP ----
> Testing EBPF mod 10...
> Socket 0: 0
> Socket 1: 1
> Socket 2: 2
> Socket 3: 3
> Socket 4: 4
> Socket 5: 5
> Socket 6: 6
> Socket 7: 7
> Socket 8: 8
> Socket 9: 9
> Socket 0: 10
> Socket 1: 11
> Socket 2: 12
> Socket 3: 13
> Socket 4: 14
> Socket 5: 15
> Socket 6: 16
> Socket 7: 17
> Socket 8: 18
> Socket 9: 19
> Reprograming, testing mod 5...
> Socket 0: 0
> Socket 1: 1
> Socket 2: 2
> Socket 3: 3
> Socket 4: 4
> Socket 0: 5
> Socket 1: 6
> Socket 2: 7
> Socket 3: 8
> Socket 4: 9
> Socket 0: 10
> Socket 1: 11
> Socket 2: 12
> Socket 3: 13
> Socket 4: 14
> Socket 0: 15
> Socket 1: 16
> Socket 2: 17
> Socket 3: 18
> Socket 4: 19
> Testing EBPF mod 20...
> Socket 0: 0
> Socket 1: 1
> Socket 2: 2
> Socket 3: 3
> Socket 4: 4
> Socket 5: 5
> Socket 6: 6
> Socket 7: 7
> Socket 8: 8
> Socket 9: 9
> Socket 10: 10
> Socket 11: 11
> Socket 12: 12
> Socket 13: 13
> Socket 14: 14
> Socket 15: 15
> Socket 16: 16
> Socket 17: 17
> Socket 18: 18
> Socket 19: 19
> Socket 0: 20
> Socket 1: 21
> Socket 2: 22
> Socket 3: 23
> Socket 4: 24
> Socket 5: 25
> Socket 6: 26
> Socket 7: 27
> Socket 8: 28
> Socket 9: 29
> Socket 10: 30
> Socket 11: 31
> Socket 12: 32
> Socket 13: 33
> Socket 14: 34
> Socket 15: 35
> Socket 16: 36
> Socket 17: 37
> Socket 18: 38
> Socket 19: 39
> Reprograming, testing mod 10...
> Socket 0: 0
> Socket 1: 1
> Socket 2: 2
> Socket 3: 3
> Socket 4: 4
> Socket 5: 5
> Socket 6: 6
> Socket 7: 7
> Socket 8: 8
> Socket 9: 9
> Socket 0: 10
> Socket 1: 11
> Socket 2: 12
> Socket 3: 13
> Socket 4: 14
> Socket 5: 15
> Socket 6: 16
> Socket 7: 17
> Socket 8: 18
> Socket 9: 19
> Socket 0: 20
> Socket 1: 21
> Socket 2: 22
> Socket 3: 23
> Socket 4: 24
> Socket 5: 25
> Socket 6: 26
> Socket 7: 27
> Socket 8: 28
> Socket 9: 29
> Socket 0: 30
> Socket 1: 31
> Socket 2: 32
> Socket 3: 33
> Socket 4: 34
> Socket 5: 35
> Socket 6: 36
> Socket 7: 37
> Socket 8: 38
> Socket 9: 39
> Testing CBPF mod 10...
> Socket 0: 0
> Socket 1: 1
> Socket 2: 2
> Socket 3: 3
> Socket 4: 4
> Socket 5: 5
> Socket 6: 6
> Socket 7: 7
> Socket 8: 8
> Socket 9: 9
> Socket 0: 10
> Socket 1: 11
> Socket 2: 12
> Socket 3: 13
> Socket 4: 14
> Socket 5: 15
> Socket 6: 16
> Socket 7: 17
> Socket 8: 18
> Socket 9: 19
> Reprograming, testing mod 5...
> Socket 0: 0
> Socket 1: 1
> Socket 2: 2
> Socket 3: 3
> Socket 4: 4
> Socket 0: 5
> Socket 1: 6
> Socket 2: 7
> Socket 3: 8
> Socket 4: 9
> Socket 0: 10
> Socket 1: 11
> Socket 2: 12
> Socket 3: 13
> Socket 4: 14
> Socket 0: 15
> Socket 1: 16
> Socket 2: 17
> Socket 3: 18
> Socket 4: 19
> Testing CBPF mod 20...
> Socket 0: 0
> Socket 1: 1
> Socket 2: 2
> Socket 3: 3
> Socket 4: 4
> Socket 5: 5
> Socket 6: 6
> Socket 7: 7
> Socket 8: 8
> Socket 9: 9
> Socket 10: 10
> Socket 11: 11
> Socket 12: 12
> Socket 13: 13
> Socket 14: 14
> Socket 15: 15
> Socket 16: 16
> Socket 17: 17
> Socket 18: 18
> Socket 19: 19
> Socket 0: 20
> Socket 1: 21
> Socket 2: 22
> Socket 3: 23
> Socket 4: 24
> Socket 5: 25
> Socket 6: 26
> Socket 7: 27
> Socket 8: 28
> Socket 9: 29
> Socket 10: 30
> Socket 11: 31
> Socket 12: 32
> Socket 13: 33
> Socket 14: 34
> Socket 15: 35
> Socket 16: 36
> Socket 17: 37
> Socket 18: 38
> Socket 19: 39
> Reprograming, testing mod 10...
> Socket 0: 0
> Socket 1: 1
> Socket 2: 2
> Socket 3: 3
> Socket 4: 4
> Socket 5: 5
> Socket 6: 6
> Socket 7: 7
> Socket 8: 8
> Socket 9: 9
> Socket 0: 10
> Socket 1: 11
> Socket 2: 12
> Socket 3: 13
> Socket 4: 14
> Socket 5: 15
> Socket 6: 16
> Socket 7: 17
> Socket 8: 18
> Socket 9: 19
> Socket 0: 20
> Socket 1: 21
> Socket 2: 22
> Socket 3: 23
> Socket 4: 24
> Socket 5: 25
> Socket 6: 26
> Socket 7: 27
> Socket 8: 28
> Socket 9: 29
> Socket 0: 30
> Socket 1: 31
> Socket 2: 32
> Socket 3: 33
> Socket 4: 34
> Socket 5: 35
> Socket 6: 36
> Socket 7: 37
> Socket 8: 38
> Socket 9: 39
> Testing too many filters...
> Testing filters on non-SO_REUSEPORT socket...
> ---- IPv6 UDP w/ mapped IPv4 ----
> Testing EBPF mod 20...
> Socket 0: 0
> Socket 1: 1
> Socket 2: 2
> Socket 3: 3
> Socket 4: 4
> Socket 5: 5
> Socket 6: 6
> Socket 7: 7
> Socket 8: 8
> Socket 9: 9
> Socket 10: 10
> Socket 11: 11
> Socket 12: 12
> Socket 13: 13
> Socket 14: 14
> Socket 15: 15
> Socket 16: 16
> Socket 17: 17
> Socket 18: 18
> Socket 19: 19
> Socket 0: 20
> Socket 1: 21
> Socket 2: 22
> Socket 3: 23
> Socket 4: 24
> Socket 5: 25
> Socket 6: 26
> Socket 7: 27
> Socket 8: 28
> Socket 9: 29
> Socket 10: 30
> Socket 11: 31
> Socket 12: 32
> Socket 13: 33
> Socket 14: 34
> Socket 15: 35
> Socket 16: 36
> Socket 17: 37
> Socket 18: 38
> Socket 19: 39
> Reprograming, testing mod 10...
> Socket 0: 0
> Socket 1: 1
> Socket 2: 2
> Socket 3: 3
> Socket 4: 4
> Socket 5: 5
> Socket 6: 6
> Socket 7: 7
> Socket 8: 8
> Socket 9: 9
> Socket 0: 10
> Socket 1: 11
> Socket 2: 12
> Socket 3: 13
> Socket 4: 14
> Socket 5: 15
> Socket 6: 16
> Socket 7: 17
> Socket 8: 18
> Socket 9: 19
> Socket 0: 20
> Socket 1: 21
> Socket 2: 22
> Socket 3: 23
> Socket 4: 24
> Socket 5: 25
> Socket 6: 26
> Socket 7: 27
> Socket 8: 28
> Socket 9: 29
> Socket 0: 30
> Socket 1: 31
> Socket 2: 32
> Socket 3: 33
> Socket 4: 34
> Socket 5: 35
> Socket 6: 36
> Socket 7: 37
> Socket 8: 38
> Socket 9: 39
> Testing EBPF mod 10...
> Socket 0: 0
> Socket 1: 1
> Socket 2: 2
> Socket 3: 3
> Socket 4: 4
> Socket 5: 5
> Socket 6: 6
> Socket 7: 7
> Socket 8: 8
> Socket 9: 9
> Socket 0: 10
> Socket 1: 11
> Socket 2: 12
> Socket 3: 13
> Socket 4: 14
> Socket 5: 15
> Socket 6: 16
> Socket 7: 17
> Socket 8: 18
> Socket 9: 19
> Reprograming, testing mod 5...
> Socket 0: 0
> Socket 1: 1
> Socket 2: 2
> Socket 3: 3
> Socket 4: 4
> Socket 0: 5
> Socket 1: 6
> Socket 2: 7
> Socket 3: 8
> Socket 4: 9
> Socket 0: 10
> Socket 1: 11
> Socket 2: 12
> Socket 3: 13
> Socket 4: 14
> Socket 0: 15
> Socket 1: 16
> Socket 2: 17
> Socket 3: 18
> Socket 4: 19
> Testing CBPF mod 10...
> Socket 0: 0
> Socket 1: 1
> Socket 2: 2
> Socket 3: 3
> Socket 4: 4
> Socket 5: 5
> Socket 6: 6
> Socket 7: 7
> Socket 8: 8
> Socket 9: 9
> Socket 0: 10
> Socket 1: 11
> Socket 2: 12
> Socket 3: 13
> Socket 4: 14
> Socket 5: 15
> Socket 6: 16
> Socket 7: 17
> Socket 8: 18
> Socket 9: 19
> Reprograming, testing mod 5...
> Socket 0: 0
> Socket 1: 1
> Socket 2: 2
> Socket 3: 3
> Socket 4: 4
> Socket 0: 5
> Socket 1: 6
> Socket 2: 7
> Socket 3: 8
> Socket 4: 9
> Socket 0: 10
> Socket 1: 11
> Socket 2: 12
> Socket 3: 13
> Socket 4: 14
> Socket 0: 15
> Socket 1: 16
> Socket 2: 17
> Socket 3: 18
> Socket 4: 19
> Testing CBPF mod 20...
> Socket 0: 0
> Socket 1: 1
> Socket 2: 2
> Socket 3: 3
> Socket 4: 4
> Socket 5: 5
> Socket 6: 6
> Socket 7: 7
> Socket 8: 8
> Socket 9: 9
> Socket 10: 10
> Socket 11: 11
> Socket 12: 12
> Socket 13: 13
> Socket 14: 14
> Socket 15: 15
> Socket 16: 16
> Socket 17: 17
> Socket 18: 18
> Socket 19: 19
> Socket 0: 20
> Socket 1: 21
> Socket 2: 22
> Socket 3: 23
> Socket 4: 24
> Socket 5: 25
> Socket 6: 26
> Socket 7: 27
> Socket 8: 28
> Socket 9: 29
> Socket 10: 30
> Socket 11: 31
> Socket 12: 32
> Socket 13: 33
> Socket 14: 34
> Socket 15: 35
> Socket 16: 36
> Socket 17: 37
> Socket 18: 38
> Socket 19: 39
> Reprograming, testing mod 10...
> Socket 0: 0
> Socket 1: 1
> Socket 2: 2
> Socket 3: 3
> Socket 4: 4
> Socket 5: 5
> Socket 6: 6
> Socket 7: 7
> Socket 8: 8
> Socket 9: 9
> Socket 0: 10
> Socket 1: 11
> Socket 2: 12
> Socket 3: 13
> Socket 4: 14
> Socket 5: 15
> Socket 6: 16
> Socket 7: 17
> Socket 8: 18
> Socket 9: 19
> Socket 0: 20
> Socket 1: 21
> Socket 2: 22
> Socket 3: 23
> Socket 4: 24
> Socket 5: 25
> Socket 6: 26
> Socket 7: 27
> Socket 8: 28
> Socket 9: 29
> Socket 0: 30
> Socket 1: 31
> Socket 2: 32
> Socket 3: 33
> Socket 4: 34
> Socket 5: 35
> Socket 6: 36
> Socket 7: 37
> Socket 8: 38
> Socket 9: 39
> ---- IPv4 TCP ----
> Testing EBPF mod 10...
> Socket 0: 0
> Socket 1: 1
> Socket 2: 2
> Socket 3: 3
> Socket 4: 4
> Socket 5: 5
> Socket 6: 6
> Socket 7: 7
> Socket 8: 8
> Socket 9: 9
> Socket 0: 10
> Socket 1: 11
> Socket 2: 12
> Socket 3: 13
> Socket 4: 14
> Socket 5: 15
> Socket 6: 16
> Socket 7: 17
> Socket 8: 18
> Socket 9: 19
> Reprograming, testing mod 5...
> Socket 0: 0
> Socket 1: 1
> Socket 2: 2
> Socket 3: 3
> Socket 4: 4
> Socket 0: 5
> Socket 1: 6
> Socket 2: 7
> Socket 3: 8
> Socket 4: 9
> Socket 0: 10
> Socket 1: 11
> Socket 2: 12
> Socket 3: 13
> Socket 4: 14
> Socket 0: 15
> Socket 1: 16
> Socket 2: 17
> Socket 3: 18
> Socket 4: 19
> Testing CBPF mod 10...
> Socket 0: 0
> Socket 1: 1
> Socket 2: 2
> Socket 3: 3
> Socket 4: 4
> Socket 5: 5
> Socket 6: 6
> Socket 7: 7
> Socket 8: 8
> Socket 9: 9
> Socket 0: 10
> Socket 1: 11
> Socket 2: 12
> Socket 3: 13
> Socket 4: 14
> Socket 5: 15
> Socket 6: 16
> Socket 7: 17
> Socket 8: 18
> Socket 9: 19
> Reprograming, testing mod 5...
> Socket 0: 0
> Socket 1: 1
> Socket 2: 2
> Socket 3: 3
> Socket 4: 4
> Socket 0: 5
> Socket 1: 6
> Socket 2: 7
> Socket 3: 8
> Socket 4: 9
> Socket 0: 10
> Socket 1: 11
> Socket 2: 12
> Socket 3: 13
> Socket 4: 14
> Socket 0: 15
> Socket 1: 16
> Socket 2: 17
> Socket 3: 18
> Socket 4: 19
> Testing too many filters...
> Testing filters on non-SO_REUSEPORT socket...
> ---- IPv6 TCP ----
> Testing EBPF mod 10...
> Socket 0: 0
> Socket 1: 1
> Socket 2: 2
> Socket 3: 3
> Socket 4: 4
> Socket 5: 5
> Socket 6: 6
> Socket 7: 7
> Socket 8: 8
> Socket 9: 9
> Socket 0: 10
> Socket 1: 11
> Socket 2: 12
> Socket 3: 13
> Socket 4: 14
> Socket 5: 15
> Socket 6: 16
> Socket 7: 17
> Socket 8: 18
> Socket 9: 19
> Reprograming, testing mod 5...
> Socket 0: 0
> Socket 1: 1
> Socket 2: 2
> Socket 3: 3
> Socket 4: 4
> Socket 0: 5
> Socket 1: 6
> Socket 2: 7
> Socket 3: 8
> Socket 4: 9
> Socket 0: 10
> Socket 1: 11
> Socket 2: 12
> Socket 3: 13
> Socket 4: 14
> Socket 0: 15
> Socket 1: 16
> Socket 2: 17
> Socket 3: 18
> Socket 4: 19
> Testing CBPF mod 10...
> Socket 0: 0
> Socket 1: 1
> Socket 2: 2
> Socket 3: 3
> Socket 4: 4
> Socket 5: 5
> Socket 6: 6
> Socket 7: 7
> Socket 8: 8
> Socket 9: 9
> Socket 0: 10
> Socket 1: 11
> Socket 2: 12
> Socket 3: 13
> Socket 4: 14
> Socket 5: 15
> Socket 6: 16
> Socket 7: 17
> Socket 8: 18
> Socket 9: 19
> Reprograming, testing mod 5...
> Socket 0: 0
> Socket 1: 1
> Socket 2: 2
> Socket 3: 3
> Socket 4: 4
> Socket 0: 5
> Socket 1: 6
> Socket 2: 7
> Socket 3: 8
> Socket 4: 9
> Socket 0: 10
> Socket 1: 11
> Socket 2: 12
> Socket 3: 13
> Socket 4: 14
> Socket 0: 15
> Socket 1: 16
> Socket 2: 17
> Socket 3: 18
> Socket 4: 19
> Testing too many filters...
> Testing filters on non-SO_REUSEPORT socket...
> ---- IPv6 TCP w/ mapped IPv4 ----
> Testing EBPF mod 10...
> Socket 0: 0
> Socket 1: 1
> Socket 2: 2
> Socket 3: 3
> Socket 4: 4
> Socket 5: 5
> Socket 6: 6
> Socket 7: 7
> Socket 8: 8
> Socket 9: 9
> Socket 0: 10
> Socket 1: 11
> Socket 2: 12
> Socket 3: 13
> Socket 4: 14
> Socket 5: 15
> Socket 6: 16
> Socket 7: 17
> Socket 8: 18
> Socket 9: 19
> Reprograming, testing mod 5...
> Socket 0: 0
> Socket 1: 1
> Socket 2: 2
> Socket 3: 3
> Socket 4: 4
> Socket 0: 5
> Socket 1: 6
> Socket 2: 7
> Socket 3: 8
> Socket 4: 9
> Socket 0: 10
> Socket 1: 11
> Socket 2: 12
> Socket 3: 13
> Socket 4: 14
> Socket 0: 15
> Socket 1: 16
> Socket 2: 17
> Socket 3: 18
> Socket 4: 19
> Testing CBPF mod 10...
> Socket 0: 0
> Socket 1: 1
> Socket 2: 2
> Socket 3: 3
> Socket 4: 4
> Socket 5: 5
> Socket 6: 6
> Socket 7: 7
> Socket 8: 8
> Socket 9: 9
> Socket 0: 10
> Socket 1: 11
> Socket 2: 12
> Socket 3: 13
> Socket 4: 14
> Socket 5: 15
> Socket 6: 16
> Socket 7: 17
> Socket 8: 18
> Socket 9: 19
> Reprograming, testing mod 5...
> Socket 0: 0
> Socket 1: 1
> Socket 2: 2
> Socket 3: 3
> Socket 4: 4
> Socket 0: 5
> Socket 1: 6
> Socket 2: 7
> Socket 3: 8
> Socket 4: 9
> Socket 0: 10
> Socket 1: 11
> Socket 2: 12
> Socket 3: 13
> Socket 4: 14
> Socket 0: 15
> Socket 1: 16
> Socket 2: 17
> Socket 3: 18
> Socket 4: 19
> Testing filter add without bind...
> SUCCESS
> ok 1..1 selftests: net: reuseport_bpf [PASS]
> selftests: net: reuseport_bpf_cpu
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- IPv4 UDP ----
> send cpu 0, receive socket 0
> send cpu 1, receive socket 1
> send cpu 1, receive socket 1
> send cpu 0, receive socket 0
> send cpu 0, receive socket 0
> send cpu 1, receive socket 1
> ---- IPv6 UDP ----
> send cpu 0, receive socket 0
> send cpu 1, receive socket 1
> send cpu 1, receive socket 1
> send cpu 0, receive socket 0
> send cpu 0, receive socket 0
> send cpu 1, receive socket 1
> ---- IPv4 TCP ----
> send cpu 0, receive socket 0
> send cpu 1, receive socket 1
> send cpu 1, receive socket 1
> send cpu 0, receive socket 0
> send cpu 0, receive socket 0
> send cpu 1, receive socket 1
> ---- IPv6 TCP ----
> send cpu 0, receive socket 0
> send cpu 1, receive socket 1
> send cpu 1, receive socket 1
> send cpu 0, receive socket 0
> send cpu 0, receive socket 0
> send cpu 1, receive socket 1
> SUCCESS
> ok 1..2 selftests: net: reuseport_bpf_cpu [PASS]
> selftests: net: reuseport_bpf_numa
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- IPv4 UDP ----
> send node 0, receive socket 0
> send node 0, receive socket 0
> ---- IPv6 UDP ----
> send node 0, receive socket 0
> send node 0, receive socket 0
> ---- IPv4 TCP ----
> send node 0, receive socket 0
> send node 0, receive socket 0
> ---- IPv6 TCP ----
> send node 0, receive socket 0
> send node 0, receive socket 0
> SUCCESS
> ok 1..3 selftests: net: reuseport_bpf_numa [PASS]
> selftests: net: reuseport_dualstack
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- UDP IPv4 created before IPv6 ----
> ---- UDP IPv6 created before IPv4 ----
> ---- UDP IPv4 created before IPv6 (large) ----
> ---- UDP IPv6 created before IPv4 (large) ----
> ---- TCP IPv4 created before IPv6 ----
> ---- TCP IPv6 created before IPv4 ----
> SUCCESS
> ok 1..4 selftests: net: reuseport_dualstack [PASS]
> selftests: net: reuseaddr_conflict
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Opening 127.0.0.1:9999
> Opening INADDR_ANY:9999
> bind: Address already in use
> Opening in6addr_any:9999
> Opening INADDR_ANY:9999
> bind: Address already in use
> Opening INADDR_ANY:9999 after closing ipv6 socket
> bind: Address already in use
> Successok 1..5 selftests: net: reuseaddr_conflict [PASS]
> selftests: net: tls
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D] Running 29 tests from 2 test cases.
> [ RUN      ] tls.sendfile
> [       OK ] tls.sendfile
> [ RUN      ] tls.send_then_sendfile
> [       OK ] tls.send_then_sendfile
> [ RUN      ] tls.recv_max
> [       OK ] tls.recv_max
> [ RUN      ] tls.recv_small
> [       OK ] tls.recv_small
> [ RUN      ] tls.msg_more
> [       OK ] tls.msg_more
> [ RUN      ] tls.sendmsg_single
> [       OK ] tls.sendmsg_single
> [ RUN      ] tls.sendmsg_large
> [       OK ] tls.sendmsg_large
> [ RUN      ] tls.sendmsg_multiple
> [       OK ] tls.sendmsg_multiple
> [ RUN      ] tls.sendmsg_multiple_stress
> [       OK ] tls.sendmsg_multiple_stress
> [ RUN      ] tls.splice_from_pipe
> [       OK ] tls.splice_from_pipe
> [ RUN      ] tls.splice_from_pipe2
> [       OK ] tls.splice_from_pipe2
> [ RUN      ] tls.send_and_splice
> [       OK ] tls.send_and_splice
> [ RUN      ] tls.splice_to_pipe
> [       OK ] tls.splice_to_pipe
> [ RUN      ] tls.recvmsg_single
> [       OK ] tls.recvmsg_single
> [ RUN      ] tls.recvmsg_single_max
> [       OK ] tls.recvmsg_single_max
> [ RUN      ] tls.recvmsg_multiple
> [       OK ] tls.recvmsg_multiple
> [ RUN      ] tls.single_send_multiple_recv
> [       OK ] tls.single_send_multiple_recv
> [ RUN      ] tls.multiple_send_single_recv
> [       OK ] tls.multiple_send_single_recv
> [ RUN      ] tls.recv_partial
> [       OK ] tls.recv_partial
> [ RUN      ] tls.recv_nonblock
> [       OK ] tls.recv_nonblock
> [ RUN      ] tls.recv_peek
> [       OK ] tls.recv_peek
> [ RUN      ] tls.recv_peek_multiple
> [       OK ] tls.recv_peek_multiple
> [ RUN      ] tls.recv_peek_multiple_records
> [       OK ] tls.recv_peek_multiple_records
> [ RUN      ] tls.recv_peek_large_buf_mult_recs
> [       OK ] tls.recv_peek_large_buf_mult_recs
> [ RUN      ] tls.pollin
> [       OK ] tls.pollin
> [ RUN      ] tls.poll_wait
> [       OK ] tls.poll_wait
> [ RUN      ] tls.blocking
> [       OK ] tls.blocking
> [ RUN      ] tls.nonblocking
> [       OK ] tls.nonblocking
> [ RUN      ] tls.control_msg
> [       OK ] tls.control_msg
> [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D] 29 / 29 tests passed.
> [  PASSED  ]
> ok 1..6 selftests: net: tls [PASS]
> selftests: net: run_netsocktests
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --------------------
> running socket test
> --------------------
> [PASS]
> ok 1..7 selftests: net: run_netsocktests [PASS]
> selftests: net: run_afpackettests
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --------------------
> running psock_fanout test
> --------------------
> test: control single socket
> test: control multiple sockets
> test: unique ids
> =

> test: datapath 0x0 ports 8000,8002
> info: count=3D0,0, expect=3D0,0
> info: count=3D5,15, expect=3D15,5
> info: count=3D5,20, expect=3D20,5
> =

> test: datapath 0x1000 ports 8000,8002
> info: count=3D0,0, expect=3D0,0
> info: count=3D5,15, expect=3D15,5
> info: count=3D15,20, expect=3D20,15
> =

> test: datapath 0x1 ports 8000,8002
> info: count=3D0,0, expect=3D0,0
> info: count=3D10,10, expect=3D10,10
> info: count=3D17,18, expect=3D18,17
> =

> test: datapath 0x3 ports 8000,8002
> info: count=3D0,0, expect=3D0,0
> info: count=3D15,5, expect=3D15,5
> info: count=3D20,15, expect=3D20,15
> =

> test: datapath 0x6 ports 8000,8002
> info: count=3D0,0, expect=3D0,0
> info: count=3D5,15, expect=3D15,5
> info: count=3D20,15, expect=3D15,20
> =

> test: datapath 0x7 ports 8000,8002
> info: count=3D0,0, expect=3D0,0
> info: count=3D5,15, expect=3D15,5
> info: count=3D20,15, expect=3D15,20
> =

> test: datapath 0x2 ports 8000,8002
> info: count=3D0,0, expect=3D0,0
> info: count=3D20,0, expect=3D20,0
> info: count=3D20,0, expect=3D20,0
> =

> test: datapath 0x2 ports 8000,8002
> info: count=3D0,0, expect=3D0,0
> info: count=3D0,20, expect=3D0,20
> info: count=3D0,20, expect=3D0,20
> =

> test: datapath 0x2000 ports 8000,8002
> info: count=3D0,0, expect=3D0,0
> info: count=3D20,20, expect=3D20,20
> info: count=3D20,20, expect=3D20,20
> OK. All tests passed
> [PASS]
> --------------------
> running psock_tpacket test
> --------------------
> test: TPACKET_V1 with PACKET_RX_RING .................... 100 pkts (14200=
 bytes)
> test: TPACKET_V1 with PACKET_TX_RING .................... 100 pkts (14200=
 bytes)
> test: TPACKET_V2 with PACKET_RX_RING .................... 100 pkts (14200=
 bytes)
> test: TPACKET_V2 with PACKET_TX_RING .................... 100 pkts (14200=
 bytes)
> test: TPACKET_V3 with PACKET_RX_RING .................... 100 pkts (14200=
 bytes)
> test: TPACKET_V3 with PACKET_TX_RING .................... 100 pkts (14200=
 bytes)
> OK. All tests passed
> [PASS]
> --------------------
> running txring_overwrite test
> --------------------
> read: a (0x61)
> read: b (0x62)
> [PASS]
> ok 1..8 selftests: net: run_afpackettests [PASS]
> selftests: net: test_bpf.sh
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> test_bpf: ok
> ok 1..9 selftests: net: test_bpf.sh [PASS]
> selftests: net: netdevice.sh
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> SKIP: eth0: interface already up
> Cannot get device udp-fragmentation-offload settings: Operation not suppo=
rted
> PASS: eth0: ethtool list features
> PASS: eth0: ethtool dump
> PASS: eth0: ethtool stats
> SKIP: eth0: interface kept up
> ok 1..10 selftests: net: netdevice.sh [PASS]
> selftests: net: rtnetlink.sh
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> PASS: policy routing
> PASS: route get
> PASS: tc htb hierarchy
> PASS: gre tunnel endpoint
> PASS: gretap
> RTNETLINK answers: Operation not supported
> Cannot find device "ip6gretap00"
> Cannot find device "ip6gretap00"
> Cannot find device "ip6gretap00"
> RTNETLINK answers: Operation not supported
> Cannot find device "ip6gretap00"
> FAIL: ip6gretap
> PASS: erspan
> RTNETLINK answers: Operation not supported
> Cannot find device "ip6erspan00"
> Cannot find device "ip6erspan00"
> Cannot find device "ip6erspan00"
> RTNETLINK answers: Operation not supported
> Cannot find device "ip6erspan00"
> Cannot find device "ip6erspan00"
> Cannot find device "ip6erspan00"
> RTNETLINK answers: Operation not supported
> Cannot find device "ip6erspan00"
> FAIL: ip6erspan
> PASS: bridge setup
> PASS: ipv6 addrlabel
> PASS: set ifalias 58bb7090-b9ad-46cd-ba02-d0c3cc611fa5 for test-dummy0
> PASS: vrf
> PASS: vxlan
> PASS: fou
> PASS: macsec
> PASS: ipsec
> FAIL: ipsec_offload netdevsim doesn't support IPsec offload
> SKIP: fdb get tests: iproute2 too old
> SKIP: fdb get tests: iproute2 too old
> ok 1..11 selftests: net: rtnetlink.sh [PASS]
> selftests: net: xfrm_policy.sh
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> PASS: policy before exception matches
> PASS: ping to .254 bypassed ipsec tunnel
> PASS: direct policy matches
> PASS: policy matches
> ok 1..12 selftests: net: xfrm_policy.sh [PASS]
> selftests: net: fib_tests.sh
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =

> Single path route test
>      Start point
>      TEST: IPv4 fibmatch                                                 =
[ OK ]
>      TEST: IPv6 fibmatch                                                 =
[ OK ]
>      Nexthop device deleted
>      TEST: IPv4 fibmatch - no route                                      =
[ OK ]
>      TEST: IPv6 fibmatch - no route                                      =
[ OK ]
> =

> Multipath route test
>      Start point
>      TEST: IPv4 fibmatch                                                 =
[ OK ]
>      TEST: IPv6 fibmatch                                                 =
[ OK ]
>      One nexthop device deleted
>      TEST: IPv4 - multipath route removed on delete                      =
[ OK ]
>      TEST: IPv6 - multipath down to single path                          =
[ OK ]
>      Second nexthop device deleted
>      TEST: IPv6 - no route                                               =
[ OK ]
> =

> Single path, admin down
>      Start point
>      TEST: IPv4 fibmatch                                                 =
[ OK ]
>      TEST: IPv6 fibmatch                                                 =
[ OK ]
>      Route deleted on down
>      TEST: IPv4 fibmatch                                                 =
[ OK ]
>      TEST: IPv6 fibmatch                                                 =
[ OK ]
> =

> Admin down multipath
>      Verify start point
>      TEST: IPv4 fibmatch                                                 =
[ OK ]
>      TEST: IPv6 fibmatch                                                 =
[ OK ]
>      One device down, one up
>      TEST: IPv4 fibmatch on down device                                  =
[ OK ]
>      TEST: IPv6 fibmatch on down device                                  =
[ OK ]
>      TEST: IPv4 fibmatch on up device                                    =
[ OK ]
>      TEST: IPv6 fibmatch on up device                                    =
[ OK ]
>      TEST: IPv4 flags on down device                                     =
[ OK ]
>      TEST: IPv6 flags on down device                                     =
[ OK ]
>      TEST: IPv4 flags on up device                                       =
[ OK ]
>      TEST: IPv6 flags on up device                                       =
[ OK ]
>      Other device down and up
>      TEST: IPv4 fibmatch on down device                                  =
[ OK ]
>      TEST: IPv6 fibmatch on down device                                  =
[ OK ]
>      TEST: IPv4 fibmatch on up device                                    =
[ OK ]
>      TEST: IPv6 fibmatch on up device                                    =
[ OK ]
>      TEST: IPv4 flags on down device                                     =
[ OK ]
>      TEST: IPv6 flags on down device                                     =
[ OK ]
>      TEST: IPv4 flags on up device                                       =
[ OK ]
>      TEST: IPv6 flags on up device                                       =
[ OK ]
>      Both devices down
>      TEST: IPv4 fibmatch                                                 =
[ OK ]
>      TEST: IPv6 fibmatch                                                 =
[ OK ]
> =

> Local carrier tests - single path
>      Start point
>      TEST: IPv4 fibmatch                                                 =
[ OK ]
>      TEST: IPv6 fibmatch                                                 =
[ OK ]
>      TEST: IPv4 - no linkdown flag                                       =
[ OK ]
>      TEST: IPv6 - no linkdown flag                                       =
[ OK ]
>      Carrier off on nexthop
>      TEST: IPv4 fibmatch                                                 =
[ OK ]
>      TEST: IPv6 fibmatch                                                 =
[ OK ]
>      TEST: IPv4 - linkdown flag set                                      =
[ OK ]
>      TEST: IPv6 - linkdown flag set                                      =
[ OK ]
>      Route to local address with carrier down
>      TEST: IPv4 fibmatch                                                 =
[ OK ]
>      TEST: IPv6 fibmatch                                                 =
[ OK ]
>      TEST: IPv4 linkdown flag set                                        =
[ OK ]
>      TEST: IPv6 linkdown flag set                                        =
[ OK ]
> =

> Single path route carrier test
>      Start point
>      TEST: IPv4 fibmatch                                                 =
[ OK ]
>      TEST: IPv6 fibmatch                                                 =
[ OK ]
>      TEST: IPv4 no linkdown flag                                         =
[ OK ]
>      TEST: IPv6 no linkdown flag                                         =
[ OK ]
>      Carrier down
>      TEST: IPv4 fibmatch                                                 =
[ OK ]
>      TEST: IPv6 fibmatch                                                 =
[ OK ]
>      TEST: IPv4 linkdown flag set                                        =
[ OK ]
>      TEST: IPv6 linkdown flag set                                        =
[ OK ]
>      Second address added with carrier down
>      TEST: IPv4 fibmatch                                                 =
[ OK ]
>      TEST: IPv6 fibmatch                                                 =
[ OK ]
>      TEST: IPv4 linkdown flag set                                        =
[ OK ]
>      TEST: IPv6 linkdown flag set                                        =
[ OK ]
> =

> IPv4 nexthop tests
> <<< write me >>>
> =

> IPv6 nexthop tests
>      TEST: Directly connected nexthop, unicast address                   =
[ OK ]
>      TEST: Directly connected nexthop, unicast address with device       =
[ OK ]
>      TEST: Gateway is linklocal address                                  =
[ OK ]
>      TEST: Gateway is linklocal address, no device                       =
[ OK ]
>      TEST: Gateway can not be local unicast address                      =
[ OK ]
>      TEST: Gateway can not be local unicast address, with device         =
[ OK ]
>      TEST: Gateway can not be a local linklocal address                  =
[ OK ]
>      TEST: Gateway can be local address in a VRF                         =
[ OK ]
>      TEST: Gateway can be local address in a VRF, with device            =
[ OK ]
>      TEST: Gateway can be local linklocal address in a VRF               =
[ OK ]
>      TEST: Redirect to VRF lookup                                        =
[ OK ]
>      TEST: VRF route, gateway can be local address in default VRF        =
[ OK ]
>      TEST: VRF route, gateway can not be a local address                 =
[ OK ]
>      TEST: VRF route, gateway can not be a local addr with device        =
[ OK ]
> =

> IPv6 route add / append tests
>      TEST: Attempt to add duplicate route - gw                           =
[ OK ]
>      TEST: Attempt to add duplicate route - dev only                     =
[ OK ]
>      TEST: Attempt to add duplicate route - reject route                 =
[ OK ]
>      TEST: Append nexthop to existing route - gw                         =
[ OK ]
>      TEST: Add multipath route                                           =
[ OK ]
>      TEST: Attempt to add duplicate multipath route                      =
[ OK ]
>      TEST: Route add with different metrics                              =
[ OK ]
>      TEST: Route delete with metric                                      =
[ OK ]
> =

> IPv6 route replace tests
>      TEST: Single path with single path                                  =
[ OK ]
>      TEST: Single path with multipath                                    =
[ OK ]
>      TEST: Single path with single path via multipath attribute          =
[ OK ]
>      TEST: Invalid nexthop                                               =
[ OK ]
>      TEST: Single path - replace of non-existent route                   =
[ OK ]
>      TEST: Multipath with multipath                                      =
[ OK ]
>      TEST: Multipath with single path                                    =
[ OK ]
>      TEST: Multipath with single path via multipath attribute            =
[ OK ]
>      TEST: Multipath - invalid first nexthop                             =
[ OK ]
>      TEST: Multipath - invalid second nexthop                            =
[ OK ]
>      TEST: Multipath - replace of non-existent route                     =
[ OK ]
> =

> IPv4 route add / append tests
>      TEST: Attempt to add duplicate route - gw                           =
[ OK ]
>      TEST: Attempt to add duplicate route - dev only                     =
[ OK ]
>      TEST: Attempt to add duplicate route - reject route                 =
[ OK ]
>      TEST: Add new nexthop for existing prefix                           =
[ OK ]
>      TEST: Append nexthop to existing route - gw                         =
[ OK ]
>      TEST: Append nexthop to existing route - dev only                   =
[ OK ]
>      TEST: Append nexthop to existing route - reject route               =
[ OK ]
>      TEST: Append nexthop to existing reject route - gw                  =
[ OK ]
>      TEST: Append nexthop to existing reject route - dev only            =
[ OK ]
>      TEST: add multipath route                                           =
[ OK ]
>      TEST: Attempt to add duplicate multipath route                      =
[ OK ]
>      TEST: Route add with different metrics                              =
[ OK ]
>      TEST: Route delete with metric                                      =
[ OK ]
> =

> IPv4 route replace tests
>      TEST: Single path with single path                                  =
[ OK ]
>      TEST: Single path with multipath                                    =
[ OK ]
>      TEST: Single path with reject route                                 =
[ OK ]
>      TEST: Single path with single path via multipath attribute          =
[ OK ]
>      TEST: Invalid nexthop                                               =
[ OK ]
>      TEST: Single path - replace of non-existent route                   =
[ OK ]
>      TEST: Multipath with multipath                                      =
[ OK ]
>      TEST: Multipath with single path                                    =
[ OK ]
>      TEST: Multipath with single path via multipath attribute            =
[ OK ]
>      TEST: Multipath with reject route                                   =
[ OK ]
>      TEST: Multipath - invalid first nexthop                             =
[ OK ]
>      TEST: Multipath - invalid second nexthop                            =
[ OK ]
>      TEST: Multipath - replace of non-existent route                     =
[ OK ]
> =

> IPv6 prefix route tests
>      TEST: Default metric                                                =
[ OK ]
>      TEST: User specified metric on first device                         =
[ OK ]
>      TEST: User specified metric on second device                        =
[ OK ]
>      TEST: Delete of address on first device                             =
[ OK ]
>      TEST: Modify metric of address                                      =
[ OK ]
> Command line is not complete. Try option "help"
>      TEST: Prefix route removed on link down                             =
[ OK ]
>      TEST: Prefix route with metric on link up                           =
[ OK ]
> =

> IPv4 prefix route tests
>      TEST: Default metric                                                =
[ OK ]
>      TEST: User specified metric on first device                         =
[ OK ]
>      TEST: User specified metric on second device                        =
[ OK ]
>      TEST: Delete of address on first device                             =
[ OK ]
>      TEST: Modify metric of address                                      =
[ OK ]
> Command line is not complete. Try option "help"
>      TEST: Prefix route removed on link down                             =
[ OK ]
>      TEST: Prefix route with metric on link up                           =
[ OK ]
> =

> IPv6 routes with metrics
>      TEST: Single path route with mtu metric                             =
[ OK ]
>      TEST: Multipath route via 2 single routes with mtu metric on first  =
[ OK ]
>      TEST: Multipath route via 2 single routes with mtu metric on 2nd    =
[ OK ]
>      TEST:     MTU of second leg                                         =
[ OK ]
>      TEST: Multipath route with mtu metric                               =
[ OK ]
>      TEST: Using route with mtu metric                                   =
[ OK ]
>      TEST: Invalid metric (fails metric_convert)                         =
[ OK ]
> =

> IPv4 route add / append tests
>      TEST: Single path route with mtu metric                             =
[ OK ]
>      TEST: Multipath route with mtu metric                               =
[ OK ]
>      TEST: Using route with mtu metric                                   =
[ OK ]
>      TEST: Invalid metric (fails metric_convert)                         =
[ OK ]
> =

> Tests passed: 141
> Tests failed:   0
> ok 1..13 selftests: net: fib_tests.sh [PASS]
> selftests: net: fib-onlink-tests.sh
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =

> ########################################
> Configuring interfaces
> RTNETLINK answers: File exists
> not ok 1..14 selftests: net: fib-onlink-tests.sh [FAIL]
> selftests: net: pmtu.sh
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> TEST: ipv4: PMTU exceptions                                         [ OK ]
> connect: Cannot assign requested address
> connect: Cannot assign requested address
> TEST: ipv6: PMTU exceptions                                         [FAIL]
>    PMTU exception wasn't created after exceeding MTU
> TEST: IPv4 over vxlan4: PMTU exceptions                             [ OK ]
> connect: Cannot assign requested address
> TEST: IPv6 over vxlan4: PMTU exceptions                             [FAIL]
>    PMTU exception wasn't created after exceeding link layer MTU on vxlan =
interface
> TEST: IPv4 over vxlan6: PMTU exceptions                             [ OK ]
> TEST: IPv6 over vxlan6: PMTU exceptions                             [ OK ]
> RTNETLINK answers: Operation not supported
>    geneve4 not supported
> TEST: IPv4 over geneve4: PMTU exceptions                            [SKIP]
> RTNETLINK answers: Operation not supported
>    geneve4 not supported
> TEST: IPv6 over geneve4: PMTU exceptions                            [SKIP]
> RTNETLINK answers: Operation not supported
>    geneve6 not supported
> TEST: IPv4 over geneve6: PMTU exceptions                            [SKIP]
> RTNETLINK answers: Operation not supported
>    geneve6 not supported
> TEST: IPv6 over geneve6: PMTU exceptions                            [SKIP]
> TEST: IPv4 over fou4: PMTU exceptions                               [ OK ]
> TEST: IPv6 over fou4: PMTU exceptions                               [ OK ]
> TEST: IPv4 over fou6: PMTU exceptions                               [ OK ]
> TEST: IPv6 over fou6: PMTU exceptions                               [ OK ]
> TEST: IPv4 over gue4: PMTU exceptions                               [ OK ]
> TEST: IPv6 over gue4: PMTU exceptions                               [ OK ]
> TEST: IPv4 over gue6: PMTU exceptions                               [ OK ]
> TEST: IPv6 over gue6: PMTU exceptions                               [ OK ]
> TEST: vti6: PMTU exceptions                                         [ OK ]
> TEST: vti4: PMTU exceptions                                         [ OK ]
> TEST: vti4: default MTU assignment                                  [ OK ]
> TEST: vti6: default MTU assignment                                  [ OK ]
> TEST: vti4: MTU setting on link creation                            [ OK ]
> TEST: vti6: MTU setting on link creation                            [ OK ]
> TEST: vti6: MTU changes on link changes                             [ OK ]
> not ok 1..15 selftests: net: pmtu.sh [FAIL]
> selftests: net: udpgso.sh
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ipv4 cmsg
> device mtu (orig): 65536
> device mtu (test): 1500
> ipv4 tx:1 gso:0
> ipv4 tx:1472 gso:0
> ipv4 tx:1473 gso:0 (fail)
> ipv4 tx:1472 gso:1472 (fail)
> ipv4 tx:1473 gso:1472
> ipv4 tx:2944 gso:1472
> ipv4 tx:2945 gso:1472
> ipv4 tx:64768 gso:1472
> ipv4 tx:65507 gso:1472
> ipv4 tx:65508 gso:1472 (fail)
> ipv4 tx:1 gso:1 (fail)
> ipv4 tx:2 gso:1
> ipv4 tx:5 gso:2
> ipv4 tx:36 gso:1
> ipv4 tx:37 gso:1 (fail)
> OK
> ipv4 setsockopt
> device mtu (orig): 65536
> device mtu (test): 1500
> ipv4 tx:1 gso:0
> ipv4 tx:1472 gso:0
> ipv4 tx:1473 gso:0 (fail)
> ipv4 tx:1472 gso:1472 (fail)
> ipv4 tx:1473 gso:1472
> ipv4 tx:2944 gso:1472
> ipv4 tx:2945 gso:1472
> ipv4 tx:64768 gso:1472
> ipv4 tx:65507 gso:1472
> ipv4 tx:65508 gso:1472 (fail)
> ipv4 tx:1 gso:1 (fail)
> ipv4 tx:2 gso:1
> ipv4 tx:5 gso:2
> ipv4 tx:36 gso:1
> ipv4 tx:37 gso:1 (fail)
> OK
> ipv6 cmsg
> device mtu (orig): 65536
> device mtu (test): 1500
> ipv6 tx:1 gso:0
> ipv6 tx:1452 gso:0
> ipv6 tx:1453 gso:0 (fail)
> ipv6 tx:1452 gso:1452 (fail)
> ipv6 tx:1453 gso:1452
> ipv6 tx:2904 gso:1452
> ipv6 tx:2905 gso:1452
> ipv6 tx:65340 gso:1452
> ipv6 tx:65527 gso:1452
> ipv6 tx:65528 gso:1452 (fail)
> ipv6 tx:1 gso:1 (fail)
> ipv6 tx:2 gso:1
> ipv6 tx:5 gso:2
> ipv6 tx:16 gso:1
> ipv6 tx:17 gso:1 (fail)
> OK
> ipv6 setsockopt
> device mtu (orig): 65536
> device mtu (test): 1500
> ipv6 tx:1 gso:0
> ipv6 tx:1452 gso:0
> ipv6 tx:1453 gso:0 (fail)
> ipv6 tx:1452 gso:1452 (fail)
> ipv6 tx:1453 gso:1452
> ipv6 tx:2904 gso:1452
> ipv6 tx:2905 gso:1452
> ipv6 tx:65340 gso:1452
> ipv6 tx:65527 gso:1452
> ipv6 tx:65528 gso:1452 (fail)
> ipv6 tx:1 gso:1 (fail)
> ipv6 tx:2 gso:1
> ipv6 tx:5 gso:2
> ipv6 tx:16 gso:1
> ipv6 tx:17 gso:1 (fail)
> OK
> ipv4 connected
> device mtu (orig): 65536
> device mtu (test): 1600
> route mtu (test): 1500
> path mtu (read):  1500
> ipv4 tx:1 gso:0
> ipv4 tx:1472 gso:0
> ipv4 tx:1473 gso:0 (fail)
> ipv4 tx:1472 gso:1472 (fail)
> ipv4 tx:1473 gso:1472
> ipv4 tx:2944 gso:1472
> ipv4 tx:2945 gso:1472
> ipv4 tx:64768 gso:1472
> ipv4 tx:65507 gso:1472
> ipv4 tx:65508 gso:1472 (fail)
> ipv4 tx:1 gso:1 (fail)
> ipv4 tx:2 gso:1
> ipv4 tx:5 gso:2
> ipv4 tx:36 gso:1
> ipv4 tx:37 gso:1 (fail)
> OK
> ipv4 msg_more
> device mtu (orig): 65536
> device mtu (test): 1500
> ipv4 tx:1 gso:0
> ipv4 tx:1472 gso:0
> ipv4 tx:1473 gso:0 (fail)
> ipv4 tx:1472 gso:1472 (fail)
> ipv4 tx:1473 gso:1472
> ipv4 tx:2944 gso:1472
> ipv4 tx:2945 gso:1472
> ipv4 tx:64768 gso:1472
> ipv4 tx:65507 gso:1472
> ipv4 tx:65508 gso:1472 (fail)
> ipv4 tx:1 gso:1 (fail)
> ipv4 tx:2 gso:1
> ipv4 tx:5 gso:2
> ipv4 tx:36 gso:1
> ipv4 tx:37 gso:1 (fail)
> OK
> ipv6 msg_more
> device mtu (orig): 65536
> device mtu (test): 1500
> ipv6 tx:1 gso:0
> ipv6 tx:1452 gso:0
> ipv6 tx:1453 gso:0 (fail)
> ipv6 tx:1452 gso:1452 (fail)
> ipv6 tx:1453 gso:1452
> ipv6 tx:2904 gso:1452
> ipv6 tx:2905 gso:1452
> ipv6 tx:65340 gso:1452
> ipv6 tx:65527 gso:1452
> ipv6 tx:65528 gso:1452 (fail)
> ipv6 tx:1 gso:1 (fail)
> ipv6 tx:2 gso:1
> ipv6 tx:5 gso:2
> ipv6 tx:16 gso:1
> ipv6 tx:17 gso:1 (fail)
> OK
> ok 1..16 selftests: net: udpgso.sh [PASS]
> selftests: net: ip_defrag.sh
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ipv4 defrag
> PASS
> seed =3D 1550506667
> ipv4 defrag with overlaps
> PASS
> seed =3D 1550506668
> ipv6 defrag
> PASS
> seed =3D 1550506699
> ipv6 defrag with overlaps
> PASS
> seed =3D 1550506699
> all tests done
> ok 1..17 selftests: net: ip_defrag.sh [PASS]
> selftests: net: udpgso_bench.sh
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ipv4
> tcp
> tcp rx:   2473 MB/s    35430 calls/s
> tcp tx:   2473 MB/s    41947 calls/s  41947 msg/s
> tcp rx:   2778 MB/s    35862 calls/s
> tcp tx:   2819 MB/s    47828 calls/s  47828 msg/s
> tcp rx:   3248 MB/s    53210 calls/s
> tcp tx:   3227 MB/s    54739 calls/s  54739 msg/s
> tcp zerocopy
> tcp rx:   2206 MB/s    34504 calls/s
> tcp tx:   2206 MB/s    37420 calls/s  37420 msg/s
> tcp tx:   1834 MB/s    31109 calls/s  31109 msg/s
> tcp rx:   1834 MB/s    23760 calls/s
> tcp tx:   1675 MB/s    28413 calls/s  28413 msg/s
> tcp rx:   1677 MB/s    22661 calls/s
> udp
> udp rx:    273 MB/s   195140 calls/s
> udp tx:    277 MB/s   197652 calls/s   4706 msg/s
> udp rx:    361 MB/s   257264 calls/s
> udp tx:    369 MB/s   262920 calls/s   6260 msg/s
> udp rx:    349 MB/s   248638 calls/s
> udp tx:    355 MB/s   253470 calls/s   6035 msg/s
> udp rx:    302 MB/s   215415 calls/s
> udp gso
> udp rx:    678 MB/s   483509 calls/s
> udp tx:    703 MB/s    11935 calls/s  11935 msg/s
> udp rx:    839 MB/s   598198 calls/s
> udp tx:    909 MB/s    15422 calls/s  15422 msg/s
> udp rx:    799 MB/s   569595 calls/s
> udp tx:    812 MB/s    13779 calls/s  13779 msg/s
> udp rx:    739 MB/s   526925 calls/s
> udp gso zerocopy
> udp rx:    633 MB/s   450933 calls/s
> udp tx:    643 MB/s    10909 calls/s  10909 msg/s
> udp rx:    727 MB/s   518471 calls/s
> udp tx:    734 MB/s    12450 calls/s  12450 msg/s
> udp rx:    724 MB/s   516082 calls/s
> udp tx:    731 MB/s    12402 calls/s  12402 msg/s
> ipv6
> tcp
> tcp tx:   2819 MB/s    47825 calls/s  47825 msg/s
> tcp rx:   2819 MB/s    46683 calls/s
> tcp rx:   3329 MB/s    56088 calls/s
> tcp tx:   3329 MB/s    56476 calls/s  56476 msg/s
> tcp rx:   3614 MB/s    60462 calls/s
> tcp tx:   3614 MB/s    61311 calls/s  61311 msg/s
> tcp zerocopy
> tcp rx:   2205 MB/s    33711 calls/s
> tcp tx:   2205 MB/s    37414 calls/s  37414 msg/s
> tcp tx:   2740 MB/s    46484 calls/s  46484 msg/s
> tcp rx:   2743 MB/s    33023 calls/s
> tcp tx:   2247 MB/s    38126 calls/s  38126 msg/s
> tcp rx:   2248 MB/s    35172 calls/s
> udp
> udp rx:    300 MB/s   219186 calls/s
> udp tx:    305 MB/s   222525 calls/s   5175 msg/s
> udp tx:    281 MB/s   205282 calls/s   4774 msg/s
> udp rx:    244 MB/s   178121 calls/s
> udp tx:    298 MB/s   217967 calls/s   5069 msg/s
> udp rx:    265 MB/s   193917 calls/s
> udp gso
> udp rx:    349 MB/s   254957 calls/s
> udp tx:    727 MB/s    12333 calls/s  12333 msg/s
> udp tx:    685 MB/s    11629 calls/s  11629 msg/s
> udp rx:    300 MB/s   219356 calls/s
> udp tx:    675 MB/s    11451 calls/s  11451 msg/s
> udp rx:    273 MB/s   199736 calls/s
> udp gso zerocopy
> udp rx:    291 MB/s   212843 calls/s
> udp tx:    540 MB/s     9170 calls/s   9170 msg/s
> udp rx:    198 MB/s   144606 calls/s
> udp tx:    337 MB/s     5720 calls/s   5720 msg/s
> udp tx:    604 MB/s    10255 calls/s  10255 msg/s
> udp rx:    251 MB/s   183111 calls/s
> ok 1..18 selftests: net: udpgso_bench.sh [PASS]
> selftests: net: fib_rule_tests.sh
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =

> ######################################################################
> TEST SECTION: IPv4 fib rule
> ######################################################################
> =

>      TEST: rule4 check: oif dummy0                             [ OK ]
> =

>      TEST: rule4 del by pref: oif dummy0                       [ OK ]
> RTNETLINK answers: No route to host
> =

>      TEST: rule4 check: from 192.51.100.3 iif dummy0           [FAIL]
> =

>      TEST: rule4 del by pref: from 192.51.100.3 iif dummy0     [ OK ]
> =

>      TEST: rule4 check: tos 0x10                               [ OK ]
> =

>      TEST: rule4 del by pref: tos 0x10                         [ OK ]
> =

>      TEST: rule4 check: fwmark 0x64                            [ OK ]
> =

>      TEST: rule4 del by pref: fwmark 0x64                      [ OK ]
> =

>      TEST: rule4 check: uidrange 100-100                       [ OK ]
> =

>      TEST: rule4 del by pref: uidrange 100-100                 [ OK ]
> =

>      TEST: rule4 check: sport 666 dport 777                    [ OK ]
> =

>      TEST: rule4 del by pref: sport 666 dport 777              [ OK ]
> =

>      TEST: rule4 check: ipproto tcp                            [ OK ]
> =

>      TEST: rule4 del by pref: ipproto tcp                      [ OK ]
> =

>      TEST: rule4 check: ipproto icmp                           [ OK ]
> =

>      TEST: rule4 del by pref: ipproto icmp                     [ OK ]
> =

> ######################################################################
> TEST SECTION: IPv6 fib rule
> ######################################################################
> =

>      TEST: rule6 check: oif dummy0                             [ OK ]
> =

>      TEST: rule6 del by pref: oif dummy0                       [ OK ]
> =

>      TEST: rule6 check: from 2001:db8:1::3 iif dummy0          [ OK ]
> =

>      TEST: rule6 del by pref: from 2001:db8:1::3 iif dummy0    [ OK ]
> =

>      TEST: rule6 check: tos 0x10                               [ OK ]
> =

>      TEST: rule6 del by pref: tos 0x10                         [ OK ]
> =

>      TEST: rule6 check: fwmark 0x64                            [ OK ]
> =

>      TEST: rule6 del by pref: fwmark 0x64                      [ OK ]
> =

>      TEST: rule6 check: uidrange 100-100                       [ OK ]
> =

>      TEST: rule6 del by pref: uidrange 100-100                 [ OK ]
> =

>      TEST: rule6 check: sport 666 dport 777                    [ OK ]
> =

>      TEST: rule6 del by pref: sport 666 dport 777              [ OK ]
> =

>      TEST: rule6 check: ipproto tcp                            [ OK ]
> =

>      TEST: rule6 del by pref: ipproto tcp                      [ OK ]
> =

>      TEST: rule6 check: ipproto icmp                           [ OK ]
> =

>      TEST: rule6 del by pref: ipproto icmp                     [ OK ]
> ok 1..19 selftests: net: fib_rule_tests.sh [PASS]
> selftests: net: msg_zerocopy.sh
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ipv4 tcp -t 1
> ./msg_zerocopy: setaffinity 2
> ./msg_zerocopy: setaffinity 3
> not ok 1..20 selftests: net: msg_zerocopy.sh [FAIL]
> selftests: net: psock_snd.sh
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> dgram
> tx: 128
> rx: 142
> rx: 100
> OK
> =

> dgram bind
> tx: 128
> rx: 142
> rx: 100
> OK
> =

> raw
> tx: 142
> rx: 142
> rx: 100
> OK
> =

> raw bind
> tx: 142
> rx: 142
> rx: 100
> OK
> =

> raw qdisc bypass
> tx: 142
> rx: 142
> rx: 100
> OK
> =

> raw vlan
> tx: 146
> rx: 100
> OK
> =

> raw vnet hdr
> tx: 152
> rx: 142
> rx: 100
> OK
> =

> raw csum_off
> tx: 152
> rx: 142
> rx: 100
> OK
> =

> raw csum_off with bad offset (fails)
> ./psock_snd: write: Invalid argument
> raw min size
> tx: 42
> rx: 0
> OK
> =

> raw mtu size
> tx: 1514
> rx: 1472
> OK
> =

> raw mtu size + 1 (fails)
> ./psock_snd: write: Message too long
> raw vlan mtu size + 1 (fails)
> ./psock_snd: write: Message too long
> dgram mtu size
> tx: 1500
> rx: 1472
> OK
> =

> dgram mtu size + 1 (fails)
> ./psock_snd: write: Message too long
> raw truncate hlen (fails: does not arrive)
> tx: 14
> ./psock_snd: recv: Resource temporarily unavailable
> raw truncate hlen - 1 (fails: EINVAL)
> ./psock_snd: write: Invalid argument
> raw gso min size
> tx: 1525
> rx: 1473
> OK
> =

> raw gso min size - 1 (fails)
> tx: 1524
> ./psock_snd: recv: Resource temporarily unavailable
> raw gso max size
> tx: 65559
> rx: 65507
> OK
> =

> raw gso max size + 1 (fails)
> tx: 65560
> ./psock_snd: recv: Resource temporarily unavailable
> OK. All tests passed
> ok 1..21 selftests: net: psock_snd.sh [PASS]
> selftests: net: udpgro_bench.sh
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Missing xdp_dummy helper. Build bpf selftest first
> not ok 1..22 selftests: net: udpgro_bench.sh [FAIL]
> selftests: net: udpgro.sh
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Missing xdp_dummy helper. Build bpf selftest first
> not ok 1..23 selftests: net: udpgro.sh [FAIL]
> selftests: net: test_vxlan_under_vrf.sh
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Checking HV connectivity                                           [ OK ]
> Check VM connectivity through VXLAN (underlay in the default VRF)  [ OK ]
> Check VM connectivity through VXLAN (underlay in a VRF)            [FAIL]
> not ok 1..24 selftests: net: test_vxlan_under_vrf.sh [FAIL]
> selftests: net: reuseport_addr_any.sh
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> UDP IPv4 ... pass
> UDP IPv6 ... pass
> UDP IPv4 mapped to IPv6 ... pass
> TCP IPv4 ... pass
> TCP IPv6 ... pass
> TCP IPv4 mapped to IPv6 ... pass
> DCCP IPv4 ... pass
> DCCP IPv6 ... pass
> DCCP IPv4 mapped to IPv6 ... pass
> SUCCESS
> ok 1..25 selftests: net: reuseport_addr_any.sh [PASS]
> selftests: net: test_vxlan_fdb_changelink.sh
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> expected two remotes after fdb append	[ OK ]
> expected two remotes after link set	[ OK ]
> ok 1..26 selftests: net: test_vxlan_fdb_changelink.sh [PASS]
> make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa8132=
78ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/net'
> =

> 2019-02-19 00:19:34 make run_tests -C netfilter
> make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813=
278ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/netfilter'
> TAP version 13
> selftests: netfilter: nft_trans_stress.sh
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> SKIP: Could not run test without nft tool
> not ok 1..1 selftests: netfilter: nft_trans_stress.sh [SKIP]
> make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa8132=
78ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/netfilter'
> =

> 2019-02-19 00:19:35 make run_tests -C nsfs
> make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813=
278ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/nsfs'
> gcc -Wall -Werror    owner.c  -o /usr/src/perf_selftests-x86_64-rhel-7.2-=
cdaa813278ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/nsfs/owner
> gcc -Wall -Werror    pidns.c  -o /usr/src/perf_selftests-x86_64-rhel-7.2-=
cdaa813278ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/nsfs/pidns
> TAP version 13
> selftests: nsfs: owner
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ok 1..1 selftests: nsfs: owner [PASS]
> selftests: nsfs: pidns
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ok 1..2 selftests: nsfs: pidns [PASS]
> make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa8132=
78ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/nsfs'
> ignored_by_lkp powerpc test
> prctl test: not in Makefile
> 2019-02-19 00:19:35 make TARGETS=3Dprctl
> make[1]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa=
813278ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/prctl'
> Makefile:14: warning: overriding recipe for target 'clean'
> ../lib.mk:137: warning: ignoring old recipe for target 'clean'
> gcc     disable-tsc-ctxt-sw-stress-test.c   -o disable-tsc-ctxt-sw-stress=
-test
> gcc     disable-tsc-on-off-stress-test.c   -o disable-tsc-on-off-stress-t=
est
> gcc     disable-tsc-test.c   -o disable-tsc-test
> make[1]: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa8=
13278ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/prctl'
> =

> 2019-02-19 00:19:36 make run_tests -C prctl
> make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813=
278ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/prctl'
> Makefile:14: warning: overriding recipe for target 'clean'
> ../lib.mk:137: warning: ignoring old recipe for target 'clean'
> TAP version 13
> selftests: prctl: disable-tsc-ctxt-sw-stress-test
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [No further output means we're allright]
> ok 1..1 selftests: prctl: disable-tsc-ctxt-sw-stress-test [PASS]
> selftests: prctl: disable-tsc-on-off-stress-test
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [No further output means we're allright]
> ok 1..2 selftests: prctl: disable-tsc-on-off-stress-test [PASS]
> selftests: prctl: disable-tsc-test
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> rdtsc() =3D=3D 802151371749
> prctl(PR_GET_TSC, &tsc_val); tsc_val =3D=3D PR_TSC_ENABLE
> rdtsc() =3D=3D 802151561910
> prctl(PR_SET_TSC, PR_TSC_ENABLE)
> rdtsc() =3D=3D 802151570169
> prctl(PR_SET_TSC, PR_TSC_SIGSEGV)
> rdtsc() =3D=3D [ SIG_SEGV ]
> prctl(PR_GET_TSC, &tsc_val); tsc_val =3D=3D PR_TSC_SIGSEGV
> prctl(PR_SET_TSC, PR_TSC_ENABLE)
> rdtsc() =3D=3D 802151606539
> ok 1..3 selftests: prctl: disable-tsc-test [PASS]
> make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa8132=
78ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/prctl'
> =

> 2019-02-19 00:19:57 make run_tests -C proc
> make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813=
278ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/proc'
> gcc -Wall -O2 -Wno-unused-function -D_GNU_SOURCE    fd-001-lookup.c  -o /=
usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813278ddc616ee201eacda77f63996b5=
dd2d/tools/testing/selftests/proc/fd-001-lookup
> gcc -Wall -O2 -Wno-unused-function -D_GNU_SOURCE    fd-002-posix-eq.c  -o=
 /usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813278ddc616ee201eacda77f63996=
b5dd2d/tools/testing/selftests/proc/fd-002-posix-eq
> gcc -Wall -O2 -Wno-unused-function -D_GNU_SOURCE    fd-003-kthread.c  -o =
/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813278ddc616ee201eacda77f63996b=
5dd2d/tools/testing/selftests/proc/fd-003-kthread
> gcc -Wall -O2 -Wno-unused-function -D_GNU_SOURCE    proc-loadavg-001.c  -=
o /usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813278ddc616ee201eacda77f6399=
6b5dd2d/tools/testing/selftests/proc/proc-loadavg-001
> proc-loadavg-001.c:17:0: warning: "_GNU_SOURCE" redefined
>   #define _GNU_SOURCE
>   =

> <command-line>:0:0: note: this is the location of the previous definition
> gcc -Wall -O2 -Wno-unused-function -D_GNU_SOURCE    proc-self-map-files-0=
01.c  -o /usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813278ddc616ee201eacda=
77f63996b5dd2d/tools/testing/selftests/proc/proc-self-map-files-001
> gcc -Wall -O2 -Wno-unused-function -D_GNU_SOURCE    proc-self-map-files-0=
02.c  -o /usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813278ddc616ee201eacda=
77f63996b5dd2d/tools/testing/selftests/proc/proc-self-map-files-002
> gcc -Wall -O2 -Wno-unused-function -D_GNU_SOURCE    proc-self-syscall.c  =
-o /usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813278ddc616ee201eacda77f639=
96b5dd2d/tools/testing/selftests/proc/proc-self-syscall
> proc-self-syscall.c:16:0: warning: "_GNU_SOURCE" redefined
>   #define _GNU_SOURCE
>   =

> <command-line>:0:0: note: this is the location of the previous definition
> gcc -Wall -O2 -Wno-unused-function -D_GNU_SOURCE    proc-self-wchan.c  -o=
 /usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813278ddc616ee201eacda77f63996=
b5dd2d/tools/testing/selftests/proc/proc-self-wchan
> gcc -Wall -O2 -Wno-unused-function -D_GNU_SOURCE    proc-uptime-001.c  -o=
 /usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813278ddc616ee201eacda77f63996=
b5dd2d/tools/testing/selftests/proc/proc-uptime-001
> gcc -Wall -O2 -Wno-unused-function -D_GNU_SOURCE    proc-uptime-002.c  -o=
 /usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813278ddc616ee201eacda77f63996=
b5dd2d/tools/testing/selftests/proc/proc-uptime-002
> proc-uptime-002.c:18:0: warning: "_GNU_SOURCE" redefined
>   #define _GNU_SOURCE
>   =

> <command-line>:0:0: note: this is the location of the previous definition
> gcc -Wall -O2 -Wno-unused-function -D_GNU_SOURCE    read.c  -o /usr/src/p=
erf_selftests-x86_64-rhel-7.2-cdaa813278ddc616ee201eacda77f63996b5dd2d/tool=
s/testing/selftests/proc/read
> gcc -Wall -O2 -Wno-unused-function -D_GNU_SOURCE    self.c  -o /usr/src/p=
erf_selftests-x86_64-rhel-7.2-cdaa813278ddc616ee201eacda77f63996b5dd2d/tool=
s/testing/selftests/proc/self
> gcc -Wall -O2 -Wno-unused-function -D_GNU_SOURCE    thread-self.c  -o /us=
r/src/perf_selftests-x86_64-rhel-7.2-cdaa813278ddc616ee201eacda77f63996b5dd=
2d/tools/testing/selftests/proc/thread-self
> TAP version 13
> selftests: proc: fd-001-lookup
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ok 1..1 selftests: proc: fd-001-lookup [PASS]
> selftests: proc: fd-002-posix-eq
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ok 1..2 selftests: proc: fd-002-posix-eq [PASS]
> selftests: proc: fd-003-kthread
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ok 1..3 selftests: proc: fd-003-kthread [PASS]
> selftests: proc: proc-loadavg-001
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ok 1..4 selftests: proc: proc-loadavg-001 [PASS]
> selftests: proc: proc-self-map-files-001
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ok 1..5 selftests: proc: proc-self-map-files-001 [PASS]
> selftests: proc: proc-self-map-files-002
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ok 1..6 selftests: proc: proc-self-map-files-002 [PASS]
> selftests: proc: proc-self-syscall
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ok 1..7 selftests: proc: proc-self-syscall [PASS]
> selftests: proc: proc-self-wchan
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ok 1..8 selftests: proc: proc-self-wchan [PASS]
> selftests: proc: proc-uptime-001
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ok 1..9 selftests: proc: proc-uptime-001 [PASS]
> selftests: proc: proc-uptime-002
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ok 1..10 selftests: proc: proc-uptime-002 [PASS]
> selftests: proc: read
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ok 1..11 selftests: proc: read [PASS]
> selftests: proc: self
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ok 1..12 selftests: proc: self [PASS]
> selftests: proc: thread-self
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ok 1..13 selftests: proc: thread-self [PASS]
> make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa8132=
78ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/proc'
> =

> 2019-02-19 00:20:02 make run_tests -C pstore
> make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813=
278ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/pstore'
> TAP version 13
> selftests: pstore: pstore_tests
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D Pstore unit tests (pstore_tests) =3D=3D=3D
> UUID=3D0cd9b2af-a682-4d12-9ebe-9c3f346cfad3
> Checking pstore backend is registered ... ok
> 	backend=3Dramoops
> 	cmdline=3Dip=3D::::vm-snb-4G-746::dhcp root=3D/dev/ram0 user=3Dlkp job=
=3D/lkp/jobs/scheduled/vm-snb-4G-746/kernel_selftests-kselftests-02-debian-=
x86_64-2018-04-03.cgz-cdaa813-20190219-32418-xvb5w7-8.yaml ARCH=3Dx86_64 kc=
onfig=3Dx86_64-rhel-7.2 branch=3Dlinux-devel/devel-hourly-2019021713 commit=
=3Dcdaa813278ddc616ee201eacda77f63996b5dd2d BOOT_IMAGE=3D/pkg/linux/x86_64-=
rhel-7.2/gcc-7/cdaa813278ddc616ee201eacda77f63996b5dd2d/vmlinuz-5.0.0-rc4-0=
0004-gcdaa8132 erst_disable max_uptime=3D3600 RESULT_ROOT=3D/result/kernel_=
selftests/kselftests-02/vm-snb-4G/debian-x86_64-2018-04-03.cgz/x86_64-rhel-=
7.2/gcc-7/cdaa813278ddc616ee201eacda77f63996b5dd2d/8 LKP_SERVER=3Dinn debug=
 apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D100 net=
.ifnames=3D0 printk.devkmsg=3Don panic=3D-1 softlockup_panic=3D1 nmi_watchd=
og=3Dpanic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 drbd.minor_coun=
t=3D8 systemd.log_level=3Derr ignore_loglevel console=3Dtty0 earlyprintk=3D=
ttyS0,115200 console=3DttyS0,115200 vga=3Dnormal rw rcuperf.shutdown=3D0
> Checking pstore console is registered ... ok
> Checking /dev/pmsg0 exists ... ok
> Writing unique string to /dev/pmsg0 ... ok
> ok 1..1 selftests: pstore: pstore_tests [PASS]
> selftests: pstore: pstore_post_reboot_tests
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D Pstore unit tests (pstore_post_reboot_tests) =3D=3D=3D
> UUID=3D071a0f6f-7d44-4c16-adf0-70e0245025c7
> Checking pstore backend is registered ... ok
> 	backend=3Dramoops
> 	cmdline=3Dip=3D::::vm-snb-4G-746::dhcp root=3D/dev/ram0 user=3Dlkp job=
=3D/lkp/jobs/scheduled/vm-snb-4G-746/kernel_selftests-kselftests-02-debian-=
x86_64-2018-04-03.cgz-cdaa813-20190219-32418-xvb5w7-8.yaml ARCH=3Dx86_64 kc=
onfig=3Dx86_64-rhel-7.2 branch=3Dlinux-devel/devel-hourly-2019021713 commit=
=3Dcdaa813278ddc616ee201eacda77f63996b5dd2d BOOT_IMAGE=3D/pkg/linux/x86_64-=
rhel-7.2/gcc-7/cdaa813278ddc616ee201eacda77f63996b5dd2d/vmlinuz-5.0.0-rc4-0=
0004-gcdaa8132 erst_disable max_uptime=3D3600 RESULT_ROOT=3D/result/kernel_=
selftests/kselftests-02/vm-snb-4G/debian-x86_64-2018-04-03.cgz/x86_64-rhel-=
7.2/gcc-7/cdaa813278ddc616ee201eacda77f63996b5dd2d/8 LKP_SERVER=3Dinn debug=
 apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D100 net=
.ifnames=3D0 printk.devkmsg=3Don panic=3D-1 softlockup_panic=3D1 nmi_watchd=
og=3Dpanic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 drbd.minor_coun=
t=3D8 systemd.log_level=3Derr ignore_loglevel console=3Dtty0 earlyprintk=3D=
ttyS0,115200 console=3DttyS0,115200 vga=3Dnormal rw rcuperf.shutdown=3D0
> pstore_crash_test has not been executed yet. we skip further tests.
> not ok 1..2 selftests: pstore: pstore_post_reboot_tests [SKIP]
> make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa8132=
78ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/pstore'
> ptp test: not in Makefile
> 2019-02-19 00:20:02 make TARGETS=3Dptp
> make[1]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa=
813278ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/ptp'
> Makefile:10: warning: overriding recipe for target 'clean'
> ../lib.mk:137: warning: ignoring old recipe for target 'clean'
> gcc -I../../../../usr/include/    testptp.c  -lrt -o testptp
> make[1]: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa8=
13278ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/ptp'
> =

> 2019-02-19 00:20:02 make run_tests -C ptp
> make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813=
278ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/ptp'
> Makefile:10: warning: overriding recipe for target 'clean'
> ../lib.mk:137: warning: ignoring old recipe for target 'clean'
> TAP version 13
> selftests: ptp: testptp
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ok 1..1 selftests: ptp: testptp [PASS]
> make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa8132=
78ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/ptp'
> =

> 2019-02-19 00:20:02 make run_tests -C ptrace
> make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813=
278ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/ptrace'
> gcc -iquote../../../../include/uapi -Wall    peeksiginfo.c  -o /usr/src/p=
erf_selftests-x86_64-rhel-7.2-cdaa813278ddc616ee201eacda77f63996b5dd2d/tool=
s/testing/selftests/ptrace/peeksiginfo
> TAP version 13
> selftests: ptrace: peeksiginfo
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> PASS
> ok 1..1 selftests: ptrace: peeksiginfo [PASS]
> make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa8132=
78ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/ptrace'
> =

> 2019-02-19 00:20:02 make run_tests -C rseq
> make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813=
278ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/rseq'
> gcc -O2 -Wall -g -I./ -I../../../../usr/include/ -L./ -Wl,-rpath=3D./ -sh=
ared -fPIC rseq.c -lpthread -o /usr/src/perf_selftests-x86_64-rhel-7.2-cdaa=
813278ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/rseq/librseq.so
> gcc -O2 -Wall -g -I./ -I../../../../usr/include/ -L./ -Wl,-rpath=3D./ bas=
ic_test.c -lpthread -lrseq -o /usr/src/perf_selftests-x86_64-rhel-7.2-cdaa8=
13278ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/rseq/basic_test
> gcc -O2 -Wall -g -I./ -I../../../../usr/include/ -L./ -Wl,-rpath=3D./ bas=
ic_percpu_ops_test.c -lpthread -lrseq -o /usr/src/perf_selftests-x86_64-rhe=
l-7.2-cdaa813278ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/rseq=
/basic_percpu_ops_test
> gcc -O2 -Wall -g -I./ -I../../../../usr/include/ -L./ -Wl,-rpath=3D./ par=
am_test.c -lpthread -lrseq -o /usr/src/perf_selftests-x86_64-rhel-7.2-cdaa8=
13278ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/rseq/param_test
> gcc -O2 -Wall -g -I./ -I../../../../usr/include/ -L./ -Wl,-rpath=3D./ -DB=
ENCHMARK param_test.c -lpthread -lrseq -o /usr/src/perf_selftests-x86_64-rh=
el-7.2-cdaa813278ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/rse=
q/param_test_benchmark
> gcc -O2 -Wall -g -I./ -I../../../../usr/include/ -L./ -Wl,-rpath=3D./ -DR=
SEQ_COMPARE_TWICE param_test.c -lpthread -lrseq -o /usr/src/perf_selftests-=
x86_64-rhel-7.2-cdaa813278ddc616ee201eacda77f63996b5dd2d/tools/testing/self=
tests/rseq/param_test_compare_twice
> TAP version 13
> selftests: rseq: basic_test
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> testing current cpu
> ok 1..1 selftests: rseq: basic_test [PASS]
> selftests: rseq: basic_percpu_ops_test
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> spinlock
> percpu_list
> ok 1..2 selftests: rseq: basic_percpu_ops_test [PASS]
> selftests: rseq: param_test
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ok 1..3 selftests: rseq: param_test [PASS]
> selftests: rseq: param_test_benchmark
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ok 1..4 selftests: rseq: param_test_benchmark [PASS]
> selftests: rseq: param_test_compare_twice
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ok 1..5 selftests: rseq: param_test_compare_twice [PASS]
> selftests: rseq: run_param_test.sh
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Default parameters
> Running test spinlock
> Running compare-twice test spinlock
> Running test list
> Running compare-twice test list
> Running test buffer
> Running compare-twice test buffer
> Running test buffer with barrier
> Running compare-twice test buffer with barrier
> Running test memcpy
> Running compare-twice test memcpy
> Running test memcpy with barrier
> Running compare-twice test memcpy with barrier
> Running test increment
> Running compare-twice test increment
> Loop injection: 10000 loops
> Injecting at <1>
> Running test spinlock
> Running compare-twice test spinlock
> Running test list
> Running compare-twice test list
> Running test buffer
> Running compare-twice test buffer
> Running test buffer with barrier
> Running compare-twice test buffer with barrier
> Running test memcpy
> Running compare-twice test memcpy
> Running test memcpy with barrier
> Running compare-twice test memcpy with barrier
> Running test increment
> Running compare-twice test increment
> Injecting at <2>
> Running test spinlock
> Running compare-twice test spinlock
> Running test list
> Running compare-twice test list
> Running test buffer
> Running compare-twice test buffer
> Running test buffer with barrier
> Running compare-twice test buffer with barrier
> Running test memcpy
> Running compare-twice test memcpy
> Running test memcpy with barrier
> Running compare-twice test memcpy with barrier
> Running test increment
> Running compare-twice test increment
> Injecting at <3>
> Running test spinlock
> Running compare-twice test spinlock
> Running test list
> Running compare-twice test list
> Running test buffer
> Running compare-twice test buffer
> Running test buffer with barrier
> Running compare-twice test buffer with barrier
> Running test memcpy
> Running compare-twice test memcpy
> Running test memcpy with barrier
> Running compare-twice test memcpy with barrier
> Running test increment
> Running compare-twice test increment
> Injecting at <4>
> Running test spinlock
> Running compare-twice test spinlock
> Running test list
> Running compare-twice test list
> Running test buffer
> Running compare-twice test buffer
> Running test buffer with barrier
> Running compare-twice test buffer with barrier
> Running test memcpy
> Running compare-twice test memcpy
> Running test memcpy with barrier
> Running compare-twice test memcpy with barrier
> Running test increment
> Running compare-twice test increment
> Injecting at <5>
> Running test spinlock
> Running compare-twice test spinlock
> Running test list
> Running compare-twice test list
> Running test buffer
> Running compare-twice test buffer
> Running test buffer with barrier
> Running compare-twice test buffer with barrier
> Running test memcpy
> Running compare-twice test memcpy
> Running test memcpy with barrier
> Running compare-twice test memcpy with barrier
> Running test increment
> Running compare-twice test increment
> Injecting at <6>
> Running test spinlock
> Running compare-twice test spinlock
> Running test list
> Running compare-twice test list
> Running test buffer
> Running compare-twice test buffer
> Running test buffer with barrier
> Running compare-twice test buffer with barrier
> Running test memcpy
> Running compare-twice test memcpy
> Running test memcpy with barrier
> Running compare-twice test memcpy with barrier
> Running test increment
> Running compare-twice test increment
> Injecting at <7>
> Running test spinlock
> Running compare-twice test spinlock
> Running test list
> Running compare-twice test list
> Running test buffer
> Running compare-twice test buffer
> Running test buffer with barrier
> Running compare-twice test buffer with barrier
> Running test memcpy
> Running compare-twice test memcpy
> Running test memcpy with barrier
> Running compare-twice test memcpy with barrier
> Running test increment
> Running compare-twice test increment
> Injecting at <8>
> Running test spinlock
> Running compare-twice test spinlock
> Running test list
> Running compare-twice test list
> Running test buffer
> Running compare-twice test buffer
> Running test buffer with barrier
> Running compare-twice test buffer with barrier
> Running test memcpy
> Running compare-twice test memcpy
> Running test memcpy with barrier
> Running compare-twice test memcpy with barrier
> Running test increment
> Running compare-twice test increment
> Injecting at <9>
> Running test spinlock
> Running compare-twice test spinlock
> Running test list
> Running compare-twice test list
> Running test buffer
> Running compare-twice test buffer
> Running test buffer with barrier
> Running compare-twice test buffer with barrier
> Running test memcpy
> Running compare-twice test memcpy
> Running test memcpy with barrier
> Running compare-twice test memcpy with barrier
> Running test increment
> Running compare-twice test increment
> Yield injection (25%)
> Injecting at <7>
> Running test spinlock
> Running compare-twice test spinlock
> Running test list
> Running compare-twice test list
> Running test buffer
> Running compare-twice test buffer
> Running test buffer with barrier
> Running compare-twice test buffer with barrier
> Running test memcpy
> Running compare-twice test memcpy
> Running test memcpy with barrier
> Running compare-twice test memcpy with barrier
> Running test increment
> Running compare-twice test increment
> Injecting at <8>
> Running test spinlock
> Running compare-twice test spinlock
> Running test list
> Running compare-twice test list
> Running test buffer
> Running compare-twice test buffer
> Running test buffer with barrier
> Running compare-twice test buffer with barrier
> Running test memcpy
> Running compare-twice test memcpy
> Running test memcpy with barrier
> Running compare-twice test memcpy with barrier
> Running test increment
> Running compare-twice test increment
> Injecting at <9>
> Running test spinlock
> Running compare-twice test spinlock
> Running test list
> Running compare-twice test list
> Running test buffer
> Running compare-twice test buffer
> Running test buffer with barrier
> Running compare-twice test buffer with barrier
> Running test memcpy
> Running compare-twice test memcpy
> Running test memcpy with barrier
> Running compare-twice test memcpy with barrier
> Running test increment
> Running compare-twice test increment
> Yield injection (50%)
> Injecting at <7>
> Running test spinlock
> Running compare-twice test spinlock
> Running test list
> Running compare-twice test list
> Running test buffer
> Running compare-twice test buffer
> Running test buffer with barrier
> Running compare-twice test buffer with barrier
> Running test memcpy
> Running compare-twice test memcpy
> Running test memcpy with barrier
> Running compare-twice test memcpy with barrier
> Running test increment
> Running compare-twice test increment
> Injecting at <8>
> Running test spinlock
> Running compare-twice test spinlock
> Running test list
> Running compare-twice test list
> Running test buffer
> Running compare-twice test buffer
> Running test buffer with barrier
> Running compare-twice test buffer with barrier
> Running test memcpy
> Running compare-twice test memcpy
> Running test memcpy with barrier
> Running compare-twice test memcpy with barrier
> Running test increment
> Running compare-twice test increment
> Injecting at <9>
> Running test spinlock
> Running compare-twice test spinlock
> Running test list
> Running compare-twice test list
> Running test buffer
> Running compare-twice test buffer
> Running test buffer with barrier
> Running compare-twice test buffer with barrier
> Running test memcpy
> Running compare-twice test memcpy
> Running test memcpy with barrier
> Running compare-twice test memcpy with barrier
> Running test increment
> Running compare-twice test increment
> Yield injection (100%)
> Injecting at <7>
> Running test spinlock
> Running compare-twice test spinlock
> Running test list
> Running compare-twice test list
> Running test buffer
> Running compare-twice test buffer
> Running test buffer with barrier
> Running compare-twice test buffer with barrier
> Running test memcpy
> Running compare-twice test memcpy
> Running test memcpy with barrier
> Running compare-twice test memcpy with barrier
> Running test increment
> Running compare-twice test increment
> Injecting at <8>
> Running test spinlock
> Running compare-twice test spinlock
> Running test list
> Running compare-twice test list
> Running test buffer
> Running compare-twice test buffer
> Running test buffer with barrier
> Running compare-twice test buffer with barrier
> Running test memcpy
> Running compare-twice test memcpy
> Running test memcpy with barrier
> Running compare-twice test memcpy with barrier
> Running test increment
> Running compare-twice test increment
> Injecting at <9>
> Running test spinlock
> Running compare-twice test spinlock
> Running test list
> Running compare-twice test list
> Running test buffer
> Running compare-twice test buffer
> Running test buffer with barrier
> Running compare-twice test buffer with barrier
> Running test memcpy
> Running compare-twice test memcpy
> Running test memcpy with barrier
> Running compare-twice test memcpy with barrier
> Running test increment
> Running compare-twice test increment
> Kill injection (25%)
> Injecting at <7>
> Running test spinlock
> Running compare-twice test spinlock
> Running test list
> Running compare-twice test list
> Running test buffer
> Running compare-twice test buffer
> Running test buffer with barrier
> Running compare-twice test buffer with barrier
> Running test memcpy
> Running compare-twice test memcpy
> Running test memcpy with barrier
> Running compare-twice test memcpy with barrier
> Running test increment
> Running compare-twice test increment
> Injecting at <8>
> Running test spinlock
> Running compare-twice test spinlock
> Running test list
> Running compare-twice test list
> Running test buffer
> Running compare-twice test buffer
> Running test buffer with barrier
> Running compare-twice test buffer with barrier
> Running test memcpy
> Running compare-twice test memcpy
> Running test memcpy with barrier
> Running compare-twice test memcpy with barrier
> Running test increment
> Running compare-twice test increment
> Injecting at <9>
> Running test spinlock
> Running compare-twice test spinlock
> Running test list
> Running compare-twice test list
> Running test buffer
> Running compare-twice test buffer
> Running test buffer with barrier
> Running compare-twice test buffer with barrier
> Running test memcpy
> Running compare-twice test memcpy
> Running test memcpy with barrier
> Running compare-twice test memcpy with barrier
> Running test increment
> Running compare-twice test increment
> Kill injection (50%)
> Injecting at <7>
> Running test spinlock
> Running compare-twice test spinlock
> Running test list
> Running compare-twice test list
> Running test buffer
> Running compare-twice test buffer
> Running test buffer with barrier
> Running compare-twice test buffer with barrier
> Running test memcpy
> Running compare-twice test memcpy
> Running test memcpy with barrier
> Running compare-twice test memcpy with barrier
> Running test increment
> Running compare-twice test increment
> Injecting at <8>
> Running test spinlock
> Running compare-twice test spinlock
> Running test list
> Running compare-twice test list
> Running test buffer
> Running compare-twice test buffer
> Running test buffer with barrier
> Running compare-twice test buffer with barrier
> Running test memcpy
> Running compare-twice test memcpy
> Running test memcpy with barrier
> Running compare-twice test memcpy with barrier
> Running test increment
> Running compare-twice test increment
> Injecting at <9>
> Running test spinlock
> Running compare-twice test spinlock
> Running test list
> Running compare-twice test list
> Running test buffer
> Running compare-twice test buffer
> Running test buffer with barrier
> Running compare-twice test buffer with barrier
> Running test memcpy
> Running compare-twice test memcpy
> Running test memcpy with barrier
> Running compare-twice test memcpy with barrier
> Running test increment
> Running compare-twice test increment
> Kill injection (100%)
> Injecting at <7>
> Running test spinlock
> Running compare-twice test spinlock
> Running test list
> Running compare-twice test list
> Running test buffer
> Running compare-twice test buffer
> Running test buffer with barrier
> Running compare-twice test buffer with barrier
> Running test memcpy
> Running compare-twice test memcpy
> Running test memcpy with barrier
> Running compare-twice test memcpy with barrier
> Running test increment
> Running compare-twice test increment
> Injecting at <8>
> Running test spinlock
> Running compare-twice test spinlock
> Running test list
> Running compare-twice test list
> Running test buffer
> Running compare-twice test buffer
> Running test buffer with barrier
> Running compare-twice test buffer with barrier
> Running test memcpy
> Running compare-twice test memcpy
> Running test memcpy with barrier
> Running compare-twice test memcpy with barrier
> Running test increment
> Running compare-twice test increment
> Injecting at <9>
> Running test spinlock
> Running compare-twice test spinlock
> Running test list
> Running compare-twice test list
> Running test buffer
> Running compare-twice test buffer
> Running test buffer with barrier
> Running compare-twice test buffer with barrier
> Running test memcpy
> Running compare-twice test memcpy
> Running test memcpy with barrier
> Running compare-twice test memcpy with barrier
> Running test increment
> Running compare-twice test increment
> Sleep injection (1ms, 25%)
> Injecting at <7>
> Running test spinlock
> Running compare-twice test spinlock
> Running test list
> Running compare-twice test list
> Running test buffer
> Running compare-twice test buffer
> Running test buffer with barrier
> Running compare-twice test buffer with barrier
> Running test memcpy
> Running compare-twice test memcpy
> Running test memcpy with barrier
> Running compare-twice test memcpy with barrier
> Running test increment
> Running compare-twice test increment
> Injecting at <8>
> Running test spinlock
> Running compare-twice test spinlock
> Running test list
> Running compare-twice test list
> Running test buffer
> Running compare-twice test buffer
> Running test buffer with barrier
> Running compare-twice test buffer with barrier
> Running test memcpy
> Running compare-twice test memcpy
> Running test memcpy with barrier
> Running compare-twice test memcpy with barrier
> Running test increment
> Running compare-twice test increment
> Injecting at <9>
> Running test spinlock
> Running compare-twice test spinlock
> Running test list
> Running compare-twice test list
> Running test buffer
> Running compare-twice test buffer
> Running test buffer with barrier
> Running compare-twice test buffer with barrier
> Running test memcpy
> Running compare-twice test memcpy
> Running test memcpy with barrier
> Running compare-twice test memcpy with barrier
> Running test increment
> Running compare-twice test increment
> Sleep injection (1ms, 50%)
> Injecting at <7>
> Running test spinlock
> Running compare-twice test spinlock
> Running test list
> Running compare-twice test list
> Running test buffer
> Running compare-twice test buffer
> Running test buffer with barrier
> Running compare-twice test buffer with barrier
> Running test memcpy
> Running compare-twice test memcpy
> Running test memcpy with barrier
> Running compare-twice test memcpy with barrier
> Running test increment
> Running compare-twice test increment
> Injecting at <8>
> Running test spinlock
> Running compare-twice test spinlock
> Running test list
> Running compare-twice test list
> Running test buffer
> Running compare-twice test buffer
> Running test buffer with barrier
> Running compare-twice test buffer with barrier
> Running test memcpy
> Running compare-twice test memcpy
> Running test memcpy with barrier
> Running compare-twice test memcpy with barrier
> Running test increment
> Running compare-twice test increment
> Injecting at <9>
> Running test spinlock
> Running compare-twice test spinlock
> Running test list
> Running compare-twice test list
> Running test buffer
> Running compare-twice test buffer
> Running test buffer with barrier
> Running compare-twice test buffer with barrier
> Running test memcpy
> Running compare-twice test memcpy
> Running test memcpy with barrier
> Running compare-twice test memcpy with barrier
> Running test increment
> Running compare-twice test increment
> Sleep injection (1ms, 100%)
> Injecting at <7>
> Running test spinlock
> Running compare-twice test spinlock
> Running test list
> Running compare-twice test list
> Running test buffer
> Running compare-twice test buffer
> Running test buffer with barrier
> Running compare-twice test buffer with barrier
> Running test memcpy
> Running compare-twice test memcpy
> Running test memcpy with barrier
> Running compare-twice test memcpy with barrier
> Running test increment
> Running compare-twice test increment
> Injecting at <8>
> Running test spinlock
> Running compare-twice test spinlock
> Running test list
> Running compare-twice test list
> Running test buffer
> Running compare-twice test buffer
> Running test buffer with barrier
> Running compare-twice test buffer with barrier
> Running test memcpy
> Running compare-twice test memcpy
> Running test memcpy with barrier
> Running compare-twice test memcpy with barrier
> Running test increment
> Running compare-twice test increment
> Injecting at <9>
> Running test spinlock
> Running compare-twice test spinlock
> Running test list
> Running compare-twice test list
> Running test buffer
> Running compare-twice test buffer
> Running test buffer with barrier
> Running compare-twice test buffer with barrier
> Running test memcpy
> Running compare-twice test memcpy
> Running test memcpy with barrier
> Running compare-twice test memcpy with barrier
> Running test increment
> Running compare-twice test increment
> ok 1..6 selftests: rseq: run_param_test.sh [PASS]
> make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa8132=
78ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/rseq'
> =

> 2019-02-19 00:53:46 make run_tests -C rtc
> make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813=
278ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/rtc'
> gcc -O3 -Wl,-no-as-needed -Wall  -lrt -lpthread -lm  rtctest.c  -o /usr/s=
rc/perf_selftests-x86_64-rhel-7.2-cdaa813278ddc616ee201eacda77f63996b5dd2d/=
tools/testing/selftests/rtc/rtctest
> gcc -O3 -Wl,-no-as-needed -Wall  -lrt -lpthread -lm  setdate.c  -o /usr/s=
rc/perf_selftests-x86_64-rhel-7.2-cdaa813278ddc616ee201eacda77f63996b5dd2d/=
tools/testing/selftests/rtc/setdate
> TAP version 13
> selftests: rtc: rtctest
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> rtctest.c:49:rtc.date_read:Current RTC date/time is 19/02/2019 00:53:47.
> rtctest.c:137:rtc.alarm_alm_set:Alarm time now set to 00:53:56.
> rtctest.c:156:rtc.alarm_alm_set:data: 1a0
> rtctest.c:195:rtc.alarm_wkalm_set:Alarm time now set to 19/02/2019 00:53:=
59.
> rtctest.c:239:rtc.alarm_alm_set_minute:Alarm time now set to 00:54:00.
> rtctest.c:258:rtc.alarm_alm_set_minute:data: 1a0
> rtctest.c:297:rtc.alarm_wkalm_set_minute:Alarm time now set to 19/02/2019=
 00:55:00.
> [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D] Running 7 tests from 2 test cases.
> [ RUN      ] rtc.date_read
> [       OK ] rtc.date_read
> [ RUN      ] rtc.uie_read
> [       OK ] rtc.uie_read
> [ RUN      ] rtc.uie_select
> [       OK ] rtc.uie_select
> [ RUN      ] rtc.alarm_alm_set
> [       OK ] rtc.alarm_alm_set
> [ RUN      ] rtc.alarm_wkalm_set
> [       OK ] rtc.alarm_wkalm_set
> [ RUN      ] rtc.alarm_alm_set_minute
> [       OK ] rtc.alarm_alm_set_minute
> [ RUN      ] rtc.alarm_wkalm_set_minute
> [       OK ] rtc.alarm_wkalm_set_minute
> [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D] 7 / 7 tests passed.
> [  PASSED  ]
> ok 1..1 selftests: rtc: rtctest [PASS]
> make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa8132=
78ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/rtc'
> =

> 2019-02-19 00:54:59 make run_tests -C seccomp
> make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813=
278ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/seccomp'
> gcc -Wl,-no-as-needed -Wall  seccomp_bpf.c -lpthread -o seccomp_bpf
> gcc -Wl,-no-as-needed -Wall    seccomp_benchmark.c   -o seccomp_benchmark
> TAP version 13
> selftests: seccomp: seccomp_bpf
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D] Running 72 tests from 1 test cases.
> [ RUN      ] global.mode_strict_support
> [       OK ] global.mode_strict_support
> [ RUN      ] global.mode_strict_cannot_call_prctl
> [       OK ] global.mode_strict_cannot_call_prctl
> [ RUN      ] global.no_new_privs_support
> [       OK ] global.no_new_privs_support
> [ RUN      ] global.mode_filter_support
> [       OK ] global.mode_filter_support
> [ RUN      ] global.mode_filter_without_nnp
> [       OK ] global.mode_filter_without_nnp
> [ RUN      ] global.filter_size_limits
> [       OK ] global.filter_size_limits
> [ RUN      ] global.filter_chain_limits
> [       OK ] global.filter_chain_limits
> [ RUN      ] global.mode_filter_cannot_move_to_strict
> [       OK ] global.mode_filter_cannot_move_to_strict
> [ RUN      ] global.mode_filter_get_seccomp
> [       OK ] global.mode_filter_get_seccomp
> [ RUN      ] global.ALLOW_all
> [       OK ] global.ALLOW_all
> [ RUN      ] global.empty_prog
> [       OK ] global.empty_prog
> [ RUN      ] global.log_all
> [       OK ] global.log_all
> [ RUN      ] global.unknown_ret_is_kill_inside
> [       OK ] global.unknown_ret_is_kill_inside
> [ RUN      ] global.unknown_ret_is_kill_above_allow
> [       OK ] global.unknown_ret_is_kill_above_allow
> [ RUN      ] global.KILL_all
> [       OK ] global.KILL_all
> [ RUN      ] global.KILL_one
> [       OK ] global.KILL_one
> [ RUN      ] global.KILL_one_arg_one
> [       OK ] global.KILL_one_arg_one
> [ RUN      ] global.KILL_one_arg_six
> [       OK ] global.KILL_one_arg_six
> [ RUN      ] global.KILL_thread
> [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D] Running 72 tests from 1 test cases.
> [ RUN      ] global.mode_strict_support
> [       OK ] global.mode_strict_support
> [ RUN      ] global.mode_strict_cannot_call_prctl
> [       OK ] global.mode_strict_cannot_call_prctl
> [ RUN      ] global.no_new_privs_support
> [       OK ] global.no_new_privs_support
> [ RUN      ] global.mode_filter_support
> [       OK ] global.mode_filter_support
> [ RUN      ] global.mode_filter_without_nnp
> [       OK ] global.mode_filter_without_nnp
> [ RUN      ] global.filter_size_limits
> [       OK ] global.filter_size_limits
> [ RUN      ] global.filter_chain_limits
> [       OK ] global.filter_chain_limits
> [ RUN      ] global.mode_filter_cannot_move_to_strict
> [       OK ] global.mode_filter_cannot_move_to_strict
> [ RUN      ] global.mode_filter_get_seccomp
> [       OK ] global.mode_filter_get_seccomp
> [ RUN      ] global.ALLOW_all
> [       OK ] global.ALLOW_all
> [ RUN      ] global.empty_prog
> [       OK ] global.empty_prog
> [ RUN      ] global.log_all
> [       OK ] global.log_all
> [ RUN      ] global.unknown_ret_is_kill_inside
> [       OK ] global.unknown_ret_is_kill_inside
> [ RUN      ] global.unknown_ret_is_kill_above_allow
> [       OK ] global.unknown_ret_is_kill_above_allow
> [ RUN      ] global.KILL_all
> [       OK ] global.KILL_all
> [ RUN      ] global.KILL_one
> [       OK ] global.KILL_one
> [ RUN      ] global.KILL_one_arg_one
> [       OK ] global.KILL_one_arg_one
> [ RUN      ] global.KILL_one_arg_six
> [       OK ] global.KILL_one_arg_six
> [ RUN      ] global.KILL_thread
> [       OK ] global.KILL_thread
> [ RUN      ] global.KILL_process
> [       OK ] global.KILL_process
> [ RUN      ] global.arg_out_of_range
> [       OK ] global.arg_out_of_range
> [ RUN      ] global.ERRNO_valid
> [       OK ] global.ERRNO_valid
> [ RUN      ] global.ERRNO_zero
> [       OK ] global.ERRNO_zero
> [ RUN      ] global.ERRNO_capped
> [       OK ] global.ERRNO_capped
> [ RUN      ] global.ERRNO_order
> [       OK ] global.ERRNO_order
> [ RUN      ] TRAP.dfl
> [       OK ] TRAP.dfl
> [ RUN      ] TRAP.ign
> [       OK ] TRAP.ign
> [ RUN      ] TRAP.handler
> [       OK ] TRAP.handler
> [ RUN      ] precedence.allow_ok
> [       OK ] precedence.allow_ok
> [ RUN      ] precedence.kill_is_highest
> [       OK ] precedence.kill_is_highest
> [ RUN      ] precedence.kill_is_highest_in_any_order
> [       OK ] precedence.kill_is_highest_in_any_order
> [ RUN      ] precedence.trap_is_second
> [       OK ] precedence.trap_is_second
> [ RUN      ] precedence.trap_is_second_in_any_order
> [       OK ] precedence.trap_is_second_in_any_order
> [ RUN      ] precedence.errno_is_third
> [       OK ] precedence.errno_is_third
> [ RUN      ] precedence.errno_is_third_in_any_order
> [       OK ] precedence.errno_is_third_in_any_order
> [ RUN      ] precedence.trace_is_fourth
> [       OK ] precedence.trace_is_fourth
> [ RUN      ] precedence.trace_is_fourth_in_any_order
> [       OK ] precedence.trace_is_fourth_in_any_order
> [ RUN      ] precedence.log_is_fifth
> [       OK ] precedence.log_is_fifth
> [ RUN      ] precedence.log_is_fifth_in_any_order
> [       OK ] precedence.log_is_fifth_in_any_order
> [ RUN      ] TRACE_poke.read_has_side_effects
> [       OK ] TRACE_poke.read_has_side_effects
> [ RUN      ] TRACE_poke.getpid_runs_normally
> [       OK ] TRACE_poke.getpid_runs_normally
> [ RUN      ] TRACE_syscall.ptrace_syscall_redirected
> [       OK ] TRACE_syscall.ptrace_syscall_redirected
> [ RUN      ] TRACE_syscall.ptrace_syscall_dropped
> [       OK ] TRACE_syscall.ptrace_syscall_dropped
> [ RUN      ] TRACE_syscall.syscall_allowed
> [       OK ] TRACE_syscall.syscall_allowed
> [ RUN      ] TRACE_syscall.syscall_redirected
> [       OK ] TRACE_syscall.syscall_redirected
> [ RUN      ] TRACE_syscall.syscall_dropped
> [       OK ] TRACE_syscall.syscall_dropped
> [ RUN      ] TRACE_syscall.skip_after_RET_TRACE
> [       OK ] TRACE_syscall.skip_after_RET_TRACE
> [ RUN      ] TRACE_syscall.kill_after_RET_TRACE
> [       OK ] TRACE_syscall.kill_after_RET_TRACE
> [ RUN      ] TRACE_syscall.skip_after_ptrace
> [       OK ] TRACE_syscall.skip_after_ptrace
> [ RUN      ] TRACE_syscall.kill_after_ptrace
> [       OK ] TRACE_syscall.kill_after_ptrace
> [ RUN      ] global.seccomp_syscall
> [       OK ] global.seccomp_syscall
> [ RUN      ] global.seccomp_syscall_mode_lock
> [       OK ] global.seccomp_syscall_mode_lock
> [ RUN      ] global.detect_seccomp_filter_flags
> [       OK ] global.detect_seccomp_filter_flags
> [ RUN      ] global.TSYNC_first
> [       OK ] global.TSYNC_first
> [ RUN      ] TSYNC.siblings_fail_prctl
> [       OK ] TSYNC.siblings_fail_prctl
> [ RUN      ] TSYNC.two_siblings_with_ancestor
> [       OK ] TSYNC.two_siblings_with_ancestor
> [ RUN      ] TSYNC.two_sibling_want_nnp
> [       OK ] TSYNC.two_sibling_want_nnp
> [ RUN      ] TSYNC.two_siblings_with_no_filter
> [       OK ] TSYNC.two_siblings_with_no_filter
> [ RUN      ] TSYNC.two_siblings_with_one_divergence
> [       OK ] TSYNC.two_siblings_with_one_divergence
> [ RUN      ] TSYNC.two_siblings_not_under_filter
> [       OK ] TSYNC.two_siblings_not_under_filter
> [ RUN      ] global.syscall_restart
> [       OK ] global.syscall_restart
> [ RUN      ] global.filter_flag_log
> [       OK ] global.filter_flag_log
> [ RUN      ] global.get_action_avail
> [       OK ] global.get_action_avail
> [ RUN      ] global.get_metadata
> [       OK ] global.get_metadata
> [ RUN      ] global.user_notification_basic
> comp_syscall
> [       OK ] global.seccomp_syscall
> [ RUN      ] global.seccomp_syscall_mode_lock
> [       OK ] global.seccomp_syscall_mode_lock
> [ RUN      ] global.detect_seccomp_filter_flags
> [       OK ] global.detect_seccomp_filter_flags
> [ RUN      ] global.TSYNC_first
> [       OK ] global.TSYNC_first
> [ RUN      ] TSYNC.siblings_fail_prctl
> [       OK ] TSYNC.siblings_fail_prctl
> [ RUN      ] TSYNC.two_siblings_with_ancestor
> [       OK ] TSYNC.two_siblings_with_ancestor
> [ RUN      ] TSYNC.two_sibling_want_nnp
> [       OK ] TSYNC.two_sibling_want_nnp
> [ RUN      ] TSYNC.two_siblings_with_no_filter
> [       OK ] TSYNC.two_siblings_with_no_filter
> [ RUN      ] TSYNC.two_siblings_with_one_divergence
> [       OK ] TSYNC.two_siblings_with_one_divergence
> [ RUN      ] TSYNC.two_siblings_not_under_filter
> [       OK ] TSYNC.two_siblings_not_under_filter
> [ RUN      ] global.syscall_restart
> [       OK ] global.syscall_restart
> [ RUN      ] global.filter_flag_log
> [       OK ] global.filter_flag_log
> [ RUN      ] global.get_action_avail
> [       OK ] global.get_action_avail
> [ RUN      ] global.get_metadata
> [       OK ] global.get_metadata
> [ RUN      ] global.user_notification_basic
> comp_syscall
> [       OK ] global.seccomp_syscall
> [ RUN      ] global.seccomp_syscall_mode_lock
> [       OK ] global.seccomp_syscall_mode_lock
> [ RUN      ] global.detect_seccomp_filter_flags
> [       OK ] global.detect_seccomp_filter_flags
> [ RUN      ] global.TSYNC_first
> [       OK ] global.TSYNC_first
> [ RUN      ] TSYNC.siblings_fail_prctl
> [       OK ] TSYNC.siblings_fail_prctl
> [ RUN      ] TSYNC.two_siblings_with_ancestor
> [       OK ] TSYNC.two_siblings_with_ancestor
> [ RUN      ] TSYNC.two_sibling_want_nnp
> [       OK ] TSYNC.two_sibling_want_nnp
> [ RUN      ] TSYNC.two_siblings_with_no_filter
> [       OK ] TSYNC.two_siblings_with_no_filter
> [ RUN      ] TSYNC.two_siblings_with_one_divergence
> [       OK ] TSYNC.two_siblings_with_one_divergence
> [ RUN      ] TSYNC.two_siblings_not_under_filter
> [       OK ] TSYNC.two_siblings_not_under_filter
> [ RUN      ] global.syscall_restart
> [       OK ] global.syscall_restart
> [ RUN      ] global.filter_flag_log
> [       OK ] global.filter_flag_log
> [ RUN      ] global.get_action_avail
> [       OK ] global.get_action_avail
> [ RUN      ] global.get_metadata
> [       OK ] global.get_metadata
> [ RUN      ] global.user_notification_basic
> [       OK ] global.user_notification_basic
> [ RUN      ] global.user_notification_kill_in_middle
> [       OK ] global.user_notification_kill_in_middle
> [ RUN      ] global.user_notification_signal
> comp_syscall
> [       OK ] global.seccomp_syscall
> [ RUN      ] global.seccomp_syscall_mode_lock
> [       OK ] global.seccomp_syscall_mode_lock
> [ RUN      ] global.detect_seccomp_filter_flags
> [       OK ] global.detect_seccomp_filter_flags
> [ RUN      ] global.TSYNC_first
> [       OK ] global.TSYNC_first
> [ RUN      ] TSYNC.siblings_fail_prctl
> [       OK ] TSYNC.siblings_fail_prctl
> [ RUN      ] TSYNC.two_siblings_with_ancestor
> [       OK ] TSYNC.two_siblings_with_ancestor
> [ RUN      ] TSYNC.two_sibling_want_nnp
> [       OK ] TSYNC.two_sibling_want_nnp
> [ RUN      ] TSYNC.two_siblings_with_no_filter
> [       OK ] TSYNC.two_siblings_with_no_filter
> [ RUN      ] TSYNC.two_siblings_with_one_divergence
> [       OK ] TSYNC.two_siblings_with_one_divergence
> [ RUN      ] TSYNC.two_siblings_not_under_filter
> [       OK ] TSYNC.two_siblings_not_under_filter
> [ RUN      ] global.syscall_restart
> [       OK ] global.syscall_restart
> [ RUN      ] global.filter_flag_log
> [       OK ] global.filter_flag_log
> [ RUN      ] global.get_action_avail
> [       OK ] global.get_action_avail
> [ RUN      ] global.get_metadata
> [       OK ] global.get_metadata
> [ RUN      ] global.user_notification_basic
> [       OK ] global.user_notification_basic
> [ RUN      ] global.user_notification_kill_in_middle
> [       OK ] global.user_notification_kill_in_middle
> [ RUN      ] global.user_notification_signal
> [       OK ] global.user_notification_signal
> [ RUN      ] global.user_notification_closed_listener
> comp_syscall
> [       OK ] global.seccomp_syscall
> [ RUN      ] global.seccomp_syscall_mode_lock
> [       OK ] global.seccomp_syscall_mode_lock
> [ RUN      ] global.detect_seccomp_filter_flags
> [       OK ] global.detect_seccomp_filter_flags
> [ RUN      ] global.TSYNC_first
> [       OK ] global.TSYNC_first
> [ RUN      ] TSYNC.siblings_fail_prctl
> [       OK ] TSYNC.siblings_fail_prctl
> [ RUN      ] TSYNC.two_siblings_with_ancestor
> [       OK ] TSYNC.two_siblings_with_ancestor
> [ RUN      ] TSYNC.two_sibling_want_nnp
> [       OK ] TSYNC.two_sibling_want_nnp
> [ RUN      ] TSYNC.two_siblings_with_no_filter
> [       OK ] TSYNC.two_siblings_with_no_filter
> [ RUN      ] TSYNC.two_siblings_with_one_divergence
> [       OK ] TSYNC.two_siblings_with_one_divergence
> [ RUN      ] TSYNC.two_siblings_not_under_filter
> [       OK ] TSYNC.two_siblings_not_under_filter
> [ RUN      ] global.syscall_restart
> [       OK ] global.syscall_restart
> [ RUN      ] global.filter_flag_log
> [       OK ] global.filter_flag_log
> [ RUN      ] global.get_action_avail
> [       OK ] global.get_action_avail
> [ RUN      ] global.get_metadata
> [       OK ] global.get_metadata
> [ RUN      ] global.user_notification_basic
> [       OK ] global.user_notification_basic
> [ RUN      ] global.user_notification_kill_in_middle
> [       OK ] global.user_notification_kill_in_middle
> [ RUN      ] global.user_notification_signal
> [       OK ] global.user_notification_signal
> [ RUN      ] global.user_notification_closed_listener
> [       OK ] global.user_notification_closed_listener
> [ RUN      ] global.user_notification_child_pid_ns
> comp_syscall
> [       OK ] global.seccomp_syscall
> [ RUN      ] global.seccomp_syscall_mode_lock
> [       OK ] global.seccomp_syscall_mode_lock
> [ RUN      ] global.detect_seccomp_filter_flags
> [       OK ] global.detect_seccomp_filter_flags
> [ RUN      ] global.TSYNC_first
> [       OK ] global.TSYNC_first
> [ RUN      ] TSYNC.siblings_fail_prctl
> [       OK ] TSYNC.siblings_fail_prctl
> [ RUN      ] TSYNC.two_siblings_with_ancestor
> [       OK ] TSYNC.two_siblings_with_ancestor
> [ RUN      ] TSYNC.two_sibling_want_nnp
> [       OK ] TSYNC.two_sibling_want_nnp
> [ RUN      ] TSYNC.two_siblings_with_no_filter
> [       OK ] TSYNC.two_siblings_with_no_filter
> [ RUN      ] TSYNC.two_siblings_with_one_divergence
> [       OK ] TSYNC.two_siblings_with_one_divergence
> [ RUN      ] TSYNC.two_siblings_not_under_filter
> [       OK ] TSYNC.two_siblings_not_under_filter
> [ RUN      ] global.syscall_restart
> [       OK ] global.syscall_restart
> [ RUN      ] global.filter_flag_log
> [       OK ] global.filter_flag_log
> [ RUN      ] global.get_action_avail
> [       OK ] global.get_action_avail
> [ RUN      ] global.get_metadata
> [       OK ] global.get_metadata
> [ RUN      ] global.user_notification_basic
> [       OK ] global.user_notification_basic
> [ RUN      ] global.user_notification_kill_in_middle
> [       OK ] global.user_notification_kill_in_middle
> [ RUN      ] global.user_notification_signal
> [       OK ] global.user_notification_signal
> [ RUN      ] global.user_notification_closed_listener
> [       OK ] global.user_notification_closed_listener
> [ RUN      ] global.user_notification_child_pid_ns
> [       OK ] global.user_notification_child_pid_ns
> [ RUN      ] global.user_notification_sibling_pid_ns
> comp_syscall
> [       OK ] global.seccomp_syscall
> [ RUN      ] global.seccomp_syscall_mode_lock
> [       OK ] global.seccomp_syscall_mode_lock
> [ RUN      ] global.detect_seccomp_filter_flags
> [       OK ] global.detect_seccomp_filter_flags
> [ RUN      ] global.TSYNC_first
> [       OK ] global.TSYNC_first
> [ RUN      ] TSYNC.siblings_fail_prctl
> [       OK ] TSYNC.siblings_fail_prctl
> [ RUN      ] TSYNC.two_siblings_with_ancestor
> [       OK ] TSYNC.two_siblings_with_ancestor
> [ RUN      ] TSYNC.two_sibling_want_nnp
> [       OK ] TSYNC.two_sibling_want_nnp
> [ RUN      ] TSYNC.two_siblings_with_no_filter
> [       OK ] TSYNC.two_siblings_with_no_filter
> [ RUN      ] TSYNC.two_siblings_with_one_divergence
> [       OK ] TSYNC.two_siblings_with_one_divergence
> [ RUN      ] TSYNC.two_siblings_not_under_filter
> [       OK ] TSYNC.two_siblings_not_under_filter
> [ RUN      ] global.syscall_restart
> [       OK ] global.syscall_restart
> [ RUN      ] global.filter_flag_log
> [       OK ] global.filter_flag_log
> [ RUN      ] global.get_action_avail
> [       OK ] global.get_action_avail
> [ RUN      ] global.get_metadata
> [       OK ] global.get_metadata
> [ RUN      ] global.user_notification_basic
> [       OK ] global.user_notification_basic
> [ RUN      ] global.user_notification_kill_in_middle
> [       OK ] global.user_notification_kill_in_middle
> [ RUN      ] global.user_notification_signal
> [       OK ] global.user_notification_signal
> [ RUN      ] global.user_notification_closed_listener
> [       OK ] global.user_notification_closed_listener
> [ RUN      ] global.user_notification_child_pid_ns
> [       OK ] global.user_notification_child_pid_ns
> [ RUN      ] global.user_notification_sibling_pid_ns
> comp_syscall
> [       OK ] global.seccomp_syscall
> [ RUN      ] global.seccomp_syscall_mode_lock
> [       OK ] global.seccomp_syscall_mode_lock
> [ RUN      ] global.detect_seccomp_filter_flags
> [       OK ] global.detect_seccomp_filter_flags
> [ RUN      ] global.TSYNC_first
> [       OK ] global.TSYNC_first
> [ RUN      ] TSYNC.siblings_fail_prctl
> [       OK ] TSYNC.siblings_fail_prctl
> [ RUN      ] TSYNC.two_siblings_with_ancestor
> [       OK ] TSYNC.two_siblings_with_ancestor
> [ RUN      ] TSYNC.two_sibling_want_nnp
> [       OK ] TSYNC.two_sibling_want_nnp
> [ RUN      ] TSYNC.two_siblings_with_no_filter
> [       OK ] TSYNC.two_siblings_with_no_filter
> [ RUN      ] TSYNC.two_siblings_with_one_divergence
> [       OK ] TSYNC.two_siblings_with_one_divergence
> [ RUN      ] TSYNC.two_siblings_not_under_filter
> [       OK ] TSYNC.two_siblings_not_under_filter
> [ RUN      ] global.syscall_restart
> [       OK ] global.syscall_restart
> [ RUN      ] global.filter_flag_log
> [       OK ] global.filter_flag_log
> [ RUN      ] global.get_action_avail
> [       OK ] global.get_action_avail
> [ RUN      ] global.get_metadata
> [       OK ] global.get_metadata
> [ RUN      ] global.user_notification_basic
> [       OK ] global.user_notification_basic
> [ RUN      ] global.user_notification_kill_in_middle
> [       OK ] global.user_notification_kill_in_middle
> [ RUN      ] global.user_notification_signal
> [       OK ] global.user_notification_signal
> [ RUN      ] global.user_notification_closed_listener
> [       OK ] global.user_notification_closed_listener
> [ RUN      ] global.user_notification_child_pid_ns
> [       OK ] global.user_notification_child_pid_ns
> [ RUN      ] global.user_notification_sibling_pid_ns
> comp_syscall
> [       OK ] global.seccomp_syscall
> [ RUN      ] global.seccomp_syscall_mode_lock
> [       OK ] global.seccomp_syscall_mode_lock
> [ RUN      ] global.detect_seccomp_filter_flags
> [       OK ] global.detect_seccomp_filter_flags
> [ RUN      ] global.TSYNC_first
> [       OK ] global.TSYNC_first
> [ RUN      ] TSYNC.siblings_fail_prctl
> [       OK ] TSYNC.siblings_fail_prctl
> [ RUN      ] TSYNC.two_siblings_with_ancestor
> [       OK ] TSYNC.two_siblings_with_ancestor
> [ RUN      ] TSYNC.two_sibling_want_nnp
> [       OK ] TSYNC.two_sibling_want_nnp
> [ RUN      ] TSYNC.two_siblings_with_no_filter
> [       OK ] TSYNC.two_siblings_with_no_filter
> [ RUN      ] TSYNC.two_siblings_with_one_divergence
> [       OK ] TSYNC.two_siblings_with_one_divergence
> [ RUN      ] TSYNC.two_siblings_not_under_filter
> [       OK ] TSYNC.two_siblings_not_under_filter
> [ RUN      ] global.syscall_restart
> [       OK ] global.syscall_restart
> [ RUN      ] global.filter_flag_log
> [       OK ] global.filter_flag_log
> [ RUN      ] global.get_action_avail
> [       OK ] global.get_action_avail
> [ RUN      ] global.get_metadata
> [       OK ] global.get_metadata
> [ RUN      ] global.user_notification_basic
> [       OK ] global.user_notification_basic
> [ RUN      ] global.user_notification_kill_in_middle
> [       OK ] global.user_notification_kill_in_middle
> [ RUN      ] global.user_notification_signal
> [       OK ] global.user_notification_signal
> [ RUN      ] global.user_notification_closed_listener
> [       OK ] global.user_notification_closed_listener
> [ RUN      ] global.user_notification_child_pid_ns
> [       OK ] global.user_notification_child_pid_ns
> [ RUN      ] global.user_notification_sibling_pid_ns
> [       OK ] global.user_notification_sibling_pid_ns
> [ RUN      ] global.user_notification_fault_recv
> comp_syscall
> [       OK ] global.seccomp_syscall
> [ RUN      ] global.seccomp_syscall_mode_lock
> [       OK ] global.seccomp_syscall_mode_lock
> [ RUN      ] global.detect_seccomp_filter_flags
> [       OK ] global.detect_seccomp_filter_flags
> [ RUN      ] global.TSYNC_first
> [       OK ] global.TSYNC_first
> [ RUN      ] TSYNC.siblings_fail_prctl
> [       OK ] TSYNC.siblings_fail_prctl
> [ RUN      ] TSYNC.two_siblings_with_ancestor
> [       OK ] TSYNC.two_siblings_with_ancestor
> [ RUN      ] TSYNC.two_sibling_want_nnp
> [       OK ] TSYNC.two_sibling_want_nnp
> [ RUN      ] TSYNC.two_siblings_with_no_filter
> [       OK ] TSYNC.two_siblings_with_no_filter
> [ RUN      ] TSYNC.two_siblings_with_one_divergence
> [       OK ] TSYNC.two_siblings_with_one_divergence
> [ RUN      ] TSYNC.two_siblings_not_under_filter
> [       OK ] TSYNC.two_siblings_not_under_filter
> [ RUN      ] global.syscall_restart
> [       OK ] global.syscall_restart
> [ RUN      ] global.filter_flag_log
> [       OK ] global.filter_flag_log
> [ RUN      ] global.get_action_avail
> [       OK ] global.get_action_avail
> [ RUN      ] global.get_metadata
> [       OK ] global.get_metadata
> [ RUN      ] global.user_notification_basic
> [       OK ] global.user_notification_basic
> [ RUN      ] global.user_notification_kill_in_middle
> [       OK ] global.user_notification_kill_in_middle
> [ RUN      ] global.user_notification_signal
> [       OK ] global.user_notification_signal
> [ RUN      ] global.user_notification_closed_listener
> [       OK ] global.user_notification_closed_listener
> [ RUN      ] global.user_notification_child_pid_ns
> [       OK ] global.user_notification_child_pid_ns
> [ RUN      ] global.user_notification_sibling_pid_ns
> [       OK ] global.user_notification_sibling_pid_ns
> [ RUN      ] global.user_notification_fault_recv
> [       OK ] global.user_notification_fault_recv
> [ RUN      ] global.seccomp_get_notif_sizes
> [       OK ] global.seccomp_get_notif_sizes
> [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D] 72 / 72 tests passed.
> [  PASSED  ]
> ok 1..1 selftests: seccomp: seccomp_bpf [PASS]
> selftests: seccomp: seccomp_benchmark
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Calibrating reasonable sample size...
> 1550508902.529610763 - 1550508902.529593018 =3D 17745
> 1550508902.529659235 - 1550508902.529624715 =3D 34520
> 1550508902.529750301 - 1550508902.529661101 =3D 89200
> 1550508902.529911844 - 1550508902.529752278 =3D 159566
> 1550508902.530194944 - 1550508902.529914636 =3D 280308
> 1550508902.530767388 - 1550508902.530197631 =3D 569757
> 1550508902.531934050 - 1550508902.530769912 =3D 1164138
> 1550508902.534279121 - 1550508902.531937387 =3D 2341734
> 1550508902.539050194 - 1550508902.534282589 =3D 4767605
> 1550508902.548742785 - 1550508902.539055346 =3D 9687439
> 1550508902.568579306 - 1550508902.548746982 =3D 19832324
> 1550508902.606993431 - 1550508902.568584574 =3D 38408857
> 1550508902.683909763 - 1550508902.606998476 =3D 76911287
> 1550508902.836080783 - 1550508902.683925539 =3D 152155244
> 1550508903.135341904 - 1550508902.836086328 =3D 299255576
> 1550508903.888593466 - 1550508903.135346985 =3D 753246481
> 1550508905.248434850 - 1550508903.888599337 =3D 1359835513
> 1550508907.771756305 - 1550508905.248442445 =3D 2523313860
> 1550508912.820201621 - 1550508907.771763889 =3D 5048437732
> 1550508923.024991061 - 1550508912.820209425 =3D 10204781636
> Benchmarking 16777216 samples...
> 28.407345730 - 19.373343798 =3D 9034001932
> getpid native: 538 ns
> 40.654192508 - 28.407456313 =3D 12246736195
> getpid RET_ALLOW: 729 ns
> Estimated seccomp overhead per syscall: 191 ns
> ok 1..2 selftests: seccomp: seccomp_benchmark [PASS]
> make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa8132=
78ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/seccomp'
> =

> 2019-02-19 00:55:44 make run_tests -C sigaltstack
> make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813=
278ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/sigaltstack'
> gcc -Wall    sas.c  -o /usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813278=
ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/sigaltstack/sas
> TAP version 13
> selftests: sigaltstack: sas
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ok 1 Initial sigaltstack state was SS_DISABLE
> # [RUN]	signal USR1
> ok 2 sigaltstack is disabled in sighandler
> # [RUN]	switched to user ctx
> # [RUN]	signal USR2
> # [OK]	Stack preserved
> ok 3 sigaltstack is still SS_AUTODISARM after signal
> Pass 3 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
> 1..3
> ok 1..1 selftests: sigaltstack: sas [PASS]
> make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa8132=
78ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/sigaltstack'
> =

> 2019-02-19 00:55:44 make run_tests -C size
> make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813=
278ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/size'
> gcc -static -ffreestanding -nostartfiles -s    get_size.c  -o /usr/src/pe=
rf_selftests-x86_64-rhel-7.2-cdaa813278ddc616ee201eacda77f63996b5dd2d/tools=
/testing/selftests/size/get_size
> TAP version 13
> selftests: size: get_size
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> TAP version 13
> # Testing system size.
> ok 1 get runtime memory use
> # System runtime memory report (units in Kilobytes):
>   ---
>   Total:  4033148
>   Free:   837776
>   Buffer: 0
>   In use: 3195372
>   ...
> 1..1
> ok 1..1 selftests: size: get_size [PASS]
> make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa8132=
78ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/size'
> =

> 2019-02-19 00:55:44 make run_tests -C sparc64
> make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813=
278ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/sparc64'
> make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa8132=
78ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/sparc64'
> =

> 2019-02-19 00:55:44 make run_tests -C splice
> make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813=
278ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/splice'
> gcc     default_file_splice_read.c  -o /usr/src/perf_selftests-x86_64-rhe=
l-7.2-cdaa813278ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/spli=
ce/default_file_splice_read
> TAP version 13
> selftests: splice: default_file_splice_read.sh
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ok 1..1 selftests: splice: default_file_splice_read.sh [PASS]
> make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa8132=
78ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/splice'
> =

> 2019-02-19 00:55:45 make run_tests -C static_keys
> make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813=
278ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/static_keys'
> TAP version 13
> selftests: static_keys: test_static_keys.sh
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> static_key: ok
> ok 1..1 selftests: static_keys: test_static_keys.sh [PASS]
> make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa8132=
78ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/static_keys'
> =

> 2019-02-19 00:55:45 make run_tests -C sync
> make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813=
278ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/sync'
> gcc -c sync_alloc.c -o /usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813278=
ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/sync/sync_alloc.o
> gcc -c sync_fence.c -o /usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813278=
ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/sync/sync_fence.o
> gcc -c sync_merge.c -o /usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813278=
ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/sync/sync_merge.o
> gcc -c sync_wait.c -o /usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813278d=
dc616ee201eacda77f63996b5dd2d/tools/testing/selftests/sync/sync_wait.o
> gcc -c sync_stress_parallelism.c -o /usr/src/perf_selftests-x86_64-rhel-7=
.2-cdaa813278ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/sync/sy=
nc_stress_parallelism.o
> gcc -c sync_stress_consumer.c -o /usr/src/perf_selftests-x86_64-rhel-7.2-=
cdaa813278ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/sync/sync_=
stress_consumer.o
> gcc -c sync_stress_merge.c -o /usr/src/perf_selftests-x86_64-rhel-7.2-cda=
a813278ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/sync/sync_str=
ess_merge.o
> gcc -c sync_test.c -o /usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813278d=
dc616ee201eacda77f63996b5dd2d/tools/testing/selftests/sync/sync_test.o -O2 =
-g -std=3Dgnu89 -pthread -Wall -Wextra -I../../../../usr/include/
> gcc -c sync.c -o /usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813278ddc616=
ee201eacda77f63996b5dd2d/tools/testing/selftests/sync/sync.o -O2 -g -std=3D=
gnu89 -pthread -Wall -Wextra -I../../../../usr/include/
> gcc -o /usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813278ddc616ee201eacda=
77f63996b5dd2d/tools/testing/selftests/sync/sync_test /usr/src/perf_selftes=
ts-x86_64-rhel-7.2-cdaa813278ddc616ee201eacda77f63996b5dd2d/tools/testing/s=
elftests/sync/sync_test.o /usr/src/perf_selftests-x86_64-rhel-7.2-cdaa81327=
8ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/sync/sync.o /usr/sr=
c/perf_selftests-x86_64-rhel-7.2-cdaa813278ddc616ee201eacda77f63996b5dd2d/t=
ools/testing/selftests/sync/sync_alloc.o /usr/src/perf_selftests-x86_64-rhe=
l-7.2-cdaa813278ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/sync=
/sync_fence.o /usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813278ddc616ee201=
eacda77f63996b5dd2d/tools/testing/selftests/sync/sync_merge.o /usr/src/perf=
_selftests-x86_64-rhel-7.2-cdaa813278ddc616ee201eacda77f63996b5dd2d/tools/t=
esting/selftests/sync/sync_wait.o /usr/src/perf_selftests-x86_64-rhel-7.2-c=
daa813278ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/sync/sync_s=
tress_parallelism.o /usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813278ddc61=
6ee201eacda77f63996b5dd2d/tools/testing/selftests/sync/sync_stress_consumer=
.o /usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813278ddc616ee201eacda77f639=
96b5dd2d/tools/testing/selftests/sync/sync_stress_merge.o -O2 -g -std=3Dgnu=
89 -pthread -Wall -Wextra -I../../../../usr/include/ -pthread
> TAP version 13
> selftests: sync: sync_test
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> # [RUN]	Testing sync framework
> ok 1 [RUN]	test_alloc_timeline
> ok 2 [RUN]	test_alloc_fence
> ok 3 [RUN]	test_alloc_fence_negative
> ok 4 [RUN]	test_fence_one_timeline_wait
> ok 5 [RUN]	test_fence_one_timeline_merge
> ok 6 [RUN]	test_fence_merge_same_fence
> ok 7 [RUN]	test_fence_multi_timeline_wait
> ok 8 [RUN]	test_stress_two_threads_shared_timeline
> ok 9 [RUN]	test_consumer_stress_multi_producer_single_consumer
> ok 10 [RUN]	test_merge_stress_random_merge
> Pass 10 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
> 1..10
> ok 1..1 selftests: sync: sync_test [PASS]
> make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa8132=
78ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/sync'
> =

> 2019-02-19 00:55:48 make run_tests -C sysctl
> make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa813=
278ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/sysctl'
> TAP version 13
> selftests: sysctl: sysctl.sh
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Checking production write strict setting ... ok
> Tue Feb 19 00:55:48 CST 2019
> Running test: sysctl_test_0001 - run #0
> =3D=3D Testing sysctl behavior against /proc/sys/debug/test_sysctl/int_00=
01 =3D=3D
> Writing test file ... ok
> Checking sysctl is not set to test value ... ok
> Writing sysctl from shell ... ok
> Resetting sysctl to original value ... ok
> Writing entire sysctl in single write ... ok
> Writing middle of sysctl after synchronized seek ... ok
> Writing beyond end of sysctl ... ok
> Writing sysctl with multiple long writes ... ok
> Checking ignoring spaces up to PAGE_SIZE works on write ...ok
> Checking passing PAGE_SIZE of spaces fails on write ...ok
> Tue Feb 19 00:55:48 CST 2019
> Running test: sysctl_test_0002 - run #0
> =3D=3D Testing sysctl behavior against /proc/sys/debug/test_sysctl/string=
_0001 =3D=3D
> Writing test file ... ok
> Checking sysctl is not set to test value ... ok
> Writing sysctl from shell ... ok
> Resetting sysctl to original value ... ok
> Writing entire sysctl in single write ... ok
> Writing middle of sysctl after synchronized seek ... ok
> Writing beyond end of sysctl ... ok
> Writing sysctl with multiple long writes ... ok
> Writing entire sysctl in short writes ... ok
> Writing middle of sysctl after unsynchronized seek ... ok
> Checking sysctl maxlen is at least 65 ... ok
> Checking sysctl keeps original string on overflow append ... ok
> Checking sysctl stays NULL terminated on write ... ok
> Checking sysctl stays NULL terminated on overwrite ... ok
> Tue Feb 19 00:55:48 CST 2019
> Running test: sysctl_test_0003 - run #0
> =3D=3D Testing sysctl behavior against /proc/sys/debug/test_sysctl/int_00=
02 =3D=3D
> Writing test file ... ok
> Checking sysctl is not set to test value ... ok
> Writing sysctl from shell ... ok
> Resetting sysctl to original value ... ok
> Writing entire sysctl in single write ... ok
> Writing middle of sysctl after synchronized seek ... ok
> Writing beyond end of sysctl ... ok
> Writing sysctl with multiple long writes ... ok
> Checking ignoring spaces up to PAGE_SIZE works on write ...ok
> Checking passing PAGE_SIZE of spaces fails on write ...ok
> Testing INT_MAX works ...ok
> Testing INT_MAX + 1 will fail as expected...ok
> Testing negative values will work as expected...ok
> Tue Feb 19 00:55:48 CST 2019
> Running test: sysctl_test_0004 - run #0
> =3D=3D Testing sysctl behavior against /proc/sys/debug/test_sysctl/uint_0=
001 =3D=3D
> Writing test file ... ok
> Checking sysctl is not set to test value ... ok
> Writing sysctl from shell ... ok
> Resetting sysctl to original value ... ok
> Writing entire sysctl in single write ... ok
> Writing middle of sysctl after synchronized seek ... ok
> Writing beyond end of sysctl ... ok
> Writing sysctl with multiple long writes ... ok
> Checking ignoring spaces up to PAGE_SIZE works on write ...ok
> Checking passing PAGE_SIZE of spaces fails on write ...ok
> Testing UINT_MAX works ...ok
> Testing UINT_MAX + 1 will fail as expected...ok
> Testing negative values will not work as expected ...ok
> Tue Feb 19 00:55:48 CST 2019
> Running test: sysctl_test_0005 - run #0
> Testing array works as expected ... ok
> Testing skipping trailing array elements works ... ok
> Testing PAGE_SIZE limit on array works ... ok
> Testing exceeding PAGE_SIZE limit fails as expected ... Files - and /proc=
/sys/debug/test_sysctl/int_0003 differ
> ok
> Tue Feb 19 00:55:48 CST 2019
> Running test: sysctl_test_0005 - run #1
> Testing array works as expected ... ok
> Testing skipping trailing array elements works ... ok
> Testing PAGE_SIZE limit on array works ... ok
> Testing exceeding PAGE_SIZE limit fails as expected ... Files - and /proc=
/sys/debug/test_sysctl/int_0003 differ
> ok
> Tue Feb 19 00:55:48 CST 2019
> Running test: sysctl_test_0005 - run #2
> Testing array works as expected ... ok
> Testing skipping trailing array elements works ... ok
> Testing PAGE_SIZE limit on array works ... ok
> Testing exceeding PAGE_SIZE limit fails as expected ... Files - and /proc=
/sys/debug/test_sysctl/int_0003 differ
> ok
> ok 1..1 selftests: sysctl: sysctl.sh [PASS]
> make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.2-cdaa8132=
78ddc616ee201eacda77f63996b5dd2d/tools/testing/selftests/sysctl'
> =

> =

> =

> To reproduce:
> =

>          git clone https://github.com/intel/lkp-tests.git
>          cd lkp-tests
>          bin/lkp qemu -k <bzImage> job-script # job-script is attached in=
 this email
> =

> =

> =

> Thanks,
> Rong Chen
>=20

--===============3501675162898948283==--

