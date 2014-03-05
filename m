Content-Type: multipart/mixed; boundary="===============0214027420048401698=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [blk-lib] 6a0608544e5: fileio -77.4% max latency, -5.7% throughput
Date: Wed, 05 Mar 2014 09:16:45 +0800
Message-ID: <20140305011645.GA7433@localhost>
In-Reply-To: <20140304215225.GH11655@kmo>
List-Id: <oe-lkp.lists.linux.dev>

--===============0214027420048401698==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 04, 2014 at 01:52:25PM -0800, Kent Overstreet wrote:
> On Tue, Mar 04, 2014 at 09:21:30PM +0800, Fengguang Wu wrote:
> > Hi Kent,
> > =

> > FYI, we noticed the below changes on
> > =

> > git://evilpiepirate.org/~kent/linux-bcache.git for-jens
> > commit 6a0608544e5672bd9a044c285119547eae41abe5 ("blk-lib.c: generic_ma=
ke_request() handles large bios now")
> > =

> > test case: snb-drag/sysbench/fileio/600s-100%-1HDD-ext4-64G-1024-seqrew=
r-sync

snb-drag is the test machine, it's a SNB desktop.

The test command is

        mkfs -t ext4 -q /dev/sda2
        mount -t ext4 /dev/sda2 /fs/sda2
        cd /fs/sda2

        for i in $(seq 0 1023)
        do
                fallocate -l 67108864 test_file.$i
        done

        sysbench --test=3Dfileio --max-requests=3D0 --num-threads=3D4 --max=
-time=3D600 --file-test-mode=3Dseqrewr --file-total-size=3D68719476736 --fi=
le-io-mode=3Dsync --file-num=3D1024 run


> I'm trying to figure out how to parse this and the graphs - where do I fi=
nd the
> test? And is there anything you can point me to for the graphs, or is that
> output from that test?
> =

> > =

> > 11541d5f5b7002b  6a0608544e5672bd9a044c285  =

> > ---------------  -------------------------  =

> >       1885 ~60%     -77.4%        426 ~ 7%  TOTAL fileio.request_latenc=
y_max_ms

The ~XX% numbers are stddev percent.
The [+-]XX% is change percent.

> >       6258 ~ 0%      -5.7%       5904 ~ 0%  TOTAL fileio.requests_per_s=
ec
> >         26 ~ 1%    +702.3%        211 ~ 8%  TOTAL slabinfo.kmalloc-4096=
.num_slabs
> >        217 ~ 1%    +682.3%       1697 ~ 8%  TOTAL slabinfo.kmalloc-4096=
.num_objs
> >         26 ~ 1%    +702.3%        211 ~ 8%  TOTAL slabinfo.kmalloc-4096=
.active_slabs
> >        211 ~ 2%    +701.5%       1697 ~ 8%  TOTAL slabinfo.kmalloc-4096=
.active_objs
> >          2 ~ 0%     -50.0%          1 ~ 0%  TOTAL vmstat.procs.b
> >       2236 ~ 0%     +63.6%       3659 ~ 3%  TOTAL slabinfo.kmalloc-256.=
num_objs
> >       2217 ~ 0%     +63.4%       3623 ~ 3%  TOTAL slabinfo.kmalloc-256.=
active_objs
> >       3274 ~ 1%     +47.8%       4837 ~ 2%  TOTAL proc-vmstat.nr_slab_u=
nreclaimable
> >      13096 ~ 1%     +47.7%      19350 ~ 2%  TOTAL meminfo.SUnreclaim
> >   62558204 ~ 5%     -30.7%   43379766 ~ 1%  TOTAL cpuidle.C3-SNB.time
> >      91031 ~ 4%     -29.4%      64253 ~ 2%  TOTAL cpuidle.C1E-SNB.usage
> >      34092 ~ 2%     -17.6%      28085 ~ 1%  TOTAL cpuidle.C3-SNB.usage
> >       2656 ~ 2%     -15.0%       2258 ~ 2%  TOTAL proc-vmstat.kswapd_hi=
gh_wmark_hit_quickly
> >     266339 ~ 2%     +14.2%     304129 ~ 0%  TOTAL cpuidle.C6-SNB.usage
> >      21899 ~ 2%      +9.6%      23992 ~ 2%  TOTAL interrupts.RES
> >         20 ~ 0%      -8.0%         18 ~ 2%  TOTAL time.percent_of_cpu_t=
his_job_got
> >    3430189 ~ 0%      -5.9%    3226430 ~ 0%  TOTAL time.voluntary_contex=
t_switches
> >        117 ~ 0%      -6.0%        110 ~ 0%  TOTAL time.system_time
> >      11691 ~ 0%      -5.6%      11042 ~ 0%  TOTAL vmstat.system.cs
> >        711 ~ 0%      +4.4%        742 ~ 0%  TOTAL iostat.sda.await
> >        712 ~ 0%      +4.4%        743 ~ 0%  TOTAL iostat.sda.w_await
> >      99142 ~ 0%      -2.2%      96963 ~ 0%  TOTAL iostat.sda.wkB/s
> >      99257 ~ 0%      -2.2%      97110 ~ 0%  TOTAL vmstat.io.bo
> >        139 ~ 0%      +1.7%        141 ~ 0%  TOTAL iostat.sda.avgqu-sz
> > =

> > =


The below graph shows all samples collected during the bisect

[*] bisect-good =

[O] bisect-bad

In which you can see the stableness of the change and bisect. =


> >                                fileio.requests_per_sec
> > =

> >    6300 ++----------------------------------------------------------*--=
-----+
> >    6250 *+.*..  .*.*..*..*..*..*..*.*..*..*..*..*..*.*..*..*..*..*.   *=
..*..*
> >         |     *.                                                       =
     |
> >    6200 ++                                                             =
     |
> >    6150 ++                                                             =
     |
> >         |                                                              =
     |
> >    6100 ++                                                             =
     |
> >    6050 ++                                                             =
     |
> >    6000 ++                        O                                    =
     |
> >         |     O                                            O           =
     |
> >    5950 O+ O                                         O                 =
     |
> >    5900 ++       O    O  O     O                              O        =
     |
> >         |          O        O       O  O     O     O                   =
     |
> >    5850 ++                                O     O       O              =
     |
> >    5800 ++-------------------------------------------------------------=
-----+
> > =

> > =

> >                             fileio.request_latency_max_ms
> > =

> >    4500 ++-------------------------------------------------------------=
-----+
> >         |                                                             *=
     |
> >    4000 ++                                                            :=
     |
> >    3500 ++                                                            :=
:    |
> >         |                                                            : =
:    |
> >    3000 ++                                   *                       : =
:    |
> >    2500 ++                             *..  + :    *                 : =
 :   |
> >         |                             +    +   :  + :                : =
 :   |
> >    2000 ++        .*..               +    *    : +  :                : =
 :   |
> >    1500 ++       *    *..   *..    .*           *    : .*..*..*..*..:  =
  : .*
> >         *..    ..         ..     .*                  *.             :  =
  *. |
> >    1000 ++   .*          *     *.                                   *  =
     |
> >     500 ++ *.         O                                                =
     |
> >         O  O  O  O O     O  O  O  O O  O  O  O  O  O O  O  O  O        =
     |
> >       0 ++-------------------------------------------------------------=
-----+
> > =

> > =

> > =

> > Thanks,
> > Fengguang

--===============0214027420048401698==--

