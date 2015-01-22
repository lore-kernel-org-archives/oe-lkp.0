Content-Type: multipart/mixed; boundary="===============2568860280852903429=="
MIME-Version: 1.0
From: Jeff Moyer <jmoyer@redhat.com>
To: lkp@lists.01.org
Subject: Re: [block] 34b48db66e0: +3291.6% iostat.sde.wrqm/s
Date: Thu, 22 Jan 2015 12:47:44 -0500
Message-ID: <x49zj9a9073.fsf@segfault.boston.devel.redhat.com>
In-Reply-To: <54C08CA6.8050101@fb.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2568860280852903429==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Jens Axboe <axboe@fb.com> writes:

> On 01/21/2015 06:21 PM, Huang Ying wrote:
>> FYI, we noticed the below changes on
>>
>> commit 34b48db66e08ca1c1bc07cf305d672ac940268dc ("block: remove artifica=
l max_hw_sectors cap")
>>
>> testbox/testcase/testparams: lkp-ws02/fileio/600s-100%-1HDD-btrfs-64G-10=
24f-seqrewr-sync
>>
>> c2661b806092d8ea  34b48db66e08ca1c1bc07cf305
>> ----------------  --------------------------
>>           %stddev     %change         %stddev
>>               \          |                \
>>       47176 =C2=B1  2%     -67.3%      15406 =C2=B1  4%  softirqs.BLOCK
>>        1110 =C2=B1 44%     -51.0%        544 =C2=B1 35%  sched_debug.cpu=
#8.curr->pid
>>          22 =C2=B1 33%     -48.9%         11 =C2=B1 43%  sched_debug.cpu=
#1.cpu_load[0]
>>          91 =C2=B1 43%    +125.0%        204 =C2=B1 32%  sched_debug.cfs=
_rq[4]:/.blocked_load_avg
>>          17 =C2=B1 46%     -65.2%          6 =C2=B1 31%  sched_debug.cfs=
_rq[1]:/.runnable_load_avg
>>         105 =C2=B1 43%    +102.6%        213 =C2=B1 32%  sched_debug.cfs=
_rq[4]:/.tg_load_contrib
>>         163 =C2=B1 35%     +62.6%        265 =C2=B1 27%  sched_debug.cfs=
_rq[16]:/.blocked_load_avg
>>         183 =C2=B1 29%     +51.4%        277 =C2=B1 26%  sched_debug.cfs=
_rq[16]:/.tg_load_contrib
>>        1411 =C2=B1 31%     -42.5%        812 =C2=B1 32%  sched_debug.cpu=
#6.curr->pid
>>    57565068 =C2=B1 15%     +66.8%   96024066 =C2=B1 17%  cpuidle.C1E-NHM=
.time
>>       94625 =C2=B1  9%     -32.5%      63893 =C2=B1  4%  cpuidle.C3-NHM.=
usage
>>         200 =C2=B1 14%     -22.8%        155 =C2=B1 24%  sched_debug.cfs=
_rq[8]:/.tg_load_contrib
>>         244 =C2=B1 33%     -39.0%        149 =C2=B1 11%  sched_debug.cfs=
_rq[6]:/.blocked_load_avg
>>         265 =C2=B1 31%     -38.4%        163 =C2=B1  9%  sched_debug.cfs=
_rq[6]:/.tg_load_contrib
>>        4959 =C2=B1  9%     -18.2%       4058 =C2=B1  1%  slabinfo.kmallo=
c-128.active_objs
>>        4987 =C2=B1  9%     -18.6%       4058 =C2=B1  1%  slabinfo.kmallo=
c-128.num_objs
>>          19 =C2=B1  8%     -19.7%         15 =C2=B1 14%  sched_debug.cpu=
#0.cpu_load[1]
>>      662307 =C2=B1  7%     -12.6%     579108 =C2=B1  3%  cpuidle.C6-NHM.=
usage
>>        3028 =C2=B1  7%     -12.3%       2656 =C2=B1  1%  slabinfo.ext4_e=
xtent_status.num_objs
>>        3028 =C2=B1  7%     -12.3%       2656 =C2=B1  1%  slabinfo.ext4_e=
xtent_status.active_objs
>>        4.87 =C2=B1  0%   +3291.6%     165.07 =C2=B1  0%  iostat.sde.wrqm=
/s
>>        1006 =C2=B1  0%    +120.3%       2216 =C2=B1  0%  iostat.sde.avgr=
q-sz
>
> So these two above tells us that we are doing way more write merges
> per second, and that the average request size has roughly doubled from
> 1006 to 2216 - both are excellent news.
>
>>         466 =C2=B1  0%    +115.9%       1007 =C2=B1  0%  iostat.sde.await
>>         466 =C2=B1  0%    +115.9%       1007 =C2=B1  0%  iostat.sde.w_aw=
ait
>
> Service time roughly doubled, must be mostly stream time.
>
>>         301 =C2=B1  0%     -52.7%        142 =C2=B1  0%  iostat.sde.w/s
>
> About half the number of writes completed, but from the stats above,
> those writes are more than double. 1006 * 301 < 2216 * 142, so again,
> this looks good.
>
>>        2230 =C2=B1  2%      -8.2%       2048 =C2=B1  2%  vmstat.system.in
>
> And a nice reduction in irq rate, also nice. Way less software irqs
> from the first few lines, also a win.

Agreed on all above, but are the actual benchmark numbers included
somewhere in all this mess?  I'd like to see if the benchmark numbers
improved first, before digging into the guts of which functions are
called more or which stats changed.

Cheers,
Jeff

--===============2568860280852903429==--

