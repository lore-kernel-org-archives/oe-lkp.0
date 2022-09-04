Content-Type: multipart/mixed; boundary="===============7688872558020299853=="
MIME-Version: 1.0
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: lkp@lists.01.org
Subject: Re: [smb3] 5efdd9122e: filebench.sum_operations/s -50.0% regression
Date: Sun, 04 Sep 2022 12:54:23 +0200
Message-ID: <dcecfc3b-0fd9-b406-4123-d414432d0e49@leemhuis.info>
In-Reply-To: <c8310cba-36ef-2940-b2c2-07573e015185@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7688872558020299853==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, this is your Linux kernel regression tracker. Top-posting for once,
to make this easily accessible to everyone.

As per recent general discussions with the 0-day folks, I'm dropping
below regression from the list of tracked issues, as this report didn't
gain any traction. That for example can happen if the developers
considered the regression of no practical relevance, as they assume it
only materializes in micro-benchmarks, is due to a broken test case, or
some fluke.

Not sure if that or something else is the reason why this particular
report didn't gain any traction, but I lack the bandwidth to follow-up
on each and every regression some CI system found and reported. At the
same time I don't want to keep these reports in the list of tracked
issues forever, as that creates noise and makes it harder to spot the
important issues in regzbot's reports and lists. That's why I hereby
remove it:

#regzbot invalid: 0-day report that didn't get traction; might be of no
relevance

Ciao, Thorsten

On 26.08.22 04:41, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed a -50.0% regression of filebench.sum_operations/s due to
> commit:
> =

> =

