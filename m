Content-Type: multipart/mixed; boundary="===============2849935378907314499=="
MIME-Version: 1.0
From: Trond Myklebust <trond.myklebust@primarydata.com>
To: lkp@lists.01.org
Subject: Re: [SUNRPC] c4a7ca77494: +6.0% fsmark.time.involuntary_context_switches, no primary result change
Date: Sun, 15 Feb 2015 13:02:17 -0500
Message-ID: <CAHQdGtSgAC5+TJPpQ-BiKa8ZTpfw-TjZcjn1CQhCu-xBxfx2PA@mail.gmail.com>
In-Reply-To: <1423987029.5538.16.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2849935378907314499==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi guys,

On Sun, Feb 15, 2015 at 2:57 AM, Huang Ying <ying.huang@intel.com> wrote:
> FYI, we noticed the below changes on
>
> commit c4a7ca774949960064dac11b326908f28407e8c3 ("SUNRPC: Allow waiting o=
n memory allocation")
>
>
> testbox/testcase/testparams: nhm4/fsmark/performance-1x-32t-1HDD-f2fs-nfs=
v4-8K-400M-fsyncBeforeClose-16d-256fpd
>
> 127b21b89f9d8ba0  c4a7ca774949960064dac11b32
> ----------------  --------------------------
>          %stddev     %change         %stddev
>              \          |                \
>      52524 =C2=B1  0%      +6.0%      55672 =C2=B1  0%  fsmark.time.invol=
untary_context_switches
>        436 =C2=B1 14%     +54.9%        676 =C2=B1 20%  sched_debug.cfs_r=
q[0]:/.tg_load_contrib
>        433 =C2=B1 15%     +54.7%        670 =C2=B1 21%  sched_debug.cfs_r=
q[0]:/.blocked_load_avg
>       8348 =C2=B1  7%     +27.0%      10602 =C2=B1  9%  sched_debug.cfs_r=
q[0]:/.min_vruntime
>     190081 =C2=B1 13%     +32.7%     252269 =C2=B1 13%  sched_debug.cpu#0=
.sched_goidle
>     205783 =C2=B1 12%     +30.2%     267903 =C2=B1 13%  sched_debug.cpu#0=
.ttwu_local
>     464065 =C2=B1 11%     +26.6%     587524 =C2=B1 12%  sched_debug.cpu#0=
.nr_switches
>     464278 =C2=B1 11%     +26.6%     587734 =C2=B1 12%  sched_debug.cpu#0=
.sched_count
>      15807 =C2=B1 11%     +19.6%      18910 =C2=B1 12%  sched_debug.cpu#4=
.nr_load_updates
>     300041 =C2=B1  8%     +20.3%     360969 =C2=B1 10%  sched_debug.cpu#0=
.ttwu_count
>       1863 =C2=B1  9%     +18.1%       2201 =C2=B1 10%  sched_debug.cfs_r=
q[4]:/.exec_clock
>
> testbox/testcase/testparams: nhm4/fsmark/performance-1x-32t-1HDD-btrfs-nf=
sv4-8K-400M-fsyncBeforeClose-16d-256fpd
>
> 127b21b89f9d8ba0  c4a7ca774949960064dac11b32
> ----------------  --------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>      52184 =C2=B1  0%      +5.6%      55122 =C2=B1  0%  fsmark.time.invol=
untary_context_switches
>        557 =C2=B1 19%     +21.5%        677 =C2=B1  9%  sched_debug.cfs_r=
q[5]:/.blocked_load_avg
>        217 =C2=B1 19%     -42.9%        124 =C2=B1 21%  sched_debug.cfs_r=
q[2]:/.load
>      45852 =C2=B1 14%     -39.4%      27773 =C2=B1 24%  sched_debug.cpu#7=
.ttwu_local
>        457 =C2=B1 18%     +50.1%        686 =C2=B1 20%  sched_debug.cfs_r=
q[0]:/.tg_load_contrib
>        455 =C2=B1 18%     +46.7%        668 =C2=B1 19%  sched_debug.cfs_r=
q[0]:/.blocked_load_avg
>      66605 =C2=B1 10%     -26.7%      48826 =C2=B1 14%  sched_debug.cpu#7=
.sched_goidle
>      78249 =C2=B1  9%     -22.5%      60678 =C2=B1 11%  sched_debug.cpu#7=
.ttwu_count
>     153506 =C2=B1  9%     -22.7%     118649 =C2=B1 12%  sched_debug.cpu#7=
.nr_switches
>     153613 =C2=B1  9%     -22.7%     118755 =C2=B1 12%  sched_debug.cpu#7=
.sched_count
>      15806 =C2=B1  6%     +19.2%      18833 =C2=B1 18%  sched_debug.cpu#4=
.nr_load_updates
>       2171 =C2=B1  5%     +15.6%       2510 =C2=B1 13%  sched_debug.cfs_r=
q[4]:/.exec_clock
>       9924 =C2=B1 11%     -27.0%       7244 =C2=B1 25%  sched_debug.cfs_r=
q[3]:/.min_vruntime
>       3156 =C2=B1  4%     -13.4%       2734 =C2=B1  8%  sched_debug.cfs_r=
q[7]:/.min_vruntime
>
> testbox/testcase/testparams: nhm4/fsmark/performance-1x-32t-1HDD-ext4-nfs=
v4-9B-400M-fsyncBeforeClose-16d-256fpd
>
> 127b21b89f9d8ba0  c4a7ca774949960064dac11b32
> ----------------  --------------------------
>     104802 =C2=B1  0%      +7.7%     112883 =C2=B1  0%  fsmark.time.invol=
untary_context_switches
>     471755 =C2=B1  0%      -1.3%     465592 =C2=B1  0%  fsmark.time.volun=
tary_context_switches
>       1977 =C2=B1 36%     +90.8%       3771 =C2=B1  8%  sched_debug.cpu#4=
.curr->pid
>          2 =C2=B1 34%     +80.0%          4 =C2=B1 24%  sched_debug.cpu#6=
.cpu_load[1]
>          4 =C2=B1 33%     +83.3%          8 =C2=B1 31%  sched_debug.cpu#6=
.cpu_load[0]
>        193 =C2=B1 17%     +48.0%        286 =C2=B1 19%  sched_debug.cfs_r=
q[2]:/.blocked_load_avg
>        196 =C2=B1 17%     +47.5%        290 =C2=B1 19%  sched_debug.cfs_r=
q[2]:/.tg_load_contrib
>         96 =C2=B1 18%     +40.6%        135 =C2=B1 11%  sched_debug.cfs_r=
q[7]:/.load
>         97 =C2=B1 18%     +38.5%        135 =C2=B1 11%  sched_debug.cpu#7=
.load
>       2274 =C2=B1  7%     -16.5%       1898 =C2=B1  3%  proc-vmstat.pgall=
oc_dma
>        319 =C2=B1  6%     -29.7%        224 =C2=B1 24%  sched_debug.cfs_r=
q[1]:/.tg_load_contrib
>        314 =C2=B1  5%     -29.4%        222 =C2=B1 25%  sched_debug.cfs_r=
q[1]:/.blocked_load_avg
>        621 =C2=B1 10%     +41.9%        881 =C2=B1 37%  sched_debug.cfs_r=
q[4]:/.avg->runnable_avg_sum
>
> nhm4: Nehalem
> Memory: 4G
>
>
>
>
>                       fsmark.time.involuntary_context_switches
>
>   114000 ++--------------------------------------------------------------=
---+
>   113000 O+    O     O  O  O  O  O  O  O   O  O  O  O  O  O  O     O     =
O  |
>          |  O     O                                             O     O  =
   O
>   112000 ++                                                              =
   |
>   111000 ++                                                              =
   |
>          |                                                               =
   |
>   110000 ++                                                              =
   |
>   109000 ++                                                              =
   |
>   108000 ++                                                              =
   |
>          |                                                               =
   |
>   107000 ++                                                              =
   |
>   106000 ++                                                              =
   |
>          |                                                               =
   |
>   105000 *+.*..*..*..*..*..*..*..*..*..*...*..*..*..*..*..*..*..*        =
   |
>   104000 ++--------------------------------------------------------------=
---+
>
>
>         [*] bisect-good sample
>         [O] bisect-bad  sample
>
> To reproduce:
>
>         apt-get install ruby
>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-t=
ests.git
>         cd lkp-tests
>         bin/setup-local job.yaml # the job file attached in this email
>         bin/run-local   job.yaml

So this is on a loopback NFS setup (i.e. the server resides on the
same node as the client, which just mounts from the loopback IP
address 127.0.0.1)?
That's a fairly quirky setup as far as memory management goes. In low
memory situations, you have very a nasty feedback mechanism whereby
the NFS server ends up pushing the client to write back more data,
increasing the memory pressure on the NFS server, etc.
It is quite possible that allowing the NFS client to block more
aggressively in low memory situations could worsen that feedback
mechanism, however that's not our main target platform; we actively
discourage people from using loopback NFS in production systems.

Is there any way you could confirm this performance change using a
remote NFS server instead of the loopback NFS?

Cheers
  Trond
-- =

Trond Myklebust
Linux NFS client maintainer, PrimaryData
trond.myklebust(a)primarydata.com

--===============2849935378907314499==--

