Content-Type: multipart/mixed; boundary="===============8979636691990608130=="
MIME-Version: 1.0
From: Jan Kara <jack@suse.cz>
To: lkp@lists.01.org
Subject: Re: [writeback] 6903673566d: +2.5% fileio.requests_per_sec
Date: Thu, 10 Apr 2014 21:27:51 +0200
Message-ID: <20140410192751.GE8060@quack.suse.cz>
In-Reply-To: <20140410130552.GA17871@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============8979636691990608130==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu 10-04-14 21:05:52, Wu Fengguang wrote:
> On Thu, Apr 10, 2014 at 08:41:37PM +0800, Fengguang Wu wrote:
> Here are the changed stats before/after the patchset:
  Thanks for gathering the numbers!

>       v3.14-rc8  ea87e2e7e0905325c58cf5643
> ---------------  -------------------------
>      58.98 ~102%     -73.2%      15.78       snb-drag/sysbench/fileio/600=
s-100%-1HDD-ext4-64G-1024-rndwr-sync
>    2215.64 ~61%     -69.2%     682.57       snb-drag/sysbench/fileio/600s=
-100%-1HDD-ext4-64G-1024-seqrewr-sync
>     185.22 ~132%     -93.6%      11.80       snb-drag/sysbench/fileio/600=
s-100%-1HDD-xfs-64G-1024-rndwr-sync
>    2459.84 ~67%     -71.1%     710.15       TOTAL fileio.request_latency_=
max_ms
> =

>       v3.14-rc8  ea87e2e7e0905325c58cf5643
> ---------------  -------------------------
>       6251 ~ 0%      +4.0%       6503       snb-drag/sysbench/fileio/600s=
-100%-1HDD-ext4-64G-1024-seqrewr-sync
>       6532 ~ 0%      +3.2%       6737 ~ 0%  snb-drag/sysbench/fileio/600s=
-100%-1HDD-xfs-64G-1024-seqrewr-sync
>       6444 ~ 0%      +1.7%       6554 ~ 0%  snb-drag/sysbench/fileio/600s=
-100%-1HDD-xfs-64G-1024-seqwr-sync
>      19227 ~ 0%      +3.0%      19795       TOTAL fileio.requests_per_sec
> =

  So fileio got better latency and higher requests per second. That's good.
...

>       v3.14-rc8  ea87e2e7e0905325c58cf5643
> ---------------  -------------------------
>     397285 ~ 0%      -6.9%     369872 ~ 0%  lkp-st02/micro/dd-write/11HDD=
-RAID5-cfq-xfs-10dd
>     359312 ~ 0%      -5.5%     339685       lkp-ws02/micro/dd-write/11HDD=
-RAID5-cfq-xfs-100dd
>     404981 ~ 0%      -4.5%     386775       lkp-ws02/micro/dd-write/11HDD=
-RAID5-cfq-xfs-10dd
>    1161579 ~ 0%      -5.6%    1096334       TOTAL iostat.md0.wkB/s
  So dd writing tests got lower throughput reported by iostat. I'll try to
have a look whether I can reproduce that. BTW: Does that also correspond to
longer time-to-completion of the dd test?

>       v3.14-rc8  ea87e2e7e0905325c58cf5643
> ---------------  -------------------------
>    1.2e+08 ~ 0%      +4.0%  1.249e+08       snb-drag/sysbench/fileio/600s=
-100%-1HDD-ext4-64G-1024-seqrewr-sync
>  1.254e+08 ~ 0%      +3.1%  1.294e+08 ~ 0%  snb-drag/sysbench/fileio/600s=
-100%-1HDD-xfs-64G-1024-seqrewr-sync
>  1.237e+08 ~ 0%      +1.7%  1.259e+08 ~ 0%  snb-drag/sysbench/fileio/600s=
-100%-1HDD-xfs-64G-1024-seqwr-sync
>  3.692e+08 ~ 0%      +3.0%  3.801e+08       TOTAL time.file_system_outputs
  What's this measuring?

								Honza
-- =

Jan Kara <jack@suse.cz>
SUSE Labs, CR

--===============8979636691990608130==--

