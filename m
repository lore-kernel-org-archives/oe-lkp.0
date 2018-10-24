Content-Type: multipart/mixed; boundary="===============3614762146858485015=="
MIME-Version: 1.0
From: Aaron Lu <aaron.lu@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [sched/fair] d519329f72: unixbench.score -9.9% regression
Date: Wed, 24 Oct 2018 14:41:00 +0800
Message-ID: <20181024064100.GA27054@intel.com>
In-Reply-To: <20180402032000.GD3101@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============3614762146858485015==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 02, 2018 at 11:20:00AM +0800, Ye, Xiaolong wrote:
> =

> Greeting,
> =

> FYI, we noticed a -9.9% regression of unixbench.score due to commit:
> =

> =

> commit: d519329f72a6f36bc4f2b85452640cfe583b4f81 ("sched/fair: Update uti=
l_est only on util_avg updates")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =

> in testcase: unixbench
> on test machine: 8 threads Intel(R) Core(TM) i7 CPU 870 @ 2.93GHz with 6G=
 memory
> with following parameters:
> =

>         runtime: 300s
>         nr_task: 100%
>         test: execl
> =

> test-description: UnixBench is the original BYTE UNIX benchmark suite aim=
s to test performance of Unix-like system.
> test-url: https://github.com/kdlucas/byte-unixbench

I tested this workload on different machines with this commit
d519329f72a6f36bc4f2b85452 and its parent a07630b8b2c16f82, I also
tested with v4.19-rc8 to see if the regression is gone -
the performance drop is there with v4.19-rc8 and with different
machines so I assume this regression is not solved yet.
Here are detailed data:

cmdline used to run this workload:
./Run execl -c $nr_cpu -i 30

lkp-ivb-d04(Ivybridge desktop, 4 CPUs)
a07630b8b2c16f82 d519329f72a6f36bc4f2b85452
---------------- --------------------------
         %stddev     %change         %stddev
             \          |                \
      2924            -8.7%       2669        unixbench.score
 =

a07630b8b2c16f82fd5b71d890079f4dd7599c1d/avg.json:  "unixbench.score": 2924=
.3333333333335,
d519329f72a6f36bc4f2b85452640cfe583b4f81/avg.json:  "unixbench.score": 2669=
.5333333333333,
v4.19-rc8/avg.json:  "unixbench.score": 2611.733333333333,

lkp-hsw-d01(Haswell desktop, 8 CPUs)
a07630b8b2c16f82 d519329f72a6f36bc4f2b85452
---------------- --------------------------
         %stddev     %change         %stddev
             \          |                \
      7090            -9.4%       6421        unixbench.score
 =

a07630b8b2c16f82fd5b71d890079f4dd7599c1d/avg.json:  "unixbench.score": 7090=
.400000000001,
d519329f72a6f36bc4f2b85452640cfe583b4f81/avg.json:  "unixbench.score": 6421=
.233333333333,
v4.19-rc8/avg.json:  "unixbench.score": 6431.933333333333,

lkp-skl-2sp2(2 sockets Skylake, 80 CPUs)
a07630b8b2c16f82 d519329f72a6f36bc4f2b85452
---------------- --------------------------                                =
                                                                           =

         %stddev     %change         %stddev                               =
                                                                           =

             \          |                \                                 =
                                                                           =

      9657 =C2=B1  2%      -3.3%       9334        unixbench.score
      =

a07630b8b2c16f82fd5b71d890079f4dd7599c1d/avg.json:  "unixbench.score": 9657=
.6,
d519329f72a6f36bc4f2b85452640cfe583b4f81/avg.json:  "unixbench.score": 9334=
.9,
v4.19-rc8/avg.json:  "unixbench.score": 9278.333333333334,

Please let me know if you need other information, thanks.

--===============3614762146858485015==--

