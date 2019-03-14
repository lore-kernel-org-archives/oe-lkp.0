Content-Type: multipart/mixed; boundary="===============0038357606159774119=="
MIME-Version: 1.0
From: Daniel Borkmann <daniel@iogearbox.net>
To: lkp@lists.01.org
Subject: Re: [x86, retpolines] ce02ef06fc: will-it-scale.per_thread_ops 3.1% improvement
Date: Thu, 14 Mar 2019 09:39:35 +0100
Message-ID: <aa1de169-1c61-f8bc-10db-437f4e6ce6b3@iogearbox.net>
In-Reply-To: <20190313052715.GB8429@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============0038357606159774119==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 03/13/2019 06:27 AM, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed a 3.1% improvement of will-it-scale.per_thread_ops due to=
 commit:
> =

> =

> commit: ce02ef06fcf7a399a6276adb83f37373d10cbbe1 ("x86, retpolines: Raise=
 limit for generating indirect calls from switch-case")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: will-it-scale
> on test machine: 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz wit=
h 64G memory
> with following parameters:
> =

> 	nr_task: 100%
> 	mode: thread
> 	test: futex3
> 	cpufreq_governor: performance
> 	ucode: 0xb00002e
> =

> test-description: Will It Scale takes a testcase and runs it from 1 throu=
gh to n parallel copies to see if the testcase will scale. It builds both a=
 process and threads based test in order to see any differences between the=
 two.
> test-url: https://github.com/antonblanchard/will-it-scale
> =

> In addition to that, the commit also has significant impact on the follow=
ing tests:

Any thoughts on whether the above one-liner gcc work-around should be backp=
orted
to stable as well given these gains?

Thanks,
Daniel

> +------------------+-----------------------------------------------------=
----------------------+
> | testcase: change | will-it-scale: will-it-scale.per_process_ops 4.3% im=
provement             |
> | test machine     | 112 threads Intel(R) Xeon(R) Platinum 8170 CPU @ 2.1=
0GHz with 128G memory |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                        |
> |                  | mode=3Dprocess                                      =
                        |
> |                  | nr_task=3D50%                                       =
                        |
> |                  | test=3Dfutex3                                       =
                        |
> +------------------+-----------------------------------------------------=
----------------------+
> | testcase: change | will-it-scale: will-it-scale.per_process_ops 2.5% im=
provement             |
> | test machine     | 112 threads Intel(R) Xeon(R) Platinum 8170 CPU @ 2.1=
0GHz with 128G memory |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                        |
> |                  | mode=3Dprocess                                      =
                        |
> |                  | nr_task=3D50%                                       =
                        |
> |                  | test=3Dfutex1                                       =
                        |
> +------------------+-----------------------------------------------------=
----------------------+
> | testcase: change | will-it-scale: will-it-scale.per_process_ops 5.8% im=
provement             |
> | test machine     | 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz=
 with 64G memory      |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                        |
> |                  | mode=3Dprocess                                      =
                        |
> |                  | nr_task=3D50%                                       =
                        |
> |                  | test=3Dfutex3                                       =
                        |
> +------------------+-----------------------------------------------------=
----------------------+
> | testcase: change | will-it-scale: will-it-scale.per_process_ops 2.6% im=
provement             |
> | test machine     | 160 threads Intel(R) Xeon(R) CPU E7-8890 v4 @ 2.20GH=
z with 256G memory    |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                        |
> |                  | test=3Dfutex1                                       =
                        |
> |                  | ucode=3D0xb00002e                                   =
                        |
> +------------------+-----------------------------------------------------=
----------------------+
> | testcase: change | will-it-scale: will-it-scale.per_process_ops 2.5% im=
provement             |
> | test machine     | 112 threads Intel(R) Xeon(R) Platinum 8170 CPU @ 2.1=
0GHz with 128G memory |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                        |
> |                  | mode=3Dprocess                                      =
                        |
> |                  | nr_task=3D50%                                       =
                        |
> |                  | test=3Dfutex2                                       =
                        |
> +------------------+-----------------------------------------------------=
----------------------+
> | testcase: change | will-it-scale: will-it-scale.per_thread_ops 3.1% imp=
rovement              |
> | test machine     | 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz=
 with 64G memory      |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                        |
> |                  | mode=3Dthread                                       =
                        |
> |                  | nr_task=3D50%                                       =
                        |
> |                  | test=3Dfutex4                                       =
                        |
> +------------------+-----------------------------------------------------=
----------------------+
> | testcase: change | will-it-scale: will-it-scale.per_thread_ops 5.4% imp=
rovement              |
> | test machine     | 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz=
 with 64G memory      |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                        |
> |                  | mode=3Dthread                                       =
                        |
> |                  | nr_task=3D16                                        =
                        |
> |                  | test=3Dfutex3                                       =
                        |
> +------------------+-----------------------------------------------------=
----------------------+
> | testcase: change | will-it-scale: will-it-scale.per_thread_ops 3.0% imp=
rovement              |
> | test machine     | 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz=
 with 64G memory      |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                        |
> |                  | mode=3Dthread                                       =
                        |
> |                  | nr_task=3D16                                        =
                        |
> |                  | test=3Dfutex4                                       =
                        |
> +------------------+-----------------------------------------------------=
----------------------+

--===============0038357606159774119==--

