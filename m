Content-Type: multipart/mixed; boundary="===============0086275887600139220=="
MIME-Version: 1.0
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [tools] f412eed9df: map_perf_ring.c:25:22: fatal error: perf-sys.h: No such file or directory
Date: Mon, 04 Jun 2018 10:48:03 -0700
Message-ID: <CAJpBn1wNMHs8RVzhK-vrXWD8J=8OYDburWaUU_JpwvC+1OKfVg@mail.gmail.com>
In-Reply-To: <20180604054717.GA16472@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============0086275887600139220==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 3, 2018 at 10:47 PM, kernel test robot
<xiaolong.ye@intel.com> wrote:
>
> FYI, we noticed the following commit (built with gcc-7):
>
> commit: f412eed9dfdeeb6becd7de2ffe8b5d0a8b3f81ca ("tools: bpftool: add si=
mple perf event output reader")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>
> in testcase: bpf_offload
> with following parameters:
>
>
> on test machine: qemu-system-x86_64 -enable-kvm -cpu host -smp 2 -m 4G
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
> [  328.020595] map_perf_ring.c:25:22: fatal error: perf-sys.h: No such fi=
le or directory
> [  328.020601]
> [  328.035297] make: Leaving directory '/usr/src/linux-selftests-x86_64-f=
edora-25-f412eed9dfdeeb6becd7de2ffe8b5d0a8b3f81ca/tools/bpf'
> [  328.035323]
> [  328.044352] compilation terminated.
> [  328.049191] make[1]: *** [Makefile:92: map_perf_ring.o] Error 1
> [  328.049195]
> [  328.053913] make: *** [Makefile:99: bpftool] Error 2
>
>
> To reproduce:
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script # job-script is attached in =
this email

I tried various ways to repro and I can't :(  The steps above run, but
seem to produce no output in the results/0 directory:

/tmp/lkp/
=E2=94=9C=E2=94=80=E2=94=80 cache
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 lkp
=E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 scheduled
=E2=94=82   =E2=94=82       =E2=94=94=E2=94=80=E2=94=80 vm-lkp-nex04-4G-19
=E2=94=82   =E2=94=82           =E2=94=9C=E2=94=80=E2=94=80
bpf_offload-defaults-debian-x86_64-2016-08-31.cgz-f412eed9dfdeeb6becd7de2ff=
e8b5d0a8b3f81ca-20180526-63455-1ngr494-3-5889c.cgz
=E2=94=82   =E2=94=82           =E2=94=94=E2=94=80=E2=94=80
bpf_offload-defaults-debian-x86_64-2016-08-31.cgz-f412eed9dfdeeb6becd7de2ff=
e8b5d0a8b3f81ca-20180526-63455-1ngr494-3.sh
=E2=94=82   =E2=94=94=E2=94=80=E2=94=80 osimage
=E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 debian
=E2=94=82       =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 debian-x86_64-2016-=
08-31.cgz
=E2=94=82       =E2=94=94=E2=94=80=E2=94=80 deps
=E2=94=82           =E2=94=94=E2=94=80=E2=94=80 debian-x86_64-2016-08-31.cgz
=E2=94=82               =E2=94=9C=E2=94=80=E2=94=80 kernel_selftests_2018-0=
5-21.cgz
=E2=94=82               =E2=94=9C=E2=94=80=E2=94=80 lkp_2018-05-14.cgz
=E2=94=82               =E2=94=9C=E2=94=80=E2=94=80 rsync-rootfs_2016-11-15=
.cgz
=E2=94=82               =E2=94=94=E2=94=80=E2=94=80 run-ipconfig_2016-11-15=
.cgz
=E2=94=9C=E2=94=80=E2=94=80 qemu-img
=E2=94=94=E2=94=80=E2=94=80 result
    =E2=94=94=E2=94=80=E2=94=80 bpf_offload
        =E2=94=94=E2=94=80=E2=94=80 defaults
            =E2=94=94=E2=94=80=E2=94=80 vm-lkp-nex04-4G
                =E2=94=94=E2=94=80=E2=94=80 debian-x86_64-2016-08-31.cgz
                    =E2=94=94=E2=94=80=E2=94=80 x86_64-fedora-25
                        =E2=94=94=E2=94=80=E2=94=80 gcc-7
                            =E2=94=94=E2=94=80=E2=94=80 f412eed9dfdeeb6becd=
7de2ffe8b5d0a8b3f81ca
                                =E2=94=9C=E2=94=80=E2=94=80 0
                                =E2=94=94=E2=94=80=E2=94=80 1

19 directories, 7 files

The error also looks very strange, because bpftool's Makefile contains:

    41 CFLAGS +=3D -W -Wall -Wextra -Wno-unused-parameter -Wshadow
-Wno-missing-field-initializers
    42 CFLAGS +=3D -DPACKAGE=3D'"bpftool"' -D__EXPORTED_HEADERS__ \
    43 -I$(srctree)/kernel/bpf/ \
    44 -I$(srctree)/tools/include \
    45 -I$(srctree)/tools/include/uapi \
    46 -I$(srctree)/tools/lib/bpf \
    47 -I$(srctree)/tools/perf

(Note line 47) and:

$ ls tools/perf/perf-sys.h
tools/perf/perf-sys.h

So the header should be on the include path :S

--===============0086275887600139220==--

