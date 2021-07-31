Content-Type: multipart/mixed; boundary="===============1489221921316215135=="
MIME-Version: 1.0
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: lkp@lists.01.org
Subject: Re: [fsnotify] 4c40d6efc8: unixbench.score -3.3% regression
Date: Sat, 31 Jul 2021 15:51:52 -0400
Message-ID: <87lf5mi7mv.fsf@collabora.com>
In-Reply-To: <CAOQ4uxgtke-jK3a1SxowdEhObw8rDuUXB-DSGCr-M1uVMWarww@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1489221921316215135==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Amir Goldstein <amir73il@gmail.com> writes:

> On Sat, Jul 31, 2021 at 9:20 AM kernel test robot <oliver.sang@intel.co=
m> wrote:
>>
>>
>>
>> Greeting,
>>
>> FYI, we noticed a -3.3% regression of unixbench.score due to commit:
>>
>>
>> commit: 4c40d6efc8b22b88a45c335ffd6d25b55d769f5b ("[PATCH v4 08/16] fsno=
tify: pass arguments of fsnotify() in struct fsnotify_event_info")
>> url: https://github.com/0day-ci/linux/commits/Gabriel-Krisman-Bertazi/Fi=
le-system-wide-monitoring/20210721-001444
>> base: https://git.kernel.org/cgit/linux/kernel/git/jack/linux-fs.git fsn=
otify
>>
>> in testcase: unixbench
>> on test machine: 96 threads 2 sockets Intel(R) Xeon(R) CPU @ 2.30GHz wit=
h 128G memory
>> with following parameters:
>>
>>         runtime: 300s
>>         nr_task: 1
>>         test: pipe
>>         cpufreq_governor: performance
>>         ucode: 0x4003006
>>
>> test-description: UnixBench is the original BYTE UNIX benchmark suite ai=
ms to test performance of Unix-like system.
>> test-url: https://github.com/kdlucas/byte-unixbench
>>
>> In addition to that, the commit also has significant impact on the follo=
wing tests:
>>
>> +------------------+----------------------------------------------------=
---------------------------------+
>> | testcase: change | will-it-scale: will-it-scale.per_thread_ops -1.3% r=
egression                        |
>> | test machine     | 192 threads 4 sockets Intel(R) Xeon(R) Platinum 924=
2 CPU @ 2.30GHz with 192G memory |
>> | test parameters  | cpufreq_governor=3Dperformance                     =
                                   |
>> |                  | mode=3Dthread                                      =
                                   |
>> |                  | nr_task=3D100%                                     =
                                   |
>> |                  | test=3Deventfd1                                    =
                                   |
>> |                  | ucode=3D0x5003006                                  =
                                   |
>> +------------------+----------------------------------------------------=
---------------------------------+
>>
>>
>> If you fix the issue, kindly add following tag
>> Reported-by: kernel test robot <oliver.sang@intel.com>
>>
>
> Gabriel,
>
> It looks like my change throws away much of the performance gain for
> small IO on pipes without any watches that was achieved by commit
> 71d734103edf ("fsnotify: Rearrange fast path to minimise overhead
> when there is no watcher").
>
> I think the way to fix it is to lift the optimization in __fsnotify()
> to the fsnotify_parent() inline wrapper as Mel considered doing
> but was not sure it was worth the effort at the time.
>
> It's not completely trivial. I think it requires setting a flag
> MNT_FSNOTIFY_WATCHED when there are watches on the
> vfsmount. I will look into it.

Amir,

Since this patch is a clean up, would you mind if I drop it from my
series and base my work on top of mainline? Eventually, we can rebase
this patch, when the performance issue is addressed.

I ask because I'm about to send a v5 and I'm not sure if I should wait
to have this fixed.

-- =

Gabriel Krisman Bertazi
--===============1489221921316215135==--

