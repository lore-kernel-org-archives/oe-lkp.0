Content-Type: multipart/mixed; boundary="===============1202347310648574877=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 53d3bc773e: hackbench.throughput -32.9% regression
Date: Tue, 31 May 2016 14:41:51 +0200
Message-ID: <20160531124151.GK3190@twins.programming.kicks-ass.net>
In-Reply-To: <87eg8id3s3.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1202347310648574877==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 31, 2016 at 04:34:36PM +0800, Huang, Ying wrote:
> Hi, Ingo,
> =

> Part of the regression has been recovered in v4.7-rc1 from -32.9% to
> -9.8%.  But there is still some regression.  Is it possible for fully
> restore it?

after much searching on how you guys run hackbench... I figured
something like:

  perf bench sched messaging -g 20 --thread -l 60000

on my IVB-EP (2*10*2) is similar to your IVT thing.

And running something like:

  for i in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor ; do echo =
performance > $i ; done
  perf stat --null --repeat 10 -- perf bench sched messaging -g 20 --thread=
 -l 60000 | grep "seconds time elapsed"

gets me:

v4.6:

      36.786914089 seconds time elapsed ( +-  0.49% )
      37.054017355 seconds time elapsed ( +-  1.05% )


origin/master (v4.7-rc1-ish):

      34.757435264 seconds time elapsed ( +-  3.34% )
      35.396252515 seconds time elapsed ( +-  3.38% )


Which doesn't show a regression between v4.6 and HEAD; in fact it shows
an improvement.



--===============1202347310648574877==--

