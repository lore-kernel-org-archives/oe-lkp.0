Content-Type: multipart/mixed; boundary="===============0407969142153275083=="
MIME-Version: 1.0
From: Eric W. Biederman <ebiederm@xmission.com>
To: lkp@lists.01.org
Subject: Re: [signal] 00b06da29c: stress-ng.vm-segv.fail
Date: Thu, 18 Nov 2021 10:25:08 -0600
Message-ID: <87a6i1zb17.fsf@email.froward.int.ebiederm.org>
In-Reply-To: <20211118071005.GC12388@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============0407969142153275083==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Oliver Sang <oliver.sang@intel.com> writes:

> Hi, Eric,
>
> On Wed, Nov 17, 2021 at 10:24:28AM -0600, Eric W. Biederman wrote:
>> kernel test robot <oliver.sang@intel.com> writes:
>> =

>> > Greeting,
>> >
>> > FYI, we noticed the following commit (built with gcc-9):
>> >
>> > commit: 00b06da29cf9dc633cdba87acd3f57f4df3fd5c7 ("signal: Add SA_IMMU=
TABLE to ensure forced siganls do not get changed")
>> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>> >
>> > in testcase: stress-ng
>> > version: stress-ng-x86_64-0.11-06_20211113
>> > with following parameters:
>> >
>> > 	nr_threads: 10%
>> > 	disk: 1HDD
>> > 	testtime: 60s
>> > 	fs: ext4
>> > 	class: vm
>> > 	test: vm-segv
>> > 	cpufreq_governor: performance
>> > 	ucode: 0x5003006
>> >
>> >
>> >
>> > on test machine: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @=
 2.10GHz with 512G memory
>> >
>> > caused below changes (please refer to attached dmesg/kmsg for entire l=
og/backtrace):
>> >
>> >
>> >
>> >
>> > If you fix the issue, kindly add following tag
>> > Reported-by: kernel test robot <oliver.sang@intel.com>
>> >
>> > 2021-11-16 08:20:17 stress-ng --timeout 60 --times --verify --metrics-=
brief --vm-segv 9
>> > stress-ng: info:  [5813] setting to a 60 second run per stressor
>> > stress-ng: info:  [5813] dispatching hogs: 9 vm-segv
>> > stress-ng: info:  [5813] successful run completed in 60.00s (1 min, 0.=
00 secs)
>> > stress-ng: info:  [5813] stressor       bogo ops real time  usr time  =
sys time   bogo ops/s     bogo ops/s
>> > stress-ng: info:  [5813]                           (secs)    (secs)   =
 (secs)   (real time) (usr+sys time)
>> > stress-ng: info:  [5813] vm-segv               0     60.00    198.82  =
  399.81         0.00           0.00
>> > stress-ng: info:  [5813] for a 60.00s run time:
>> > stress-ng: info:  [5813]    5760.20s available CPU time
>> > stress-ng: info:  [5813]     198.88s user time   (  3.45%)
>> > stress-ng: info:  [5813]     399.88s system time (  6.94%)
>> > stress-ng: info:  [5813]     598.76s total time  ( 10.39%)
>> > stress-ng: info:  [5813] load average: 8.34 2.55 0.89
>> =

>> Could someone decode this for me?
>> =

>> I don't see where it says anything has changed much less failed.
>> All I see is that stress-ng completed successfully.
>> =

>> Thank you in advance.
>
> comparing to parent, bogo ops and ops/s are zero is the issue detected in
> out tests, which leading to the stress-ng.vm-segv.fail:

ops going to zero makes sense I just did not see that.

> e21294a7aaae32c5 00b06da29cf9dc633cdba87acd3
> ---------------- ---------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>            :30         100%          30:30    stress-ng.vm-segv.fail
>          %stddev     %change         %stddev
>              \          |                \
>     730112          -100.0%       0.00        stress-ng.vm-segv.ops
>      12168          -100.0%       0.00        stress-ng.vm-segv.ops_per_s=
ec
>
>
> below is detail results from parent:
> 2021-11-14 04:51:07 stress-ng --timeout 60 --times --verify --metrics-bri=
ef --vm-segv 9
> stress-ng: info:  [5774] setting to a 60 second run per stressor
> stress-ng: info:  [5774] dispatching hogs: 9 vm-segv
> stress-ng: info:  [5774] successful run completed in 60.00s (1 min, 0.00 =
secs)
> stress-ng: info:  [5774] stressor       bogo ops real time  usr time  sys=
 time   bogo ops/s     bogo ops/s
> stress-ng: info:  [5774]                           (secs)    (secs)    (s=
ecs)   (real time) (usr+sys time)
> stress-ng: info:  [5774] vm-segv          730083     60.00    200.72    4=
01.10     12168.02        1213.13
> stress-ng: info:  [5774] for a 60.00s run time:
> stress-ng: info:  [5774]    5760.19s available CPU time
> stress-ng: info:  [5774]     200.80s user time   (  3.49%)
> stress-ng: info:  [5774]     401.19s system time (  6.96%)
> stress-ng: info:  [5774]     601.99s total time  ( 10.45%)
> stress-ng: info:  [5774] load average: 8.11 2.44 0.85
>
> we didn't figure out other diff in dmesg which could point to the issue
> (still attached one parent dmesg which could be used to compare dmesg
> attached in original report, FYI), but according to code, we doubt
> the change causing stress-ng cannot capture signal
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> In stress-vm-segv.c can not enter "if ((signum & 0x7f) =3D=3D SIGSEGV) {"=
 condition.
>
> The PTRACE do not receive SIGSEGV signal.
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> it seems about ptrace issue after this commit.

Thanks.  That makes sense, and I have another report in this area as
well.  If the problem is that ptrace does not intercept the signal
I see what is going on and I will get it fixed ASAP.

Eric
--===============0407969142153275083==--

