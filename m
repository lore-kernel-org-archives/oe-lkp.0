Content-Type: multipart/mixed; boundary="===============8913124079549222321=="
MIME-Version: 1.0
From: Jens Axboe <axboe@fb.com>
To: lkp@lists.01.org
Subject: Re: [block] 34b48db66e0: +3291.6% iostat.sde.wrqm/s
Date: Thu, 22 Jan 2015 12:02:37 -0700
Message-ID: <54C1494D.5050507@fb.com>
In-Reply-To: <x49zj9a9073.fsf@segfault.boston.devel.redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8913124079549222321==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 01/22/2015 10:47 AM, Jeff Moyer wrote:
> Jens Axboe <axboe@fb.com> writes:
> =

>> On 01/21/2015 06:21 PM, Huang Ying wrote:
>>> FYI, we noticed the below changes on
>>>
>>> commit 34b48db66e08ca1c1bc07cf305d672ac940268dc ("block: remove artific=
al max_hw_sectors cap")
>>>
>>> testbox/testcase/testparams: lkp-ws02/fileio/600s-100%-1HDD-btrfs-64G-1=
024f-seqrewr-sync
>>>
>>> c2661b806092d8ea  34b48db66e08ca1c1bc07cf305
>>> ----------------  --------------------------
>>>           %stddev     %change         %stddev
>>>               \          |                \
>>>       47176 =C2=B1  2%     -67.3%      15406 =C2=B1  4%  softirqs.BLOCK
>>>        1110 =C2=B1 44%     -51.0%        544 =C2=B1 35%  sched_debug.cp=
u#8.curr->pid
>>>          22 =C2=B1 33%     -48.9%         11 =C2=B1 43%  sched_debug.cp=
u#1.cpu_load[0]
>>>          91 =C2=B1 43%    +125.0%        204 =C2=B1 32%  sched_debug.cf=
s_rq[4]:/.blocked_load_avg
>>>          17 =C2=B1 46%     -65.2%          6 =C2=B1 31%  sched_debug.cf=
s_rq[1]:/.runnable_load_avg
>>>         105 =C2=B1 43%    +102.6%        213 =C2=B1 32%  sched_debug.cf=
s_rq[4]:/.tg_load_contrib
>>>         163 =C2=B1 35%     +62.6%        265 =C2=B1 27%  sched_debug.cf=
s_rq[16]:/.blocked_load_avg
>>>         183 =C2=B1 29%     +51.4%        277 =C2=B1 26%  sched_debug.cf=
s_rq[16]:/.tg_load_contrib
>>>        1411 =C2=B1 31%     -42.5%        812 =C2=B1 32%  sched_debug.cp=
u#6.curr->pid
>>>    57565068 =C2=B1 15%     +66.8%   96024066 =C2=B1 17%  cpuidle.C1E-NH=
M.time
>>>       94625 =C2=B1  9%     -32.5%      63893 =C2=B1  4%  cpuidle.C3-NHM=
.usage
>>>         200 =C2=B1 14%     -22.8%        155 =C2=B1 24%  sched_debug.cf=
s_rq[8]:/.tg_load_contrib
>>>         244 =C2=B1 33%     -39.0%        149 =C2=B1 11%  sched_debug.cf=
s_rq[6]:/.blocked_load_avg
>>>         265 =C2=B1 31%     -38.4%        163 =C2=B1  9%  sched_debug.cf=
s_rq[6]:/.tg_load_contrib
>>>        4959 =C2=B1  9%     -18.2%       4058 =C2=B1  1%  slabinfo.kmall=
oc-128.active_objs
>>>        4987 =C2=B1  9%     -18.6%       4058 =C2=B1  1%  slabinfo.kmall=
oc-128.num_objs
>>>          19 =C2=B1  8%     -19.7%         15 =C2=B1 14%  sched_debug.cp=
u#0.cpu_load[1]
>>>      662307 =C2=B1  7%     -12.6%     579108 =C2=B1  3%  cpuidle.C6-NHM=
.usage
>>>        3028 =C2=B1  7%     -12.3%       2656 =C2=B1  1%  slabinfo.ext4_=
extent_status.num_objs
>>>        3028 =C2=B1  7%     -12.3%       2656 =C2=B1  1%  slabinfo.ext4_=
extent_status.active_objs
>>>        4.87 =C2=B1  0%   +3291.6%     165.07 =C2=B1  0%  iostat.sde.wrq=
m/s
>>>        1006 =C2=B1  0%    +120.3%       2216 =C2=B1  0%  iostat.sde.avg=
rq-sz
>>
>> So these two above tells us that we are doing way more write merges
>> per second, and that the average request size has roughly doubled from
>> 1006 to 2216 - both are excellent news.
>>
>>>         466 =C2=B1  0%    +115.9%       1007 =C2=B1  0%  iostat.sde.awa=
it
>>>         466 =C2=B1  0%    +115.9%       1007 =C2=B1  0%  iostat.sde.w_a=
wait
>>
>> Service time roughly doubled, must be mostly stream time.
>>
>>>         301 =C2=B1  0%     -52.7%        142 =C2=B1  0%  iostat.sde.w/s
>>
>> About half the number of writes completed, but from the stats above,
>> those writes are more than double. 1006 * 301 < 2216 * 142, so again,
>> this looks good.
>>
>>>        2230 =C2=B1  2%      -8.2%       2048 =C2=B1  2%  vmstat.system.=
in
>>
>> And a nice reduction in irq rate, also nice. Way less software irqs
>> from the first few lines, also a win.
> =

> Agreed on all above, but are the actual benchmark numbers included
> somewhere in all this mess?  I'd like to see if the benchmark numbers
> improved first, before digging into the guts of which functions are
> called more or which stats changed.

I deleted the original email, but the latter tables had drive throughput
rates and it looked higher for the ones I checked on the newer kernel.
Which the above math would indicate as well, multiplying reqs-per-sec
and req-size.

-- =

Jens Axboe


--===============8913124079549222321==--

