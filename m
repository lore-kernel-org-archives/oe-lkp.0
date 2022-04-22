Content-Type: multipart/mixed; boundary="===============7216486221235396338=="
MIME-Version: 1.0
From: ying.huang@intel.com
To: lkp@lists.01.org
Subject: Re: [sched/fair] 2cfb7a1b03: stress-ng.fstat.ops_per_sec -19.8% regression
Date: Fri, 22 Apr 2022 16:11:52 +0800
Message-ID: <8335c2c389c2aee51d91a79bee977f4df6f8fb77.camel@intel.com>
In-Reply-To: <d397577e14a5ca04f883d866e4ef1a1fddf19c8d.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7216486221235396338==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Mel,

On Wed, 2022-04-20 at 14:24 +0800, ying.huang(a)intel.com wrote:
> Hi, Mel,
> =

> On Mon, 2022-04-18 at 22:18 +0800, kernel test robot wrote:
> > (please be noted we reported "[sched/fair]  2cfb7a1b03:  fsmark.files_p=
er_sec
> > -26.2% regression" at
> > https://lore.kernel.org/all/20220303153108.GC14527(a)xsang-OptiPlex-902=
0/
> > when this is still on branch:
> > commit: 2cfb7a1b031b0e816af7a6ee0c6ab83b0acdf05a ("sched/fair: Improve =
consistency of allowed NUMA balance calculations")
> > https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git sched/core
> > =

> > now we noticed the similar performance changes as well as some others a=
re
> > still existing on mainline, so report this again for information)
> > =

> > =

> > Greeting,
> > =

> > FYI, we noticed a -19.8% regression of stress-ng.fstat.ops_per_sec due =
to commit:
> > =

> > =

> > commit: 2cfb7a1b031b0e816af7a6ee0c6ab83b0acdf05a ("sched/fair: Improve =
consistency of allowed NUMA balance calculations")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> > =

> > in testcase: stress-ng
> > on test machine: 96 threads 2 sockets Ice Lake with 256G memory
> > with following parameters:
> > =

> > 	nr_threads: 10%
> > 	disk: 1HDD
> > 	testtime: 60s
> > 	fs: f2fs
> > 	class: filesystem
> > 	test: fstat
> > 	cpufreq_governor: performance
> > 	ucode: 0xb000280
> > =

> > =

> > In addition to that, the commit also has significant impact on the foll=
owing tests:
> > =

> > +------------------+---------------------------------------------------=
----------------------------------+
> > > testcase: change | phoronix-test-suite: phoronix-test-suite.neatbench=
.CPU.fps 12.5% improvement        |
> > > test machine     | 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CP=
U @ 2.10GHz with 512G memory      |
> > > test parameters  | cpufreq_governor=3Dperformance                    =
                                    |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| option_a=3DCPU                          =
                                              |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| test=3Dneatbench-1.0.4                  =
                                              |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| ucode=3D0x500320a                       =
                                              |
> > +------------------+---------------------------------------------------=
----------------------------------+
> > > testcase: change | phoronix-test-suite: phoronix-test-suite.neatbench=
.All.fps 15.2% improvement        |
> > > test machine     | 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CP=
U @ 2.10GHz with 512G memory      |
> > > test parameters  | cpufreq_governor=3Dperformance                    =
                                    |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| option_a=3DAll (CPU + GPU)              =
                                              |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| test=3Dneatbench-1.0.4                  =
                                              |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| ucode=3D0x500320a                       =
                                              |
> > +------------------+---------------------------------------------------=
----------------------------------+
> > > testcase: change | fsmark: fsmark.files_per_sec -9.9% regression     =
                                  |
> > > test machine     | 192 threads 4 sockets Intel(R) Xeon(R) Platinum 92=
42 CPU @ 2.30GHz with 192G memory |
> > > test parameters  | cpufreq_governor=3Dperformance                    =
                                    |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| disk=3D1BRD_48G                         =
                                              |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| filesize=3D4M                           =
                                              |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| fs=3Df2fs                               =
                                              |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| iterations=3D1x                         =
                                              |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| nr_threads=3D64t                        =
                                              |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| sync_method=3DfsyncBeforeClose          =
                                              |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| test_size=3D24G                         =
                                              |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| ucode=3D0x500320a                       =
                                              |
> > +------------------+---------------------------------------------------=
----------------------------------+
> > > testcase: change | fsmark: fsmark.files_per_sec -26.2% regression    =
                                  |
> > > test machine     | 192 threads 4 sockets Intel(R) Xeon(R) Platinum 92=
42 CPU @ 2.30GHz with 192G memory |
> > > test parameters  | cpufreq_governor=3Dperformance                    =
                                    |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| disk=3D1BRD_48G                         =
                                              |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| filesize=3D4M                           =
                                              |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| fs=3Dext4                               =
                                              |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| iterations=3D1x                         =
                                              |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| nr_threads=3D64t                        =
                                              |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| sync_method=3DNoSync                    =
                                              |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| test_size=3D24G                         =
                                              |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| ucode=3D0x500320a                       =
                                              |
> > +------------------+---------------------------------------------------=
----------------------------------+
> > > testcase: change | stress-ng: stress-ng.fstat.ops_per_sec -20.1% regr=
ession                            |
> > > test machine     | 96 threads 2 sockets Ice Lake with 256G memory    =
                                  |
> > > test parameters  | class=3Dfilesystem                                =
                                    |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| cpufreq_governor=3Dperformance          =
                                              |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| disk=3D1HDD                             =
                                              |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| fs=3Dxfs                                =
                                              |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| nr_threads=3D10%                        =
                                              |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| test=3Dfstat                            =
                                              |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| testtime=3D60s                          =
                                              |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| ucode=3D0xb000280                       =
                                              |
> > +------------------+---------------------------------------------------=
----------------------------------+
> > > testcase: change | fsmark: fsmark.files_per_sec -16.3% regression    =
                                  |
> > > test machine     | 192 threads 4 sockets Intel(R) Xeon(R) Platinum 92=
42 CPU @ 2.30GHz with 192G memory |
> > > test parameters  | cpufreq_governor=3Dperformance                    =
                                    |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| disk=3D1BRD_48G                         =
                                              |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| filesize=3D4M                           =
                                              |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| fs=3Dext4                               =
                                              |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| iterations=3D1x                         =
                                              |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| nr_threads=3D64t                        =
                                              |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| sync_method=3DfsyncBeforeClose          =
                                              |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| test_size=3D24G                         =
                                              |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| ucode=3D0x500320a                       =
                                              |
> > +------------------+---------------------------------------------------=
----------------------------------+
> > > testcase: change | stress-ng: stress-ng.fstat.ops_per_sec -20.2% regr=
ession                            |
> > > test machine     | 96 threads 2 sockets Ice Lake with 256G memory    =
                                  |
> > > test parameters  | class=3Dfilesystem                                =
                                    |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| cpufreq_governor=3Dperformance          =
                                              |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| disk=3D1HDD                             =
                                              |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| fs=3Dxfs                                =
                                              |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| nr_threads=3D10%                        =
                                              |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| test=3Dfstat                            =
                                              |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| testtime=3D60s                          =
                                              |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| ucode=3D0xb000280                       =
                                              |
> > +------------------+---------------------------------------------------=
----------------------------------+
> > =

> =

> When I worked on the following regression report,
> =

> https://lore.kernel.org/lkml/87tuc7fp9k.fsf(a)yhuang6-desk2.ccr.corp.inte=
l.com/
> =

> I found stress-ng throughput will regress if the tasks are distrubuted
> more evenly among NUMA nodes.  So for this regression, I re-tested with
> mpstat per node statistics.  The results are as follows,
> =

> 	mpstat.node.0.user%	mpstat.node.1.user%	mpstat.node.0.sys%	mpstat.node.1=
.sys%
> 889c5d60fb	       3.04		       2.65		      30.0		      25.8
> 2cfb7a1b03	       2.39		       2.28		      31.2		      28.9
> =

> It can be found that the task are balanced better with the commit
> 2cfb7a1b03.  So I think the regression isn't a real problem.

I think stress-ng isn't a good workload to evaluate the effect of this
patch.  Can you teach me which workloads are appropriate?

Best Regards,
Huang, Ying

--===============7216486221235396338==--

