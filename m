Content-Type: multipart/mixed; boundary="===============5274652647676060132=="
MIME-Version: 1.0
From: Ming Lin <mlin@kernel.org>
To: lkp@lists.01.org
Subject: Re: [block] fbccf1df065: +276.3% boot-meminfo.KernelStack
Date: Wed, 03 Jun 2015 11:39:35 -0700
Message-ID: <CAF1ivSbbcXHWYDTPm_VhfkGQwj0Hj91gvLJ5COKOsOy-1XvDkA@mail.gmail.com>
In-Reply-To: <1433123162.6691.156.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5274652647676060132==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, May 31, 2015 at 6:46 PM, Huang Ying <ying.huang@intel.com> wrote:
> FYI, we noticed the below changes on
>
> git://git.kernel.org/pub/scm/linux/kernel/git/mlin/linux.git block-generi=
c-req
> commit fbccf1df06574add60bdb71103cc1662e477f02d ("block: make generic_mak=
e_request handle arbitrarily sized bios")
>
>
> testcase/path_params/tbox_group: boot/1/vm-kbuild-1G
>
>         v4.1-rc4  fbccf1df06574add60bdb71103
> ----------------  --------------------------
>          %stddev     %change         %stddev
>              \          |                \
>       1587 =C2=B1  7%    +276.3%       5972 =C2=B1  1%  boot-meminfo.Kern=
elStack

I tested with 5 virtual disks.

diff meminfo.v4.1-rc4 diff meminfo.fbccf1df0
-Slab:              16908 kB
-SReclaimable:       8708 kB
-SUnreclaim:         8200 kB
-KernelStack:        1456 kB
-PageTables:         1496 kB
+Slab:              17492 kB
+SReclaimable:       8860 kB
+SUnreclaim:         8632 kB
+KernelStack:        2144 kB
+PageTables:         1480 kB

The KernelStack increase is because now we create bio pool for each
request_queue.

>     152390 =C2=B1  0%      +4.8%     159697 =C2=B1  0%  boot-slabinfo.num=
_objs
>      10149 =C2=B1  0%     +15.8%      11750 =C2=B1  0%  boot-slabinfo.num=
_pages
>      35916 =C2=B1  5%     +18.0%      42368 =C2=B1  9%  boot-meminfo.Dire=
ctMap4k
>     478516 =C2=B1  0%      -1.9%     469269 =C2=B1  0%  boot-meminfo.MemF=
ree
>      11477 =C2=B1  0%     +49.1%      17111 =C2=B1  1%  boot-meminfo.SUnr=
eclaim
>      40551 =C2=B1  0%     +15.7%      46910 =C2=B1  0%  boot-meminfo.Slab
>
> vm-kbuild-1G: qemu-system-x86_64 -enable-kvm -cpu Haswell,+smep,+smap
> Memory: 1G

Could you send me the kernel config and full qemu command?
I'll try to reproduce it.

>
>                              boot-meminfo.KernelStack
>
>   7000 ++----------------------------------------------------------------=
---+
>        |        O         O                           O               O  =
   |
>   6000 O+ O  O      O  O     O  O  O  O   O  O  O  O     O  O  O   O     =
O  O
>        |                                                                 =
   |
>   5000 ++                                                                =
   |
>        |                                                                 =
   |
>   4000 ++                                                                =
   |
>        |                                                                 =
   |
>   3000 ++                                                                =
   |
>        |                                                                 =
   |
>   2000 ++                          *..                                   =
   |
>        *            *..*..*..*    :   *                                  =
   |
>   1000 ++         ..          +   :                                      =
   |
>        | +       .             + :                                       =
   |
>      0 ++-*--*--*---------------*----------------------------------------=
---+
>
>         [*] bisect-good sample
>         [O] bisect-bad  sample
>
> To reproduce:
>
>         apt-get install ruby
>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-t=
ests.git
>         cd lkp-tests
>         bin/setup-local job.yaml # the job file attached in this email
>         bin/run-local   job.yaml

I got below error.

root(a)mlin-dev:~/lkp-tests# ./bin/run-local   job.yaml
/usr/lib/ruby/2.1.0/psych.rb:464:in `initialize': No such file or
directory @ rb_sysopen -
/result/boot/1/msl-lab-afa03/debian-x86_64-2015-02-07.cgz/x86_64-lkp/gcc-4.=
9/9e46a1eba10500df620683e31742789ef2781e93/1/job.yaml
(Errno::ENOENT)
from /usr/lib/ruby/2.1.0/psych.rb:464:in `open'
from /usr/lib/ruby/2.1.0/psych.rb:464:in `load_file'
from /root/tmp/lkp-tests/stats/kernel-size:7:in `<main>'
/root/tmp/lkp-tests/stats/kernel-size < /dev/null  exit code 1, check
/dev/shm/lkp-stats.70d8CxI7


root@mlin-dev:~# tree /result/
/result/
=E2=94=94=E2=94=80=E2=94=80 boot
    =E2=94=9C=E2=94=80=E2=94=80 1
    =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 msl-lab-afa03
    =E2=94=82       =E2=94=94=E2=94=80=E2=94=80 debian-x86_64-2015-02-07.cgz
    =E2=94=82           =E2=94=94=E2=94=80=E2=94=80 x86_64-lkp
    =E2=94=82               =E2=94=94=E2=94=80=E2=94=80 gcc-4.9
    =E2=94=82                   =E2=94=94=E2=94=80=E2=94=80 9e46a1eba10500d=
f620683e31742789ef2781e93
    =E2=94=82                       =E2=94=9C=E2=94=80=E2=94=80 0
    =E2=94=82                       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=
 boot-meminfo
    =E2=94=82                       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=
 boot-meminfo.json
    =E2=94=82                       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=
 boot-slabinfo
    =E2=94=82                       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=
 boot-slabinfo.json
    =E2=94=82                       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=
 job.sh
    =E2=94=82                       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=
 job.yaml
    =E2=94=82                       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=
 matrix.json.gz
    =E2=94=82                       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=
 memmap
    =E2=94=82                       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=
 memmap.json
    =E2=94=82                       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=
 sleep
    =E2=94=82                       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=
 sleep.time
    =E2=94=82                       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=
 sleep.time.json
    =E2=94=82                       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=
 stats.json
    =E2=94=82                       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=
 time
    =E2=94=82                       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=
 time.json
    =E2=94=82                       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=
 watchdog
    =E2=94=82                       =E2=94=82   =E2=94=94=E2=94=80=E2=94=80=
 watch-oom
    =E2=94=82                       =E2=94=9C=E2=94=80=E2=94=80 1
    =E2=94=82                       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=
 boot-meminfo
    =E2=94=82                       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=
 boot-meminfo.json
    =E2=94=82                       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=
 boot-slabinfo
    =E2=94=82                       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=
 boot-slabinfo.json
    =E2=94=82                       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=
 job.sh
    =E2=94=82                       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=
 job.yaml
    =E2=94=82                       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=
 matrix.json.gz
    =E2=94=82                       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=
 memmap
    =E2=94=82                       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=
 memmap.json
    =E2=94=82                       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=
 sleep
    =E2=94=82                       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=
 sleep.time
    =E2=94=82                       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=
 sleep.time.json
    =E2=94=82                       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=
 stats.json
    =E2=94=82                       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=
 time
    =E2=94=82                       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=
 time.json
    =E2=94=82                       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=
 watchdog
    =E2=94=82                       =E2=94=82   =E2=94=94=E2=94=80=E2=94=80=
 watch-oom
    =E2=94=82                       =E2=94=9C=E2=94=80=E2=94=80 avg.json
    =E2=94=82                       =E2=94=9C=E2=94=80=E2=94=80 matrix.json
    =E2=94=82                       =E2=94=94=E2=94=80=E2=94=80 stddev.json
    =E2=94=94=E2=94=80=E2=94=80 params.yaml

9 directories, 38 files

--===============5274652647676060132==--

