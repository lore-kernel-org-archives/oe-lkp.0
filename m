Content-Type: multipart/mixed; boundary="===============1031485971965569124=="
MIME-Version: 1.0
From: Amir Goldstein <amir73il@gmail.com>
To: lkp@lists.01.org
Subject: Re: [fsnotify] 4c40d6efc8: unixbench.score -3.3% regression
Date: Sat, 31 Jul 2021 12:27:43 +0300
Message-ID: <CAOQ4uxgtke-jK3a1SxowdEhObw8rDuUXB-DSGCr-M1uVMWarww@mail.gmail.com>
In-Reply-To: <20210731063818.GB18773@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============1031485971965569124==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 31, 2021 at 9:20 AM kernel test robot <oliver.sang@intel.com>=
 wrote:
>
>
>
> Greeting,
>
> FYI, we noticed a -3.3% regression of unixbench.score due to commit:
>
>
> commit: 4c40d6efc8b22b88a45c335ffd6d25b55d769f5b ("[PATCH v4 08/16] fsnot=
ify: pass arguments of fsnotify() in struct fsnotify_event_info")
> url: https://github.com/0day-ci/linux/commits/Gabriel-Krisman-Bertazi/Fil=
e-system-wide-monitoring/20210721-001444
> base: https://git.kernel.org/cgit/linux/kernel/git/jack/linux-fs.git fsno=
tify
>
> in testcase: unixbench
> on test machine: 96 threads 2 sockets Intel(R) Xeon(R) CPU @ 2.30GHz with=
 128G memory
> with following parameters:
>
>         runtime: 300s
>         nr_task: 1
>         test: pipe
>         cpufreq_governor: performance
>         ucode: 0x4003006
>
> test-description: UnixBench is the original BYTE UNIX benchmark suite aim=
s to test performance of Unix-like system.
> test-url: https://github.com/kdlucas/byte-unixbench
>
> In addition to that, the commit also has significant impact on the follow=
ing tests:
>
> +------------------+-----------------------------------------------------=
--------------------------------+
> | testcase: change | will-it-scale: will-it-scale.per_thread_ops -1.3% re=
gression                        |
> | test machine     | 192 threads 4 sockets Intel(R) Xeon(R) Platinum 9242=
 CPU @ 2.30GHz with 192G memory |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                                  |
> |                  | mode=3Dthread                                       =
                                  |
> |                  | nr_task=3D100%                                      =
                                  |
> |                  | test=3Deventfd1                                     =
                                  |
> |                  | ucode=3D0x5003006                                   =
                                  |
> +------------------+-----------------------------------------------------=
--------------------------------+
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
>

Gabriel,

It looks like my change throws away much of the performance gain for
small IO on pipes without any watches that was achieved by commit
71d734103edf ("fsnotify: Rearrange fast path to minimise overhead
when there is no watcher").

I think the way to fix it is to lift the optimization in __fsnotify()
to the fsnotify_parent() inline wrapper as Mel considered doing
but was not sure it was worth the effort at the time.

It's not completely trivial. I think it requires setting a flag
MNT_FSNOTIFY_WATCHED when there are watches on the
vfsmount. I will look into it.

Thanks,
Amir.
--===============1031485971965569124==--

