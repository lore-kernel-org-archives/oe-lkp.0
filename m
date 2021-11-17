Content-Type: multipart/mixed; boundary="===============1948959535378908099=="
MIME-Version: 1.0
From: Eric W. Biederman <ebiederm@xmission.com>
To: lkp@lists.01.org
Subject: Re: [signal] 00b06da29c: stress-ng.vm-segv.fail
Date: Wed, 17 Nov 2021 10:24:28 -0600
Message-ID: <87fsrubvib.fsf@email.froward.int.ebiederm.org>
In-Reply-To: <20211117150258.GB5403@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============1948959535378908099==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot <oliver.sang@intel.com> writes:

> Greeting,
>
> FYI, we noticed the following commit (built with gcc-9):
>
> commit: 00b06da29cf9dc633cdba87acd3f57f4df3fd5c7 ("signal: Add SA_IMMUTAB=
LE to ensure forced siganls do not get changed")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>
> in testcase: stress-ng
> version: stress-ng-x86_64-0.11-06_20211113
> with following parameters:
>
> 	nr_threads: 10%
> 	disk: 1HDD
> 	testtime: 60s
> 	fs: ext4
> 	class: vm
> 	test: vm-segv
> 	cpufreq_governor: performance
> 	ucode: 0x5003006
>
>
>
> on test machine: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2.=
10GHz with 512G memory
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
>
> 2021-11-16 08:20:17 stress-ng --timeout 60 --times --verify --metrics-bri=
ef --vm-segv 9
> stress-ng: info:  [5813] setting to a 60 second run per stressor
> stress-ng: info:  [5813] dispatching hogs: 9 vm-segv
> stress-ng: info:  [5813] successful run completed in 60.00s (1 min, 0.00 =
secs)
> stress-ng: info:  [5813] stressor       bogo ops real time  usr time  sys=
 time   bogo ops/s     bogo ops/s
> stress-ng: info:  [5813]                           (secs)    (secs)    (s=
ecs)   (real time) (usr+sys time)
> stress-ng: info:  [5813] vm-segv               0     60.00    198.82    3=
99.81         0.00           0.00
> stress-ng: info:  [5813] for a 60.00s run time:
> stress-ng: info:  [5813]    5760.20s available CPU time
> stress-ng: info:  [5813]     198.88s user time   (  3.45%)
> stress-ng: info:  [5813]     399.88s system time (  6.94%)
> stress-ng: info:  [5813]     598.76s total time  ( 10.39%)
> stress-ng: info:  [5813] load average: 8.34 2.55 0.89

Could someone decode this for me?

I don't see where it says anything has changed much less failed.
All I see is that stress-ng completed successfully.

Thank you in advance.


> To reproduce:
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         sudo bin/lkp install job.yaml           # job file is attached in=
 this email
>         bin/lkp split-job --compatible job.yaml # generate the yaml file =
for lkp run
>         sudo bin/lkp run generated-yaml-file
>
>         # if come across any failure that blocks the test,
>         # please remove ~/.lkp and /lkp dir to run from a clean state.
>
>
>
> ---
> 0DAY/LKP+ Test Infrastructure                   Open Source Technology Ce=
nter
> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel Corpo=
ration
>
> Thanks,
> Oliver Sang

Eric
--===============1948959535378908099==--

