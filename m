Content-Type: multipart/mixed; boundary="===============1929347586152631801=="
MIME-Version: 1.0
From: Amir Goldstein <amir73il@gmail.com>
To: lkp@lists.01.org
Subject: Re: [fsnotify] 4c40d6efc8: unixbench.score -3.3% regression
Date: Sat, 31 Jul 2021 19:27:19 +0300
Message-ID: <CAOQ4uxh+do6SVyYCcNSM+7dqzSRU_Y-AXYuMyti4ESkmLdm5zQ@mail.gmail.com>
In-Reply-To: <CAOQ4uxgtke-jK3a1SxowdEhObw8rDuUXB-DSGCr-M1uVMWarww@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1929347586152631801==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 31, 2021 at 12:27 PM Amir Goldstein <amir73il@gmail.com> wrot=
e:
>
> On Sat, Jul 31, 2021 at 9:20 AM kernel test robot <oliver.sang@intel.co=
m> wrote:
> >
> >
> >
> > Greeting,
> >
> > FYI, we noticed a -3.3% regression of unixbench.score due to commit:
> >
> >
> > commit: 4c40d6efc8b22b88a45c335ffd6d25b55d769f5b ("[PATCH v4 08/16] fsn=
otify: pass arguments of fsnotify() in struct fsnotify_event_info")
> > url: https://github.com/0day-ci/linux/commits/Gabriel-Krisman-Bertazi/F=
ile-system-wide-monitoring/20210721-001444
> > base: https://git.kernel.org/cgit/linux/kernel/git/jack/linux-fs.git fs=
notify
> >
> > in testcase: unixbench
> > on test machine: 96 threads 2 sockets Intel(R) Xeon(R) CPU @ 2.30GHz wi=
th 128G memory
> > with following parameters:
> >
> >         runtime: 300s
> >         nr_task: 1
> >         test: pipe
> >         cpufreq_governor: performance
> >         ucode: 0x4003006
> >
> > test-description: UnixBench is the original BYTE UNIX benchmark suite a=
ims to test performance of Unix-like system.
> > test-url: https://github.com/kdlucas/byte-unixbench
> >
> > In addition to that, the commit also has significant impact on the foll=
owing tests:
> >
> > +------------------+---------------------------------------------------=
----------------------------------+
> > | testcase: change | will-it-scale: will-it-scale.per_thread_ops -1.3% =
regression                        |
> > | test machine     | 192 threads 4 sockets Intel(R) Xeon(R) Platinum 92=
42 CPU @ 2.30GHz with 192G memory |
> > | test parameters  | cpufreq_governor=3Dperformance                    =
                                    |
> > |                  | mode=3Dthread                                     =
                                    |
> > |                  | nr_task=3D100%                                    =
                                    |
> > |                  | test=3Deventfd1                                   =
                                    |
> > |                  | ucode=3D0x5003006                                 =
                                    |
> > +------------------+---------------------------------------------------=
----------------------------------+
> >
> >
> > If you fix the issue, kindly add following tag
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> >
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
>

Oliver,

Would it be possible to request a re-test with the branch:
https://github.com/amir73il/linux fsnotify-perf

The patch at the tip of that branch is the one this regression report
has blamed.

My expectation is that the patch at fsnotify-perf^ ("fsnotify: optimize the
case of no marks of any type") will improve performance of the test case
compared to baseline (v5.14-rc3) and that the patch at the tip of fsnotify-=
perf
would not regress performance.

Thanks,
Amir.
--===============1929347586152631801==--

