Content-Type: multipart/mixed; boundary="===============4986288254807998416=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [writeback] 6903673566d: +2.5% fileio.requests_per_sec
Date: Fri, 11 Apr 2014 13:12:04 +0800
Message-ID: <20140411051204.GB22353@localhost>
In-Reply-To: <20140410192751.GE8060@quack.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============4986288254807998416==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2014 at 09:27:51PM +0200, Jan Kara wrote:
> On Thu 10-04-14 21:05:52, Wu Fengguang wrote:
> > On Thu, Apr 10, 2014 at 08:41:37PM +0800, Fengguang Wu wrote:
> > Here are the changed stats before/after the patchset:
>   Thanks for gathering the numbers!
> =

> >       v3.14-rc8  ea87e2e7e0905325c58cf5643
> > ---------------  -------------------------
> >      58.98 ~102%     -73.2%      15.78       snb-drag/sysbench/fileio/6=
00s-100%-1HDD-ext4-64G-1024-rndwr-sync
> >    2215.64 ~61%     -69.2%     682.57       snb-drag/sysbench/fileio/60=
0s-100%-1HDD-ext4-64G-1024-seqrewr-sync
> >     185.22 ~132%     -93.6%      11.80       snb-drag/sysbench/fileio/6=
00s-100%-1HDD-xfs-64G-1024-rndwr-sync
> >    2459.84 ~67%     -71.1%     710.15       TOTAL fileio.request_latenc=
y_max_ms
> > =

> >       v3.14-rc8  ea87e2e7e0905325c58cf5643
> > ---------------  -------------------------
> >       6251 ~ 0%      +4.0%       6503       snb-drag/sysbench/fileio/60=
0s-100%-1HDD-ext4-64G-1024-seqrewr-sync
> >       6532 ~ 0%      +3.2%       6737 ~ 0%  snb-drag/sysbench/fileio/60=
0s-100%-1HDD-xfs-64G-1024-seqrewr-sync
> >       6444 ~ 0%      +1.7%       6554 ~ 0%  snb-drag/sysbench/fileio/60=
0s-100%-1HDD-xfs-64G-1024-seqwr-sync
> >      19227 ~ 0%      +3.0%      19795       TOTAL fileio.requests_per_s=
ec
> > =

>   So fileio got better latency and higher requests per second. That's goo=
d.
> ...
> =

> >       v3.14-rc8  ea87e2e7e0905325c58cf5643
> > ---------------  -------------------------
> >     397285 ~ 0%      -6.9%     369872 ~ 0%  lkp-st02/micro/dd-write/11H=
DD-RAID5-cfq-xfs-10dd
> >     359312 ~ 0%      -5.5%     339685       lkp-ws02/micro/dd-write/11H=
DD-RAID5-cfq-xfs-100dd
> >     404981 ~ 0%      -4.5%     386775       lkp-ws02/micro/dd-write/11H=
DD-RAID5-cfq-xfs-10dd
> >    1161579 ~ 0%      -5.6%    1096334       TOTAL iostat.md0.wkB/s
>   So dd writing tests got lower throughput reported by iostat. I'll try to
> have a look whether I can reproduce that. BTW: Does that also correspond =
to
> longer time-to-completion of the dd test?

Nope, there are no noticeable changes for time.elapsed_time:

      v3.14-rc8  ea87e2e7e0905325c58cf5643
---------------  -------------------------
    601.99 ~ 0%      +0.0%     602.07 ~ 0%  lkp-st02/micro/dd-write/11HDD-R=
AID5-cfq-xfs-10dd
    630.92 ~ 0%      -0.9%     625.24       lkp-ws02/micro/dd-write/11HDD-J=
BOD-cfq-ext4-100dd
    615.98 ~ 0%      -0.2%     614.74       lkp-ws02/micro/dd-write/11HDD-J=
BOD-cfq-ext4-10dd
    610.58 ~ 0%      -0.1%     609.92 ~ 0%  lkp-ws02/micro/dd-write/11HDD-J=
BOD-cfq-ext4-1dd
    608.90 ~ 0%      +0.0%     609.09       lkp-ws02/micro/dd-write/11HDD-J=
BOD-cfq-xfs-100dd
    604.46 ~ 0%      +0.0%     604.66       lkp-ws02/micro/dd-write/11HDD-J=
BOD-cfq-xfs-10dd
    603.67 ~ 0%      +0.0%     603.70       lkp-ws02/micro/dd-write/11HDD-J=
BOD-cfq-xfs-1dd
    606.65 ~ 0%      +0.0%     606.93       lkp-ws02/micro/dd-write/11HDD-R=
AID5-cfq-ext4-100dd
    606.31 ~ 0%      +0.0%     606.49       lkp-ws02/micro/dd-write/11HDD-R=
AID5-cfq-ext4-10dd
    602.97 ~ 0%      -0.2%     601.89       lkp-ws02/micro/dd-write/11HDD-R=
AID5-cfq-ext4-1dd
    603.92 ~ 0%      -0.2%     603.01       lkp-ws02/micro/dd-write/11HDD-R=
AID5-cfq-xfs-100dd
    602.66 ~ 0%      -0.0%     602.63       lkp-ws02/micro/dd-write/11HDD-R=
AID5-cfq-xfs-10dd
    602.19 ~ 0%      +0.2%     603.52       lkp-ws02/micro/dd-write/11HDD-R=
AID5-cfq-xfs-1dd

> =

> >       v3.14-rc8  ea87e2e7e0905325c58cf5643
> > ---------------  -------------------------
> >    1.2e+08 ~ 0%      +4.0%  1.249e+08       snb-drag/sysbench/fileio/60=
0s-100%-1HDD-ext4-64G-1024-seqrewr-sync
> >  1.254e+08 ~ 0%      +3.1%  1.294e+08 ~ 0%  snb-drag/sysbench/fileio/60=
0s-100%-1HDD-xfs-64G-1024-seqrewr-sync
> >  1.237e+08 ~ 0%      +1.7%  1.259e+08 ~ 0%  snb-drag/sysbench/fileio/60=
0s-100%-1HDD-xfs-64G-1024-seqwr-sync
> >  3.692e+08 ~ 0%      +3.0%  3.801e+08       TOTAL time.file_system_outp=
uts
>   What's this measuring?

It corresponds to the "File system outputs" line in the below output.
It should be the number of dirtied pages.

% /usr/bin/time -v sleep 1
        Command being timed: "sleep 1"
        User time (seconds): 0.00
        System time (seconds): 0.00
        Percent of CPU this job got: 0%
        Elapsed (wall clock) time (h:mm:ss or m:ss): 0:01.00
        Average shared text size (kbytes): 0
        Average unshared data size (kbytes): 0
        Average stack size (kbytes): 0
        Average total size (kbytes): 0
        Maximum resident set size (kbytes): 2608
        Average resident set size (kbytes): 0
        Major (requiring I/O) page faults: 0
        Minor (reclaiming a frame) page faults: 213
        Voluntary context switches: 2
        Involuntary context switches: 1
        Swaps: 0
        File system inputs: 0
        File system outputs: 0
        Socket messages sent: 0
        Socket messages received: 0
        Signals delivered: 0
        Page size (bytes): 4096
        Exit status: 0


--===============4986288254807998416==--