> commit: 5efdd9122eff772eae2feae9f0fc0ec02d4846a3 ("smb3: allow deferred
> close timeout to be configurable")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: filebench
> on test machine: 88 threads 2 sockets Intel(R) Xeon(R) Gold 6238M CPU @
> 2.10GHz (Cascade Lake) with 128G memory
> with following parameters:
> =

> =C2=A0=C2=A0=C2=A0=C2=A0disk: 1HDD
> =C2=A0=C2=A0=C2=A0=C2=A0fs: ext4
> =C2=A0=C2=A0=C2=A0=C2=A0fs2: cifs
> =C2=A0=C2=A0=C2=A0=C2=A0test: filemicro_delete.f
> =C2=A0=C2=A0=C2=A0=C2=A0cpufreq_governor: performance
> =C2=A0=C2=A0=C2=A0=C2=A0ucode: 0x5003302
> =

> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/disk/fs2/fs/kconfig/rootfs/tbox_group/test/test=
case/ucode:
> =C2=A0
> gcc-11/performance/1HDD/cifs/ext4/x86_64-rhel-8.3/debian-11.1-x86_64-2022=
0510.cgz/lkp-csl-2sp9/filemicro_delete.f/filebench/0x5003302
> =

> commit:
> =C2=A0 dcb45fd7f5 ("cifs: Do not use tcon->cfid directly, use the cfid we=
 get
> from open_cached_dir")
> =C2=A0 5efdd9122e ("smb3: allow deferred close timeout to be configurable=
")
> =

> dcb45fd7f501f864 5efdd9122eff772eae2feae9f0f
> ---------------- ---------------------------
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev=C2=A0=C2=A0=C2=
=A0=C2=A0 %change=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
\=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> =C2=A0=C2=A0=C2=A0 515.95=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -50.0%=C2=A0=C2=A0=C2=A0=C2=A0 257.98=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 filebench.sum_operations/s
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.81 =C2=B1=C2=A0 2%=C2=A0=C2=A0 +1038.4%=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 54.78 =C2=B1=C2=A0 6%=C2=A0 filebench.sum_ti=
me_ms/op
> =C2=A0=C2=A0=C2=A0=C2=A0 29.00 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0 +212.1%=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 90.50 =C2=B1=C2=A0 3%=C2=A0
> filebench.time.percent_of_cpu_this_job_got
> =C2=A0=C2=A0=C2=A0=C2=A0 24629=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 +2.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 25297=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> filebench.time.voluntary_context_switches
> =C2=A07.685e+08=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +19.3%=C2=A0 9.169e+08 =C2=B1=C2=A0 4%=C2=A0 cpuidle..time
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.53 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=
=A0 -20.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.00 =C2=B1=C2=A0 3%=C2=A0 i=
ostat.cpu.iowait
> =C2=A0=C2=A0 1506141 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0 +22.4%=C2=A0=
=C2=A0=C2=A0 1843256 =C2=B1=C2=A0 3%=C2=A0 turbostat.IRQ
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 -50.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.00=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vmstat.procs.b
> =C2=A0=C2=A0=C2=A0=C2=A0 21969 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -9.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 19885 =C2=B1=C2=A0 2%=C2=A0 vmstat.=
system.cs
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.06 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 -0.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.35 =C2=B1=C2=A0 =
4%=C2=A0 mpstat.cpu.all.iowait%
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.79 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 +0.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.27 =C2=B1=C2=A0 =
2%=C2=A0 mpstat.cpu.all.sys%
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.89 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.79 =C2=B1=C2=A0 =
3%=C2=A0 mpstat.cpu.all.usr%
> =C2=A0=C2=A0=C2=A0=C2=A0 34.55 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0 -34.8%=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 22.51 =C2=B1 27%=C2=A0
> sched_debug.cfs_rq:/.removed.runnable_avg.avg
> =C2=A0=C2=A0=C2=A0 119.64 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 -20.0%=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 95.69 =C2=B1 17%=C2=A0
> sched_debug.cfs_rq:/.removed.runnable_avg.stddev
> =C2=A0=C2=A0=C2=A0=C2=A0 34.55 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0 -34.8%=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 22.51 =C2=B1 27%=C2=A0
> sched_debug.cfs_rq:/.removed.util_avg.avg
> =C2=A0=C2=A0=C2=A0 119.64 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 -20.0%=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 95.69 =C2=B1 17%=C2=A0
> sched_debug.cfs_rq:/.removed.util_avg.stddev
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5249=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 +15.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6076=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 meminfo.Active
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3866 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=
=A0 +17.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4552=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 meminfo.Active(anon)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1382 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=
=A0 +10.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1524 =C2=B1=C2=A0 4%=C2=A0 m=
eminfo.Active(file)
> =C2=A0=C2=A0=C2=A0=C2=A0 69791 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0 +39.8%=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 97553 =C2=B1=C2=A0 6%=C2=A0 meminfo.AnonHuge=
Pages
> =C2=A0=C2=A0=C2=A0=C2=A0 72709 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +1=
2.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 81779 =C2=B1=C2=A0 3%=C2=A0 meminfo.Inac=
tive(file)
> =C2=A0=C2=A0=C2=A0=C2=A0 23219=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +13.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 26352 =C2=B1=C2=A0 =
3%=C2=A0 meminfo.KernelStack
> =C2=A0=C2=A0=C2=A0 966.50 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +17.7%=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1137=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 proc-vmstat.nr_active_anon
> =C2=A0=C2=A0=C2=A0=C2=A0 74302=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 +6.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 78977 =C2=B1=
=C2=A0 2%=C2=A0 proc-vmstat.nr_anon_pages
> =C2=A0=C2=A0=C2=A0=C2=A0 81133=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 +6.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 85973=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 proc-vmstat.nr_inactive_anon
> =C2=A0=C2=A0=C2=A0=C2=A0 18172 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +1=
2.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 20442 =C2=B1=C2=A0 3%=C2=A0 proc-vmstat.=
nr_inactive_file
> =C2=A0=C2=A0=C2=A0=C2=A0 23213=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +13.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 26348 =C2=B1=C2=A0 =
3%=C2=A0 proc-vmstat.nr_kernel_stack
> =C2=A0=C2=A0=C2=A0=C2=A0 17983=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 +2.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 18400=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 proc-vmstat.nr_mapped
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7446 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 +5.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7853 =C2=B1=C2=A0 3%=C2=
=A0 proc-vmstat.nr_shmem
> =C2=A0=C2=A0=C2=A0=C2=A0 26888=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 +1.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 27306=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> proc-vmstat.nr_slab_reclaimable
> =C2=A0=C2=A0=C2=A0=C2=A0 47220=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 +3.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 48803=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> proc-vmstat.nr_slab_unreclaimable
> =C2=A0=C2=A0=C2=A0 966.50 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +17.7%=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1137=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0
> proc-vmstat.nr_zone_active_anon
> =C2=A0=C2=A0=C2=A0=C2=A0 81133=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 +6.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 85973=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> proc-vmstat.nr_zone_inactive_anon
> =C2=A0=C2=A0=C2=A0=C2=A0 18172 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +1=
2.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 20442 =C2=B1=C2=A0 3%=C2=A0
> proc-vmstat.nr_zone_inactive_file
> =C2=A0=C2=A0=C2=A0 361460=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +2.5%=C2=A0=C2=A0=C2=A0=C2=A0 370454=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 proc-vmstat.numa_hit
> =C2=A0=C2=A0=C2=A0 946.67=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +18.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1122=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 proc-vmstat.pgactivate
> =C2=A0=C2=A0=C2=A0 361562=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +2.5%=C2=A0=C2=A0=C2=A0=C2=A0 370553=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 proc-vmstat.pgalloc_normal
> =C2=A0=C2=A0=C2=A0 187906=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +4.7%=C2=A0=C2=A0=C2=A0=C2=A0 196761=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 proc-vmstat.pgfault
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8189=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +2.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 83=
95=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 proc-vmstat.pgreuse
> =C2=A01.097e+09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +15.5%=C2=A0 1.267e+09 =C2=B1=C2=A0 7%=C2=A0
> perf-stat.i.branch-instructions
> =C2=A0 39079265 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 -20.9%=C2=A0=C2=
=A0 30915354 =C2=B1=C2=A0 4%=C2=A0 perf-stat.i.branch-misses
> =C2=A0=C2=A0 5093263 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 -23.7%=C2=A0=
=C2=A0=C2=A0 3884752 =C2=B1=C2=A0 9%=C2=A0 perf-stat.i.cache-misses
> =C2=A0=C2=A0=C2=A0=C2=A0 29213=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -18.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 23764 =C2=B1=C2=A0 =
5%=C2=A0 perf-stat.i.context-switches
> =C2=A07.666e+09 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +5.7%=C2=A0=
 8.106e+09 =C2=B1=C2=A0 2%=C2=A0 perf-stat.i.cpu-cycles
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1877 =C2=B1 15%=C2=A0=C2=A0=C2=A0=C2=A0 +7=
5.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3287 =C2=B1 12%=C2=A0
> perf-stat.i.cycles-between-cache-misses
> =C2=A0=C2=A0 1735450 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 -12.9%=C2=A0=
=C2=A0=C2=A0 1512060 =C2=B1=C2=A0 3%=C2=A0 perf-stat.i.iTLB-load-misses
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2898 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=
=A0 +34.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3895 =C2=B1=C2=A0 7%=C2=A0
> perf-stat.i.instructions-per-iTLB-miss
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1493=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 -20.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1190 =
=C2=B1=C2=A0 7%=C2=A0 perf-stat.i.major-faults
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 +5.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1=C2=A0 2%=C2=
=A0 perf-stat.i.metric.GHz
> =C2=A0=C2=A0=C2=A0=C2=A0 48.47 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=
8.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 56.83 =C2=B1=C2=A0 7%=C2=A0
> perf-stat.i.node-store-miss-rate%
> =C2=A0=C2=A0=C2=A0 283426 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 -21.6%=
=C2=A0=C2=A0=C2=A0=C2=A0 222190 =C2=B1 10%=C2=A0 perf-stat.i.node-stores
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.57 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 -1.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.44 =C2=B1=C2=A0 =
6%=C2=A0
> perf-stat.overall.branch-miss-rate%
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1508 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=
=A0 +39.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2108 =C2=B1=C2=A0 9%=C2=A0
> perf-stat.overall.cycles-between-cache-misses
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3022 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=
=A0 +23.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3736 =C2=B1=C2=A0 5%=C2=A0
> perf-stat.overall.instructions-per-iTLB-miss
> =C2=A09.585e+08=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +18.8%=C2=A0 1.138e+09 =C2=B1=C2=A0 6%=C2=A0
> perf-stat.ps.branch-instructions
> =C2=A0 34151514 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 -18.8%=C2=A0=C2=
=A0 27725316 =C2=B1=C2=A0 4%=C2=A0 perf-stat.ps.branch-misses
> =C2=A0=C2=A0 4450329 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 -21.7%=C2=A0=
=C2=A0=C2=A0 3486409 =C2=B1=C2=A0 9%=C2=A0 perf-stat.ps.cache-misses
> =C2=A0=C2=A0=C2=A0=C2=A0 25524=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -16.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 21333 =C2=B1=C2=A0 =
4%=C2=A0 perf-stat.ps.context-switches
> =C2=A0=C2=A0=C2=A0=C2=A0 77139=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 +2.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 79105=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-stat.ps.cpu-clock
> =C2=A06.704e+09 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +8.7%=C2=A0=
 7.287e+09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-stat.ps.cpu-cycles
> =C2=A0 1.06e+09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +11.3%=C2=A0=C2=A0 1.18e+09 =C2=B1=C2=A0 5%=C2=A0 perf-stat.ps.dTLB-loa=
ds
> =C2=A0=C2=A0 1517349 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 -10.5%=C2=A0=
=C2=A0=C2=A0 1357716 =C2=B1=C2=A0 2%=C2=A0 perf-stat.ps.iTLB-load-misses
> =C2=A04.582e+09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +10.8%=C2=A0 5.075e+09 =C2=B1=C2=A0 6%=C2=A0 perf-stat.ps.instructions
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1296=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 -18.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1061 =
=C2=B1=C2=A0 6%=C2=A0 perf-stat.ps.major-faults
> =C2=A0=C2=A0=C2=A0 247613 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 -19.5%=
=C2=A0=C2=A0=C2=A0=C2=A0 199283 =C2=B1=C2=A0 9%=C2=A0 perf-stat.ps.node-sto=
res
> =C2=A0=C2=A0=C2=A0=C2=A0 77139=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 +2.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 79105=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-stat.ps.task-clock
> =C2=A03.697e+10=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +35.3%=C2=A0 5.003e+10=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-s=
tat.total.instructions
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8.51 =C2=B1 91%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -6.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.59 =C2=B1223%=C2=A0
> perf-profile.calltrace.cycles-pp.getdents64
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8.34 =C2=B1 83%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -6.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.67 =C2=B1141%=C2=A0
> perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.exit_to_user_mode=
_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwf=
rame
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.25 =C2=B1107%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -6.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0
> perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.open64
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.25 =C2=B1107%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -6.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0
> perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwf=
rame.open64
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.25 =C2=B1107%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -6.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0
> perf-profile.calltrace.cycles-pp.open64
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7.63 =C2=B1 84%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -6.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.59 =C2=B1223%=C2=A0
> perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.getdents64
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7.63 =C2=B1 84%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -6.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.59 =C2=B1223%=C2=A0
> perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwf=
rame.getdents64
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7.63 =C2=B1 84%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -6.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.59 =C2=B1223%=C2=A0
> perf-profile.calltrace.cycles-pp.__x64_sys_getdents64.do_syscall_64.entry=
_SYSCALL_64_after_hwframe.getdents64
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7.63 =C2=B1 84%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -6.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.59 =C2=B1223%=C2=A0
> perf-profile.calltrace.cycles-pp.iterate_dir.__x64_sys_getdents64.do_sysc=
all_64.entry_SYSCALL_64_after_hwframe.getdents64
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.26 =C2=B1115%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -5.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.88 =C2=B1223%=C2=A0
> perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.=
entry_SYSCALL_64_after_hwframe
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.26 =C2=B1115%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -5.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.88 =C2=B1223%=C2=A0
> perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_t=
o_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.26 =C2=B1115%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -4.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.67 =C2=B1141%=C2=A0
> perf-profile.calltrace.cycles-pp.do_group_exit.get_signal.arch_do_signal_=
or_restart.exit_to_user_mode_loop.exit_to_user_mode_prepare
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.26 =C2=B1115%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -4.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.67 =C2=B1141%=C2=A0
> perf-profile.calltrace.cycles-pp.do_exit.do_group_exit.get_signal.arch_do=
_signal_or_restart.exit_to_user_mode_loop
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.26 =C2=B1115%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -4.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.67 =C2=B1141%=C2=A0
> perf-profile.calltrace.cycles-pp.arch_do_signal_or_restart.exit_to_user_m=
ode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.26 =C2=B1115%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -4.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.67 =C2=B1141%=C2=A0
> perf-profile.calltrace.cycles-pp.get_signal.arch_do_signal_or_restart.exi=
t_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.57 =C2=B1 73%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -3.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.76 =C2=B1223%=C2=A0
> perf-profile.calltrace.cycles-pp.asm_exc_page_fault.perf_mmap__read_head.=
perf_mmap__push.record__mmap_read_evlist.__cmd_record
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.57 =C2=B1 73%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -3.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.76 =C2=B1223%=C2=A0
> perf-profile.calltrace.cycles-pp.exc_page_fault.asm_exc_page_fault.perf_m=
map__read_head.perf_mmap__push.record__mmap_read_evlist
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.57 =C2=B1 73%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -3.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.76 =C2=B1223%=C2=A0
> perf-profile.calltrace.cycles-pp.do_user_addr_fault.exc_page_fault.asm_ex=
c_page_fault.perf_mmap__read_head.perf_mmap__push
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.57 =C2=B1 73%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -3.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.76 =C2=B1223%=C2=A0
> perf-profile.calltrace.cycles-pp.perf_mmap__read_head.perf_mmap__push.rec=
ord__mmap_read_evlist.__cmd_record.cmd_record
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.38 =C2=B1103%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -3.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0
> perf-profile.calltrace.cycles-pp.unmap_vmas.exit_mmap.mmput.exit_mm.do_ex=
it
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.38 =C2=B1103%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -3.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0
> perf-profile.calltrace.cycles-pp.unmap_page_range.unmap_vmas.exit_mmap.mm=
put.exit_mm
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.38 =C2=B1103%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -3.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0
> perf-profile.calltrace.cycles-pp.zap_pmd_range.unmap_page_range.unmap_vma=
s.exit_mmap.mmput
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.38 =C2=B1103%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -3.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0
> perf-profile.calltrace.cycles-pp.zap_pte_range.zap_pmd_range.unmap_page_r=
ange.unmap_vmas.exit_mmap
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8.51 =C2=B1 91%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -6.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.59 =C2=B1223%=C2=A0
> perf-profile.children.cycles-pp.getdents64
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8.34 =C2=B1 83%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -6.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.67 =C2=B1141%=C2=A0
> perf-profile.children.cycles-pp.exit_to_user_mode_prepare
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8.34 =C2=B1 83%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -6.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.67 =C2=B1141%=C2=A0
> perf-profile.children.cycles-pp.exit_to_user_mode_loop
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8.34 =C2=B1 83%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -6.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.67 =C2=B1141%=C2=A0
> perf-profile.children.cycles-pp.syscall_exit_to_user_mode
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.25 =C2=B1107%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -6.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0
> perf-profile.children.cycles-pp.open64
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7.63 =C2=B1 84%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -6.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.59 =C2=B1223%=C2=A0
> perf-profile.children.cycles-pp.__x64_sys_getdents64
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7.63 =C2=B1 84%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -6.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.59 =C2=B1223%=C2=A0
> perf-profile.children.cycles-pp.iterate_dir
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.26 =C2=B1115%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -4.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.67 =C2=B1141%=C2=A0
> perf-profile.children.cycles-pp.arch_do_signal_or_restart
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.26 =C2=B1115%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -4.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.67 =C2=B1141%=C2=A0
> perf-profile.children.cycles-pp.get_signal
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.57 =C2=B1 73%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -3.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.76 =C2=B1223%=C2=A0
> perf-profile.children.cycles-pp.perf_mmap__read_head
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.38 =C2=B1103%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -3.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0
> perf-profile.children.cycles-pp.unmap_vmas
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.38 =C2=B1103%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -3.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0
> perf-profile.children.cycles-pp.unmap_page_range
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.38 =C2=B1103%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -3.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0
> perf-profile.children.cycles-pp.zap_pmd_range
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.38 =C2=B1103%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -3.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0
> perf-profile.children.cycles-pp.zap_pte_range
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8.54 =C2=B1 43%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +8.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 17.19 =C2=B1 38%=C2=A0
> perf-profile.children.cycles-pp.asm_exc_page_fault
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <yujie.liu@intel.com>
> =

> =

> To reproduce:
> =

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git clone https://github.com/i=
ntel/lkp-tests.git
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cd lkp-tests
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sudo bin/lkp install job.yaml=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # job file is =
attached
> in this email
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin/lkp split-job --compatible=
 job.yaml # generate the yaml file
> for lkp run
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sudo bin/lkp run generated-yam=
l-file
> =

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # if come across any failure t=
hat blocks the test,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # please remove ~/.lkp and /lk=
p dir to run from a clean state.
> =

> =

> Disclaimer:
> Results have been estimated based on internal Intel analysis and are
> provided
> for informational purposes only. Any difference in system hardware or
> software
> design or configuration may affect actual performance.
> =

> =

> #regzbot introduced: 5efdd9122e
> =

>=20
--===============7688872558020299853==--

