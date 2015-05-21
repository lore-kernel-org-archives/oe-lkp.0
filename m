Content-Type: multipart/mixed; boundary="===============6055763271199425168=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [sched] 2b7928c9434: +9.8% hackbench.throughput,
Date: Thu, 21 May 2015 08:30:58 +0800
Message-ID: <1432168258.16919.53.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6055763271199425168==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://bee.sh.intel.com/git/ydu19/linux for-lkp
commit 2b7928c943449ab2b5f4fa4c2d1c9b672e500f76 ("sched: Remove update_rq_r=
unnable_avg")


testcase/path_params/tbox_group: pbzip2/performance-100%-900K/ivb42

        v4.1-rc1  2b7928c943449ab2b5f4fa4c2d  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

      3424 =C2=B1 41%    -100.0%          0 =C2=B1  0%  latency_stats.avg.w=
ait_woken.inotify_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
         0 =C2=B1 30%    -100.0%          0 =C2=B1  0%  latency_stats.hits.=
wait_woken.inotify_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
      3424 =C2=B1 41%    -100.0%          0 =C2=B1  0%  latency_stats.max.w=
ait_woken.inotify_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
      3424 =C2=B1 41%    -100.0%          0 =C2=B1  0%  latency_stats.sum.w=
ait_woken.inotify_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
       898 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.tg_runnable_contrib
     43258 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.tg->runnable_avg
     41229 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.avg->runnable_avg_sum
     42702 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.avg->avg_period
     42713 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.avg->avg_period
     41348 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.avg->runnable_avg_sum
     43260 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.tg->runnable_avg
       901 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.tg_runnable_contrib
     43260 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.tg->runnable_avg
     41304 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.avg->runnable_avg_sum
     42725 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.avg->avg_period
       900 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.tg_runnable_contrib
       899 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.tg_runnable_contrib
     43261 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.tg->runnable_avg
     41271 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.avg->runnable_avg_sum
     42720 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.avg->avg_period
     42712 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.avg->avg_period
     41318 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.avg->runnable_avg_sum
     43261 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.tg->runnable_avg
       900 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.tg_runnable_contrib
     42705 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.avg->avg_period
       900 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.tg_runnable_contrib
     43261 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.tg->runnable_avg
     41280 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.avg->runnable_avg_sum
     41276 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.avg->runnable_avg_sum
     42732 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.avg->avg_period
       899 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.tg_runnable_contrib
     43261 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.tg->runnable_avg
       902 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
16]:/.tg_runnable_contrib
     43261 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
16]:/.tg->runnable_avg
     41430 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
16]:/.avg->runnable_avg_sum
     42749 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
16]:/.avg->avg_period
       899 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
17]:/.tg_runnable_contrib
     41277 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
17]:/.avg->runnable_avg_sum
     42735 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
17]:/.avg->avg_period
     43261 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
17]:/.tg->runnable_avg
     42740 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
18]:/.avg->avg_period
     41405 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
18]:/.avg->runnable_avg_sum
     43261 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
18]:/.tg->runnable_avg
       902 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
18]:/.tg_runnable_contrib
     43261 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
19]:/.tg->runnable_avg
     42752 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
19]:/.avg->avg_period
     41371 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
19]:/.avg->runnable_avg_sum
       901 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
19]:/.tg_runnable_contrib
     43259 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.tg->runnable_avg
     41380 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.avg->runnable_avg_sum
     42711 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.avg->avg_period
       901 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.tg_runnable_contrib
     42713 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
20]:/.avg->avg_period
     41341 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
20]:/.avg->runnable_avg_sum
     43262 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
20]:/.tg->runnable_avg
       901 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
20]:/.tg_runnable_contrib
     41413 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
21]:/.avg->runnable_avg_sum
     43262 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
21]:/.tg->runnable_avg
       902 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
21]:/.tg_runnable_contrib
     42730 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
21]:/.avg->avg_period
     41279 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
22]:/.avg->runnable_avg_sum
     43262 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
22]:/.tg->runnable_avg
       899 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
22]:/.tg_runnable_contrib
     42723 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
22]:/.avg->avg_period
     43263 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
23]:/.tg->runnable_avg
       899 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
23]:/.tg_runnable_contrib
     41276 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
23]:/.avg->runnable_avg_sum
     42736 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
23]:/.avg->avg_period
     42737 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
24]:/.avg->avg_period
     41378 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
24]:/.avg->runnable_avg_sum
     43263 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
24]:/.tg->runnable_avg
       901 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
24]:/.tg_runnable_contrib
     43263 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
25]:/.tg->runnable_avg
     41444 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
25]:/.avg->runnable_avg_sum
       902 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
25]:/.tg_runnable_contrib
     42727 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
25]:/.avg->avg_period
     42731 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
26]:/.avg->avg_period
     41382 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
26]:/.avg->runnable_avg_sum
     43262 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
26]:/.tg->runnable_avg
       901 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
26]:/.tg_runnable_contrib
     43262 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
27]:/.tg->runnable_avg
     41398 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
27]:/.avg->runnable_avg_sum
     42751 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
27]:/.avg->avg_period
       902 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
27]:/.tg_runnable_contrib
       901 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
28]:/.tg_runnable_contrib
     43263 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
28]:/.tg->runnable_avg
     41370 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
28]:/.avg->runnable_avg_sum
     42728 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
28]:/.avg->avg_period
       899 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
29]:/.tg_runnable_contrib
     43263 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
29]:/.tg->runnable_avg
     41301 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
29]:/.avg->runnable_avg_sum
     42722 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
29]:/.avg->avg_period
     42754 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.avg->avg_period
     41441 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.avg->runnable_avg_sum
     43259 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.tg->runnable_avg
       902 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.tg_runnable_contrib
     42743 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
30]:/.avg->avg_period
     41372 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
30]:/.avg->runnable_avg_sum
     43263 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
30]:/.tg->runnable_avg
       901 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
30]:/.tg_runnable_contrib
     42738 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
31]:/.avg->avg_period
     41288 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
31]:/.avg->runnable_avg_sum
     43263 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
31]:/.tg->runnable_avg
       899 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
31]:/.tg_runnable_contrib
       901 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
32]:/.tg_runnable_contrib
     42725 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
32]:/.avg->avg_period
     41359 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
32]:/.avg->runnable_avg_sum
     43264 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
32]:/.tg->runnable_avg
     42730 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
33]:/.avg->avg_period
     41400 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
33]:/.avg->runnable_avg_sum
       902 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
33]:/.tg_runnable_contrib
     43264 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
33]:/.tg->runnable_avg
     42724 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
34]:/.avg->avg_period
     41389 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
34]:/.avg->runnable_avg_sum
     43264 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
34]:/.tg->runnable_avg
       901 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
34]:/.tg_runnable_contrib
       901 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
35]:/.tg_runnable_contrib
     43265 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
35]:/.tg->runnable_avg
     41378 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
35]:/.avg->runnable_avg_sum
     42739 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
35]:/.avg->avg_period
     42734 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
36]:/.avg->avg_period
     41313 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
36]:/.avg->runnable_avg_sum
     43265 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
36]:/.tg->runnable_avg
       900 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
36]:/.tg_runnable_contrib
       898 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
37]:/.tg_runnable_contrib
     43264 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
37]:/.tg->runnable_avg
     41222 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
37]:/.avg->runnable_avg_sum
     42731 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
37]:/.avg->avg_period
     43265 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
38]:/.tg->runnable_avg
       899 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
38]:/.tg_runnable_contrib
     41272 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
38]:/.avg->runnable_avg_sum
     42727 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
38]:/.avg->avg_period
     42728 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
39]:/.avg->avg_period
     41357 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
39]:/.avg->runnable_avg_sum
     43264 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
39]:/.tg->runnable_avg
       901 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
39]:/.tg_runnable_contrib
     42747 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.avg->avg_period
     41417 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.avg->runnable_avg_sum
     43260 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.tg->runnable_avg
       902 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.tg_runnable_contrib
       899 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
40]:/.tg_runnable_contrib
     43264 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
40]:/.tg->runnable_avg
     41310 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
40]:/.avg->runnable_avg_sum
     42733 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
40]:/.avg->avg_period
     41309 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
41]:/.avg->runnable_avg_sum
     43264 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
41]:/.tg->runnable_avg
       899 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
41]:/.tg_runnable_contrib
     42746 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
41]:/.avg->avg_period
       898 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
42]:/.tg_runnable_contrib
     42749 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
42]:/.avg->avg_period
     41264 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
42]:/.avg->runnable_avg_sum
     43264 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
42]:/.tg->runnable_avg
       899 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
43]:/.tg_runnable_contrib
     43264 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
43]:/.tg->runnable_avg
     41253 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
43]:/.avg->runnable_avg_sum
     42722 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
43]:/.avg->avg_period
     43265 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
44]:/.tg->runnable_avg
     42730 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
44]:/.avg->avg_period
     41392 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
44]:/.avg->runnable_avg_sum
       902 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
44]:/.tg_runnable_contrib
     42727 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
45]:/.avg->avg_period
     41289 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
45]:/.avg->runnable_avg_sum
     43265 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
45]:/.tg->runnable_avg
       899 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
45]:/.tg_runnable_contrib
       899 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
46]:/.tg_runnable_contrib
     43265 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
46]:/.tg->runnable_avg
     41302 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
46]:/.avg->runnable_avg_sum
     42732 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
46]:/.avg->avg_period
     42707 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
47]:/.avg->avg_period
     43265 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
47]:/.tg->runnable_avg
       901 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
47]:/.tg_runnable_contrib
     41330 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
47]:/.avg->runnable_avg_sum
     41409 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.avg->runnable_avg_sum
     43259 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.tg->runnable_avg
       902 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.tg_runnable_contrib
     42721 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.avg->avg_period
     41361 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.avg->runnable_avg_sum
       901 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.tg_runnable_contrib
     42715 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.avg->avg_period
     43260 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.tg->runnable_avg
     41404 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.avg->runnable_avg_sum
     43260 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.tg->runnable_avg
       900 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.tg_runnable_contrib
     42736 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.avg->avg_period
     43260 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.tg->runnable_avg
     42721 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.avg->avg_period
       900 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.tg_runnable_contrib
     41299 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.avg->runnable_avg_sum
     43260 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.tg->runnable_avg
       903 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.tg_runnable_contrib
     41425 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.avg->runnable_avg_sum
     42733 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.avg->avg_period
       901 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.tg_runnable_contrib
     43260 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.tg->runnable_avg
     41379 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.avg->runnable_avg_sum
     42744 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.avg->avg_period
         0 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#1.n=
r_running
         0 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#20.=
nr_running

testcase/path_params/tbox_group: aim7/performance-8000-disk_src/brickland3

        v4.1-rc1  2b7928c943449ab2b5f4fa4c2d  =

----------------  --------------------------  =

     65.61 =C2=B1  1%      +0.8%      66.11 =C2=B1  0%  turbostat.RAMWatt
     11114 =C2=B1  0%     -10.7%       9920 =C2=B1  0%  meminfo.Inactive(an=
on)
     12491 =C2=B1  0%      -9.4%      11313 =C2=B1  0%  meminfo.Shmem
      2778 =C2=B1  0%     -10.7%       2479 =C2=B1  0%  proc-vmstat.nr_inac=
tive_anon
      3122 =C2=B1  0%      -9.4%       2828 =C2=B1  0%  proc-vmstat.nr_shmem
      3221 =C2=B1  4%      +8.8%       3504 =C2=B1  2%  slabinfo.RAW.active=
_objs
      3221 =C2=B1  4%      +8.8%       3504 =C2=B1  2%  slabinfo.RAW.num_ob=
js
     16042 =C2=B1  8%     +12.9%      18106 =C2=B1 10%  numa-meminfo.node0.=
SReclaimable
    178032 =C2=B1 27%     -60.4%      70494 =C2=B1 13%  numa-meminfo.node1.=
Active
   1029724 =C2=B1 33%     -38.7%     630748 =C2=B1  2%  numa-meminfo.node1.=
MemUsed
    153241 =C2=B1 31%     -70.1%      45811 =C2=B1 19%  numa-meminfo.node1.=
Active(anon)
    152878 =C2=B1 31%     -70.0%      45833 =C2=B1 19%  numa-meminfo.node1.=
AnonPages
    146488 =C2=B1 43%     +51.2%     221546 =C2=B1  5%  numa-meminfo.node3.=
Active
      4007 =C2=B1  8%     +13.0%       4527 =C2=B1 10%  numa-vmstat.node0.n=
r_slab_reclaimable
     38308 =C2=B1 31%     -70.1%      11454 =C2=B1 19%  numa-vmstat.node1.n=
r_active_anon
    452294 =C2=B1 14%     -17.9%     371275 =C2=B1  1%  numa-vmstat.node1.n=
uma_hit
    399951 =C2=B1 16%     -20.2%     318974 =C2=B1  1%  numa-vmstat.node1.n=
uma_local
     38218 =C2=B1 31%     -70.0%      11460 =C2=B1 19%  numa-vmstat.node1.n=
r_anon_pages
       643 =C2=B1  1%     -34.1%        424 =C2=B1  3%  latency_stats.avg.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
   3683653 =C2=B1  7%     -32.4%    2491519 =C2=B1 33%  latency_stats.avg.a=
sync_synchronize_cookie_domain.async_synchronize_full.do_init_module.load_m=
odule.SyS_finit_module.system_call_fastpath
       201 =C2=B1 24%     +61.3%        325 =C2=B1  7%  latency_stats.avg.s=
ync_inodes_sb.sync_inodes_one_sb.iterate_supers.sys_sync.system_call_fastpa=
th
       209 =C2=B1 41%     -48.5%        107 =C2=B1 10%  latency_stats.avg.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_access.[nfsv4].nfs4_proc_access.[nfsv4].nfs_do_=
access.nfs_permission.__inode_permission.inode_permission.link_path_walk
        39 =C2=B1  4%     -10.9%         34 =C2=B1  8%  latency_stats.avg.b=
lk_execute_rq.sg_io.scsi_cmd_ioctl.scsi_cmd_blk_ioctl.sd_ioctl.[sd_mod].blk=
dev_ioctl.block_ioctl.do_vfs_ioctl.SyS_ioctl.system_call_fastpath
         2 =C2=B1 46%     +73.1%          4 =C2=B1 36%  latency_stats.hits.=
do_syslog.kmsg_read.proc_reg_read.__vfs_read.vfs_read.SyS_read.system_call_=
fastpath
         5 =C2=B1  0%     +40.0%          7 =C2=B1  0%  latency_stats.hits.=
wait_woken.inotify_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
      4823 =C2=B1  0%     -11.6%       4262 =C2=B1  0%  latency_stats.hits.=
pipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
       317 =C2=B1 39%     +99.0%        632 =C2=B1 14%  latency_stats.max.s=
ync_inodes_sb.sync_inodes_one_sb.iterate_supers.sys_sync.system_call_fastpa=
th
        75 =C2=B1  9%     -19.6%         60 =C2=B1 18%  latency_stats.max.b=
lk_execute_rq.sg_io.scsi_cmd_ioctl.scsi_cmd_blk_ioctl.sd_ioctl.[sd_mod].blk=
dev_ioctl.block_ioctl.do_vfs_ioctl.SyS_ioctl.system_call_fastpath
       415 =C2=B1 37%     -50.8%        204 =C2=B1 19%  latency_stats.max.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_access.[nfsv4].nfs4_proc_access.[nfsv4].nfs_do_=
access.nfs_permission.__inode_permission.inode_permission.link_path_walk
       157 =C2=B1  5%     -10.3%        141 =C2=B1  8%  latency_stats.sum.b=
lk_execute_rq.sg_io.scsi_cmd_ioctl.scsi_cmd_blk_ioctl.sd_ioctl.[sd_mod].blk=
dev_ioctl.block_ioctl.do_vfs_ioctl.SyS_ioctl.system_call_fastpath
       605 =C2=B1 24%     +61.3%        977 =C2=B1  7%  latency_stats.sum.s=
ync_inodes_sb.sync_inodes_one_sb.iterate_supers.sys_sync.system_call_fastpa=
th
      3768 =C2=B1 41%     -47.5%       1978 =C2=B1 11%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_access.[nfsv4].nfs4_proc_access.[nfsv4].nfs_do_=
access.nfs_permission.__inode_permission.inode_permission.link_path_walk
     11408 =C2=B1  2%     +35.8%      15488 =C2=B1  3%  latency_stats.sum.w=
ait_woken.inotify_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
   3105516 =C2=B1  2%     -41.7%    1810273 =C2=B1  3%  latency_stats.sum.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
     13258 =C2=B1  2%    +205.8%      40542 =C2=B1 10%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
       588 =C2=B1  5%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.tg_runnable_contrib
     34812 =C2=B1  1%     -36.6%      22083 =C2=B1  2%  sched_debug.cfs_rq[=
0]:/.exec_clock
     59097 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.tg->runnable_avg
     27021 =C2=B1  5%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.avg->runnable_avg_sum
   2415286 =C2=B1  1%     -38.7%    1480174 =C2=B1  1%  sched_debug.cfs_rq[=
0]:/.min_vruntime
     46851 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.avg->avg_period
   1542451 =C2=B1  8%     -35.4%     996484 =C2=B1  9%  sched_debug.cfs_rq[=
100]:/.min_vruntime
      8693 =C2=B1 14%    +178.7%      24224 =C2=B1 19%  sched_debug.cfs_rq[=
100]:/.tg_load_avg
       269 =C2=B1 38%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
100]:/.utilization_load_avg
       389 =C2=B1 23%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
100]:/.tg_runnable_contrib
     19605 =C2=B1  8%     -37.7%      12205 =C2=B1  6%  sched_debug.cfs_rq[=
100]:/.exec_clock
     17937 =C2=B1 24%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
100]:/.avg->runnable_avg_sum
     59230 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
100]:/.tg->runnable_avg
     47024 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
100]:/.avg->avg_period
      8691 =C2=B1 13%    +177.2%      24095 =C2=B1 19%  sched_debug.cfs_rq[=
101]:/.tg_load_avg
     59255 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
101]:/.tg->runnable_avg
     47136 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
101]:/.avg->avg_period
       359 =C2=B1 20%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
101]:/.tg_runnable_contrib
   1580830 =C2=B1  6%     -35.6%    1018018 =C2=B1  7%  sched_debug.cfs_rq[=
101]:/.min_vruntime
     20112 =C2=B1  7%     -38.6%      12353 =C2=B1  4%  sched_debug.cfs_rq[=
101]:/.exec_clock
     16611 =C2=B1 20%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
101]:/.avg->runnable_avg_sum
       332 =C2=B1 36%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
102]:/.tg_runnable_contrib
      8678 =C2=B1 13%    +177.2%      24056 =C2=B1 19%  sched_debug.cfs_rq[=
102]:/.tg_load_avg
     19780 =C2=B1  8%     -38.0%      12263 =C2=B1  1%  sched_debug.cfs_rq[=
102]:/.exec_clock
   1549329 =C2=B1  9%     -35.0%    1007235 =C2=B1  7%  sched_debug.cfs_rq[=
102]:/.min_vruntime
     46987 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
102]:/.avg->avg_period
     59316 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
102]:/.tg->runnable_avg
     15256 =C2=B1 36%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
102]:/.avg->runnable_avg_sum
   1580687 =C2=B1  6%     -37.5%     987963 =C2=B1  5%  sched_debug.cfs_rq[=
103]:/.min_vruntime
     47117 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
103]:/.avg->avg_period
     20085 =C2=B1  5%     -40.1%      12024 =C2=B1  5%  sched_debug.cfs_rq[=
103]:/.exec_clock
      8706 =C2=B1 12%    +175.8%      24013 =C2=B1 19%  sched_debug.cfs_rq[=
103]:/.tg_load_avg
     17991 =C2=B1  7%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
103]:/.avg->runnable_avg_sum
     59181 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
103]:/.tg->runnable_avg
       390 =C2=B1  8%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
103]:/.tg_runnable_contrib
       344 =C2=B1 35%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
104]:/.tg_runnable_contrib
   1583724 =C2=B1  6%     -33.1%    1059227 =C2=B1  5%  sched_debug.cfs_rq[=
104]:/.min_vruntime
     59136 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
104]:/.tg->runnable_avg
     15872 =C2=B1 35%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
104]:/.avg->runnable_avg_sum
     47064 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
104]:/.avg->avg_period
     20346 =C2=B1  6%     -37.4%      12739 =C2=B1  9%  sched_debug.cfs_rq[=
104]:/.exec_clock
      8905 =C2=B1  9%    +171.3%      24159 =C2=B1 19%  sched_debug.cfs_rq[=
104]:/.tg_load_avg
      8846 =C2=B1 10%    +172.5%      24105 =C2=B1 19%  sched_debug.cfs_rq[=
105]:/.tg_load_avg
     20088 =C2=B1  7%     -37.2%      12620 =C2=B1  3%  sched_debug.cfs_rq[=
105]:/.exec_clock
       328 =C2=B1 28%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
105]:/.tg_runnable_contrib
     59122 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
105]:/.tg->runnable_avg
   1566049 =C2=B1  7%     -34.0%    1034010 =C2=B1  6%  sched_debug.cfs_rq[=
105]:/.min_vruntime
     15126 =C2=B1 27%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
105]:/.avg->runnable_avg_sum
     47057 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
105]:/.avg->avg_period
     47004 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
106]:/.avg->avg_period
       264 =C2=B1 19%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
106]:/.tg_runnable_contrib
      8815 =C2=B1 11%    +173.5%      24112 =C2=B1 20%  sched_debug.cfs_rq[=
106]:/.tg_load_avg
   1532876 =C2=B1  8%     -33.3%    1022823 =C2=B1  7%  sched_debug.cfs_rq[=
106]:/.min_vruntime
     19608 =C2=B1  7%     -36.9%      12373 =C2=B1  2%  sched_debug.cfs_rq[=
106]:/.exec_clock
     59148 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
106]:/.tg->runnable_avg
     12172 =C2=B1 19%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
106]:/.avg->runnable_avg_sum
     12924 =C2=B1 18%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
107]:/.avg->runnable_avg_sum
     59085 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
107]:/.tg->runnable_avg
   1498621 =C2=B1  7%     -29.5%    1056505 =C2=B1  7%  sched_debug.cfs_rq[=
107]:/.min_vruntime
      8768 =C2=B1 10%    +174.2%      24045 =C2=B1 20%  sched_debug.cfs_rq[=
107]:/.tg_load_avg
       280 =C2=B1 18%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
107]:/.tg_runnable_contrib
     47068 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
107]:/.avg->avg_period
     19163 =C2=B1  7%     -32.8%      12886 =C2=B1  4%  sched_debug.cfs_rq[=
107]:/.exec_clock
     19304 =C2=B1  7%     -30.7%      13384 =C2=B1  0%  sched_debug.cfs_rq[=
108]:/.exec_clock
   1505266 =C2=B1  8%     -28.0%    1083168 =C2=B1  5%  sched_debug.cfs_rq[=
108]:/.min_vruntime
       317 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
108]:/.tg_runnable_contrib
     59008 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
108]:/.tg->runnable_avg
     14583 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
108]:/.avg->runnable_avg_sum
     47065 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
108]:/.avg->avg_period
      8757 =C2=B1 10%    +174.0%      23992 =C2=B1 20%  sched_debug.cfs_rq[=
108]:/.tg_load_avg
       410 =C2=B1  6%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
109]:/.tg_runnable_contrib
      8724 =C2=B1  9%    +174.0%      23901 =C2=B1 20%  sched_debug.cfs_rq[=
109]:/.tg_load_avg
     58965 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
109]:/.tg->runnable_avg
     19398 =C2=B1  7%     -31.8%      13229 =C2=B1  1%  sched_debug.cfs_rq[=
109]:/.exec_clock
   1511602 =C2=B1  8%     -30.0%    1058670 =C2=B1  4%  sched_debug.cfs_rq[=
109]:/.min_vruntime
     18886 =C2=B1  7%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
109]:/.avg->runnable_avg_sum
     46974 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
109]:/.avg->avg_period
     31332 =C2=B1  2%     -40.0%      18784 =C2=B1  3%  sched_debug.cfs_rq[=
10]:/.exec_clock
   2428190 =C2=B1  3%     -38.4%    1496192 =C2=B1  3%  sched_debug.cfs_rq[=
10]:/.min_vruntime
     46937 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.avg->avg_period
     11525 =C2=B1  6%    +216.7%      36503 =C2=B1 26%  sched_debug.cfs_rq[=
10]:/.tg_load_avg
     30576 =C2=B1  8%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.avg->runnable_avg_sum
     59778 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.tg->runnable_avg
       663 =C2=B1  9%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.tg_runnable_contrib
     17345 =C2=B1 19%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
110]:/.avg->runnable_avg_sum
     20246 =C2=B1  5%     -35.2%      13122 =C2=B1  4%  sched_debug.cfs_rq[=
110]:/.exec_clock
     58848 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
110]:/.tg->runnable_avg
       376 =C2=B1 19%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
110]:/.tg_runnable_contrib
   1584356 =C2=B1  6%     -31.9%    1078845 =C2=B1  8%  sched_debug.cfs_rq[=
110]:/.min_vruntime
      8652 =C2=B1  8%    +175.8%      23862 =C2=B1 20%  sched_debug.cfs_rq[=
110]:/.tg_load_avg
     47070 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
110]:/.avg->avg_period
   1581870 =C2=B1  7%     -32.4%    1069680 =C2=B1  7%  sched_debug.cfs_rq[=
111]:/.min_vruntime
       344 =C2=B1 12%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
111]:/.tg_runnable_contrib
     58771 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
111]:/.tg->runnable_avg
     46921 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
111]:/.avg->avg_period
      8655 =C2=B1  8%    +175.3%      23827 =C2=B1 20%  sched_debug.cfs_rq[=
111]:/.tg_load_avg
     20281 =C2=B1  7%     -36.0%      12972 =C2=B1  1%  sched_debug.cfs_rq[=
111]:/.exec_clock
     15829 =C2=B1 12%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
111]:/.avg->runnable_avg_sum
   1534553 =C2=B1  7%     -30.3%    1070008 =C2=B1  5%  sched_debug.cfs_rq[=
112]:/.min_vruntime
      8529 =C2=B1  8%    +178.3%      23739 =C2=B1 20%  sched_debug.cfs_rq[=
112]:/.tg_load_avg
       376 =C2=B1 29%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
112]:/.tg_runnable_contrib
     19523 =C2=B1  6%     -33.2%      13041 =C2=B1  5%  sched_debug.cfs_rq[=
112]:/.exec_clock
     58697 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
112]:/.tg->runnable_avg
     46975 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
112]:/.avg->avg_period
     17268 =C2=B1 28%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
112]:/.avg->runnable_avg_sum
      8463 =C2=B1  8%    +179.3%      23640 =C2=B1 20%  sched_debug.cfs_rq[=
113]:/.tg_load_avg
   1559084 =C2=B1  7%     -31.5%    1067807 =C2=B1  5%  sched_debug.cfs_rq[=
113]:/.min_vruntime
     19820 =C2=B1  7%     -34.5%      12981 =C2=B1  7%  sched_debug.cfs_rq[=
113]:/.exec_clock
       364 =C2=B1 29%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
113]:/.tg_runnable_contrib
     58597 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
113]:/.tg->runnable_avg
     47003 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
113]:/.avg->avg_period
     16722 =C2=B1 29%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
113]:/.avg->runnable_avg_sum
      8505 =C2=B1  7%    +176.0%      23474 =C2=B1 21%  sched_debug.cfs_rq[=
114]:/.tg_load_avg
     20592 =C2=B1  5%     -39.6%      12443 =C2=B1  3%  sched_debug.cfs_rq[=
114]:/.exec_clock
       363 =C2=B1 23%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
114]:/.tg_runnable_contrib
     58592 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
114]:/.tg->runnable_avg
     16702 =C2=B1 22%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
114]:/.avg->runnable_avg_sum
   1620505 =C2=B1  6%     -37.2%    1017964 =C2=B1  7%  sched_debug.cfs_rq[=
114]:/.min_vruntime
     47034 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
114]:/.avg->avg_period
   1561184 =C2=B1  7%     -34.1%    1029214 =C2=B1  6%  sched_debug.cfs_rq[=
115]:/.min_vruntime
     17977 =C2=B1 10%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
115]:/.avg->runnable_avg_sum
     58493 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
115]:/.tg->runnable_avg
     19987 =C2=B1  6%     -37.3%      12533 =C2=B1  3%  sched_debug.cfs_rq[=
115]:/.exec_clock
      8561 =C2=B1  8%    +172.8%      23355 =C2=B1 21%  sched_debug.cfs_rq[=
115]:/.tg_load_avg
       390 =C2=B1 10%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
115]:/.tg_runnable_contrib
     47048 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
115]:/.avg->avg_period
     58459 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
116]:/.tg->runnable_avg
      8527 =C2=B1  9%    +172.6%      23242 =C2=B1 22%  sched_debug.cfs_rq[=
116]:/.tg_load_avg
         3 =C2=B1 45%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
116]:/.runnable_load_avg
       186 =C2=B1 41%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
116]:/.utilization_load_avg
       338 =C2=B1 22%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
116]:/.tg_runnable_contrib
         6 =C2=B1 21%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
116]:/.load
     19687 =C2=B1  5%     -36.5%      12494 =C2=B1  2%  sched_debug.cfs_rq[=
116]:/.exec_clock
     15579 =C2=B1 22%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
116]:/.avg->runnable_avg_sum
   1552138 =C2=B1  5%     -34.2%    1021314 =C2=B1  4%  sched_debug.cfs_rq[=
116]:/.min_vruntime
     46943 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
116]:/.avg->avg_period
   1529473 =C2=B1  7%     -31.8%    1042509 =C2=B1  6%  sched_debug.cfs_rq[=
117]:/.min_vruntime
       375 =C2=B1 23%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
117]:/.tg_runnable_contrib
      8376 =C2=B1  8%    +177.2%      23218 =C2=B1 22%  sched_debug.cfs_rq[=
117]:/.tg_load_avg
     58501 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
117]:/.tg->runnable_avg
     19566 =C2=B1  6%     -35.2%      12671 =C2=B1  2%  sched_debug.cfs_rq[=
117]:/.exec_clock
     46908 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
117]:/.avg->avg_period
     17223 =C2=B1 23%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
117]:/.avg->runnable_avg_sum
     47065 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
118]:/.avg->avg_period
     17694 =C2=B1 25%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
118]:/.avg->runnable_avg_sum
       384 =C2=B1 25%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
118]:/.tg_runnable_contrib
   1562075 =C2=B1  6%     -31.7%    1067009 =C2=B1  8%  sched_debug.cfs_rq[=
118]:/.min_vruntime
       212 =C2=B1 45%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
118]:/.utilization_load_avg
         5 =C2=B1 40%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
118]:/.load
     58616 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
118]:/.tg->runnable_avg
         4 =C2=B1 50%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
118]:/.runnable_load_avg
     20005 =C2=B1  5%     -34.8%      13039 =C2=B1  1%  sched_debug.cfs_rq[=
118]:/.exec_clock
      8352 =C2=B1 10%    +175.3%      22993 =C2=B1 20%  sched_debug.cfs_rq[=
118]:/.tg_load_avg
   1565602 =C2=B1  5%     -33.0%    1049519 =C2=B1  6%  sched_debug.cfs_rq[=
119]:/.min_vruntime
     13363 =C2=B1 21%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
119]:/.avg->runnable_avg_sum
     47090 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
119]:/.avg->avg_period
     58618 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
119]:/.tg->runnable_avg
       290 =C2=B1 21%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
119]:/.tg_runnable_contrib
     19915 =C2=B1  5%     -35.6%      12835 =C2=B1  5%  sched_debug.cfs_rq[=
119]:/.exec_clock
      8381 =C2=B1 10%    +176.7%      23189 =C2=B1 21%  sched_debug.cfs_rq[=
119]:/.tg_load_avg
     59782 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.tg->runnable_avg
     31073 =C2=B1  3%     -37.7%      19369 =C2=B1  3%  sched_debug.cfs_rq[=
11]:/.exec_clock
     29020 =C2=B1 13%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.avg->runnable_avg_sum
     46972 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.avg->avg_period
   2419715 =C2=B1  3%     -37.7%    1507117 =C2=B1  3%  sched_debug.cfs_rq[=
11]:/.min_vruntime
         6 =C2=B1 26%     -52.2%          3 =C2=B1 25%  sched_debug.cfs_rq[=
11]:/.runnable_load_avg
     11395 =C2=B1  7%    +218.4%      36283 =C2=B1 26%  sched_debug.cfs_rq[=
11]:/.tg_load_avg
       630 =C2=B1 13%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.tg_runnable_contrib
       587 =C2=B1  5%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.tg_runnable_contrib
     59740 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.tg->runnable_avg
     11411 =C2=B1  8%    +217.3%      36208 =C2=B1 26%  sched_debug.cfs_rq[=
12]:/.tg_load_avg
     26988 =C2=B1  5%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.avg->runnable_avg_sum
     46894 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.avg->avg_period
     31509 =C2=B1  3%     -38.8%      19294 =C2=B1  1%  sched_debug.cfs_rq[=
12]:/.exec_clock
   2436168 =C2=B1  3%     -38.0%    1509780 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.min_vruntime
     46846 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.avg->avg_period
     25988 =C2=B1  9%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.avg->runnable_avg_sum
     59764 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.tg->runnable_avg
       567 =C2=B1  9%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.tg_runnable_contrib
     30537 =C2=B1  4%     -38.4%      18813 =C2=B1  1%  sched_debug.cfs_rq[=
13]:/.exec_clock
   2370715 =C2=B1  4%     -37.8%    1475458 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.min_vruntime
     11330 =C2=B1  9%    +218.3%      36068 =C2=B1 26%  sched_debug.cfs_rq[=
13]:/.tg_load_avg
     46884 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.avg->avg_period
       604 =C2=B1  6%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.tg_runnable_contrib
   2410660 =C2=B1  2%     -37.0%    1518478 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.min_vruntime
     59802 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.tg->runnable_avg
     11300 =C2=B1  9%    +217.9%      35928 =C2=B1 25%  sched_debug.cfs_rq[=
14]:/.tg_load_avg
     30940 =C2=B1  2%     -37.2%      19427 =C2=B1  2%  sched_debug.cfs_rq[=
14]:/.exec_clock
     27882 =C2=B1  6%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.avg->runnable_avg_sum
     29518 =C2=B1  9%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.avg->runnable_avg_sum
     10948 =C2=B1  8%    +220.5%      35084 =C2=B1 24%  sched_debug.cfs_rq[=
15]:/.tg_load_avg
     46881 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.avg->avg_period
       641 =C2=B1  9%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.tg_runnable_contrib
     31647 =C2=B1  1%     -39.8%      19047 =C2=B1  2%  sched_debug.cfs_rq[=
15]:/.exec_clock
     59890 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.tg->runnable_avg
   2458054 =C2=B1  1%     -37.9%    1526270 =C2=B1  6%  sched_debug.cfs_rq[=
15]:/.min_vruntime
       654 =C2=B1  9%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
16]:/.tg_runnable_contrib
     59895 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
16]:/.tg->runnable_avg
   2474741 =C2=B1  1%     -37.4%    1548355 =C2=B1  6%  sched_debug.cfs_rq[=
16]:/.min_vruntime
     30203 =C2=B1  9%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
16]:/.avg->runnable_avg_sum
     32387 =C2=B1  3%     -40.8%      19176 =C2=B1  3%  sched_debug.cfs_rq[=
16]:/.exec_clock
     10864 =C2=B1  8%    +217.3%      34467 =C2=B1 23%  sched_debug.cfs_rq[=
16]:/.tg_load_avg
     46935 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
16]:/.avg->avg_period
     31895 =C2=B1  2%     -39.9%      19156 =C2=B1  2%  sched_debug.cfs_rq[=
17]:/.exec_clock
       604 =C2=B1  8%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
17]:/.tg_runnable_contrib
   2501757 =C2=B1  2%     -39.1%    1523861 =C2=B1  5%  sched_debug.cfs_rq[=
17]:/.min_vruntime
     10837 =C2=B1  8%    +208.3%      33415 =C2=B1 22%  sched_debug.cfs_rq[=
17]:/.tg_load_avg
     27820 =C2=B1  8%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
17]:/.avg->runnable_avg_sum
     46927 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
17]:/.avg->avg_period
     59977 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
17]:/.tg->runnable_avg
     46922 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
18]:/.avg->avg_period
     28528 =C2=B1  7%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
18]:/.avg->runnable_avg_sum
   2446700 =C2=B1  1%     -38.9%    1494178 =C2=B1  6%  sched_debug.cfs_rq[=
18]:/.min_vruntime
     10746 =C2=B1  7%    +210.7%      33383 =C2=B1 23%  sched_debug.cfs_rq[=
18]:/.tg_load_avg
     60000 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
18]:/.tg->runnable_avg
     31369 =C2=B1  1%     -38.9%      19163 =C2=B1  5%  sched_debug.cfs_rq[=
18]:/.exec_clock
       619 =C2=B1  8%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
18]:/.tg_runnable_contrib
     31730 =C2=B1  1%     -34.6%      20760 =C2=B1 10%  sched_debug.cfs_rq[=
19]:/.exec_clock
     59996 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
19]:/.tg->runnable_avg
     46995 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
19]:/.avg->avg_period
     29215 =C2=B1 12%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
19]:/.avg->runnable_avg_sum
   2472280 =C2=B1  1%     -37.5%    1545950 =C2=B1  5%  sched_debug.cfs_rq[=
19]:/.min_vruntime
     10543 =C2=B1  7%    +216.7%      33395 =C2=B1 23%  sched_debug.cfs_rq[=
19]:/.tg_load_avg
       633 =C2=B1 12%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
19]:/.tg_runnable_contrib
     30711 =C2=B1  2%     -37.0%      19342 =C2=B1  2%  sched_debug.cfs_rq[=
1]:/.exec_clock
     59270 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.tg->runnable_avg
     29402 =C2=B1 11%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.avg->runnable_avg_sum
     46862 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.avg->avg_period
     13378 =C2=B1  3%    +201.7%      40363 =C2=B1 10%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
   2394097 =C2=B1  2%     -37.5%    1496717 =C2=B1  2%  sched_debug.cfs_rq[=
1]:/.min_vruntime
       640 =C2=B1 11%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.tg_runnable_contrib
     31807 =C2=B1  1%     -36.1%      20324 =C2=B1  5%  sched_debug.cfs_rq[=
20]:/.exec_clock
   2476914 =C2=B1  2%     -37.4%    1549539 =C2=B1  4%  sched_debug.cfs_rq[=
20]:/.min_vruntime
     46882 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
20]:/.avg->avg_period
     10473 =C2=B1  7%    +218.6%      33364 =C2=B1 23%  sched_debug.cfs_rq[=
20]:/.tg_load_avg
     30051 =C2=B1  6%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
20]:/.avg->runnable_avg_sum
     60028 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
20]:/.tg->runnable_avg
       653 =C2=B1  6%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
20]:/.tg_runnable_contrib
     27728 =C2=B1 10%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
21]:/.avg->runnable_avg_sum
     60054 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
21]:/.tg->runnable_avg
   2454888 =C2=B1  1%     -38.7%    1503990 =C2=B1  6%  sched_debug.cfs_rq[=
21]:/.min_vruntime
       603 =C2=B1 10%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
21]:/.tg_runnable_contrib
     32998 =C2=B1  7%     -39.0%      20133 =C2=B1 10%  sched_debug.cfs_rq[=
21]:/.exec_clock
     46806 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
21]:/.avg->avg_period
     10331 =C2=B1  7%    +221.7%      33236 =C2=B1 23%  sched_debug.cfs_rq[=
21]:/.tg_load_avg
     27333 =C2=B1 16%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
22]:/.avg->runnable_avg_sum
     10316 =C2=B1  6%    +221.8%      33201 =C2=B1 23%  sched_debug.cfs_rq[=
22]:/.tg_load_avg
     60048 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
22]:/.tg->runnable_avg
       594 =C2=B1 16%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
22]:/.tg_runnable_contrib
     46946 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
22]:/.avg->avg_period
   2429901 =C2=B1  1%     -37.7%    1514960 =C2=B1  6%  sched_debug.cfs_rq[=
22]:/.min_vruntime
     31236 =C2=B1  1%     -37.9%      19397 =C2=B1  5%  sched_debug.cfs_rq[=
22]:/.exec_clock
     60108 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
23]:/.tg->runnable_avg
     31397 =C2=B1  1%     -39.0%      19141 =C2=B1  3%  sched_debug.cfs_rq[=
23]:/.exec_clock
     10183 =C2=B1  7%    +224.7%      33069 =C2=B1 22%  sched_debug.cfs_rq[=
23]:/.tg_load_avg
       563 =C2=B1  5%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
23]:/.tg_runnable_contrib
   2447376 =C2=B1  1%     -37.8%    1521938 =C2=B1  6%  sched_debug.cfs_rq[=
23]:/.min_vruntime
     25926 =C2=B1  5%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
23]:/.avg->runnable_avg_sum
     46929 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
23]:/.avg->avg_period
     46934 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
24]:/.avg->avg_period
     32161 =C2=B1  4%     -41.5%      18805 =C2=B1  2%  sched_debug.cfs_rq[=
24]:/.exec_clock
     26890 =C2=B1 13%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
24]:/.avg->runnable_avg_sum
     60038 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
24]:/.tg->runnable_avg
       585 =C2=B1 12%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
24]:/.tg_runnable_contrib
   2433914 =C2=B1  1%     -37.8%    1514772 =C2=B1  5%  sched_debug.cfs_rq[=
24]:/.min_vruntime
     10095 =C2=B1  8%    +226.6%      32970 =C2=B1 22%  sched_debug.cfs_rq[=
24]:/.tg_load_avg
     32224 =C2=B1  5%     -42.2%      18622 =C2=B1  2%  sched_debug.cfs_rq[=
25]:/.exec_clock
     59894 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
25]:/.tg->runnable_avg
      9993 =C2=B1  8%    +228.9%      32868 =C2=B1 22%  sched_debug.cfs_rq[=
25]:/.tg_load_avg
     29701 =C2=B1  7%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
25]:/.avg->runnable_avg_sum
       646 =C2=B1  7%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
25]:/.tg_runnable_contrib
         9 =C2=B1 22%     -37.5%          5 =C2=B1 14%  sched_debug.cfs_rq[=
25]:/.load
   2501846 =C2=B1  4%     -39.9%    1502501 =C2=B1  5%  sched_debug.cfs_rq[=
25]:/.min_vruntime
     46900 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
25]:/.avg->avg_period
      9981 =C2=B1  7%    +196.8%      29626 =C2=B1 11%  sched_debug.cfs_rq[=
26]:/.tg_load_avg
         9 =C2=B1 14%     -40.1%          5 =C2=B1 14%  sched_debug.cfs_rq[=
26]:/.load
     33130 =C2=B1  7%     -42.8%      18942 =C2=B1  1%  sched_debug.cfs_rq[=
26]:/.exec_clock
   2455833 =C2=B1  1%     -37.6%    1532646 =C2=B1  5%  sched_debug.cfs_rq[=
26]:/.min_vruntime
     46825 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
26]:/.avg->avg_period
     28989 =C2=B1  7%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
26]:/.avg->runnable_avg_sum
     59935 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
26]:/.tg->runnable_avg
       631 =C2=B1  7%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
26]:/.tg_runnable_contrib
     59854 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
27]:/.tg->runnable_avg
     31684 =C2=B1  5%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
27]:/.avg->runnable_avg_sum
     47000 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
27]:/.avg->avg_period
   2458550 =C2=B1  1%     -39.0%    1498602 =C2=B1  7%  sched_debug.cfs_rq[=
27]:/.min_vruntime
       686 =C2=B1  5%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
27]:/.tg_runnable_contrib
      9908 =C2=B1  9%    +198.3%      29554 =C2=B1 11%  sched_debug.cfs_rq[=
27]:/.tg_load_avg
     31570 =C2=B1  1%     -39.4%      19142 =C2=B1  2%  sched_debug.cfs_rq[=
27]:/.exec_clock
      9900 =C2=B1  9%    +201.9%      29891 =C2=B1  8%  sched_debug.cfs_rq[=
28]:/.tg_load_avg
   2448213 =C2=B1  1%     -38.7%    1500180 =C2=B1  7%  sched_debug.cfs_rq[=
28]:/.min_vruntime
       635 =C2=B1 12%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
28]:/.tg_runnable_contrib
     59807 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
28]:/.tg->runnable_avg
     29301 =C2=B1 12%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
28]:/.avg->runnable_avg_sum
     47012 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
28]:/.avg->avg_period
     31535 =C2=B1  1%     -37.1%      19843 =C2=B1 11%  sched_debug.cfs_rq[=
28]:/.exec_clock
     31998 =C2=B1  1%     -42.1%      18528 =C2=B1  1%  sched_debug.cfs_rq[=
29]:/.exec_clock
       601 =C2=B1 20%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
29]:/.tg_runnable_contrib
   2473982 =C2=B1  1%     -39.5%    1496503 =C2=B1  6%  sched_debug.cfs_rq[=
29]:/.min_vruntime
      9998 =C2=B1 10%    +202.1%      30203 =C2=B1  9%  sched_debug.cfs_rq[=
29]:/.tg_load_avg
     59788 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
29]:/.tg->runnable_avg
     27734 =C2=B1 19%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
29]:/.avg->runnable_avg_sum
     47010 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
29]:/.avg->avg_period
   2472101 =C2=B1  5%     -39.2%    1502821 =C2=B1  3%  sched_debug.cfs_rq[=
2]:/.min_vruntime
     46923 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.avg->avg_period
     27680 =C2=B1  9%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.avg->runnable_avg_sum
     59437 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.tg->runnable_avg
     31415 =C2=B1  3%     -39.8%      18911 =C2=B1  3%  sched_debug.cfs_rq[=
2]:/.exec_clock
     13329 =C2=B1  3%    +201.8%      40228 =C2=B1 10%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
       603 =C2=B1  9%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.tg_runnable_contrib
     31348 =C2=B1  1%     -39.0%      19127 =C2=B1  3%  sched_debug.cfs_rq[=
30]:/.exec_clock
     47043 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
30]:/.avg->avg_period
     28678 =C2=B1  8%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
30]:/.avg->runnable_avg_sum
     59821 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
30]:/.tg->runnable_avg
   2432723 =C2=B1  2%     -37.3%    1524948 =C2=B1  5%  sched_debug.cfs_rq[=
30]:/.min_vruntime
     10033 =C2=B1 10%    +203.0%      30397 =C2=B1 10%  sched_debug.cfs_rq[=
30]:/.tg_load_avg
       622 =C2=B1  8%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
30]:/.tg_runnable_contrib
     46831 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
31]:/.avg->avg_period
     29399 =C2=B1  7%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
31]:/.avg->runnable_avg_sum
     10013 =C2=B1 11%    +209.4%      30986 =C2=B1  9%  sched_debug.cfs_rq[=
31]:/.tg_load_avg
   2447264 =C2=B1  1%     -36.9%    1544682 =C2=B1  4%  sched_debug.cfs_rq[=
31]:/.min_vruntime
     59606 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
31]:/.tg->runnable_avg
     31538 =C2=B1  0%     -39.2%      19169 =C2=B1  1%  sched_debug.cfs_rq[=
31]:/.exec_clock
       639 =C2=B1  7%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
31]:/.tg_runnable_contrib
       643 =C2=B1 10%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
32]:/.tg_runnable_contrib
     46855 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
32]:/.avg->avg_period
      9953 =C2=B1 11%    +214.8%      31332 =C2=B1 10%  sched_debug.cfs_rq[=
32]:/.tg_load_avg
     31234 =C2=B1  1%     -39.9%      18783 =C2=B1  3%  sched_debug.cfs_rq[=
32]:/.exec_clock
     29555 =C2=B1 10%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
32]:/.avg->runnable_avg_sum
     59610 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
32]:/.tg->runnable_avg
   2422575 =C2=B1  2%     -37.2%    1522035 =C2=B1  5%  sched_debug.cfs_rq[=
32]:/.min_vruntime
     10003 =C2=B1 11%    +207.6%      30771 =C2=B1 12%  sched_debug.cfs_rq[=
33]:/.tg_load_avg
     46879 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
33]:/.avg->avg_period
   2421999 =C2=B1  1%     -37.3%    1517983 =C2=B1  7%  sched_debug.cfs_rq[=
33]:/.min_vruntime
     28854 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
33]:/.avg->runnable_avg_sum
     31232 =C2=B1  0%     -40.3%      18658 =C2=B1  2%  sched_debug.cfs_rq[=
33]:/.exec_clock
       627 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
33]:/.tg_runnable_contrib
     59519 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
33]:/.tg->runnable_avg
   2447232 =C2=B1  3%     -36.5%    1553793 =C2=B1  5%  sched_debug.cfs_rq[=
34]:/.min_vruntime
      9979 =C2=B1 11%    +210.0%      30941 =C2=B1 12%  sched_debug.cfs_rq[=
34]:/.tg_load_avg
     46896 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
34]:/.avg->avg_period
         7 =C2=B1 14%     -45.5%          4 =C2=B1 34%  sched_debug.cfs_rq[=
34]:/.runnable_load_avg
     28964 =C2=B1 13%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
34]:/.avg->runnable_avg_sum
     31375 =C2=B1  2%     -39.0%      19141 =C2=B1  3%  sched_debug.cfs_rq[=
34]:/.exec_clock
     59496 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
34]:/.tg->runnable_avg
       631 =C2=B1 13%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
34]:/.tg_runnable_contrib
     10063 =C2=B1 12%    +209.6%      31155 =C2=B1 13%  sched_debug.cfs_rq[=
35]:/.tg_load_avg
         8 =C2=B1 21%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
35]:/.runnable_load_avg
       672 =C2=B1  9%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
35]:/.tg_runnable_contrib
     59417 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
35]:/.tg->runnable_avg
     30902 =C2=B1 10%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
35]:/.avg->runnable_avg_sum
     46953 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
35]:/.avg->avg_period
   2420139 =C2=B1  2%     -36.9%    1526950 =C2=B1  4%  sched_debug.cfs_rq[=
35]:/.min_vruntime
        10 =C2=B1 13%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
35]:/.load
       471 =C2=B1 24%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
35]:/.utilization_load_avg
     31095 =C2=B1  2%     -39.3%      18874 =C2=B1  5%  sched_debug.cfs_rq[=
35]:/.exec_clock
     46897 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
36]:/.avg->avg_period
     31519 =C2=B1  1%     -39.6%      19050 =C2=B1  2%  sched_debug.cfs_rq[=
36]:/.exec_clock
     27576 =C2=B1 14%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
36]:/.avg->runnable_avg_sum
     10079 =C2=B1 12%    +208.3%      31073 =C2=B1 13%  sched_debug.cfs_rq[=
36]:/.tg_load_avg
   2448183 =C2=B1  1%     -36.6%    1550935 =C2=B1  4%  sched_debug.cfs_rq[=
36]:/.min_vruntime
     59389 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
36]:/.tg->runnable_avg
       599 =C2=B1 14%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
36]:/.tg_runnable_contrib
     10021 =C2=B1 11%    +207.5%      30815 =C2=B1 13%  sched_debug.cfs_rq[=
37]:/.tg_load_avg
       626 =C2=B1  6%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
37]:/.tg_runnable_contrib
   2402396 =C2=B1  3%     -36.0%    1538300 =C2=B1  5%  sched_debug.cfs_rq[=
37]:/.min_vruntime
     59424 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
37]:/.tg->runnable_avg
     28843 =C2=B1  6%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
37]:/.avg->runnable_avg_sum
     46967 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
37]:/.avg->avg_period
     30976 =C2=B1  3%     -38.4%      19071 =C2=B1  2%  sched_debug.cfs_rq[=
37]:/.exec_clock
     59338 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
38]:/.tg->runnable_avg
     31022 =C2=B1  2%     -38.1%      19194 =C2=B1  3%  sched_debug.cfs_rq[=
38]:/.exec_clock
       617 =C2=B1  7%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
38]:/.tg_runnable_contrib
     28358 =C2=B1  7%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
38]:/.avg->runnable_avg_sum
     46841 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
38]:/.avg->avg_period
   2416176 =C2=B1  3%     -35.2%    1566392 =C2=B1  5%  sched_debug.cfs_rq[=
38]:/.min_vruntime
     10042 =C2=B1 11%    +205.4%      30669 =C2=B1 13%  sched_debug.cfs_rq[=
38]:/.tg_load_avg
   2409569 =C2=B1  1%     -35.2%    1562601 =C2=B1  4%  sched_debug.cfs_rq[=
39]:/.min_vruntime
     46950 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
39]:/.avg->avg_period
     27648 =C2=B1  8%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
39]:/.avg->runnable_avg_sum
     59247 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
39]:/.tg->runnable_avg
     30807 =C2=B1  1%     -38.3%      18997 =C2=B1  1%  sched_debug.cfs_rq[=
39]:/.exec_clock
     10093 =C2=B1 11%    +201.6%      30444 =C2=B1 13%  sched_debug.cfs_rq[=
39]:/.tg_load_avg
       600 =C2=B1  8%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
39]:/.tg_runnable_contrib
     46733 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.avg->avg_period
     30729 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.avg->runnable_avg_sum
     59579 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.tg->runnable_avg
   2416557 =C2=B1  3%     -37.4%    1512282 =C2=B1  2%  sched_debug.cfs_rq[=
3]:/.min_vruntime
     31030 =C2=B1  3%     -38.2%      19164 =C2=B1  3%  sched_debug.cfs_rq[=
3]:/.exec_clock
       669 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.tg_runnable_contrib
     12877 =C2=B1  4%    +208.0%      39664 =C2=B1 15%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
     10158 =C2=B1 12%    +198.6%      30331 =C2=B1 13%  sched_debug.cfs_rq[=
40]:/.tg_load_avg
     31203 =C2=B1  2%     -35.8%      20018 =C2=B1  7%  sched_debug.cfs_rq[=
40]:/.exec_clock
       578 =C2=B1  8%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
40]:/.tg_runnable_contrib
     59199 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
40]:/.tg->runnable_avg
     26666 =C2=B1  8%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
40]:/.avg->runnable_avg_sum
   2427958 =C2=B1  2%     -36.7%    1536731 =C2=B1  4%  sched_debug.cfs_rq[=
40]:/.min_vruntime
     47063 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
40]:/.avg->avg_period
     26691 =C2=B1 10%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
41]:/.avg->runnable_avg_sum
     59096 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
41]:/.tg->runnable_avg
       581 =C2=B1 10%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
41]:/.tg_runnable_contrib
     30981 =C2=B1  3%     -38.4%      19094 =C2=B1  2%  sched_debug.cfs_rq[=
41]:/.exec_clock
     46788 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
41]:/.avg->avg_period
     10116 =C2=B1 12%    +198.3%      30176 =C2=B1 13%  sched_debug.cfs_rq[=
41]:/.tg_load_avg
   2408326 =C2=B1  3%     -36.4%    1532374 =C2=B1  6%  sched_debug.cfs_rq[=
41]:/.min_vruntime
       629 =C2=B1  6%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
42]:/.tg_runnable_contrib
     46836 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
42]:/.avg->avg_period
     28905 =C2=B1  5%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
42]:/.avg->runnable_avg_sum
     59117 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
42]:/.tg->runnable_avg
     31467 =C2=B1  1%     -39.4%      19063 =C2=B1  3%  sched_debug.cfs_rq[=
42]:/.exec_clock
     10081 =C2=B1 11%    +196.8%      29923 =C2=B1 14%  sched_debug.cfs_rq[=
42]:/.tg_load_avg
   2444025 =C2=B1  2%     -36.6%    1550310 =C2=B1  6%  sched_debug.cfs_rq[=
42]:/.min_vruntime
      9925 =C2=B1 11%    +193.4%      29123 =C2=B1 18%  sched_debug.cfs_rq[=
43]:/.tg_load_avg
     31483 =C2=B1  2%     -39.3%      19095 =C2=B1  2%  sched_debug.cfs_rq[=
43]:/.exec_clock
   2445210 =C2=B1  2%     -37.2%    1535529 =C2=B1  4%  sched_debug.cfs_rq[=
43]:/.min_vruntime
       635 =C2=B1 12%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
43]:/.tg_runnable_contrib
     59047 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
43]:/.tg->runnable_avg
     29169 =C2=B1 12%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
43]:/.avg->runnable_avg_sum
     46864 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
43]:/.avg->avg_period
     59052 =C2=B1  4%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
44]:/.tg->runnable_avg
     46915 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
44]:/.avg->avg_period
   2430777 =C2=B1  2%     -37.7%    1513395 =C2=B1  5%  sched_debug.cfs_rq[=
44]:/.min_vruntime
      9908 =C2=B1 10%    +192.8%      29013 =C2=B1 18%  sched_debug.cfs_rq[=
44]:/.tg_load_avg
     29703 =C2=B1 13%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
44]:/.avg->runnable_avg_sum
       644 =C2=B1 13%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
44]:/.tg_runnable_contrib
     31213 =C2=B1  1%     -39.8%      18780 =C2=B1  1%  sched_debug.cfs_rq[=
44]:/.exec_clock
         8 =C2=B1 13%     -27.3%          6 =C2=B1  6%  sched_debug.cfs_rq[=
45]:/.load
      9871 =C2=B1 11%    +195.5%      29169 =C2=B1 16%  sched_debug.cfs_rq[=
45]:/.tg_load_avg
     46861 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
45]:/.avg->avg_period
     28504 =C2=B1  9%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
45]:/.avg->runnable_avg_sum
     59023 =C2=B1  4%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
45]:/.tg->runnable_avg
       620 =C2=B1  9%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
45]:/.tg_runnable_contrib
     31023 =C2=B1  2%     -36.2%      19778 =C2=B1  1%  sched_debug.cfs_rq[=
45]:/.exec_clock
   2410726 =C2=B1  2%     -34.7%    1573004 =C2=B1  4%  sched_debug.cfs_rq[=
45]:/.min_vruntime
     31288 =C2=B1  1%     -37.1%      19695 =C2=B1  0%  sched_debug.cfs_rq[=
46]:/.exec_clock
      9824 =C2=B1 11%    +196.4%      29120 =C2=B1 16%  sched_debug.cfs_rq[=
46]:/.tg_load_avg
         9 =C2=B1  9%     -30.6%          6 =C2=B1  6%  sched_debug.cfs_rq[=
46]:/.load
       565 =C2=B1  9%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
46]:/.tg_runnable_contrib
     58986 =C2=B1  4%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
46]:/.tg->runnable_avg
   2432795 =C2=B1  2%     -35.2%    1575790 =C2=B1  4%  sched_debug.cfs_rq[=
46]:/.min_vruntime
     25986 =C2=B1  9%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
46]:/.avg->runnable_avg_sum
     46832 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
46]:/.avg->avg_period
      9754 =C2=B1 10%    +196.5%      28926 =C2=B1 16%  sched_debug.cfs_rq[=
47]:/.tg_load_avg
     31493 =C2=B1  1%     -39.1%      19172 =C2=B1  1%  sched_debug.cfs_rq[=
47]:/.exec_clock
     46913 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
47]:/.avg->avg_period
     58969 =C2=B1  4%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
47]:/.tg->runnable_avg
   2453059 =C2=B1  2%     -37.3%    1537164 =C2=B1  4%  sched_debug.cfs_rq[=
47]:/.min_vruntime
       627 =C2=B1 12%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
47]:/.tg_runnable_contrib
     28880 =C2=B1 12%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
47]:/.avg->runnable_avg_sum
       591 =C2=B1  7%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
48]:/.tg_runnable_contrib
     46917 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
48]:/.avg->avg_period
      9717 =C2=B1 11%    +196.9%      28849 =C2=B1 16%  sched_debug.cfs_rq[=
48]:/.tg_load_avg
     31554 =C2=B1  1%     -39.8%      19008 =C2=B1  2%  sched_debug.cfs_rq[=
48]:/.exec_clock
     27160 =C2=B1  7%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
48]:/.avg->runnable_avg_sum
     58980 =C2=B1  4%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
48]:/.tg->runnable_avg
   2461675 =C2=B1  1%     -38.1%    1523153 =C2=B1  4%  sched_debug.cfs_rq[=
48]:/.min_vruntime
   2432787 =C2=B1  1%     -36.4%    1548150 =C2=B1  5%  sched_debug.cfs_rq[=
49]:/.min_vruntime
     29111 =C2=B1 10%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
49]:/.avg->runnable_avg_sum
     58913 =C2=B1  5%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
49]:/.tg->runnable_avg
     31275 =C2=B1  1%     -39.0%      19076 =C2=B1  2%  sched_debug.cfs_rq[=
49]:/.exec_clock
      9711 =C2=B1 11%    +196.4%      28787 =C2=B1 16%  sched_debug.cfs_rq[=
49]:/.tg_load_avg
     46905 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
49]:/.avg->avg_period
       632 =C2=B1 10%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
49]:/.tg_runnable_contrib
     25724 =C2=B1 14%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.avg->runnable_avg_sum
     30894 =C2=B1  3%     -39.6%      18649 =C2=B1  3%  sched_debug.cfs_rq[=
4]:/.exec_clock
     59614 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.tg->runnable_avg
       559 =C2=B1 14%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.tg_runnable_contrib
     46962 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.avg->avg_period
   2387280 =C2=B1  3%     -37.9%    1481936 =C2=B1  4%  sched_debug.cfs_rq[=
4]:/.min_vruntime
     12177 =C2=B1  2%    +225.2%      39604 =C2=B1 15%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
     47020 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
50]:/.avg->avg_period
   2488637 =C2=B1  3%     -38.5%    1531110 =C2=B1  1%  sched_debug.cfs_rq[=
50]:/.min_vruntime
     31404 =C2=B1  1%     -38.7%      19259 =C2=B1  2%  sched_debug.cfs_rq[=
50]:/.exec_clock
       569 =C2=B1  8%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
50]:/.tg_runnable_contrib
     59009 =C2=B1  4%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
50]:/.tg->runnable_avg
      9641 =C2=B1 10%    +198.1%      28736 =C2=B1 16%  sched_debug.cfs_rq[=
50]:/.tg_load_avg
     26302 =C2=B1  8%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
50]:/.avg->runnable_avg_sum
     46803 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
51]:/.avg->avg_period
     31436 =C2=B1  0%     -39.6%      18976 =C2=B1  1%  sched_debug.cfs_rq[=
51]:/.exec_clock
     28071 =C2=B1  6%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
51]:/.avg->runnable_avg_sum
      9754 =C2=B1 11%    +194.6%      28734 =C2=B1 16%  sched_debug.cfs_rq[=
51]:/.tg_load_avg
       612 =C2=B1  6%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
51]:/.tg_runnable_contrib
     58949 =C2=B1  5%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
51]:/.tg->runnable_avg
   2435898 =C2=B1  2%     -37.0%    1535618 =C2=B1  5%  sched_debug.cfs_rq[=
51]:/.min_vruntime
     46966 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
52]:/.avg->avg_period
     27358 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
52]:/.avg->runnable_avg_sum
   2439453 =C2=B1  1%     -36.1%    1558665 =C2=B1  5%  sched_debug.cfs_rq[=
52]:/.min_vruntime
      9719 =C2=B1 11%    +195.1%      28684 =C2=B1 16%  sched_debug.cfs_rq[=
52]:/.tg_load_avg
     31448 =C2=B1  1%     -39.0%      19183 =C2=B1  2%  sched_debug.cfs_rq[=
52]:/.exec_clock
     58819 =C2=B1  5%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
52]:/.tg->runnable_avg
       594 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
52]:/.tg_runnable_contrib
     31160 =C2=B1  1%     -37.8%      19385 =C2=B1  3%  sched_debug.cfs_rq[=
53]:/.exec_clock
       640 =C2=B1  8%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
53]:/.tg_runnable_contrib
   2418166 =C2=B1  2%     -35.9%    1550232 =C2=B1  6%  sched_debug.cfs_rq[=
53]:/.min_vruntime
     58791 =C2=B1  5%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
53]:/.tg->runnable_avg
     46812 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
53]:/.avg->avg_period
     29357 =C2=B1  8%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
53]:/.avg->runnable_avg_sum
      9724 =C2=B1 13%    +194.3%      28618 =C2=B1 16%  sched_debug.cfs_rq[=
53]:/.tg_load_avg
     58588 =C2=B1  4%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
54]:/.tg->runnable_avg
     46826 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
54]:/.avg->avg_period
     27148 =C2=B1  8%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
54]:/.avg->runnable_avg_sum
   2410558 =C2=B1  3%     -35.0%    1567564 =C2=B1  4%  sched_debug.cfs_rq[=
54]:/.min_vruntime
      9654 =C2=B1 13%    +195.9%      28567 =C2=B1 16%  sched_debug.cfs_rq[=
54]:/.tg_load_avg
       590 =C2=B1  8%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
54]:/.tg_runnable_contrib
     30991 =C2=B1  2%     -36.4%      19725 =C2=B1  1%  sched_debug.cfs_rq[=
54]:/.exec_clock
       559 =C2=B1 19%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
55]:/.tg_runnable_contrib
      9563 =C2=B1 13%    +198.2%      28517 =C2=B1 16%  sched_debug.cfs_rq[=
55]:/.tg_load_avg
     58491 =C2=B1  4%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
55]:/.tg->runnable_avg
     46997 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
55]:/.avg->avg_period
     25771 =C2=B1 19%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
55]:/.avg->runnable_avg_sum
   2431386 =C2=B1  2%     -34.5%    1592093 =C2=B1  9%  sched_debug.cfs_rq[=
55]:/.min_vruntime
     31248 =C2=B1  1%     -37.8%      19428 =C2=B1  1%  sched_debug.cfs_rq[=
55]:/.exec_clock
   2418358 =C2=B1  2%     -34.7%    1580063 =C2=B1  4%  sched_debug.cfs_rq[=
56]:/.min_vruntime
     47057 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
56]:/.avg->avg_period
     31121 =C2=B1  2%     -37.1%      19579 =C2=B1  1%  sched_debug.cfs_rq[=
56]:/.exec_clock
       611 =C2=B1  9%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
56]:/.tg_runnable_contrib
     28153 =C2=B1  9%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
56]:/.avg->runnable_avg_sum
      9504 =C2=B1 13%    +202.2%      28721 =C2=B1 17%  sched_debug.cfs_rq[=
56]:/.tg_load_avg
     58401 =C2=B1  4%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
56]:/.tg->runnable_avg
     58343 =C2=B1  4%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
57]:/.tg->runnable_avg
     31439 =C2=B1  2%     -37.9%      19539 =C2=B1  3%  sched_debug.cfs_rq[=
57]:/.exec_clock
   2440047 =C2=B1  2%     -36.1%    1558135 =C2=B1  5%  sched_debug.cfs_rq[=
57]:/.min_vruntime
     27534 =C2=B1 11%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
57]:/.avg->runnable_avg_sum
     46967 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
57]:/.avg->avg_period
       597 =C2=B1 11%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
57]:/.tg_runnable_contrib
      9455 =C2=B1 12%    +214.0%      29693 =C2=B1 19%  sched_debug.cfs_rq[=
57]:/.tg_load_avg
       624 =C2=B1  9%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
58]:/.tg_runnable_contrib
     58256 =C2=B1  4%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
58]:/.tg->runnable_avg
     28807 =C2=B1  9%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
58]:/.avg->runnable_avg_sum
     31254 =C2=B1  2%     -38.4%      19257 =C2=B1  0%  sched_debug.cfs_rq[=
58]:/.exec_clock
     46978 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
58]:/.avg->avg_period
   2420739 =C2=B1  1%     -35.0%    1573053 =C2=B1  3%  sched_debug.cfs_rq[=
58]:/.min_vruntime
      9414 =C2=B1 11%    +214.7%      29626 =C2=B1 19%  sched_debug.cfs_rq[=
58]:/.tg_load_avg
     47024 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
59]:/.avg->avg_period
   2496977 =C2=B1  5%     -37.7%    1556134 =C2=B1  6%  sched_debug.cfs_rq[=
59]:/.min_vruntime
      9402 =C2=B1 11%    +212.8%      29413 =C2=B1 19%  sched_debug.cfs_rq[=
59]:/.tg_load_avg
       645 =C2=B1  5%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
59]:/.tg_runnable_contrib
     29724 =C2=B1  4%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
59]:/.avg->runnable_avg_sum
     58170 =C2=B1  4%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
59]:/.tg->runnable_avg
     31539 =C2=B1  1%     -39.0%      19253 =C2=B1  2%  sched_debug.cfs_rq[=
59]:/.exec_clock
     29816 =C2=B1  8%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.avg->runnable_avg_sum
       647 =C2=B1  8%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.tg_runnable_contrib
     46930 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.avg->avg_period
     59639 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.tg->runnable_avg
     31085 =C2=B1  2%     -38.6%      19072 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.exec_clock
     12064 =C2=B1  2%    +232.2%      40077 =C2=B1 17%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
   2426703 =C2=B1  2%     -38.4%    1495298 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.min_vruntime
     47086 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
60]:/.avg->avg_period
     19879 =C2=B1 10%     -33.2%      13280 =C2=B1  8%  sched_debug.cfs_rq[=
60]:/.exec_clock
   1552394 =C2=B1 11%     -31.0%    1070904 =C2=B1 10%  sched_debug.cfs_rq[=
60]:/.min_vruntime
     16217 =C2=B1 15%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
60]:/.avg->runnable_avg_sum
     58189 =C2=B1  4%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
60]:/.tg->runnable_avg
      9286 =C2=B1 11%    +217.9%      29522 =C2=B1 17%  sched_debug.cfs_rq[=
60]:/.tg_load_avg
       352 =C2=B1 15%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
60]:/.tg_runnable_contrib
     19878 =C2=B1 12%     -36.8%      12560 =C2=B1  7%  sched_debug.cfs_rq[=
61]:/.exec_clock
     46987 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
61]:/.avg->avg_period
     16803 =C2=B1 18%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
61]:/.avg->runnable_avg_sum
     58056 =C2=B1  4%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
61]:/.tg->runnable_avg
      9209 =C2=B1 11%    +225.1%      29940 =C2=B1 16%  sched_debug.cfs_rq[=
61]:/.tg_load_avg
       366 =C2=B1 18%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
61]:/.tg_runnable_contrib
   1551511 =C2=B1 13%     -36.5%     985626 =C2=B1  7%  sched_debug.cfs_rq[=
61]:/.min_vruntime
      9058 =C2=B1 13%    +235.0%      30345 =C2=B1 17%  sched_debug.cfs_rq[=
62]:/.tg_load_avg
     58126 =C2=B1  4%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
62]:/.tg->runnable_avg
       412 =C2=B1 23%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
62]:/.tg_runnable_contrib
     19829 =C2=B1  8%     -37.2%      12453 =C2=B1  5%  sched_debug.cfs_rq[=
62]:/.exec_clock
   1560425 =C2=B1  8%     -36.3%     994485 =C2=B1  6%  sched_debug.cfs_rq[=
62]:/.min_vruntime
     46963 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
62]:/.avg->avg_period
     18936 =C2=B1 23%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
62]:/.avg->runnable_avg_sum
      8901 =C2=B1 15%    +238.9%      30169 =C2=B1 21%  sched_debug.cfs_rq[=
63]:/.tg_load_avg
     58236 =C2=B1  4%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
63]:/.tg->runnable_avg
     14711 =C2=B1 28%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
63]:/.avg->runnable_avg_sum
     47021 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
63]:/.avg->avg_period
     19483 =C2=B1 10%     -35.3%      12597 =C2=B1  7%  sched_debug.cfs_rq[=
63]:/.exec_clock
   1527380 =C2=B1 11%     -33.9%    1009153 =C2=B1  8%  sched_debug.cfs_rq[=
63]:/.min_vruntime
       320 =C2=B1 28%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
63]:/.tg_runnable_contrib
     20011 =C2=B1  7%     -35.9%      12826 =C2=B1  5%  sched_debug.cfs_rq[=
64]:/.exec_clock
     58282 =C2=B1  4%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
64]:/.tg->runnable_avg
     13327 =C2=B1 35%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
64]:/.avg->runnable_avg_sum
       290 =C2=B1 35%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
64]:/.tg_runnable_contrib
      8892 =C2=B1 15%    +237.4%      30004 =C2=B1 21%  sched_debug.cfs_rq[=
64]:/.tg_load_avg
     46996 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
64]:/.avg->avg_period
   1568420 =C2=B1  7%     -34.7%    1024853 =C2=B1  4%  sched_debug.cfs_rq[=
64]:/.min_vruntime
     58324 =C2=B1  4%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
65]:/.tg->runnable_avg
     17173 =C2=B1 31%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
65]:/.avg->runnable_avg_sum
     46972 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
65]:/.avg->avg_period
   1522634 =C2=B1  8%     -33.4%    1013875 =C2=B1  5%  sched_debug.cfs_rq[=
65]:/.min_vruntime
       372 =C2=B1 31%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
65]:/.tg_runnable_contrib
     19368 =C2=B1  8%     -33.4%      12892 =C2=B1  6%  sched_debug.cfs_rq[=
65]:/.exec_clock
      8874 =C2=B1 14%    +230.5%      29330 =C2=B1 22%  sched_debug.cfs_rq[=
65]:/.tg_load_avg
     15278 =C2=B1 34%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
66]:/.avg->runnable_avg_sum
   1545704 =C2=B1  8%     -33.7%    1024119 =C2=B1  8%  sched_debug.cfs_rq[=
66]:/.min_vruntime
     58521 =C2=B1  4%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
66]:/.tg->runnable_avg
     46938 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
66]:/.avg->avg_period
       332 =C2=B1 34%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
66]:/.tg_runnable_contrib
      8895 =C2=B1 13%    +215.4%      28056 =C2=B1 27%  sched_debug.cfs_rq[=
66]:/.tg_load_avg
     19556 =C2=B1  8%     -34.4%      12832 =C2=B1  8%  sched_debug.cfs_rq[=
66]:/.exec_clock
       365 =C2=B1 11%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
67]:/.tg_runnable_contrib
     58548 =C2=B1  4%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
67]:/.tg->runnable_avg
     16868 =C2=B1 12%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
67]:/.avg->runnable_avg_sum
     47048 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
67]:/.avg->avg_period
     19690 =C2=B1 10%     -33.6%      13073 =C2=B1  6%  sched_debug.cfs_rq[=
67]:/.exec_clock
   1543241 =C2=B1 11%     -32.4%    1042914 =C2=B1  5%  sched_debug.cfs_rq[=
67]:/.min_vruntime
      8844 =C2=B1 12%    +216.0%      27946 =C2=B1 26%  sched_debug.cfs_rq[=
67]:/.tg_load_avg
     19534 =C2=B1  9%     -35.8%      12546 =C2=B1  8%  sched_debug.cfs_rq[=
68]:/.exec_clock
      8822 =C2=B1 11%    +214.7%      27763 =C2=B1 26%  sched_debug.cfs_rq[=
68]:/.tg_load_avg
       353 =C2=B1 16%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
68]:/.tg_runnable_contrib
     58621 =C2=B1  4%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
68]:/.tg->runnable_avg
   1524518 =C2=B1 10%     -35.3%     985647 =C2=B1  8%  sched_debug.cfs_rq[=
68]:/.min_vruntime
     16177 =C2=B1 16%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
68]:/.avg->runnable_avg_sum
     46867 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
68]:/.avg->avg_period
       337 =C2=B1 13%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
69]:/.tg_runnable_contrib
     58693 =C2=B1  4%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
69]:/.tg->runnable_avg
   1531354 =C2=B1  9%     -34.9%     997158 =C2=B1  6%  sched_debug.cfs_rq[=
69]:/.min_vruntime
      8612 =C2=B1 12%    +221.1%      27650 =C2=B1 26%  sched_debug.cfs_rq[=
69]:/.tg_load_avg
     19656 =C2=B1  8%     -35.1%      12747 =C2=B1  6%  sched_debug.cfs_rq[=
69]:/.exec_clock
     47050 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
69]:/.avg->avg_period
     15526 =C2=B1 13%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
69]:/.avg->runnable_avg_sum
     30530 =C2=B1  8%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.avg->runnable_avg_sum
     31218 =C2=B1  2%     -39.8%      18807 =C2=B1  1%  sched_debug.cfs_rq[=
6]:/.exec_clock
     59699 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.tg->runnable_avg
       663 =C2=B1  8%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.tg_runnable_contrib
   2439073 =C2=B1  2%     -38.5%    1501177 =C2=B1  2%  sched_debug.cfs_rq[=
6]:/.min_vruntime
     46879 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.avg->avg_period
     11920 =C2=B1  5%    +233.5%      39751 =C2=B1 16%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
      8568 =C2=B1 12%    +224.5%      27805 =C2=B1 25%  sched_debug.cfs_rq[=
70]:/.tg_load_avg
   1503591 =C2=B1 11%     -31.3%    1032773 =C2=B1  7%  sched_debug.cfs_rq[=
70]:/.min_vruntime
     19200 =C2=B1 10%     -32.8%      12906 =C2=B1  7%  sched_debug.cfs_rq[=
70]:/.exec_clock
     47110 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
70]:/.avg->avg_period
       287 =C2=B1 39%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
70]:/.tg_runnable_contrib
     13255 =C2=B1 40%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
70]:/.avg->runnable_avg_sum
     58747 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
70]:/.tg->runnable_avg
     17377 =C2=B1 12%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
71]:/.avg->runnable_avg_sum
     58792 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
71]:/.tg->runnable_avg
       378 =C2=B1 12%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
71]:/.tg_runnable_contrib
   1547181 =C2=B1 10%     -35.5%     997677 =C2=B1  7%  sched_debug.cfs_rq[=
71]:/.min_vruntime
     46947 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
71]:/.avg->avg_period
      8536 =C2=B1 12%    +224.9%      27738 =C2=B1 25%  sched_debug.cfs_rq[=
71]:/.tg_load_avg
     19857 =C2=B1 10%     -37.1%      12493 =C2=B1  7%  sched_debug.cfs_rq[=
71]:/.exec_clock
   1527774 =C2=B1  9%     -36.6%     969011 =C2=B1  9%  sched_debug.cfs_rq[=
72]:/.min_vruntime
       450 =C2=B1 13%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
72]:/.tg_runnable_contrib
     58819 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
72]:/.tg->runnable_avg
     20772 =C2=B1 13%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
72]:/.avg->runnable_avg_sum
      8543 =C2=B1 12%    +225.9%      27844 =C2=B1 24%  sched_debug.cfs_rq[=
72]:/.tg_load_avg
     19478 =C2=B1  8%     -36.4%      12381 =C2=B1  9%  sched_debug.cfs_rq[=
72]:/.exec_clock
     46966 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
72]:/.avg->avg_period
       452 =C2=B1 15%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
73]:/.tg_runnable_contrib
     58903 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
73]:/.tg->runnable_avg
   1564733 =C2=B1  8%     -35.3%    1011883 =C2=B1  7%  sched_debug.cfs_rq[=
73]:/.min_vruntime
     20711 =C2=B1 15%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
73]:/.avg->runnable_avg_sum
     46807 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
73]:/.avg->avg_period
      8538 =C2=B1 13%    +223.5%      27624 =C2=B1 23%  sched_debug.cfs_rq[=
73]:/.tg_load_avg
     19866 =C2=B1  8%     -35.2%      12867 =C2=B1  8%  sched_debug.cfs_rq[=
73]:/.exec_clock
     46894 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
74]:/.avg->avg_period
      8535 =C2=B1 12%    +223.6%      27620 =C2=B1 24%  sched_debug.cfs_rq[=
74]:/.tg_load_avg
     19924 =C2=B1 11%     -37.3%      12494 =C2=B1  6%  sched_debug.cfs_rq[=
74]:/.exec_clock
     17975 =C2=B1  7%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
74]:/.avg->runnable_avg_sum
     59004 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
74]:/.tg->runnable_avg
   1557925 =C2=B1 11%     -37.6%     972145 =C2=B1  8%  sched_debug.cfs_rq[=
74]:/.min_vruntime
       390 =C2=B1  7%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
74]:/.tg_runnable_contrib
       461 =C2=B1 10%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
75]:/.tg_runnable_contrib
     59048 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
75]:/.tg->runnable_avg
     21274 =C2=B1 10%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
75]:/.avg->runnable_avg_sum
     47061 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
75]:/.avg->avg_period
      8538 =C2=B1 12%    +225.6%      27798 =C2=B1 25%  sched_debug.cfs_rq[=
75]:/.tg_load_avg
   1629105 =C2=B1  2%     -39.4%     986720 =C2=B1 14%  sched_debug.cfs_rq[=
75]:/.min_vruntime
     20653 =C2=B1  2%     -41.2%      12142 =C2=B1  8%  sched_debug.cfs_rq[=
75]:/.exec_clock
     58936 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
76]:/.tg->runnable_avg
     20786 =C2=B1  4%     -43.5%      11746 =C2=B1  9%  sched_debug.cfs_rq[=
76]:/.exec_clock
       394 =C2=B1 20%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
76]:/.tg_runnable_contrib
     18200 =C2=B1 20%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
76]:/.avg->runnable_avg_sum
     47093 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
76]:/.avg->avg_period
      8557 =C2=B1 12%    +225.0%      27814 =C2=B1 25%  sched_debug.cfs_rq[=
76]:/.tg_load_avg
   1631506 =C2=B1  4%     -41.1%     961196 =C2=B1 16%  sched_debug.cfs_rq[=
76]:/.min_vruntime
   1625473 =C2=B1  3%     -38.4%    1000669 =C2=B1 11%  sched_debug.cfs_rq[=
77]:/.min_vruntime
     58935 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
77]:/.tg->runnable_avg
     47058 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
77]:/.avg->avg_period
     17360 =C2=B1 21%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
77]:/.avg->runnable_avg_sum
       376 =C2=B1 21%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
77]:/.tg_runnable_contrib
      8566 =C2=B1 12%    +221.6%      27553 =C2=B1 25%  sched_debug.cfs_rq[=
77]:/.tg_load_avg
     20840 =C2=B1  3%     -42.1%      12070 =C2=B1  5%  sched_debug.cfs_rq[=
77]:/.exec_clock
     20283 =C2=B1  5%     -39.0%      12381 =C2=B1  4%  sched_debug.cfs_rq[=
78]:/.exec_clock
     58955 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
78]:/.tg->runnable_avg
      8532 =C2=B1 12%    +220.7%      27362 =C2=B1 25%  sched_debug.cfs_rq[=
78]:/.tg_load_avg
   1593651 =C2=B1  5%     -36.7%    1008099 =C2=B1  8%  sched_debug.cfs_rq[=
78]:/.min_vruntime
     47140 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
78]:/.avg->avg_period
       391 =C2=B1 31%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
78]:/.tg_runnable_contrib
     18101 =C2=B1 31%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
78]:/.avg->runnable_avg_sum
       331 =C2=B1 44%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
79]:/.tg_runnable_contrib
     46994 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
79]:/.avg->avg_period
      8518 =C2=B1 12%    +220.0%      27256 =C2=B1 25%  sched_debug.cfs_rq[=
79]:/.tg_load_avg
     15234 =C2=B1 44%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
79]:/.avg->runnable_avg_sum
     59002 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
79]:/.tg->runnable_avg
     20559 =C2=B1  4%     -43.3%      11658 =C2=B1  4%  sched_debug.cfs_rq[=
79]:/.exec_clock
   1621686 =C2=B1  4%     -41.0%     956701 =C2=B1 11%  sched_debug.cfs_rq[=
79]:/.min_vruntime
     59726 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.tg->runnable_avg
   2429023 =C2=B1  1%     -38.7%    1488968 =C2=B1  1%  sched_debug.cfs_rq[=
7]:/.min_vruntime
     46963 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.avg->avg_period
     11700 =C2=B1  6%    +239.4%      39706 =C2=B1 16%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
       569 =C2=B1 20%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.tg_runnable_contrib
     31212 =C2=B1  1%     -39.9%      18745 =C2=B1  2%  sched_debug.cfs_rq[=
7]:/.exec_clock
     26213 =C2=B1 19%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.avg->runnable_avg_sum
     46985 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
80]:/.avg->avg_period
      8516 =C2=B1 12%    +217.5%      27040 =C2=B1 24%  sched_debug.cfs_rq[=
80]:/.tg_load_avg
       362 =C2=B1 20%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
80]:/.tg_runnable_contrib
   1578044 =C2=B1  5%     -39.5%     955217 =C2=B1 15%  sched_debug.cfs_rq[=
80]:/.min_vruntime
     20137 =C2=B1  4%     -40.9%      11899 =C2=B1  8%  sched_debug.cfs_rq[=
80]:/.exec_clock
     59060 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
80]:/.tg->runnable_avg
     16694 =C2=B1 20%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
80]:/.avg->runnable_avg_sum
     19953 =C2=B1 19%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
81]:/.avg->runnable_avg_sum
   1638032 =C2=B1  4%     -39.6%     989932 =C2=B1 10%  sched_debug.cfs_rq[=
81]:/.min_vruntime
     47069 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
81]:/.avg->avg_period
      8507 =C2=B1 12%    +215.2%      26813 =C2=B1 24%  sched_debug.cfs_rq[=
81]:/.tg_load_avg
       433 =C2=B1 19%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
81]:/.tg_runnable_contrib
     59111 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
81]:/.tg->runnable_avg
     20973 =C2=B1  3%     -41.2%      12338 =C2=B1  5%  sched_debug.cfs_rq[=
81]:/.exec_clock
     17682 =C2=B1 28%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
82]:/.avg->runnable_avg_sum
     20770 =C2=B1  3%     -43.2%      11805 =C2=B1  2%  sched_debug.cfs_rq[=
82]:/.exec_clock
       384 =C2=B1 27%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
82]:/.tg_runnable_contrib
      8450 =C2=B1 12%    +215.7%      26676 =C2=B1 23%  sched_debug.cfs_rq[=
82]:/.tg_load_avg
     59180 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
82]:/.tg->runnable_avg
     47055 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
82]:/.avg->avg_period
   1628395 =C2=B1  3%     -40.8%     963633 =C2=B1  6%  sched_debug.cfs_rq[=
82]:/.min_vruntime
      8497 =C2=B1 13%    +210.1%      26351 =C2=B1 21%  sched_debug.cfs_rq[=
83]:/.tg_load_avg
       425 =C2=B1 13%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
83]:/.tg_runnable_contrib
     59274 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
83]:/.tg->runnable_avg
     19681 =C2=B1 13%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
83]:/.avg->runnable_avg_sum
     47128 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
83]:/.avg->avg_period
     20432 =C2=B1  3%     -42.3%      11798 =C2=B1  3%  sched_debug.cfs_rq[=
83]:/.exec_clock
   1601853 =C2=B1  4%     -39.6%     968063 =C2=B1 10%  sched_debug.cfs_rq[=
83]:/.min_vruntime
     19115 =C2=B1 15%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
84]:/.avg->runnable_avg_sum
     59265 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
84]:/.tg->runnable_avg
     47052 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
84]:/.avg->avg_period
      8491 =C2=B1 13%    +207.2%      26086 =C2=B1 21%  sched_debug.cfs_rq[=
84]:/.tg_load_avg
       415 =C2=B1 15%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
84]:/.tg_runnable_contrib
     20952 =C2=B1  4%     -45.7%      11373 =C2=B1  6%  sched_debug.cfs_rq[=
84]:/.exec_clock
   1616558 =C2=B1  5%     -41.6%     943362 =C2=B1 14%  sched_debug.cfs_rq[=
84]:/.min_vruntime
     20977 =C2=B1  4%     -41.1%      12356 =C2=B1  9%  sched_debug.cfs_rq[=
85]:/.exec_clock
     59168 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
85]:/.tg->runnable_avg
     17180 =C2=B1 17%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
85]:/.avg->runnable_avg_sum
     47003 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
85]:/.avg->avg_period
       372 =C2=B1 17%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
85]:/.tg_runnable_contrib
   1634887 =C2=B1  5%     -37.8%    1016520 =C2=B1 15%  sched_debug.cfs_rq[=
85]:/.min_vruntime
      8454 =C2=B1 12%    +206.4%      25903 =C2=B1 21%  sched_debug.cfs_rq[=
85]:/.tg_load_avg
     20763 =C2=B1 21%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
86]:/.avg->runnable_avg_sum
     47097 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
86]:/.avg->avg_period
     59186 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
86]:/.tg->runnable_avg
   1633325 =C2=B1  4%     -40.2%     977291 =C2=B1 15%  sched_debug.cfs_rq[=
86]:/.min_vruntime
      8447 =C2=B1 13%    +207.0%      25936 =C2=B1 22%  sched_debug.cfs_rq[=
86]:/.tg_load_avg
       448 =C2=B1 21%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
86]:/.tg_runnable_contrib
     21290 =C2=B1  2%     -43.6%      12002 =C2=B1  9%  sched_debug.cfs_rq[=
86]:/.exec_clock
     59182 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
87]:/.tg->runnable_avg
     20998 =C2=B1 10%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
87]:/.avg->runnable_avg_sum
     20635 =C2=B1  2%     -41.5%      12063 =C2=B1  5%  sched_debug.cfs_rq[=
87]:/.exec_clock
       455 =C2=B1  9%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
87]:/.tg_runnable_contrib
   1626045 =C2=B1  3%     -39.0%     992117 =C2=B1 11%  sched_debug.cfs_rq[=
87]:/.min_vruntime
      8503 =C2=B1 13%    +205.8%      26002 =C2=B1 21%  sched_debug.cfs_rq[=
87]:/.tg_load_avg
     47027 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
87]:/.avg->avg_period
     59193 =C2=B1  1%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
88]:/.tg->runnable_avg
     20788 =C2=B1  3%     -41.6%      12141 =C2=B1  2%  sched_debug.cfs_rq[=
88]:/.exec_clock
   1623720 =C2=B1  4%     -38.9%     992858 =C2=B1  8%  sched_debug.cfs_rq[=
88]:/.min_vruntime
      8530 =C2=B1 12%    +203.3%      25871 =C2=B1 22%  sched_debug.cfs_rq[=
88]:/.tg_load_avg
     47067 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
88]:/.avg->avg_period
       329 =C2=B1 33%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
88]:/.tg_runnable_contrib
     15219 =C2=B1 33%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
88]:/.avg->runnable_avg_sum
     46988 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
89]:/.avg->avg_period
     20736 =C2=B1  4%     -40.5%      12345 =C2=B1  3%  sched_debug.cfs_rq[=
89]:/.exec_clock
     17198 =C2=B1 18%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
89]:/.avg->runnable_avg_sum
     59206 =C2=B1  1%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
89]:/.tg->runnable_avg
   1629485 =C2=B1  4%     -37.9%    1011929 =C2=B1 10%  sched_debug.cfs_rq[=
89]:/.min_vruntime
      8624 =C2=B1 13%    +199.8%      25856 =C2=B1 22%  sched_debug.cfs_rq[=
89]:/.tg_load_avg
       374 =C2=B1 18%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
89]:/.tg_runnable_contrib
     31295 =C2=B1  1%     -39.2%      19027 =C2=B1  1%  sched_debug.cfs_rq[=
8]:/.exec_clock
     59753 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.tg->runnable_avg
     11584 =C2=B1  6%    +224.0%      37540 =C2=B1 22%  sched_debug.cfs_rq[=
8]:/.tg_load_avg
       611 =C2=B1 14%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.tg_runnable_contrib
     28160 =C2=B1 14%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.avg->runnable_avg_sum
     47013 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.avg->avg_period
   2439398 =C2=B1  1%     -39.2%    1483901 =C2=B1  1%  sched_debug.cfs_rq[=
8]:/.min_vruntime
   1568495 =C2=B1  7%     -34.2%    1031509 =C2=B1  2%  sched_debug.cfs_rq[=
90]:/.min_vruntime
     47063 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
90]:/.avg->avg_period
     20038 =C2=B1  7%     -37.4%      12537 =C2=B1  6%  sched_debug.cfs_rq[=
90]:/.exec_clock
     14823 =C2=B1 31%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
90]:/.avg->runnable_avg_sum
      8735 =C2=B1 14%    +195.6%      25820 =C2=B1 21%  sched_debug.cfs_rq[=
90]:/.tg_load_avg
     59210 =C2=B1  1%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
90]:/.tg->runnable_avg
       322 =C2=B1 31%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
90]:/.tg_runnable_contrib
   1571340 =C2=B1  8%     -39.7%     947821 =C2=B1 11%  sched_debug.cfs_rq[=
91]:/.min_vruntime
         2 =C2=B1 46%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
91]:/.runnable_load_avg
     17117 =C2=B1 28%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
91]:/.avg->runnable_avg_sum
       370 =C2=B1 27%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
91]:/.tg_runnable_contrib
     59223 =C2=B1  1%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
91]:/.tg->runnable_avg
     19938 =C2=B1  8%     -40.6%      11840 =C2=B1 10%  sched_debug.cfs_rq[=
91]:/.exec_clock
     47144 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
91]:/.avg->avg_period
      8786 =C2=B1 13%    +186.4%      25164 =C2=B1 19%  sched_debug.cfs_rq[=
91]:/.tg_load_avg
       356 =C2=B1 19%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
92]:/.tg_runnable_contrib
     59265 =C2=B1  1%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
92]:/.tg->runnable_avg
     19536 =C2=B1  9%     -37.5%      12219 =C2=B1  6%  sched_debug.cfs_rq[=
92]:/.exec_clock
     16398 =C2=B1 19%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
92]:/.avg->runnable_avg_sum
   1537969 =C2=B1  8%     -34.1%    1013675 =C2=B1  9%  sched_debug.cfs_rq[=
92]:/.min_vruntime
      8869 =C2=B1 13%    +181.8%      24994 =C2=B1 19%  sched_debug.cfs_rq[=
92]:/.tg_load_avg
     47113 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
92]:/.avg->avg_period
      8792 =C2=B1 12%    +181.7%      24765 =C2=B1 19%  sched_debug.cfs_rq[=
93]:/.tg_load_avg
     19801 =C2=B1  8%     -37.5%      12384 =C2=B1  2%  sched_debug.cfs_rq[=
93]:/.exec_clock
       304 =C2=B1 10%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
93]:/.tg_runnable_contrib
     59148 =C2=B1  1%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
93]:/.tg->runnable_avg
   1562000 =C2=B1  8%     -35.4%    1009694 =C2=B1  5%  sched_debug.cfs_rq[=
93]:/.min_vruntime
     47115 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
93]:/.avg->avg_period
     13993 =C2=B1 10%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
93]:/.avg->runnable_avg_sum
     46957 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
94]:/.avg->avg_period
     17481 =C2=B1 19%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
94]:/.avg->runnable_avg_sum
   1527690 =C2=B1  9%     -36.0%     978443 =C2=B1 11%  sched_debug.cfs_rq[=
94]:/.min_vruntime
      8767 =C2=B1 12%    +180.7%      24613 =C2=B1 19%  sched_debug.cfs_rq[=
94]:/.tg_load_avg
     19581 =C2=B1  7%     -39.5%      11845 =C2=B1  5%  sched_debug.cfs_rq[=
94]:/.exec_clock
       381 =C2=B1 19%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
94]:/.tg_runnable_contrib
     59209 =C2=B1  1%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
94]:/.tg->runnable_avg
   1572765 =C2=B1  8%     -35.0%    1022735 =C2=B1 10%  sched_debug.cfs_rq[=
95]:/.min_vruntime
     47059 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
95]:/.avg->avg_period
     20132 =C2=B1  7%     -38.0%      12472 =C2=B1  5%  sched_debug.cfs_rq[=
95]:/.exec_clock
     14015 =C2=B1 31%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
95]:/.avg->runnable_avg_sum
     59203 =C2=B1  1%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
95]:/.tg->runnable_avg
      8777 =C2=B1 12%    +179.7%      24549 =C2=B1 19%  sched_debug.cfs_rq[=
95]:/.tg_load_avg
       304 =C2=B1 31%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
95]:/.tg_runnable_contrib
      8835 =C2=B1 13%    +176.9%      24466 =C2=B1 19%  sched_debug.cfs_rq[=
96]:/.tg_load_avg
     19327 =C2=B1  8%     -38.1%      11971 =C2=B1  3%  sched_debug.cfs_rq[=
96]:/.exec_clock
   1533831 =C2=B1  9%     -36.1%     980108 =C2=B1  5%  sched_debug.cfs_rq[=
96]:/.min_vruntime
       309 =C2=B1 25%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
96]:/.tg_runnable_contrib
     59169 =C2=B1  1%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
96]:/.tg->runnable_avg
     47079 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
96]:/.avg->avg_period
     14274 =C2=B1 25%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
96]:/.avg->runnable_avg_sum
     47034 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
97]:/.avg->avg_period
     17433 =C2=B1 22%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
97]:/.avg->runnable_avg_sum
     59194 =C2=B1  1%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
97]:/.tg->runnable_avg
   1593643 =C2=B1  6%     -37.0%    1003502 =C2=B1  7%  sched_debug.cfs_rq[=
97]:/.min_vruntime
     20351 =C2=B1  4%     -40.3%      12155 =C2=B1  3%  sched_debug.cfs_rq[=
97]:/.exec_clock
      8764 =C2=B1 13%    +178.0%      24369 =C2=B1 20%  sched_debug.cfs_rq[=
97]:/.tg_load_avg
       377 =C2=B1 21%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
97]:/.tg_runnable_contrib
     46966 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
98]:/.avg->avg_period
     20053 =C2=B1  5%     -39.8%      12062 =C2=B1  6%  sched_debug.cfs_rq[=
98]:/.exec_clock
     17503 =C2=B1 19%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
98]:/.avg->runnable_avg_sum
   1579659 =C2=B1  5%     -37.2%     991429 =C2=B1 10%  sched_debug.cfs_rq[=
98]:/.min_vruntime
       379 =C2=B1 19%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
98]:/.tg_runnable_contrib
     59233 =C2=B1  1%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
98]:/.tg->runnable_avg
      8717 =C2=B1 12%    +178.7%      24297 =C2=B1 20%  sched_debug.cfs_rq[=
98]:/.tg_load_avg
     47034 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
99]:/.avg->avg_period
   1600133 =C2=B1  8%     -39.8%     963186 =C2=B1 11%  sched_debug.cfs_rq[=
99]:/.min_vruntime
     20430 =C2=B1  8%     -42.6%      11723 =C2=B1  7%  sched_debug.cfs_rq[=
99]:/.exec_clock
     17125 =C2=B1 23%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
99]:/.avg->runnable_avg_sum
     59274 =C2=B1  1%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
99]:/.tg->runnable_avg
       372 =C2=B1 24%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
99]:/.tg_runnable_contrib
      8741 =C2=B1 13%    +177.3%      24238 =C2=B1 19%  sched_debug.cfs_rq[=
99]:/.tg_load_avg
       170 =C2=B1 25%    +117.8%        370 =C2=B1 28%  sched_debug.cfs_rq[=
99]:/.utilization_load_avg
       590 =C2=B1 12%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.tg_runnable_contrib
     30799 =C2=B1  2%     -37.9%      19120 =C2=B1  3%  sched_debug.cfs_rq[=
9]:/.exec_clock
   2405374 =C2=B1  3%     -37.2%    1510552 =C2=B1  2%  sched_debug.cfs_rq[=
9]:/.min_vruntime
     59773 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.tg->runnable_avg
     11623 =C2=B1  7%    +216.8%      36823 =C2=B1 27%  sched_debug.cfs_rq[=
9]:/.tg_load_avg
     27221 =C2=B1 12%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.avg->runnable_avg_sum
     46982 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.avg->avg_period
     15972 =C2=B1  8%     -33.4%      10630 =C2=B1 12%  sched_debug.cpu#0.s=
ched_goidle
     54020 =C2=B1  6%     -22.9%      41634 =C2=B1  3%  sched_debug.cpu#0.s=
ched_count
     26704 =C2=B1  3%     -30.4%      18599 =C2=B1  4%  sched_debug.cpu#0.t=
twu_count
     90551 =C2=B1  0%     -25.0%      67886 =C2=B1  2%  sched_debug.cpu#0.c=
lock
         8 =C2=B1 22%     -41.9%          5 =C2=B1 14%  sched_debug.cpu#0.c=
pu_load[4]
     90551 =C2=B1  0%     -25.0%      67886 =C2=B1  2%  sched_debug.cpu#0.c=
lock_task
     37547 =C2=B1  8%     -29.8%      26373 =C2=B1 11%  sched_debug.cpu#0.n=
r_switches
     37472 =C2=B1  1%     -32.4%      25328 =C2=B1  7%  sched_debug.cpu#0.n=
r_load_updates
         8 =C2=B1 27%     -41.9%          5 =C2=B1 14%  sched_debug.cpu#0.c=
pu_load[3]
     38511 =C2=B1  1%     -30.5%      26778 =C2=B1  7%  sched_debug.cpu#1.n=
r_load_updates
     38454 =C2=B1  6%     -35.9%      24633 =C2=B1  7%  sched_debug.cpu#1.n=
r_switches
     90553 =C2=B1  0%     -25.0%      67889 =C2=B1  2%  sched_debug.cpu#1.c=
lock
     90553 =C2=B1  0%     -25.0%      67889 =C2=B1  2%  sched_debug.cpu#1.c=
lock_task
     39506 =C2=B1  7%     -37.0%      24884 =C2=B1  7%  sched_debug.cpu#1.s=
ched_count
    410404 =C2=B1 13%     +25.0%     513181 =C2=B1  3%  sched_debug.cpu#1.a=
vg_idle
     18430 =C2=B1  6%     -36.0%      11791 =C2=B1  7%  sched_debug.cpu#1.s=
ched_goidle
     20578 =C2=B1  2%     -35.8%      13206 =C2=B1  4%  sched_debug.cpu#1.t=
twu_count
     14771 =C2=B1  6%     -43.5%       8342 =C2=B1  9%  sched_debug.cpu#10.=
sched_goidle
         7 =C2=B1 17%     -50.7%          3 =C2=B1 43%  sched_debug.cpu#10.=
cpu_load[2]
         8 =C2=B1 13%     -53.1%          3 =C2=B1 43%  sched_debug.cpu#10.=
cpu_load[3]
     30999 =C2=B1  6%     -43.3%      17582 =C2=B1  9%  sched_debug.cpu#10.=
nr_switches
         8 =C2=B1 13%     -53.1%          3 =C2=B1 43%  sched_debug.cpu#10.=
cpu_load[4]
     31260 =C2=B1  6%     -43.0%      17833 =C2=B1  9%  sched_debug.cpu#10.=
sched_count
     90574 =C2=B1  0%     -25.0%      67903 =C2=B1  2%  sched_debug.cpu#10.=
clock
     90574 =C2=B1  0%     -25.0%      67903 =C2=B1  2%  sched_debug.cpu#10.=
clock_task
     18861 =C2=B1  1%     -40.9%      11150 =C2=B1  1%  sched_debug.cpu#10.=
ttwu_count
       453 =C2=B1 25%     -54.0%        208 =C2=B1 10%  sched_debug.cpu#10.=
ttwu_local
    454668 =C2=B1 19%     +50.8%     685569 =C2=B1 18%  sched_debug.cpu#10.=
avg_idle
     39533 =C2=B1  1%     -33.8%      26167 =C2=B1  6%  sched_debug.cpu#10.=
nr_load_updates
     90772 =C2=B1  0%     -25.0%      68047 =C2=B1  2%  sched_debug.cpu#100=
.clock_task
     29022 =C2=B1 13%     -38.2%      17944 =C2=B1 15%  sched_debug.cpu#100=
.sched_count
     28339 =C2=B1 14%     -37.9%      17604 =C2=B1 16%  sched_debug.cpu#100=
.nr_switches
     90772 =C2=B1  0%     -25.0%      68047 =C2=B1  2%  sched_debug.cpu#100=
.clock
     11750 =C2=B1 10%     -39.0%       7173 =C2=B1 11%  sched_debug.cpu#100=
.ttwu_count
         4 =C2=B1 46%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#100=
.cpu_load[0]
     13204 =C2=B1 14%     -37.8%       8212 =C2=B1 17%  sched_debug.cpu#100=
.sched_goidle
     28532 =C2=B1  4%     -32.5%      19245 =C2=B1  7%  sched_debug.cpu#100=
.nr_load_updates
         4 =C2=B1 46%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#100=
.cpu_load[2]
     27021 =C2=B1  8%     -36.8%      17068 =C2=B1 19%  sched_debug.cpu#101=
.nr_switches
     90775 =C2=B1  0%     -25.0%      68049 =C2=B1  2%  sched_debug.cpu#101=
.clock_task
     12582 =C2=B1  8%     -36.7%       7960 =C2=B1 19%  sched_debug.cpu#101=
.sched_goidle
     28396 =C2=B1  5%     -39.3%      17250 =C2=B1 18%  sched_debug.cpu#101=
.sched_count
     12108 =C2=B1  9%     -39.6%       7315 =C2=B1  7%  sched_debug.cpu#101=
.ttwu_count
     28879 =C2=B1  3%     -33.3%      19260 =C2=B1  7%  sched_debug.cpu#101=
.nr_load_updates
     90775 =C2=B1  0%     -25.0%      68049 =C2=B1  2%  sched_debug.cpu#101=
.clock
     28627 =C2=B1  4%     -33.0%      19171 =C2=B1  8%  sched_debug.cpu#102=
.nr_load_updates
     11765 =C2=B1  9%     -37.7%       7329 =C2=B1  5%  sched_debug.cpu#102=
.ttwu_count
     26096 =C2=B1 11%     -31.7%      17820 =C2=B1 16%  sched_debug.cpu#102=
.nr_switches
     90776 =C2=B1  0%     -25.0%      68050 =C2=B1  2%  sched_debug.cpu#102=
.clock_task
     27056 =C2=B1 13%     -33.5%      17985 =C2=B1 17%  sched_debug.cpu#102=
.sched_count
     90776 =C2=B1  0%     -25.0%      68050 =C2=B1  2%  sched_debug.cpu#102=
.clock
     12109 =C2=B1 12%     -31.5%       8294 =C2=B1 15%  sched_debug.cpu#102=
.sched_goidle
     28817 =C2=B1  3%     -33.8%      19079 =C2=B1  8%  sched_debug.cpu#103=
.nr_load_updates
     11929 =C2=B1  8%     -38.8%       7305 =C2=B1  9%  sched_debug.cpu#103=
.ttwu_count
     90779 =C2=B1  0%     -25.0%      68052 =C2=B1  2%  sched_debug.cpu#103=
.clock_task
     90779 =C2=B1  0%     -25.0%      68052 =C2=B1  2%  sched_debug.cpu#103=
.clock
     25806 =C2=B1  9%     -25.5%      19218 =C2=B1 15%  sched_debug.cpu#103=
.sched_count
     25471 =C2=B1  9%     -28.7%      18149 =C2=B1 12%  sched_debug.cpu#103=
.nr_switches
     11773 =C2=B1  9%     -28.2%       8448 =C2=B1 12%  sched_debug.cpu#103=
.sched_goidle
     12219 =C2=B1 10%     -37.4%       7644 =C2=B1 12%  sched_debug.cpu#104=
.ttwu_count
     30004 =C2=B1 10%     -38.4%      18472 =C2=B1 12%  sched_debug.cpu#104=
.sched_count
     13751 =C2=B1 10%     -42.1%       7955 =C2=B1 12%  sched_debug.cpu#104=
.sched_goidle
     29007 =C2=B1  3%     -32.8%      19490 =C2=B1  9%  sched_debug.cpu#104=
.nr_load_updates
     29560 =C2=B1 10%     -42.1%      17101 =C2=B1 12%  sched_debug.cpu#104=
.nr_switches
     90780 =C2=B1  0%     -25.0%      68054 =C2=B1  2%  sched_debug.cpu#104=
.clock
     90780 =C2=B1  0%     -25.0%      68054 =C2=B1  2%  sched_debug.cpu#104=
.clock_task
     90782 =C2=B1  0%     -25.0%      68055 =C2=B1  2%  sched_debug.cpu#105=
.clock_task
     90782 =C2=B1  0%     -25.0%      68055 =C2=B1  2%  sched_debug.cpu#105=
.clock
     13184 =C2=B1 12%     -36.4%       8381 =C2=B1  5%  sched_debug.cpu#105=
.sched_goidle
     28274 =C2=B1 12%     -36.0%      18099 =C2=B1  4%  sched_debug.cpu#105=
.nr_switches
     12334 =C2=B1  8%     -40.5%       7337 =C2=B1  5%  sched_debug.cpu#105=
.ttwu_count
     28820 =C2=B1  4%     -32.8%      19355 =C2=B1  9%  sched_debug.cpu#105=
.nr_load_updates
     28475 =C2=B1 12%     -35.5%      18355 =C2=B1  3%  sched_debug.cpu#105=
.sched_count
     90784 =C2=B1  0%     -25.0%      68057 =C2=B1  2%  sched_debug.cpu#106=
.clock
     11817 =C2=B1 10%     -37.7%       7366 =C2=B1  2%  sched_debug.cpu#106=
.ttwu_count
     12758 =C2=B1 15%     -31.3%       8758 =C2=B1  6%  sched_debug.cpu#106=
.sched_goidle
         1 =C2=B1 30%    +165.6%          4 =C2=B1 30%  sched_debug.cpu#106=
.cpu_load[2]
     28501 =C2=B1  4%     -32.6%      19220 =C2=B1  8%  sched_debug.cpu#106=
.nr_load_updates
     27964 =C2=B1 15%     -30.1%      19553 =C2=B1  8%  sched_debug.cpu#106=
.sched_count
     90784 =C2=B1  0%     -25.0%      68057 =C2=B1  2%  sched_debug.cpu#106=
.clock_task
     27546 =C2=B1 15%     -31.4%      18889 =C2=B1  6%  sched_debug.cpu#106=
.nr_switches
     90786 =C2=B1  0%     -25.0%      68059 =C2=B1  2%  sched_debug.cpu#107=
.clock_task
     28140 =C2=B1  4%     -30.4%      19575 =C2=B1  6%  sched_debug.cpu#107=
.nr_load_updates
     28056 =C2=B1 13%     -35.2%      18170 =C2=B1  6%  sched_debug.cpu#107=
.sched_count
     11789 =C2=B1  8%     -34.6%       7714 =C2=B1  1%  sched_debug.cpu#107=
.ttwu_count
     90786 =C2=B1  0%     -25.0%      68059 =C2=B1  2%  sched_debug.cpu#107=
.clock
     26616 =C2=B1 15%     -32.0%      18109 =C2=B1  6%  sched_debug.cpu#107=
.nr_switches
     12366 =C2=B1 15%     -32.0%       8411 =C2=B1  6%  sched_debug.cpu#107=
.sched_goidle
     28219 =C2=B1  4%     -29.5%      19894 =C2=B1  7%  sched_debug.cpu#108=
.nr_load_updates
     90788 =C2=B1  0%     -25.0%      68060 =C2=B1  2%  sched_debug.cpu#108=
.clock_task
     11760 =C2=B1  9%     -34.8%       7666 =C2=B1  1%  sched_debug.cpu#108=
.ttwu_count
     90788 =C2=B1  0%     -25.0%      68060 =C2=B1  2%  sched_debug.cpu#108=
.clock
     90791 =C2=B1  0%     -25.0%      68062 =C2=B1  2%  sched_debug.cpu#109=
.clock
     13133 =C2=B1 15%     -33.8%       8692 =C2=B1  9%  sched_debug.cpu#109=
.sched_goidle
     28245 =C2=B1  4%     -29.8%      19834 =C2=B1  8%  sched_debug.cpu#109=
.nr_load_updates
     90791 =C2=B1  0%     -25.0%      68062 =C2=B1  2%  sched_debug.cpu#109=
.clock_task
     28159 =C2=B1 15%     -33.4%      18761 =C2=B1  9%  sched_debug.cpu#109=
.nr_switches
     11868 =C2=B1 10%     -36.0%       7595 =C2=B1  4%  sched_debug.cpu#109=
.ttwu_count
     29099 =C2=B1 15%     -35.1%      18891 =C2=B1  9%  sched_debug.cpu#109=
.sched_count
     90577 =C2=B1  0%     -25.0%      67906 =C2=B1  2%  sched_debug.cpu#11.=
clock_task
     15748 =C2=B1 14%     -33.2%      10525 =C2=B1 26%  sched_debug.cpu#11.=
sched_goidle
         7 =C2=B1 23%     -53.6%          3 =C2=B1 25%  sched_debug.cpu#11.=
cpu_load[1]
     32931 =C2=B1 14%     -32.3%      22288 =C2=B1 27%  sched_debug.cpu#11.=
nr_switches
     90577 =C2=B1  0%     -25.0%      67906 =C2=B1  2%  sched_debug.cpu#11.=
clock
     18729 =C2=B1  2%     -37.6%      11692 =C2=B1  3%  sched_debug.cpu#11.=
ttwu_count
     33559 =C2=B1 14%     -31.6%      22959 =C2=B1 26%  sched_debug.cpu#11.=
sched_count
     39400 =C2=B1  2%     -33.1%      26360 =C2=B1  5%  sched_debug.cpu#11.=
nr_load_updates
         6 =C2=B1 26%     -52.2%          3 =C2=B1 25%  sched_debug.cpu#11.=
cpu_load[0]
    462136 =C2=B1 10%     +43.6%     663443 =C2=B1 30%  sched_debug.cpu#11.=
avg_idle
     90792 =C2=B1  0%     -25.0%      68063 =C2=B1  2%  sched_debug.cpu#110=
.clock
     90792 =C2=B1  0%     -25.0%      68063 =C2=B1  2%  sched_debug.cpu#110=
.clock_task
     27546 =C2=B1  9%     -36.8%      17410 =C2=B1 10%  sched_debug.cpu#110=
.nr_switches
     28777 =C2=B1  3%     -31.7%      19669 =C2=B1  9%  sched_debug.cpu#110=
.nr_load_updates
     12749 =C2=B1  9%     -36.0%       8163 =C2=B1 10%  sched_debug.cpu#110=
.sched_goidle
     12142 =C2=B1  7%     -36.1%       7753 =C2=B1  4%  sched_debug.cpu#110=
.ttwu_count
     27879 =C2=B1  8%     -37.0%      17575 =C2=B1 10%  sched_debug.cpu#110=
.sched_count
     12159 =C2=B1  9%     -37.6%       7586 =C2=B1  2%  sched_debug.cpu#111=
.ttwu_count
     28227 =C2=B1 14%     -36.2%      18019 =C2=B1 12%  sched_debug.cpu#111=
.nr_switches
     13172 =C2=B1 15%     -36.0%       8428 =C2=B1 12%  sched_debug.cpu#111=
.sched_goidle
     28840 =C2=B1  4%     -32.5%      19476 =C2=B1  8%  sched_debug.cpu#111=
.nr_load_updates
     90794 =C2=B1  0%     -25.0%      68064 =C2=B1  2%  sched_debug.cpu#111=
.clock
     90794 =C2=B1  0%     -25.0%      68064 =C2=B1  2%  sched_debug.cpu#111=
.clock_task
     28417 =C2=B1 14%     -36.4%      18083 =C2=B1 11%  sched_debug.cpu#111=
.sched_count
     90796 =C2=B1  0%     -25.0%      68066 =C2=B1  2%  sched_debug.cpu#112=
.clock
     11932 =C2=B1  9%     -35.0%       7755 =C2=B1  2%  sched_debug.cpu#112=
.ttwu_count
     90796 =C2=B1  0%     -25.0%      68066 =C2=B1  2%  sched_debug.cpu#112=
.clock_task
     29471 =C2=B1 11%     -36.5%      18710 =C2=B1  8%  sched_debug.cpu#112=
.sched_count
     28278 =C2=B1  4%     -30.6%      19616 =C2=B1  7%  sched_debug.cpu#112=
.nr_load_updates
     13545 =C2=B1 12%     -36.9%       8543 =C2=B1  7%  sched_debug.cpu#112=
.sched_goidle
     29054 =C2=B1 11%     -36.3%      18517 =C2=B1  7%  sched_debug.cpu#112=
.nr_switches
     28473 =C2=B1  3%     -31.6%      19488 =C2=B1  8%  sched_debug.cpu#113=
.nr_load_updates
     30888 =C2=B1 16%     -40.1%      18488 =C2=B1  4%  sched_debug.cpu#113=
.nr_switches
     31766 =C2=B1 15%     -41.3%      18645 =C2=B1  3%  sched_debug.cpu#113=
.sched_count
     12058 =C2=B1  8%     -36.1%       7707 =C2=B1  4%  sched_debug.cpu#113=
.ttwu_count
     14489 =C2=B1 16%     -40.4%       8629 =C2=B1  5%  sched_debug.cpu#113=
.sched_goidle
     90798 =C2=B1  0%     -25.0%      68068 =C2=B1  2%  sched_debug.cpu#113=
.clock
     90798 =C2=B1  0%     -25.0%      68068 =C2=B1  2%  sched_debug.cpu#113=
.clock_task
     27987 =C2=B1 10%     -37.4%      17523 =C2=B1  6%  sched_debug.cpu#114=
.nr_switches
     28094 =C2=B1 10%     -37.1%      17685 =C2=B1  6%  sched_debug.cpu#114=
.sched_count
     29059 =C2=B1  2%     -34.4%      19066 =C2=B1  7%  sched_debug.cpu#114=
.nr_load_updates
     13014 =C2=B1  9%     -37.7%       8102 =C2=B1  6%  sched_debug.cpu#114=
.sched_goidle
     12365 =C2=B1  8%     -40.6%       7349 =C2=B1  3%  sched_debug.cpu#114=
.ttwu_count
     90800 =C2=B1  0%     -25.0%      68069 =C2=B1  2%  sched_debug.cpu#114=
.clock
     90800 =C2=B1  0%     -25.0%      68069 =C2=B1  2%  sched_debug.cpu#114=
.clock_task
     27977 =C2=B1 15%     -35.7%      17984 =C2=B1 15%  sched_debug.cpu#115=
.sched_count
     28506 =C2=B1  3%     -33.0%      19095 =C2=B1  7%  sched_debug.cpu#115=
.nr_load_updates
     90803 =C2=B1  0%     -25.0%      68071 =C2=B1  2%  sched_debug.cpu#115=
.clock
     90803 =C2=B1  0%     -25.0%      68071 =C2=B1  2%  sched_debug.cpu#115=
.clock_task
     12888 =C2=B1 16%     -35.5%       8307 =C2=B1 16%  sched_debug.cpu#115=
.sched_goidle
     27688 =C2=B1 15%     -35.3%      17920 =C2=B1 15%  sched_debug.cpu#115=
.nr_switches
     12343 =C2=B1  9%     -38.3%       7618 =C2=B1  2%  sched_debug.cpu#115=
.ttwu_count
         3 =C2=B1 45%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#116=
.cpu_load[0]
     28104 =C2=B1 13%     -29.1%      19938 =C2=B1 12%  sched_debug.cpu#116=
.sched_count
     12008 =C2=B1  8%     -36.5%       7624 =C2=B1  2%  sched_debug.cpu#116=
.ttwu_count
         3 =C2=B1 29%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#116=
.cpu_load[4]
         3 =C2=B1 33%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#116=
.cpu_load[3]
     27660 =C2=B1 12%     -28.1%      19881 =C2=B1 12%  sched_debug.cpu#116=
.nr_switches
      1996 =C2=B1 47%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#116=
.curr->pid
         6 =C2=B1 21%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#116=
.load
     90805 =C2=B1  0%     -25.0%      68073 =C2=B1  2%  sched_debug.cpu#116=
.clock
     28273 =C2=B1  2%     -32.4%      19118 =C2=B1  9%  sched_debug.cpu#116=
.nr_load_updates
         3 =C2=B1 37%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#116=
.cpu_load[2]
     90805 =C2=B1  0%     -25.0%      68073 =C2=B1  2%  sched_debug.cpu#116=
.clock_task
         3 =C2=B1 37%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#116=
.cpu_load[1]
     28725 =C2=B1 16%     -35.2%      18621 =C2=B1 14%  sched_debug.cpu#117=
.sched_count
     90807 =C2=B1  0%     -25.0%      68074 =C2=B1  2%  sched_debug.cpu#117=
.clock_task
     90807 =C2=B1  0%     -25.0%      68074 =C2=B1  2%  sched_debug.cpu#117=
.clock
     28085 =C2=B1  3%     -31.7%      19178 =C2=B1  8%  sched_debug.cpu#117=
.nr_load_updates
     13241 =C2=B1 17%     -35.1%       8589 =C2=B1 15%  sched_debug.cpu#117=
.sched_goidle
     11774 =C2=B1  8%     -36.0%       7538 =C2=B1  3%  sched_debug.cpu#117=
.ttwu_count
     28454 =C2=B1 16%     -34.8%      18559 =C2=B1 14%  sched_debug.cpu#117=
.nr_switches
     90809 =C2=B1  0%     -25.0%      68075 =C2=B1  2%  sched_debug.cpu#118=
.clock
     28824 =C2=B1 19%     -32.1%      19575 =C2=B1 11%  sched_debug.cpu#118=
.sched_count
     90809 =C2=B1  0%     -25.0%      68075 =C2=B1  2%  sched_debug.cpu#118=
.clock_task
     13208 =C2=B1 19%     -32.0%       8976 =C2=B1 10%  sched_debug.cpu#118=
.sched_goidle
     28349 =C2=B1 19%     -32.1%      19252 =C2=B1 10%  sched_debug.cpu#118=
.nr_switches
     28574 =C2=B1  3%     -32.1%      19410 =C2=B1  7%  sched_debug.cpu#118=
.nr_load_updates
      2477 =C2=B1 24%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#118=
.curr->pid
         4 =C2=B1 50%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#118=
.cpu_load[0]
     12213 =C2=B1  8%     -37.6%       7626 =C2=B1  2%  sched_debug.cpu#118=
.ttwu_count
         4 =C2=B1 50%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#118=
.cpu_load[1]
         4 =C2=B1 50%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#118=
.cpu_load[2]
         4 =C2=B1 44%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#118=
.cpu_load[3]
         4 =C2=B1 44%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#118=
.cpu_load[4]
         5 =C2=B1 40%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#118=
.load
     13219 =C2=B1 13%     -35.3%       8557 =C2=B1 15%  sched_debug.cpu#119=
.sched_goidle
     90811 =C2=B1  0%     -25.0%      68078 =C2=B1  2%  sched_debug.cpu#119=
.clock_task
     90811 =C2=B1  0%     -25.0%      68078 =C2=B1  2%  sched_debug.cpu#119=
.clock
     28405 =C2=B1 13%     -35.3%      18386 =C2=B1 16%  sched_debug.cpu#119=
.nr_switches
     12302 =C2=B1  7%     -38.3%       7591 =C2=B1  3%  sched_debug.cpu#119=
.ttwu_count
     28469 =C2=B1  2%     -32.4%      19244 =C2=B1  6%  sched_debug.cpu#119=
.nr_load_updates
     31589 =C2=B1 20%     -40.5%      18788 =C2=B1 18%  sched_debug.cpu#119=
.sched_count
     15487 =C2=B1  5%     -36.6%       9815 =C2=B1 11%  sched_debug.cpu#12.=
sched_goidle
       465 =C2=B1 29%     -45.7%        252 =C2=B1 22%  sched_debug.cpu#12.=
ttwu_local
     32465 =C2=B1  6%     -36.6%      20573 =C2=B1 11%  sched_debug.cpu#12.=
nr_switches
    445082 =C2=B1 14%     +42.7%     634909 =C2=B1 30%  sched_debug.cpu#12.=
avg_idle
     39630 =C2=B1  2%     -32.7%      26666 =C2=B1  6%  sched_debug.cpu#12.=
nr_load_updates
     38356 =C2=B1 29%     -45.7%      20839 =C2=B1 11%  sched_debug.cpu#12.=
sched_count
     19419 =C2=B1  4%     -39.3%      11781 =C2=B1  3%  sched_debug.cpu#12.=
ttwu_count
     90578 =C2=B1  0%     -25.0%      67907 =C2=B1  2%  sched_debug.cpu#12.=
clock
     90578 =C2=B1  0%     -25.0%      67907 =C2=B1  2%  sched_debug.cpu#12.=
clock_task
       499 =C2=B1 32%     -52.8%        236 =C2=B1  3%  sched_debug.cpu#13.=
ttwu_local
     16336 =C2=B1  8%     -37.1%      10268 =C2=B1  6%  sched_debug.cpu#13.=
sched_goidle
     90581 =C2=B1  0%     -25.0%      67909 =C2=B1  2%  sched_debug.cpu#13.=
clock
     39061 =C2=B1  2%     -32.9%      26224 =C2=B1  5%  sched_debug.cpu#13.=
nr_load_updates
     18558 =C2=B1  4%     -40.4%      11064 =C2=B1  1%  sched_debug.cpu#13.=
ttwu_count
     90581 =C2=B1  0%     -25.0%      67909 =C2=B1  2%  sched_debug.cpu#13.=
clock_task
     34207 =C2=B1  8%     -37.1%      21509 =C2=B1  6%  sched_debug.cpu#13.=
nr_switches
     35000 =C2=B1  8%     -38.1%      21669 =C2=B1  6%  sched_debug.cpu#13.=
sched_count
     39341 =C2=B1  1%     -32.2%      26687 =C2=B1  5%  sched_debug.cpu#14.=
nr_load_updates
     18749 =C2=B1  1%     -39.2%      11397 =C2=B1  2%  sched_debug.cpu#14.=
ttwu_count
     15658 =C2=B1 10%     -37.7%       9749 =C2=B1  8%  sched_debug.cpu#14.=
sched_goidle
     32809 =C2=B1 10%     -37.8%      20397 =C2=B1  9%  sched_debug.cpu#14.=
nr_switches
     90583 =C2=B1  0%     -25.0%      67910 =C2=B1  2%  sched_debug.cpu#14.=
clock
       473 =C2=B1 25%     -55.2%        212 =C2=B1 13%  sched_debug.cpu#14.=
ttwu_local
     90583 =C2=B1  0%     -25.0%      67910 =C2=B1  2%  sched_debug.cpu#14.=
clock_task
     33423 =C2=B1  8%     -36.4%      21270 =C2=B1 10%  sched_debug.cpu#14.=
sched_count
     90586 =C2=B1  0%     -25.0%      67914 =C2=B1  2%  sched_debug.cpu#15.=
clock
     38989 =C2=B1  4%     -41.1%      22966 =C2=B1  6%  sched_debug.cpu#15.=
sched_count
     38597 =C2=B1  4%     -41.5%      22590 =C2=B1  5%  sched_debug.cpu#15.=
nr_switches
     18477 =C2=B1  4%     -40.9%      10929 =C2=B1  5%  sched_debug.cpu#15.=
sched_goidle
    436533 =C2=B1 19%     +37.2%     598879 =C2=B1 19%  sched_debug.cpu#15.=
avg_idle
     90586 =C2=B1  0%     -25.0%      67914 =C2=B1  2%  sched_debug.cpu#15.=
clock_task
     41841 =C2=B1  1%     -33.1%      27997 =C2=B1  6%  sched_debug.cpu#15.=
nr_load_updates
     22024 =C2=B1  1%     -38.1%      13639 =C2=B1  2%  sched_debug.cpu#15.=
ttwu_count
     19844 =C2=B1  5%     -41.8%      11554 =C2=B1  4%  sched_debug.cpu#16.=
ttwu_count
    389072 =C2=B1 22%    +115.1%     836811 =C2=B1 24%  sched_debug.cpu#16.=
avg_idle
     16360 =C2=B1  9%     -44.7%       9052 =C2=B1  5%  sched_debug.cpu#16.=
sched_goidle
        71 =C2=B1 18%     -54.0%         33 =C2=B1 17%  sched_debug.cpu#16.=
nr_uninterruptible
     34859 =C2=B1 11%     -46.0%      18812 =C2=B1  4%  sched_debug.cpu#16.=
nr_switches
     40465 =C2=B1  2%     -34.4%      26542 =C2=B1  4%  sched_debug.cpu#16.=
nr_load_updates
     90588 =C2=B1  0%     -25.0%      67915 =C2=B1  2%  sched_debug.cpu#16.=
clock
     35345 =C2=B1 10%     -44.3%      19674 =C2=B1  7%  sched_debug.cpu#16.=
sched_count
     90588 =C2=B1  0%     -25.0%      67915 =C2=B1  2%  sched_debug.cpu#16.=
clock_task
     20647 =C2=B1 14%     -45.1%      11330 =C2=B1  4%  sched_debug.cpu#17.=
ttwu_count
     90591 =C2=B1  0%     -25.0%      67916 =C2=B1  2%  sched_debug.cpu#17.=
clock_task
     90591 =C2=B1  0%     -25.0%      67916 =C2=B1  2%  sched_debug.cpu#17.=
clock
     39999 =C2=B1  1%     -34.5%      26195 =C2=B1  5%  sched_debug.cpu#17.=
nr_load_updates
    456496 =C2=B1 15%     +35.1%     616716 =C2=B1 16%  sched_debug.cpu#17.=
avg_idle
     35219 =C2=B1 13%     -45.6%      19143 =C2=B1  4%  sched_debug.cpu#17.=
nr_switches
     16785 =C2=B1 14%     -45.3%       9182 =C2=B1  4%  sched_debug.cpu#17.=
sched_goidle
     36691 =C2=B1 11%     -47.5%      19246 =C2=B1  4%  sched_debug.cpu#17.=
sched_count
        66 =C2=B1 21%     -47.4%         35 =C2=B1 15%  sched_debug.cpu#17.=
nr_uninterruptible
     35663 =C2=B1  6%     -41.0%      21035 =C2=B1  9%  sched_debug.cpu#18.=
sched_count
     39691 =C2=B1  1%     -34.4%      26019 =C2=B1  6%  sched_debug.cpu#18.=
nr_load_updates
    465384 =C2=B1 19%     +52.4%     709276 =C2=B1 28%  sched_debug.cpu#18.=
avg_idle
     34845 =C2=B1  7%     -44.8%      19234 =C2=B1  6%  sched_debug.cpu#18.=
nr_switches
     19464 =C2=B1  5%     -41.7%      11338 =C2=B1  6%  sched_debug.cpu#18.=
ttwu_count
        75 =C2=B1 34%     -61.5%         29 =C2=B1 30%  sched_debug.cpu#18.=
nr_uninterruptible
     90592 =C2=B1  0%     -25.0%      67918 =C2=B1  2%  sched_debug.cpu#18.=
clock
     90592 =C2=B1  0%     -25.0%      67918 =C2=B1  2%  sched_debug.cpu#18.=
clock_task
     16592 =C2=B1  7%     -44.5%       9212 =C2=B1  5%  sched_debug.cpu#18.=
sched_goidle
    446180 =C2=B1 23%     +46.7%     654727 =C2=B1 31%  sched_debug.cpu#19.=
avg_idle
     16565 =C2=B1 10%     -41.4%       9702 =C2=B1  7%  sched_debug.cpu#19.=
sched_goidle
         8 =C2=B1 17%     -63.4%          3 =C2=B1 40%  sched_debug.cpu#19.=
cpu_load[3]
     90595 =C2=B1  0%     -25.0%      67920 =C2=B1  2%  sched_debug.cpu#19.=
clock
         8 =C2=B1 17%     -60.4%          3 =C2=B1 25%  sched_debug.cpu#19.=
cpu_load[4]
     90595 =C2=B1  0%     -25.0%      67920 =C2=B1  2%  sched_debug.cpu#19.=
clock_task
     34788 =C2=B1  9%     -40.3%      20765 =C2=B1  8%  sched_debug.cpu#19.=
nr_switches
     20095 =C2=B1  6%     -41.2%      11815 =C2=B1  5%  sched_debug.cpu#19.=
ttwu_count
     40108 =C2=B1  1%     -32.5%      27067 =C2=B1  5%  sched_debug.cpu#19.=
nr_load_updates
     35771 =C2=B1  8%     -31.7%      24448 =C2=B1 17%  sched_debug.cpu#19.=
sched_count
        68 =C2=B1 27%     -52.8%         32 =C2=B1  5%  sched_debug.cpu#19.=
nr_uninterruptible
     21052 =C2=B1 11%     -43.8%      11823 =C2=B1  1%  sched_debug.cpu#2.t=
twu_count
     39490 =C2=B1  2%     -32.8%      26526 =C2=B1  5%  sched_debug.cpu#2.n=
r_load_updates
     33114 =C2=B1 11%     -35.7%      21303 =C2=B1  7%  sched_debug.cpu#2.n=
r_switches
     15795 =C2=B1 11%     -35.6%      10175 =C2=B1  7%  sched_debug.cpu#2.s=
ched_goidle
     90554 =C2=B1  0%     -25.0%      67891 =C2=B1  2%  sched_debug.cpu#2.c=
lock
     90554 =C2=B1  0%     -25.0%      67891 =C2=B1  2%  sched_debug.cpu#2.c=
lock_task
     34604 =C2=B1 11%     -36.1%      22120 =C2=B1  3%  sched_debug.cpu#2.s=
ched_count
     33394 =C2=B1 10%     -44.3%      18595 =C2=B1 12%  sched_debug.cpu#20.=
nr_switches
     39724 =C2=B1  1%     -31.9%      27065 =C2=B1  5%  sched_debug.cpu#20.=
nr_load_updates
     35190 =C2=B1 11%     -40.0%      21116 =C2=B1 28%  sched_debug.cpu#20.=
sched_count
     15912 =C2=B1 10%     -45.8%       8629 =C2=B1  9%  sched_debug.cpu#20.=
sched_goidle
     90597 =C2=B1  0%     -25.0%      67921 =C2=B1  2%  sched_debug.cpu#20.=
clock
     90597 =C2=B1  0%     -25.0%      67921 =C2=B1  2%  sched_debug.cpu#20.=
clock_task
     19624 =C2=B1  5%     -37.1%      12347 =C2=B1  6%  sched_debug.cpu#20.=
ttwu_count
     35940 =C2=B1 17%     -44.2%      20046 =C2=B1  8%  sched_debug.cpu#21.=
nr_switches
     40110 =C2=B1  3%     -33.3%      26772 =C2=B1  5%  sched_debug.cpu#21.=
nr_load_updates
     43376 =C2=B1 33%     -52.9%      20449 =C2=B1  6%  sched_debug.cpu#21.=
sched_count
     16833 =C2=B1 15%     -44.7%       9317 =C2=B1  4%  sched_debug.cpu#21.=
sched_goidle
     90599 =C2=B1  0%     -25.0%      67923 =C2=B1  2%  sched_debug.cpu#21.=
clock_task
     19743 =C2=B1  7%     -38.0%      12240 =C2=B1  6%  sched_debug.cpu#21.=
ttwu_count
     90599 =C2=B1  0%     -25.0%      67923 =C2=B1  2%  sched_debug.cpu#21.=
clock
     39343 =C2=B1  1%     -33.2%      26276 =C2=B1  5%  sched_debug.cpu#22.=
nr_load_updates
     90601 =C2=B1  0%     -25.0%      67923 =C2=B1  2%  sched_debug.cpu#22.=
clock_task
        62 =C2=B1 29%     -52.4%         29 =C2=B1 22%  sched_debug.cpu#22.=
nr_uninterruptible
     15715 =C2=B1  4%     -43.3%       8907 =C2=B1 10%  sched_debug.cpu#22.=
sched_goidle
     33133 =C2=B1  4%     -43.7%      18655 =C2=B1 10%  sched_debug.cpu#22.=
nr_switches
     33796 =C2=B1  4%     -42.0%      19585 =C2=B1 12%  sched_debug.cpu#22.=
sched_count
     90601 =C2=B1  0%     -25.0%      67923 =C2=B1  2%  sched_debug.cpu#22.=
clock
     19210 =C2=B1  3%     -39.5%      11620 =C2=B1  2%  sched_debug.cpu#22.=
ttwu_count
     90604 =C2=B1  0%     -25.0%      67925 =C2=B1  2%  sched_debug.cpu#23.=
clock_task
     36032 =C2=B1 11%     -42.8%      20609 =C2=B1 18%  sched_debug.cpu#23.=
nr_switches
     39578 =C2=B1  1%     -31.9%      26948 =C2=B1  6%  sched_debug.cpu#23.=
nr_load_updates
     37386 =C2=B1 10%     -41.6%      21829 =C2=B1 19%  sched_debug.cpu#23.=
sched_count
        77 =C2=B1 12%     -56.0%         34 =C2=B1 13%  sched_debug.cpu#23.=
nr_uninterruptible
    466126 =C2=B1 11%     +51.7%     707316 =C2=B1 22%  sched_debug.cpu#23.=
avg_idle
     90604 =C2=B1  0%     -25.0%      67925 =C2=B1  2%  sched_debug.cpu#23.=
clock
     17129 =C2=B1 11%     -42.0%       9937 =C2=B1 18%  sched_debug.cpu#23.=
sched_goidle
     19326 =C2=B1  4%     -37.8%      12012 =C2=B1 11%  sched_debug.cpu#23.=
ttwu_count
     37421 =C2=B1  8%     -51.2%      18272 =C2=B1  7%  sched_debug.cpu#24.=
nr_switches
     90606 =C2=B1  0%     -25.0%      67927 =C2=B1  2%  sched_debug.cpu#24.=
clock_task
     90606 =C2=B1  0%     -25.0%      67927 =C2=B1  2%  sched_debug.cpu#24.=
clock
     39873 =C2=B1  1%     -34.4%      26141 =C2=B1  5%  sched_debug.cpu#24.=
nr_load_updates
     17604 =C2=B1  6%     -50.1%       8793 =C2=B1  7%  sched_debug.cpu#24.=
sched_goidle
     19710 =C2=B1  7%     -42.6%      11316 =C2=B1  1%  sched_debug.cpu#24.=
ttwu_count
     38404 =C2=B1  8%     -50.8%      18875 =C2=B1  8%  sched_debug.cpu#24.=
sched_count
        68 =C2=B1 22%     -52.5%         32 =C2=B1 15%  sched_debug.cpu#24.=
nr_uninterruptible
        43 =C2=B1 28%     -47.6%         22 =C2=B1 17%  sched_debug.cpu#25.=
nr_uninterruptible
         9 =C2=B1 22%     -37.5%          5 =C2=B1 14%  sched_debug.cpu#25.=
load
     34134 =C2=B1  6%     -40.5%      20300 =C2=B1  9%  sched_debug.cpu#25.=
nr_switches
     16030 =C2=B1  5%     -39.0%       9775 =C2=B1 10%  sched_debug.cpu#25.=
sched_goidle
     20840 =C2=B1 13%     -39.7%      12576 =C2=B1  7%  sched_debug.cpu#25.=
ttwu_count
     39954 =C2=B1  2%     -32.0%      27179 =C2=B1  9%  sched_debug.cpu#25.=
nr_load_updates
     90609 =C2=B1  0%     -25.0%      67929 =C2=B1  2%  sched_debug.cpu#25.=
clock_task
     34643 =C2=B1  6%     -39.6%      20908 =C2=B1  8%  sched_debug.cpu#25.=
sched_count
     90609 =C2=B1  0%     -25.0%      67929 =C2=B1  2%  sched_debug.cpu#25.=
clock
     35529 =C2=B1  8%     -45.4%      19402 =C2=B1  9%  sched_debug.cpu#26.=
nr_switches
     20241 =C2=B1  6%     -44.2%      11287 =C2=B1  2%  sched_debug.cpu#26.=
ttwu_count
        54 =C2=B1 20%     -37.7%         34 =C2=B1 15%  sched_debug.cpu#26.=
nr_uninterruptible
     90611 =C2=B1  0%     -25.0%      67930 =C2=B1  2%  sched_debug.cpu#26.=
clock_task
     90611 =C2=B1  0%     -25.0%      67930 =C2=B1  2%  sched_debug.cpu#26.=
clock
     40487 =C2=B1  2%     -35.4%      26148 =C2=B1  6%  sched_debug.cpu#26.=
nr_load_updates
     16638 =C2=B1  7%     -44.4%       9259 =C2=B1  8%  sched_debug.cpu#26.=
sched_goidle
     36288 =C2=B1  6%     -45.4%      19812 =C2=B1  9%  sched_debug.cpu#26.=
sched_count
         9 =C2=B1 18%     -40.1%          5 =C2=B1 14%  sched_debug.cpu#26.=
load
     20331 =C2=B1  6%     -46.2%      10943 =C2=B1  1%  sched_debug.cpu#27.=
ttwu_count
         8 =C2=B1 13%     -31.8%          6 =C2=B1 11%  sched_debug.cpu#27.=
cpu_load[4]
     35141 =C2=B1  8%     -46.5%      18814 =C2=B1  8%  sched_debug.cpu#27.=
nr_switches
     90613 =C2=B1  0%     -25.0%      67933 =C2=B1  2%  sched_debug.cpu#27.=
clock
     90613 =C2=B1  0%     -25.0%      67933 =C2=B1  2%  sched_debug.cpu#27.=
clock_task
     40479 =C2=B1  2%     -36.4%      25725 =C2=B1  5%  sched_debug.cpu#27.=
nr_load_updates
        62 =C2=B1 25%     -54.6%         28 =C2=B1 38%  sched_debug.cpu#27.=
nr_uninterruptible
     16784 =C2=B1  8%     -46.4%       8992 =C2=B1  8%  sched_debug.cpu#27.=
sched_goidle
         8 =C2=B1 18%     -40.3%          5 =C2=B1 28%  sched_debug.cpu#27.=
cpu_load[2]
     36231 =C2=B1  7%     -46.6%      19332 =C2=B1  5%  sched_debug.cpu#27.=
sched_count
         8 =C2=B1 18%     -37.5%          5 =C2=B1 20%  sched_debug.cpu#27.=
cpu_load[3]
     39616 =C2=B1  1%     -32.0%      26949 =C2=B1 13%  sched_debug.cpu#28.=
nr_load_updates
    548702 =C2=B1 11%     +41.7%     777402 =C2=B1 14%  sched_debug.cpu#28.=
avg_idle
     90615 =C2=B1  0%     -25.0%      67934 =C2=B1  2%  sched_debug.cpu#28.=
clock_task
     16349 =C2=B1  8%     -46.5%       8754 =C2=B1  3%  sched_debug.cpu#28.=
sched_goidle
     90615 =C2=B1  0%     -25.0%      67934 =C2=B1  2%  sched_debug.cpu#28.=
clock
     19429 =C2=B1  5%     -39.9%      11682 =C2=B1 10%  sched_debug.cpu#28.=
ttwu_count
        68 =C2=B1 15%     -50.9%         33 =C2=B1 15%  sched_debug.cpu#28.=
nr_uninterruptible
     34346 =C2=B1  9%     -43.6%      19361 =C2=B1 14%  sched_debug.cpu#28.=
nr_switches
     35239 =C2=B1  8%     -43.8%      19815 =C2=B1 14%  sched_debug.cpu#28.=
sched_count
     19627 =C2=B1  3%     -44.5%      10891 =C2=B1  4%  sched_debug.cpu#29.=
ttwu_count
     39727 =C2=B1  1%     -35.3%      25699 =C2=B1  6%  sched_debug.cpu#29.=
nr_load_updates
        65 =C2=B1 27%     -58.3%         27 =C2=B1 33%  sched_debug.cpu#29.=
nr_uninterruptible
     16184 =C2=B1  8%     -39.6%       9780 =C2=B1  8%  sched_debug.cpu#29.=
sched_goidle
     90617 =C2=B1  0%     -25.0%      67936 =C2=B1  2%  sched_debug.cpu#29.=
clock_task
     33972 =C2=B1  8%     -39.7%      20475 =C2=B1  7%  sched_debug.cpu#29.=
nr_switches
     36319 =C2=B1 16%     -39.7%      21885 =C2=B1 10%  sched_debug.cpu#29.=
sched_count
     90617 =C2=B1  0%     -25.0%      67936 =C2=B1  2%  sched_debug.cpu#29.=
clock
     19180 =C2=B1  2%     -39.5%      11596 =C2=B1  2%  sched_debug.cpu#3.t=
twu_count
     15526 =C2=B1  3%     -31.9%      10568 =C2=B1 10%  sched_debug.cpu#3.s=
ched_goidle
    378861 =C2=B1 20%     +73.4%     656831 =C2=B1 18%  sched_debug.cpu#3.a=
vg_idle
     39001 =C2=B1  2%     -32.0%      26523 =C2=B1  7%  sched_debug.cpu#3.n=
r_load_updates
     32386 =C2=B1  3%     -31.8%      22099 =C2=B1 10%  sched_debug.cpu#3.n=
r_switches
       427 =C2=B1 16%     -32.5%        288 =C2=B1 12%  sched_debug.cpu#3.t=
twu_local
     90558 =C2=B1  0%     -25.0%      67892 =C2=B1  2%  sched_debug.cpu#3.c=
lock_task
     90558 =C2=B1  0%     -25.0%      67892 =C2=B1  2%  sched_debug.cpu#3.c=
lock
     32991 =C2=B1  3%     -26.6%      24216 =C2=B1 14%  sched_debug.cpu#3.s=
ched_count
     90620 =C2=B1  0%     -25.0%      67937 =C2=B1  2%  sched_debug.cpu#30.=
clock
     90620 =C2=B1  0%     -25.0%      67937 =C2=B1  2%  sched_debug.cpu#30.=
clock_task
       523 =C2=B1 31%     -38.7%        320 =C2=B1 17%  sched_debug.cpu#30.=
ttwu_local
     31352 =C2=B1 11%     -41.3%      18415 =C2=B1 10%  sched_debug.cpu#30.=
nr_switches
     14853 =C2=B1 11%     -41.1%       8747 =C2=B1 10%  sched_debug.cpu#30.=
sched_goidle
     31612 =C2=B1 11%     -39.8%      19038 =C2=B1 10%  sched_debug.cpu#30.=
sched_count
      4062 =C2=B1  9%     -35.8%       2606 =C2=B1 35%  sched_debug.cpu#30.=
curr->pid
     39171 =C2=B1  1%     -33.5%      26043 =C2=B1  4%  sched_debug.cpu#30.=
nr_load_updates
     19268 =C2=B1  7%     -40.7%      11430 =C2=B1  3%  sched_debug.cpu#30.=
ttwu_count
     19006 =C2=B1  4%     -39.0%      11600 =C2=B1  5%  sched_debug.cpu#31.=
ttwu_count
     33056 =C2=B1 12%     -34.0%      21818 =C2=B1 22%  sched_debug.cpu#31.=
sched_count
    459398 =C2=B1 24%     +64.0%     753414 =C2=B1 32%  sched_debug.cpu#31.=
avg_idle
     39310 =C2=B1  0%     -33.6%      26118 =C2=B1  6%  sched_debug.cpu#31.=
nr_load_updates
     90622 =C2=B1  0%     -25.0%      67940 =C2=B1  2%  sched_debug.cpu#31.=
clock_task
     31466 =C2=B1  8%     -40.5%      18736 =C2=B1  4%  sched_debug.cpu#31.=
nr_switches
     90622 =C2=B1  0%     -25.0%      67940 =C2=B1  2%  sched_debug.cpu#31.=
clock
     14990 =C2=B1  8%     -40.7%       8896 =C2=B1  4%  sched_debug.cpu#31.=
sched_goidle
     18915 =C2=B1  5%     -39.9%      11375 =C2=B1  3%  sched_debug.cpu#32.=
ttwu_count
     90624 =C2=B1  0%     -25.0%      67941 =C2=B1  2%  sched_debug.cpu#32.=
clock
     90624 =C2=B1  0%     -25.0%      67941 =C2=B1  2%  sched_debug.cpu#32.=
clock_task
     16133 =C2=B1  6%     -41.7%       9403 =C2=B1 11%  sched_debug.cpu#32.=
sched_goidle
     34810 =C2=B1  8%     -41.6%      20319 =C2=B1 12%  sched_debug.cpu#32.=
sched_count
     39075 =C2=B1  1%     -34.1%      25769 =C2=B1  5%  sched_debug.cpu#32.=
nr_load_updates
     33749 =C2=B1  6%     -41.5%      19756 =C2=B1 11%  sched_debug.cpu#32.=
nr_switches
     39061 =C2=B1  1%     -34.4%      25640 =C2=B1  5%  sched_debug.cpu#33.=
nr_load_updates
     34433 =C2=B1  8%     -41.7%      20085 =C2=B1  6%  sched_debug.cpu#33.=
sched_count
     33515 =C2=B1  8%     -41.0%      19782 =C2=B1  6%  sched_debug.cpu#33.=
nr_switches
         8 =C2=B1  7%     -40.6%          4 =C2=B1 31%  sched_debug.cpu#33.=
cpu_load[4]
     16045 =C2=B1  8%     -41.3%       9420 =C2=B1  6%  sched_debug.cpu#33.=
sched_goidle
     90627 =C2=B1  0%     -25.0%      67943 =C2=B1  2%  sched_debug.cpu#33.=
clock
     18706 =C2=B1  4%     -38.7%      11460 =C2=B1  3%  sched_debug.cpu#33.=
ttwu_count
         8 =C2=B1  7%     -43.8%          4 =C2=B1 36%  sched_debug.cpu#33.=
cpu_load[3]
     90627 =C2=B1  0%     -25.0%      67943 =C2=B1  2%  sched_debug.cpu#33.=
clock_task
     31355 =C2=B1  9%     -39.8%      18886 =C2=B1  4%  sched_debug.cpu#34.=
nr_switches
     18903 =C2=B1  5%     -39.1%      11515 =C2=B1  7%  sched_debug.cpu#34.=
ttwu_count
     33666 =C2=B1 15%     -41.7%      19642 =C2=B1  7%  sched_debug.cpu#34.=
sched_count
     39116 =C2=B1  1%     -33.7%      25952 =C2=B1  5%  sched_debug.cpu#34.=
nr_load_updates
         8 =C2=B1 22%     -46.9%          4 =C2=B1 34%  sched_debug.cpu#34.=
cpu_load[0]
         8 =C2=B1 26%     -46.9%          4 =C2=B1 34%  sched_debug.cpu#34.=
cpu_load[1]
         8 =C2=B1 26%     -46.9%          4 =C2=B1 34%  sched_debug.cpu#34.=
cpu_load[2]
         8 =C2=B1 26%     -46.9%          4 =C2=B1 34%  sched_debug.cpu#34.=
cpu_load[3]
     90629 =C2=B1  0%     -25.0%      67945 =C2=B1  2%  sched_debug.cpu#34.=
clock
     14990 =C2=B1  9%     -39.8%       9030 =C2=B1  5%  sched_debug.cpu#34.=
sched_goidle
         8 =C2=B1 26%     -46.9%          4 =C2=B1 34%  sched_debug.cpu#34.=
cpu_load[4]
     90629 =C2=B1  0%     -25.0%      67945 =C2=B1  2%  sched_debug.cpu#34.=
clock_task
     38891 =C2=B1  1%     -33.8%      25733 =C2=B1  4%  sched_debug.cpu#35.=
nr_load_updates
     18842 =C2=B1  5%     -38.6%      11566 =C2=B1  4%  sched_debug.cpu#35.=
ttwu_count
     14965 =C2=B1  9%     -40.3%       8941 =C2=B1  7%  sched_debug.cpu#35.=
sched_goidle
    466136 =C2=B1 16%     +64.3%     765807 =C2=B1 21%  sched_debug.cpu#35.=
avg_idle
     90632 =C2=B1  0%     -25.0%      67946 =C2=B1  2%  sched_debug.cpu#35.=
clock_task
      4394 =C2=B1 17%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#35.=
curr->pid
     90632 =C2=B1  0%     -25.0%      67946 =C2=B1  2%  sched_debug.cpu#35.=
clock
        10 =C2=B1 20%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#35.=
cpu_load[1]
        11 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#35.=
cpu_load[0]
     37179 =C2=B1 25%     -48.5%      19152 =C2=B1  5%  sched_debug.cpu#35.=
sched_count
     31372 =C2=B1  9%     -40.1%      18801 =C2=B1  7%  sched_debug.cpu#35.=
nr_switches
        10 =C2=B1 13%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#35.=
load
     33143 =C2=B1  9%     -34.5%      21715 =C2=B1 18%  sched_debug.cpu#36.=
sched_count
     39146 =C2=B1  1%     -33.8%      25922 =C2=B1  5%  sched_debug.cpu#36.=
nr_load_updates
     18937 =C2=B1  5%     -37.7%      11792 =C2=B1  6%  sched_debug.cpu#36.=
ttwu_count
     32600 =C2=B1  8%     -38.7%      19995 =C2=B1 15%  sched_debug.cpu#36.=
nr_switches
     90633 =C2=B1  0%     -25.0%      67947 =C2=B1  2%  sched_debug.cpu#36.=
clock_task
     90633 =C2=B1  0%     -25.0%      67947 =C2=B1  2%  sched_debug.cpu#36.=
clock
     15615 =C2=B1  8%     -39.1%       9513 =C2=B1 15%  sched_debug.cpu#36.=
sched_goidle
    452723 =C2=B1 11%     +53.0%     692815 =C2=B1 28%  sched_debug.cpu#37.=
avg_idle
     18761 =C2=B1  6%     -39.1%      11425 =C2=B1  4%  sched_debug.cpu#37.=
ttwu_count
     36805 =C2=B1 15%     -49.0%      18756 =C2=B1 16%  sched_debug.cpu#37.=
sched_count
     38576 =C2=B1  1%     -33.1%      25814 =C2=B1  4%  sched_debug.cpu#37.=
nr_load_updates
     34912 =C2=B1  8%     -47.1%      18457 =C2=B1 16%  sched_debug.cpu#37.=
nr_switches
       393 =C2=B1 18%     -34.5%        257 =C2=B1 34%  sched_debug.cpu#37.=
ttwu_local
     16714 =C2=B1  8%     -47.4%       8795 =C2=B1 16%  sched_debug.cpu#37.=
sched_goidle
     90636 =C2=B1  0%     -25.0%      67949 =C2=B1  2%  sched_debug.cpu#37.=
clock_task
     90636 =C2=B1  0%     -25.0%      67949 =C2=B1  2%  sched_debug.cpu#37.=
clock
     90638 =C2=B1  0%     -25.0%      67951 =C2=B1  2%  sched_debug.cpu#38.=
clock_task
     32701 =C2=B1 10%     -40.2%      19562 =C2=B1 12%  sched_debug.cpu#38.=
nr_switches
     15666 =C2=B1 10%     -40.4%       9332 =C2=B1 12%  sched_debug.cpu#38.=
sched_goidle
     38767 =C2=B1  1%     -33.1%      25951 =C2=B1  5%  sched_debug.cpu#38.=
nr_load_updates
     32974 =C2=B1 10%     -38.7%      20213 =C2=B1 16%  sched_debug.cpu#38.=
sched_count
     18867 =C2=B1  5%     -38.7%      11560 =C2=B1  3%  sched_debug.cpu#38.=
ttwu_count
     90638 =C2=B1  0%     -25.0%      67951 =C2=B1  2%  sched_debug.cpu#38.=
clock
     32484 =C2=B1 12%     -36.1%      20763 =C2=B1  5%  sched_debug.cpu#39.=
sched_count
     15197 =C2=B1 11%     -36.6%       9637 =C2=B1  7%  sched_debug.cpu#39.=
sched_goidle
     90641 =C2=B1  0%     -25.0%      67953 =C2=B1  2%  sched_debug.cpu#39.=
clock_task
     90641 =C2=B1  0%     -25.0%      67953 =C2=B1  2%  sched_debug.cpu#39.=
clock
     31795 =C2=B1 11%     -36.5%      20176 =C2=B1  7%  sched_debug.cpu#39.=
nr_switches
     18665 =C2=B1  4%     -33.3%      12448 =C2=B1 17%  sched_debug.cpu#39.=
ttwu_count
     38537 =C2=B1  1%     -33.0%      25803 =C2=B1  5%  sched_debug.cpu#39.=
nr_load_updates
         7 =C2=B1 13%     -53.9%          3 =C2=B1 42%  sched_debug.cpu#39.=
cpu_load[4]
       433 =C2=B1 15%     -44.7%        239 =C2=B1 15%  sched_debug.cpu#4.t=
twu_local
     38759 =C2=B1  2%     -32.9%      26007 =C2=B1  5%  sched_debug.cpu#4.n=
r_load_updates
     35317 =C2=B1  6%     -40.8%      20914 =C2=B1  6%  sched_debug.cpu#4.n=
r_switches
     18621 =C2=B1  4%     -39.7%      11223 =C2=B1  2%  sched_debug.cpu#4.t=
twu_count
     36331 =C2=B1  6%     -41.8%      21151 =C2=B1  5%  sched_debug.cpu#4.s=
ched_count
     90561 =C2=B1  0%     -25.0%      67894 =C2=B1  2%  sched_debug.cpu#4.c=
lock_task
     90561 =C2=B1  0%     -25.0%      67894 =C2=B1  2%  sched_debug.cpu#4.c=
lock
     16882 =C2=B1  5%     -40.9%       9975 =C2=B1  5%  sched_debug.cpu#4.s=
ched_goidle
     33237 =C2=B1  4%     -40.1%      19902 =C2=B1  5%  sched_debug.cpu#40.=
sched_count
     38781 =C2=B1  1%     -36.0%      24817 =C2=B1  1%  sched_debug.cpu#40.=
nr_load_updates
     18837 =C2=B1  5%     -39.4%      11410 =C2=B1  4%  sched_debug.cpu#40.=
ttwu_count
     32573 =C2=B1  5%     -40.8%      19269 =C2=B1  4%  sched_debug.cpu#40.=
nr_switches
     15614 =C2=B1  4%     -41.1%       9197 =C2=B1  4%  sched_debug.cpu#40.=
sched_goidle
     90642 =C2=B1  0%     -25.0%      67954 =C2=B1  2%  sched_debug.cpu#40.=
clock_task
     90642 =C2=B1  0%     -25.0%      67954 =C2=B1  2%  sched_debug.cpu#40.=
clock
     38619 =C2=B1  2%     -33.2%      25814 =C2=B1  4%  sched_debug.cpu#41.=
nr_load_updates
     18607 =C2=B1  6%     -38.4%      11462 =C2=B1  3%  sched_debug.cpu#41.=
ttwu_count
     90645 =C2=B1  0%     -25.0%      67956 =C2=B1  2%  sched_debug.cpu#41.=
clock
     90645 =C2=B1  0%     -25.0%      67956 =C2=B1  2%  sched_debug.cpu#41.=
clock_task
     36255 =C2=B1 11%     -40.3%      21636 =C2=B1 14%  sched_debug.cpu#41.=
sched_count
     16177 =C2=B1 11%     -37.9%      10044 =C2=B1 16%  sched_debug.cpu#41.=
sched_goidle
     33825 =C2=B1 11%     -37.3%      21196 =C2=B1 16%  sched_debug.cpu#41.=
nr_switches
     31681 =C2=B1  6%     -38.6%      19445 =C2=B1 10%  sched_debug.cpu#42.=
nr_switches
     19156 =C2=B1  5%     -40.2%      11453 =C2=B1  5%  sched_debug.cpu#42.=
ttwu_count
     90646 =C2=B1  0%     -25.0%      67957 =C2=B1  2%  sched_debug.cpu#42.=
clock
     90646 =C2=B1  0%     -25.0%      67957 =C2=B1  2%  sched_debug.cpu#42.=
clock_task
    506500 =C2=B1 10%     +58.5%     802804 =C2=B1 25%  sched_debug.cpu#42.=
avg_idle
     39063 =C2=B1  1%     -34.0%      25781 =C2=B1  4%  sched_debug.cpu#42.=
nr_load_updates
     15092 =C2=B1  6%     -38.6%       9266 =C2=B1 11%  sched_debug.cpu#42.=
sched_goidle
     34226 =C2=B1 15%     -39.8%      20619 =C2=B1  7%  sched_debug.cpu#42.=
sched_count
     40484 =C2=B1 32%     -50.5%      20037 =C2=B1  8%  sched_debug.cpu#43.=
sched_count
     39020 =C2=B1  1%     -34.0%      25762 =C2=B1  5%  sched_debug.cpu#43.=
nr_load_updates
     90649 =C2=B1  0%     -25.0%      67960 =C2=B1  2%  sched_debug.cpu#43.=
clock
     90649 =C2=B1  0%     -25.0%      67960 =C2=B1  2%  sched_debug.cpu#43.=
clock_task
     19532 =C2=B1  8%     -41.9%      11352 =C2=B1  4%  sched_debug.cpu#43.=
ttwu_count
     32518 =C2=B1  7%     -40.2%      19434 =C2=B1  8%  sched_debug.cpu#43.=
nr_switches
     15525 =C2=B1  7%     -40.4%       9247 =C2=B1  9%  sched_debug.cpu#43.=
sched_goidle
     15616 =C2=B1 11%     -37.7%       9733 =C2=B1 13%  sched_debug.cpu#44.=
sched_goidle
     38624 =C2=B1  1%     -34.0%      25486 =C2=B1  5%  sched_debug.cpu#44.=
nr_load_updates
     18651 =C2=B1  4%     -37.5%      11659 =C2=B1 11%  sched_debug.cpu#44.=
ttwu_count
     32637 =C2=B1 11%     -37.3%      20450 =C2=B1 14%  sched_debug.cpu#44.=
nr_switches
     90651 =C2=B1  0%     -25.0%      67961 =C2=B1  2%  sched_debug.cpu#44.=
clock_task
     90651 =C2=B1  0%     -25.0%      67961 =C2=B1  2%  sched_debug.cpu#44.=
clock
       442 =C2=B1 20%     -35.8%        283 =C2=B1 16%  sched_debug.cpu#45.=
ttwu_local
     16235 =C2=B1 10%     -43.2%       9215 =C2=B1  5%  sched_debug.cpu#45.=
sched_goidle
         8 =C2=B1 13%     -27.3%          6 =C2=B1  6%  sched_debug.cpu#45.=
load
     34358 =C2=B1 10%     -42.8%      19657 =C2=B1  5%  sched_debug.cpu#45.=
sched_count
         7 =C2=B1 14%     -32.7%          5 =C2=B1  8%  sched_debug.cpu#45.=
cpu_load[4]
     90654 =C2=B1  0%     -25.0%      67963 =C2=B1  2%  sched_debug.cpu#45.=
clock_task
     90654 =C2=B1  0%     -25.0%      67963 =C2=B1  2%  sched_debug.cpu#45.=
clock
     18519 =C2=B1  4%     -37.7%      11529 =C2=B1  1%  sched_debug.cpu#45.=
ttwu_count
     38473 =C2=B1  1%     -32.7%      25897 =C2=B1  5%  sched_debug.cpu#45.=
nr_load_updates
     34030 =C2=B1 10%     -42.9%      19442 =C2=B1  5%  sched_debug.cpu#45.=
nr_switches
     31035 =C2=B1  7%     -30.0%      21710 =C2=B1  9%  sched_debug.cpu#46.=
nr_switches
         9 =C2=B1  9%     -30.6%          6 =C2=B1  6%  sched_debug.cpu#46.=
load
     38734 =C2=B1  1%     -32.6%      26094 =C2=B1  6%  sched_debug.cpu#46.=
nr_load_updates
     18698 =C2=B1  3%     -37.8%      11637 =C2=B1  3%  sched_debug.cpu#46.=
ttwu_count
     14743 =C2=B1  7%     -30.1%      10299 =C2=B1  9%  sched_debug.cpu#46.=
sched_goidle
     90655 =C2=B1  0%     -25.0%      67964 =C2=B1  2%  sched_debug.cpu#46.=
clock
     90655 =C2=B1  0%     -25.0%      67964 =C2=B1  2%  sched_debug.cpu#46.=
clock_task
     32109 =C2=B1  8%     -32.0%      21823 =C2=B1  9%  sched_debug.cpu#46.=
sched_count
     33001 =C2=B1  9%     -33.1%      22065 =C2=B1  2%  sched_debug.cpu#47.=
sched_count
     90658 =C2=B1  0%     -25.0%      67966 =C2=B1  2%  sched_debug.cpu#47.=
clock_task
     15406 =C2=B1 10%     -32.2%      10441 =C2=B1  2%  sched_debug.cpu#47.=
sched_goidle
     32247 =C2=B1  9%     -31.9%      21966 =C2=B1  2%  sched_debug.cpu#47.=
nr_switches
     18768 =C2=B1  3%     -39.0%      11444 =C2=B1  3%  sched_debug.cpu#47.=
ttwu_count
     38858 =C2=B1  0%     -33.8%      25720 =C2=B1  5%  sched_debug.cpu#47.=
nr_load_updates
     90658 =C2=B1  0%     -25.0%      67966 =C2=B1  2%  sched_debug.cpu#47.=
clock
     18889 =C2=B1  3%     -37.4%      11826 =C2=B1  8%  sched_debug.cpu#48.=
ttwu_count
     38874 =C2=B1  0%     -34.4%      25520 =C2=B1  4%  sched_debug.cpu#48.=
nr_load_updates
    501862 =C2=B1 10%     +34.5%     675232 =C2=B1 28%  sched_debug.cpu#48.=
avg_idle
     33614 =C2=B1 11%     -35.1%      21802 =C2=B1  7%  sched_debug.cpu#48.=
sched_count
     90659 =C2=B1  0%     -25.0%      67967 =C2=B1  2%  sched_debug.cpu#48.=
clock
     90659 =C2=B1  0%     -25.0%      67967 =C2=B1  2%  sched_debug.cpu#48.=
clock_task
     15685 =C2=B1 13%     -35.0%      10190 =C2=B1  7%  sched_debug.cpu#48.=
sched_goidle
     32926 =C2=B1 13%     -35.0%      21386 =C2=B1  7%  sched_debug.cpu#48.=
nr_switches
     35936 =C2=B1 11%     -44.1%      20103 =C2=B1  5%  sched_debug.cpu#49.=
sched_count
    391811 =C2=B1 19%     +77.4%     695129 =C2=B1 29%  sched_debug.cpu#49.=
avg_idle
     38653 =C2=B1  0%     -33.7%      25628 =C2=B1  4%  sched_debug.cpu#49.=
nr_load_updates
     34155 =C2=B1  9%     -41.7%      19899 =C2=B1  5%  sched_debug.cpu#49.=
nr_switches
     90662 =C2=B1  0%     -25.0%      67969 =C2=B1  2%  sched_debug.cpu#49.=
clock
     19250 =C2=B1  4%     -40.6%      11442 =C2=B1  1%  sched_debug.cpu#49.=
ttwu_count
     90662 =C2=B1  0%     -25.0%      67969 =C2=B1  2%  sched_debug.cpu#49.=
clock_task
     16294 =C2=B1  8%     -42.0%       9449 =C2=B1  4%  sched_debug.cpu#49.=
sched_goidle
     19013 =C2=B1  2%     -38.8%      11637 =C2=B1  2%  sched_debug.cpu#5.t=
twu_count
     33861 =C2=B1  4%     -39.9%      20355 =C2=B1  5%  sched_debug.cpu#5.n=
r_switches
     90564 =C2=B1  0%     -25.0%      67896 =C2=B1  2%  sched_debug.cpu#5.c=
lock
         8 =C2=B1 11%     -50.0%          4 =C2=B1  0%  sched_debug.cpu#5.c=
pu_load[4]
     90564 =C2=B1  0%     -25.0%      67896 =C2=B1  2%  sched_debug.cpu#5.c=
lock_task
     39344 =C2=B1  2%     -33.1%      26340 =C2=B1  5%  sched_debug.cpu#5.n=
r_load_updates
     34234 =C2=B1  5%     -38.0%      21242 =C2=B1  3%  sched_debug.cpu#5.s=
ched_count
    403434 =C2=B1 20%     +62.6%     656022 =C2=B1 30%  sched_debug.cpu#5.a=
vg_idle
         8 =C2=B1 11%     -56.2%          3 =C2=B1 42%  sched_debug.cpu#5.c=
pu_load[1]
     16160 =C2=B1  4%     -39.9%       9719 =C2=B1  5%  sched_debug.cpu#5.s=
ched_goidle
         8 =C2=B1 11%     -50.0%          4 =C2=B1 35%  sched_debug.cpu#5.c=
pu_load[2]
         8 =C2=B1 11%     -50.0%          4 =C2=B1 17%  sched_debug.cpu#5.c=
pu_load[3]
     90664 =C2=B1  0%     -25.0%      67970 =C2=B1  2%  sched_debug.cpu#50.=
clock
     38696 =C2=B1  1%     -33.6%      25679 =C2=B1  6%  sched_debug.cpu#50.=
nr_load_updates
     31988 =C2=B1 15%     -32.5%      21577 =C2=B1  7%  sched_debug.cpu#50.=
nr_switches
     90664 =C2=B1  0%     -25.0%      67970 =C2=B1  2%  sched_debug.cpu#50.=
clock_task
    521205 =C2=B1 17%     +25.0%     651642 =C2=B1 21%  sched_debug.cpu#50.=
avg_idle
     19830 =C2=B1 12%     -41.7%      11563 =C2=B1  3%  sched_debug.cpu#50.=
ttwu_count
     15227 =C2=B1 15%     -33.1%      10194 =C2=B1  7%  sched_debug.cpu#50.=
sched_goidle
     37867 =C2=B1 21%     -42.5%      21780 =C2=B1  8%  sched_debug.cpu#50.=
sched_count
     34102 =C2=B1  9%     -38.7%      20908 =C2=B1  7%  sched_debug.cpu#51.=
sched_count
     32664 =C2=B1 10%     -36.7%      20683 =C2=B1  8%  sched_debug.cpu#51.=
nr_switches
     18711 =C2=B1  4%     -38.4%      11528 =C2=B1  2%  sched_debug.cpu#51.=
ttwu_count
     90666 =C2=B1  0%     -25.0%      67972 =C2=B1  2%  sched_debug.cpu#51.=
clock_task
     90666 =C2=B1  0%     -25.0%      67972 =C2=B1  2%  sched_debug.cpu#51.=
clock
     15610 =C2=B1 10%     -36.9%       9851 =C2=B1  8%  sched_debug.cpu#51.=
sched_goidle
     38638 =C2=B1  1%     -33.9%      25535 =C2=B1  5%  sched_debug.cpu#51.=
nr_load_updates
     18859 =C2=B1  4%     -33.9%      12463 =C2=B1 12%  sched_debug.cpu#52.=
ttwu_count
     38713 =C2=B1  0%     -33.7%      25647 =C2=B1  4%  sched_debug.cpu#52.=
nr_load_updates
     36812 =C2=B1  8%     -44.5%      20413 =C2=B1  2%  sched_debug.cpu#52.=
sched_count
     35679 =C2=B1  9%     -43.1%      20305 =C2=B1  2%  sched_debug.cpu#52.=
nr_switches
     90668 =C2=B1  0%     -25.0%      67973 =C2=B1  2%  sched_debug.cpu#52.=
clock_task
         6 =C2=B1 12%     -37.5%          4 =C2=B1 30%  sched_debug.cpu#52.=
cpu_load[4]
     90668 =C2=B1  0%     -25.0%      67973 =C2=B1  2%  sched_debug.cpu#52.=
clock
     17073 =C2=B1  9%     -43.7%       9619 =C2=B1  2%  sched_debug.cpu#52.=
sched_goidle
     35871 =C2=B1 13%     -43.6%      20248 =C2=B1  5%  sched_debug.cpu#53.=
nr_switches
    454676 =C2=B1 19%     +61.2%     732911 =C2=B1 29%  sched_debug.cpu#53.=
avg_idle
         8 =C2=B1 24%     -58.3%          3 =C2=B1 42%  sched_debug.cpu#53.=
cpu_load[4]
     17164 =C2=B1 14%     -44.2%       9580 =C2=B1  5%  sched_debug.cpu#53.=
sched_goidle
     36328 =C2=B1 13%     -43.8%      20431 =C2=B1  5%  sched_debug.cpu#53.=
sched_count
     18434 =C2=B1  3%     -37.7%      11479 =C2=B1  5%  sched_debug.cpu#53.=
ttwu_count
     38453 =C2=B1  0%     -33.4%      25598 =C2=B1  6%  sched_debug.cpu#53.=
nr_load_updates
     90671 =C2=B1  0%     -25.0%      67975 =C2=B1  2%  sched_debug.cpu#53.=
clock_task
     90671 =C2=B1  0%     -25.0%      67975 =C2=B1  2%  sched_debug.cpu#53.=
clock
     16166 =C2=B1  4%     -36.6%      10245 =C2=B1  8%  sched_debug.cpu#54.=
sched_goidle
       481 =C2=B1 39%     -42.9%        275 =C2=B1 13%  sched_debug.cpu#54.=
ttwu_local
     34486 =C2=B1  5%     -35.5%      22255 =C2=B1  9%  sched_debug.cpu#54.=
sched_count
     18495 =C2=B1  3%     -37.9%      11477 =C2=B1  3%  sched_debug.cpu#54.=
ttwu_count
     38239 =C2=B1  1%     -32.3%      25886 =C2=B1  6%  sched_debug.cpu#54.=
nr_load_updates
     33897 =C2=B1  4%     -36.4%      21573 =C2=B1  8%  sched_debug.cpu#54.=
nr_switches
     90672 =C2=B1  0%     -25.0%      67976 =C2=B1  2%  sched_debug.cpu#54.=
clock
     90672 =C2=B1  0%     -25.0%      67976 =C2=B1  2%  sched_debug.cpu#54.=
clock_task
     38452 =C2=B1  0%     -33.1%      25729 =C2=B1  5%  sched_debug.cpu#55.=
nr_load_updates
     18561 =C2=B1  4%     -32.4%      12540 =C2=B1 14%  sched_debug.cpu#55.=
ttwu_count
     16154 =C2=B1  9%     -39.9%       9707 =C2=B1  2%  sched_debug.cpu#55.=
sched_goidle
     33959 =C2=B1 10%     -40.0%      20376 =C2=B1  2%  sched_debug.cpu#55.=
nr_switches
     90675 =C2=B1  0%     -25.0%      67978 =C2=B1  2%  sched_debug.cpu#55.=
clock
     90675 =C2=B1  0%     -25.0%      67978 =C2=B1  2%  sched_debug.cpu#55.=
clock_task
    525439 =C2=B1 12%     +30.7%     686892 =C2=B1 24%  sched_debug.cpu#55.=
avg_idle
     34452 =C2=B1 10%     -39.5%      20841 =C2=B1  3%  sched_debug.cpu#55.=
sched_count
     18503 =C2=B1  3%     -36.3%      11783 =C2=B1  2%  sched_debug.cpu#56.=
ttwu_count
     90678 =C2=B1  0%     -25.0%      67979 =C2=B1  2%  sched_debug.cpu#56.=
clock
    468405 =C2=B1 18%     +43.1%     670213 =C2=B1 28%  sched_debug.cpu#56.=
avg_idle
     15812 =C2=B1 10%     -37.9%       9817 =C2=B1  6%  sched_debug.cpu#56.=
sched_goidle
     38342 =C2=B1  1%     -32.8%      25753 =C2=B1  5%  sched_debug.cpu#56.=
nr_load_updates
     90678 =C2=B1  0%     -25.0%      67979 =C2=B1  2%  sched_debug.cpu#56.=
clock_task
     33146 =C2=B1  9%     -37.6%      20687 =C2=B1  5%  sched_debug.cpu#56.=
nr_switches
     33624 =C2=B1 10%     -36.9%      21215 =C2=B1  5%  sched_debug.cpu#56.=
sched_count
    524114 =C2=B1 11%     +28.8%     674982 =C2=B1  8%  sched_debug.cpu#57.=
avg_idle
     16368 =C2=B1 11%     -40.4%       9751 =C2=B1  8%  sched_debug.cpu#57.=
sched_goidle
     90680 =C2=B1  0%     -25.0%      67981 =C2=B1  2%  sched_debug.cpu#57.=
clock_task
     90680 =C2=B1  0%     -25.0%      67981 =C2=B1  2%  sched_debug.cpu#57.=
clock
     34244 =C2=B1 11%     -39.8%      20602 =C2=B1  7%  sched_debug.cpu#57.=
nr_switches
     19401 =C2=B1  8%     -41.4%      11371 =C2=B1  1%  sched_debug.cpu#57.=
ttwu_count
     34953 =C2=B1 10%     -39.6%      21128 =C2=B1  7%  sched_debug.cpu#57.=
sched_count
     38525 =C2=B1  1%     -33.9%      25472 =C2=B1  5%  sched_debug.cpu#57.=
nr_load_updates
     90682 =C2=B1  0%     -25.0%      67983 =C2=B1  2%  sched_debug.cpu#58.=
clock_task
     90682 =C2=B1  0%     -25.0%      67983 =C2=B1  2%  sched_debug.cpu#58.=
clock
     38256 =C2=B1  1%     -33.4%      25467 =C2=B1  5%  sched_debug.cpu#58.=
nr_load_updates
     33405 =C2=B1  4%     -37.9%      20748 =C2=B1  9%  sched_debug.cpu#58.=
nr_switches
     34124 =C2=B1  4%     -38.9%      20851 =C2=B1  8%  sched_debug.cpu#58.=
sched_count
     18508 =C2=B1  4%     -32.9%      12412 =C2=B1 16%  sched_debug.cpu#58.=
ttwu_count
     15868 =C2=B1  4%     -37.7%       9889 =C2=B1  9%  sched_debug.cpu#58.=
sched_goidle
     90684 =C2=B1  0%     -25.0%      67985 =C2=B1  2%  sched_debug.cpu#59.=
clock
     31413 =C2=B1 10%     -30.8%      21737 =C2=B1  6%  sched_debug.cpu#59.=
nr_switches
     14960 =C2=B1 10%     -30.6%      10376 =C2=B1  6%  sched_debug.cpu#59.=
sched_goidle
     90684 =C2=B1  0%     -25.0%      67985 =C2=B1  2%  sched_debug.cpu#59.=
clock_task
     19948 =C2=B1 13%     -43.2%      11336 =C2=B1  2%  sched_debug.cpu#59.=
ttwu_count
    451299 =C2=B1  9%     +44.4%     651672 =C2=B1 30%  sched_debug.cpu#59.=
avg_idle
     38591 =C2=B1  1%     -34.1%      25415 =C2=B1  5%  sched_debug.cpu#59.=
nr_load_updates
     33458 =C2=B1 14%     -34.0%      22071 =C2=B1  5%  sched_debug.cpu#59.=
sched_count
     39449 =C2=B1  1%     -33.5%      26227 =C2=B1  5%  sched_debug.cpu#6.n=
r_load_updates
     15311 =C2=B1  7%     -36.2%       9766 =C2=B1 10%  sched_debug.cpu#6.s=
ched_goidle
     90566 =C2=B1  0%     -25.0%      67898 =C2=B1  2%  sched_debug.cpu#6.c=
lock
     19104 =C2=B1  2%     -40.0%      11459 =C2=B1  1%  sched_debug.cpu#6.t=
twu_count
     90566 =C2=B1  0%     -25.0%      67898 =C2=B1  2%  sched_debug.cpu#6.c=
lock_task
     32063 =C2=B1  7%     -35.9%      20551 =C2=B1 10%  sched_debug.cpu#6.n=
r_switches
     32457 =C2=B1  7%     -36.2%      20703 =C2=B1 10%  sched_debug.cpu#6.s=
ched_count
       523 =C2=B1 42%     -39.7%        315 =C2=B1 39%  sched_debug.cpu#6.t=
twu_local
    425559 =C2=B1 12%     +73.4%     737998 =C2=B1 25%  sched_debug.cpu#6.a=
vg_idle
     29745 =C2=B1  6%     -30.2%      20765 =C2=B1  9%  sched_debug.cpu#60.=
nr_load_updates
     90685 =C2=B1  0%     -25.0%      67986 =C2=B1  2%  sched_debug.cpu#60.=
clock
     28585 =C2=B1 17%     -40.9%      16882 =C2=B1 10%  sched_debug.cpu#60.=
sched_count
     28418 =C2=B1 17%     -40.8%      16820 =C2=B1 10%  sched_debug.cpu#60.=
nr_switches
     13342 =C2=B1 17%     -41.4%       7817 =C2=B1 10%  sched_debug.cpu#60.=
sched_goidle
     90685 =C2=B1  0%     -25.0%      67986 =C2=B1  2%  sched_debug.cpu#60.=
clock_task
     12024 =C2=B1 11%     -34.8%       7841 =C2=B1 10%  sched_debug.cpu#60.=
ttwu_count
       529 =C2=B1 29%     -56.3%        231 =C2=B1 18%  sched_debug.cpu#60.=
ttwu_local
     29658 =C2=B1  6%     -31.8%      20230 =C2=B1  9%  sched_debug.cpu#61.=
nr_load_updates
       465 =C2=B1  7%     -54.9%        210 =C2=B1 12%  sched_debug.cpu#61.=
ttwu_local
     90688 =C2=B1  0%     -25.0%      67988 =C2=B1  2%  sched_debug.cpu#61.=
clock
     27811 =C2=B1 14%     -37.0%      17529 =C2=B1 11%  sched_debug.cpu#61.=
sched_count
     90688 =C2=B1  0%     -25.0%      67988 =C2=B1  2%  sched_debug.cpu#61.=
clock_task
     11996 =C2=B1 12%     -40.5%       7142 =C2=B1  5%  sched_debug.cpu#61.=
ttwu_count
     12690 =C2=B1 12%     -36.2%       8101 =C2=B1 11%  sched_debug.cpu#61.=
sched_goidle
     27200 =C2=B1 12%     -36.1%      17381 =C2=B1 11%  sched_debug.cpu#61.=
nr_switches
     90689 =C2=B1  0%     -25.0%      67989 =C2=B1  2%  sched_debug.cpu#62.=
clock_task
       471 =C2=B1 22%     -45.8%        255 =C2=B1  9%  sched_debug.cpu#62.=
ttwu_local
     90689 =C2=B1  0%     -25.0%      67989 =C2=B1  2%  sched_debug.cpu#62.=
clock
     11952 =C2=B1  8%     -39.3%       7253 =C2=B1  2%  sched_debug.cpu#62.=
ttwu_count
     29603 =C2=B1  4%     -32.0%      20127 =C2=B1  9%  sched_debug.cpu#62.=
nr_load_updates
     90693 =C2=B1  0%     -25.0%      67991 =C2=B1  2%  sched_debug.cpu#63.=
clock
     25824 =C2=B1  8%     -28.8%      18399 =C2=B1 23%  sched_debug.cpu#63.=
sched_count
       516 =C2=B1 25%     -39.1%        314 =C2=B1 32%  sched_debug.cpu#63.=
ttwu_local
     11897 =C2=B1  8%     -37.1%       7485 =C2=B1  7%  sched_debug.cpu#63.=
ttwu_count
     11779 =C2=B1  9%     -27.9%       8493 =C2=B1 24%  sched_debug.cpu#63.=
sched_goidle
     29378 =C2=B1  5%     -31.0%      20270 =C2=B1 10%  sched_debug.cpu#63.=
nr_load_updates
     25289 =C2=B1  8%     -28.0%      18201 =C2=B1 23%  sched_debug.cpu#63.=
nr_switches
     90693 =C2=B1  0%     -25.0%      67991 =C2=B1  2%  sched_debug.cpu#63.=
clock_task
     12854 =C2=B1  9%     -34.1%       8464 =C2=B1 12%  sched_debug.cpu#64.=
sched_goidle
     90693 =C2=B1  0%     -25.0%      67993 =C2=B1  2%  sched_debug.cpu#64.=
clock_task
     29721 =C2=B1  3%     -31.5%      20354 =C2=B1  9%  sched_debug.cpu#64.=
nr_load_updates
       439 =C2=B1 25%     -51.9%        211 =C2=B1 14%  sched_debug.cpu#64.=
ttwu_local
     27640 =C2=B1 10%     -32.4%      18679 =C2=B1 13%  sched_debug.cpu#64.=
sched_count
     11925 =C2=B1  6%     -38.6%       7325 =C2=B1  4%  sched_debug.cpu#64.=
ttwu_count
     90693 =C2=B1  0%     -25.0%      67993 =C2=B1  2%  sched_debug.cpu#64.=
clock
     27435 =C2=B1 10%     -33.9%      18126 =C2=B1 13%  sched_debug.cpu#64.=
nr_switches
     26501 =C2=B1 10%     -35.0%      17225 =C2=B1  5%  sched_debug.cpu#65.=
sched_count
     12249 =C2=B1 10%     -39.3%       7431 =C2=B1  9%  sched_debug.cpu#65.=
sched_goidle
     26288 =C2=B1 10%     -39.4%      15936 =C2=B1  9%  sched_debug.cpu#65.=
nr_switches
     29150 =C2=B1  4%     -30.0%      20400 =C2=B1  9%  sched_debug.cpu#65.=
nr_load_updates
     90696 =C2=B1  0%     -25.0%      67994 =C2=B1  2%  sched_debug.cpu#65.=
clock_task
     90696 =C2=B1  0%     -25.0%      67994 =C2=B1  2%  sched_debug.cpu#65.=
clock
     11594 =C2=B1  7%     -29.1%       8216 =C2=B1 15%  sched_debug.cpu#65.=
ttwu_count
       409 =C2=B1 19%     -48.6%        210 =C2=B1 19%  sched_debug.cpu#65.=
ttwu_local
     11956 =C2=B1 12%     -32.7%       8051 =C2=B1 12%  sched_debug.cpu#66.=
sched_goidle
     29252 =C2=B1  4%     -30.5%      20336 =C2=B1  9%  sched_debug.cpu#66.=
nr_load_updates
     11615 =C2=B1  8%     -36.6%       7369 =C2=B1  2%  sched_debug.cpu#66.=
ttwu_count
     25794 =C2=B1 12%     -33.3%      17192 =C2=B1 13%  sched_debug.cpu#66.=
nr_switches
     90697 =C2=B1  0%     -25.0%      67996 =C2=B1  2%  sched_debug.cpu#66.=
clock
     26269 =C2=B1  9%     -33.9%      17351 =C2=B1 14%  sched_debug.cpu#66.=
sched_count
     90697 =C2=B1  0%     -25.0%      67996 =C2=B1  2%  sched_debug.cpu#66.=
clock_task
     27568 =C2=B1 15%     -32.9%      18497 =C2=B1 11%  sched_debug.cpu#67.=
sched_count
     90701 =C2=B1  0%     -25.0%      67998 =C2=B1  2%  sched_debug.cpu#67.=
clock
     90701 =C2=B1  0%     -25.0%      67998 =C2=B1  2%  sched_debug.cpu#67.=
clock_task
     29426 =C2=B1  5%     -30.3%      20504 =C2=B1  9%  sched_debug.cpu#67.=
nr_load_updates
     11809 =C2=B1  9%     -35.9%       7571 =C2=B1  3%  sched_debug.cpu#67.=
ttwu_count
       502 =C2=B1 45%     -46.9%        267 =C2=B1 22%  sched_debug.cpu#67.=
ttwu_local
     12630 =C2=B1 15%     -32.1%       8575 =C2=B1 11%  sched_debug.cpu#67.=
sched_goidle
     26984 =C2=B1 15%     -32.5%      18227 =C2=B1 11%  sched_debug.cpu#67.=
nr_switches
     11999 =C2=B1  7%     -39.8%       7224 =C2=B1  7%  sched_debug.cpu#68.=
ttwu_count
       523 =C2=B1 24%     -52.5%        249 =C2=B1 18%  sched_debug.cpu#68.=
ttwu_local
     31421 =C2=B1 13%     -40.7%      18645 =C2=B1 14%  sched_debug.cpu#68.=
sched_count
         2 =C2=B1 20%    +108.3%          5 =C2=B1 31%  sched_debug.cpu#68.=
cpu_load[2]
     90702 =C2=B1  0%     -25.0%      67999 =C2=B1  2%  sched_debug.cpu#68.=
clock_task
     30820 =C2=B1 12%     -39.7%      18586 =C2=B1 14%  sched_debug.cpu#68.=
nr_switches
    657912 =C2=B1 15%     -27.6%     476168 =C2=B1 15%  sched_debug.cpu#68.=
avg_idle
     29280 =C2=B1  4%     -31.3%      20117 =C2=B1 11%  sched_debug.cpu#68.=
nr_load_updates
         2 =C2=B1 30%    +140.4%          6 =C2=B1 45%  sched_debug.cpu#68.=
cpu_load[3]
     14501 =C2=B1 12%     -40.0%       8694 =C2=B1 15%  sched_debug.cpu#68.=
sched_goidle
     90702 =C2=B1  0%     -25.0%      67999 =C2=B1  2%  sched_debug.cpu#68.=
clock
     13980 =C2=B1 13%     -44.5%       7762 =C2=B1 12%  sched_debug.cpu#69.=
sched_goidle
     29427 =C2=B1  5%     -31.4%      20196 =C2=B1  9%  sched_debug.cpu#69.=
nr_load_updates
     30492 =C2=B1 13%     -45.0%      16767 =C2=B1 13%  sched_debug.cpu#69.=
sched_count
     90705 =C2=B1  0%     -25.0%      67999 =C2=B1  2%  sched_debug.cpu#69.=
clock
     29866 =C2=B1 13%     -44.4%      16598 =C2=B1 13%  sched_debug.cpu#69.=
nr_switches
     90705 =C2=B1  0%     -25.0%      67999 =C2=B1  2%  sched_debug.cpu#69.=
clock_task
       617 =C2=B1 49%     -62.5%        231 =C2=B1 20%  sched_debug.cpu#69.=
ttwu_local
     11879 =C2=B1 10%     -39.0%       7249 =C2=B1  4%  sched_debug.cpu#69.=
ttwu_count
     31437 =C2=B1 13%     -36.6%      19921 =C2=B1  6%  sched_debug.cpu#7.n=
r_switches
     90568 =C2=B1  0%     -25.0%      67899 =C2=B1  2%  sched_debug.cpu#7.c=
lock_task
     90568 =C2=B1  0%     -25.0%      67899 =C2=B1  2%  sched_debug.cpu#7.c=
lock
     39418 =C2=B1  1%     -33.5%      26199 =C2=B1  5%  sched_debug.cpu#7.n=
r_load_updates
     18881 =C2=B1  3%     -40.5%      11241 =C2=B1  1%  sched_debug.cpu#7.t=
twu_count
     14971 =C2=B1 13%     -36.8%       9469 =C2=B1  6%  sched_debug.cpu#7.s=
ched_goidle
     32077 =C2=B1 12%     -33.1%      21443 =C2=B1 13%  sched_debug.cpu#7.s=
ched_count
       443 =C2=B1 30%     -38.2%        274 =C2=B1  4%  sched_debug.cpu#7.t=
twu_local
    505329 =C2=B1 18%     +44.0%     727702 =C2=B1 21%  sched_debug.cpu#7.a=
vg_idle
     11575 =C2=B1  9%     -36.8%       7314 =C2=B1  3%  sched_debug.cpu#70.=
ttwu_count
       448 =C2=B1 25%     -56.3%        195 =C2=B1 18%  sched_debug.cpu#70.=
ttwu_local
     25048 =C2=B1 13%     -35.4%      16193 =C2=B1  8%  sched_debug.cpu#70.=
nr_switches
     25391 =C2=B1 12%     -36.0%      16254 =C2=B1  8%  sched_debug.cpu#70.=
sched_count
     11649 =C2=B1 13%     -35.7%       7495 =C2=B1  8%  sched_debug.cpu#70.=
sched_goidle
     90708 =C2=B1  0%     -25.0%      68001 =C2=B1  2%  sched_debug.cpu#70.=
clock_task
     90708 =C2=B1  0%     -25.0%      68001 =C2=B1  2%  sched_debug.cpu#70.=
clock
     28922 =C2=B1  5%     -29.9%      20279 =C2=B1  8%  sched_debug.cpu#70.=
nr_load_updates
     90710 =C2=B1  0%     -25.0%      68002 =C2=B1  2%  sched_debug.cpu#71.=
clock_task
       436 =C2=B1 22%     -52.2%        208 =C2=B1 11%  sched_debug.cpu#71.=
ttwu_local
     90710 =C2=B1  0%     -25.0%      68002 =C2=B1  2%  sched_debug.cpu#71.=
clock
     29370 =C2=B1  5%     -31.9%      19999 =C2=B1  9%  sched_debug.cpu#71.=
nr_load_updates
     11824 =C2=B1 10%     -39.8%       7122 =C2=B1  3%  sched_debug.cpu#71.=
ttwu_count
     11629 =C2=B1  9%     -39.3%       7065 =C2=B1  9%  sched_debug.cpu#72.=
ttwu_count
     29117 =C2=B1  4%     -31.8%      19871 =C2=B1 10%  sched_debug.cpu#72.=
nr_load_updates
     28593 =C2=B1  9%     -41.3%      16771 =C2=B1  6%  sched_debug.cpu#72.=
nr_switches
     90712 =C2=B1  0%     -25.0%      68004 =C2=B1  2%  sched_debug.cpu#72.=
clock
       433 =C2=B1 17%     -46.5%        232 =C2=B1 13%  sched_debug.cpu#72.=
ttwu_local
    555791 =C2=B1 13%     +57.8%     877145 =C2=B1 19%  sched_debug.cpu#72.=
avg_idle
     28741 =C2=B1  9%     -39.1%      17506 =C2=B1  6%  sched_debug.cpu#72.=
sched_count
     13415 =C2=B1  9%     -41.8%       7807 =C2=B1  6%  sched_debug.cpu#72.=
sched_goidle
     90712 =C2=B1  0%     -25.0%      68004 =C2=B1  2%  sched_debug.cpu#72.=
clock_task
     90714 =C2=B1  0%     -25.0%      68006 =C2=B1  2%  sched_debug.cpu#73.=
clock
     28430 =C2=B1 17%     -41.6%      16601 =C2=B1  3%  sched_debug.cpu#73.=
sched_count
     27853 =C2=B1 17%     -40.6%      16540 =C2=B1  3%  sched_debug.cpu#73.=
nr_switches
     90714 =C2=B1  0%     -25.0%      68006 =C2=B1  2%  sched_debug.cpu#73.=
clock_task
     13084 =C2=B1 17%     -41.2%       7695 =C2=B1  2%  sched_debug.cpu#73.=
sched_goidle
     29461 =C2=B1  4%     -31.5%      20183 =C2=B1  9%  sched_debug.cpu#73.=
nr_load_updates
       474 =C2=B1 43%     -56.1%        208 =C2=B1 20%  sched_debug.cpu#73.=
ttwu_local
     11913 =C2=B1  9%     -37.4%       7457 =C2=B1  7%  sched_debug.cpu#73.=
ttwu_count
     90716 =C2=B1  0%     -25.0%      68007 =C2=B1  2%  sched_debug.cpu#74.=
clock
     29385 =C2=B1  6%     -32.2%      19935 =C2=B1 10%  sched_debug.cpu#74.=
nr_load_updates
     11828 =C2=B1 11%     -39.3%       7180 =C2=B1  5%  sched_debug.cpu#74.=
ttwu_count
     90716 =C2=B1  0%     -25.0%      68007 =C2=B1  2%  sched_debug.cpu#74.=
clock_task
     25577 =C2=B1  6%     -41.4%      14982 =C2=B1 16%  sched_debug.cpu#75.=
sched_count
     29859 =C2=B1  1%     -34.4%      19589 =C2=B1  8%  sched_debug.cpu#75.=
nr_load_updates
     90719 =C2=B1  0%     -25.0%      68010 =C2=B1  2%  sched_debug.cpu#75.=
clock
     25432 =C2=B1  6%     -42.1%      14720 =C2=B1 17%  sched_debug.cpu#75.=
nr_switches
     11771 =C2=B1  7%     -41.7%       6861 =C2=B1 17%  sched_debug.cpu#75.=
sched_goidle
     12344 =C2=B1  5%     -43.7%       6946 =C2=B1  6%  sched_debug.cpu#75.=
ttwu_count
     90719 =C2=B1  0%     -25.0%      68010 =C2=B1  2%  sched_debug.cpu#75.=
clock_task
     12877 =C2=B1  7%     -47.7%       6740 =C2=B1  9%  sched_debug.cpu#76.=
ttwu_count
       469 =C2=B1 27%     -52.9%        221 =C2=B1 28%  sched_debug.cpu#76.=
ttwu_local
    565489 =C2=B1 21%     +33.6%     755517 =C2=B1 32%  sched_debug.cpu#76.=
avg_idle
     31072 =C2=B1 14%     -49.4%      15727 =C2=B1  7%  sched_debug.cpu#76.=
sched_count
     90720 =C2=B1  0%     -25.0%      68010 =C2=B1  2%  sched_debug.cpu#76.=
clock_task
     14367 =C2=B1 15%     -49.7%       7220 =C2=B1  8%  sched_debug.cpu#76.=
sched_goidle
     29911 =C2=B1  2%     -35.7%      19231 =C2=B1  9%  sched_debug.cpu#76.=
nr_load_updates
     90720 =C2=B1  0%     -25.0%      68010 =C2=B1  2%  sched_debug.cpu#76.=
clock
     30816 =C2=B1 15%     -49.6%      15528 =C2=B1  8%  sched_debug.cpu#76.=
nr_switches
     14083 =C2=B1 11%     -50.1%       7025 =C2=B1  7%  sched_debug.cpu#77.=
sched_goidle
     12443 =C2=B1  4%     -43.9%       6980 =C2=B1  5%  sched_debug.cpu#77.=
ttwu_count
     90723 =C2=B1  0%     -25.0%      68012 =C2=B1  2%  sched_debug.cpu#77.=
clock
     30215 =C2=B1 11%     -50.6%      14913 =C2=B1  6%  sched_debug.cpu#77.=
nr_switches
     30735 =C2=B1 12%     -50.7%      15155 =C2=B1  4%  sched_debug.cpu#77.=
sched_count
     90723 =C2=B1  0%     -25.0%      68012 =C2=B1  2%  sched_debug.cpu#77.=
clock_task
       448 =C2=B1 22%     -48.0%        232 =C2=B1 32%  sched_debug.cpu#77.=
ttwu_local
     29868 =C2=B1  2%     -34.9%      19444 =C2=B1  9%  sched_debug.cpu#77.=
nr_load_updates
     90725 =C2=B1  0%     -25.0%      68013 =C2=B1  2%  sched_debug.cpu#78.=
clock
     29599 =C2=B1  3%     -33.5%      19676 =C2=B1  8%  sched_debug.cpu#78.=
nr_load_updates
     13411 =C2=B1 10%     -44.2%       7488 =C2=B1  8%  sched_debug.cpu#78.=
sched_goidle
       506 =C2=B1 38%     -55.9%        223 =C2=B1 34%  sched_debug.cpu#78.=
ttwu_local
     29307 =C2=B1 10%     -44.4%      16286 =C2=B1  7%  sched_debug.cpu#78.=
sched_count
     90725 =C2=B1  0%     -25.0%      68013 =C2=B1  2%  sched_debug.cpu#78.=
clock_task
        40 =C2=B1 12%     -59.8%         16 =C2=B1 42%  sched_debug.cpu#78.=
nr_uninterruptible
     28949 =C2=B1 10%     -45.0%      15933 =C2=B1  8%  sched_debug.cpu#78.=
nr_switches
     12297 =C2=B1  5%     -42.0%       7128 =C2=B1  2%  sched_debug.cpu#78.=
ttwu_count
     12370 =C2=B1  5%     -43.7%       6961 =C2=B1  2%  sched_debug.cpu#79.=
ttwu_count
     29783 =C2=B1  2%     -36.2%      18999 =C2=B1  9%  sched_debug.cpu#79.=
nr_load_updates
     31081 =C2=B1  8%     -45.5%      16944 =C2=B1 11%  sched_debug.cpu#79.=
sched_count
     14146 =C2=B1  7%     -44.6%       7838 =C2=B1 14%  sched_debug.cpu#79.=
sched_goidle
     90727 =C2=B1  0%     -25.0%      68016 =C2=B1  2%  sched_debug.cpu#79.=
clock
     90727 =C2=B1  0%     -25.0%      68016 =C2=B1  2%  sched_debug.cpu#79.=
clock_task
       428 =C2=B1 21%     -43.6%        241 =C2=B1 21%  sched_debug.cpu#79.=
ttwu_local
     30200 =C2=B1  8%     -44.7%      16696 =C2=B1 14%  sched_debug.cpu#79.=
nr_switches
     17019 =C2=B1  6%     -41.8%       9904 =C2=B1 12%  sched_debug.cpu#8.s=
ched_goidle
     39571 =C2=B1  1%     -33.1%      26492 =C2=B1  4%  sched_debug.cpu#8.n=
r_load_updates
     90570 =C2=B1  0%     -25.0%      67901 =C2=B1  2%  sched_debug.cpu#8.c=
lock_task
     90570 =C2=B1  0%     -25.0%      67901 =C2=B1  2%  sched_debug.cpu#8.c=
lock
     18991 =C2=B1  2%     -39.8%      11434 =C2=B1  0%  sched_debug.cpu#8.t=
twu_count
     35616 =C2=B1  6%     -41.6%      20815 =C2=B1 12%  sched_debug.cpu#8.n=
r_switches
     35923 =C2=B1  6%     -40.7%      21318 =C2=B1 13%  sched_debug.cpu#8.s=
ched_count
         3 =C2=B1 34%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#80.=
cpu_load[2]
     29359 =C2=B1  2%     -34.6%      19206 =C2=B1  9%  sched_debug.cpu#80.=
nr_load_updates
     13147 =C2=B1 11%     -47.0%       6962 =C2=B1  2%  sched_debug.cpu#80.=
sched_goidle
    605921 =C2=B1 13%     +55.8%     943848 =C2=B1 12%  sched_debug.cpu#80.=
avg_idle
     28970 =C2=B1 11%     -47.8%      15129 =C2=B1  2%  sched_debug.cpu#80.=
sched_count
         3 =C2=B1 37%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#80.=
cpu_load[4]
     12167 =C2=B1  4%     -38.4%       7491 =C2=B1  9%  sched_debug.cpu#80.=
ttwu_count
     28156 =C2=B1 10%     -46.7%      15007 =C2=B1  2%  sched_debug.cpu#80.=
nr_switches
     90729 =C2=B1  0%     -25.0%      68016 =C2=B1  2%  sched_debug.cpu#80.=
clock
         3 =C2=B1 34%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#80.=
cpu_load[3]
     90729 =C2=B1  0%     -25.0%      68016 =C2=B1  2%  sched_debug.cpu#80.=
clock_task
         3 =C2=B1 28%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#80.=
cpu_load[1]
         3 =C2=B1 23%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#80.=
cpu_load[0]
     14049 =C2=B1 11%     -52.8%       6633 =C2=B1  9%  sched_debug.cpu#81.=
sched_goidle
     29895 =C2=B1  1%     -34.8%      19488 =C2=B1  9%  sched_debug.cpu#81.=
nr_load_updates
     90732 =C2=B1  0%     -25.0%      68017 =C2=B1  2%  sched_debug.cpu#81.=
clock_task
     13124 =C2=B1  9%     -40.6%       7793 =C2=B1 13%  sched_debug.cpu#81.=
ttwu_count
     30615 =C2=B1 10%     -53.8%      14145 =C2=B1  9%  sched_debug.cpu#81.=
sched_count
     30214 =C2=B1 10%     -53.4%      14080 =C2=B1  9%  sched_debug.cpu#81.=
nr_switches
     90732 =C2=B1  0%     -25.0%      68017 =C2=B1  2%  sched_debug.cpu#81.=
clock
     12762 =C2=B1  6%     -43.9%       7163 =C2=B1  9%  sched_debug.cpu#82.=
ttwu_count
     90734 =C2=B1  0%     -25.0%      68018 =C2=B1  2%  sched_debug.cpu#82.=
clock_task
     29797 =C2=B1  2%     -35.3%      19266 =C2=B1  9%  sched_debug.cpu#82.=
nr_load_updates
     90734 =C2=B1  0%     -25.0%      68018 =C2=B1  2%  sched_debug.cpu#82.=
clock
     28978 =C2=B1  2%     -49.1%      14752 =C2=B1  2%  sched_debug.cpu#82.=
sched_count
     13336 =C2=B1  2%     -48.7%       6846 =C2=B1  1%  sched_debug.cpu#82.=
sched_goidle
     28729 =C2=B1  2%     -49.2%      14597 =C2=B1  2%  sched_debug.cpu#82.=
nr_switches
     29584 =C2=B1  2%     -35.3%      19140 =C2=B1  8%  sched_debug.cpu#83.=
nr_load_updates
     14047 =C2=B1  6%     -50.6%       6942 =C2=B1 11%  sched_debug.cpu#83.=
sched_goidle
     30145 =C2=B1  6%     -50.4%      14945 =C2=B1 12%  sched_debug.cpu#83.=
sched_count
       449 =C2=B1 30%     -44.4%        249 =C2=B1 33%  sched_debug.cpu#83.=
ttwu_local
     90736 =C2=B1  0%     -25.0%      68021 =C2=B1  2%  sched_debug.cpu#83.=
clock_task
     12521 =C2=B1  5%     -44.9%       6905 =C2=B1  4%  sched_debug.cpu#83.=
ttwu_count
     90736 =C2=B1  0%     -25.0%      68021 =C2=B1  2%  sched_debug.cpu#83.=
clock
     29985 =C2=B1  5%     -50.4%      14887 =C2=B1 12%  sched_debug.cpu#83.=
nr_switches
     29638 =C2=B1  2%     -36.5%      18811 =C2=B1  7%  sched_debug.cpu#84.=
nr_load_updates
     13982 =C2=B1  5%     -49.1%       7116 =C2=B1  6%  sched_debug.cpu#84.=
sched_goidle
     90738 =C2=B1  0%     -25.0%      68023 =C2=B1  2%  sched_debug.cpu#84.=
clock
     12736 =C2=B1  9%     -48.9%       6504 =C2=B1  3%  sched_debug.cpu#84.=
ttwu_count
     90738 =C2=B1  0%     -25.0%      68023 =C2=B1  2%  sched_debug.cpu#84.=
clock_task
       439 =C2=B1 11%     -45.2%        240 =C2=B1 38%  sched_debug.cpu#84.=
ttwu_local
     30574 =C2=B1  4%     -48.3%      15806 =C2=B1  3%  sched_debug.cpu#84.=
sched_count
     29995 =C2=B1  5%     -49.2%      15237 =C2=B1  5%  sched_debug.cpu#84.=
nr_switches
     90740 =C2=B1  0%     -25.0%      68026 =C2=B1  2%  sched_debug.cpu#85.=
clock
     31484 =C2=B1  5%     -48.0%      16379 =C2=B1  7%  sched_debug.cpu#85.=
sched_count
       487 =C2=B1 27%     -43.1%        277 =C2=B1 33%  sched_debug.cpu#85.=
ttwu_local
     13005 =C2=B1  5%     -44.5%       7224 =C2=B1  8%  sched_debug.cpu#85.=
ttwu_count
     14478 =C2=B1  5%     -48.2%       7497 =C2=B1  7%  sched_debug.cpu#85.=
sched_goidle
     90740 =C2=B1  0%     -25.0%      68026 =C2=B1  2%  sched_debug.cpu#85.=
clock_task
     31068 =C2=B1  5%     -48.6%      15956 =C2=B1  7%  sched_debug.cpu#85.=
nr_switches
     29855 =C2=B1  2%     -34.5%      19559 =C2=B1  8%  sched_debug.cpu#85.=
nr_load_updates
     90743 =C2=B1  0%     -25.0%      68026 =C2=B1  2%  sched_debug.cpu#86.=
clock_task
     13307 =C2=B1 12%     -46.5%       7121 =C2=B1 13%  sched_debug.cpu#86.=
sched_goidle
     90743 =C2=B1  0%     -25.0%      68026 =C2=B1  2%  sched_debug.cpu#86.=
clock
     13716 =C2=B1  5%     -49.0%       6991 =C2=B1 10%  sched_debug.cpu#86.=
ttwu_count
     29249 =C2=B1 11%     -47.9%      15243 =C2=B1 11%  sched_debug.cpu#86.=
sched_count
     30246 =C2=B1  3%     -36.5%      19219 =C2=B1  9%  sched_debug.cpu#86.=
nr_load_updates
     28611 =C2=B1 11%     -47.0%      15176 =C2=B1 11%  sched_debug.cpu#86.=
nr_switches
     28144 =C2=B1  8%     -45.0%      15489 =C2=B1 13%  sched_debug.cpu#87.=
sched_count
     90744 =C2=B1  0%     -25.0%      68028 =C2=B1  2%  sched_debug.cpu#87.=
clock
     27784 =C2=B1  9%     -44.7%      15356 =C2=B1 13%  sched_debug.cpu#87.=
nr_switches
     12617 =C2=B1  3%     -42.7%       7235 =C2=B1  3%  sched_debug.cpu#87.=
ttwu_count
     90744 =C2=B1  0%     -25.0%      68028 =C2=B1  2%  sched_debug.cpu#87.=
clock_task
        40 =C2=B1 29%     -70.6%         12 =C2=B1 40%  sched_debug.cpu#87.=
nr_uninterruptible
     29553 =C2=B1  1%     -34.8%      19267 =C2=B1  9%  sched_debug.cpu#87.=
nr_load_updates
     12919 =C2=B1  8%     -45.2%       7074 =C2=B1 14%  sched_debug.cpu#87.=
sched_goidle
     29529 =C2=B1  2%     -34.5%      19329 =C2=B1  8%  sched_debug.cpu#88.=
nr_load_updates
     90746 =C2=B1  0%     -25.0%      68029 =C2=B1  2%  sched_debug.cpu#88.=
clock
     90746 =C2=B1  0%     -25.0%      68029 =C2=B1  2%  sched_debug.cpu#88.=
clock_task
       451 =C2=B1 27%     -39.4%        273 =C2=B1 30%  sched_debug.cpu#88.=
ttwu_local
     29689 =C2=B1 13%     -49.9%      14869 =C2=B1 12%  sched_debug.cpu#88.=
nr_switches
     13912 =C2=B1 14%     -49.8%       6981 =C2=B1 13%  sched_debug.cpu#88.=
sched_goidle
     30614 =C2=B1 14%     -50.1%      15278 =C2=B1 13%  sched_debug.cpu#88.=
sched_count
     12451 =C2=B1  6%     -43.1%       7084 =C2=B1  4%  sched_debug.cpu#88.=
ttwu_count
     90749 =C2=B1  0%     -25.0%      68029 =C2=B1  2%  sched_debug.cpu#89.=
clock_task
     30391 =C2=B1 10%     -48.2%      15749 =C2=B1  7%  sched_debug.cpu#89.=
nr_switches
     30776 =C2=B1 10%     -48.0%      15998 =C2=B1  5%  sched_debug.cpu#89.=
sched_count
     29663 =C2=B1  2%     -34.6%      19399 =C2=B1  9%  sched_debug.cpu#89.=
nr_load_updates
       449 =C2=B1 25%     -49.6%        226 =C2=B1 23%  sched_debug.cpu#89.=
ttwu_local
     12451 =C2=B1  6%     -40.2%       7440 =C2=B1  8%  sched_debug.cpu#89.=
ttwu_count
     90749 =C2=B1  0%     -25.0%      68029 =C2=B1  2%  sched_debug.cpu#89.=
clock
     14155 =C2=B1 10%     -48.2%       7338 =C2=B1  7%  sched_debug.cpu#89.=
sched_goidle
    550067 =C2=B1 33%     +32.1%     726800 =C2=B1 30%  sched_debug.cpu#89.=
avg_idle
     39232 =C2=B1  1%     -32.5%      26462 =C2=B1  5%  sched_debug.cpu#9.n=
r_load_updates
     17396 =C2=B1  9%     -46.0%       9392 =C2=B1 12%  sched_debug.cpu#9.s=
ched_goidle
       448 =C2=B1 21%     -55.2%        200 =C2=B1 12%  sched_debug.cpu#9.t=
twu_local
     36396 =C2=B1 10%     -45.8%      19735 =C2=B1 12%  sched_debug.cpu#9.n=
r_switches
     18646 =C2=B1  3%     -39.5%      11283 =C2=B1  1%  sched_debug.cpu#9.t=
twu_count
     39946 =C2=B1 23%     -49.9%      20010 =C2=B1 13%  sched_debug.cpu#9.s=
ched_count
     90572 =C2=B1  0%     -25.0%      67903 =C2=B1  2%  sched_debug.cpu#9.c=
lock
     90572 =C2=B1  0%     -25.0%      67903 =C2=B1  2%  sched_debug.cpu#9.c=
lock_task
     90750 =C2=B1  0%     -25.0%      68032 =C2=B1  2%  sched_debug.cpu#90.=
clock
     25711 =C2=B1 18%     -35.8%      16518 =C2=B1 11%  sched_debug.cpu#90.=
nr_switches
     90750 =C2=B1  0%     -25.0%      68032 =C2=B1  2%  sched_debug.cpu#90.=
clock_task
     12207 =C2=B1 10%     -38.8%       7468 =C2=B1  9%  sched_debug.cpu#90.=
ttwu_count
     11968 =C2=B1 18%     -35.7%       7699 =C2=B1 12%  sched_debug.cpu#90.=
sched_goidle
     29126 =C2=B1  3%     -32.4%      19698 =C2=B1  9%  sched_debug.cpu#90.=
nr_load_updates
    628110 =C2=B1 21%     +23.0%     772569 =C2=B1 11%  sched_debug.cpu#90.=
avg_idle
     26689 =C2=B1 19%     -37.0%      16818 =C2=B1 12%  sched_debug.cpu#90.=
sched_count
     26306 =C2=B1 19%     -32.9%      17664 =C2=B1 11%  sched_debug.cpu#91.=
sched_count
     29049 =C2=B1  4%     -35.0%      18888 =C2=B1  6%  sched_debug.cpu#91.=
nr_load_updates
         3 =C2=B1 50%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#91.=
cpu_load[4]
         2 =C2=B1 46%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#91.=
cpu_load[0]
     12217 =C2=B1 12%     -42.0%       7089 =C2=B1 10%  sched_debug.cpu#91.=
ttwu_count
     90753 =C2=B1  0%     -25.0%      68034 =C2=B1  2%  sched_debug.cpu#91.=
clock
     90753 =C2=B1  0%     -25.0%      68034 =C2=B1  2%  sched_debug.cpu#91.=
clock_task
     25924 =C2=B1 19%     -34.3%      17024 =C2=B1 10%  sched_debug.cpu#91.=
nr_switches
     12055 =C2=B1 19%     -34.0%       7952 =C2=B1  9%  sched_debug.cpu#91.=
sched_goidle
     11801 =C2=B1  5%     -28.1%       8488 =C2=B1 13%  sched_debug.cpu#92.=
sched_goidle
     25573 =C2=B1  5%     -27.1%      18651 =C2=B1 13%  sched_debug.cpu#92.=
sched_count
     25364 =C2=B1  5%     -28.2%      18206 =C2=B1 12%  sched_debug.cpu#92.=
nr_switches
     90755 =C2=B1  0%     -25.0%      68035 =C2=B1  2%  sched_debug.cpu#92.=
clock_task
     11763 =C2=B1  9%     -37.7%       7332 =C2=B1  7%  sched_debug.cpu#92.=
ttwu_count
     90755 =C2=B1  0%     -25.0%      68035 =C2=B1  2%  sched_debug.cpu#92.=
clock
     28690 =C2=B1  4%     -32.3%      19426 =C2=B1  7%  sched_debug.cpu#92.=
nr_load_updates
     26909 =C2=B1  8%     -34.6%      17602 =C2=B1 13%  sched_debug.cpu#93.=
nr_switches
     12531 =C2=B1  7%     -34.4%       8224 =C2=B1 13%  sched_debug.cpu#93.=
sched_goidle
     90757 =C2=B1  0%     -25.0%      68037 =C2=B1  2%  sched_debug.cpu#93.=
clock_task
     27730 =C2=B1  7%     -29.4%      19588 =C2=B1 11%  sched_debug.cpu#93.=
sched_count
     90757 =C2=B1  0%     -25.0%      68037 =C2=B1  2%  sched_debug.cpu#93.=
clock
     28807 =C2=B1  4%     -32.2%      19531 =C2=B1  7%  sched_debug.cpu#93.=
nr_load_updates
     11917 =C2=B1 10%     -37.8%       7417 =C2=B1  9%  sched_debug.cpu#93.=
ttwu_count
     11906 =C2=B1  8%     -40.0%       7138 =C2=B1 11%  sched_debug.cpu#94.=
ttwu_count
     12347 =C2=B1 10%     -31.2%       8493 =C2=B1 10%  sched_debug.cpu#94.=
sched_goidle
     28648 =C2=B1  4%     -33.5%      19054 =C2=B1  9%  sched_debug.cpu#94.=
nr_load_updates
     27210 =C2=B1 13%     -32.4%      18401 =C2=B1 10%  sched_debug.cpu#94.=
sched_count
     90760 =C2=B1  0%     -25.0%      68038 =C2=B1  2%  sched_debug.cpu#94.=
clock_task
     26489 =C2=B1 10%     -31.1%      18252 =C2=B1 10%  sched_debug.cpu#94.=
nr_switches
     90760 =C2=B1  0%     -25.0%      68038 =C2=B1  2%  sched_debug.cpu#94.=
clock
     25326 =C2=B1 11%     -34.1%      16690 =C2=B1 15%  sched_debug.cpu#95.=
nr_switches
     11750 =C2=B1 11%     -34.0%       7752 =C2=B1 15%  sched_debug.cpu#95.=
sched_goidle
     12160 =C2=B1  9%     -38.5%       7474 =C2=B1  8%  sched_debug.cpu#95.=
ttwu_count
     29092 =C2=B1  3%     -32.9%      19519 =C2=B1  8%  sched_debug.cpu#95.=
nr_load_updates
     25926 =C2=B1 14%     -32.7%      17460 =C2=B1 12%  sched_debug.cpu#95.=
sched_count
     90761 =C2=B1  0%     -25.0%      68039 =C2=B1  2%  sched_debug.cpu#95.=
clock_task
     90761 =C2=B1  0%     -25.0%      68039 =C2=B1  2%  sched_debug.cpu#95.=
clock
         3 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#96.=
cpu_load[4]
     28511 =C2=B1  4%     -32.8%      19154 =C2=B1  9%  sched_debug.cpu#96.=
nr_load_updates
     90763 =C2=B1  0%     -25.0%      68041 =C2=B1  2%  sched_debug.cpu#96.=
clock
     11919 =C2=B1 13%     -39.0%       7265 =C2=B1  8%  sched_debug.cpu#96.=
ttwu_count
     13085 =C2=B1 10%     -38.8%       8007 =C2=B1 23%  sched_debug.cpu#96.=
sched_goidle
     29076 =C2=B1  8%     -39.6%      17571 =C2=B1 24%  sched_debug.cpu#96.=
sched_count
     90763 =C2=B1  0%     -25.0%      68041 =C2=B1  2%  sched_debug.cpu#96.=
clock_task
         3 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#96.=
cpu_load[3]
     28029 =C2=B1 10%     -39.3%      17022 =C2=B1 23%  sched_debug.cpu#96.=
nr_switches
         3 =C2=B1 48%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#97.=
cpu_load[0]
     28886 =C2=B1 13%     -40.9%      17078 =C2=B1 22%  sched_debug.cpu#97.=
sched_count
     12348 =C2=B1  7%     -41.7%       7195 =C2=B1  8%  sched_debug.cpu#97.=
ttwu_count
     90765 =C2=B1  0%     -25.0%      68043 =C2=B1  2%  sched_debug.cpu#97.=
clock
         3 =C2=B1 48%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#97.=
cpu_load[1]
     28319 =C2=B1 11%     -40.7%      16804 =C2=B1 22%  sched_debug.cpu#97.=
nr_switches
     29169 =C2=B1  2%     -34.2%      19206 =C2=B1  7%  sched_debug.cpu#97.=
nr_load_updates
         3 =C2=B1 48%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#97.=
cpu_load[2]
         3 =C2=B1 48%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#97.=
cpu_load[4]
     90765 =C2=B1  0%     -25.0%      68043 =C2=B1  2%  sched_debug.cpu#97.=
clock_task
         3 =C2=B1 48%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#97.=
cpu_load[3]
     13209 =C2=B1 11%     -40.6%       7850 =C2=B1 22%  sched_debug.cpu#97.=
sched_goidle
     12210 =C2=B1  8%     -39.7%       7357 =C2=B1 12%  sched_debug.cpu#98.=
ttwu_count
     29510 =C2=B1 17%     -39.4%      17890 =C2=B1  6%  sched_debug.cpu#98.=
sched_count
     28976 =C2=B1  3%     -33.5%      19258 =C2=B1  7%  sched_debug.cpu#98.=
nr_load_updates
     28835 =C2=B1 17%     -41.8%      16789 =C2=B1  9%  sched_debug.cpu#98.=
nr_switches
     90767 =C2=B1  0%     -25.0%      68045 =C2=B1  2%  sched_debug.cpu#98.=
clock
     90767 =C2=B1  0%     -25.0%      68045 =C2=B1  2%  sched_debug.cpu#98.=
clock_task
     13443 =C2=B1 17%     -42.1%       7784 =C2=B1  9%  sched_debug.cpu#98.=
sched_goidle
     12850 =C2=B1  9%     -38.8%       7862 =C2=B1 15%  sched_debug.cpu#99.=
sched_goidle
     29189 =C2=B1  4%     -35.3%      18874 =C2=B1  6%  sched_debug.cpu#99.=
nr_load_updates
     12178 =C2=B1 10%     -39.8%       7331 =C2=B1  9%  sched_debug.cpu#99.=
ttwu_count
     27325 =C2=B1  8%     -37.2%      17157 =C2=B1 16%  sched_debug.cpu#99.=
nr_switches
     27696 =C2=B1  8%     -35.7%      17812 =C2=B1 14%  sched_debug.cpu#99.=
sched_count
     90769 =C2=B1  0%     -25.0%      68046 =C2=B1  2%  sched_debug.cpu#99.=
clock_task
     90769 =C2=B1  0%     -25.0%      68046 =C2=B1  2%  sched_debug.cpu#99.=
clock
     90547 =C2=B1  0%     -25.0%      67884 =C2=B1  2%  sched_debug.cpu_clk
     90547 =C2=B1  0%     -25.0%      67884 =C2=B1  2%  sched_debug.ktime
     95929 =C2=B1  0%     -24.4%      72538 =C2=B1  3%  sched_debug.sched_c=
lk

testcase/path_params/tbox_group: hackbench/performance-1600%-threads-pipe/l=
ituya

        v4.1-rc1  2b7928c943449ab2b5f4fa4c2d  =

----------------  --------------------------  =

    621784 =C2=B1  2%      +3.4%     642859 =C2=B1  1%  hackbench.time.mino=
r_page_faults
       617 =C2=B1  0%      -1.4%        609 =C2=B1  0%  hackbench.time.elap=
sed_time
       520 =C2=B1  2%      +3.8%        540 =C2=B1  2%  hackbench.time.user=
_time
       617 =C2=B1  0%      -1.4%        609 =C2=B1  0%  hackbench.time.elap=
sed_time.max
     94.29 =C2=B1  0%      +0.8%      95.06 =C2=B1  0%  turbostat.PkgWatt
      0.54 =C2=B1  9%     +17.2%       0.64 =C2=B1  8%  turbostat.RAMWatt
   3252637 =C2=B1 14%     +17.4%    3819239 =C2=B1  0%  meminfo.DirectMap2M
    104058 =C2=B1  5%      +8.5%     112918 =C2=B1  6%  meminfo.KernelStack
      6492 =C2=B1  5%      +8.2%       7028 =C2=B1  7%  proc-vmstat.nr_kern=
el_stack
      1960 =C2=B1 35%     -28.4%       1403 =C2=B1  1%  cpuidle.C3-HSW.usage
  49956880 =C2=B1  6%     -11.2%   44345089 =C2=B1  0%  cpuidle.C6-HSW.time
      7242 =C2=B1  4%      +7.3%       7772 =C2=B1  6%  slabinfo.task_struc=
t.num_objs
      1810 =C2=B1  4%      +7.3%       1943 =C2=B1  6%  slabinfo.task_struc=
t.num_slabs
      6319 =C2=B1  5%      +9.6%       6928 =C2=B1  7%  slabinfo.task_struc=
t.active_objs
      1810 =C2=B1  4%      +7.3%       1943 =C2=B1  6%  slabinfo.task_struc=
t.active_slabs
      9364 =C2=B1  4%      +5.1%       9843 =C2=B1  4%  slabinfo.task_xstat=
e.active_objs
     25.52 =C2=B1  5%      +8.2%      27.61 =C2=B1  4%  perf-profile.cpu-cy=
cles.vfs_read.sys_read.system_call_fastpath
     27.19 =C2=B1  7%     +11.0%      30.18 =C2=B1  4%  perf-profile.cpu-cy=
cles.sys_read.system_call_fastpath
      2.81 =C2=B1 15%     -46.7%       1.50 =C2=B1 20%  perf-profile.cpu-cy=
cles.is_module_text_address.__kernel_text_address.print_context_stack.dump_=
trace.save_stack_trace_tsk
      1.41 =C2=B1 12%     -50.3%       0.70 =C2=B1 21%  perf-profile.cpu-cy=
cles.is_module_text_address.print_context_stack.dump_trace.save_stack_trace=
_tsk.__account_scheduler_latency
      1071 =C2=B1 11%     +20.4%       1289 =C2=B1 11%  latency_stats.avg.c=
all_rwsem_down_read_failed.__do_page_fault.do_page_fault.page_fault
        54 =C2=B1 34%     +40.7%         76 =C2=B1 22%  latency_stats.avg.u=
nix_wait_for_peer.unix_dgram_sendmsg.sock_sendmsg.___sys_sendmsg.__sys_send=
msg.SyS_sendmsg.system_call_fastpath
      6352 =C2=B1 19%     -86.6%        852 =C2=B1  2%  latency_stats.avg.r=
pc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_do_close.[nfsv4]._=
_nfs4_close.[nfsv4].nfs4_close_sync.[nfsv4].nfs4_close_context.[nfsv4].__pu=
t_nfs_open_context.nfs_release.nfs_file_release.__fput.____fput.task_work_r=
un
      3640 =C2=B1 36%     -90.5%        344 =C2=B1  9%  latency_stats.avg.w=
ait_on_page_bit.filemap_fdatawait_range.filemap_write_and_wait_range.nfs4_f=
ile_fsync.[nfsv4].vfs_fsync_range.vfs_fsync.nfs_file_flush.filp_close.do_du=
p2.SyS_dup2.system_call_fastpath
     10167 =C2=B1 12%     -85.4%       1481 =C2=B1 19%  latency_stats.avg.r=
pc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_run_open_task.[nfs=
v4]._nfs4_open_and_get_state.[nfsv4].nfs4_do_open.[nfsv4].nfs4_atomic_open.=
[nfsv4].nfs4_file_open.[nfsv4].do_dentry_open.vfs_open.do_last.path_openat.=
do_filp_open
        36 =C2=B1 14%     +23.6%         45 =C2=B1 12%  latency_stats.hits.=
pipe_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
       352 =C2=B1 15%     +40.7%        496 =C2=B1  4%  latency_stats.hits.=
call_rwsem_down_write_failed.vm_munmap.SyS_munmap.system_call_fastpath
      4401 =C2=B1 19%     +37.3%       6044 =C2=B1 14%  latency_stats.hits.=
call_rwsem_down_read_failed.__do_page_fault.do_page_fault.page_fault
      3860 =C2=B1 36%     +26.2%       4871 =C2=B1  0%  latency_stats.max.w=
ait_woken.inotify_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
      2224 =C2=B1 22%     +21.2%       2695 =C2=B1 21%  latency_stats.max.c=
all_rwsem_down_read_failed.__do_page_fault.do_page_fault.page_fault
     42686 =C2=B1 22%     -63.0%      15788 =C2=B1 14%  latency_stats.max.r=
pc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_do_close.[nfsv4]._=
_nfs4_close.[nfsv4].nfs4_close_sync.[nfsv4].nfs4_close_context.[nfsv4].__pu=
t_nfs_open_context.nfs_release.nfs_file_release.__fput.____fput.task_work_r=
un
     29304 =C2=B1 22%     -96.8%        929 =C2=B1  0%  latency_stats.max.w=
ait_on_page_bit.filemap_fdatawait_range.filemap_write_and_wait_range.nfs4_f=
ile_fsync.[nfsv4].vfs_fsync_range.vfs_fsync.nfs_file_flush.filp_close.do_du=
p2.SyS_dup2.system_call_fastpath
     47940 =C2=B1 31%     -52.4%      22827 =C2=B1 22%  latency_stats.max.r=
pc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_run_open_task.[nfs=
v4]._nfs4_open_and_get_state.[nfsv4].nfs4_do_open.[nfsv4].nfs4_atomic_open.=
[nfsv4].nfs4_file_open.[nfsv4].do_dentry_open.vfs_open.do_last.path_openat.=
do_filp_open
    104524 =C2=B1 37%     -90.3%      10166 =C2=B1  7%  latency_stats.sum.w=
ait_on_page_bit.filemap_fdatawait_range.filemap_write_and_wait_range.nfs4_f=
ile_fsync.[nfsv4].vfs_fsync_range.vfs_fsync.nfs_file_flush.filp_close.do_du=
p2.SyS_dup2.system_call_fastpath
    724140 =C2=B1 12%     -85.6%     104616 =C2=B1 16%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_run_open_task.[nfs=
v4]._nfs4_open_and_get_state.[nfsv4].nfs4_do_open.[nfsv4].nfs4_atomic_open.=
[nfsv4].nfs4_file_open.[nfsv4].do_dentry_open.vfs_open.do_last.path_openat.=
do_filp_open
   4733929 =C2=B1 23%     +67.4%    7923901 =C2=B1 25%  latency_stats.sum.c=
all_rwsem_down_read_failed.__do_page_fault.do_page_fault.page_fault
    452656 =C2=B1 19%     -86.6%      60591 =C2=B1  5%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_do_close.[nfsv4]._=
_nfs4_close.[nfsv4].nfs4_close_sync.[nfsv4].nfs4_close_context.[nfsv4].__pu=
t_nfs_open_context.nfs_release.nfs_file_release.__fput.____fput.task_work_r=
un
     22720 =C2=B1  9%     +14.0%      25905 =C2=B1  8%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
       929 =C2=B1  1%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.tg_runnable_contrib
     14809 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.tg->runnable_avg
     42732 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.avg->runnable_avg_sum
     46675 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.avg->avg_period
        57 =C2=B1  3%      +8.1%         62 =C2=B1  7%  sched_debug.cfs_rq[=
10]:/.load
     46624 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.avg->avg_period
     42499 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.avg->runnable_avg_sum
     14810 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.tg->runnable_avg
       924 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.tg_runnable_contrib
     14810 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.tg->runnable_avg
        56 =C2=B1  2%     +60.2%         91 =C2=B1 34%  sched_debug.cfs_rq[=
11]:/.load
     42530 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.avg->runnable_avg_sum
     46642 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.avg->avg_period
        57 =C2=B1  2%     +32.4%         76 =C2=B1 22%  sched_debug.cfs_rq[=
11]:/.runnable_load_avg
       926 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.tg_runnable_contrib
       924 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.tg_runnable_contrib
     14810 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.tg->runnable_avg
     42360 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.avg->runnable_avg_sum
     46561 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.avg->avg_period
     46660 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.avg->avg_period
     42462 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.avg->runnable_avg_sum
     14810 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.tg->runnable_avg
       923 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.tg_runnable_contrib
     46685 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.avg->avg_period
       921 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.tg_runnable_contrib
   8652707 =C2=B1  8%     +12.1%    9701475 =C2=B1  9%  sched_debug.cfs_rq[=
14]:/.min_vruntime
     14811 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.tg->runnable_avg
     42338 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.avg->runnable_avg_sum
     42381 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.avg->runnable_avg_sum
     22750 =C2=B1  9%     +21.7%      27682 =C2=B1 15%  sched_debug.cfs_rq[=
15]:/.tg_load_avg
     46608 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.avg->avg_period
       922 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.tg_runnable_contrib
     14811 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.tg->runnable_avg
   8636605 =C2=B1  5%     +11.8%    9656246 =C2=B1  7%  sched_debug.cfs_rq[=
15]:/.min_vruntime
     14809 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.tg->runnable_avg
     42656 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.avg->runnable_avg_sum
     46607 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.avg->avg_period
     23023 =C2=B1 11%     +15.1%      26511 =C2=B1  7%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
   8819815 =C2=B1  6%     +10.9%    9785141 =C2=B1  2%  sched_debug.cfs_rq[=
1]:/.min_vruntime
       929 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.tg_runnable_contrib
     46684 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.avg->avg_period
         6 =C2=B1 27%     -50.0%          3 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.nr_spread_over
     42653 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.avg->runnable_avg_sum
     14809 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.tg->runnable_avg
     23214 =C2=B1 11%     +17.8%      27345 =C2=B1 10%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
       928 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.tg_runnable_contrib
     46600 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.avg->avg_period
     42569 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.avg->runnable_avg_sum
     14809 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.tg->runnable_avg
        56 =C2=B1  6%     +90.1%        108 =C2=B1  5%  sched_debug.cfs_rq[=
3]:/.load
        57 =C2=B1 13%     +83.8%        105 =C2=B1  7%  sched_debug.cfs_rq[=
3]:/.runnable_load_avg
      3747 =C2=B1  6%     +99.0%       7458 =C2=B1  2%  sched_debug.cfs_rq[=
3]:/.utilization_load_avg
       926 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.tg_runnable_contrib
     42637 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.avg->runnable_avg_sum
     14809 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.tg->runnable_avg
       926 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.tg_runnable_contrib
      2911 =C2=B1  5%     -14.8%       2479 =C2=B1  6%  sched_debug.cfs_rq[=
4]:/.utilization_load_avg
     46684 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.avg->avg_period
   8775105 =C2=B1  3%      +8.4%    9511140 =C2=B1  6%  sched_debug.cfs_rq[=
4]:/.min_vruntime
     42446 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.avg->runnable_avg_sum
       923 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.tg_runnable_contrib
     46689 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.avg->avg_period
     14809 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.tg->runnable_avg
     22357 =C2=B1  9%     +14.1%      25504 =C2=B1  6%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
     42345 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.avg->runnable_avg_sum
       916 =C2=B1 28%    +128.8%       2097 =C2=B1 25%  sched_debug.cfs_rq[=
6]:/.blocked_load_avg
     14809 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.tg->runnable_avg
       921 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.tg_runnable_contrib
   8578070 =C2=B1  6%     +10.6%    9489523 =C2=B1  5%  sched_debug.cfs_rq[=
6]:/.min_vruntime
     46581 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.avg->avg_period
       979 =C2=B1 27%    +124.0%       2194 =C2=B1 26%  sched_debug.cfs_rq[=
6]:/.tg_load_contrib
     14809 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.tg->runnable_avg
   8569103 =C2=B1  6%      +8.0%    9254521 =C2=B1  6%  sched_debug.cfs_rq[=
7]:/.min_vruntime
     46593 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.avg->avg_period
      2524 =C2=B1  4%     -18.2%       2065 =C2=B1  3%  sched_debug.cfs_rq[=
7]:/.utilization_load_avg
       923 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.tg_runnable_contrib
     42311 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.avg->runnable_avg_sum
      1178 =C2=B1 18%     +50.7%       1775 =C2=B1 25%  sched_debug.cfs_rq[=
8]:/.tg_load_contrib
     14809 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.tg->runnable_avg
     22480 =C2=B1  8%     +17.0%      26292 =C2=B1 10%  sched_debug.cfs_rq[=
8]:/.tg_load_avg
       920 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.tg_runnable_contrib
     42358 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.avg->runnable_avg_sum
        57 =C2=B1  1%     -13.2%         50 =C2=B1  2%  sched_debug.cfs_rq[=
8]:/.runnable_load_avg
     46699 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.avg->avg_period
        57 =C2=B1  4%     -16.7%         48 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.load
      1115 =C2=B1 18%     +54.7%       1725 =C2=B1 26%  sched_debug.cfs_rq[=
8]:/.blocked_load_avg
       932 =C2=B1  1%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.tg_runnable_contrib
   9034117 =C2=B1  6%     +12.1%   10125886 =C2=B1  3%  sched_debug.cfs_rq[=
9]:/.min_vruntime
     14809 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.tg->runnable_avg
     42835 =C2=B1  1%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.avg->runnable_avg_sum
     46622 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.avg->avg_period
        75 =C2=B1 12%     -28.9%         53 =C2=B1 17%  sched_debug.cpu#0.n=
r_running
    885561 =C2=B1  4%      +7.7%     953796 =C2=B1  3%  sched_debug.cpu#1.a=
vg_idle
        56 =C2=B1  5%      +8.2%         61 =C2=B1  4%  sched_debug.cpu#10.=
load
     80563 =C2=B1  2%     +13.7%      91630 =C2=B1  3%  sched_debug.cpu#11.=
sched_goidle
        59 =C2=B1  2%     +31.4%         77 =C2=B1 17%  sched_debug.cpu#11.=
cpu_load[1]
        59 =C2=B1  2%     +29.2%         76 =C2=B1 16%  sched_debug.cpu#11.=
cpu_load[2]
        58 =C2=B1  4%     +30.1%         76 =C2=B1 22%  sched_debug.cpu#11.=
cpu_load[0]
        59 =C2=B1  2%     +28.8%         76 =C2=B1 15%  sched_debug.cpu#11.=
cpu_load[3]
        59 =C2=B1  2%     +27.5%         75 =C2=B1 15%  sched_debug.cpu#11.=
cpu_load[4]
        56 =C2=B1  7%     +17.0%         66 =C2=B1  0%  sched_debug.cpu#12.=
cpu_load[0]
     63834 =C2=B1  6%     +10.5%      70510 =C2=B1  1%  sched_debug.cpu#14.=
curr->pid
        58 =C2=B1  4%      -9.0%         53 =C2=B1  0%  sched_debug.cpu#14.=
cpu_load[2]
        58 =C2=B1  4%      -9.8%         52 =C2=B1  0%  sched_debug.cpu#14.=
cpu_load[4]
        58 =C2=B1  3%      -9.2%         53 =C2=B1  0%  sched_debug.cpu#14.=
cpu_load[3]
        39 =C2=B1  6%     -14.1%         34 =C2=B1  2%  sched_debug.cpu#14.=
nr_running
    865778 =C2=B1  4%      +7.0%     926192 =C2=B1  3%  sched_debug.cpu#15.=
avg_idle
        56 =C2=B1  7%     +85.7%        104 =C2=B1  4%  sched_debug.cpu#3.c=
pu_load[3]
        56 =C2=B1  7%     +85.1%        104 =C2=B1  4%  sched_debug.cpu#3.c=
pu_load[2]
        55 =C2=B1  7%     +86.4%        104 =C2=B1  4%  sched_debug.cpu#3.c=
pu_load[4]
        56 =C2=B1  6%     +90.1%        108 =C2=B1  6%  sched_debug.cpu#3.l=
oad
        64 =C2=B1  5%    +291.7%        251 =C2=B1  9%  sched_debug.cpu#3.n=
r_running
        56 =C2=B1  8%     +82.0%        103 =C2=B1  4%  sched_debug.cpu#3.c=
pu_load[0]
        56 =C2=B1  7%     +84.4%        104 =C2=B1  4%  sched_debug.cpu#3.c=
pu_load[1]
        62 =C2=B1  7%     -25.8%         46 =C2=B1 13%  sched_debug.cpu#4.n=
r_running
    905926 =C2=B1  2%     -10.7%     809005 =C2=B1  0%  sched_debug.cpu#4.a=
vg_idle
        54 =C2=B1  3%     -17.9%         45 =C2=B1  2%  sched_debug.cpu#6.n=
r_running
     63257 =C2=B1  6%     +11.9%      70762 =C2=B1  2%  sched_debug.cpu#8.c=
urr->pid
        57 =C2=B1  4%     -16.1%         48 =C2=B1  1%  sched_debug.cpu#8.l=
oad
        52 =C2=B1  6%     -29.4%         37 =C2=B1  2%  sched_debug.cpu#8.n=
r_running
        57 =C2=B1  1%     -13.2%         50 =C2=B1  2%  sched_debug.cpu#8.c=
pu_load[0]
        57 =C2=B1  1%     -12.9%         50 =C2=B1  2%  sched_debug.cpu#8.c=
pu_load[1]

testcase/path_params/tbox_group: hackbench/performance-50%-process-pipe/lit=
uya

        v4.1-rc1  2b7928c943449ab2b5f4fa4c2d  =

----------------  --------------------------  =

     32985 =C2=B1  1%      +1.1%      33341 =C2=B1  1%  hackbench.throughput
    338500 =C2=B1  1%      +1.9%     344871 =C2=B1  1%  vmstat.system.in
   2430311 =C2=B1  0%      +1.6%    2470346 =C2=B1  0%  vmstat.system.cs
      1446 =C2=B1  2%     +13.7%       1644 =C2=B1  6%  cpuidle.C3-HSW.usage
      0.85 =C2=B1 18%     +50.6%       1.28 =C2=B1  1%  perf-profile.cpu-cy=
cles.fsnotify.vfs_write.sys_write.system_call_fastpath
      1.31 =C2=B1  7%     -13.2%       1.13 =C2=B1  0%  perf-profile.cpu-cy=
cles.idle_cpu.select_idle_sibling.select_task_rq_fair.try_to_wake_up.defaul=
t_wake_function
      0.69 =C2=B1 20%     +52.6%       1.05 =C2=B1  7%  perf-profile.cpu-cy=
cles.rw_verify_area.vfs_write.sys_write.system_call_fastpath
      1.25 =C2=B1  2%     +10.0%       1.38 =C2=B1  2%  perf-profile.cpu-cy=
cles.update_cfs_shares.dequeue_entity.dequeue_task_fair.dequeue_task.deacti=
vate_task
      1.07 =C2=B1  9%     +18.9%       1.27 =C2=B1  3%  perf-profile.cpu-cy=
cles.security_file_permission.rw_verify_area.vfs_read.sys_read.system_call_=
fastpath
      1.06 =C2=B1 12%     +36.1%       1.44 =C2=B1  2%  perf-profile.cpu-cy=
cles.rw_verify_area.vfs_read.sys_read.system_call_fastpath
      6835 =C2=B1  6%     +11.6%       7628 =C2=B1  3%  latency_stats.avg.p=
ipe_write.__vfs_write.vfs_write.SyS_write.system_call_fastpath
       315 =C2=B1  3%      +6.9%        337 =C2=B1  3%  latency_stats.avg.d=
o_wait.SyS_wait4.system_call_fastpath
      1363 =C2=B1  6%      +6.3%       1449 =C2=B1  0%  latency_stats.avg.p=
ipe_wait.wait_for_partner.fifo_open.do_dentry_open.vfs_open.do_last.path_op=
enat.do_filp_open.do_sys_open.SyS_open.system_call_fastpath
       571 =C2=B1 32%     -44.1%        319 =C2=B1  1%  latency_stats.avg.e=
p_poll.SyS_epoll_wait.system_call_fastpath
       338 =C2=B1 10%     -34.4%        222 =C2=B1  3%  latency_stats.avg.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_access.[nfsv4].nfs4_proc_access.[nfsv4].nfs_do_=
access.nfs_permission.__inode_permission.inode_permission.may_open
      7034 =C2=B1 14%     -90.5%        671 =C2=B1 29%  latency_stats.avg.r=
pc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_do_close.[nfsv4]._=
_nfs4_close.[nfsv4].nfs4_close_sync.[nfsv4].nfs4_close_context.[nfsv4].__pu=
t_nfs_open_context.nfs_release.nfs_file_release.__fput.____fput.task_work_r=
un
     10840 =C2=B1 21%     -72.7%       2961 =C2=B1 27%  latency_stats.avg.r=
pc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_run_open_task.[nfs=
v4]._nfs4_open_and_get_state.[nfsv4].nfs4_do_open.[nfsv4].nfs4_atomic_open.=
[nfsv4].nfs4_file_open.[nfsv4].do_dentry_open.vfs_open.do_last.path_openat.=
do_filp_open
         8 =C2=B1 29%     +33.7%         11 =C2=B1 21%  latency_stats.hits.=
unix_wait_for_peer.unix_dgram_sendmsg.sock_sendmsg.___sys_sendmsg.__sys_sen=
dmsg.SyS_sendmsg.system_call_fastpath
        41 =C2=B1 14%     +37.7%         57 =C2=B1  0%  latency_stats.hits.=
wait_woken.inotify_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
     35192 =C2=B1 16%     -61.8%      13426 =C2=B1 16%  latency_stats.max.r=
pc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_do_close.[nfsv4]._=
_nfs4_close.[nfsv4].nfs4_close_sync.[nfsv4].nfs4_close_context.[nfsv4].__pu=
t_nfs_open_context.nfs_release.nfs_file_release.__fput.____fput.task_work_r=
un
     88083 =C2=B1 20%     +45.1%     127773 =C2=B1  8%  latency_stats.max.p=
ipe_wait.pipe_write.__vfs_write.vfs_write.SyS_write.system_call_fastpath
      1612 =C2=B1  6%     +12.5%       1813 =C2=B1  0%  latency_stats.max.p=
ipe_wait.wait_for_partner.fifo_open.do_dentry_open.vfs_open.do_last.path_op=
enat.do_filp_open.do_sys_open.SyS_open.system_call_fastpath
 2.284e+08 =C2=B1  5%     +11.2%  2.539e+08 =C2=B1  3%  latency_stats.sum.p=
ipe_write.__vfs_write.vfs_write.SyS_write.system_call_fastpath
    724266 =C2=B1 21%     -72.9%     196526 =C2=B1 27%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_run_open_task.[nfs=
v4]._nfs4_open_and_get_state.[nfsv4].nfs4_do_open.[nfsv4].nfs4_atomic_open.=
[nfsv4].nfs4_file_open.[nfsv4].do_dentry_open.vfs_open.do_last.path_openat.=
do_filp_open
    469732 =C2=B1 14%     -90.5%      44759 =C2=B1 29%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_do_close.[nfsv4]._=
_nfs4_close.[nfsv4].nfs4_close_sync.[nfsv4].nfs4_close_context.[nfsv4].__pu=
t_nfs_open_context.nfs_release.nfs_file_release.__fput.____fput.task_work_r=
un
     13635 =C2=B1  6%      +6.3%      14491 =C2=B1  0%  latency_stats.sum.p=
ipe_wait.wait_for_partner.fifo_open.do_dentry_open.vfs_open.do_last.path_op=
enat.do_filp_open.do_sys_open.SyS_open.system_call_fastpath
   1207622 =C2=B1  4%      +5.2%    1270354 =C2=B1  3%  latency_stats.sum.d=
o_wait.SyS_wait4.system_call_fastpath
  18573930 =C2=B1  3%      +5.8%   19659542 =C2=B1  3%  latency_stats.sum.h=
rtimer_nanosleep.SyS_nanosleep.system_call_fastpath
      5757 =C2=B1 10%     -34.3%       3781 =C2=B1  3%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_access.[nfsv4].nfs4_proc_access.[nfsv4].nfs_do_=
access.nfs_permission.__inode_permission.inode_permission.may_open
       933 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.tg_runnable_contrib
     14946 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.tg->runnable_avg
     42863 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.avg->runnable_avg_sum
     46638 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.avg->avg_period
     46677 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.avg->avg_period
     42905 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.avg->runnable_avg_sum
     14947 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.tg->runnable_avg
       933 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.tg_runnable_contrib
     14947 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.tg->runnable_avg
     42860 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.avg->runnable_avg_sum
     46674 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.avg->avg_period
       932 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.tg_runnable_contrib
       935 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.tg_runnable_contrib
      1022 =C2=B1  6%      +9.4%       1118 =C2=B1  8%  sched_debug.cfs_rq[=
12]:/.utilization_load_avg
     14948 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.tg->runnable_avg
     42948 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.avg->runnable_avg_sum
     46607 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.avg->avg_period
     46711 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.avg->avg_period
     42900 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.avg->runnable_avg_sum
     14948 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.tg->runnable_avg
       933 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.tg_runnable_contrib
     46632 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.avg->avg_period
       927 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.tg_runnable_contrib
     14948 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.tg->runnable_avg
     42604 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.avg->runnable_avg_sum
     42866 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.avg->runnable_avg_sum
     46642 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.avg->avg_period
       933 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.tg_runnable_contrib
     14948 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.tg->runnable_avg
     14946 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.tg->runnable_avg
     43062 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.avg->runnable_avg_sum
     46605 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.avg->avg_period
      1285 =C2=B1 35%     -72.1%        358 =C2=B1 34%  sched_debug.cfs_rq[=
1]:/.tg_load_contrib
      1209 =C2=B1 38%     -76.1%        289 =C2=B1 41%  sched_debug.cfs_rq[=
1]:/.blocked_load_avg
       937 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.tg_runnable_contrib
     46607 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.avg->avg_period
     42940 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.avg->runnable_avg_sum
     14946 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.tg->runnable_avg
       934 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.tg_runnable_contrib
     46618 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.avg->avg_period
     42999 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.avg->runnable_avg_sum
     14947 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.tg->runnable_avg
        63 =C2=B1  5%     -11.9%         56 =C2=B1  1%  sched_debug.cfs_rq[=
3]:/.runnable_load_avg
       936 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.tg_runnable_contrib
     42807 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.avg->runnable_avg_sum
     14947 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.tg->runnable_avg
       930 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.tg_runnable_contrib
     46687 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.avg->avg_period
     42787 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.avg->runnable_avg_sum
       933 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.tg_runnable_contrib
     46578 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.avg->avg_period
        56 =C2=B1  3%     +13.1%         64 =C2=B1  3%  sched_debug.cfs_rq[=
5]:/.load
     14947 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.tg->runnable_avg
     43004 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.avg->runnable_avg_sum
     14947 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.tg->runnable_avg
       935 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.tg_runnable_contrib
     46618 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.avg->avg_period
        52 =C2=B1  8%     +25.0%         65 =C2=B1  2%  sched_debug.cfs_rq[=
7]:/.load
     14947 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.tg->runnable_avg
     46592 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.avg->avg_period
        55 =C2=B1  4%      +9.7%         61 =C2=B1  1%  sched_debug.cfs_rq[=
7]:/.runnable_load_avg
       829 =C2=B1 18%     +25.2%       1039 =C2=B1 10%  sched_debug.cfs_rq[=
7]:/.utilization_load_avg
       933 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.tg_runnable_contrib
     42836 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.avg->runnable_avg_sum
     14947 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.tg->runnable_avg
       934 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.tg_runnable_contrib
     42890 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.avg->runnable_avg_sum
     46644 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.avg->avg_period
       938 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.tg_runnable_contrib
     14947 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.tg->runnable_avg
     43030 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.avg->runnable_avg_sum
     46585 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.avg->avg_period
    276494 =C2=B1 14%     -51.5%     134234 =C2=B1 26%  sched_debug.cpu#12.=
avg_idle
        53 =C2=B1  3%     +11.5%         60 =C2=B1  3%  sched_debug.cpu#15.=
cpu_load[4]
        53 =C2=B1  4%     +12.4%         60 =C2=B1  6%  sched_debug.cpu#15.=
cpu_load[0]
  45105803 =C2=B1  2%      +5.5%   47587931 =C2=B1  3%  sched_debug.cpu#15.=
sched_count
        54 =C2=B1  4%     +10.2%         59 =C2=B1  4%  sched_debug.cpu#15.=
cpu_load[2]
  45105778 =C2=B1  2%      +5.5%   47587896 =C2=B1  3%  sched_debug.cpu#15.=
nr_switches
   9888987 =C2=B1  3%      +6.2%   10505681 =C2=B1  3%  sched_debug.cpu#15.=
ttwu_local
        53 =C2=B1  3%     +11.0%         59 =C2=B1  5%  sched_debug.cpu#15.=
cpu_load[1]
        54 =C2=B1  4%     +10.2%         59 =C2=B1  4%  sched_debug.cpu#15.=
cpu_load[3]
    203652 =C2=B1 44%     -67.1%      66942 =C2=B1 10%  sched_debug.cpu#3.a=
vg_idle
  31884916 =C2=B1  2%      +9.0%   34744451 =C2=B1  2%  sched_debug.cpu#5.t=
twu_count
        10 =C2=B1  9%     +15.7%         12 =C2=B1  4%  sched_debug.cpu#5.n=
r_running
     45343 =C2=B1 10%     +67.1%      75747 =C2=B1 26%  sched_debug.cpu#5.s=
ched_goidle
        10 =C2=B1  7%     +25.0%         13 =C2=B1  7%  sched_debug.cpu#7.n=
r_running
        54 =C2=B1  4%     +13.1%         62 =C2=B1  1%  sched_debug.cpu#7.c=
pu_load[3]
        55 =C2=B1  4%     +11.4%         61 =C2=B1  2%  sched_debug.cpu#7.c=
pu_load[2]
        55 =C2=B1  3%      +9.2%         60 =C2=B1  0%  sched_debug.cpu#7.c=
pu_load[1]
   9211651 =C2=B1  1%     +10.2%   10150947 =C2=B1  3%  sched_debug.cpu#7.t=
twu_local
        54 =C2=B1  3%     +12.2%         61 =C2=B1  2%  sched_debug.cpu#7.c=
pu_load[4]
        53 =C2=B1  7%     +22.6%         65 =C2=B1  3%  sched_debug.cpu#7.l=
oad
    248727 =C2=B1 18%     -29.7%     174748 =C2=B1  5%  sched_debug.cpu#9.a=
vg_idle
      0.00 =C2=B1 34%    +109.2%       0.00 =C2=B1 20%  sched_debug.rt_rq[0=
]:/.rt_time
      0.00 =C2=B1 30%     +44.7%       0.00 =C2=B1 19%  sched_debug.rt_rq[1=
0]:/.rt_time
      0.00 =C2=B1 48%     +91.1%       0.00 =C2=B1  9%  sched_debug.rt_rq[1=
]:/.rt_time
      0.00 =C2=B1 44%     +64.1%       0.00 =C2=B1  1%  sched_debug.rt_rq[6=
]:/.rt_time

testcase/path_params/tbox_group: hackbench/performance-50%-threads-pipe/lit=
uya

        v4.1-rc1  2b7928c943449ab2b5f4fa4c2d  =

----------------  --------------------------  =

       237 =C2=B1  0%      -6.9%        220 =C2=B1  4%  hackbench.time.user=
_time
    343707 =C2=B1  1%      +1.9%     350072 =C2=B1  1%  vmstat.system.in
   2662714 =C2=B1  0%      +0.8%    2683874 =C2=B1  0%  vmstat.system.cs
        45 =C2=B1  2%     +16.7%         53 =C2=B1  0%  turbostat.CoreTmp
        49 =C2=B1  2%     +13.9%         56 =C2=B1  0%  turbostat.PkgTmp
    615964 =C2=B1  0%      +9.5%     674212 =C2=B1  2%  proc-vmstat.pgfault
    365496 =C2=B1 26%     -47.8%     190965 =C2=B1  0%  cpuidle.C3-HSW.time
      3534 =C2=B1  2%      +7.4%       3794 =C2=B1  3%  slabinfo.anon_vma.a=
ctive_objs
      3534 =C2=B1  2%      +7.4%       3794 =C2=B1  3%  slabinfo.anon_vma.n=
um_objs
      6785 =C2=B1  4%      +9.3%       7415 =C2=B1  3%  slabinfo.kmalloc-25=
6.active_objs
      1.40 =C2=B1  5%     -12.0%       1.23 =C2=B1  0%  perf-profile.cpu-cy=
cles.idle_cpu.select_idle_sibling.select_task_rq_fair.try_to_wake_up.defaul=
t_wake_function
      8103 =C2=B1  3%      +9.4%       8869 =C2=B1  1%  latency_stats.avg.p=
ipe_write.__vfs_write.vfs_write.SyS_write.system_call_fastpath
       262 =C2=B1  3%     +13.2%        296 =C2=B1  7%  latency_stats.avg.d=
o_wait.SyS_wait4.system_call_fastpath
      1420 =C2=B1  1%     +24.9%       1774 =C2=B1  3%  latency_stats.avg.p=
ipe_wait.wait_for_partner.fifo_open.do_dentry_open.vfs_open.do_last.path_op=
enat.do_filp_open.do_sys_open.SyS_open.system_call_fastpath
         2 =C2=B1 31%     +75.0%          3 =C2=B1 14%  latency_stats.avg.c=
all_rwsem_down_write_failed.cgroup_post_fork.copy_process.do_fork.SyS_clone=
.system_call_fastpath
        10 =C2=B1 28%     -60.0%          4 =C2=B1 25%  latency_stats.hits.=
unix_wait_for_peer.unix_dgram_sendmsg.sock_sendmsg.___sys_sendmsg.__sys_sen=
dmsg.SyS_sendmsg.system_call_fastpath
      4049 =C2=B1  2%      +2.5%       4149 =C2=B1  0%  latency_stats.max.p=
oll_schedule_timeout.do_sys_poll.SyS_poll.system_call_fastpath
       577 =C2=B1 44%     +57.3%        909 =C2=B1 38%  latency_stats.max.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_getattr.[nfsv4].nfs4_proc_getattr.[nfsv4].__nfs=
_revalidate_inode.nfs_getattr.vfs_getattr_nosec.vfs_getattr.vfs_fstat
      3219 =C2=B1  1%      +3.8%       3342 =C2=B1  0%  latency_stats.max.h=
rtimer_nanosleep.SyS_nanosleep.system_call_fastpath
      1724 =C2=B1  1%     +22.8%       2117 =C2=B1  4%  latency_stats.max.p=
ipe_wait.wait_for_partner.fifo_open.do_dentry_open.vfs_open.do_last.path_op=
enat.do_filp_open.do_sys_open.SyS_open.system_call_fastpath
     12877 =C2=B1 49%     -94.8%        668 =C2=B1 41%  latency_stats.max.w=
ait_on_page_bit.filemap_fdatawait_range.filemap_write_and_wait_range.nfs4_f=
ile_fsync.[nfsv4].vfs_fsync_range.vfs_fsync.nfs_file_flush.filp_close.do_du=
p2.SyS_dup2.system_call_fastpath
   6531142 =C2=B1  0%      -5.1%    6198526 =C2=B1  4%  latency_stats.sum.p=
oll_schedule_timeout.do_sys_poll.SyS_poll.system_call_fastpath
       960 =C2=B1 30%     +38.8%       1332 =C2=B1 28%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_getattr.[nfsv4].nfs4_proc_getattr.[nfsv4].__nfs=
_revalidate_inode.nfs_getattr.vfs_getattr_nosec.vfs_getattr.vfs_fstat
     14209 =C2=B1  1%     +24.9%      17745 =C2=B1  3%  latency_stats.sum.p=
ipe_wait.wait_for_partner.fifo_open.do_dentry_open.vfs_open.do_last.path_op=
enat.do_filp_open.do_sys_open.SyS_open.system_call_fastpath
       936 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.tg_runnable_contrib
     14964 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.tg->runnable_avg
     43021 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.avg->runnable_avg_sum
       802 =C2=B1 14%     +13.7%        912 =C2=B1  4%  sched_debug.cfs_rq[=
0]:/.utilization_load_avg
     46642 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.avg->avg_period
        58 =C2=B1  2%      +4.9%         61 =C2=B1  4%  sched_debug.cfs_rq[=
10]:/.runnable_load_avg
     46612 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.avg->avg_period
     43104 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.avg->runnable_avg_sum
     14965 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.tg->runnable_avg
       938 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.tg_runnable_contrib
       276 =C2=B1 44%     +32.9%        368 =C2=B1 29%  sched_debug.cfs_rq[=
11]:/.tg_load_contrib
     14965 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.tg->runnable_avg
     42669 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.avg->runnable_avg_sum
     46599 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.avg->avg_period
       930 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.tg_runnable_contrib
       933 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.tg_runnable_contrib
     14965 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.tg->runnable_avg
     42876 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.avg->runnable_avg_sum
     46629 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.avg->avg_period
     46631 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.avg->avg_period
     42789 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.avg->runnable_avg_sum
     14965 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.tg->runnable_avg
       931 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.tg_runnable_contrib
        57 =C2=B1  9%     +17.6%         68 =C2=B1 16%  sched_debug.cfs_rq[=
13]:/.load
     46701 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.avg->avg_period
       931 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.tg_runnable_contrib
         0 =C2=B1  0%      +Inf%          1 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.nr_running
     14965 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.tg->runnable_avg
        56 =C2=B1  2%      +7.7%         60 =C2=B1  2%  sched_debug.cfs_rq[=
14]:/.runnable_load_avg
         3 =C2=B1 21%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.nr_spread_over
     42846 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.avg->runnable_avg_sum
     42852 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.avg->runnable_avg_sum
     46609 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.avg->avg_period
       933 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.tg_runnable_contrib
     14966 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.tg->runnable_avg
     14964 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.tg->runnable_avg
     42943 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.avg->runnable_avg_sum
     46588 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.avg->avg_period
       936 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.tg_runnable_contrib
     46585 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.avg->avg_period
     43075 =C2=B1  1%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.avg->runnable_avg_sum
     14964 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.tg->runnable_avg
        57 =C2=B1  0%      +8.0%         62 =C2=B1  3%  sched_debug.cfs_rq[=
2]:/.runnable_load_avg
       938 =C2=B1  1%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.tg_runnable_contrib
     46595 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.avg->avg_period
     42974 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.avg->runnable_avg_sum
     14964 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.tg->runnable_avg
        58 =C2=B1  5%      +6.5%         62 =C2=B1  4%  sched_debug.cfs_rq[=
3]:/.runnable_load_avg
       786 =C2=B1  8%     +17.4%        923 =C2=B1  2%  sched_debug.cfs_rq[=
3]:/.utilization_load_avg
       936 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.tg_runnable_contrib
     42813 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.avg->runnable_avg_sum
     14964 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.tg->runnable_avg
       932 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.tg_runnable_contrib
     46611 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.avg->avg_period
     42733 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.avg->runnable_avg_sum
       929 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.tg_runnable_contrib
     46693 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.avg->avg_period
        87 =C2=B1 40%    +742.5%        733 =C2=B1  1%  sched_debug.cfs_rq[=
5]:/.tg_load_contrib
     14964 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.tg->runnable_avg
       806 =C2=B1  7%     -22.2%        627 =C2=B1  5%  sched_debug.cfs_rq[=
5]:/.utilization_load_avg
     43091 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.avg->runnable_avg_sum
     14965 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.tg->runnable_avg
       936 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.tg_runnable_contrib
     46628 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.avg->avg_period
     14965 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.tg->runnable_avg
     46603 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.avg->avg_period
       935 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.tg_runnable_contrib
     42929 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.avg->runnable_avg_sum
     14965 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.tg->runnable_avg
       939 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.tg_runnable_contrib
     43153 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.avg->runnable_avg_sum
     46647 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.avg->avg_period
       938 =C2=B1  1%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.tg_runnable_contrib
     14965 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.tg->runnable_avg
     43153 =C2=B1  1%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.avg->runnable_avg_sum
     46656 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.avg->avg_period
        10 =C2=B1  4%     -24.5%          8 =C2=B1 12%  sched_debug.cpu#10.=
nr_running
     46896 =C2=B1 31%     +38.2%      64819 =C2=B1 10%  sched_debug.cpu#11.=
sched_goidle
        60 =C2=B1  2%     -12.8%         52 =C2=B1  4%  sched_debug.cpu#11.=
cpu_load[1]
  48871979 =C2=B1  2%      +9.9%   53686075 =C2=B1  2%  sched_debug.cpu#11.=
nr_switches
  48872006 =C2=B1  2%      +9.9%   53686097 =C2=B1  2%  sched_debug.cpu#11.=
sched_count
        61 =C2=B1  4%     -15.0%         52 =C2=B1  2%  sched_debug.cpu#11.=
cpu_load[0]
        10 =C2=B1  7%     -27.9%          7 =C2=B1  6%  sched_debug.cpu#11.=
nr_running
    427277 =C2=B1 24%     -64.7%     150643 =C2=B1 12%  sched_debug.cpu#13.=
avg_idle
        54 =C2=B1  4%      +9.4%         59 =C2=B1  2%  sched_debug.cpu#14.=
load
        10 =C2=B1  6%     -25.9%          8 =C2=B1 12%  sched_debug.cpu#2.n=
r_running
        58 =C2=B1  3%     +12.2%         65 =C2=B1  6%  sched_debug.cpu#2.c=
pu_load[1]
        57 =C2=B1  1%     +18.0%         67 =C2=B1  6%  sched_debug.cpu#2.c=
pu_load[0]
     51732 =C2=B1  8%     +36.8%      70781 =C2=B1 11%  sched_debug.cpu#4.s=
ched_goidle
        10 =C2=B1  7%     -36.3%          6 =C2=B1 23%  sched_debug.cpu#5.n=
r_running
        57 =C2=B1  6%     -18.7%         47 =C2=B1  6%  sched_debug.cpu#5.l=
oad
        10 =C2=B1  4%     -24.5%          8 =C2=B1 12%  sched_debug.cpu#8.n=
r_running

testcase/path_params/tbox_group: hackbench/powersave-50%-threads-pipe/lituya

        v4.1-rc1  2b7928c943449ab2b5f4fa4c2d  =

----------------  --------------------------  =


testcase/path_params/tbox_group: will-it-scale/performance-mmap2/lkp-wsx02

        v4.1-rc1  2b7928c943449ab2b5f4fa4c2d  =

----------------  --------------------------  =


testcase/path_params/tbox_group: hackbench/performance-50%-threads-socket/b=
rickland3

        v4.1-rc1  2b7928c943449ab2b5f4fa4c2d  =

----------------  --------------------------  =

          1:5          -20%            :2     dmesg.Unexpected_close,not_st=
opping_watchdog
         0 =C2=B1  0%      +Inf%          2 =C2=B1 20%  sched_debug.cfs_rq[=
103]:/.nr_spread_over

testcase/path_params/tbox_group: hackbench/powersave-50%-threads-socket/lit=
uya

        v4.1-rc1  2b7928c943449ab2b5f4fa4c2d  =

----------------  --------------------------  =


testcase/path_params/tbox_group: will-it-scale/performance-open2/lkp-wsx02

        v4.1-rc1  2b7928c943449ab2b5f4fa4c2d  =

----------------  --------------------------  =

           :5           50%           1:2     dmesg.Unexpected_close,not_st=
opping_watchdog
         0 =C2=B1  0%      +Inf%          1 =C2=B1  0%  sched_debug.cfs_rq[=
40]:/.nr_spread_over

testcase/path_params/tbox_group: hackbench/powersave-50%-process-pipe/lituya

        v4.1-rc1  2b7928c943449ab2b5f4fa4c2d  =

----------------  --------------------------  =

    138765 =C2=B1  3%      +2.3%     141953 =C2=B1  3%  hackbench.time.mino=
r_page_faults
      1618 =C2=B1  0%     +13.2%       1832 =C2=B1  0%  hackbench.time.maxi=
mum_resident_set_size
       315 =C2=B1  6%      +9.6%        345 =C2=B1  1%  uptime.idle
    338987 =C2=B1  1%      +2.2%     346412 =C2=B1  1%  vmstat.system.in
   2463979 =C2=B1  0%      +0.5%    2475874 =C2=B1  0%  vmstat.system.cs
      1618 =C2=B1  0%     +13.2%       1832 =C2=B1  0%  time.maximum_reside=
nt_set_size
        44 =C2=B1  1%     +14.3%         51 =C2=B1  1%  turbostat.CoreTmp
        48 =C2=B1  1%     +14.2%         55 =C2=B1  0%  turbostat.PkgTmp
    722615 =C2=B1  3%     +12.9%     815587 =C2=B1  2%  proc-vmstat.pgfault
   1571718 =C2=B1  9%     +10.5%    1736857 =C2=B1  7%  cpuidle.C1-HSW.usage
      8.26 =C2=B1 10%     +30.3%      10.76 =C2=B1 13%  perf-profile.cpu-cy=
cles._raw_spin_lock_irqsave.__wake_up_sync_key.pipe_write.__vfs_write.vfs_w=
rite
      1.62 =C2=B1  2%     -11.3%       1.44 =C2=B1  1%  perf-profile.cpu-cy=
cles.__module_text_address.is_module_text_address.__kernel_text_address.pri=
nt_context_stack.dump_trace
      0.85 =C2=B1 18%     -29.4%       0.60 =C2=B1  6%  perf-profile.cpu-cy=
cles._raw_spin_lock_irqsave.__account_scheduler_latency.enqueue_entity.enqu=
eue_task_fair.enqueue_task
      1.36 =C2=B1  5%     -18.1%       1.11 =C2=B1  7%  perf-profile.cpu-cy=
cles.check_preempt_curr.ttwu_do_wakeup.ttwu_do_activate.try_to_wake_up.defa=
ult_wake_function
      4.02 =C2=B1  2%     -10.9%       3.58 =C2=B1  0%  perf-profile.cpu-cy=
cles.is_module_text_address.__kernel_text_address.print_context_stack.dump_=
trace.save_stack_trace_tsk
      1.38 =C2=B1  2%     -25.1%       1.04 =C2=B1  0%  perf-profile.cpu-cy=
cles.idle_cpu.select_idle_sibling.select_task_rq_fair.try_to_wake_up.defaul=
t_wake_function
      2.05 =C2=B1  2%     -13.3%       1.77 =C2=B1  1%  perf-profile.cpu-cy=
cles.is_module_text_address.print_context_stack.dump_trace.save_stack_trace=
_tsk.__account_scheduler_latency
      1.39 =C2=B1  6%     +50.9%       2.10 =C2=B1  1%  perf-profile.cpu-cy=
cles.mutex_lock.pipe_write.__vfs_write.vfs_write.sys_write
      2.51 =C2=B1  2%     -13.6%       2.17 =C2=B1  1%  perf-profile.cpu-cy=
cles.select_idle_sibling.select_task_rq_fair.try_to_wake_up.default_wake_fu=
nction.autoremove_wake_function
      0.43 =C2=B1 24%    +179.3%       1.19 =C2=B1  0%  perf-profile.cpu-cy=
cles.__mutex_lock_slowpath.mutex_lock.pipe_write.__vfs_write.vfs_write
      0.39 =C2=B1 28%    +197.2%       1.17 =C2=B1  1%  perf-profile.cpu-cy=
cles.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_lock.pipe_write.__vf=
s_write
      7166 =C2=B1  4%      +5.9%       7590 =C2=B1  5%  latency_stats.avg.p=
ipe_write.__vfs_write.vfs_write.SyS_write.system_call_fastpath
      2341 =C2=B1  3%     +15.1%       2694 =C2=B1  0%  latency_stats.avg.p=
ipe_wait.wait_for_partner.fifo_open.do_dentry_open.vfs_open.do_last.path_op=
enat.do_filp_open.do_sys_open.SyS_open.system_call_fastpath
      3890 =C2=B1 39%     +67.8%       6528 =C2=B1 14%  latency_stats.avg.r=
pc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_do_close.[nfsv4]._=
_nfs4_close.[nfsv4].nfs4_close_sync.[nfsv4].nfs4_close_context.[nfsv4].__pu=
t_nfs_open_context.nfs_release.nfs_file_release.__fput.____fput.task_work_r=
un
      7389 =C2=B1 19%     +52.8%      11288 =C2=B1  0%  latency_stats.avg.r=
pc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_run_open_task.[nfs=
v4]._nfs4_open_and_get_state.[nfsv4].nfs4_do_open.[nfsv4].nfs4_atomic_open.=
[nfsv4].nfs4_file_open.[nfsv4].do_dentry_open.vfs_open.do_last.path_openat.=
do_filp_open
      1115 =C2=B1 27%     +29.5%       1444 =C2=B1 13%  latency_stats.avg.p=
ipe_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
    744335 =C2=B1  9%     +16.3%     865457 =C2=B1  6%  latency_stats.hits.=
pipe_wait.pipe_write.__vfs_write.vfs_write.SyS_write.system_call_fastpath
         3 =C2=B1 30%     -60.5%          1 =C2=B1 33%  latency_stats.hits.=
call_rwsem_down_read_failed.__access_remote_vm.access_process_vm.get_cmdlin=
e.proc_pid_cmdline.proc_single_show.seq_read.__vfs_read.vfs_read.SyS_read.s=
ystem_call_fastpath
      2928 =C2=B1  8%     +14.8%       3363 =C2=B1  1%  latency_stats.max.p=
ipe_wait.wait_for_partner.fifo_open.do_dentry_open.vfs_open.do_last.path_op=
enat.do_filp_open.do_sys_open.SyS_open.system_call_fastpath
 2.431e+08 =C2=B1  4%     +13.5%  2.759e+08 =C2=B1  6%  latency_stats.sum.p=
ipe_write.__vfs_write.vfs_write.SyS_write.system_call_fastpath
    495080 =C2=B1 18%     +55.1%     767813 =C2=B1  3%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_run_open_task.[nfs=
v4]._nfs4_open_and_get_state.[nfsv4].nfs4_do_open.[nfsv4].nfs4_atomic_open.=
[nfsv4].nfs4_file_open.[nfsv4].do_dentry_open.vfs_open.do_last.path_openat.=
do_filp_open
    266630 =C2=B1 28%     +33.8%     356769 =C2=B1 16%  latency_stats.sum.p=
ipe_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
  2.14e+08 =C2=B1  5%     +11.9%  2.394e+08 =C2=B1  1%  latency_stats.sum.p=
ipe_wait.pipe_write.__vfs_write.vfs_write.SyS_write.system_call_fastpath
    259834 =C2=B1 39%     +70.1%     442053 =C2=B1 11%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_do_close.[nfsv4]._=
_nfs4_close.[nfsv4].nfs4_close_sync.[nfsv4].nfs4_close_context.[nfsv4].__pu=
t_nfs_open_context.nfs_release.nfs_file_release.__fput.____fput.task_work_r=
un
     23417 =C2=B1  3%     +15.1%      26944 =C2=B1  0%  latency_stats.sum.p=
ipe_wait.wait_for_partner.fifo_open.do_dentry_open.vfs_open.do_last.path_op=
enat.do_filp_open.do_sys_open.SyS_open.system_call_fastpath
       940 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.tg_runnable_contrib
     14950 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.tg->runnable_avg
     43216 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.avg->runnable_avg_sum
     46678 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.avg->avg_period
     46613 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.avg->avg_period
     43054 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.avg->runnable_avg_sum
     14951 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.tg->runnable_avg
       937 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.tg_runnable_contrib
     14951 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.tg->runnable_avg
     42728 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.avg->runnable_avg_sum
     46646 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.avg->avg_period
       929 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.tg_runnable_contrib
       932 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.tg_runnable_contrib
       791 =C2=B1 11%     +15.9%        916 =C2=B1  2%  sched_debug.cfs_rq[=
12]:/.utilization_load_avg
     14951 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.tg->runnable_avg
     42892 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.avg->runnable_avg_sum
     46665 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.avg->avg_period
       400 =C2=B1 47%    +102.8%        812 =C2=B1 30%  sched_debug.cfs_rq[=
12]:/.tg_load_contrib
     46644 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.avg->avg_period
     42692 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.avg->runnable_avg_sum
     14948 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.tg->runnable_avg
       930 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.tg_runnable_contrib
     46667 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.avg->avg_period
       933 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.tg_runnable_contrib
     14948 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.tg->runnable_avg
     42887 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.avg->runnable_avg_sum
     42836 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.avg->runnable_avg_sum
        58 =C2=B1  7%     +11.7%         65 =C2=B1  7%  sched_debug.cfs_rq[=
15]:/.runnable_load_avg
     46710 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.avg->avg_period
       930 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.tg_runnable_contrib
     14949 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.tg->runnable_avg
       787 =C2=B1 12%     +19.8%        942 =C2=B1  6%  sched_debug.cfs_rq[=
15]:/.utilization_load_avg
     14950 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.tg->runnable_avg
        53 =C2=B1  3%      +8.6%         58 =C2=B1  5%  sched_debug.cfs_rq[=
1]:/.load
     42823 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.avg->runnable_avg_sum
     46672 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.avg->avg_period
       931 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.tg_runnable_contrib
     46677 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.avg->avg_period
     43182 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.avg->runnable_avg_sum
     14950 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.tg->runnable_avg
       939 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.tg_runnable_contrib
     46728 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.avg->avg_period
     42966 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.avg->runnable_avg_sum
     14951 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.tg->runnable_avg
       933 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.tg_runnable_contrib
     42765 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.avg->runnable_avg_sum
     14951 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.tg->runnable_avg
       930 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.tg_runnable_contrib
        57 =C2=B1  8%     +11.9%         64 =C2=B1  6%  sched_debug.cfs_rq[=
4]:/.load
     46709 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.avg->avg_period
     42694 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.avg->runnable_avg_sum
       930 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.tg_runnable_contrib
     46591 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.avg->avg_period
     14951 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.tg->runnable_avg
     42763 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.avg->runnable_avg_sum
     14952 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.tg->runnable_avg
       932 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.tg_runnable_contrib
     46575 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.avg->avg_period
     14952 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.tg->runnable_avg
     46588 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.avg->avg_period
       930 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.tg_runnable_contrib
     42771 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.avg->runnable_avg_sum
     14951 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.tg->runnable_avg
       941 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.tg_runnable_contrib
     43194 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.avg->runnable_avg_sum
     46602 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.avg->avg_period
       943 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.tg_runnable_contrib
      1014 =C2=B1 13%     -17.1%        840 =C2=B1  1%  sched_debug.cfs_rq[=
9]:/.utilization_load_avg
     14950 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.tg->runnable_avg
     43297 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.avg->runnable_avg_sum
     46635 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.avg->avg_period
     48102 =C2=B1 34%     +32.4%      63691 =C2=B1 13%  sched_debug.cpu#0.s=
ched_goidle
   9318011 =C2=B1  5%      +6.8%    9953473 =C2=B1  4%  sched_debug.cpu#0.t=
twu_local
        54 =C2=B1  3%      +9.8%         59 =C2=B1  4%  sched_debug.cpu#1.l=
oad
     52617 =C2=B1 13%     +27.4%      67028 =C2=B1 15%  sched_debug.cpu#1.s=
ched_goidle
     47433 =C2=B1 26%     +35.9%      64439 =C2=B1 14%  sched_debug.cpu#14.=
sched_goidle
        57 =C2=B1  7%     +23.7%         71 =C2=B1  2%  sched_debug.cpu#15.=
cpu_load[0]
        57 =C2=B1  7%     +13.2%         64 =C2=B1  2%  sched_debug.cpu#15.=
cpu_load[2]
    380681 =C2=B1 15%     -38.2%     235115 =C2=B1 13%  sched_debug.cpu#15.=
avg_idle
        57 =C2=B1  7%     +18.0%         67 =C2=B1  2%  sched_debug.cpu#15.=
cpu_load[1]
        57 =C2=B1  7%      +8.9%         62 =C2=B1  5%  sched_debug.cpu#4.l=
oad
    354291 =C2=B1 17%     -33.8%     234565 =C2=B1  2%  sched_debug.cpu#6.a=
vg_idle
     48645 =C2=B1 13%     +40.8%      68484 =C2=B1 17%  sched_debug.cpu#7.s=
ched_goidle

testcase/path_params/tbox_group: hackbench/performance-50%-process-socket/l=
kp-hsw01

        v4.1-rc1  2b7928c943449ab2b5f4fa4c2d  =

----------------  --------------------------  =

     27862 =C2=B1  1%      +9.8%      30602 =C2=B1  2%  hackbench.throughput
     38695 =C2=B1  1%      -9.1%      35192 =C2=B1  2%  hackbench.time.syst=
em_time
      1605 =C2=B1  1%     +11.4%       1788 =C2=B1  0%  hackbench.time.maxi=
mum_resident_set_size
       707 =C2=B1  1%      -8.9%        643 =C2=B1  2%  hackbench.time.elap=
sed_time
       707 =C2=B1  1%      -8.9%        643 =C2=B1  2%  hackbench.time.elap=
sed_time.max
    258791 =C2=B1  4%     +12.8%     291791 =C2=B1  4%  vmstat.system.in
   2507884 =C2=B1  1%      +8.5%    2720579 =C2=B1  0%  vmstat.system.cs
           :5           50%           1:2     dmesg.Unexpected_close,not_st=
opping_watchdog
      1605 =C2=B1  1%     +11.4%       1788 =C2=B1  0%  time.maximum_reside=
nt_set_size
    258.29 =C2=B1  0%      +2.6%     265.03 =C2=B1  0%  turbostat.PkgWatt
     32.32 =C2=B1  1%      -4.3%      30.91 =C2=B1  0%  turbostat.RAMWatt
      2947 =C2=B1  1%     +11.3%       3280 =C2=B1  2%  slabinfo.kmalloc-20=
48.active_objs
      3052 =C2=B1  1%     +10.1%       3361 =C2=B1  2%  slabinfo.kmalloc-20=
48.num_objs
      5822 =C2=B1  3%      +8.5%       6315 =C2=B1  1%  slabinfo.kmalloc-96=
.active_objs
      5872 =C2=B1  3%      +8.2%       6354 =C2=B1  1%  slabinfo.kmalloc-96=
.num_objs
     86801 =C2=B1 16%     -18.7%      70543 =C2=B1  0%  numa-meminfo.node0.=
Slab
     25189 =C2=B1 26%     +27.1%      32021 =C2=B1  2%  numa-meminfo.node1.=
PageTables
     75062 =C2=B1 16%     +21.1%      90872 =C2=B1  2%  numa-meminfo.node1.=
SUnreclaim
     97723 =C2=B1 13%     +18.1%     115405 =C2=B1  0%  numa-meminfo.node1.=
Slab
     22660 =C2=B1  5%      +8.3%      24532 =C2=B1  3%  numa-meminfo.node1.=
SReclaimable
     35441 =C2=B1 10%      +7.7%      38185 =C2=B1  5%  numa-meminfo.node1.=
AnonPages
      6296 =C2=B1 26%     +27.1%       8000 =C2=B1  2%  numa-vmstat.node1.n=
r_page_table_pages
     18765 =C2=B1 16%     +21.0%      22715 =C2=B1  2%  numa-vmstat.node1.n=
r_slab_unreclaimable
      5664 =C2=B1  5%      +8.3%       6132 =C2=B1  3%  numa-vmstat.node1.n=
r_slab_reclaimable
      8862 =C2=B1 10%      +7.7%       9542 =C2=B1  5%  numa-vmstat.node1.n=
r_anon_pages
     16.89 =C2=B1  5%      +6.8%      18.04 =C2=B1  2%  perf-profile.cpu-cy=
cles.vfs_read.sys_read.system_call_fastpath
     17.11 =C2=B1  5%      +6.9%      18.29 =C2=B1  2%  perf-profile.cpu-cy=
cles.sys_read.system_call_fastpath
     15.63 =C2=B1  4%      +5.7%      16.51 =C2=B1  2%  perf-profile.cpu-cy=
cles.unix_stream_recvmsg.sock_recvmsg.sock_read_iter.__vfs_read.vfs_read
      6.18 =C2=B1  2%      +7.4%       6.63 =C2=B1  0%  perf-profile.cpu-cy=
cles.print_context_stack.dump_trace.save_stack_trace_tsk.__account_schedule=
r_latency.enqueue_entity
       265 =C2=B1  0%      -8.5%        242 =C2=B1  0%  latency_stats.avg.u=
nix_stream_recvmsg.sock_recvmsg.sock_read_iter.__vfs_read.vfs_read.SyS_read=
.system_call_fastpath
       236 =C2=B1  3%     +19.7%        282 =C2=B1  1%  latency_stats.avg.d=
o_wait.SyS_wait4.system_call_fastpath
      1682 =C2=B1  4%     +14.8%       1932 =C2=B1  4%  latency_stats.avg.p=
ipe_wait.wait_for_partner.fifo_open.do_dentry_open.vfs_open.do_last.path_op=
enat.do_filp_open.do_sys_open.SyS_open.system_call_fastpath
       131 =C2=B1  5%     +11.9%        147 =C2=B1  5%  latency_stats.avg.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
        52 =C2=B1 23%     +27.9%         66 =C2=B1 20%  latency_stats.avg.u=
nix_wait_for_peer.unix_dgram_sendmsg.sock_sendmsg.___sys_sendmsg.__sys_send=
msg.SyS_sendmsg.system_call_fastpath
    395934 =C2=B1  4%      +4.5%     413661 =C2=B1  5%  latency_stats.hits.=
sock_alloc_send_pskb.unix_stream_sendmsg.sock_sendmsg.sock_write_iter.__vfs=
_write.vfs_write.SyS_write.system_call_fastpath
      3397 =C2=B1 18%     +27.0%       4315 =C2=B1  0%  latency_stats.max.w=
ait_woken.inotify_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
 2.976e+11 =C2=B1  2%      -8.7%  2.718e+11 =C2=B1  2%  latency_stats.sum.u=
nix_stream_recvmsg.sock_recvmsg.sock_read_iter.__vfs_read.vfs_read.SyS_read=
.system_call_fastpath
     17514 =C2=B1  7%     +10.4%      19329 =C2=B1  4%  latency_stats.sum.p=
ipe_wait.wait_for_partner.fifo_open.do_dentry_open.vfs_open.do_last.path_op=
enat.do_filp_open.do_sys_open.SyS_open.system_call_fastpath
   1339347 =C2=B1  2%     +13.1%    1514913 =C2=B1  0%  latency_stats.sum.d=
o_wait.SyS_wait4.system_call_fastpath
  4.21e+08 =C2=B1  4%      +3.3%   4.35e+08 =C2=B1  5%  latency_stats.sum.s=
ock_alloc_send_pskb.unix_stream_sendmsg.sock_sendmsg.sock_write_iter.__vfs_=
write.vfs_write.SyS_write.system_call_fastpath
       559 =C2=B1 18%     +22.0%        682 =C2=B1  5%  latency_stats.sum.u=
nix_wait_for_peer.unix_dgram_sendmsg.sock_sendmsg.___sys_sendmsg.__sys_send=
msg.SyS_sendmsg.system_call_fastpath
       933 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.tg_runnable_contrib
     52333 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.tg->runnable_avg
     42924 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.avg->runnable_avg_sum
     46614 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.avg->avg_period
     46663 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.avg->avg_period
     42986 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.avg->runnable_avg_sum
     52332 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.tg->runnable_avg
       937 =C2=B1  1%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.tg_runnable_contrib
     52332 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.tg->runnable_avg
     42796 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.avg->runnable_avg_sum
     46622 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.avg->avg_period
       932 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.tg_runnable_contrib
       933 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.tg_runnable_contrib
     52332 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.tg->runnable_avg
     42869 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.avg->runnable_avg_sum
     46678 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.avg->avg_period
     46622 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.avg->avg_period
     42808 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.avg->runnable_avg_sum
     52332 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.tg->runnable_avg
       932 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.tg_runnable_contrib
     46530 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.avg->avg_period
       892 =C2=B1  1%     +13.2%       1010 =C2=B1  2%  sched_debug.cfs_rq[=
14]:/.utilization_load_avg
       932 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.tg_runnable_contrib
  20592040 =C2=B1  3%     -11.0%   18324814 =C2=B1  1%  sched_debug.cfs_rq[=
14]:/.min_vruntime
     52331 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.tg->runnable_avg
    331941 =C2=B1  0%      -9.2%     301392 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.exec_clock
     42735 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.avg->runnable_avg_sum
     42851 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.avg->runnable_avg_sum
     46659 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.avg->avg_period
       933 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.tg_runnable_contrib
     52332 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.tg->runnable_avg
  20588217 =C2=B1  2%      -9.8%   18577143 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.min_vruntime
       893 =C2=B1  6%     -19.0%        724 =C2=B1  4%  sched_debug.cfs_rq[=
16]:/.utilization_load_avg
       935 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
16]:/.tg_runnable_contrib
     52331 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
16]:/.tg->runnable_avg
  20595204 =C2=B1  3%      -9.9%   18558521 =C2=B1  0%  sched_debug.cfs_rq[=
16]:/.min_vruntime
     42932 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
16]:/.avg->runnable_avg_sum
     46606 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
16]:/.avg->avg_period
       936 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
17]:/.tg_runnable_contrib
  20468019 =C2=B1  3%      -9.9%   18440770 =C2=B1  0%  sched_debug.cfs_rq[=
17]:/.min_vruntime
     42942 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
17]:/.avg->runnable_avg_sum
     46628 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
17]:/.avg->avg_period
     52332 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
17]:/.tg->runnable_avg
     46653 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
18]:/.avg->avg_period
     42900 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
18]:/.avg->runnable_avg_sum
  20484345 =C2=B1  2%      -9.8%   18473899 =C2=B1  0%  sched_debug.cfs_rq[=
18]:/.min_vruntime
     52331 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
18]:/.tg->runnable_avg
       932 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
18]:/.tg_runnable_contrib
     52331 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
19]:/.tg->runnable_avg
     46620 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
19]:/.avg->avg_period
     42888 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
19]:/.avg->runnable_avg_sum
       933 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
19]:/.tg_runnable_contrib
     52333 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.tg->runnable_avg
     42895 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.avg->runnable_avg_sum
     46581 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.avg->avg_period
       935 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.tg_runnable_contrib
    331215 =C2=B1  0%      -9.2%     300883 =C2=B1  0%  sched_debug.cfs_rq[=
20]:/.exec_clock
  20488169 =C2=B1  3%      -9.7%   18506612 =C2=B1  0%  sched_debug.cfs_rq[=
20]:/.min_vruntime
     46630 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
20]:/.avg->avg_period
     43194 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
20]:/.avg->runnable_avg_sum
     52331 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
20]:/.tg->runnable_avg
       939 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
20]:/.tg_runnable_contrib
     42827 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
21]:/.avg->runnable_avg_sum
     52332 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
21]:/.tg->runnable_avg
  20469297 =C2=B1  3%     -10.7%   18283701 =C2=B1  0%  sched_debug.cfs_rq[=
21]:/.min_vruntime
       933 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
21]:/.tg_runnable_contrib
     46613 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
21]:/.avg->avg_period
     42883 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
22]:/.avg->runnable_avg_sum
     52331 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
22]:/.tg->runnable_avg
       935 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
22]:/.tg_runnable_contrib
     46625 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
22]:/.avg->avg_period
  20527055 =C2=B1  2%     -10.5%   18370408 =C2=B1  2%  sched_debug.cfs_rq[=
22]:/.min_vruntime
     52332 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
23]:/.tg->runnable_avg
       934 =C2=B1  2%     -24.5%        705 =C2=B1 16%  sched_debug.cfs_rq[=
23]:/.utilization_load_avg
       937 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
23]:/.tg_runnable_contrib
  20426460 =C2=B1  3%      -8.4%   18709207 =C2=B1  0%  sched_debug.cfs_rq[=
23]:/.min_vruntime
     43085 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
23]:/.avg->runnable_avg_sum
     46670 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
23]:/.avg->avg_period
     46598 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
24]:/.avg->avg_period
     42884 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
24]:/.avg->runnable_avg_sum
     52332 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
24]:/.tg->runnable_avg
       933 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
24]:/.tg_runnable_contrib
  20547860 =C2=B1  3%      -9.9%   18516464 =C2=B1  0%  sched_debug.cfs_rq[=
24]:/.min_vruntime
    331802 =C2=B1  0%      -9.3%     300810 =C2=B1  0%  sched_debug.cfs_rq[=
25]:/.exec_clock
     52332 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
25]:/.tg->runnable_avg
     42983 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
25]:/.avg->runnable_avg_sum
       936 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
25]:/.tg_runnable_contrib
  20430164 =C2=B1  3%      -9.4%   18518274 =C2=B1  0%  sched_debug.cfs_rq[=
25]:/.min_vruntime
     46614 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
25]:/.avg->avg_period
       812 =C2=B1  8%     +21.1%        984 =C2=B1  3%  sched_debug.cfs_rq[=
26]:/.utilization_load_avg
  20414452 =C2=B1  3%     -10.2%   18332930 =C2=B1  0%  sched_debug.cfs_rq[=
26]:/.min_vruntime
     46650 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
26]:/.avg->avg_period
     43087 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
26]:/.avg->runnable_avg_sum
     52332 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
26]:/.tg->runnable_avg
       937 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
26]:/.tg_runnable_contrib
     52333 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
27]:/.tg->runnable_avg
     42788 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
27]:/.avg->runnable_avg_sum
     46644 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
27]:/.avg->avg_period
       932 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
27]:/.tg_runnable_contrib
        15 =C2=B1  4%     +11.8%         17 =C2=B1  0%  sched_debug.cfs_rq[=
27]:/.load
       935 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
28]:/.tg_runnable_contrib
     52333 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
28]:/.tg->runnable_avg
     42939 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
28]:/.avg->runnable_avg_sum
     46627 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
28]:/.avg->avg_period
    331116 =C2=B1  0%      -9.1%     300867 =C2=B1  0%  sched_debug.cfs_rq[=
28]:/.exec_clock
       933 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
29]:/.tg_runnable_contrib
     52333 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
29]:/.tg->runnable_avg
     42863 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
29]:/.avg->runnable_avg_sum
     46594 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
29]:/.avg->avg_period
     46654 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.avg->avg_period
     43260 =C2=B1  1%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.avg->runnable_avg_sum
     52333 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.tg->runnable_avg
       941 =C2=B1  1%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.tg_runnable_contrib
        16 =C2=B1 12%     -20.7%         13 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.load
     46650 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
30]:/.avg->avg_period
     43105 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
30]:/.avg->runnable_avg_sum
     52334 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
30]:/.tg->runnable_avg
       938 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
30]:/.tg_runnable_contrib
     46659 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
31]:/.avg->avg_period
     42949 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
31]:/.avg->runnable_avg_sum
     52333 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
31]:/.tg->runnable_avg
       934 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
31]:/.tg_runnable_contrib
       932 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
32]:/.tg_runnable_contrib
     46656 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
32]:/.avg->avg_period
     42879 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
32]:/.avg->runnable_avg_sum
     52333 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
32]:/.tg->runnable_avg
       873 =C2=B1  5%      +8.0%        943 =C2=B1  7%  sched_debug.cfs_rq[=
32]:/.utilization_load_avg
     46618 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
33]:/.avg->avg_period
     42783 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
33]:/.avg->runnable_avg_sum
       931 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
33]:/.tg_runnable_contrib
     52332 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
33]:/.tg->runnable_avg
     46569 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
34]:/.avg->avg_period
     42731 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
34]:/.avg->runnable_avg_sum
     52332 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
34]:/.tg->runnable_avg
       929 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
34]:/.tg_runnable_contrib
       932 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
35]:/.tg_runnable_contrib
     52332 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
35]:/.tg->runnable_avg
     42789 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
35]:/.avg->runnable_avg_sum
     46664 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
35]:/.avg->avg_period
     46532 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
36]:/.avg->avg_period
     42725 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
36]:/.avg->runnable_avg_sum
     52332 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
36]:/.tg->runnable_avg
       934 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
36]:/.tg_runnable_contrib
       932 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
37]:/.tg_runnable_contrib
     52332 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
37]:/.tg->runnable_avg
     42768 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
37]:/.avg->runnable_avg_sum
     46626 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
37]:/.avg->avg_period
    330756 =C2=B1  0%      -9.1%     300676 =C2=B1  0%  sched_debug.cfs_rq[=
37]:/.exec_clock
     52332 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
38]:/.tg->runnable_avg
       931 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
38]:/.tg_runnable_contrib
     42774 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
38]:/.avg->runnable_avg_sum
     46707 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
38]:/.avg->avg_period
     46676 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
39]:/.avg->avg_period
     42819 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
39]:/.avg->runnable_avg_sum
     52333 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
39]:/.tg->runnable_avg
    330880 =C2=B1  0%      -9.1%     300798 =C2=B1  0%  sched_debug.cfs_rq[=
39]:/.exec_clock
       930 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
39]:/.tg_runnable_contrib
     46713 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.avg->avg_period
     42968 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.avg->runnable_avg_sum
     52333 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.tg->runnable_avg
       824 =C2=B1  7%     +19.1%        982 =C2=B1  6%  sched_debug.cfs_rq[=
3]:/.utilization_load_avg
       935 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.tg_runnable_contrib
    330882 =C2=B1  0%      -9.1%     300797 =C2=B1  0%  sched_debug.cfs_rq[=
40]:/.exec_clock
       932 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
40]:/.tg_runnable_contrib
     52333 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
40]:/.tg->runnable_avg
     42917 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
40]:/.avg->runnable_avg_sum
     46696 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
40]:/.avg->avg_period
     42814 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
41]:/.avg->runnable_avg_sum
     52333 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
41]:/.tg->runnable_avg
       934 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
41]:/.tg_runnable_contrib
     46590 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
41]:/.avg->avg_period
       936 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
42]:/.tg_runnable_contrib
     46699 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
42]:/.avg->avg_period
     43065 =C2=B1  1%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
42]:/.avg->runnable_avg_sum
     52333 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
42]:/.tg->runnable_avg
  20668911 =C2=B1  2%     -10.7%   18449483 =C2=B1  1%  sched_debug.cfs_rq[=
42]:/.min_vruntime
  20537553 =C2=B1  3%      -9.2%   18641244 =C2=B1  0%  sched_debug.cfs_rq[=
43]:/.min_vruntime
       932 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
43]:/.tg_runnable_contrib
     52333 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
43]:/.tg->runnable_avg
     42804 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
43]:/.avg->runnable_avg_sum
     46621 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
43]:/.avg->avg_period
     52333 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
44]:/.tg->runnable_avg
     46620 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
44]:/.avg->avg_period
  20718726 =C2=B1  4%      -9.7%   18714360 =C2=B1  0%  sched_debug.cfs_rq[=
44]:/.min_vruntime
        14 =C2=B1  7%     +28.5%         18 =C2=B1 13%  sched_debug.cfs_rq[=
44]:/.load
     42808 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
44]:/.avg->runnable_avg_sum
       931 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
44]:/.tg_runnable_contrib
     46593 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
45]:/.avg->avg_period
     42801 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
45]:/.avg->runnable_avg_sum
     52333 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
45]:/.tg->runnable_avg
       933 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
45]:/.tg_runnable_contrib
  20512931 =C2=B1  3%      -9.4%   18587839 =C2=B1  0%  sched_debug.cfs_rq[=
45]:/.min_vruntime
       862 =C2=B1 10%     +16.0%       1001 =C2=B1  2%  sched_debug.cfs_rq[=
45]:/.utilization_load_avg
       931 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
46]:/.tg_runnable_contrib
     52333 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
46]:/.tg->runnable_avg
  20579408 =C2=B1  2%      -9.7%   18590051 =C2=B1  0%  sched_debug.cfs_rq[=
46]:/.min_vruntime
     42803 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
46]:/.avg->runnable_avg_sum
     46630 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
46]:/.avg->avg_period
     46681 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
47]:/.avg->avg_period
     52333 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
47]:/.tg->runnable_avg
  20593845 =C2=B1  3%     -10.2%   18495223 =C2=B1  2%  sched_debug.cfs_rq[=
47]:/.min_vruntime
       935 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
47]:/.tg_runnable_contrib
     42944 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
47]:/.avg->runnable_avg_sum
       935 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
48]:/.tg_runnable_contrib
     46690 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
48]:/.avg->avg_period
     42993 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
48]:/.avg->runnable_avg_sum
     52332 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
48]:/.tg->runnable_avg
  20606274 =C2=B1  3%      -9.8%   18579747 =C2=B1  0%  sched_debug.cfs_rq[=
48]:/.min_vruntime
  20578089 =C2=B1  3%     -11.0%   18304301 =C2=B1  1%  sched_debug.cfs_rq[=
49]:/.min_vruntime
     42835 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
49]:/.avg->runnable_avg_sum
     52333 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
49]:/.tg->runnable_avg
        15 =C2=B1  4%     +15.1%         17 =C2=B1  2%  sched_debug.cfs_rq[=
49]:/.runnable_load_avg
     46616 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
49]:/.avg->avg_period
       933 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
49]:/.tg_runnable_contrib
     43078 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.avg->runnable_avg_sum
     52332 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.tg->runnable_avg
       940 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.tg_runnable_contrib
     46655 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.avg->avg_period
     46640 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
50]:/.avg->avg_period
       932 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
50]:/.tg_runnable_contrib
       931 =C2=B1 10%     -17.1%        772 =C2=B1  2%  sched_debug.cfs_rq[=
50]:/.utilization_load_avg
     52333 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
50]:/.tg->runnable_avg
     42843 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
50]:/.avg->runnable_avg_sum
     46629 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
51]:/.avg->avg_period
     42844 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
51]:/.avg->runnable_avg_sum
       931 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
51]:/.tg_runnable_contrib
     52332 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
51]:/.tg->runnable_avg
  20552087 =C2=B1  2%      -8.8%   18749318 =C2=B1  0%  sched_debug.cfs_rq[=
51]:/.min_vruntime
     46671 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
52]:/.avg->avg_period
     42867 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
52]:/.avg->runnable_avg_sum
  20560179 =C2=B1  3%      -9.7%   18561080 =C2=B1  0%  sched_debug.cfs_rq[=
52]:/.min_vruntime
     52331 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
52]:/.tg->runnable_avg
       936 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
52]:/.tg_runnable_contrib
       852 =C2=B1  2%     +14.4%        974 =C2=B1  1%  sched_debug.cfs_rq[=
53]:/.utilization_load_avg
       933 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
53]:/.tg_runnable_contrib
  20541206 =C2=B1  2%      -9.3%   18628226 =C2=B1  0%  sched_debug.cfs_rq[=
53]:/.min_vruntime
     52331 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
53]:/.tg->runnable_avg
     46653 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
53]:/.avg->avg_period
     42826 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
53]:/.avg->runnable_avg_sum
     52331 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
54]:/.tg->runnable_avg
     46707 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
54]:/.avg->avg_period
     42831 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
54]:/.avg->runnable_avg_sum
  20547268 =C2=B1  3%     -10.5%   18392868 =C2=B1  1%  sched_debug.cfs_rq[=
54]:/.min_vruntime
       931 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
54]:/.tg_runnable_contrib
       930 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
55]:/.tg_runnable_contrib
     52331 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
55]:/.tg->runnable_avg
     46581 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
55]:/.avg->avg_period
     42767 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
55]:/.avg->runnable_avg_sum
     42826 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.avg->runnable_avg_sum
       932 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.tg_runnable_contrib
     46584 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.avg->avg_period
     52332 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.tg->runnable_avg
     43022 =C2=B1  1%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.avg->runnable_avg_sum
     52332 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.tg->runnable_avg
       936 =C2=B1  1%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.tg_runnable_contrib
     46631 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.avg->avg_period
     52332 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.tg->runnable_avg
     46688 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.avg->avg_period
       937 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.tg_runnable_contrib
     43110 =C2=B1  1%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.avg->runnable_avg_sum
     52332 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.tg->runnable_avg
       933 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.tg_runnable_contrib
     42824 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.avg->runnable_avg_sum
     46695 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.avg->avg_period
       935 =C2=B1  1%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.tg_runnable_contrib
     52332 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.tg->runnable_avg
     42983 =C2=B1  1%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.avg->runnable_avg_sum
     46656 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.avg->avg_period
  14483110 =C2=B1  7%      +8.3%   15682365 =C2=B1  2%  sched_debug.cpu#0.s=
ched_count
  14474828 =C2=B1  7%      +8.0%   15626961 =C2=B1  1%  sched_debug.cpu#0.n=
r_switches
    502483 =C2=B1  0%      +8.3%     544289 =C2=B1  6%  sched_debug.cpu#0.m=
ax_idle_balance_cost
    502382 =C2=B1  0%      +7.8%     541658 =C2=B1  7%  sched_debug.cpu#1.m=
ax_idle_balance_cost
  15958855 =C2=B1  1%     -15.9%   13425018 =C2=B1  2%  sched_debug.cpu#1.n=
r_switches
  15971379 =C2=B1  1%     -15.9%   13425342 =C2=B1  2%  sched_debug.cpu#1.s=
ched_count
  15436320 =C2=B1  2%     -11.1%   13724505 =C2=B1  0%  sched_debug.cpu#14.=
nr_switches
  15437922 =C2=B1  2%     -11.1%   13724576 =C2=B1  0%  sched_debug.cpu#14.=
sched_count
  15594930 =C2=B1  7%     -11.9%   13746925 =C2=B1  0%  sched_debug.cpu#15.=
sched_count
  15594052 =C2=B1  7%     -11.8%   13746760 =C2=B1  0%  sched_debug.cpu#15.=
nr_switches
   9354577 =C2=B1  0%      +5.7%    9887727 =C2=B1  4%  sched_debug.cpu#17.=
ttwu_count
         8 =C2=B1  5%     +16.3%         10 =C2=B1  0%  sched_debug.cpu#18.=
nr_running
        14 =C2=B1  2%     +12.7%         16 =C2=B1  0%  sched_debug.cpu#18.=
load
   8927795 =C2=B1  8%      +9.6%    9787704 =C2=B1  2%  sched_debug.cpu#19.=
ttwu_count
  14325877 =C2=B1  5%      +6.0%   15184569 =C2=B1  2%  sched_debug.cpu#2.n=
r_switches
        17 =C2=B1  6%     -14.7%         14 =C2=B1  3%  sched_debug.cpu#2.c=
pu_load[0]
  14720685 =C2=B1  4%      +8.9%   16026669 =C2=B1  2%  sched_debug.cpu#23.=
nr_switches
   4906992 =C2=B1  4%     -17.9%    4029962 =C2=B1  8%  sched_debug.cpu#23.=
ttwu_local
    414954 =C2=B1 31%     -67.1%     136574 =C2=B1 21%  sched_debug.cpu#23.=
avg_idle
   9776311 =C2=B1  5%     -17.8%    8033328 =C2=B1  8%  sched_debug.cpu#23.=
ttwu_count
    299826 =C2=B1 17%     -55.9%     132082 =C2=B1  4%  sched_debug.cpu#26.=
avg_idle
  15574800 =C2=B1  3%     -12.2%   13679447 =C2=B1  3%  sched_debug.cpu#29.=
nr_switches
  15585996 =C2=B1  3%     -12.2%   13679495 =C2=B1  3%  sched_debug.cpu#29.=
sched_count
         8 =C2=B1  4%     +13.6%         10 =C2=B1  0%  sched_debug.cpu#32.=
nr_running
    334665 =C2=B1 32%     -63.3%     122924 =C2=B1 12%  sched_debug.cpu#4.a=
vg_idle
   8740584 =C2=B1  6%      +9.6%    9579024 =C2=B1  2%  sched_debug.cpu#43.=
ttwu_count
    279441 =C2=B1 33%     +77.4%     495859 =C2=B1 35%  sched_debug.cpu#44.=
avg_idle
        14 =C2=B1  5%     +19.9%         17 =C2=B1 14%  sched_debug.cpu#44.=
load
        15 =C2=B1  3%      +7.1%         16 =C2=B1  3%  sched_debug.cpu#45.=
cpu_load[0]
        15 =C2=B1  4%     +13.3%         17 =C2=B1  0%  sched_debug.cpu#46.=
load
         8 =C2=B1  5%     +22.1%         10 =C2=B1  4%  sched_debug.cpu#46.=
nr_running
  15654052 =C2=B1  3%     -13.1%   13609188 =C2=B1  0%  sched_debug.cpu#47.=
sched_count
   4921365 =C2=B1  6%     -10.8%    4388137 =C2=B1  1%  sched_debug.cpu#47.=
ttwu_local
  15654021 =C2=B1  3%     -13.1%   13609154 =C2=B1  0%  sched_debug.cpu#47.=
nr_switches
        15 =C2=B1  4%     +15.1%         17 =C2=B1  2%  sched_debug.cpu#49.=
cpu_load[2]
        15 =C2=B1  3%     +10.4%         17 =C2=B1  5%  sched_debug.cpu#49.=
cpu_load[1]
        15 =C2=B1  4%     +11.8%         17 =C2=B1  5%  sched_debug.cpu#49.=
cpu_load[0]
        15 =C2=B1  4%      +8.6%         16 =C2=B1  3%  sched_debug.cpu#49.=
cpu_load[4]
        15 =C2=B1  4%     +11.8%         17 =C2=B1  0%  sched_debug.cpu#49.=
cpu_load[3]
     16323 =C2=B1 34%     -35.7%      10501 =C2=B1  2%  sched_debug.cpu#50.=
sched_goidle
   5107997 =C2=B1  2%     -20.9%    4042530 =C2=B1  1%  sched_debug.cpu#51.=
ttwu_local
   9865904 =C2=B1  7%     -19.3%    7960228 =C2=B1  1%  sched_debug.cpu#51.=
ttwu_count
     10317 =C2=B1 34%     +97.9%      20417 =C2=B1 16%  sched_debug.cpu#51.=
sched_goidle
   4936196 =C2=B1  4%     -10.2%    4434913 =C2=B1  0%  sched_debug.cpu#6.t=
twu_local
         8 =C2=B1  4%     +13.6%         10 =C2=B1  0%  sched_debug.cpu#6.n=
r_running
    233704 =C2=B1 38%    +104.5%     478016 =C2=B1  2%  sched_debug.cpu#8.a=
vg_idle

testcase/path_params/tbox_group: hackbench/performance-50%-threads-socket/l=
kp-hsw01

        v4.1-rc1  2b7928c943449ab2b5f4fa4c2d  =

----------------  --------------------------  =

           :5           50%           1:2     dmesg.Unexpected_close,not_st=
opping_watchdog
         0 =C2=B1  0%      +Inf%          2 =C2=B1  0%  sched_debug.cpu#46.=
nr_uninterruptible

testcase/path_params/tbox_group: hackbench/powersave-50%-process-socket/lit=
uya

        v4.1-rc1  2b7928c943449ab2b5f4fa4c2d  =

----------------  --------------------------  =

        64 =C2=B1 50%     +21.9%         79 =C2=B1  0%  latency_stats.avg.u=
nix_stream_recvmsg.sock_recvmsg.sock_read_iter.__vfs_read.vfs_read.SyS_read=
.system_call_fastpath
         0 =C2=B1  0%      +Inf%          1 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.nr_running

testcase/path_params/tbox_group: hackbench/performance-1600%-process-pipe/l=
ituya

        v4.1-rc1  2b7928c943449ab2b5f4fa4c2d  =

----------------  --------------------------  =

     89268 =C2=B1  2%      +2.1%      91151 =C2=B1  1%  hackbench.throughput
      0.43 =C2=B1  9%     +59.6%       0.68 =C2=B1  4%  turbostat.RAMWatt
     81560 =C2=B1  5%      +6.7%      87029 =C2=B1  3%  meminfo.DirectMap4k
  39671234 =C2=B1  7%     +11.5%   44221478 =C2=B1  5%  cpuidle.C1-HSW.time
     46582 =C2=B1  5%     +15.9%      54011 =C2=B1 11%  cpuidle.C6-HSW.usage
      1550 =C2=B1  1%      +8.0%       1675 =C2=B1  3%  slabinfo.shmem_inod=
e_cache.num_objs
      1550 =C2=B1  1%      +8.0%       1675 =C2=B1  3%  slabinfo.shmem_inod=
e_cache.active_objs
     29.04 =C2=B1  9%     -58.3%      12.11 =C2=B1 16%  perf-profile.cpu-cy=
cles.vfs_read.sys_read.system_call_fastpath
     30.78 =C2=B1 10%     -59.3%      12.52 =C2=B1 17%  perf-profile.cpu-cy=
cles.sys_read.system_call_fastpath
     44.35 =C2=B1  5%     -36.5%      28.14 =C2=B1 12%  perf-profile.cpu-cy=
cles.__vfs_write.vfs_write.sys_write.system_call_fastpath
     20.05 =C2=B1  7%     -44.7%      11.09 =C2=B1 15%  perf-profile.cpu-cy=
cles.__vfs_read.vfs_read.sys_read.system_call_fastpath
     85.16 =C2=B1  4%     -49.3%      43.16 =C2=B1 14%  perf-profile.cpu-cy=
cles.system_call_fastpath
     51.93 =C2=B1  1%     -42.9%      29.66 =C2=B1 12%  perf-profile.cpu-cy=
cles.vfs_write.sys_write.system_call_fastpath
     53.05 =C2=B1  2%     -43.4%      30.01 =C2=B1 12%  perf-profile.cpu-cy=
cles.sys_write.system_call_fastpath
       246 =C2=B1 30%    +158.7%        638 =C2=B1 49%  latency_stats.avg.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_getattr.[nfsv4].nfs4_proc_getattr.[nfsv4].__nfs=
_revalidate_inode.nfs_getattr.vfs_getattr_nosec.vfs_getattr.vfs_fstat
         0 =C2=B1  0%      +Inf%          4 =C2=B1 50%  latency_stats.avg.c=
all_rwsem_down_write_failed.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.system_ca=
ll_fastpath
      1344 =C2=B1 10%     +13.0%       1519 =C2=B1 10%  latency_stats.avg.w=
ait_woken.inotify_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
        33 =C2=B1 14%     +39.9%         47 =C2=B1 23%  latency_stats.hits.=
pipe_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
         0 =C2=B1  0%      +Inf%          1 =C2=B1  0%  latency_stats.hits.=
call_rwsem_down_write_failed.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.system_c=
all_fastpath
      3347 =C2=B1  2%      +8.0%       3614 =C2=B1  2%  latency_stats.max.h=
rtimer_nanosleep.SyS_nanosleep.system_call_fastpath
         0 =C2=B1  0%      +Inf%          4 =C2=B1 50%  latency_stats.max.c=
all_rwsem_down_write_failed.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.system_ca=
ll_fastpath
         0 =C2=B1  0%      +Inf%          4 =C2=B1 50%  latency_stats.sum.c=
all_rwsem_down_write_failed.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.system_ca=
ll_fastpath
       741 =C2=B1 30%    +158.5%       1915 =C2=B1 49%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_getattr.[nfsv4].nfs4_proc_getattr.[nfsv4].__nfs=
_revalidate_inode.nfs_getattr.vfs_getattr_nosec.vfs_getattr.vfs_fstat
       926 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.tg_runnable_contrib
     14804 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.tg->runnable_avg
     42560 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.avg->runnable_avg_sum
      2929 =C2=B1 19%     -33.7%       1942 =C2=B1 14%  sched_debug.cfs_rq[=
0]:/.utilization_load_avg
     46581 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.avg->avg_period
      2115 =C2=B1 30%     -43.4%       1197 =C2=B1  2%  sched_debug.cfs_rq[=
10]:/.utilization_load_avg
        55 =C2=B1  7%      +6.4%         58 =C2=B1  7%  sched_debug.cfs_rq[=
10]:/.load
     46630 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.avg->avg_period
     21218 =C2=B1  6%     +15.2%      24445 =C2=B1  6%  sched_debug.cfs_rq[=
10]:/.tg_load_avg
     42703 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.avg->runnable_avg_sum
     14810 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.tg->runnable_avg
       929 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.tg_runnable_contrib
      1250 =C2=B1 33%     +90.5%       2382 =C2=B1 11%  sched_debug.cfs_rq[=
11]:/.tg_load_contrib
     14811 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.tg->runnable_avg
      1168 =C2=B1 35%     +95.9%       2288 =C2=B1 10%  sched_debug.cfs_rq[=
11]:/.blocked_load_avg
     42411 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.avg->runnable_avg_sum
     46622 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.avg->avg_period
     21243 =C2=B1  5%     +16.2%      24675 =C2=B1  6%  sched_debug.cfs_rq[=
11]:/.tg_load_avg
       924 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.tg_runnable_contrib
       925 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.tg_runnable_contrib
      1341 =C2=B1  7%     -33.8%        888 =C2=B1 15%  sched_debug.cfs_rq[=
12]:/.utilization_load_avg
     14811 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.tg->runnable_avg
     21074 =C2=B1  8%     +15.8%      24400 =C2=B1  4%  sched_debug.cfs_rq[=
12]:/.tg_load_avg
     42527 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.avg->runnable_avg_sum
     46616 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.avg->avg_period
     46663 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.avg->avg_period
     42297 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.avg->runnable_avg_sum
     14811 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.tg->runnable_avg
       920 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.tg_runnable_contrib
        51 =C2=B1  9%      +9.9%         56 =C2=B1  4%  sched_debug.cfs_rq[=
13]:/.runnable_load_avg
     21674 =C2=B1  9%     +15.4%      25022 =C2=B1  6%  sched_debug.cfs_rq[=
13]:/.tg_load_avg
     46688 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.avg->avg_period
      1352 =C2=B1 14%     -26.3%        997 =C2=B1  7%  sched_debug.cfs_rq[=
14]:/.utilization_load_avg
       922 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.tg_runnable_contrib
   8838431 =C2=B1  1%      +9.9%    9715954 =C2=B1  8%  sched_debug.cfs_rq[=
14]:/.min_vruntime
     14811 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.tg->runnable_avg
     22769 =C2=B1  9%     +12.9%      25714 =C2=B1  2%  sched_debug.cfs_rq[=
14]:/.tg_load_avg
     42370 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.avg->runnable_avg_sum
     42354 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.avg->runnable_avg_sum
     22521 =C2=B1  5%     +15.4%      25993 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.tg_load_avg
     46609 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.avg->avg_period
       921 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.tg_runnable_contrib
     14811 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.tg->runnable_avg
        48 =C2=B1 12%     +20.8%         58 =C2=B1  5%  sched_debug.cfs_rq[=
1]:/.runnable_load_avg
     14804 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.tg->runnable_avg
        48 =C2=B1 14%     +19.3%         58 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.load
     42374 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.avg->runnable_avg_sum
     46611 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.avg->avg_period
       922 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.tg_runnable_contrib
     46587 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.avg->avg_period
     42730 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.avg->runnable_avg_sum
     14805 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.tg->runnable_avg
     20180 =C2=B1  8%     +12.0%      22601 =C2=B1  6%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
       931 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.tg_runnable_contrib
     46656 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.avg->avg_period
     42393 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.avg->runnable_avg_sum
     14808 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.tg->runnable_avg
       760 =C2=B1 41%    +241.4%       2596 =C2=B1 13%  sched_debug.cfs_rq[=
3]:/.blocked_load_avg
       856 =C2=B1 38%    +210.2%       2658 =C2=B1 13%  sched_debug.cfs_rq[=
3]:/.tg_load_contrib
       922 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.tg_runnable_contrib
     20012 =C2=B1  8%     +16.4%      23302 =C2=B1  9%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
     42413 =C2=B1  1%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.avg->runnable_avg_sum
     14809 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.tg->runnable_avg
       924 =C2=B1  1%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.tg_runnable_contrib
     46589 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.avg->avg_period
     42333 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.avg->runnable_avg_sum
       922 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.tg_runnable_contrib
     46609 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.avg->avg_period
     14809 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.tg->runnable_avg
     19746 =C2=B1  4%     +19.0%      23504 =C2=B1 11%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
     42631 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.avg->runnable_avg_sum
       871 =C2=B1 25%     +31.8%       1148 =C2=B1 16%  sched_debug.cfs_rq[=
6]:/.blocked_load_avg
     14809 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.tg->runnable_avg
       928 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.tg_runnable_contrib
     46670 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.avg->avg_period
      2063 =C2=B1 14%     -31.1%       1422 =C2=B1  7%  sched_debug.cfs_rq[=
6]:/.utilization_load_avg
     20612 =C2=B1  8%     +15.1%      23720 =C2=B1  8%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
       930 =C2=B1 23%     +29.3%       1203 =C2=B1 15%  sched_debug.cfs_rq[=
6]:/.tg_load_contrib
     14810 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.tg->runnable_avg
     46691 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.avg->avg_period
     20886 =C2=B1  9%     +10.8%      23149 =C2=B1  5%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
       922 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.tg_runnable_contrib
       753 =C2=B1 20%     +57.8%       1189 =C2=B1  9%  sched_debug.cfs_rq[=
7]:/.blocked_load_avg
       807 =C2=B1 19%     +54.2%       1244 =C2=B1  9%  sched_debug.cfs_rq[=
7]:/.tg_load_contrib
     42449 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.avg->runnable_avg_sum
     14811 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.tg->runnable_avg
         2 =C2=B1 34%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.nr_spread_over
     20551 =C2=B1  5%     +15.6%      23757 =C2=B1  5%  sched_debug.cfs_rq[=
8]:/.tg_load_avg
       928 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.tg_runnable_contrib
     42650 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.avg->runnable_avg_sum
     46657 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.avg->avg_period
        51 =C2=B1  9%     +18.7%         61 =C2=B1  4%  sched_debug.cfs_rq[=
8]:/.load
       929 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.tg_runnable_contrib
   8877516 =C2=B1  4%     +14.5%   10166545 =C2=B1 13%  sched_debug.cfs_rq[=
9]:/.min_vruntime
     14810 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.tg->runnable_avg
     21323 =C2=B1  4%     +11.9%      23869 =C2=B1  7%  sched_debug.cfs_rq[=
9]:/.tg_load_avg
        50 =C2=B1  8%     +21.0%         61 =C2=B1  4%  sched_debug.cfs_rq[=
9]:/.load
        52 =C2=B1  7%     +20.7%         63 =C2=B1  1%  sched_debug.cfs_rq[=
9]:/.runnable_load_avg
     42697 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.avg->runnable_avg_sum
     46638 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.avg->avg_period
         4 =C2=B1 40%     +97.9%          9 =C2=B1 47%  sched_debug.cfs_rq[=
9]:/.nr_spread_over
     28273 =C2=B1 15%     +17.9%      33346 =C2=B1 19%  sched_debug.cpu#0.s=
ched_goidle
        48 =C2=B1 16%     +20.8%         58 =C2=B1  0%  sched_debug.cpu#1.l=
oad
        49 =C2=B1 13%     +18.4%         58 =C2=B1  4%  sched_debug.cpu#1.c=
pu_load[2]
        50 =C2=B1 13%     +17.0%         58 =C2=B1  4%  sched_debug.cpu#1.c=
pu_load[1]
        48 =C2=B1 12%     +20.4%         58 =C2=B1  4%  sched_debug.cpu#1.c=
pu_load[3]
        48 =C2=B1 12%     +19.9%         58 =C2=B1  5%  sched_debug.cpu#1.c=
pu_load[4]
        38 =C2=B1 25%     -45.3%         21 =C2=B1  0%  sched_debug.cpu#10.=
nr_running
        55 =C2=B1  6%      +5.2%         58 =C2=B1  5%  sched_debug.cpu#10.=
load
    822356 =C2=B1  5%     +12.1%     922247 =C2=B1  1%  sched_debug.cpu#12.=
avg_idle
        25 =C2=B1  8%     -35.0%         16 =C2=B1  3%  sched_debug.cpu#12.=
nr_running
    885807 =C2=B1  3%     -17.6%     729680 =C2=B1  0%  sched_debug.cpu#13.=
avg_idle
     25895 =C2=B1 17%     -34.8%      16885 =C2=B1  2%  sched_debug.cpu#14.=
sched_goidle
        27 =C2=B1 24%     -41.2%         16 =C2=B1 12%  sched_debug.cpu#14.=
nr_running
     65015 =C2=B1  9%     +10.0%      71502 =C2=B1  7%  sched_debug.cpu#15.=
curr->pid
        47 =C2=B1 10%     -23.4%         36 =C2=B1  2%  sched_debug.cpu#4.n=
r_running
        52 =C2=B1 11%      +8.7%         56 =C2=B1  7%  sched_debug.cpu#4.c=
pu_load[0]
     26201 =C2=B1 14%     +21.5%      31833 =C2=B1  9%  sched_debug.cpu#5.s=
ched_goidle
     32319 =C2=B1 21%     -31.5%      22142 =C2=B1 18%  sched_debug.cpu#6.s=
ched_goidle
        58 =C2=B1  8%     -13.8%         50 =C2=B1  0%  sched_debug.cpu#6.l=
oad
        43 =C2=B1 15%     -36.9%         27 =C2=B1  5%  sched_debug.cpu#6.n=
r_running
        37 =C2=B1  8%     -26.1%         27 =C2=B1  5%  sched_debug.cpu#7.n=
r_running
     19963 =C2=B1 22%     +39.7%      27895 =C2=B1  2%  sched_debug.cpu#8.s=
ched_goidle
     64661 =C2=B1  8%     +10.0%      71154 =C2=B1  6%  sched_debug.cpu#8.c=
urr->pid
        51 =C2=B1  8%     +19.6%         61 =C2=B1  3%  sched_debug.cpu#8.l=
oad
        34 =C2=B1 11%     -27.3%         25 =C2=B1 16%  sched_debug.cpu#8.n=
r_running
        52 =C2=B1  7%     +20.7%         63 =C2=B1  2%  sched_debug.cpu#9.c=
pu_load[4]
        53 =C2=B1 11%     +19.4%         63 =C2=B1  2%  sched_debug.cpu#9.c=
pu_load[0]
        50 =C2=B1  9%     +22.0%         61 =C2=B1  7%  sched_debug.cpu#9.l=
oad
        53 =C2=B1  7%     +18.5%         63 =C2=B1  2%  sched_debug.cpu#9.c=
pu_load[3]
        53 =C2=B1  9%     +18.9%         63 =C2=B1  2%  sched_debug.cpu#9.c=
pu_load[1]
        53 =C2=B1  7%     +18.9%         63 =C2=B1  2%  sched_debug.cpu#9.c=
pu_load[2]
      0.00 =C2=B1 31%     -74.7%       0.00 =C2=B1 20%  sched_debug.rt_rq[1=
]:/.rt_time
      0.00 =C2=B1 40%     -68.2%       0.00 =C2=B1  4%  sched_debug.rt_rq[2=
]:/.rt_time
      0.00 =C2=B1 27%     -71.4%       0.00 =C2=B1  0%  sched_debug.rt_rq[9=
]:/.rt_time

testcase/path_params/tbox_group: hackbench/performance-1600%-process-socket=
/lituya

        v4.1-rc1  2b7928c943449ab2b5f4fa4c2d  =

----------------  --------------------------  =

       423 =C2=B1  0%      +1.2%        428 =C2=B1  1%  hackbench.time.user=
_time
      4066 =C2=B1  0%     +49.6%       6084 =C2=B1  0%  meminfo.AnonHugePag=
es
  24123797 =C2=B1  5%     +12.0%   27011318 =C2=B1  6%  cpuidle.C1E-HSW.time
   5534053 =C2=B1  7%     +13.5%    6278699 =C2=B1  3%  cpuidle.C3-HSW.time
      3451 =C2=B1  6%      +5.6%       3644 =C2=B1  7%  slabinfo.kmalloc-25=
6.active_slabs
    220949 =C2=B1  6%      +5.6%     233233 =C2=B1  7%  slabinfo.kmalloc-25=
6.num_objs
      3451 =C2=B1  6%      +5.6%       3644 =C2=B1  7%  slabinfo.kmalloc-25=
6.num_slabs
      3364 =C2=B1  6%      +5.7%       3555 =C2=B1  7%  slabinfo.kmalloc-51=
2.num_slabs
      3364 =C2=B1  6%      +5.7%       3555 =C2=B1  7%  slabinfo.kmalloc-51=
2.active_slabs
    215347 =C2=B1  6%      +5.7%     227585 =C2=B1  7%  slabinfo.kmalloc-51=
2.num_objs
     30.33 =C2=B1  6%     -15.0%      25.79 =C2=B1  1%  perf-profile.cpu-cy=
cles.vfs_read.sys_read.system_call_fastpath
      0.86 =C2=B1  7%     +18.6%       1.02 =C2=B1  2%  perf-profile.cpu-cy=
cles.rw_verify_area.vfs_write.sys_write.system_call_fastpath.__write_nocanc=
el
     31.75 =C2=B1  5%     -13.9%      27.34 =C2=B1  1%  perf-profile.cpu-cy=
cles.sys_read.system_call_fastpath
     11.75 =C2=B1  9%     +19.2%      14.00 =C2=B1  1%  perf-profile.cpu-cy=
cles.__vfs_read.vfs_read.sys_read.system_call_fastpath.__read_nocancel
      1.58 =C2=B1  7%     +19.6%       1.90 =C2=B1  1%  perf-profile.cpu-cy=
cles._raw_spin_lock.unix_stream_sendmsg.sock_sendmsg.sock_write_iter.__vfs_=
write
     31.76 =C2=B1  8%     -14.7%      27.08 =C2=B1  0%  perf-profile.cpu-cy=
cles.__vfs_write.vfs_write.sys_write.system_call_fastpath
      4.22 =C2=B1  6%     +11.2%       4.70 =C2=B1  0%  perf-profile.cpu-cy=
cles.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg.sock_sen=
dmsg.sock_write_iter
     23.55 =C2=B1  7%     -18.0%      19.31 =C2=B1  0%  perf-profile.cpu-cy=
cles.__vfs_read.vfs_read.sys_read.system_call_fastpath
      2.18 =C2=B1  8%     +15.5%       2.52 =C2=B1  4%  perf-profile.cpu-cy=
cles.skb_release_data.skb_release_all.consume_skb.unix_stream_recvmsg.sock_=
recvmsg
      1.03 =C2=B1  6%     +15.0%       1.19 =C2=B1  0%  perf-profile.cpu-cy=
cles.skb_release_head_state.skb_release_all.consume_skb.unix_stream_recvmsg=
.sock_recvmsg
      3.90 =C2=B1  6%     +12.5%       4.38 =C2=B1  0%  perf-profile.cpu-cy=
cles.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_send=
msg.sock_sendmsg
      2.07 =C2=B1  7%     +20.8%       2.50 =C2=B1  0%  perf-profile.cpu-cy=
cles.copy_user_enhanced_fast_string.skb_copy_datagram_iter.unix_stream_recv=
msg.sock_recvmsg.sock_read_iter
      1.26 =C2=B1 11%     +17.5%       1.48 =C2=B1  4%  perf-profile.cpu-cy=
cles.kfree_skbmem.consume_skb.unix_stream_recvmsg.sock_recvmsg.sock_read_it=
er
      0.99 =C2=B1 11%     +19.2%       1.19 =C2=B1  0%  perf-profile.cpu-cy=
cles.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_sendmsg.sock_writ=
e_iter.__vfs_write
      1.23 =C2=B1 12%     +17.5%       1.44 =C2=B1  3%  perf-profile.cpu-cy=
cles.kmem_cache_free.kfree_skbmem.consume_skb.unix_stream_recvmsg.sock_recv=
msg
      2.82 =C2=B1  7%     +16.8%       3.29 =C2=B1  0%  perf-profile.cpu-cy=
cles.skb_copy_datagram_iter.unix_stream_recvmsg.sock_recvmsg.sock_read_iter=
.__vfs_read
      1.19 =C2=B1 11%     +17.2%       1.40 =C2=B1  0%  perf-profile.cpu-cy=
cles.rw_verify_area.vfs_read.sys_read.system_call_fastpath.__read_nocancel
     11.78 =C2=B1  8%     +17.9%      13.89 =C2=B1  0%  perf-profile.cpu-cy=
cles.__vfs_write.vfs_write.sys_write.system_call_fastpath.__write_nocancel
     15.46 =C2=B1  8%     +18.1%      18.26 =C2=B1  0%  perf-profile.cpu-cy=
cles.__write_nocancel
     14.58 =C2=B1  8%     +18.0%      17.20 =C2=B1  0%  perf-profile.cpu-cy=
cles.sys_write.system_call_fastpath.__write_nocancel
     14.71 =C2=B1  8%     +18.0%      17.35 =C2=B1  0%  perf-profile.cpu-cy=
cles.system_call_fastpath.__write_nocancel
     14.12 =C2=B1  8%     +18.0%      16.67 =C2=B1  0%  perf-profile.cpu-cy=
cles.vfs_write.sys_write.system_call_fastpath.__write_nocancel
      0.99 =C2=B1 12%     +15.9%       1.15 =C2=B1  2%  perf-profile.cpu-cy=
cles.fsnotify.vfs_write.sys_write.system_call_fastpath.__write_nocancel
     13.50 =C2=B1  9%     +19.1%      16.09 =C2=B1  1%  perf-profile.cpu-cy=
cles.vfs_read.sys_read.system_call_fastpath.__read_nocancel
     14.05 =C2=B1  9%     +19.4%      16.77 =C2=B1  1%  perf-profile.cpu-cy=
cles.system_call_fastpath.__read_nocancel
     13.90 =C2=B1  9%     +19.4%      16.59 =C2=B1  1%  perf-profile.cpu-cy=
cles.sys_read.system_call_fastpath.__read_nocancel
      1.03 =C2=B1 10%     +15.5%       1.19 =C2=B1  0%  perf-profile.cpu-cy=
cles.security_file_permission.rw_verify_area.vfs_read.sys_read.system_call_=
fastpath
     14.87 =C2=B1  9%     +19.3%      17.73 =C2=B1  1%  perf-profile.cpu-cy=
cles.__read_nocancel
       262 =C2=B1  5%      +5.6%        277 =C2=B1  3%  latency_stats.avg.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
       356 =C2=B1 19%     +16.9%        417 =C2=B1  7%  latency_stats.avg.e=
p_poll.SyS_epoll_wait.system_call_fastpath
       319 =C2=B1 16%     +57.5%        503 =C2=B1 20%  latency_stats.avg.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_access.[nfsv4].nfs4_proc_access.[nfsv4].nfs_do_=
access.nfs_permission.__inode_permission.inode_permission.may_open
       337 =C2=B1 24%     +39.5%        471 =C2=B1  1%  latency_stats.avg.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_access.[nfsv4].nfs4_proc_access.[nfsv4].nfs_do_=
access.nfs_permission.__inode_permission.inode_permission.link_path_walk
         0 =C2=B1  0%      +Inf%         79 =C2=B1 30%  latency_stats.avg.p=
ath_lookupat.filename_lookup.user_path_at_empty.user_path_at.SyS_access.sys=
tem_call_fastpath
      2481 =C2=B1 36%     -74.0%        645 =C2=B1 39%  latency_stats.avg.w=
ait_on_page_bit.filemap_fdatawait_range.filemap_write_and_wait_range.nfs4_f=
ile_fsync.[nfsv4].vfs_fsync_range.vfs_fsync.nfs_file_flush.filp_close.do_du=
p2.SyS_dup2.system_call_fastpath
         0 =C2=B1  0%      +Inf%          2 =C2=B1  0%  latency_stats.hits.=
path_lookupat.filename_lookup.user_path_at_empty.user_path_at.SyS_access.sy=
stem_call_fastpath
         4 =C2=B1 27%     -50.0%          2 =C2=B1  0%  latency_stats.hits.=
call_rwsem_down_write_failed.cgroup_post_fork.copy_process.do_fork.SyS_clon=
e.system_call_fastpath
        43 =C2=B1 14%     -43.3%         24 =C2=B1 10%  latency_stats.hits.=
ep_poll.SyS_epoll_wait.system_call_fastpath
       525 =C2=B1 46%     +65.7%        870 =C2=B1 31%  latency_stats.max.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_getattr.[nfsv4].nfs4_proc_getattr.[nfsv4].__nfs=
_revalidate_inode.nfs_getattr.vfs_getattr_nosec.vfs_getattr.vfs_fstat
      3970 =C2=B1  9%     +22.1%       4847 =C2=B1  1%  latency_stats.max.w=
ait_woken.inotify_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
         0 =C2=B1  0%      +Inf%        111 =C2=B1 48%  latency_stats.max.p=
ath_lookupat.filename_lookup.user_path_at_empty.user_path_at.SyS_access.sys=
tem_call_fastpath
     71981 =C2=B1 36%     -74.0%      18711 =C2=B1 39%  latency_stats.sum.w=
ait_on_page_bit.filemap_fdatawait_range.filemap_write_and_wait_range.nfs4_f=
ile_fsync.[nfsv4].vfs_fsync_range.vfs_fsync.nfs_file_flush.filp_close.do_du=
p2.SyS_dup2.system_call_fastpath
         0 =C2=B1  0%      +Inf%        159 =C2=B1 30%  latency_stats.sum.p=
ath_lookupat.filename_lookup.user_path_at_empty.user_path_at.SyS_access.sys=
tem_call_fastpath
     28638 =C2=B1 24%     +49.8%      42898 =C2=B1  0%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_access.[nfsv4].nfs4_proc_access.[nfsv4].nfs_do_=
access.nfs_permission.__inode_permission.inode_permission.link_path_walk
     12111 =C2=B1 17%     +56.3%      18934 =C2=B1 22%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_access.[nfsv4].nfs4_proc_access.[nfsv4].nfs_do_=
access.nfs_permission.__inode_permission.inode_permission.may_open
       925 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.tg_runnable_contrib
     14827 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.tg->runnable_avg
     42532 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.avg->runnable_avg_sum
         7 =C2=B1 37%     -66.2%          2 =C2=B1 20%  sched_debug.cfs_rq[=
0]:/.nr_spread_over
     46644 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.avg->avg_period
     46701 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.avg->avg_period
     42562 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.avg->runnable_avg_sum
     14819 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.tg->runnable_avg
       925 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.tg_runnable_contrib
     14818 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.tg->runnable_avg
       413 =C2=B1 10%     +51.6%        627 =C2=B1  7%  sched_debug.cfs_rq[=
11]:/.utilization_load_avg
     42402 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.avg->runnable_avg_sum
     46657 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.avg->avg_period
        59 =C2=B1 13%     +20.3%         71 =C2=B1  4%  sched_debug.cfs_rq[=
11]:/.runnable_load_avg
       922 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.tg_runnable_contrib
       922 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.tg_runnable_contrib
     14816 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.tg->runnable_avg
     42342 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.avg->runnable_avg_sum
     46603 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.avg->avg_period
     46709 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.avg->avg_period
     42476 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.avg->runnable_avg_sum
     14816 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.tg->runnable_avg
       923 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.tg_runnable_contrib
       490 =C2=B1 28%     +54.0%        755 =C2=B1  4%  sched_debug.cfs_rq[=
13]:/.utilization_load_avg
     46559 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.avg->avg_period
       921 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.tg_runnable_contrib
     14816 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.tg->runnable_avg
     42204 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.avg->runnable_avg_sum
     42452 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.avg->runnable_avg_sum
     46654 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.avg->avg_period
       924 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.tg_runnable_contrib
     14817 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.tg->runnable_avg
     14829 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.tg->runnable_avg
        65 =C2=B1  5%     +16.2%         76 =C2=B1  1%  sched_debug.cfs_rq[=
1]:/.load
     42664 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.avg->runnable_avg_sum
     46580 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.avg->avg_period
       930 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.tg_runnable_contrib
     46682 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.avg->avg_period
     42593 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.avg->runnable_avg_sum
     14825 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.tg->runnable_avg
       926 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.tg_runnable_contrib
     46632 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.avg->avg_period
     42516 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.avg->runnable_avg_sum
     14824 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.tg->runnable_avg
        67 =C2=B1 13%     +18.7%         80 =C2=B1  7%  sched_debug.cfs_rq[=
3]:/.load
        58 =C2=B1  7%     +13.0%         66 =C2=B1  3%  sched_debug.cfs_rq[=
3]:/.runnable_load_avg
         9 =C2=B1 26%     +66.7%         15 =C2=B1 20%  sched_debug.cfs_rq[=
3]:/.nr_spread_over
       925 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.tg_runnable_contrib
     42758 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.avg->runnable_avg_sum
     14825 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.tg->runnable_avg
       932 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.tg_runnable_contrib
     46589 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.avg->avg_period
     42264 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.avg->runnable_avg_sum
       922 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.tg_runnable_contrib
     46553 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.avg->avg_period
     14824 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.tg->runnable_avg
     42505 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.avg->runnable_avg_sum
     14824 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.tg->runnable_avg
       925 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.tg_runnable_contrib
     46660 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.avg->avg_period
     14819 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.tg->runnable_avg
     46623 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.avg->avg_period
       928 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.tg_runnable_contrib
     42584 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.avg->runnable_avg_sum
       584 =C2=B1 16%     -44.2%        326 =C2=B1 16%  sched_debug.cfs_rq[=
8]:/.utilization_load_avg
     14818 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.tg->runnable_avg
       926 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.tg_runnable_contrib
     42542 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.avg->runnable_avg_sum
     46654 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.avg->avg_period
        69 =C2=B1 10%     -23.4%         53 =C2=B1  3%  sched_debug.cfs_rq[=
8]:/.load
       932 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.tg_runnable_contrib
     14818 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.tg->runnable_avg
     42740 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.avg->runnable_avg_sum
     46532 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.avg->avg_period
        59 =C2=B1  4%     -10.2%         53 =C2=B1  0%  sched_debug.cpu#0.c=
pu_load[4]
        59 =C2=B1  3%     -10.2%         53 =C2=B1  0%  sched_debug.cpu#0.c=
pu_load[2]
    684525 =C2=B1 13%     +11.8%     765395 =C2=B1  4%  sched_debug.cpu#0.a=
vg_idle
        59 =C2=B1  3%      -9.4%         54 =C2=B1  0%  sched_debug.cpu#0.c=
pu_load[3]
        64 =C2=B1  6%     +15.7%         75 =C2=B1  1%  sched_debug.cpu#1.l=
oad
    638089 =C2=B1  7%     +18.6%     756572 =C2=B1  0%  sched_debug.cpu#1.a=
vg_idle
     41487 =C2=B1 17%     -23.6%      31701 =C2=B1  2%  sched_debug.cpu#1.s=
ched_goidle
        35 =C2=B1 13%     +23.6%         44 =C2=B1  2%  sched_debug.cpu#1.n=
r_running
    775506 =C2=B1  5%      +9.1%     845940 =C2=B1  2%  sched_debug.cpu#10.=
avg_idle
        60 =C2=B1 17%     +12.5%         67 =C2=B1  9%  sched_debug.cpu#11.=
cpu_load[1]
        59 =C2=B1 15%     +13.7%         68 =C2=B1  8%  sched_debug.cpu#11.=
cpu_load[2]
        59 =C2=B1 14%     +13.7%         68 =C2=B1  8%  sched_debug.cpu#11.=
cpu_load[3]
        59 =C2=B1 13%     +13.7%         68 =C2=B1  8%  sched_debug.cpu#11.=
cpu_load[4]
     23889 =C2=B1 12%     +37.3%      32809 =C2=B1  0%  sched_debug.cpu#13.=
sched_goidle
     65782 =C2=B1 13%     +16.9%      76919 =C2=B1  0%  sched_debug.cpu#13.=
curr->pid
    752227 =C2=B1  8%     +17.6%     884855 =C2=B1  2%  sched_debug.cpu#13.=
avg_idle
     64424 =C2=B1  8%      +7.2%      69094 =C2=B1 10%  sched_debug.cpu#15.=
curr->pid
        58 =C2=B1  4%     +13.5%         66 =C2=B1  5%  sched_debug.cpu#3.c=
pu_load[3]
        58 =C2=B1  4%     +15.5%         67 =C2=B1  5%  sched_debug.cpu#3.c=
pu_load[2]
        59 =C2=B1  4%     +12.3%         66 =C2=B1  5%  sched_debug.cpu#3.c=
pu_load[4]
        67 =C2=B1 15%     +20.5%         81 =C2=B1  6%  sched_debug.cpu#3.l=
oad
        34 =C2=B1 13%     +33.6%         46 =C2=B1  3%  sched_debug.cpu#3.n=
r_running
        56 =C2=B1  3%     +28.5%         72 =C2=B1 11%  sched_debug.cpu#3.c=
pu_load[0]
        56 =C2=B1  3%     +22.4%         69 =C2=B1  7%  sched_debug.cpu#3.c=
pu_load[1]
        58 =C2=B1  9%      +9.7%         64 =C2=B1  6%  sched_debug.cpu#4.c=
pu_load[3]
        32 =C2=B1 16%     +23.5%         40 =C2=B1 12%  sched_debug.cpu#4.n=
r_running
        55 =C2=B1 16%     +21.9%         68 =C2=B1 11%  sched_debug.cpu#4.c=
pu_load[0]
        58 =C2=B1 10%     +10.1%         64 =C2=B1  6%  sched_debug.cpu#4.c=
pu_load[4]
        58 =C2=B1 10%     +10.5%         65 =C2=B1  7%  sched_debug.cpu#4.c=
pu_load[2]
        57 =C2=B1 11%     +15.0%         66 =C2=B1  9%  sched_debug.cpu#4.c=
pu_load[1]
        65 =C2=B1  2%     -14.6%         55 =C2=B1  6%  sched_debug.cpu#5.c=
pu_load[1]
     33321 =C2=B1 14%     +11.9%      37287 =C2=B1 16%  sched_debug.cpu#5.s=
ched_goidle
     63819 =C2=B1  8%      +9.4%      69842 =C2=B1 11%  sched_debug.cpu#5.c=
urr->pid
   5413158 =C2=B1  6%      +7.4%    5815330 =C2=B1  6%  sched_debug.cpu#7.n=
r_switches
   4820279 =C2=B1  5%      +6.0%    5107135 =C2=B1  3%  sched_debug.cpu#7.t=
twu_count
   5413176 =C2=B1  6%      +7.4%    5815349 =C2=B1  6%  sched_debug.cpu#7.s=
ched_count
   4385172 =C2=B1  5%      +6.9%    4686703 =C2=B1  4%  sched_debug.cpu#7.t=
twu_local
    659245 =C2=B1  9%     +11.9%     737667 =C2=B1  5%  sched_debug.cpu#7.a=
vg_idle
        69 =C2=B1 11%     -23.1%         53 =C2=B1  2%  sched_debug.cpu#8.l=
oad
        57 =C2=B1  6%     +14.6%         66 =C2=B1  1%  sched_debug.cpu#9.c=
pu_load[4]
        58 =C2=B1  7%     +14.7%         66 =C2=B1  0%  sched_debug.cpu#9.c=
pu_load[3]

testcase/path_params/tbox_group: hackbench/performance-50%-threads-socket/l=
ituya

        v4.1-rc1  2b7928c943449ab2b5f4fa4c2d  =

----------------  --------------------------  =

     23323 =C2=B1  1%      +2.7%      23963 =C2=B1  0%  hackbench.throughput
     10077 =C2=B1  1%      -2.7%       9806 =C2=B1  0%  hackbench.time.syst=
em_time
 3.744e+08 =C2=B1  1%      -3.4%  3.618e+08 =C2=B1  0%  hackbench.time.invo=
luntary_context_switches
       643 =C2=B1  1%      -2.7%        626 =C2=B1  0%  hackbench.time.elap=
sed_time
       643 =C2=B1  1%      -2.7%        626 =C2=B1  0%  hackbench.time.elap=
sed_time.max
        44 =C2=B1  1%     +17.2%         52 =C2=B1  0%  turbostat.CoreTmp
        49 =C2=B1  2%     +17.3%         57 =C2=B1  0%  turbostat.PkgTmp
    609432 =C2=B1  1%     +11.6%     680254 =C2=B1  0%  proc-vmstat.pgfault
    165632 =C2=B1  9%     -16.6%     138156 =C2=B1  2%  cpuidle.C1E-HSW.usa=
ge
      3173 =C2=B1  5%     +18.0%       3744 =C2=B1  6%  cpuidle.C3-HSW.usage
       200 =C2=B1 12%     +13.8%        228 =C2=B1  7%  cpuidle.POLL.usage
      3392 =C2=B1  2%      +7.0%       3630 =C2=B1  3%  slabinfo.proc_inode=
_cache.num_objs
      3392 =C2=B1  2%      +7.0%       3630 =C2=B1  3%  slabinfo.proc_inode=
_cache.active_objs
      1.65 =C2=B1  2%     -21.9%       1.29 =C2=B1  1%  perf-profile.cpu-cy=
cles.is_ftrace_trampoline.print_context_stack.dump_trace.save_stack_trace_t=
sk.__account_scheduler_latency
      1.16 =C2=B1  8%      +9.9%       1.27 =C2=B1  2%  perf-profile.cpu-cy=
cles.pick_next_task_fair.__schedule.schedule.schedule_user.int_careful
      1.18 =C2=B1  4%     -13.4%       1.02 =C2=B1  1%  perf-profile.cpu-cy=
cles.idle_cpu.select_idle_sibling.select_task_rq_fair.try_to_wake_up.defaul=
t_wake_function
      2.30 =C2=B1  2%     -39.2%       1.40 =C2=B1  1%  perf-profile.cpu-cy=
cles.is_module_text_address.print_context_stack.dump_trace.save_stack_trace=
_tsk.__account_scheduler_latency
      1.06 =C2=B1  3%     +11.3%       1.18 =C2=B1  0%  perf-profile.cpu-cy=
cles.update_cfs_shares.dequeue_entity.dequeue_task_fair.dequeue_task.deacti=
vate_task
      1.02 =C2=B1  9%     +14.4%       1.17 =C2=B1  2%  perf-profile.cpu-cy=
cles.check_preempt_wakeup.check_preempt_curr.ttwu_do_wakeup.ttwu_do_activat=
e.try_to_wake_up
        82 =C2=B1  0%      -1.5%         81 =C2=B1  0%  latency_stats.avg.u=
nix_stream_recvmsg.sock_recvmsg.sock_read_iter.__vfs_read.vfs_read.SyS_read=
.system_call_fastpath
       260 =C2=B1  6%     +10.9%        289 =C2=B1  0%  latency_stats.avg.d=
o_wait.SyS_wait4.system_call_fastpath
      1389 =C2=B1  4%     +22.8%       1706 =C2=B1  0%  latency_stats.avg.p=
ipe_wait.wait_for_partner.fifo_open.do_dentry_open.vfs_open.do_last.path_op=
enat.do_filp_open.do_sys_open.SyS_open.system_call_fastpath
       222 =C2=B1 48%    +119.3%        488 =C2=B1 12%  latency_stats.avg.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_getattr.[nfsv4].nfs4_proc_getattr.[nfsv4].__nfs=
_revalidate_inode.nfs_getattr.vfs_getattr_nosec.vfs_getattr.vfs_fstat
         2 =C2=B1 20%     +87.5%          4 =C2=B1 33%  latency_stats.hits.=
call_rwsem_down_read_failed.__access_remote_vm.access_process_vm.get_cmdlin=
e.proc_pid_cmdline.proc_single_show.seq_read.__vfs_read.vfs_read.SyS_read.s=
ystem_call_fastpath
       226 =C2=B1 16%     -18.6%        184 =C2=B1  0%  latency_stats.hits.=
futex_wait_queue_me.futex_wait.do_futex.SyS_futex.system_call_fastpath
         2 =C2=B1 42%     +66.7%          4 =C2=B1 25%  latency_stats.hits.=
rpc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync=
_sequence.[nfsv4]._nfs4_proc_lookup.[nfsv4].nfs4_proc_lookup_common.[nfsv4]=
.nfs4_proc_lookup.[nfsv4].nfs_lookup_revalidate.nfs4_lookup_revalidate.look=
up_fast.link_path_walk
        35 =C2=B1 19%     +24.3%         43 =C2=B1  5%  latency_stats.hits.=
ep_poll.SyS_epoll_wait.system_call_fastpath
      4952 =C2=B1  0%      -3.9%       4760 =C2=B1  1%  latency_stats.max.d=
o_wait.SyS_wait4.system_call_fastpath
      3921 =C2=B1  6%     -28.9%       2789 =C2=B1  7%  latency_stats.max.w=
ait_woken.inotify_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
       230 =C2=B1 25%     -61.1%         89 =C2=B1 28%  latency_stats.max.f=
utex_wait_queue_me.futex_wait.do_futex.SyS_futex.system_call_fastpath
      1715 =C2=B1  5%     +17.6%       2017 =C2=B1  0%  latency_stats.max.p=
ipe_wait.wait_for_partner.fifo_open.do_dentry_open.vfs_open.do_last.path_op=
enat.do_filp_open.do_sys_open.SyS_open.system_call_fastpath
 7.095e+10 =C2=B1  2%      -4.4%  6.783e+10 =C2=B1  0%  latency_stats.sum.u=
nix_stream_recvmsg.sock_recvmsg.sock_read_iter.__vfs_read.vfs_read.SyS_read=
.system_call_fastpath
       669 =C2=B1 48%    +119.1%       1466 =C2=B1 12%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_getattr.[nfsv4].nfs4_proc_getattr.[nfsv4].__nfs=
_revalidate_inode.nfs_getattr.vfs_getattr_nosec.vfs_getattr.vfs_fstat
     13895 =C2=B1  4%     +22.8%      17063 =C2=B1  0%  latency_stats.sum.p=
ipe_wait.wait_for_partner.fifo_open.do_dentry_open.vfs_open.do_last.path_op=
enat.do_filp_open.do_sys_open.SyS_open.system_call_fastpath
    618031 =C2=B1  5%      +8.1%     668242 =C2=B1  0%  latency_stats.sum.d=
o_wait.SyS_wait4.system_call_fastpath
       938 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.tg_runnable_contrib
     14940 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.tg->runnable_avg
     43067 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.avg->runnable_avg_sum
     46588 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.avg->avg_period
     46592 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.avg->avg_period
     42916 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.avg->runnable_avg_sum
     14942 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.tg->runnable_avg
       934 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.tg_runnable_contrib
     14942 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.tg->runnable_avg
        11 =C2=B1 26%     -55.4%          5 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.nr_spread_over
     42768 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.avg->runnable_avg_sum
     46581 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.avg->avg_period
       931 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.tg_runnable_contrib
       928 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.tg_runnable_contrib
     14942 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.tg->runnable_avg
     42693 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.avg->runnable_avg_sum
     46651 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.avg->avg_period
     46669 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.avg->avg_period
     42678 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.avg->runnable_avg_sum
     14943 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.tg->runnable_avg
       928 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.tg_runnable_contrib
     46666 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.avg->avg_period
       911 =C2=B1  8%     +12.1%       1021 =C2=B1  2%  sched_debug.cfs_rq[=
14]:/.utilization_load_avg
       932 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.tg_runnable_contrib
     14943 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.tg->runnable_avg
       560 =C2=B1 46%     +74.8%        979 =C2=B1  8%  sched_debug.cfs_rq[=
14]:/.tg_load_contrib
     42790 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.avg->runnable_avg_sum
     42834 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.avg->runnable_avg_sum
         2 =C2=B1 39%     +92.3%          5 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.nr_spread_over
        57 =C2=B1  6%     +10.5%         63 =C2=B1  6%  sched_debug.cfs_rq[=
15]:/.load
     46581 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.avg->avg_period
       933 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.tg_runnable_contrib
     14943 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.tg->runnable_avg
     14940 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.tg->runnable_avg
        58 =C2=B1  4%     -11.3%         52 =C2=B1  1%  sched_debug.cfs_rq[=
1]:/.load
     42777 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.avg->runnable_avg_sum
     46555 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.avg->avg_period
       933 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.tg_runnable_contrib
     46636 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.avg->avg_period
     42737 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.avg->runnable_avg_sum
     14940 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.tg->runnable_avg
        55 =C2=B1  4%     +10.2%         61 =C2=B1  5%  sched_debug.cfs_rq[=
2]:/.runnable_load_avg
       931 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.tg_runnable_contrib
     46687 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.avg->avg_period
     43046 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.avg->runnable_avg_sum
     14941 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.tg->runnable_avg
       935 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.tg_runnable_contrib
     42760 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.avg->runnable_avg_sum
     14942 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.tg->runnable_avg
       931 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.tg_runnable_contrib
     46595 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.avg->avg_period
     42806 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.avg->runnable_avg_sum
       932 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.tg_runnable_contrib
     46612 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.avg->avg_period
     14942 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.tg->runnable_avg
     42971 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.avg->runnable_avg_sum
     14942 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.tg->runnable_avg
       934 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.tg_runnable_contrib
     46631 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.avg->avg_period
     14942 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.tg->runnable_avg
     46541 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.avg->avg_period
       932 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.tg_runnable_contrib
     42764 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.avg->runnable_avg_sum
       909 =C2=B1  8%     +11.1%       1010 =C2=B1  6%  sched_debug.cfs_rq[=
8]:/.utilization_load_avg
     14942 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.tg->runnable_avg
       939 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.tg_runnable_contrib
     43111 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.avg->runnable_avg_sum
     46589 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.avg->avg_period
       939 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.tg_runnable_contrib
     14942 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.tg->runnable_avg
     43165 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.avg->runnable_avg_sum
     46671 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.avg->avg_period
     41385 =C2=B1 18%     +29.2%      53454 =C2=B1  1%  sched_debug.cpu#0.s=
ched_goidle
     81506 =C2=B1 19%     +73.8%     141634 =C2=B1  4%  sched_debug.cpu#0.a=
vg_idle
     47164 =C2=B1 14%     +34.6%      63481 =C2=B1  2%  sched_debug.cpu#1.s=
ched_goidle
    195976 =C2=B1 18%     -39.8%     117933 =C2=B1  4%  sched_debug.cpu#13.=
avg_idle
        55 =C2=B1  6%     +15.5%         63 =C2=B1  2%  sched_debug.cpu#15.=
load
        53 =C2=B1  4%     +88.2%        100 =C2=B1 45%  sched_debug.cpu#2.l=
oad
        56 =C2=B1  3%      +6.2%         59 =C2=B1  2%  sched_debug.cpu#2.c=
pu_load[3]
     82613 =C2=B1 32%     +56.8%     129506 =C2=B1 18%  sched_debug.cpu#3.a=
vg_idle
        63 =C2=B1  5%     -12.7%         55 =C2=B1  1%  sched_debug.cpu#3.l=
oad
        11 =C2=B1  6%     -15.3%         10 =C2=B1  0%  sched_debug.cpu#3.n=
r_running
     36150 =C2=B1 21%     +20.3%      43473 =C2=B1  9%  sched_debug.cpu#6.s=
ched_goidle
        54 =C2=B1  9%     +15.4%         63 =C2=B1  6%  sched_debug.cpu#8.l=
oad
        56 =C2=B1  6%      +6.8%         60 =C2=B1  5%  sched_debug.cpu#8.c=
pu_load[2]
        56 =C2=B1  5%      +6.8%         60 =C2=B1  5%  sched_debug.cpu#8.c=
pu_load[3]
      0.00 =C2=B1 29%    +260.4%       0.00 =C2=B1 45%  sched_debug.rt_rq[1=
4]:/.rt_time

testcase/path_params/tbox_group: hackbench/powersave-1600%-process-pipe/lit=
uya

        v4.1-rc1  2b7928c943449ab2b5f4fa4c2d  =

----------------  --------------------------  =

       467 =C2=B1  1%      +7.5%        502 =C2=B1  3%  uptime.idle
       343 =C2=B1 18%     +18.1%        405 =C2=B1  4%  cpuidle.POLL.usage
      8881 =C2=B1  8%     -16.6%       7411 =C2=B1  3%  slabinfo.kmalloc-51=
2.num_objs
      8878 =C2=B1  8%     -18.3%       7256 =C2=B1  3%  slabinfo.kmalloc-51=
2.active_objs
     29.40 =C2=B1 33%     +55.4%      45.70 =C2=B1  2%  perf-profile.cpu-cy=
cles.__vfs_write.vfs_write.sys_write.system_call_fastpath
     10.77 =C2=B1 33%     +93.0%      20.80 =C2=B1  2%  perf-profile.cpu-cy=
cles.__vfs_read.vfs_read.sys_read.system_call_fastpath
     32.84 =C2=B1 40%     +61.1%      52.91 =C2=B1  0%  perf-profile.cpu-cy=
cles.vfs_write.sys_write.system_call_fastpath
     33.44 =C2=B1 40%     +61.5%      54.01 =C2=B1  0%  perf-profile.cpu-cy=
cles.sys_write.system_call_fastpath
       346 =C2=B1 15%     -16.8%        288 =C2=B1  5%  latency_stats.avg.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_access.[nfsv4].nfs4_proc_access.[nfsv4].nfs_do_=
access.nfs_permission.__inode_permission.inode_permission.may_open
         2 =C2=B1 34%    -100.0%          0 =C2=B1  0%  latency_stats.avg.c=
all_rwsem_down_write_failed.vm_munmap.SyS_munmap.system_call_fastpath
         0 =C2=B1  0%      +Inf%          4 =C2=B1 11%  latency_stats.avg.c=
all_rwsem_down_write_failed.unlink_file_vma.free_pgtables.unmap_region.do_m=
unmap.mmap_region.do_mmap_pgoff.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.syste=
m_call_fastpath
         0 =C2=B1  0%      +Inf%          1 =C2=B1  0%  latency_stats.hits.=
call_rwsem_down_write_failed.unlink_file_vma.free_pgtables.unmap_region.do_=
munmap.mmap_region.do_mmap_pgoff.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.syst=
em_call_fastpath
         1 =C2=B1 33%    -100.0%          0 =C2=B1  0%  latency_stats.hits.=
call_rwsem_down_write_failed.vm_munmap.SyS_munmap.system_call_fastpath
       143 =C2=B1  4%     +12.1%        160 =C2=B1  0%  latency_stats.hits.=
wait_woken.inotify_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
         2 =C2=B1 42%    -100.0%          0 =C2=B1  0%  latency_stats.max.c=
all_rwsem_down_write_failed.vm_munmap.SyS_munmap.system_call_fastpath
         0 =C2=B1  0%      +Inf%          4 =C2=B1 11%  latency_stats.max.c=
all_rwsem_down_write_failed.unlink_file_vma.free_pgtables.unmap_region.do_m=
unmap.mmap_region.do_mmap_pgoff.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.syste=
m_call_fastpath
         0 =C2=B1  0%      +Inf%          4 =C2=B1 11%  latency_stats.sum.c=
all_rwsem_down_write_failed.unlink_file_vma.free_pgtables.unmap_region.do_m=
unmap.mmap_region.do_mmap_pgoff.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.syste=
m_call_fastpath
    206359 =C2=B1  7%     +12.1%     231317 =C2=B1  4%  latency_stats.sum.w=
ait_woken.inotify_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
     13101 =C2=B1 14%     -18.6%      10666 =C2=B1  2%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_access.[nfsv4].nfs4_proc_access.[nfsv4].nfs_do_=
access.nfs_permission.__inode_permission.inode_permission.may_open
       927 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.tg_runnable_contrib
     14846 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.tg->runnable_avg
     42486 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.avg->runnable_avg_sum
     46497 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.avg->avg_period
     46641 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.avg->avg_period
     42686 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.avg->runnable_avg_sum
     14843 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.tg->runnable_avg
       929 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.tg_runnable_contrib
     14843 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.tg->runnable_avg
     42845 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.avg->runnable_avg_sum
     46630 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.avg->avg_period
       932 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.tg_runnable_contrib
       925 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.tg_runnable_contrib
     14843 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.tg->runnable_avg
     42523 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.avg->runnable_avg_sum
     46663 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.avg->avg_period
     46662 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.avg->avg_period
     42502 =C2=B1  1%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.avg->runnable_avg_sum
     14844 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.tg->runnable_avg
       925 =C2=B1  1%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.tg_runnable_contrib
     46606 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.avg->avg_period
       922 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.tg_runnable_contrib
     14840 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.tg->runnable_avg
     42351 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.avg->runnable_avg_sum
     42633 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.avg->runnable_avg_sum
        54 =C2=B1 13%     +12.5%         61 =C2=B1  3%  sched_debug.cfs_rq[=
15]:/.load
     46586 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.avg->avg_period
       927 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.tg_runnable_contrib
     14838 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.tg->runnable_avg
     14844 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.tg->runnable_avg
     42719 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.avg->runnable_avg_sum
     46584 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.avg->avg_period
       929 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.tg_runnable_contrib
     46666 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.avg->avg_period
     42749 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.avg->runnable_avg_sum
     14844 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.tg->runnable_avg
       929 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.tg_runnable_contrib
     46599 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.avg->avg_period
     42348 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.avg->runnable_avg_sum
     14844 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.tg->runnable_avg
       922 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.tg_runnable_contrib
     42539 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.avg->runnable_avg_sum
     14845 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.tg->runnable_avg
       927 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.tg_runnable_contrib
     46596 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.avg->avg_period
     42586 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.avg->runnable_avg_sum
       926 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.tg_runnable_contrib
     46649 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.avg->avg_period
     14845 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.tg->runnable_avg
     42373 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.avg->runnable_avg_sum
     14846 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.tg->runnable_avg
       924 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.tg_runnable_contrib
     46610 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.avg->avg_period
     14845 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.tg->runnable_avg
     46714 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.avg->avg_period
       925 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.tg_runnable_contrib
     42537 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.avg->runnable_avg_sum
     14845 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.tg->runnable_avg
       929 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.tg_runnable_contrib
     42693 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.avg->runnable_avg_sum
     46620 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.avg->avg_period
       934 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.tg_runnable_contrib
      1962 =C2=B1 15%     -39.5%       1187 =C2=B1  1%  sched_debug.cfs_rq[=
9]:/.blocked_load_avg
     14842 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.tg->runnable_avg
        55 =C2=B1  4%      +9.6%         60 =C2=B1  9%  sched_debug.cfs_rq[=
9]:/.runnable_load_avg
     42831 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.avg->runnable_avg_sum
     46558 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.avg->avg_period
      2040 =C2=B1 13%     -38.8%       1248 =C2=B1  1%  sched_debug.cfs_rq[=
9]:/.tg_load_contrib
        50 =C2=B1  6%    +107.3%        104 =C2=B1 43%  sched_debug.cpu#0.l=
oad
     66365 =C2=B1  4%     -16.9%      55146 =C2=B1 11%  sched_debug.cpu#0.c=
urr->pid
        51 =C2=B1  7%     +17.7%         60 =C2=B1 12%  sched_debug.cpu#1.c=
pu_load[0]
     17579 =C2=B1 24%     -30.6%      12205 =C2=B1  1%  sched_debug.cpu#10.=
sched_goidle
    590593 =C2=B1  8%     -17.8%     485319 =C2=B1  4%  sched_debug.cpu#11.=
avg_idle
       232 =C2=B1 49%     +50.6%        350 =C2=B1  2%  sched_debug.cpu#11.=
nr_uninterruptible
     20969 =C2=B1 23%     -47.3%      11045 =C2=B1 25%  sched_debug.cpu#13.=
sched_goidle
    891831 =C2=B1  5%     -19.7%     716307 =C2=B1  8%  sched_debug.cpu#5.a=
vg_idle
    909457 =C2=B1  5%     -15.6%     767464 =C2=B1  0%  sched_debug.cpu#6.a=
vg_idle
     30893 =C2=B1 11%     +18.8%      36688 =C2=B1  9%  sched_debug.cpu#7.s=
ched_goidle
        56 =C2=B1  8%      +6.8%         60 =C2=B1 10%  sched_debug.cpu#9.c=
pu_load[0]

testcase/path_params/tbox_group: hackbench/powersave-1600%-process-socket/l=
ituya

        v4.1-rc1  2b7928c943449ab2b5f4fa4c2d  =

----------------  --------------------------  =

  22434694 =C2=B1 13%     -23.1%   17249583 =C2=B1  5%  hackbench.time.invo=
luntary_context_switches
 1.727e+08 =C2=B1  1%      +2.1%  1.763e+08 =C2=B1  0%  hackbench.time.volu=
ntary_context_switches
       491 =C2=B1  2%     +11.6%        548 =C2=B1  6%  uptime.idle
  22434694 =C2=B1 13%     -23.1%   17249583 =C2=B1  5%  time.involuntary_co=
ntext_switches
     20267 =C2=B1  5%      +7.3%      21742 =C2=B1  6%  slabinfo.kmalloc-12=
8.num_objs
     20068 =C2=B1  5%      +7.5%      21583 =C2=B1  6%  slabinfo.kmalloc-12=
8.active_objs
      2.88 =C2=B1 16%     +20.9%       3.48 =C2=B1  3%  perf-profile.cpu-cy=
cles.__wake_up_sync_key.sock_def_readable.unix_stream_sendmsg.sock_sendmsg.=
sock_write_iter
      3.44 =C2=B1 14%     +18.9%       4.09 =C2=B1  2%  perf-profile.cpu-cy=
cles.sock_def_readable.unix_stream_sendmsg.sock_sendmsg.sock_write_iter.__v=
fs_write
       257 =C2=B1  3%      -7.4%        238 =C2=B1  0%  latency_stats.avg.u=
nix_stream_recvmsg.sock_recvmsg.sock_read_iter.__vfs_read.vfs_read.SyS_read=
.system_call_fastpath
      2499 =C2=B1  0%      +1.1%       2527 =C2=B1  0%  latency_stats.avg.p=
oll_schedule_timeout.do_sys_poll.SyS_poll.system_call_fastpath
       688 =C2=B1  4%     +11.7%        769 =C2=B1  1%  latency_stats.avg.d=
o_wait.SyS_wait4.system_call_fastpath
      2301 =C2=B1  5%      +8.7%       2500 =C2=B1  2%  latency_stats.avg.p=
ipe_wait.wait_for_partner.fifo_open.do_dentry_open.vfs_open.do_last.path_op=
enat.do_filp_open.do_sys_open.SyS_open.system_call_fastpath
       279 =C2=B1  3%      +8.4%        303 =C2=B1  1%  latency_stats.avg.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
       496 =C2=B1 39%    +147.4%       1228 =C2=B1 27%  latency_stats.avg.w=
ait_on_page_bit.filemap_fdatawait_range.filemap_write_and_wait_range.nfs4_f=
ile_fsync.[nfsv4].vfs_fsync_range.vfs_fsync.nfs_file_flush.filp_close.do_du=
p2.SyS_dup2.system_call_fastpath
       165 =C2=B1  3%     -20.9%        130 =C2=B1  5%  latency_stats.hits.=
wait_woken.inotify_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
      4721 =C2=B1  3%     -21.1%       3726 =C2=B1  2%  latency_stats.max.h=
rtimer_nanosleep.SyS_nanosleep.system_call_fastpath
       839 =C2=B1 39%     -65.9%        286 =C2=B1  3%  latency_stats.max.p=
ipe_wait.pipe_write.__vfs_write.vfs_write.SyS_write.system_call_fastpath
 3.205e+10 =C2=B1  3%      -6.4%  2.999e+10 =C2=B1  0%  latency_stats.sum.u=
nix_stream_recvmsg.sock_recvmsg.sock_read_iter.__vfs_read.vfs_read.SyS_read=
.system_call_fastpath
  50795442 =C2=B1  4%      +3.3%   52476137 =C2=B1  4%  latency_stats.sum.p=
oll_schedule_timeout.do_sys_poll.SyS_poll.system_call_fastpath
     14407 =C2=B1 39%    +147.2%      35621 =C2=B1 27%  latency_stats.sum.w=
ait_on_page_bit.filemap_fdatawait_range.filemap_write_and_wait_range.nfs4_f=
ile_fsync.[nfsv4].vfs_fsync_range.vfs_fsync.nfs_file_flush.filp_close.do_du=
p2.SyS_dup2.system_call_fastpath
    247544 =C2=B1  4%     -24.4%     187041 =C2=B1 13%  latency_stats.sum.w=
ait_woken.inotify_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
    865597 =C2=B1  4%      +5.5%     912898 =C2=B1  0%  latency_stats.sum.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
     23018 =C2=B1  5%      +8.7%      25013 =C2=B1  2%  latency_stats.sum.p=
ipe_wait.wait_for_partner.fifo_open.do_dentry_open.vfs_open.do_last.path_op=
enat.do_filp_open.do_sys_open.SyS_open.system_call_fastpath
     33796 =C2=B1  7%     +14.8%      38783 =C2=B1 15%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
       928 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.tg_runnable_contrib
     14850 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.tg->runnable_avg
     42584 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.avg->runnable_avg_sum
     46639 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.avg->avg_period
      1106 =C2=B1 49%    +193.6%       3248 =C2=B1 45%  sched_debug.cfs_rq[=
0]:/.tg_load_contrib
      2851 =C2=B1  8%     +97.3%       5626 =C2=B1 17%  sched_debug.cfs_rq[=
10]:/.blocked_load_avg
     46701 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.avg->avg_period
     38711 =C2=B1 14%     +34.2%      51966 =C2=B1  7%  sched_debug.cfs_rq[=
10]:/.tg_load_avg
     42674 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.avg->runnable_avg_sum
     14840 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.tg->runnable_avg
       928 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.tg_runnable_contrib
      2898 =C2=B1  8%     +95.9%       5677 =C2=B1 17%  sched_debug.cfs_rq[=
10]:/.tg_load_contrib
     14841 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.tg->runnable_avg
        15 =C2=B1 23%     -55.1%          7 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.nr_spread_over
        59 =C2=B1 12%     +27.1%         76 =C2=B1 17%  sched_debug.cfs_rq[=
11]:/.load
     42571 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.avg->runnable_avg_sum
     46633 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.avg->avg_period
        52 =C2=B1 16%     +30.3%         68 =C2=B1  4%  sched_debug.cfs_rq[=
11]:/.runnable_load_avg
     40216 =C2=B1 14%     +30.7%      52580 =C2=B1  8%  sched_debug.cfs_rq[=
11]:/.tg_load_avg
       928 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.tg_runnable_contrib
       927 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.tg_runnable_contrib
     14840 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.tg->runnable_avg
     41326 =C2=B1 12%     +23.8%      51160 =C2=B1  6%  sched_debug.cfs_rq[=
12]:/.tg_load_avg
     42588 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.avg->runnable_avg_sum
     46673 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.avg->avg_period
     46591 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.avg->avg_period
     42268 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.avg->runnable_avg_sum
     14839 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.tg->runnable_avg
       920 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.tg_runnable_contrib
     41582 =C2=B1 14%     +22.9%      51107 =C2=B1  5%  sched_debug.cfs_rq[=
13]:/.tg_load_avg
     46574 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.avg->avg_period
       922 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.tg_runnable_contrib
     14843 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.tg->runnable_avg
     41972 =C2=B1 14%     +27.8%      53657 =C2=B1  3%  sched_debug.cfs_rq[=
14]:/.tg_load_avg
     42349 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.avg->runnable_avg_sum
     42610 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.avg->runnable_avg_sum
     42850 =C2=B1 12%     +20.3%      51554 =C2=B1  1%  sched_debug.cfs_rq[=
15]:/.tg_load_avg
     46639 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.avg->avg_period
       927 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.tg_runnable_contrib
     14844 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.tg->runnable_avg
   3995504 =C2=B1  2%      +4.3%    4165390 =C2=B1  4%  sched_debug.cfs_rq[=
15]:/.min_vruntime
        57 =C2=B1  7%     +13.6%         65 =C2=B1  9%  sched_debug.cfs_rq[=
1]:/.runnable_load_avg
     14852 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.tg->runnable_avg
     42820 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.avg->runnable_avg_sum
     46573 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.avg->avg_period
       933 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.tg_runnable_contrib
     46684 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.avg->avg_period
     42617 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.avg->runnable_avg_sum
     14849 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.tg->runnable_avg
       927 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.tg_runnable_contrib
     46565 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.avg->avg_period
     42367 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.avg->runnable_avg_sum
     14846 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.tg->runnable_avg
        72 =C2=B1  6%     +11.8%         80 =C2=B1  6%  sched_debug.cfs_rq[=
3]:/.load
        62 =C2=B1  4%     +20.6%         75 =C2=B1  8%  sched_debug.cfs_rq[=
3]:/.runnable_load_avg
       566 =C2=B1 12%     -34.5%        370 =C2=B1 19%  sched_debug.cfs_rq[=
3]:/.utilization_load_avg
       924 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.tg_runnable_contrib
     42647 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.avg->runnable_avg_sum
     14846 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.tg->runnable_avg
       929 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.tg_runnable_contrib
       601 =C2=B1 19%     -46.9%        319 =C2=B1  7%  sched_debug.cfs_rq[=
4]:/.utilization_load_avg
     46622 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.avg->avg_period
     38836 =C2=B1 16%     +27.7%      49590 =C2=B1 13%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
     42528 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.avg->runnable_avg_sum
       925 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.tg_runnable_contrib
     46656 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.avg->avg_period
     14843 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.tg->runnable_avg
    141111 =C2=B1 26%     +25.1%     176482 =C2=B1 22%  sched_debug.cfs_rq[=
5]:/.spread0
     38824 =C2=B1 16%     +32.2%      51341 =C2=B1  9%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
     42409 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.avg->runnable_avg_sum
     14844 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.tg->runnable_avg
       922 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.tg_runnable_contrib
     46639 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.avg->avg_period
     38784 =C2=B1 11%     +29.7%      50298 =C2=B1 10%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
     14843 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.tg->runnable_avg
     46676 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.avg->avg_period
     38444 =C2=B1 13%     +27.2%      48918 =C2=B1 11%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
       928 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.tg_runnable_contrib
      1907 =C2=B1 15%     +75.1%       3340 =C2=B1 28%  sched_debug.cfs_rq[=
7]:/.blocked_load_avg
      1966 =C2=B1 15%     +73.8%       3418 =C2=B1 28%  sched_debug.cfs_rq[=
7]:/.tg_load_contrib
     42677 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.avg->runnable_avg_sum
     14841 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.tg->runnable_avg
     38659 =C2=B1 15%     +29.5%      50048 =C2=B1 15%  sched_debug.cfs_rq[=
8]:/.tg_load_avg
       925 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.tg_runnable_contrib
     42511 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.avg->runnable_avg_sum
        65 =C2=B1  8%     -18.7%         53 =C2=B1 10%  sched_debug.cfs_rq[=
8]:/.runnable_load_avg
     46591 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.avg->avg_period
       940 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.tg_runnable_contrib
     14841 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.tg->runnable_avg
     39331 =C2=B1 17%     +33.5%      52526 =C2=B1  8%  sched_debug.cfs_rq[=
9]:/.tg_load_avg
     43074 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.avg->runnable_avg_sum
     46527 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.avg->avg_period
     32371 =C2=B1 10%     -15.2%      27458 =C2=B1  0%  sched_debug.cpu#10.=
sched_goidle
        53 =C2=B1 13%     +26.9%         68 =C2=B1  4%  sched_debug.cpu#11.=
cpu_load[1]
        55 =C2=B1 11%     +23.6%         68 =C2=B1  4%  sched_debug.cpu#11.=
cpu_load[2]
        60 =C2=B1 13%     +25.8%         76 =C2=B1 15%  sched_debug.cpu#11.=
load
        51 =C2=B1 17%     +31.8%         68 =C2=B1  4%  sched_debug.cpu#11.=
cpu_load[0]
        55 =C2=B1  9%     +22.3%         68 =C2=B1  4%  sched_debug.cpu#11.=
cpu_load[3]
        55 =C2=B1  8%     +21.4%         67 =C2=B1  5%  sched_debug.cpu#11.=
cpu_load[4]
     31523 =C2=B1 13%     +28.2%      40399 =C2=B1  1%  sched_debug.cpu#13.=
sched_goidle
     66980 =C2=B1 10%      +4.4%      69940 =C2=B1 10%  sched_debug.cpu#13.=
curr->pid
        30 =C2=B1 33%    +150.0%         77 =C2=B1 44%  sched_debug.cpu#3.n=
r_uninterruptible
        72 =C2=B1  6%     +11.8%         80 =C2=B1  6%  sched_debug.cpu#3.l=
oad
     30405 =C2=B1 21%     +42.0%      43179 =C2=B1 12%  sched_debug.cpu#6.s=
ched_goidle
     63071 =C2=B1 12%     +11.8%      70501 =C2=B1 12%  sched_debug.cpu#7.c=
urr->pid
        64 =C2=B1  6%     -18.0%         53 =C2=B1 11%  sched_debug.cpu#8.c=
pu_load[2]
        65 =C2=B1  7%     -20.0%         52 =C2=B1 12%  sched_debug.cpu#8.c=
pu_load[1]
    786666 =C2=B1  6%      +6.6%     838266 =C2=B1  4%  sched_debug.cpu#9.a=
vg_idle

testcase/path_params/tbox_group: hackbench/powersave-1600%-threads-pipe/lit=
uya

        v4.1-rc1  2b7928c943449ab2b5f4fa4c2d  =

----------------  --------------------------  =

 9.048e+08 =C2=B1  2%      +2.8%    9.3e+08 =C2=B1  0%  hackbench.time.volu=
ntary_context_switches
    132926 =C2=B1  3%      +8.7%     144505 =C2=B1  3%  vmstat.system.in
   2230080 =C2=B1  1%      +2.6%    2287896 =C2=B1  2%  vmstat.system.cs
        46 =C2=B1  1%     +15.4%         54 =C2=B1  1%  turbostat.CoreTmp
        50 =C2=B1  0%     +16.1%         58 =C2=B1  0%  turbostat.PkgTmp
      0.70 =C2=B1  3%     -90.0%       0.07 =C2=B1 28%  turbostat.RAMWatt
       126 =C2=B1 16%     -36.0%         81 =C2=B1  1%  proc-vmstat.nr_dirt=
ied
      1241 =C2=B1 34%     +54.5%       1918 =C2=B1 22%  cpuidle.C3-HSW.usage
      9254 =C2=B1  7%     -18.3%       7563 =C2=B1  0%  cpuidle.C6-HSW.usage
       463 =C2=B1 14%     +13.0%        523 =C2=B1 10%  cpuidle.POLL.usage
       169 =C2=B1  3%      +8.9%        184 =C2=B1  0%  latency_stats.avg.d=
o_wait.SyS_wait4.system_call_fastpath
      2294 =C2=B1  3%     +18.8%       2726 =C2=B1 12%  latency_stats.avg.p=
ipe_wait.wait_for_partner.fifo_open.do_dentry_open.vfs_open.do_last.path_op=
enat.do_filp_open.do_sys_open.SyS_open.system_call_fastpath
       308 =C2=B1 11%     +80.5%        557 =C2=B1  2%  latency_stats.avg.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_access.[nfsv4].nfs4_proc_access.[nfsv4].nfs_do_=
access.nfs_permission.__inode_permission.inode_permission.may_open
       300 =C2=B1 26%     +84.0%        553 =C2=B1 19%  latency_stats.avg.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_access.[nfsv4].nfs4_proc_access.[nfsv4].nfs_do_=
access.nfs_permission.__inode_permission.inode_permission.link_path_walk
       894 =C2=B1 45%    +125.5%       2018 =C2=B1  0%  latency_stats.avg.r=
pc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_do_close.[nfsv4]._=
_nfs4_close.[nfsv4].nfs4_close_sync.[nfsv4].nfs4_close_context.[nfsv4].__pu=
t_nfs_open_context.nfs_release.nfs_file_release.__fput.____fput.task_work_r=
un
       362 =C2=B1 17%    +207.9%       1116 =C2=B1  3%  latency_stats.avg.w=
ait_on_page_bit.filemap_fdatawait_range.filemap_write_and_wait_range.nfs4_f=
ile_fsync.[nfsv4].vfs_fsync_range.vfs_fsync.nfs_file_flush.filp_close.do_du=
p2.SyS_dup2.system_call_fastpath
       171 =C2=B1 12%    +262.0%        619 =C2=B1 24%  latency_stats.avg.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_lookup.[nfsv4].nfs4_proc_lookup_common.[nfsv4].=
nfs4_proc_lookup.[nfsv4].nfs_lookup_revalidate.nfs4_lookup_revalidate.looku=
p_fast.link_path_walk
        39 =C2=B1 18%     +36.9%         54 =C2=B1 15%  latency_stats.hits.=
pipe_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
        77 =C2=B1  4%     -27.2%         56 =C2=B1  6%  latency_stats.hits.=
wait_woken.inotify_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
      3534 =C2=B1  2%      -6.9%       3289 =C2=B1  2%  latency_stats.max.h=
rtimer_nanosleep.SyS_nanosleep.system_call_fastpath
     18865 =C2=B1 47%     +53.0%      28873 =C2=B1  2%  latency_stats.max.r=
pc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_do_close.[nfsv4]._=
_nfs4_close.[nfsv4].nfs4_close_sync.[nfsv4].nfs4_close_context.[nfsv4].__pu=
t_nfs_open_context.nfs_release.nfs_file_release.__fput.____fput.task_work_r=
un
      2848 =C2=B1  6%     +24.9%       3558 =C2=B1 16%  latency_stats.max.p=
ipe_wait.wait_for_partner.fifo_open.do_dentry_open.vfs_open.do_last.path_op=
enat.do_filp_open.do_sys_open.SyS_open.system_call_fastpath
       205 =C2=B1 22%    +564.0%       1362 =C2=B1 38%  latency_stats.max.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_lookup.[nfsv4].nfs4_proc_lookup_common.[nfsv4].=
nfs4_proc_lookup.[nfsv4].nfs_lookup_revalidate.nfs4_lookup_revalidate.looku=
p_fast.link_path_walk
     10455 =C2=B1 17%    +198.6%      31221 =C2=B1  0%  latency_stats.sum.w=
ait_on_page_bit.filemap_fdatawait_range.filemap_write_and_wait_range.nfs4_f=
ile_fsync.[nfsv4].vfs_fsync_range.vfs_fsync.nfs_file_flush.filp_close.do_du=
p2.SyS_dup2.system_call_fastpath
   7119122 =C2=B1 21%     +81.7%   12936818 =C2=B1 23%  latency_stats.sum.p=
ipe_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
     25705 =C2=B1 23%     +88.8%      48530 =C2=B1 19%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_access.[nfsv4].nfs4_proc_access.[nfsv4].nfs_do_=
access.nfs_permission.__inode_permission.inode_permission.link_path_walk
    141544 =C2=B1  9%     -26.2%     104521 =C2=B1  6%  latency_stats.sum.w=
ait_woken.inotify_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
 1.148e+11 =C2=B1  3%      +3.7%  1.191e+11 =C2=B1  1%  latency_stats.sum.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
     62271 =C2=B1 45%    +128.5%     142310 =C2=B1  0%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_do_close.[nfsv4]._=
_nfs4_close.[nfsv4].nfs4_close_sync.[nfsv4].nfs4_close_context.[nfsv4].__pu=
t_nfs_open_context.nfs_release.nfs_file_release.__fput.____fput.task_work_r=
un
     22944 =C2=B1  3%     +18.8%      27267 =C2=B1 12%  latency_stats.sum.p=
ipe_wait.wait_for_partner.fifo_open.do_dentry_open.vfs_open.do_last.path_op=
enat.do_filp_open.do_sys_open.SyS_open.system_call_fastpath
    156690 =C2=B1  4%     +10.7%     173427 =C2=B1  0%  latency_stats.sum.d=
o_wait.SyS_wait4.system_call_fastpath
     11374 =C2=B1 11%     +78.6%      20311 =C2=B1  1%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_access.[nfsv4].nfs4_proc_access.[nfsv4].nfs_do_=
access.nfs_permission.__inode_permission.inode_permission.may_open
       929 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.tg_runnable_contrib
     14856 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.tg->runnable_avg
     42682 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.avg->runnable_avg_sum
     46638 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.avg->avg_period
      2263 =C2=B1 11%     +27.9%       2894 =C2=B1 13%  sched_debug.cfs_rq[=
10]:/.utilization_load_avg
        54 =C2=B1  4%      +6.6%         58 =C2=B1  3%  sched_debug.cfs_rq[=
10]:/.load
      1334 =C2=B1 22%     -36.5%        847 =C2=B1  3%  sched_debug.cfs_rq[=
10]:/.blocked_load_avg
        54 =C2=B1  4%     +13.1%         62 =C2=B1  9%  sched_debug.cfs_rq[=
10]:/.runnable_load_avg
     46600 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.avg->avg_period
     42686 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.avg->runnable_avg_sum
     14856 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.tg->runnable_avg
       929 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.tg_runnable_contrib
      1430 =C2=B1 25%     -36.5%        909 =C2=B1  2%  sched_debug.cfs_rq[=
10]:/.tg_load_contrib
     14856 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.tg->runnable_avg
      2304 =C2=B1 14%     +22.2%       2817 =C2=B1 10%  sched_debug.cfs_rq[=
11]:/.utilization_load_avg
     42673 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.avg->runnable_avg_sum
     46596 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.avg->avg_period
       929 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.tg_runnable_contrib
       926 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.tg_runnable_contrib
     14856 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.tg->runnable_avg
     42528 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.avg->runnable_avg_sum
     46640 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.avg->avg_period
     46684 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.avg->avg_period
     42529 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.avg->runnable_avg_sum
     14857 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.tg->runnable_avg
       925 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.tg_runnable_contrib
      1011 =C2=B1 24%     +26.8%       1282 =C2=B1 21%  sched_debug.cfs_rq[=
13]:/.blocked_load_avg
     19200 =C2=B1  4%      +8.5%      20838 =C2=B1  6%  sched_debug.cfs_rq[=
13]:/.tg_load_avg
      1088 =C2=B1 25%     +27.0%       1382 =C2=B1 21%  sched_debug.cfs_rq[=
13]:/.tg_load_contrib
     46689 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.avg->avg_period
      1725 =C2=B1  4%     +23.5%       2130 =C2=B1  8%  sched_debug.cfs_rq[=
14]:/.utilization_load_avg
       930 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.tg_runnable_contrib
     14858 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.tg->runnable_avg
     19128 =C2=B1  6%     +12.2%      21460 =C2=B1  5%  sched_debug.cfs_rq[=
14]:/.tg_load_avg
     42748 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.avg->runnable_avg_sum
     42521 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.avg->runnable_avg_sum
         5 =C2=B1 20%     -56.9%          2 =C2=B1 20%  sched_debug.cfs_rq[=
15]:/.nr_spread_over
     46673 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.avg->avg_period
       924 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.tg_runnable_contrib
     14858 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.tg->runnable_avg
     14856 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.tg->runnable_avg
     42609 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.avg->runnable_avg_sum
     46631 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.avg->avg_period
       928 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.tg_runnable_contrib
     46652 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.avg->avg_period
     42613 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.avg->runnable_avg_sum
     14856 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.tg->runnable_avg
       928 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.tg_runnable_contrib
     46627 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.avg->avg_period
     42704 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.avg->runnable_avg_sum
     14857 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.tg->runnable_avg
      3345 =C2=B1 31%     +49.4%       4997 =C2=B1 27%  sched_debug.cfs_rq[=
3]:/.utilization_load_avg
       928 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.tg_runnable_contrib
     42572 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.avg->runnable_avg_sum
     14857 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.tg->runnable_avg
       928 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.tg_runnable_contrib
     46593 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.avg->avg_period
     42473 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.avg->runnable_avg_sum
       925 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.tg_runnable_contrib
     46643 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.avg->avg_period
     14858 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.tg->runnable_avg
     42723 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.avg->runnable_avg_sum
     14858 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.tg->runnable_avg
       929 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.tg_runnable_contrib
     46676 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.avg->avg_period
      2354 =C2=B1  6%     +15.4%       2718 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.utilization_load_avg
     14856 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.tg->runnable_avg
     46597 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.avg->avg_period
      2200 =C2=B1 12%     +50.8%       3318 =C2=B1  2%  sched_debug.cfs_rq[=
7]:/.utilization_load_avg
       926 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.tg_runnable_contrib
     42557 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.avg->runnable_avg_sum
      2184 =C2=B1 16%     +72.2%       3762 =C2=B1 28%  sched_debug.cfs_rq[=
8]:/.utilization_load_avg
     14856 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.tg->runnable_avg
       931 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.tg_runnable_contrib
     42837 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.avg->runnable_avg_sum
        56 =C2=B1  5%     +31.2%         73 =C2=B1 22%  sched_debug.cfs_rq[=
8]:/.runnable_load_avg
     46685 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.avg->avg_period
       930 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.tg_runnable_contrib
      2051 =C2=B1 10%     +38.9%       2850 =C2=B1 11%  sched_debug.cfs_rq[=
9]:/.utilization_load_avg
      1185 =C2=B1 14%     +29.2%       1532 =C2=B1  3%  sched_debug.cfs_rq[=
9]:/.blocked_load_avg
     14856 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.tg->runnable_avg
     42662 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.avg->runnable_avg_sum
     46553 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.avg->avg_period
      1252 =C2=B1 14%     +28.3%       1607 =C2=B1  2%  sched_debug.cfs_rq[=
9]:/.tg_load_contrib
    930761 =C2=B1  5%     -17.0%     772706 =C2=B1  6%  sched_debug.cpu#0.a=
vg_idle
        42 =C2=B1 13%     +24.4%         52 =C2=B1  8%  sched_debug.cpu#10.=
nr_running
     23657 =C2=B1 19%     +30.0%      30750 =C2=B1 12%  sched_debug.cpu#10.=
sched_goidle
     63835 =C2=B1  6%     +18.3%      75538 =C2=B1  2%  sched_debug.cpu#10.=
curr->pid
        54 =C2=B1  3%      +8.3%         58 =C2=B1  5%  sched_debug.cpu#10.=
load
        56 =C2=B1  6%     +10.3%         62 =C2=B1  9%  sched_debug.cpu#10.=
cpu_load[0]
        42 =C2=B1 10%     +27.4%         53 =C2=B1  4%  sched_debug.cpu#11.=
nr_running
  25934517 =C2=B1  4%      +6.6%   27644121 =C2=B1  4%  sched_debug.cpu#13.=
ttwu_count
  44957582 =C2=B1  3%      +7.0%   48084734 =C2=B1  2%  sched_debug.cpu#14.=
nr_switches
  44957607 =C2=B1  3%      +7.0%   48084772 =C2=B1  2%  sched_debug.cpu#14.=
sched_count
        36 =C2=B1  4%     +27.8%         46 =C2=B1  6%  sched_debug.cpu#14.=
nr_running
    862924 =C2=B1  5%      +9.0%     940775 =C2=B1  1%  sched_debug.cpu#15.=
avg_idle
        34 =C2=B1  9%     +22.1%         41 =C2=B1  6%  sched_debug.cpu#15.=
nr_running
  25690001 =C2=B1  4%      +8.9%   27980233 =C2=B1  1%  sched_debug.cpu#15.=
ttwu_count
    692817 =C2=B1  4%     +11.4%     772128 =C2=B1  0%  sched_debug.cpu#3.a=
vg_idle
        62 =C2=B1 24%     +32.3%         82 =C2=B1 19%  sched_debug.cpu#3.n=
r_running
  39909672 =C2=B1  3%     +10.1%   43923887 =C2=B1  2%  sched_debug.cpu#5.n=
r_switches
  39909708 =C2=B1  3%     +10.1%   43923924 =C2=B1  2%  sched_debug.cpu#5.s=
ched_count
     66633 =C2=B1  9%     -16.7%      55505 =C2=B1  5%  sched_debug.cpu#5.c=
urr->pid
  12479871 =C2=B1  3%      +6.5%   13292156 =C2=B1  3%  sched_debug.cpu#5.t=
twu_local
  26059853 =C2=B1  2%      +8.2%   28206902 =C2=B1  2%  sched_debug.cpu#6.t=
twu_count
        48 =C2=B1 14%     +16.7%         56 =C2=B1 11%  sched_debug.cpu#6.n=
r_running
        56 =C2=B1  3%     +31.2%         74 =C2=B1 22%  sched_debug.cpu#8.c=
pu_load[4]
        57 =C2=B1  4%     +31.1%         75 =C2=B1 22%  sched_debug.cpu#8.c=
pu_load[3]
        56 =C2=B1  5%     +38.4%         77 =C2=B1 26%  sched_debug.cpu#8.c=
pu_load[0]
        56 =C2=B1  3%     +35.6%         77 =C2=B1 24%  sched_debug.cpu#8.c=
pu_load[1]
        45 =C2=B1 12%     +29.4%         59 =C2=B1 11%  sched_debug.cpu#9.n=
r_running
     67398 =C2=B1  9%     +11.6%      75242 =C2=B1  2%  sched_debug.cpu#9.c=
urr->pid
      0.00 =C2=B1 48%     -74.1%       0.00 =C2=B1 31%  sched_debug.rt_rq[1=
2]:/.rt_time

testcase/path_params/tbox_group: hackbench/performance-50%-threads-socket/l=
kp-sbx04

        v4.1-rc1  2b7928c943449ab2b5f4fa4c2d  =

----------------  --------------------------  =

    138130 =C2=B1  0%      +3.0%     142291 =C2=B1  0%  vmstat.system.in
           :5          100%           2:2     dmesg.Unexpected_close,not_st=
opping_watchdog
      6481 =C2=B1  6%     -15.5%       5478 =C2=B1  2%  proc-vmstat.numa_pa=
ges_migrated
    827960 =C2=B1 11%     +13.2%     937384 =C2=B1  5%  proc-vmstat.pgalloc=
_dma32
   2301621 =C2=B1  3%      +9.9%    2529289 =C2=B1  4%  proc-vmstat.pgfault
      6481 =C2=B1  6%     -15.5%       5478 =C2=B1  2%  proc-vmstat.pgmigra=
te_success
   2314017 =C2=B1 33%     +39.0%    3216945 =C2=B1 15%  cpuidle.C3-SNB.time
       685 =C2=B1 14%     +22.9%        842 =C2=B1  4%  slabinfo.file_lock_=
cache.active_objs
       685 =C2=B1 14%     +22.9%        842 =C2=B1  4%  slabinfo.file_lock_=
cache.num_objs
     23776 =C2=B1  4%     +11.6%      26533 =C2=B1  7%  numa-meminfo.node0.=
Active(file)
      7480 =C2=B1 29%     +59.4%      11927 =C2=B1  0%  numa-meminfo.node0.=
AnonPages
      1870 =C2=B1 29%     +59.5%       2982 =C2=B1  1%  numa-vmstat.node0.n=
r_anon_pages
      5943 =C2=B1  4%     +11.6%       6633 =C2=B1  7%  numa-vmstat.node0.n=
r_active_file
      9.06 =C2=B1  5%     +10.8%      10.04 =C2=B1  4%  perf-profile.cpu-cy=
cles.vfs_read.sys_read.system_call_fastpath
      9.26 =C2=B1  4%     +10.3%      10.21 =C2=B1  5%  perf-profile.cpu-cy=
cles.sys_read.system_call_fastpath
      7.99 =C2=B1  4%      +9.5%       8.76 =C2=B1  3%  perf-profile.cpu-cy=
cles.unix_stream_recvmsg.sock_recvmsg.sock_read_iter.__vfs_read.vfs_read
      8.48 =C2=B1  5%     +10.8%       9.39 =C2=B1  4%  perf-profile.cpu-cy=
cles.__vfs_read.vfs_read.sys_read.system_call_fastpath
      8.42 =C2=B1  5%     +10.9%       9.34 =C2=B1  5%  perf-profile.cpu-cy=
cles.sock_read_iter.__vfs_read.vfs_read.sys_read.system_call_fastpath
      8.34 =C2=B1  5%     +11.4%       9.29 =C2=B1  4%  perf-profile.cpu-cy=
cles.sock_recvmsg.sock_read_iter.__vfs_read.vfs_read.sys_read
      3261 =C2=B1  6%     +11.9%       3650 =C2=B1  0%  latency_stats.avg.p=
oll_schedule_timeout.do_sys_poll.SyS_poll.system_call_fastpath
       152 =C2=B1  5%     +11.9%        171 =C2=B1  1%  latency_stats.avg.d=
o_wait.SyS_wait4.system_call_fastpath
      2771 =C2=B1  6%     +20.5%       3339 =C2=B1  0%  latency_stats.avg.p=
ipe_wait.wait_for_partner.fifo_open.do_dentry_open.vfs_open.do_last.path_op=
enat.do_filp_open.do_sys_open.SyS_open.system_call_fastpath
       100 =C2=B1 23%     +42.1%        143 =C2=B1 11%  latency_stats.avg.s=
top_two_cpus.migrate_swap.task_numa_migrate.numa_migrate_preferred.task_num=
a_fault.handle_pte_fault.handle_mm_fault.__do_page_fault.do_page_fault.page=
_fault.skb_copy_datagram_iter.unix_stream_recvmsg
        80 =C2=B1 16%     +35.9%        109 =C2=B1 12%  latency_stats.avg.s=
top_one_cpu.migrate_task_to.task_numa_migrate.numa_migrate_preferred.task_n=
uma_fault.handle_pte_fault.handle_mm_fault.__do_page_fault.do_page_fault.pa=
ge_fault.skb_copy_datagram_iter.unix_stream_recvmsg
       195 =C2=B1  8%     +19.9%        234 =C2=B1  0%  latency_stats.avg.s=
top_two_cpus.migrate_swap.task_numa_migrate.numa_migrate_preferred.task_num=
a_fault.handle_pte_fault.handle_mm_fault.__do_page_fault.do_page_fault.page=
_fault
       206 =C2=B1  2%     -27.0%        151 =C2=B1  4%  latency_stats.avg.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_lookup.[nfsv4].nfs4_proc_lookup_common.[nfsv4].=
nfs4_proc_lookup.[nfsv4].nfs_lookup_revalidate.nfs4_lookup_revalidate.looku=
p_fast.link_path_walk
      1989 =C2=B1 11%     +54.2%       3068 =C2=B1 29%  latency_stats.avg.w=
ait_woken.inotify_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
        52 =C2=B1 17%     +51.9%         79 =C2=B1  6%  latency_stats.hits.=
stop_one_cpu.sched_exec.do_execveat_common.SyS_execve.return_from_execve
       280 =C2=B1 29%     -44.6%        155 =C2=B1 13%  latency_stats.hits.=
wait_on_page_bit.__migration_entry_wait.migration_entry_wait.handle_pte_fau=
lt.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
        23 =C2=B1 17%     -39.1%         14 =C2=B1  7%  latency_stats.hits.=
stop_two_cpus.migrate_swap.task_numa_migrate.numa_migrate_preferred.task_nu=
ma_fault.handle_pte_fault.handle_mm_fault.__do_page_fault.do_page_fault.pag=
e_fault.skb_copy_datagram_iter.unix_stream_recvmsg
      1024 =C2=B1 10%     +44.2%       1478 =C2=B1  1%  latency_stats.hits.=
poll_schedule_timeout.do_sys_poll.SyS_poll.system_call_fastpath
        21 =C2=B1 20%     -62.3%          8 =C2=B1 37%  latency_stats.hits.=
stop_two_cpus.migrate_swap.task_numa_migrate.numa_migrate_preferred.task_nu=
ma_fault.handle_pte_fault.handle_mm_fault.__do_page_fault.do_page_fault.pag=
e_fault
      3486 =C2=B1  7%     +19.0%       4149 =C2=B1  0%  latency_stats.max.p=
ipe_wait.wait_for_partner.fifo_open.do_dentry_open.vfs_open.do_last.path_op=
enat.do_filp_open.do_sys_open.SyS_open.system_call_fastpath
       353 =C2=B1 23%     -40.0%        212 =C2=B1  1%  latency_stats.max.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_lookup.[nfsv4].nfs4_proc_lookup_common.[nfsv4].=
nfs4_proc_lookup.[nfsv4].nfs_lookup_revalidate.nfs4_lookup_revalidate.looku=
p_fast.link_path_walk
     20156 =C2=B1 40%    +363.1%      93348 =C2=B1 26%  latency_stats.max.r=
pc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_run_open_task.[nfs=
v4]._nfs4_open_and_get_state.[nfsv4].nfs4_do_open.[nfsv4].nfs4_atomic_open.=
[nfsv4].nfs4_file_open.[nfsv4].do_dentry_open.vfs_open.do_last.path_openat.=
do_filp_open
      1283 =C2=B1 37%     -53.3%        599 =C2=B1 20%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_lookup.[nfsv4].nfs4_proc_lookup_common.[nfsv4].=
nfs4_proc_lookup.[nfsv4].nfs_lookup_revalidate.nfs4_lookup_revalidate.looku=
p_fast.link_path_walk
   3359111 =C2=B1 15%     +60.6%    5396379 =C2=B1  2%  latency_stats.sum.p=
oll_schedule_timeout.do_sys_poll.SyS_poll.system_call_fastpath
      4095 =C2=B1 17%     -54.1%       1880 =C2=B1 38%  latency_stats.sum.s=
top_two_cpus.migrate_swap.task_numa_migrate.numa_migrate_preferred.task_num=
a_fault.handle_pte_fault.handle_mm_fault.__do_page_fault.do_page_fault.page=
_fault
     33771 =C2=B1 18%     -20.3%      26911 =C2=B1  2%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_access.[nfsv4].nfs4_proc_access.[nfsv4].nfs_do_=
access.nfs_permission.__inode_permission.inode_permission.link_path_walk
     12191 =C2=B1 17%     -48.2%       6310 =C2=B1 37%  latency_stats.sum.w=
ait_woken.inotify_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
      9529 =C2=B1 30%     +67.3%      15944 =C2=B1  8%  latency_stats.sum.s=
top_one_cpu.sched_exec.do_execveat_common.SyS_execve.return_from_execve
     28321 =C2=B1  9%     +17.9%      33397 =C2=B1  0%  latency_stats.sum.p=
ipe_wait.wait_for_partner.fifo_open.do_dentry_open.vfs_open.do_last.path_op=
enat.do_filp_open.do_sys_open.SyS_open.system_call_fastpath
    800317 =C2=B1  4%     +11.5%     892589 =C2=B1  5%  latency_stats.sum.d=
o_wait.SyS_wait4.system_call_fastpath
      5808 =C2=B1 13%     -17.7%       4783 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
       957 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.tg_runnable_contrib
     61383 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.tg->runnable_avg
     43977 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.avg->runnable_avg_sum
     46642 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.avg->avg_period
     46627 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.avg->avg_period
     44007 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.avg->runnable_avg_sum
     61380 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.tg->runnable_avg
       959 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.tg_runnable_contrib
     61381 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.tg->runnable_avg
       905 =C2=B1  6%     +12.6%       1019 =C2=B1  9%  sched_debug.cfs_rq[=
11]:/.utilization_load_avg
     44074 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.avg->runnable_avg_sum
     46570 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.avg->avg_period
       960 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.tg_runnable_contrib
       958 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.tg_runnable_contrib
       855 =C2=B1  3%      +8.1%        924 =C2=B1  5%  sched_debug.cfs_rq[=
12]:/.utilization_load_avg
     61379 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.tg->runnable_avg
     43994 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.avg->runnable_avg_sum
     46603 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.avg->avg_period
     46649 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.avg->avg_period
     44028 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.avg->runnable_avg_sum
     61379 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.tg->runnable_avg
       956 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.tg_runnable_contrib
     46662 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.avg->avg_period
       959 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.tg_runnable_contrib
     61379 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.tg->runnable_avg
     44199 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.avg->runnable_avg_sum
     43980 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.avg->runnable_avg_sum
     46633 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.avg->avg_period
       957 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.tg_runnable_contrib
     61380 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.tg->runnable_avg
       894 =C2=B1  3%      +9.5%        979 =C2=B1  6%  sched_debug.cfs_rq[=
15]:/.utilization_load_avg
       956 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
16]:/.tg_runnable_contrib
     61380 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
16]:/.tg->runnable_avg
     43974 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
16]:/.avg->runnable_avg_sum
     46595 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
16]:/.avg->avg_period
       958 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
17]:/.tg_runnable_contrib
     44065 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
17]:/.avg->runnable_avg_sum
     46666 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
17]:/.avg->avg_period
     61380 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
17]:/.tg->runnable_avg
     46618 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
18]:/.avg->avg_period
     44050 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
18]:/.avg->runnable_avg_sum
     61380 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
18]:/.tg->runnable_avg
       958 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
18]:/.tg_runnable_contrib
     61380 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
19]:/.tg->runnable_avg
     46643 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
19]:/.avg->avg_period
     43986 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
19]:/.avg->runnable_avg_sum
       958 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
19]:/.tg_runnable_contrib
     61382 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.tg->runnable_avg
     44221 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.avg->runnable_avg_sum
     46601 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.avg->avg_period
       961 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.tg_runnable_contrib
     46639 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
20]:/.avg->avg_period
     43977 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
20]:/.avg->runnable_avg_sum
     61380 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
20]:/.tg->runnable_avg
       958 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
20]:/.tg_runnable_contrib
     44203 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
21]:/.avg->runnable_avg_sum
     61380 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
21]:/.tg->runnable_avg
       961 =C2=B1  1%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
21]:/.tg_runnable_contrib
     46644 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
21]:/.avg->avg_period
     44016 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
22]:/.avg->runnable_avg_sum
     61380 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
22]:/.tg->runnable_avg
       958 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
22]:/.tg_runnable_contrib
     46612 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
22]:/.avg->avg_period
     61380 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
23]:/.tg->runnable_avg
       961 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
23]:/.tg_runnable_contrib
     44140 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
23]:/.avg->runnable_avg_sum
     46623 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
23]:/.avg->avg_period
     46596 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
24]:/.avg->avg_period
     44006 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
24]:/.avg->runnable_avg_sum
     61380 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
24]:/.tg->runnable_avg
       958 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
24]:/.tg_runnable_contrib
     61380 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
25]:/.tg->runnable_avg
     43991 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
25]:/.avg->runnable_avg_sum
       956 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
25]:/.tg_runnable_contrib
     46619 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
25]:/.avg->avg_period
     46576 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
26]:/.avg->avg_period
     43994 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
26]:/.avg->runnable_avg_sum
     61379 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
26]:/.tg->runnable_avg
       960 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
26]:/.tg_runnable_contrib
     61378 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
27]:/.tg->runnable_avg
     43980 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
27]:/.avg->runnable_avg_sum
     46579 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
27]:/.avg->avg_period
       958 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
27]:/.tg_runnable_contrib
       956 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
28]:/.tg_runnable_contrib
     61378 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
28]:/.tg->runnable_avg
     44081 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
28]:/.avg->runnable_avg_sum
     46667 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
28]:/.avg->avg_period
       957 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
29]:/.tg_runnable_contrib
     61378 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
29]:/.tg->runnable_avg
       840 =C2=B1  1%      +8.4%        911 =C2=B1  6%  sched_debug.cfs_rq[=
29]:/.utilization_load_avg
     43982 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
29]:/.avg->runnable_avg_sum
     46621 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
29]:/.avg->avg_period
     46629 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.avg->avg_period
     44012 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.avg->runnable_avg_sum
     61382 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.tg->runnable_avg
       958 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.tg_runnable_contrib
     46620 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
30]:/.avg->avg_period
     44006 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
30]:/.avg->runnable_avg_sum
     61379 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
30]:/.tg->runnable_avg
       958 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
30]:/.tg_runnable_contrib
     46589 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
31]:/.avg->avg_period
     44188 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
31]:/.avg->runnable_avg_sum
     61378 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
31]:/.tg->runnable_avg
       961 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
31]:/.tg_runnable_contrib
       962 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
32]:/.tg_runnable_contrib
     46635 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
32]:/.avg->avg_period
     44131 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
32]:/.avg->runnable_avg_sum
     61378 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
32]:/.tg->runnable_avg
    232212 =C2=B1 44%     +62.8%     378042 =C2=B1 14%  sched_debug.cfs_rq[=
32]:/.spread0
     46612 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
33]:/.avg->avg_period
     44254 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
33]:/.avg->runnable_avg_sum
       963 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
33]:/.tg_runnable_contrib
     61378 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
33]:/.tg->runnable_avg
     46628 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
34]:/.avg->avg_period
     43971 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
34]:/.avg->runnable_avg_sum
     61378 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
34]:/.tg->runnable_avg
       957 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
34]:/.tg_runnable_contrib
       955 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
35]:/.tg_runnable_contrib
     61379 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
35]:/.tg->runnable_avg
     43945 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
35]:/.avg->runnable_avg_sum
     46601 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
35]:/.avg->avg_period
     46632 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
36]:/.avg->avg_period
     44026 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
36]:/.avg->runnable_avg_sum
     61379 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
36]:/.tg->runnable_avg
       957 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
36]:/.tg_runnable_contrib
    565728 =C2=B1 29%     -59.0%     231805 =C2=B1 31%  sched_debug.cfs_rq[=
36]:/.spread0
       955 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
37]:/.tg_runnable_contrib
     61379 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
37]:/.tg->runnable_avg
     43936 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
37]:/.avg->runnable_avg_sum
     46617 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
37]:/.avg->avg_period
     61379 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
38]:/.tg->runnable_avg
       957 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
38]:/.tg_runnable_contrib
     44105 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
38]:/.avg->runnable_avg_sum
     46688 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
38]:/.avg->avg_period
     46526 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
39]:/.avg->avg_period
     43895 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
39]:/.avg->runnable_avg_sum
     61379 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
39]:/.tg->runnable_avg
       953 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
39]:/.tg_runnable_contrib
     46617 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.avg->avg_period
     44027 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.avg->runnable_avg_sum
     61381 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.tg->runnable_avg
       958 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.tg_runnable_contrib
       962 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
40]:/.tg_runnable_contrib
     61379 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
40]:/.tg->runnable_avg
     44061 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
40]:/.avg->runnable_avg_sum
     46599 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
40]:/.avg->avg_period
     43978 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
41]:/.avg->runnable_avg_sum
     61379 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
41]:/.tg->runnable_avg
       956 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
41]:/.tg_runnable_contrib
     46600 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
41]:/.avg->avg_period
       958 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
42]:/.tg_runnable_contrib
     46623 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
42]:/.avg->avg_period
     43995 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
42]:/.avg->runnable_avg_sum
     61379 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
42]:/.tg->runnable_avg
       958 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
43]:/.tg_runnable_contrib
     61379 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
43]:/.tg->runnable_avg
     44024 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
43]:/.avg->runnable_avg_sum
     46655 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
43]:/.avg->avg_period
     61379 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
44]:/.tg->runnable_avg
     46653 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
44]:/.avg->avg_period
       895 =C2=B1  5%      +9.0%        976 =C2=B1  7%  sched_debug.cfs_rq[=
44]:/.utilization_load_avg
     43999 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
44]:/.avg->runnable_avg_sum
       957 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
44]:/.tg_runnable_contrib
     46606 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
45]:/.avg->avg_period
     43961 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
45]:/.avg->runnable_avg_sum
     61379 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
45]:/.tg->runnable_avg
       958 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
45]:/.tg_runnable_contrib
       957 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
46]:/.tg_runnable_contrib
     61379 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
46]:/.tg->runnable_avg
     44002 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
46]:/.avg->runnable_avg_sum
     46629 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
46]:/.avg->avg_period
     46635 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
47]:/.avg->avg_period
     61378 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
47]:/.tg->runnable_avg
       892 =C2=B1  5%     +11.7%        997 =C2=B1  7%  sched_debug.cfs_rq[=
47]:/.utilization_load_avg
       959 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
47]:/.tg_runnable_contrib
     44030 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
47]:/.avg->runnable_avg_sum
        13 =C2=B1 10%     +19.4%         16 =C2=B1  0%  sched_debug.cfs_rq[=
48]:/.load
       958 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
48]:/.tg_runnable_contrib
     46616 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
48]:/.avg->avg_period
     44127 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
48]:/.avg->runnable_avg_sum
     61377 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
48]:/.tg->runnable_avg
     43962 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
49]:/.avg->runnable_avg_sum
     61377 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
49]:/.tg->runnable_avg
     46662 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
49]:/.avg->avg_period
       952 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
49]:/.tg_runnable_contrib
     43953 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.avg->runnable_avg_sum
     61379 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.tg->runnable_avg
       958 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.tg_runnable_contrib
        13 =C2=B1  8%     +10.3%         15 =C2=B1  6%  sched_debug.cfs_rq[=
4]:/.load
     46593 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.avg->avg_period
     46733 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
50]:/.avg->avg_period
       961 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
50]:/.tg_runnable_contrib
     61377 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
50]:/.tg->runnable_avg
     44237 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
50]:/.avg->runnable_avg_sum
     46671 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
51]:/.avg->avg_period
     44018 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
51]:/.avg->runnable_avg_sum
       960 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
51]:/.tg_runnable_contrib
     61377 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
51]:/.tg->runnable_avg
     46614 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
52]:/.avg->avg_period
     44164 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
52]:/.avg->runnable_avg_sum
     61377 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
52]:/.tg->runnable_avg
       960 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
52]:/.tg_runnable_contrib
       957 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
53]:/.tg_runnable_contrib
     61377 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
53]:/.tg->runnable_avg
     46568 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
53]:/.avg->avg_period
     43923 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
53]:/.avg->runnable_avg_sum
     61377 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
54]:/.tg->runnable_avg
     46681 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
54]:/.avg->avg_period
     44027 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
54]:/.avg->runnable_avg_sum
        12 =C2=B1  3%     +13.3%         14 =C2=B1  3%  sched_debug.cfs_rq[=
54]:/.load
       957 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
54]:/.tg_runnable_contrib
       958 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
55]:/.tg_runnable_contrib
     61377 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
55]:/.tg->runnable_avg
     46557 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
55]:/.avg->avg_period
     43968 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
55]:/.avg->runnable_avg_sum
     46648 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
56]:/.avg->avg_period
       957 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
56]:/.tg_runnable_contrib
     44050 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
56]:/.avg->runnable_avg_sum
     61378 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
56]:/.tg->runnable_avg
     61378 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
57]:/.tg->runnable_avg
     44025 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
57]:/.avg->runnable_avg_sum
     46669 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
57]:/.avg->avg_period
       959 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
57]:/.tg_runnable_contrib
       864 =C2=B1  2%     +20.7%       1042 =C2=B1  7%  sched_debug.cfs_rq[=
57]:/.utilization_load_avg
       897 =C2=B1  9%      +8.8%        976 =C2=B1  9%  sched_debug.cfs_rq[=
58]:/.utilization_load_avg
       958 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
58]:/.tg_runnable_contrib
     61378 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
58]:/.tg->runnable_avg
     44097 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
58]:/.avg->runnable_avg_sum
     46646 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
58]:/.avg->avg_period
     46637 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
59]:/.avg->avg_period
       961 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
59]:/.tg_runnable_contrib
     44137 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
59]:/.avg->runnable_avg_sum
     61378 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
59]:/.tg->runnable_avg
     44185 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.avg->runnable_avg_sum
       961 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.tg_runnable_contrib
     46647 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.avg->avg_period
     61378 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.tg->runnable_avg
     46624 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
60]:/.avg->avg_period
     44142 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
60]:/.avg->runnable_avg_sum
     61378 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
60]:/.tg->runnable_avg
       959 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
60]:/.tg_runnable_contrib
     46582 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
61]:/.avg->avg_period
     43939 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
61]:/.avg->runnable_avg_sum
     61378 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
61]:/.tg->runnable_avg
       958 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
61]:/.tg_runnable_contrib
     61378 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
62]:/.tg->runnable_avg
       956 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
62]:/.tg_runnable_contrib
     46636 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
62]:/.avg->avg_period
     44002 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
62]:/.avg->runnable_avg_sum
     61378 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
63]:/.tg->runnable_avg
     44172 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
63]:/.avg->runnable_avg_sum
     46634 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
63]:/.avg->avg_period
       963 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
63]:/.tg_runnable_contrib
     43938 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.avg->runnable_avg_sum
        22 =C2=B1 49%    +305.7%         92 =C2=B1 44%  sched_debug.cfs_rq[=
6]:/.blocked_load_avg
     61379 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.tg->runnable_avg
       957 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.tg_runnable_contrib
     46600 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.avg->avg_period
        37 =C2=B1 30%    +186.3%        106 =C2=B1 38%  sched_debug.cfs_rq[=
6]:/.tg_load_contrib
     61379 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.tg->runnable_avg
     46655 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.avg->avg_period
       960 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.tg_runnable_contrib
     44021 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.avg->runnable_avg_sum
     61379 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.tg->runnable_avg
       959 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.tg_runnable_contrib
     44011 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.avg->runnable_avg_sum
     46638 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.avg->avg_period
       959 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.tg_runnable_contrib
     61379 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.tg->runnable_avg
     44137 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.avg->runnable_avg_sum
     46655 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.avg->avg_period
    695729 =C2=B1 13%     +34.2%     933587 =C2=B1  4%  sched_debug.cpu#10.=
avg_idle
      2817 =C2=B1 46%     +78.1%       5019 =C2=B1 33%  sched_debug.cpu#11.=
sched_goidle
    756094 =C2=B1 27%     +21.3%     916959 =C2=B1  4%  sched_debug.cpu#11.=
avg_idle
      3404 =C2=B1 20%     +64.5%       5601 =C2=B1  9%  sched_debug.cpu#13.=
sched_goidle
    684848 =C2=B1 23%     +27.2%     870971 =C2=B1  3%  sched_debug.cpu#13.=
avg_idle
         9 =C2=B1  4%     -13.0%          8 =C2=B1  0%  sched_debug.cpu#13.=
nr_running
    820827 =C2=B1  2%     +16.3%     954804 =C2=B1  0%  sched_debug.cpu#14.=
avg_idle
    657511 =C2=B1 19%     +26.6%     832447 =C2=B1  0%  sched_debug.cpu#15.=
avg_idle
    647183 =C2=B1 25%     +32.4%     856734 =C2=B1  2%  sched_debug.cpu#16.=
avg_idle
   3083396 =C2=B1  3%     -12.7%    2693011 =C2=B1  1%  sched_debug.cpu#16.=
ttwu_local
        14 =C2=B1  2%     +16.2%         16 =C2=B1  9%  sched_debug.cpu#16.=
cpu_load[0]
        14 =C2=B1  3%      +7.6%         15 =C2=B1  3%  sched_debug.cpu#16.=
cpu_load[1]
   3233571 =C2=B1  4%     -13.3%    2804353 =C2=B1  0%  sched_debug.cpu#18.=
ttwu_local
   4547061 =C2=B1  6%      +9.0%    4956445 =C2=B1  7%  sched_debug.cpu#20.=
ttwu_count
        14 =C2=B1  3%      +7.6%         15 =C2=B1  3%  sched_debug.cpu#21.=
cpu_load[4]
        14 =C2=B1  3%      +7.6%         15 =C2=B1  3%  sched_debug.cpu#21.=
cpu_load[3]
        14 =C2=B1  4%     +21.4%         17 =C2=B1 11%  sched_debug.cpu#22.=
cpu_load[0]
   3165038 =C2=B1  4%      -8.8%    2887455 =C2=B1  0%  sched_debug.cpu#22.=
ttwu_local
        13 =C2=B1  5%     +19.6%         16 =C2=B1  9%  sched_debug.cpu#22.=
load
        14 =C2=B1 11%     +26.7%         18 =C2=B1 18%  sched_debug.cpu#33.=
cpu_load[2]
        14 =C2=B1  6%     +19.7%         17 =C2=B1 11%  sched_debug.cpu#33.=
cpu_load[3]
        15 =C2=B1 16%     +33.3%         20 =C2=B1 25%  sched_debug.cpu#33.=
cpu_load[1]
    810688 =C2=B1 12%     +14.4%     927130 =C2=B1  7%  sched_debug.cpu#40.=
avg_idle
    641422 =C2=B1 23%     +36.8%     877147 =C2=B1 14%  sched_debug.cpu#41.=
avg_idle
    754552 =C2=B1 16%     +30.2%     982668 =C2=B1  1%  sched_debug.cpu#43.=
avg_idle
      2130 =C2=B1 35%    +160.2%       5543 =C2=B1 40%  sched_debug.cpu#45.=
sched_goidle
    753381 =C2=B1 22%     +22.5%     923245 =C2=B1  8%  sched_debug.cpu#46.=
avg_idle
    735525 =C2=B1 29%     +27.4%     936835 =C2=B1  4%  sched_debug.cpu#47.=
avg_idle
      2105 =C2=B1 45%     +67.8%       3533 =C2=B1 25%  sched_debug.cpu#47.=
sched_goidle
   3097521 =C2=B1  3%     -13.1%    2692888 =C2=B1  0%  sched_debug.cpu#48.=
ttwu_local
         8 =C2=B1  8%     +19.3%         10 =C2=B1  4%  sched_debug.cpu#48.=
nr_running
        13 =C2=B1  8%     +12.3%         15 =C2=B1  3%  sched_debug.cpu#48.=
load
        14 =C2=B1  3%      +7.6%         15 =C2=B1  3%  sched_debug.cpu#49.=
cpu_load[0]
         3 =C2=B1 47%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#49.=
nr_uninterruptible
   4588349 =C2=B1  6%     +10.3%    5060795 =C2=B1  9%  sched_debug.cpu#52.=
ttwu_count
   3237716 =C2=B1  5%      -9.6%    2926684 =C2=B1  0%  sched_debug.cpu#54.=
ttwu_local
        13 =C2=B1  3%      +8.2%         14 =C2=B1  3%  sched_debug.cpu#54.=
load
    638369 =C2=B1 20%     +32.4%     845474 =C2=B1  1%  sched_debug.cpu#55.=
avg_idle
    759739 =C2=B1 14%     +25.4%     952449 =C2=B1  4%  sched_debug.cpu#57.=
avg_idle
    779638 =C2=B1 16%     +15.6%     901380 =C2=B1  6%  sched_debug.cpu#59.=
avg_idle
      3049 =C2=B1 24%     -67.3%        996 =C2=B1 20%  sched_debug.cpu#61.=
sched_goidle
    809740 =C2=B1 11%     +13.3%     917235 =C2=B1  7%  sched_debug.cpu#62.=
avg_idle
    707215 =C2=B1 16%     +26.1%     891547 =C2=B1  8%  sched_debug.cpu#8.a=
vg_idle

ivb42: Ivytown Ivy Bridge-EP
Memory: 64G

brickland3: Brickland Ivy Bridge-EX
Memory: 512G

lituya: Grantley Haswell
Memory: 16G

lkp-wsx02: Westmere-EX
Memory: 128G

lkp-hsw01: Grantley Haswell-EP
Memory: 64G

lkp-sbx04: Sandy Bridge-EX
Memory: 64G






  14 ++--------------------------------------------------------------------=
-+
     *.                                                                    =
 |
  12 ++..                                                                  =
 |
     |   .                                                                 =
 |
  10 ++   .                                                                =
 |
     |     ..                                                              =
 |
   8 ++                      *                                             =
 |
     |       *.             +                                              =
 |
   6 ++        .           +                                               =
 |
     |          .         +                                                =
 |
   4 ++          ..      +                                                 =
 |
     |             .    +                                                  =
 |
   2 ++             .  +                                            O      =
 |
     O       O       O+                             O                      =
 O
   0 ++--------------*-------O-------O------O---------------O--------------=
-+




  1.6 ++-------------------------------------------------------------------=
-+
      |                           O                                        =
 |
  1.4 ++     O                           O                           O     =
 O
  1.2 O+            O      O                    O             O            =
 |
      |                                                                    =
 |
    1 ++                                                                   =
 |
      |                                                                    =
 |
  0.8 ++                                                                   =
 |
      |                                                                    =
 |
  0.6 ++                                                                   =
 |
  0.4 ++                                                                   =
 |
      *......*...         .*                                               =
 |
  0.2 ++         ..     ..                                                 =
 |
      |            .  ..                                                   =
 |
    0 ++------------*----------------------------------O-------------------=
-+




  1.4 ++-----O-------------O-----------------------------------------------=
-O
      |             O             O      O      O             O      O     =
 |
  1.2 O+                                                                   =
 |
      |                                                                    =
 |
    1 ++                                                                   =
 |
      |                                                                    =
 |
  0.8 ++                                                                   =
 |
      |                                                                    =
 |
  0.6 ++                                                                   =
 |
      |                                                                    =
 |
  0.4 ++                                                                   =
 |
      *......*...         .*                                               =
 |
  0.2 ++         ..     ..                                                 =
 |
      |            .  ..                                                   =
 |
    0 ++------------*----------------------------------O-------------------=
-+


                   will-it-scale.time.maximum_resident_set_size

  8000 ++------------------------------------------------------------------=
-+
       O......O      O      O      O      O     O             O      O     =
 O
  7000 ++      :           :                                               =
 |
  6000 ++      :           :                                               =
 |
       |        :         :                                                =
 |
  5000 ++       :         :                                                =
 |
       |         :       :                                                 =
 |
  4000 ++        :       :                                                 =
 |
       |          :     :                                                  =
 |
  3000 ++         :     :                                                  =
 |
  2000 ++          :   :                                                   =
 |
       |           :   :                                                   =
 |
  1000 ++           : :                                                    =
 |
       |            : :                                                    =
 |
     0 ++------------*---------------------------------O-------------------=
-+


                              sched_debug.cpu#29.avg_idle

  1.4e+07 ++---------------------------------------------------------------=
-+
          |     .*                                                         =
 |
  1.2e+07 ++.... :            *                                            =
 |
          *.      :          :                                             =
 |
    1e+07 ++      :          :                                             =
 |
          |        :        :                                              =
 |
    8e+06 ++       :        :                                              =
 |
          |         :      :                                               =
 |
    6e+06 ++        :      :                                               =
 |
          |          :    :                                                =
 |
    4e+06 ++         :   :                                                 =
 |
          |           :  :                                                 =
 |
    2e+06 ++          : :                                                  =
 |
          O      O     O:     O     O      O      O            O     O     =
 O
        0 ++-----------*--------------------------------O------------------=
-+


                       sched_debug.cpu#29.max_idle_balance_cost

  1.8e+07 ++---------------------------------------------------------------=
-+
          |      *                                                         =
 |
  1.6e+07 ++    +:                                                         =
 |
  1.4e+07 ++   +  :           *                                            =
 |
          |   +   :          :                                             =
 |
  1.2e+07 ++ +     :         :                                             =
 |
    1e+07 +++      :        :                                              =
 |
          |+        :      :                                               =
 |
    8e+06 *+        :      :                                               =
 |
    6e+06 ++         :    :                                                =
 |
          |          :    :                                                =
 |
    4e+06 ++          :  :                                                 =
 |
    2e+06 ++          : :                                                  =
 |
          |            ::                                                  =
 |
        0 O+-----O-----O------O-----O------O------O-----O------O-----O-----=
-O


                     sched_debug.cfs_rq[14]:/.blocked_load_avg

  700 ++-------------------------------------------------------------------=
-+
      |                    *                                               =
 |
  600 ++                  :                                                =
 |
      |                   :                                                =
 |
  500 ++                 :                                                 =
 |
      |   ...*           :                                                 =
 |
  400 *+..    :         :                                                  =
 |
      |        :        :                                                  =
 |
  300 ++       :       :                                                   =
 |
      |         :      :                                                   =
 |
  200 ++         :    :                                                    =
 |
      |           :   :                                                    =
 |
  100 ++          :  :                                                     =
 O
      |            : :                                        O      O     =
 |
    0 O+-----O------O------O------O------O------O------O-------------------=
-+


                     sched_debug.cfs_rq[14]:/.tg_load_contrib

  700 ++-------------------------------------------------------------------=
-+
      |                    *                                               =
 |
  600 ++                  :                                                =
 |
      |                   :                                                =
 |
  500 ++                 :                                                 =
 |
      |   ...*           :                                                 =
 |
  400 *+..    :         :                                                  =
 |
      |        :        :                                                  =
 |
  300 ++       :       :                                                   =
 |
      |         :      :                                                   =
 |
  200 ++         :    :                                                    =
 |
      |           :   :                                                    =
 |
  100 ++          :  :                                                     =
 O
      |            : :                                        O      O     =
 |
    0 O+-----O------O------O------O------O------O------O-------------------=
-+


                    sched_debug.cfs_rq[0]:/.tg_runnable_contrib

  450 ++-------------------------------------------------------------------=
-+
      *....                                                                =
 |
  400 ++   ....                                                            =
 |
  350 ++       ...                                                         =
 |
      |           ...                                                      =
 |
  300 ++             ....                                                  =
 |
  250 ++                 ...                                               =
.*
      |                     .                                           ...=
 |
  200 ++                     *.....                                  ...   =
 |
  150 ++                           ....                           ...      =
 |
      |                                ....                     ..         =
 |
  100 ++                                   ....              ...           =
 |
   50 ++                                       ....       ...              =
 |
      |                                            ..  ...                 =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[0]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
 |
        |                      *.....                                      =
.*
  10000 ++                           ....                              ....=
 |
        |                                ...                       ....    =
 |
        |                                   ....               ....        =
 |
   5000 ++                                      ....       ....            =
 |
        |                                           .  ....                =
 |
      0 ++-------------------------------------------*---------------------=
-+


                    sched_debug.cfs_rq[0]:/.avg->runnable_avg_sum

  20000 ++-----------------------------------------------------------------=
-+
  18000 *+...                                                              =
 |
        |    ....                                                          =
 |
  16000 ++       ...                                                       =
 |
  14000 ++          ...                                                    =
 |
        |              ....                                                =
 |
  12000 ++                 ...                                             =
.*
  10000 ++                    .                                         ...=
 |
   8000 ++                     *.....                                ...   =
 |
        |                            ....                         ...      =
 |
   6000 ++                               ...                    ..         =
 |
   4000 ++                                  ....             ...           =
 |
        |                                       ....      ...              =
 |
   2000 ++                                          .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                       sched_debug.cfs_rq[0]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                    sched_debug.cfs_rq[1]:/.tg_runnable_contrib

  350 *+-------------------------------------------------------------------=
-+
      |    ....                                                            =
 |
  300 ++       ...                                                         =
 |
      |           ...                                                      =
 |
  250 ++             ....                                                  =
 |
      |                  ...                                               =
 |
  200 ++                    .                                              =
.*
      |                      *.....                                     ...=
 |
  150 ++                           ...                               ...   =
 |
      |                               ...                         ...      =
 |
  100 ++                                 ....                   ..         =
 |
      |                                      ...             ...           =
 |
   50 ++                                        ....      ...              =
 |
      |                                             .  ...                 =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[1]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
 |
        |                      *.....                                      =
.*
  10000 ++                           ....                              ....=
 |
        |                                ...                       ....    =
 |
        |                                   ....               ....        =
 |
   5000 ++                                      ....       ....            =
 |
        |                                           .  ....                =
 |
      0 ++-------------------------------------------*---------------------=
-+


                    sched_debug.cfs_rq[1]:/.avg->runnable_avg_sum

  16000 *+-----------------------------------------------------------------=
-+
        |    ....                                                          =
 |
  14000 ++       ...                                                       =
 |
  12000 ++          ...                                                    =
 |
        |              ....                                                =
 |
  10000 ++                 ...                                             =
 |
        |                     .                                            =
.*
   8000 ++                     *....                                    ...=
 |
        |                           ...                              ...   =
 |
   6000 ++                             ...                        ...      =
 |
   4000 ++                                ....                  ..         =
 |
        |                                     ...            ...           =
 |
   2000 ++                                       ...      ...              =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                       sched_debug.cfs_rq[1]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                    sched_debug.cfs_rq[2]:/.tg_runnable_contrib

  200 ++-------------------------------------------------------------------=
-+
  180 *+..                                                                 =
 |
      |   ..                                                               =
 |
  160 ++    ..                                                             =
 |
  140 ++      ..                                                           =
 |
      |         ..                                                         =
 |
  120 ++          ..                                                       =
 |
  100 ++            ..                                                     =
 |
   80 ++              ..                                                   =
 |
      |                 ..                                                 =
 |
   60 ++                  ..                                               =
 |
   40 ++                    .                                              =
 |
      |                      *.................                            =
 |
   20 ++                                       ......            ..........=
.*
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[2]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
 |
        |                      *.....                                      =
.*
  10000 ++                           ....                              ....=
 |
        |                                ...                       ....    =
 |
        |                                   ....               ....        =
 |
   5000 ++                                      ....       ....            =
 |
        |                                           .  ....                =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[2]:/.avg->runnable_avg_sum

  9000 *+------------------------------------------------------------------=
-+
       |  ..                                                               =
 |
  8000 ++   ..                                                             =
 |
  7000 ++     ..                                                           =
 |
       |        ..                                                         =
 |
  6000 ++         ..                                                       =
 |
  5000 ++           ..                                                     =
 |
       |              ..                                                   =
 |
  4000 ++               ..                                                 =
 |
  3000 ++                 ..                                               =
 |
       |                    ..                                             =
 |
  2000 ++                                                                  =
 |
  1000 ++                     *.................                           =
 |
       |                                        .....            ..........=
.*
     0 ++--------------------------------------------*---------------------=
-+


                       sched_debug.cfs_rq[2]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[3]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
 |
        |                      *.....                                      =
.*
  10000 ++                           ....                              ....=
 |
        |                                ...                       ....    =
 |
        |                                   ....               ....        =
 |
   5000 ++                                      ....       ....            =
 |
        |                                           .  ....                =
 |
      0 ++-------------------------------------------*---------------------=
-+


                       sched_debug.cfs_rq[3]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                    sched_debug.cfs_rq[4]:/.tg_runnable_contrib

  350 *+-------------------------------------------------------------------=
-+
      |    ....                                                            =
 |
  300 ++       ...                                                         =
 |
      |           ...                                                      =
 |
  250 ++             ....                                                  =
.*
      |                  ...                                             ..=
 |
  200 ++                    .                                          ..  =
 |
      |                      *.....                                 ...    =
 |
  150 ++                           ...                            ..       =
 |
      |                               ...                       ..         =
 |
  100 ++                                 ....                 ..           =
 |
      |                                      ...           ...             =
 |
   50 ++                                        ....     ..                =
 |
      |                                             .  ..                  =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[4]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
 |
        |                      *.....                                      =
.*
  10000 ++                           ....                              ....=
 |
        |                                ...                       ....    =
 |
        |                                   ....               ....        =
 |
   5000 ++                                      ....       ....            =
 |
        |                                           .  ....                =
 |
      0 ++-------------------------------------------*---------------------=
-+


                    sched_debug.cfs_rq[4]:/.avg->runnable_avg_sum

  16000 *+-----------------------------------------------------------------=
-+
        |    ....                                                          =
 |
  14000 ++       ...                                                       =
 |
  12000 ++          ...                                                    =
.*
        |              ....                                              ..=
 |
  10000 ++                 ...                                         ..  =
 |
        |                     .                                      ..    =
 |
   8000 ++                     *....                               ..      =
 |
        |                           ...                          ..        =
 |
   6000 ++                             ...                     ..          =
 |
   4000 ++                                ....               ..            =
 |
        |                                     ...          ..              =
 |
   2000 ++                                       ...     ..                =
 |
        |                                           .  ..                  =
 |
      0 ++-------------------------------------------*---------------------=
-+


                       sched_debug.cfs_rq[4]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                    sched_debug.cfs_rq[5]:/.tg_runnable_contrib

  400 ++-------------------------------------------------------------------=
-+
      *.....                                                               =
 |
  350 ++    ....                                                           =
 |
  300 ++        ....                                                       =
 |
      |             ....                                                   =
.*
  250 ++                ....                                             ..=
 |
      |                     .                                          ..  =
 |
  200 ++                     *.....                                 ...    =
 |
      |                            ...                            ..       =
 |
  150 ++                              ...                       ..         =
 |
  100 ++                                 ....                 ..           =
 |
      |                                      ...           ...             =
 |
   50 ++                                        ....     ..                =
 |
      |                                             .  ..                  =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[5]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
 |
        |                      *.....                                      =
.*
  10000 ++                           ....                              ....=
 |
        |                                ...                       ....    =
 |
        |                                   ....               ....        =
 |
   5000 ++                                      ....       ....            =
 |
        |                                           .  ....                =
 |
      0 ++-------------------------------------------*---------------------=
-+


                    sched_debug.cfs_rq[5]:/.avg->runnable_avg_sum

  18000 *+-----------------------------------------------------------------=
-+
        |    ....                                                          =
 |
  16000 ++       ...                                                       =
 |
  14000 ++          ...                                                    =
 |
        |              ....                                                =
.*
  12000 ++                 ...                                           ..=
 |
  10000 ++                    .                                        ..  =
 |
        |                      *....                                ...    =
 |
   8000 ++                          ...                           ..       =
 |
   6000 ++                             ...                      ..         =
 |
        |                                 ....                ..           =
 |
   4000 ++                                    ...          ...             =
 |
   2000 ++                                       ...     ..                =
 |
        |                                           .  ..                  =
 |
      0 ++-------------------------------------------*---------------------=
-+


                       sched_debug.cfs_rq[5]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[6]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
 |
        |                      *.....                                      =
.*
  10000 ++                           ....                              ....=
 |
        |                                ...                       ....    =
 |
        |                                   ....               ....        =
 |
   5000 ++                                      ....       ....            =
 |
        |                                           .  ....                =
 |
      0 ++-------------------------------------------*---------------------=
-+


                    sched_debug.cfs_rq[6]:/.avg->runnable_avg_sum

  10000 ++-----------------------------------------------------------------=
-+
   9000 *+.                                                                =
 |
        |  ..                                                              =
 |
   8000 ++   ..                                                            =
 |
   7000 ++     ..                                                          =
 |
        |        ..                                                        =
 |
   6000 ++         ..                                                      =
 |
   5000 ++           ..                                                    =
 |
   4000 ++             ..                                                  =
 |
        |                ..                                                =
 |
   3000 ++                 ..                                              =
 |
   2000 ++                   ..                                            =
 |
        |                                                                  =
 |
   1000 ++                     *.....................            ..........=
.*
      0 ++-------------------------------------------*---------------------=
-+


                       sched_debug.cfs_rq[6]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[7]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
 |
        |                      *.....                                      =
.*
  10000 ++                           ....                              ....=
 |
        |                                ...                       ....    =
 |
        |                                   ....               ....        =
 |
   5000 ++                                      ....       ....            =
 |
        |                                           .  ....                =
 |
      0 ++-------------------------------------------*---------------------=
-+


                       sched_debug.cfs_rq[7]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                    sched_debug.cfs_rq[8]:/.tg_runnable_contrib

  400 ++-------------------------------------------------------------------=
-+
      *.....                                                               =
 |
  350 ++    ....                                                           =
 |
  300 ++        ....                                                       =
 |
      |             ....                                                   =
 |
  250 ++                ....                                               =
 |
      |                     .                                              =
 |
  200 ++                     *.....                                        =
.*
      |                            ...                                  ...=
 |
  150 ++                              ...                           ....   =
 |
  100 ++                                 ....                    ...       =
 |
      |                                      ...              ...          =
 |
   50 ++                                        ....      ....             =
 |
      |                                             .  ...                 =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[8]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
 |
        |                      *.....                                      =
.*
  10000 ++                           ....                              ....=
 |
        |                                ...                       ....    =
 |
        |                                   ....               ....        =
 |
   5000 ++                                      ....       ....            =
 |
        |                                           .  ....                =
 |
      0 ++-------------------------------------------*---------------------=
-+


                    sched_debug.cfs_rq[8]:/.avg->runnable_avg_sum

  18000 *+-----------------------------------------------------------------=
-+
        |    ....                                                          =
 |
  16000 ++       ...                                                       =
 |
  14000 ++          ...                                                    =
 |
        |              ....                                                =
 |
  12000 ++                 ...                                             =
 |
  10000 ++                    .                                            =
 |
        |                      *....                                       =
.*
   8000 ++                          ...                                 ...=
 |
   6000 ++                             ...                          ....   =
 |
        |                                 ....                   ...       =
 |
   4000 ++                                    ...             ...          =
 |
   2000 ++                                       ...      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                       sched_debug.cfs_rq[8]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                    sched_debug.cfs_rq[9]:/.tg_runnable_contrib

  350 *+-------------------------------------------------------------------=
-+
      |     ....                                                           =
 |
  300 ++        ....                                                       =
 |
      |             ....                                                   =
 |
  250 ++                ....                                               =
 |
      |                     .                                              =
 |
  200 ++                     *....                                         =
 |
      |                           ...                                      =
.*
  150 ++                             ...                                ...=
 |
      |                                 ...                         ....   =
 |
  100 ++                                   ...                   ...       =
 |
      |                                       ...             ...          =
 |
   50 ++                                         ...      ....             =
 |
      |                                             .  ...                 =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[9]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
 |
        |                      *.....                                      =
.*
  10000 ++                           ....                              ....=
 |
        |                                ...                       ....    =
 |
        |                                   ....               ....        =
 |
   5000 ++                                      ....       ....            =
 |
        |                                           .  ....                =
 |
      0 ++-------------------------------------------*---------------------=
-+


                    sched_debug.cfs_rq[9]:/.avg->runnable_avg_sum

  18000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  16000 *+.....                                                            =
 |
  14000 ++     .....                                                       =
 |
        |           .....                                                  =
 |
  12000 ++               ....                                              =
 |
  10000 ++                   ..                                            =
 |
        |                      *....                                       =
.*
   8000 ++                          ...                                 ...=
 |
   6000 ++                             ...                          ....   =
 |
        |                                 ....                   ...       =
 |
   4000 ++                                    ...             ...          =
 |
   2000 ++                                       ...      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                       sched_debug.cfs_rq[9]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[10]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
 |
        |                      *.....                                      =
.*
  10000 ++                           ....                              ....=
 |
        |                                ...                       ....    =
 |
        |                                   ....               ....        =
 |
   5000 ++                                      ....       ....            =
 |
        |                                           .  ....                =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[10]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[11]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
 |
        |                      *.....                                      =
.*
  10000 ++                           ....                              ....=
 |
        |                                ...                       ....    =
 |
        |                                   ....               ....        =
 |
   5000 ++                                      ....       ....            =
 |
        |                                           .  ....                =
 |
      0 ++-------------------------------------------*---------------------=
-+


                  sched_debug.cfs_rq[11]:/.avg->runnable_avg_sum

  9000 ++------------------------------------------------------------------=
-+
       *..                                                                 =
 |
  8000 ++ ..                                                               =
 |
  7000 ++   ..                                                             =
 |
       |      ..                                                           =
 |
  6000 ++       ..                                                         =
 |
  5000 ++         ..                                                       =
 |
       |            ..                                                     =
 |
  4000 ++             ..                                                   =
 |
  3000 ++               ..                                                 =
 |
       |                  ..                                               =
 |
  2000 ++                   ..                                             =
 |
  1000 ++                                                                  =
 |
       |                      *......................                      =
 |
     0 ++--------------------------------------------*---------------------=
-*


                      sched_debug.cfs_rq[11]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[12]:/.tg_runnable_contrib

  400 ++-------------------------------------------------------------------=
-+
      |                                                                    =
 |
  350 *+.....                                                              =
 |
  300 ++     .....                                                         =
 |
      |           .....                                                    =
 |
  250 ++               ....                                                =
 |
      |                    ..                                              =
.*
  200 ++                     *.....                                     ...=
 |
      |                            ...                               ...   =
 |
  150 ++                              ...                         ...      =
 |
  100 ++                                 ....                   ..         =
 |
      |                                      ...             ...           =
 |
   50 ++                                        ....      ...              =
 |
      |                                             .  ...                 =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[12]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
 |
        |                      *.....                                      =
.*
  10000 ++                           ....                              ....=
 |
        |                                ...                       ....    =
 |
        |                                   ....               ....        =
 |
   5000 ++                                      ....       ....            =
 |
        |                                           .  ....                =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[12]:/.avg->runnable_avg_sum

  18000 ++-----------------------------------------------------------------=
-+
        *.....                                                             =
 |
  16000 ++    ....                                                         =
 |
  14000 ++        ....                                                     =
 |
        |             ....                                                 =
 |
  12000 ++                ....                                             =
 |
  10000 ++                    .                                            =
.*
        |                      *....                                    ...=
 |
   8000 ++                          ...                              ...   =
 |
   6000 ++                             ...                        ...      =
 |
        |                                 ....                  ..         =
 |
   4000 ++                                    ...            ...           =
 |
   2000 ++                                       ...      ...              =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[12]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[13]:/.tg_runnable_contrib

  400 ++-------------------------------------------------------------------=
-+
      |                                                                    =
 |
  350 *+....                                                               =
 |
  300 ++    ....                                                           =
 |
      |         ....                                                       =
 |
  250 ++            ....                                                   =
 |
      |                 ....                                               =
 |
  200 ++                    .                                              =
.*
      |                      *.....                                     ...=
 |
  150 ++                           ....                             ....   =
 |
  100 ++                               ....                      ...       =
 |
      |                                    ....               ...          =
 |
   50 ++                                       ....       ....             =
 |
      |                                            ..  ...                 =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[13]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
 |
        |                      *.....                                      =
.*
  10000 ++                           ....                              ....=
 |
        |                                ...                       ....    =
 |
        |                                   ....               ....        =
 |
   5000 ++                                      ....       ....            =
 |
        |                                           .  ....                =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[13]:/.avg->runnable_avg_sum

  18000 ++-----------------------------------------------------------------=
-+
        *.....                                                             =
 |
  16000 ++    ....                                                         =
 |
  14000 ++        ....                                                     =
 |
        |             ....                                                 =
 |
  12000 ++                ....                                             =
 |
  10000 ++                    .                                            =
 |
        |                      *....                                       =
.*
   8000 ++                          ...                                 ...=
 |
   6000 ++                             ...                          ....   =
 |
        |                                 ....                   ...       =
 |
   4000 ++                                    ...             ...          =
 |
   2000 ++                                       ...      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[13]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[14]:/.tg_runnable_contrib

  200 ++-------------------------------------------------------------------=
-+
  180 *+..                                                                 =
 |
      |   ..                                                               =
 |
  160 ++    ..                                                             =
 |
  140 ++      ..                                                           =
 |
      |         ..                                                         =
 |
  120 ++          ..                                                       =
 |
  100 ++            ..                                                     =
 |
   80 ++              ..                                                   =
 |
      |                 ..                                                 =
 |
   60 ++                  ..                                               =
 |
   40 ++                    .                                              =
 |
      |                      *.................                            =
 |
   20 ++                                       ......            ..........=
.*
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[14]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
 |
        |                      *.....                                      =
.*
  10000 ++                           ....                              ....=
 |
        |                                ...                       ....    =
 |
        |                                   ....               ....        =
 |
   5000 ++                                      ....       ....            =
 |
        |                                           .  ....                =
 |
      0 ++-------------------------------------------*---------------------=
-+


                  sched_debug.cfs_rq[14]:/.avg->runnable_avg_sum

  9000 ++------------------------------------------------------------------=
-+
       *...                                                                =
 |
  8000 ++  ..                                                              =
 |
  7000 ++    ..                                                            =
 |
       |       ..                                                          =
 |
  6000 ++        ..                                                        =
 |
  5000 ++          ..                                                      =
 |
       |             ..                                                    =
 |
  4000 ++              ..                                                  =
 |
  3000 ++                ..                                                =
 |
       |                   ..                                              =
 |
  2000 ++                    .                                             =
 |
  1000 ++                     *.................                           =
 |
       |                                        .....            ..........=
.*
     0 ++--------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[14]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[15]:/.tg_runnable_contrib

  200 ++-------------------------------------------------------------------=
-+
  180 *+.                                                                  =
 |
      |  ..                                                                =
 |
  160 ++   ..                                                              =
 |
  140 ++     .                                                             =
 |
      |       ..                                                           =
 |
  120 ++        ..                                                         =
 |
  100 ++          ..                                                       =
 |
   80 ++            ..                                                     =
 |
      |               .                                                    =
 |
   60 ++               ..                                                  =
 |
   40 ++                 ..                                                =
 |
      |                    ..                                              =
 |
   20 ++                                                                   =
 |
    0 ++---------------------*-----------------------*---------------------=
-*


                      sched_debug.cfs_rq[15]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
 |
        |                      *.....                                      =
.*
  10000 ++                           ....                              ....=
 |
        |                                ...                       ....    =
 |
        |                                   ....               ....        =
 |
   5000 ++                                      ....       ....            =
 |
        |                                           .  ....                =
 |
      0 ++-------------------------------------------*---------------------=
-+


                  sched_debug.cfs_rq[15]:/.avg->runnable_avg_sum

  9000 ++------------------------------------------------------------------=
-+
       *..                                                                 =
 |
  8000 ++ ..                                                               =
 |
  7000 ++   ..                                                             =
 |
       |      .                                                            =
 |
  6000 ++      ..                                                          =
 |
  5000 ++        ..                                                        =
 |
       |           ..                                                      =
 |
  4000 ++            ..                                                    =
 |
  3000 ++              .                                                   =
 |
       |                ..                                                 =
 |
  2000 ++                 ..                                               =
 |
  1000 ++                   ..                                             =
 |
       |                                                                   =
 |
     0 ++---------------------*----------------------*---------------------=
-*


                      sched_debug.cfs_rq[15]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[16]:/.tg_runnable_contrib

  400 ++-------------------------------------------------------------------=
-+
      *.....                                                               =
 |
  350 ++    ....                                                           =
 |
  300 ++        ....                                                       =
 |
      |             ....                                                   =
 |
  250 ++                ....                                               =
.*
      |                     .                                            ..=
 |
  200 ++                     *.....                                   ...  =
 |
      |                            ...                              ..     =
 |
  150 ++                              ...                        ...       =
 |
  100 ++                                 ....                 ...          =
 |
      |                                      ...            ..             =
 |
   50 ++                                        ....     ...               =
 |
      |                                             .  ..                  =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[16]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
 |
        |                      *.....                                      =
.*
  10000 ++                           ....                              ....=
 |
        |                                ...                       ....    =
 |
        |                                   ....               ....        =
 |
   5000 ++                                      ....       ....            =
 |
        |                                           .  ....                =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[16]:/.avg->runnable_avg_sum

  18000 ++-----------------------------------------------------------------=
-+
        *......                                                            =
 |
  16000 ++     .....                                                       =
 |
  14000 ++          .....                                                  =
 |
        |                ....                                              =
 |
  12000 ++                   ..                                            =
.*
  10000 ++                     *....                                     ..=
 |
        |                           ..                                ...  =
 |
   8000 ++                            ...                           ..     =
 |
   6000 ++                               ...                     ...       =
 |
        |                                   ...               ...          =
 |
   4000 ++                                     ..           ..             =
 |
   2000 ++                                       ...     ...               =
 |
        |                                           .  ..                  =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[16]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[17]:/.tg_runnable_contrib

  400 ++-------------------------------------------------------------------=
-+
      *.....                                                               =
 |
  350 ++    ....                                                           =
 |
  300 ++        ....                                                       =
 |
      |             ....                                                   =
 |
  250 ++                ....                                               =
 |
      |                     .                                              =
 |
  200 ++                     *.....                                        =
 |
      |                            ...                                     =
.*
  150 ++                              ...                              ....=
 |
  100 ++                                 ....                      ....    =
 |
      |                                      ...               ....        =
 |
   50 ++                                        ....       ....            =
 |
      |                                             .  ....                =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[17]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
 |
        |                      *.....                                      =
.*
  10000 ++                           ....                              ....=
 |
        |                                ...                       ....    =
 |
        |                                   ....               ....        =
 |
   5000 ++                                      ....       ....            =
 |
        |                                           .  ....                =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[17]:/.avg->runnable_avg_sum

  18000 ++-----------------------------------------------------------------=
-+
        *.....                                                             =
 |
  16000 ++    ....                                                         =
 |
  14000 ++        ....                                                     =
 |
        |             ....                                                 =
 |
  12000 ++                ....                                             =
 |
  10000 ++                    .                                            =
 |
        |                      *....                                       =
 |
   8000 ++                          ...                                    =
.*
   6000 ++                             ...                             ....=
 |
        |                                 ....                     ....    =
 |
   4000 ++                                    ...              ....        =
 |
   2000 ++                                       ...       ....            =
 |
        |                                           .  ....                =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[17]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[18]:/.tg_runnable_contrib

  200 ++-------------------------------------------------------------------=
-+
  180 *+.                                                                  =
 |
      |  ..                                                                =
 |
  160 ++   ..                                                              =
 |
  140 ++     ..                                                            =
 |
      |        ..                                                          =
 |
  120 ++         ..                                                        =
 |
  100 ++           ..                                                      =
 |
   80 ++             ..                                                    =
 |
      |                ..                                                  =
 |
   60 ++                 ..                                                =
 |
   40 ++                   ..                                              =
 |
      |                                                                    =
 |
   20 ++                     *.......................            ..........=
.*
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[18]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
 |
        |                      *.....                                      =
.*
  10000 ++                           ....                              ....=
 |
        |                                ...                       ....    =
 |
        |                                   ....               ....        =
 |
   5000 ++                                      ....       ....            =
 |
        |                                           .  ....                =
 |
      0 ++-------------------------------------------*---------------------=
-+


                  sched_debug.cfs_rq[18]:/.avg->runnable_avg_sum

  9000 *+------------------------------------------------------------------=
-+
       |  ..                                                               =
 |
  8000 ++   ..                                                             =
 |
  7000 ++     .                                                            =
 |
       |       ..                                                          =
 |
  6000 ++        ..                                                        =
 |
  5000 ++          ..                                                      =
 |
       |             ..                                                    =
 |
  4000 ++              .                                                   =
 |
  3000 ++               ..                                                 =
 |
       |                  ..                                               =
 |
  2000 ++                   ..                                             =
 |
  1000 ++                                                                  =
 |
       |                      *......................            ..........=
.*
     0 ++--------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[18]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[19]:/.tg_runnable_contrib

  200 ++-------------------------------------------------------------------=
-+
  180 *+.                                                                  =
 |
      |  ..                                                                =
 |
  160 ++   ..                                                              =
 |
  140 ++     .                                                             =
 |
      |       ..                                                           =
 |
  120 ++        ..                                                         =
 |
  100 ++          ..                                                       =
 |
   80 ++            ..                                                     =
 |
      |               .                                                    =
 |
   60 ++               ..                                                  =
 |
   40 ++                 ..                                                =
 |
      |                    ..                                              =
 |
   20 ++                                                         ..........=
.*
    0 ++---------------------*-----------------------*---------------------=
-+


                      sched_debug.cfs_rq[19]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
 |
        |                      *.....                                      =
.*
  10000 ++                           ....                              ....=
 |
        |                                ...                       ....    =
 |
        |                                   ....               ....        =
 |
   5000 ++                                      ....       ....            =
 |
        |                                           .  ....                =
 |
      0 ++-------------------------------------------*---------------------=
-+


                  sched_debug.cfs_rq[19]:/.avg->runnable_avg_sum

  9000 ++------------------------------------------------------------------=
-+
       *..                                                                 =
 |
  8000 ++ ..                                                               =
 |
  7000 ++   ..                                                             =
 |
       |      ..                                                           =
 |
  6000 ++       ..                                                         =
 |
  5000 ++         ..                                                       =
 |
       |            ..                                                     =
 |
  4000 ++             ..                                                   =
 |
  3000 ++               ..                                                 =
 |
       |                  ..                                               =
 |
  2000 ++                   ..                                             =
 |
  1000 ++                                                                  =
 |
       |                      *......................            ..........=
.*
     0 ++--------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[19]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[20]:/.tg_runnable_contrib

  400 ++-------------------------------------------------------------------=
-+
      *......                                                              =
 |
  350 ++     .....                                                         =
 |
  300 ++          .....                                                    =
 |
      |                ....                                                =
 |
  250 ++                   ..                                              =
 |
      |                      *....                                         =
 |
  200 ++                          ...                                      =
.*
      |                              ...                                ...=
 |
  150 ++                                ...                         ....   =
 |
  100 ++                                   ...                   ...       =
 |
      |                                       ...             ...          =
 |
   50 ++                                         ...      ....             =
 |
      |                                             .  ...                 =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[20]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[20]:/.avg->runnable_avg_sum

  18000 ++-----------------------------------------------------------------=
-+
        *......                                                            =
 |
  16000 ++     .....                                                       =
 |
  14000 ++          .....                                                  =
 |
        |                ....                                              =
 |
  12000 ++                   ..                                            =
 |
  10000 ++                     *....                                       =
 |
        |                           ..                                     =
.*
   8000 ++                            ...                               ...=
 |
   6000 ++                               ...                        ....   =
 |
        |                                   ...                  ...       =
 |
   4000 ++                                     ..             ...          =
 |
   2000 ++                                       ...      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[20]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[21]:/.tg_runnable_contrib

  350 *+-------------------------------------------------------------------=
-+
      |     ....                                                           =
 |
  300 ++        ....                                                       =
 |
      |             ....                                                   =
 |
  250 ++                ....                                               =
 |
      |                     .                                              =
 |
  200 ++                     *....                                         =
.*
      |                           ...                                   ...=
 |
  150 ++                             ...                             ...   =
 |
      |                                 ...                       ...      =
 |
  100 ++                                   ...                  ..         =
 |
      |                                       ...            ...           =
 |
   50 ++                                         ...      ...              =
 |
      |                                             .  ...                 =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[21]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[21]:/.avg->runnable_avg_sum

  18000 ++-----------------------------------------------------------------=
-+
        *.....                                                             =
 |
  16000 ++    ....                                                         =
 |
  14000 ++        ....                                                     =
 |
        |             ....                                                 =
 |
  12000 ++                ....                                             =
 |
  10000 ++                    .                                            =
 |
        |                      *....                                       =
.*
   8000 ++                          ...                                 ...=
 |
   6000 ++                             ...                          ....   =
 |
        |                                 ....                   ...       =
 |
   4000 ++                                    ...             ...          =
 |
   2000 ++                                       ...      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[21]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[22]:/.tg_runnable_contrib

  180 *+-------------------------------------------------------------------=
-+
      |  ..                                                                =
 |
  160 ++   ..                                                              =
 |
  140 ++     ..                                                            =
 |
      |        ..                                                          =
 |
  120 ++         ..                                                        =
 |
  100 ++           ..                                                      =
 |
      |              ..                                                    =
 |
   80 ++               ..                                                  =
 |
   60 ++                 ..                                                =
 |
      |                    ..                                              =
 |
   40 ++                                                                   =
 |
   20 ++                     *.................                        ....=
.*
      |                                        ......      ............    =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[22]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                  sched_debug.cfs_rq[22]:/.avg->runnable_avg_sum

  9000 ++------------------------------------------------------------------=
-+
       *...                                                                =
 |
  8000 ++  ..                                                              =
 |
  7000 ++    ..                                                            =
 |
       |       ..                                                          =
 |
  6000 ++        ..                                                        =
 |
  5000 ++          ..                                                      =
 |
       |             ..                                                    =
 |
  4000 ++              ..                                                  =
 |
  3000 ++                ..                                                =
 |
       |                   ..                                              =
 |
  2000 ++                    .                                             =
 |
  1000 ++                     *.................                       ....=
.*
       |                                        .....      ............    =
 |
     0 ++--------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[22]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[23]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[23]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[24]:/.tg_runnable_contrib

  400 ++-------------------------------------------------------------------=
-+
      *.....                                                               =
 |
  350 ++    ....                                                           =
 |
  300 ++        ....                                                       =
 |
      |             ....                                                   =
 |
  250 ++                ....                                               =
.*
      |                     .                                            ..=
 |
  200 ++                     *.....                                   ...  =
 |
      |                            ...                              ..     =
 |
  150 ++                              ...                        ...       =
 |
  100 ++                                 ....                 ...          =
 |
      |                                      ...            ..             =
 |
   50 ++                                        ....     ...               =
 |
      |                                             .  ..                  =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[24]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[24]:/.avg->runnable_avg_sum

  18000 ++-----------------------------------------------------------------=
-+
        *.....                                                             =
 |
  16000 ++    ....                                                         =
 |
  14000 ++        ....                                                     =
 |
        |             ....                                                 =
 |
  12000 ++                ....                                             =
.*
  10000 ++                    .                                          ..=
 |
        |                      *....                                  ...  =
 |
   8000 ++                          ...                             ..     =
 |
   6000 ++                             ...                       ...       =
 |
        |                                 ....                ...          =
 |
   4000 ++                                    ...           ..             =
 |
   2000 ++                                       ...     ...               =
 |
        |                                           .  ..                  =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[24]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[25]:/.tg_runnable_contrib

  400 ++-------------------------------------------------------------------=
-+
      |                                                                    =
 |
  350 *+.....                                                              =
 |
  300 ++     .....                                                         =
 |
      |           .....                                                    =
 |
  250 ++               ....                                                =
 |
      |                    ..                                              =
 |
  200 ++                     *.....                                        =
 |
      |                            ...                                     =
.*
  150 ++                              ...                              ....=
 |
  100 ++                                 ....                      ....    =
 |
      |                                      ...               ....        =
 |
   50 ++                                        ....       ....            =
 |
      |                                             .  ....                =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[25]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[25]:/.avg->runnable_avg_sum

  18000 ++-----------------------------------------------------------------=
-+
        *.....                                                             =
 |
  16000 ++    ....                                                         =
 |
  14000 ++        ....                                                     =
 |
        |             ....                                                 =
 |
  12000 ++                ....                                             =
 |
  10000 ++                    .                                            =
 |
        |                      *....                                       =
 |
   8000 ++                          ...                                    =
.*
   6000 ++                             ...                             ....=
 |
        |                                 ....                     ....    =
 |
   4000 ++                                    ...              ....        =
 |
   2000 ++                                       ...       ....            =
 |
        |                                           .  ....                =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[25]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[26]:/.tg_runnable_contrib

  250 ++-------------------------------------------------------------------=
-+
      |                                                                    =
 |
      *..                                                                  =
 |
  200 ++ ..                                                                =
 |
      |    ..                                                              =
 |
      |      ..                                                            =
 |
  150 ++       ..                                                          =
 |
      |          ..                                                        =
 |
  100 ++           ..                                                      =
 |
      |              ..                                                    =
 |
      |                ..                                                  =
 |
   50 ++                 ..                                                =
 |
      |                    ..                                              =
 |
      |                                                          ..........=
.*
    0 ++---------------------*-----------------------*---------------------=
-+


                      sched_debug.cfs_rq[26]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[26]:/.avg->runnable_avg_sum

  12000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  10000 *+.                                                                =
 |
        |  ..                                                              =
 |
        |    ..                                                            =
 |
   8000 ++     ..                                                          =
 |
        |        ..                                                        =
 |
   6000 ++         ..                                                      =
 |
        |            ..                                                    =
 |
   4000 ++             ..                                                  =
 |
        |                ..                                                =
 |
        |                  ..                                              =
 |
   2000 ++                   ..                                            =
 |
        |                                                        ..........=
.*
      0 ++---------------------*---------------------*---------------------=
-+


                      sched_debug.cfs_rq[26]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[27]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[27]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[28]:/.tg_runnable_contrib

  400 ++-------------------------------------------------------------------=
-+
      *.....                                                               =
 |
  350 ++    ....                                                           =
 |
  300 ++        ....                                                       =
 |
      |             ....                                                   =
 |
  250 ++                ....                                               =
 |
      |                     .                                              =
.*
  200 ++                     *.....                                     ...=
 |
      |                            ...                               ...   =
 |
  150 ++                              ...                         ...      =
 |
  100 ++                                 ....                   ..         =
 |
      |                                      ...             ...           =
 |
   50 ++                                        ....      ...              =
 |
      |                                             .  ...                 =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[28]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[28]:/.avg->runnable_avg_sum

  18000 ++-----------------------------------------------------------------=
-+
        *.....                                                             =
 |
  16000 ++    ....                                                         =
 |
  14000 ++        ....                                                     =
 |
        |             ....                                                 =
 |
  12000 ++                ....                                             =
 |
  10000 ++                    .                                            =
.*
        |                      *....                                    ...=
 |
   8000 ++                          ...                              ...   =
 |
   6000 ++                             ...                        ...      =
 |
        |                                 ....                  ..         =
 |
   4000 ++                                    ...            ...           =
 |
   2000 ++                                       ...      ...              =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[28]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[29]:/.tg_runnable_contrib

  350 *+-------------------------------------------------------------------=
-+
      |     ....                                                           =
 |
  300 ++        ....                                                       =
 |
      |             ....                                                   =
 |
  250 ++                ....                                               =
 |
      |                     .                                              =
 |
  200 ++                     *....                                         =
 |
      |                           ...                                      =
.*
  150 ++                             ...                                ...=
 |
      |                                 ...                         ....   =
 |
  100 ++                                   ...                   ...       =
 |
      |                                       ...             ...          =
 |
   50 ++                                         ...      ....             =
 |
      |                                             .  ...                 =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[29]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[29]:/.avg->runnable_avg_sum

  16000 *+-----------------------------------------------------------------=
-+
        |     ....                                                         =
 |
  14000 ++        ....                                                     =
 |
  12000 ++            ....                                                 =
 |
        |                 ....                                             =
 |
  10000 ++                    .                                            =
 |
        |                      *....                                       =
 |
   8000 ++                          ..                                     =
.*
        |                             ...                               ...=
 |
   6000 ++                               ...                        ....   =
 |
   4000 ++                                  ...                  ...       =
 |
        |                                      ..             ...          =
 |
   2000 ++                                       ...      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[29]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[30]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[30]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[31]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[31]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[32]:/.tg_runnable_contrib

  600 ++-------------------------------------------------------------------=
-+
      |                                                                    =
 |
  500 *+..........                                                         =
 |
      |           ........                                                 =
 |
      |                   ...                                              =
 |
  400 ++                     *...                                          =
 |
      |                          ...                                       =
.*
  300 ++                            ...                                 ...=
 |
      |                                ..                            ...   =
 |
  200 ++                                 ...                      ...      =
 |
      |                                     ...                 ..         =
 |
      |                                        ..            ...           =
 |
  100 ++                                         ...      ...              =
 |
      |                                             .  ...                 =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[32]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[32]:/.avg->runnable_avg_sum

  25000 ++-----------------------------------------------------------------=
-+
        *...........                                                       =
 |
        |           ........                                               =
 |
  20000 ++                  ...                                            =
 |
        |                      *...                                        =
 |
        |                          ..                                      =
.*
  15000 ++                           ..                                  ..=
 |
        |                              ..                             ...  =
 |
  10000 ++                               ...                        ..     =
 |
        |                                   ..                   ...       =
 |
        |                                     ..              ...          =
 |
   5000 ++                                      ..          ..             =
 |
        |                                         ..     ...               =
 |
        |                                           .  ..                  =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[32]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[33]:/.tg_runnable_contrib

  400 *+-------------------------------------------------------------------=
-+
      |     ....                                                           =
 |
  350 ++        ....                                                       =
 |
  300 ++            ....                                                   =
 |
      |                 ....                                               =
 |
  250 ++                    .                                              =
 |
      |                      *....                                         =
 |
  200 ++                          ...                                      =
.*
      |                              ...                                ...=
 |
  150 ++                                ...                         ....   =
 |
  100 ++                                   ...                   ...       =
 |
      |                                       ...             ...          =
 |
   50 ++                                         ...      ....             =
 |
      |                                             .  ...                 =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[33]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[33]:/.avg->runnable_avg_sum

  20000 ++-----------------------------------------------------------------=
-+
  18000 *+.....                                                            =
 |
        |      .....                                                       =
 |
  16000 ++          .....                                                  =
 |
  14000 ++               ....                                              =
 |
        |                    ..                                            =
 |
  12000 ++                     *....                                       =
 |
  10000 ++                          ..                                     =
.*
   8000 ++                            ...                               ...=
 |
        |                                ...                        ....   =
 |
   6000 ++                                  ...                  ...       =
 |
   4000 ++                                     ..             ...          =
 |
        |                                        ...      ....             =
 |
   2000 ++                                          .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[33]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[34]:/.tg_runnable_contrib

  400 ++-------------------------------------------------------------------=
-+
      |                                                                    =
 |
  350 *+.....                                                              =
 |
  300 ++     .....                                                         =
 |
      |           .....                                                    =
 |
  250 ++               ....                                                =
 |
      |                    ..                                              =
 |
  200 ++                     *.....                                        =
 |
      |                            ...                                     =
.*
  150 ++                              ...                              ....=
 |
  100 ++                                 ....                      ....    =
 |
      |                                      ...               ....        =
 |
   50 ++                                        ....       ....            =
 |
      |                                             .  ....                =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[34]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[34]:/.avg->runnable_avg_sum

  18000 ++-----------------------------------------------------------------=
-+
        *.....                                                             =
 |
  16000 ++    ....                                                         =
 |
  14000 ++        ....                                                     =
 |
        |             ....                                                 =
 |
  12000 ++                ....                                             =
 |
  10000 ++                    .                                            =
 |
        |                      *....                                       =
.*
   8000 ++                          ...                                 ...=
 |
   6000 ++                             ...                          ....   =
 |
        |                                 ....                   ...       =
 |
   4000 ++                                    ...             ...          =
 |
   2000 ++                                       ...      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[34]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[35]:/.tg_runnable_contrib

  350 *+-------------------------------------------------------------------=
-+
      |    ....                                                            =
 |
  300 ++       ...                                                         =
 |
      |           ...                                                      =
 |
  250 ++             ....                                                  =
 |
      |                  ...                                               =
 |
  200 ++                    .                                              =
.*
      |                      *.....                                     ...=
 |
  150 ++                           ...                               ...   =
 |
      |                               ...                         ...      =
 |
  100 ++                                 ....                   ..         =
 |
      |                                      ...             ...           =
 |
   50 ++                                        ....      ...              =
 |
      |                                             .  ...                 =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[35]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[35]:/.avg->runnable_avg_sum

  16000 *+-----------------------------------------------------------------=
-+
        |    ....                                                          =
 |
  14000 ++       ...                                                       =
 |
  12000 ++          ...                                                    =
 |
        |              ....                                                =
 |
  10000 ++                 ...                                             =
 |
        |                     .                                            =
.*
   8000 ++                     *....                                    ...=
 |
        |                           ...                              ...   =
 |
   6000 ++                             ...                        ...      =
 |
   4000 ++                                ....                  ..         =
 |
        |                                     ...            ...           =
 |
   2000 ++                                       ...      ...              =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[35]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[36]:/.tg_runnable_contrib

  600 ++-------------------------------------------------------------------=
-+
      *........                                                            =
 |
  500 ++       ......                                                      =
 |
      |              ......                                                =
 |
      |                    ..                                              =
 |
  400 ++                     *...                                          =
.*
      |                          ...                                     ..=
 |
  300 ++                            ...                               ...  =
 |
      |                                ..                           ..     =
 |
  200 ++                                 ...                     ...       =
 |
      |                                     ...               ...          =
 |
      |                                        ..           ..             =
 |
  100 ++                                         ...     ...               =
 |
      |                                             .  ..                  =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[36]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[36]:/.avg->runnable_avg_sum

  25000 *+-----------------------------------------------------------------=
-+
        |        ......                                                    =
 |
        |              ......                                              =
 |
  20000 ++                   ..                                            =
 |
        |                      *...                                        =
.*
        |                          ..                                    ..=
 |
  15000 ++                           ..                                ..  =
 |
        |                              ..                           ...    =
 |
  10000 ++                               ...                      ..       =
 |
        |                                   ..                  ..         =
 |
        |                                     ..              ..           =
 |
   5000 ++                                      ..         ...             =
 |
        |                                         ..     ..                =
 |
        |                                           .  ..                  =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[36]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[37]:/.tg_runnable_contrib

  350 *+-------------------------------------------------------------------=
-+
      |    ....                                                            =
 |
  300 ++       ...                                                         =
 |
      |           ...                                                      =
 |
  250 ++             ....                                                  =
 |
      |                  ...                                               =
 |
  200 ++                    .                                              =
 |
      |                      *.....                                        =
.*
  150 ++                           ...                                  ...=
 |
      |                               ...                           ....   =
 |
  100 ++                                 ....                    ...       =
 |
      |                                      ...              ...          =
 |
   50 ++                                        ....      ....             =
 |
      |                                             .  ...                 =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[37]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[37]:/.avg->runnable_avg_sum

  16000 *+-----------------------------------------------------------------=
-+
        |    ....                                                          =
 |
  14000 ++       ...                                                       =
 |
  12000 ++          ...                                                    =
 |
        |              ....                                                =
 |
  10000 ++                 ...                                             =
 |
        |                     .                                            =
 |
   8000 ++                     *....                                       =
.*
        |                           ...                                 ...=
 |
   6000 ++                             ...                          ....   =
 |
   4000 ++                                ....                   ...       =
 |
        |                                     ...             ...          =
 |
   2000 ++                                       ...      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[37]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[38]:/.tg_runnable_contrib

  350 *+-------------------------------------------------------------------=
-+
      |     ....                                                           =
 |
  300 ++        ....                                                       =
 |
      |             ....                                                   =
 |
  250 ++                ....                                               =
 |
      |                     .                                              =
 |
  200 ++                     *....                                         =
 |
      |                           ...                                      =
.*
  150 ++                             ...                                ...=
 |
      |                                 ...                         ....   =
 |
  100 ++                                   ...                   ...       =
 |
      |                                       ...             ...          =
 |
   50 ++                                         ...      ....             =
 |
      |                                             .  ...                 =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[38]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[38]:/.avg->runnable_avg_sum

  18000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  16000 *+.....                                                            =
 |
  14000 ++     .....                                                       =
 |
        |           .....                                                  =
 |
  12000 ++               ....                                              =
 |
  10000 ++                   ..                                            =
 |
        |                      *....                                       =
 |
   8000 ++                          ...                                    =
.*
   6000 ++                             ...                             ....=
 |
        |                                 ....                     ....    =
 |
   4000 ++                                    ...              ....        =
 |
   2000 ++                                       ...       ....            =
 |
        |                                           .  ....                =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[38]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[39]:/.tg_runnable_contrib

  350 *+-------------------------------------------------------------------=
-+
      |    ....                                                            =
 |
  300 ++       ...                                                         =
 |
      |           ...                                                      =
 |
  250 ++             ....                                                  =
 |
      |                  ...                                               =
 |
  200 ++                    .                                              =
 |
      |                      *.....                                        =
.*
  150 ++                           ...                                  ...=
 |
      |                               ...                           ....   =
 |
  100 ++                                 ....                    ...       =
 |
      |                                      ...              ...          =
 |
   50 ++                                        ....      ....             =
 |
      |                                             .  ...                 =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[39]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[39]:/.avg->runnable_avg_sum

  16000 *+-----------------------------------------------------------------=
-+
        |    ....                                                          =
 |
  14000 ++       ...                                                       =
 |
  12000 ++          ...                                                    =
 |
        |              ....                                                =
 |
  10000 ++                 ...                                             =
 |
        |                     .                                            =
 |
   8000 ++                     *....                                       =
.*
        |                           ...                                 ...=
 |
   6000 ++                             ...                          ....   =
 |
   4000 ++                                ....                   ...       =
 |
        |                                     ...             ...          =
 |
   2000 ++                                       ...      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[39]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[40]:/.tg_runnable_contrib

  600 ++-------------------------------------------------------------------=
-+
      |                                                                    =
 |
  500 *+.......                                                            =
 |
      |        ......                                                      =
 |
      |              ......                                                =
 |
  400 ++                   ..                                              =
 |
      |                      *....                                         =
.*
  300 ++                          ...                                   ...=
 |
      |                              ...                             ...   =
 |
  200 ++                                ...                       ...      =
 |
      |                                    ...                  ..         =
 |
      |                                       ...            ...           =
 |
  100 ++                                         ...      ...              =
 |
      |                                             .  ...                 =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[40]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[40]:/.avg->runnable_avg_sum

  25000 ++-----------------------------------------------------------------=
-+
        *........                                                          =
 |
        |        ......                                                    =
 |
  20000 ++             ......                                              =
 |
        |                    ..                                            =
 |
        |                      *...                                        =
.*
  15000 ++                         ...                                   ..=
 |
        |                             ..                              ...  =
 |
  10000 ++                              ..                          ..     =
 |
        |                                 ...                    ...       =
 |
        |                                    ..               ...          =
 |
   5000 ++                                     ...          ..             =
 |
        |                                         ..     ...               =
 |
        |                                           .  ..                  =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[40]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[41]:/.tg_runnable_contrib

  400 *+-------------------------------------------------------------------=
-+
      |    ...                                                             =
 |
  350 ++      ...                                                          =
 |
  300 ++         ..                                                        =
.*
      |            ...                                                   ..=
 |
  250 ++              ...                                              ..  =
 |
      |                  ...                                         ..    =
 |
  200 ++                    .                                      ..      =
 |
      |                      *.....                              ..        =
 |
  150 ++                           ....                        ..          =
 |
  100 ++                               ....                  ..            =
 |
      |                                    ....            ..              =
 |
   50 ++                                       ....      ..                =
 |
      |                                            ..  ..                  =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[41]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[41]:/.avg->runnable_avg_sum

  20000 ++-----------------------------------------------------------------=
-+
  18000 *+...                                                              =
 |
        |    ....                                                          =
 |
  16000 ++       ...                                                       =
 |
  14000 ++          ...                                                    =
.*
        |              ....                                              ..=
 |
  12000 ++                 ...                                         ..  =
 |
  10000 ++                    .                                     ...    =
 |
   8000 ++                     *.....                             ..       =
 |
        |                            ....                       ..         =
 |
   6000 ++                               ...                  ..           =
 |
   4000 ++                                  ....           ...             =
 |
        |                                       ....     ..                =
 |
   2000 ++                                          .  ..                  =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[41]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[42]:/.tg_runnable_contrib

  400 ++-------------------------------------------------------------------=
-+
      *......                                                              =
 |
  350 ++     .....                                                         =
 |
  300 ++          .....                                                    =
 |
      |                ....                                                =
 |
  250 ++                   ..                                              =
 |
      |                      *....                                         =
 |
  200 ++                          ...                                      =
 |
      |                              ...                                   =
.*
  150 ++                                ...                            ....=
 |
  100 ++                                   ...                     ....    =
 |
      |                                       ...              ....        =
 |
   50 ++                                         ...       ....            =
 |
      |                                             .  ....                =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[42]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[42]:/.avg->runnable_avg_sum

  18000 *+-----------------------------------------------------------------=
-+
        |     ....                                                         =
 |
  16000 ++        ....                                                     =
 |
  14000 ++            ....                                                 =
 |
        |                 ....                                             =
 |
  12000 ++                    .                                            =
 |
  10000 ++                     *....                                       =
 |
        |                           ..                                     =
.*
   8000 ++                            ...                               ...=
 |
   6000 ++                               ...                        ....   =
 |
        |                                   ...                  ...       =
 |
   4000 ++                                     ..             ...          =
 |
   2000 ++                                       ...      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[42]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[43]:/.tg_runnable_contrib

  350 *+-------------------------------------------------------------------=
-+
      |    ....                                                            =
 |
  300 ++       ...                                                         =
 |
      |           ...                                                      =
 |
  250 ++             ....                                                  =
 |
      |                  ...                                               =
 |
  200 ++                    .                                              =
 |
      |                      *.....                                        =
.*
  150 ++                           ...                                  ...=
 |
      |                               ...                           ....   =
 |
  100 ++                                 ....                    ...       =
 |
      |                                      ...              ...          =
 |
   50 ++                                        ....      ....             =
 |
      |                                             .  ...                 =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[43]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[43]:/.avg->runnable_avg_sum

  18000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  16000 *+....                                                             =
 |
  14000 ++    ....                                                         =
 |
        |         ....                                                     =
 |
  12000 ++            ....                                                 =
 |
  10000 ++                ....                                             =
 |
        |                     .                                            =
 |
   8000 ++                     *.....                                      =
.*
   6000 ++                           ....                              ....=
 |
        |                                ...                       ....    =
 |
   4000 ++                                  ....               ....        =
 |
   2000 ++                                      ....       ....            =
 |
        |                                           .  ....                =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[43]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[44]:/.tg_runnable_contrib

  600 ++-------------------------------------------------------------------=
-+
      |                                                                    =
 |
  500 *+.......                                                            =
 |
      |        ......                                                      =
 |
      |              ......                                                =
 |
  400 ++                   ..                                              =
 |
      |                      *....                                         =
.*
  300 ++                          ...                                   ...=
 |
      |                              ...                             ...   =
 |
  200 ++                                ...                       ...      =
 |
      |                                    ...                  ..         =
 |
      |                                       ...            ...           =
 |
  100 ++                                         ...      ...              =
 |
      |                                             .  ...                 =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[44]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[44]:/.avg->runnable_avg_sum

  25000 *+-----------------------------------------------------------------=
-+
        |      .....                                                       =
 |
        |           .....                                                  =
 |
  20000 ++               ....                                              =
 |
        |                    ..                                            =
 |
        |                      *...                                        =
.*
  15000 ++                         ...                                   ..=
 |
        |                             ..                              ...  =
 |
  10000 ++                              ..                          ..     =
 |
        |                                 ...                    ...       =
 |
        |                                    ..               ...          =
 |
   5000 ++                                     ...          ..             =
 |
        |                                         ..     ...               =
 |
        |                                           .  ..                  =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[44]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[45]:/.tg_runnable_contrib

  400 ++-------------------------------------------------------------------=
-+
      *.....                                                               =
 |
  350 ++    ....                                                           =
 |
  300 ++        ....                                                       =
 |
      |             ....                                                   =
 |
  250 ++                ....                                               =
 |
      |                     .                                              =
 |
  200 ++                     *.....                                        =
 |
      |                            ...                                     =
.*
  150 ++                              ...                              ....=
 |
  100 ++                                 ....                      ....    =
 |
      |                                      ...               ....        =
 |
   50 ++                                        ....       ....            =
 |
      |                                             .  ....                =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[45]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[45]:/.avg->runnable_avg_sum

  18000 ++-----------------------------------------------------------------=
-+
        *.....                                                             =
 |
  16000 ++    ....                                                         =
 |
  14000 ++        ....                                                     =
 |
        |             ....                                                 =
 |
  12000 ++                ....                                             =
 |
  10000 ++                    .                                            =
 |
        |                      *....                                       =
 |
   8000 ++                          ...                                    =
.*
   6000 ++                             ...                             ....=
 |
        |                                 ....                     ....    =
 |
   4000 ++                                    ...              ....        =
 |
   2000 ++                                       ...       ....            =
 |
        |                                           .  ....                =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[45]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[46]:/.tg_runnable_contrib

  400 ++-------------------------------------------------------------------=
-+
      |                                                                    =
 |
  350 *+.....                                                              =
 |
  300 ++     .....                                                         =
 |
      |           .....                                                    =
 |
  250 ++               ....                                                =
 |
      |                    ..                                              =
 |
  200 ++                     *.....                                        =
.*
      |                            ...                                  ...=
 |
  150 ++                              ...                           ....   =
 |
  100 ++                                 ....                    ...       =
 |
      |                                      ...              ...          =
 |
   50 ++                                        ....      ....             =
 |
      |                                             .  ...                 =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[46]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[46]:/.avg->runnable_avg_sum

  18000 ++-----------------------------------------------------------------=
-+
        *.....                                                             =
 |
  16000 ++    ....                                                         =
 |
  14000 ++        ....                                                     =
 |
        |             ....                                                 =
 |
  12000 ++                ....                                             =
 |
  10000 ++                    .                                            =
 |
        |                      *....                                       =
.*
   8000 ++                          ...                                 ...=
 |
   6000 ++                             ...                          ....   =
 |
        |                                 ....                   ...       =
 |
   4000 ++                                    ...             ...          =
 |
   2000 ++                                       ...      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[46]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[47]:/.tg_runnable_contrib

  400 ++-------------------------------------------------------------------=
-+
      *....                                                                =
 |
  350 ++   ....                                                            =
 |
  300 ++       ...                                                         =
 |
      |           ...                                                      =
 |
  250 ++             ....                                                  =
 |
      |                  ...                                               =
 |
  200 ++                    .                                              =
 |
      |                      *.....                                        =
.*
  150 ++                           ....                                ....=
 |
  100 ++                               ....                        ....    =
 |
      |                                    ....                ....        =
 |
   50 ++                                       ....        ....            =
 |
      |                                            ..  ....                =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[47]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[47]:/.avg->runnable_avg_sum

  18000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  16000 ++   ....                                                          =
 |
  14000 ++       ...                                                       =
 |
        |           ...                                                    =
 |
  12000 ++             ....                                                =
 |
  10000 ++                 ...                                             =
 |
        |                     .                                            =
 |
   8000 ++                     *.....                                      =
.*
   6000 ++                           ....                              ....=
 |
        |                                ...                       ....    =
 |
   4000 ++                                  ....               ....        =
 |
   2000 ++                                      ....       ....            =
 |
        |                                           .  ....                =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[47]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[48]:/.tg_runnable_contrib

  600 ++-------------------------------------------------------------------=
-+
      |                                                                    =
 |
  500 *+..........                                                         =
 |
      |           ........                                                 =
 |
      |                   ...                                              =
 |
  400 ++                     *...                                          =
 |
      |                          ...                                       =
.*
  300 ++                            ...                                 ...=
 |
      |                                ..                            ...   =
 |
  200 ++                                 ...                      ...      =
 |
      |                                     ...                 ..         =
 |
      |                                        ..            ...           =
 |
  100 ++                                         ...      ...              =
 |
      |                                             .  ...                 =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[48]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[48]:/.avg->runnable_avg_sum

  25000 *+-----------------------------------------------------------------=
-+
        |        ......                                                    =
 |
        |              ......                                              =
 |
  20000 ++                   ..                                            =
 |
        |                      *...                                        =
 |
        |                          ..                                      =
.*
  15000 ++                           ..                                  ..=
 |
        |                              ..                             ...  =
 |
  10000 ++                               ...                        ..     =
 |
        |                                   ..                   ...       =
 |
        |                                     ..              ...          =
 |
   5000 ++                                      ..          ..             =
 |
        |                                         ..     ...               =
 |
        |                                           .  ..                  =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[48]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[49]:/.tg_runnable_contrib

  400 ++-------------------------------------------------------------------=
-+
      |                                                                    =
 |
  350 *+.....                                                              =
 |
  300 ++     .....                                                         =
 |
      |           .....                                                    =
 |
  250 ++               ....                                                =
 |
      |                    ..                                              =
 |
  200 ++                     *.....                                        =
.*
      |                            ...                                  ...=
 |
  150 ++                              ...                           ....   =
 |
  100 ++                                 ....                    ...       =
 |
      |                                      ...              ...          =
 |
   50 ++                                        ....      ....             =
 |
      |                                             .  ...                 =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[49]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[49]:/.avg->runnable_avg_sum

  18000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  16000 *+.....                                                            =
 |
  14000 ++     .....                                                       =
 |
        |           .....                                                  =
 |
  12000 ++               ....                                              =
 |
  10000 ++                   ..                                            =
 |
        |                      *....                                       =
.*
   8000 ++                          ...                                 ...=
 |
   6000 ++                             ...                          ....   =
 |
        |                                 ....                   ...       =
 |
   4000 ++                                    ...             ...          =
 |
   2000 ++                                       ...      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[49]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[50]:/.tg_runnable_contrib

  350 *+-------------------------------------------------------------------=
-+
      |    ....                                                            =
 |
  300 ++       ...                                                         =
 |
      |           ...                                                      =
 |
  250 ++             ....                                                  =
 |
      |                  ...                                               =
 |
  200 ++                    .                                              =
.*
      |                      *.....                                     ...=
 |
  150 ++                           ...                               ...   =
 |
      |                               ...                         ...      =
 |
  100 ++                                 ....                   ..         =
 |
      |                                      ...             ...           =
 |
   50 ++                                        ....      ...              =
 |
      |                                             .  ...                 =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[50]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[50]:/.avg->runnable_avg_sum

  16000 *+-----------------------------------------------------------------=
-+
        |    ....                                                          =
 |
  14000 ++       ...                                                       =
 |
  12000 ++          ...                                                    =
 |
        |              ....                                                =
 |
  10000 ++                 ...                                             =
 |
        |                     .                                            =
.*
   8000 ++                     *....                                    ...=
 |
        |                           ...                              ...   =
 |
   6000 ++                             ...                        ...      =
 |
   4000 ++                                ....                  ..         =
 |
        |                                     ...            ...           =
 |
   2000 ++                                       ...      ...              =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[50]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[51]:/.tg_runnable_contrib

  350 *+-------------------------------------------------------------------=
-+
      |    ....                                                            =
 |
  300 ++       ...                                                         =
 |
      |           ...                                                      =
 |
  250 ++             ....                                                  =
 |
      |                  ...                                               =
 |
  200 ++                    .                                              =
 |
      |                      *.....                                        =
.*
  150 ++                           ...                                  ...=
 |
      |                               ...                           ....   =
 |
  100 ++                                 ....                    ...       =
 |
      |                                      ...              ...          =
 |
   50 ++                                        ....      ....             =
 |
      |                                             .  ...                 =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[51]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[51]:/.avg->runnable_avg_sum

  18000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  16000 ++   ....                                                          =
 |
  14000 ++       ...                                                       =
 |
        |           ...                                                    =
 |
  12000 ++             ....                                                =
 |
  10000 ++                 ...                                             =
 |
        |                     .                                            =
 |
   8000 ++                     *.....                                      =
.*
   6000 ++                           ....                              ....=
 |
        |                                ...                       ....    =
 |
   4000 ++                                  ....               ....        =
 |
   2000 ++                                      ....       ....            =
 |
        |                                           .  ....                =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[51]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[52]:/.tg_runnable_contrib

  600 ++-------------------------------------------------------------------=
-+
      |                                                                    =
 |
  500 *+.......                                                            =
 |
      |        ......                                                      =
 |
      |              ......                                                =
 |
  400 ++                   ..                                              =
 |
      |                      *....                                         =
.*
  300 ++                          ...                                   ...=
 |
      |                              ...                             ...   =
 |
  200 ++                                ...                       ...      =
 |
      |                                    ...                  ..         =
 |
      |                                       ...            ...           =
 |
  100 ++                                         ...      ...              =
 |
      |                                             .  ...                 =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[52]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[52]:/.avg->runnable_avg_sum

  25000 ++-----------------------------------------------------------------=
-+
        *........                                                          =
 |
        |        ......                                                    =
 |
  20000 ++             ......                                              =
 |
        |                    ..                                            =
 |
        |                      *...                                        =
.*
  15000 ++                         ...                                   ..=
 |
        |                             ..                              ...  =
 |
  10000 ++                              ..                          ..     =
 |
        |                                 ...                    ...       =
 |
        |                                    ..               ...          =
 |
   5000 ++                                     ...          ..             =
 |
        |                                         ..     ...               =
 |
        |                                           .  ..                  =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[52]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[53]:/.tg_runnable_contrib

  400 ++-------------------------------------------------------------------=
-+
      *......                                                              =
 |
  350 ++     .....                                                         =
 |
  300 ++          .....                                                    =
 |
      |                ....                                                =
 |
  250 ++                   ..                                              =
 |
      |                      *....                                         =
 |
  200 ++                          ...                                      =
 |
      |                              ...                                   =
.*
  150 ++                                ...                            ....=
 |
  100 ++                                   ...                     ....    =
 |
      |                                       ...              ....        =
 |
   50 ++                                         ...       ....            =
 |
      |                                             .  ....                =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[53]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[53]:/.avg->runnable_avg_sum

  18000 ++-----------------------------------------------------------------=
-+
        *......                                                            =
 |
  16000 ++     .....                                                       =
 |
  14000 ++          .....                                                  =
 |
        |                ....                                              =
 |
  12000 ++                   ..                                            =
 |
  10000 ++                     *....                                       =
 |
        |                           ..                                     =
 |
   8000 ++                            ...                                  =
.*
   6000 ++                               ...                           ....=
 |
        |                                   ...                    ....    =
 |
   4000 ++                                     ..              ....        =
 |
   2000 ++                                       ...       ....            =
 |
        |                                           .  ....                =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[53]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[54]:/.tg_runnable_contrib

  400 ++-------------------------------------------------------------------=
-+
      *.....                                                               =
 |
  350 ++    ....                                                           =
 |
  300 ++        ....                                                       =
 |
      |             ....                                                   =
 |
  250 ++                ....                                               =
 |
      |                     .                                              =
 |
  200 ++                     *.....                                        =
.*
      |                            ...                                  ...=
 |
  150 ++                              ...                           ....   =
 |
  100 ++                                 ....                    ...       =
 |
      |                                      ...              ...          =
 |
   50 ++                                        ....      ....             =
 |
      |                                             .  ...                 =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[54]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[54]:/.avg->runnable_avg_sum

  18000 ++-----------------------------------------------------------------=
-+
        *.....                                                             =
 |
  16000 ++    ....                                                         =
 |
  14000 ++        ....                                                     =
 |
        |             ....                                                 =
 |
  12000 ++                ....                                             =
 |
  10000 ++                    .                                            =
 |
        |                      *....                                       =
.*
   8000 ++                          ...                                 ...=
 |
   6000 ++                             ...                          ....   =
 |
        |                                 ....                   ...       =
 |
   4000 ++                                    ...             ...          =
 |
   2000 ++                                       ...      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[54]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[55]:/.tg_runnable_contrib

  350 *+-------------------------------------------------------------------=
-+
      |    ....                                                            =
 |
  300 ++       ...                                                         =
 |
      |           ...                                                      =
 |
  250 ++             ....                                                  =
 |
      |                  ...                                               =
 |
  200 ++                    .                                              =
 |
      |                      *.....                                        =
.*
  150 ++                           ...                                  ...=
 |
      |                               ...                           ....   =
 |
  100 ++                                 ....                    ...       =
 |
      |                                      ...              ...          =
 |
   50 ++                                        ....      ....             =
 |
      |                                             .  ...                 =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[55]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[55]:/.avg->runnable_avg_sum

  16000 *+-----------------------------------------------------------------=
-+
        |    ....                                                          =
 |
  14000 ++       ...                                                       =
 |
  12000 ++          ...                                                    =
 |
        |              ....                                                =
 |
  10000 ++                 ...                                             =
 |
        |                     .                                            =
 |
   8000 ++                     *....                                       =
.*
        |                           ...                                 ...=
 |
   6000 ++                             ...                          ....   =
 |
   4000 ++                                ....                   ...       =
 |
        |                                     ...             ...          =
 |
   2000 ++                                       ...      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[55]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[56]:/.tg_runnable_contrib

  600 ++-------------------------------------------------------------------=
-+
      |                                                                    =
 |
  500 *+..........                                                         =
 |
      |           ........                                                 =
 |
      |                   ...                                              =
 |
  400 ++                     *...                                          =
 |
      |                          ...                                       =
.*
  300 ++                            ...                                 ...=
 |
      |                                ..                            ...   =
 |
  200 ++                                 ...                      ...      =
 |
      |                                     ...                 ..         =
 |
      |                                        ..            ...           =
 |
  100 ++                                         ...      ...              =
 |
      |                                             .  ...                 =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[56]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[56]:/.avg->runnable_avg_sum

  25000 *+-----------------------------------------------------------------=
-+
        |        ......                                                    =
 |
        |              ......                                              =
 |
  20000 ++                   ..                                            =
 |
        |                      *...                                        =
 |
        |                          ..                                      =
.*
  15000 ++                           ..                                  ..=
 |
        |                              ..                             ...  =
 |
  10000 ++                               ...                        ..     =
 |
        |                                   ..                   ...       =
 |
        |                                     ..              ...          =
 |
   5000 ++                                      ..          ..             =
 |
        |                                         ..     ...               =
 |
        |                                           .  ..                  =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[56]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[57]:/.tg_runnable_contrib

  400 ++-------------------------------------------------------------------=
-+
      *....                                                                =
 |
  350 ++   ....                                                            =
 |
  300 ++       ...                                                         =
 |
      |           ...                                                      =
.*
  250 ++             ....                                                ..=
 |
      |                  ...                                           ..  =
 |
  200 ++                    .                                       ...    =
 |
      |                      *.....                               ..       =
 |
  150 ++                           ....                         ..         =
 |
  100 ++                               ....                   ..           =
 |
      |                                    ....            ...             =
 |
   50 ++                                       ....      ..                =
 |
      |                                            ..  ..                  =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[57]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[57]:/.avg->runnable_avg_sum

  18000 ++-----------------------------------------------------------------=
-+
        *.....                                                             =
 |
  16000 ++    ....                                                         =
 |
  14000 ++        ....                                                     =
.*
        |             ....                                               ..=
 |
  12000 ++                ....                                         ..  =
 |
  10000 ++                    .                                      ..    =
 |
        |                      *....                               ..      =
 |
   8000 ++                          ...                          ..        =
 |
   6000 ++                             ...                     ..          =
 |
        |                                 ....               ..            =
 |
   4000 ++                                    ...          ..              =
 |
   2000 ++                                       ...     ..                =
 |
        |                                           .  ..                  =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[57]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[58]:/.tg_runnable_contrib

  350 *+-------------------------------------------------------------------=
-+
      |    ....                                                            =
 |
  300 ++       ...                                                         =
 |
      |           ...                                                      =
 |
  250 ++             ....                                                  =
 |
      |                  ...                                               =
 |
  200 ++                    .                                              =
 |
      |                      *.....                                        =
.*
  150 ++                           ...                                  ...=
 |
      |                               ...                           ....   =
 |
  100 ++                                 ....                    ...       =
 |
      |                                      ...              ...          =
 |
   50 ++                                        ....      ....             =
 |
      |                                             .  ...                 =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[58]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[58]:/.avg->runnable_avg_sum

  16000 *+-----------------------------------------------------------------=
-+
        |    ....                                                          =
 |
  14000 ++       ...                                                       =
 |
  12000 ++          ...                                                    =
 |
        |              ....                                                =
 |
  10000 ++                 ...                                             =
 |
        |                     .                                            =
.*
   8000 ++                     *....                                    ...=
 |
        |                           ...                              ...   =
 |
   6000 ++                             ...                        ...      =
 |
   4000 ++                                ....                  ..         =
 |
        |                                     ...            ...           =
 |
   2000 ++                                       ...      ...              =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[58]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[59]:/.tg_runnable_contrib

  350 *+-------------------------------------------------------------------=
-+
      |    ....                                                            =
 |
  300 ++       ...                                                         =
 |
      |           ...                                                      =
 |
  250 ++             ....                                                  =
 |
      |                  ...                                               =
 |
  200 ++                    .                                              =
 |
      |                      *.....                                        =
.*
  150 ++                           ...                                  ...=
 |
      |                               ...                           ....   =
 |
  100 ++                                 ....                    ...       =
 |
      |                                      ...              ...          =
 |
   50 ++                                        ....      ....             =
 |
      |                                             .  ...                 =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[59]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[59]:/.avg->runnable_avg_sum

  16000 *+-----------------------------------------------------------------=
-+
        |    ....                                                          =
 |
  14000 ++       ...                                                       =
 |
  12000 ++          ...                                                    =
 |
        |              ....                                                =
 |
  10000 ++                 ...                                             =
 |
        |                     .                                            =
 |
   8000 ++                     *....                                       =
.*
        |                           ...                                 ...=
 |
   6000 ++                             ...                          ....   =
 |
   4000 ++                                ....                   ...       =
 |
        |                                     ...             ...          =
 |
   2000 ++                                       ...      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[59]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[60]:/.tg_runnable_contrib

  600 ++-------------------------------------------------------------------=
-+
      |                                                                    =
 |
  500 *+..........                                                         =
 |
      |           ........                                                 =
 |
      |                   ...                                              =
 |
  400 ++                     *...                                          =
 |
      |                          ...                                       =
.*
  300 ++                            ...                                 ...=
 |
      |                                ..                            ...   =
 |
  200 ++                                 ...                      ...      =
 |
      |                                     ...                 ..         =
 |
      |                                        ..            ...           =
 |
  100 ++                                         ...      ...              =
 |
      |                                             .  ...                 =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[60]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[60]:/.avg->runnable_avg_sum

  25000 ++-----------------------------------------------------------------=
-+
        *...........                                                       =
 |
        |           ........                                               =
 |
  20000 ++                  ...                                            =
 |
        |                      *...                                        =
 |
        |                          ..                                      =
.*
  15000 ++                           ..                                  ..=
 |
        |                              ..                             ...  =
 |
  10000 ++                               ...                        ..     =
 |
        |                                   ..                   ...       =
 |
        |                                     ..              ...          =
 |
   5000 ++                                      ..          ..             =
 |
        |                                         ..     ...               =
 |
        |                                           .  ..                  =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[60]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[61]:/.tg_runnable_contrib

  400 *+-------------------------------------------------------------------=
-+
      |    ...                                                             =
 |
  350 ++      ...                                                          =
 |
  300 ++         ..                                                        =
 |
      |            ...                                                     =
 |
  250 ++              ...                                                  =
 |
      |                  ...                                               =
 |
  200 ++                    .                                              =
 |
      |                      *.....                                        =
.*
  150 ++                           ....                                ....=
 |
  100 ++                               ....                        ....    =
 |
      |                                    ....                ....        =
 |
   50 ++                                       ....        ....            =
 |
      |                                            ..  ....                =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[61]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[61]:/.avg->runnable_avg_sum

  20000 ++-----------------------------------------------------------------=
-+
  18000 *+...                                                              =
 |
        |    ....                                                          =
 |
  16000 ++       ...                                                       =
 |
  14000 ++          ...                                                    =
 |
        |              ....                                                =
 |
  12000 ++                 ...                                             =
 |
  10000 ++                    .                                            =
 |
   8000 ++                     *.....                                      =
.*
        |                            ....                              ....=
 |
   6000 ++                               ...                       ....    =
 |
   4000 ++                                  ....               ....        =
 |
        |                                       ....       ....            =
 |
   2000 ++                                          .  ....                =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[61]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[62]:/.tg_runnable_contrib

  350 *+-------------------------------------------------------------------=
-+
      |    ....                                                            =
 |
  300 ++       ...                                                         =
 |
      |           ...                                                      =
 |
  250 ++             ....                                                  =
 |
      |                  ...                                               =
 |
  200 ++                    .                                              =
 |
      |                      *.....                                        =
.*
  150 ++                           ...                                  ...=
 |
      |                               ...                           ....   =
 |
  100 ++                                 ....                    ...       =
 |
      |                                      ...              ...          =
 |
   50 ++                                        ....      ....             =
 |
      |                                             .  ...                 =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[62]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[62]:/.avg->runnable_avg_sum

  16000 *+-----------------------------------------------------------------=
-+
        |    ....                                                          =
 |
  14000 ++       ...                                                       =
 |
  12000 ++          ...                                                    =
 |
        |              ....                                                =
 |
  10000 ++                 ...                                             =
 |
        |                     .                                            =
 |
   8000 ++                     *....                                       =
.*
        |                           ...                                 ...=
 |
   6000 ++                             ...                          ....   =
 |
   4000 ++                                ....                   ...       =
 |
        |                                     ...             ...          =
 |
   2000 ++                                       ...      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[62]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[63]:/.tg_runnable_contrib

  350 *+-------------------------------------------------------------------=
-+
      |    ....                                                            =
 |
  300 ++       ...                                                         =
 |
      |           ...                                                      =
 |
  250 ++             ....                                                  =
 |
      |                  ...                                               =
 |
  200 ++                    .                                              =
 |
      |                      *.....                                        =
.*
  150 ++                           ...                                  ...=
 |
      |                               ...                           ....   =
 |
  100 ++                                 ....                    ...       =
 |
      |                                      ...              ...          =
 |
   50 ++                                        ....      ....             =
 |
      |                                             .  ...                 =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[63]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[63]:/.avg->runnable_avg_sum

  16000 *+-----------------------------------------------------------------=
-+
        |    ....                                                          =
 |
  14000 ++       ...                                                       =
 |
  12000 ++          ...                                                    =
 |
        |              ....                                                =
 |
  10000 ++                 ...                                             =
 |
        |                     .                                            =
 |
   8000 ++                     *....                                       =
.*
        |                           ...                                 ...=
 |
   6000 ++                             ...                          ....   =
 |
   4000 ++                                ....                   ...       =
 |
        |                                     ...             ...          =
 |
   2000 ++                                       ...      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[63]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[64]:/.tg_runnable_contrib

  500 ++-------------------------------------------------------------------=
-+
  450 *+...                                                                =
 |
      |    ....                                                            =
 |
  400 ++       ...                                                         =
 |
  350 ++          ...                                                      =
 |
      |              ....                                                  =
 |
  300 ++                 ...                                               =
 |
  250 ++                    .                                              =
 |
  200 ++                     *.....                                        =
.*
      |                            ....                                ....=
 |
  150 ++                               ....                        ....    =
 |
  100 ++                                   ....                ....        =
 |
      |                                        ....        ....            =
 |
   50 ++                                           ..  ....                =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[64]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[64]:/.avg->runnable_avg_sum

  25000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
        *....                                                              =
 |
  20000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  15000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  10000 ++                    .                                            =
.*
        |                      *......                                 ....=
 |
        |                             ....                         ....    =
 |
   5000 ++                                .....                ....        =
 |
        |                                      ....        ....            =
 |
        |                                          ..  ....                =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[64]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[65]:/.tg_runnable_contrib

  400 ++-------------------------------------------------------------------=
-+
      *.....                                                               =
 |
  350 ++    ....                                                           =
 |
  300 ++        ....                                                       =
 |
      |             ....                                                   =
 |
  250 ++                ....                                               =
 |
      |                     .                                              =
.*
  200 ++                     *.....                                     ...=
 |
      |                            ...                               ...   =
 |
  150 ++                              ...                         ...      =
 |
  100 ++                                 ....                   ..         =
 |
      |                                      ...             ...           =
 |
   50 ++                                        ....      ...              =
 |
      |                                             .  ...                 =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[65]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[65]:/.avg->runnable_avg_sum

  18000 ++-----------------------------------------------------------------=
-+
        *.....                                                             =
 |
  16000 ++    ....                                                         =
 |
  14000 ++        ....                                                     =
 |
        |             ....                                                 =
 |
  12000 ++                ....                                             =
.*
  10000 ++                    .                                          ..=
 |
        |                      *....                                  ...  =
 |
   8000 ++                          ...                             ..     =
 |
   6000 ++                             ...                       ...       =
 |
        |                                 ....                ...          =
 |
   4000 ++                                    ...           ..             =
 |
   2000 ++                                       ...     ...               =
 |
        |                                           .  ..                  =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[65]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[66]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[66]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[67]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[67]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[68]:/.tg_runnable_contrib

  350 *+-------------------------------------------------------------------=
-+
      |     ....                                                           =
 |
  300 ++        ....                                                       =
 |
      |             ....                                                   =
 |
  250 ++                ....                                               =
 |
      |                     .                                              =
 |
  200 ++                     *....                                         =
.*
      |                           ...                                   ...=
 |
  150 ++                             ...                             ...   =
 |
      |                                 ...                       ...      =
 |
  100 ++                                   ...                  ..         =
 |
      |                                       ...            ...           =
 |
   50 ++                                         ...      ...              =
 |
      |                                             .  ...                 =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[68]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[68]:/.avg->runnable_avg_sum

  16000 *+-----------------------------------------------------------------=
-+
        |     ....                                                         =
 |
  14000 ++        ....                                                     =
 |
  12000 ++            ....                                                 =
 |
        |                 ....                                             =
 |
  10000 ++                    .                                            =
 |
        |                      *....                                       =
.*
   8000 ++                          ..                                  ...=
 |
        |                             ...                            ...   =
 |
   6000 ++                               ...                      ...      =
 |
   4000 ++                                  ...                 ..         =
 |
        |                                      ..            ...           =
 |
   2000 ++                                       ...      ...              =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[68]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[69]:/.tg_runnable_contrib

  400 ++-------------------------------------------------------------------=
-+
      *.....                                                               =
 |
  350 ++    ....                                                           =
 |
  300 ++        ....                                                       =
 |
      |             ....                                                   =
 |
  250 ++                ....                                               =
 |
      |                     .                                              =
 |
  200 ++                     *.....                                        =
.*
      |                            ...                                  ...=
 |
  150 ++                              ...                           ....   =
 |
  100 ++                                 ....                    ...       =
 |
      |                                      ...              ...          =
 |
   50 ++                                        ....      ....             =
 |
      |                                             .  ...                 =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[69]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[69]:/.avg->runnable_avg_sum

  18000 ++-----------------------------------------------------------------=
-+
        *.....                                                             =
 |
  16000 ++    ....                                                         =
 |
  14000 ++        ....                                                     =
 |
        |             ....                                                 =
 |
  12000 ++                ....                                             =
 |
  10000 ++                    .                                            =
 |
        |                      *....                                       =
.*
   8000 ++                          ...                                 ...=
 |
   6000 ++                             ...                          ....   =
 |
        |                                 ....                   ...       =
 |
   4000 ++                                    ...             ...          =
 |
   2000 ++                                       ...      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[69]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[70]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[70]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[71]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[71]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[72]:/.tg_runnable_contrib

  600 ++-------------------------------------------------------------------=
-+
      |                                                                    =
 |
  500 *+.......                                                            =
 |
      |        ......                                                      =
 |
      |              ......                                                =
 |
  400 ++                   ..                                              =
 |
      |                      *....                                         =
.*
  300 ++                          ...                                   ...=
 |
      |                              ...                             ...   =
 |
  200 ++                                ...                       ...      =
 |
      |                                    ...                  ..         =
 |
      |                                       ...            ...           =
 |
  100 ++                                         ...      ...              =
 |
      |                                             .  ...                 =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[72]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[72]:/.avg->runnable_avg_sum

  25000 *+-----------------------------------------------------------------=
-+
        |      .....                                                       =
 |
        |           .....                                                  =
 |
  20000 ++               ....                                              =
 |
        |                    ..                                            =
 |
        |                      *...                                        =
.*
  15000 ++                         ...                                   ..=
 |
        |                             ..                              ...  =
 |
  10000 ++                              ..                          ..     =
 |
        |                                 ...                    ...       =
 |
        |                                    ..               ...          =
 |
   5000 ++                                     ...          ..             =
 |
        |                                         ..     ...               =
 |
        |                                           .  ..                  =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[72]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[73]:/.tg_runnable_contrib

  400 ++-------------------------------------------------------------------=
-+
      *.....                                                               =
 |
  350 ++    ....                                                           =
 |
  300 ++        ....                                                       =
 |
      |             ....                                                   =
 |
  250 ++                ....                                               =
 |
      |                     .                                              =
 |
  200 ++                     *.....                                        =
 |
      |                            ...                                     =
.*
  150 ++                              ...                              ....=
 |
  100 ++                                 ....                      ....    =
 |
      |                                      ...               ....        =
 |
   50 ++                                        ....       ....            =
 |
      |                                             .  ....                =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[73]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[73]:/.avg->runnable_avg_sum

  18000 *+-----------------------------------------------------------------=
-+
        |    ....                                                          =
 |
  16000 ++       ...                                                       =
 |
  14000 ++          ...                                                    =
 |
        |              ....                                                =
 |
  12000 ++                 ...                                             =
 |
  10000 ++                    .                                            =
 |
        |                      *....                                       =
 |
   8000 ++                          ...                                    =
.*
   6000 ++                             ...                             ....=
 |
        |                                 ....                     ....    =
 |
   4000 ++                                    ...              ....        =
 |
   2000 ++                                       ...       ....            =
 |
        |                                           .  ....                =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[73]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[74]:/.tg_runnable_contrib

  350 *+-------------------------------------------------------------------=
-+
      |    ....                                                            =
 |
  300 ++       ...                                                         =
 |
      |           ...                                                      =
 |
  250 ++             ....                                                  =
 |
      |                  ...                                               =
 |
  200 ++                    .                                              =
 |
      |                      *.....                                        =
.*
  150 ++                           ...                                  ...=
 |
      |                               ...                           ....   =
 |
  100 ++                                 ....                    ...       =
 |
      |                                      ...              ...          =
 |
   50 ++                                        ....      ....             =
 |
      |                                             .  ...                 =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[74]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[74]:/.avg->runnable_avg_sum

  18000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  16000 ++   ....                                                          =
 |
  14000 ++       ...                                                       =
 |
        |           ...                                                    =
 |
  12000 ++             ....                                                =
 |
  10000 ++                 ...                                             =
 |
        |                     .                                            =
.*
   8000 ++                     *.....                                   ...=
 |
   6000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
   4000 ++                                  ....              ...          =
 |
   2000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[74]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[75]:/.tg_runnable_contrib

  350 *+-------------------------------------------------------------------=
-+
      |    ....                                                            =
 |
  300 ++       ...                                                         =
 |
      |           ...                                                      =
 |
  250 ++             ....                                                  =
 |
      |                  ...                                               =
 |
  200 ++                    .                                              =
 |
      |                      *.....                                        =
.*
  150 ++                           ...                                  ...=
 |
      |                               ...                           ....   =
 |
  100 ++                                 ....                    ...       =
 |
      |                                      ...              ...          =
 |
   50 ++                                        ....      ....             =
 |
      |                                             .  ...                 =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[75]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[75]:/.avg->runnable_avg_sum

  16000 *+-----------------------------------------------------------------=
-+
        |    ....                                                          =
 |
  14000 ++       ...                                                       =
 |
  12000 ++          ...                                                    =
 |
        |              ....                                                =
 |
  10000 ++                 ...                                             =
 |
        |                     .                                            =
 |
   8000 ++                     *....                                       =
.*
        |                           ...                                 ...=
 |
   6000 ++                             ...                          ....   =
 |
   4000 ++                                ....                   ...       =
 |
        |                                     ...             ...          =
 |
   2000 ++                                       ...      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[75]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[76]:/.tg_runnable_contrib

  600 ++-------------------------------------------------------------------=
-+
      |                                                                    =
 |
  500 *+..........                                                         =
 |
      |           ........                                                 =
 |
      |                   ...                                              =
 |
  400 ++                     *...                                          =
 |
      |                          ...                                       =
.*
  300 ++                            ...                                 ...=
 |
      |                                ..                            ...   =
 |
  200 ++                                 ...                      ...      =
 |
      |                                     ...                 ..         =
 |
      |                                        ..            ...           =
 |
  100 ++                                         ...      ...              =
 |
      |                                             .  ...                 =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[76]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[76]:/.avg->runnable_avg_sum

  25000 *+-----------------------------------------------------------------=
-+
        |        ......                                                    =
 |
        |              ......                                              =
 |
  20000 ++                   ..                                            =
 |
        |                      *...                                        =
 |
        |                          ..                                      =
.*
  15000 ++                           ..                                  ..=
 |
        |                              ..                             ...  =
 |
  10000 ++                               ...                        ..     =
 |
        |                                   ..                   ...       =
 |
        |                                     ..              ...          =
 |
   5000 ++                                      ..          ..             =
 |
        |                                         ..     ...               =
 |
        |                                           .  ..                  =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[76]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[77]:/.tg_runnable_contrib

  400 ++-------------------------------------------------------------------=
-+
      *....                                                                =
 |
  350 ++   ....                                                            =
 |
  300 ++       ...                                                         =
 |
      |           ...                                                      =
 |
  250 ++             ....                                                  =
.*
      |                  ...                                             ..=
 |
  200 ++                    .                                         ...  =
 |
      |                      *.....                                 ..     =
 |
  150 ++                           ....                          ...       =
 |
  100 ++                               ....                   ...          =
 |
      |                                    ....             ..             =
 |
   50 ++                                       ....      ...               =
 |
      |                                            ..  ..                  =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[77]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[77]:/.avg->runnable_avg_sum

  18000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  16000 ++   ....                                                          =
 |
  14000 ++       ...                                                       =
 |
        |           ...                                                    =
 |
  12000 ++             ....                                                =
.*
  10000 ++                 ...                                           ..=
 |
        |                     .                                       ...  =
 |
   8000 ++                     *.....                               ..     =
 |
   6000 ++                           ....                        ...       =
 |
        |                                ...                  ...          =
 |
   4000 ++                                  ....            ..             =
 |
   2000 ++                                      ....     ...               =
 |
        |                                           .  ..                  =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[77]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[78]:/.tg_runnable_contrib

  400 ++-------------------------------------------------------------------=
-+
      |                                                                    =
 |
  350 *+....                                                               =
 |
  300 ++    ....                                                           =
 |
      |         ....                                                       =
 |
  250 ++            ....                                                   =
 |
      |                 ....                                               =
 |
  200 ++                    .                                              =
 |
      |                      *.....                                        =
.*
  150 ++                           ....                                ....=
 |
  100 ++                               ....                        ....    =
 |
      |                                    ....                ....        =
 |
   50 ++                                       ....        ....            =
 |
      |                                            ..  ....                =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[78]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[78]:/.avg->runnable_avg_sum

  18000 ++-----------------------------------------------------------------=
-+
        *.....                                                             =
 |
  16000 ++    ....                                                         =
 |
  14000 ++        ....                                                     =
 |
        |             ....                                                 =
 |
  12000 ++                ....                                             =
 |
  10000 ++                    .                                            =
 |
        |                      *....                                       =
 |
   8000 ++                          ...                                    =
.*
   6000 ++                             ...                             ....=
 |
        |                                 ....                     ....    =
 |
   4000 ++                                    ...              ....        =
 |
   2000 ++                                       ...       ....            =
 |
        |                                           .  ....                =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[78]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[79]:/.tg_runnable_contrib

  350 *+-------------------------------------------------------------------=
-+
      |    ....                                                            =
 |
  300 ++       ...                                                         =
 |
      |           ...                                                      =
 |
  250 ++             ....                                                  =
 |
      |                  ...                                               =
 |
  200 ++                    .                                              =
 |
      |                      *.....                                        =
.*
  150 ++                           ...                                  ...=
 |
      |                               ...                           ....   =
 |
  100 ++                                 ....                    ...       =
 |
      |                                      ...              ...          =
 |
   50 ++                                        ....      ....             =
 |
      |                                             .  ...                 =
 |
    0 ++---------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[79]:/.tg->runnable_avg

  30000 ++-----------------------------------------------------------------=
-+
        *....                                                              =
 |
  25000 ++   ....                                                          =
 |
        |        ...                                                       =
 |
        |           ...                                                    =
 |
  20000 ++             ....                                                =
 |
        |                  ...                                             =
 |
  15000 ++                    .                                            =
.*
        |                      *.....                                   ...=
 |
  10000 ++                           ....                           ....   =
 |
        |                                ...                     ...       =
 |
        |                                   ....              ...          =
 |
   5000 ++                                      ....      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                   sched_debug.cfs_rq[79]:/.avg->runnable_avg_sum

  16000 *+-----------------------------------------------------------------=
-+
        |    ....                                                          =
 |
  14000 ++       ...                                                       =
 |
  12000 ++          ...                                                    =
 |
        |              ....                                                =
 |
  10000 ++                 ...                                             =
 |
        |                     .                                            =
 |
   8000 ++                     *....                                       =
.*
        |                           ...                                 ...=
 |
   6000 ++                             ...                          ....   =
 |
   4000 ++                                ....                   ...       =
 |
        |                                     ...             ...          =
 |
   2000 ++                                       ...      ....             =
 |
        |                                           .  ...                 =
 |
      0 ++-------------------------------------------*---------------------=
-+


                      sched_debug.cfs_rq[79]:/.avg->avg_period

  50000 ++-----------------------------------------------------------------=
-+
  45000 *+.....................*..                                         =
 *
        |                         ..                                      .=
.|
  40000 ++                          .                                   .. =
 |
  35000 ++                           ..                               ..   =
 |
        |                              ..                            .     =
 |
  30000 ++                               .                         ..      =
 |
  25000 ++                                ..                     ..        =
 |
  20000 ++                                  ..                 ..          =
 |
        |                                     ..             ..            =
 |
  15000 ++                                      .           .              =
 |
  10000 ++                                       ..       ..               =
 |
        |                                          ..   ..                 =
 |
   5000 ++                                            ..                   =
 |
      0 ++-------------------------------------------*---------------------=
-+

	[*] bisect-good sample
	[O] bisect-bad  sample

To reproduce:

	apt-get install ruby
	git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tests.git
	cd lkp-tests
	bin/setup-local job.yaml # the job file attached in this email
	bin/run-local   job.yaml


Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.


Thanks,
Ying Huang


_______________________________________________
LKP mailing list
LKP(a)linux.intel.com

--===============6055763271199425168==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiB3aWxsLWl0LXNjYWxlCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogcHJl
LXRlc3QKICB1cHRpbWU6IAogIGlvc3RhdDogCiAgdm1zdGF0OiAKICBudW1hLW51bWFzdGF0OiAK
ICBudW1hLXZtc3RhdDogCiAgbnVtYS1tZW1pbmZvOiAKICBwcm9jLXZtc3RhdDogCiAgcHJvYy1z
dGF0OgogICAgaW50ZXJ2YWw6IDEwCiAgbWVtaW5mbzogCiAgc2xhYmluZm86IAogIGludGVycnVw
dHM6IAogIGxvY2tfc3RhdDogCiAgbGF0ZW5jeV9zdGF0czogCiAgc29mdGlycXM6IAogIGJkaV9k
ZXZfbWFwcGluZzogCiAgZGlza3N0YXRzOiAKICBuZnNzdGF0OiAKICBjcHVpZGxlOiAKICBjcHVm
cmVxLXN0YXRzOiAKICB0dXJib3N0YXQ6IAogIHBtZXRlcjogCiAgc2NoZWRfZGVidWc6CiAgICBp
bnRlcnZhbDogNjAKZGVmYXVsdC13YXRjaGRvZ3M6CiAgd2F0Y2gtb29tOiAKICB3YXRjaGRvZzog
CmNwdWZyZXFfZ292ZXJub3I6IHBlcmZvcm1hbmNlCm1vZGVsOiBXZXN0bWVyZS1FWAptZW1vcnk6
IDEyOEcKbnJfY3B1OiA4MApucl9oZGRfcGFydGl0aW9uczogMApoZGRfcGFydGl0aW9uczogCnN3
YXBfcGFydGl0aW9uczogCnJvb3Rmc19wYXJ0aXRpb246IApwZXJmLXByb2ZpbGU6CiAgZnJlcTog
ODAwCndpbGwtaXQtc2NhbGU6CiAgdGVzdDogbW1hcDIKYnJhbmNoOiB5dXlhbmcvZm9yLWxrcApj
b21taXQ6IDBlNGQ4YzMzMTM2Y2EyMzUxYzRkYWVmNDM5YzE5YTI2YjQzZjcyYzYKcmVwZWF0X3Rv
OiA1CnRlc3Rib3g6IGxrcC13c3gwMgp0Ym94X2dyb3VwOiBsa3Atd3N4MDIKa2NvbmZpZzogeDg2
XzY0LXJoZWwKZW5xdWV1ZV90aW1lOiAyMDE1LTA1LTE1IDE0OjM0OjAzLjgyNDM5NjE0MCArMDg6
MDAKdXNlcjogbGtwCnF1ZXVlOiB5ZHUxOQpjb21waWxlcjogZ2NjLTQuOQpoZWFkX2NvbW1pdDog
MGU0ZDhjMzMxMzZjYTIzNTFjNGRhZWY0MzljMTlhMjZiNDNmNzJjNgpiYXNlX2NvbW1pdDogYjc4
N2Y2OGMzNmQ0OWJiMWQ5MjM2ZjQwMzgxMzY0MWVmYTc0YTAzMQprZXJuZWw6ICIvcGtnL2xpbnV4
L3g4Nl82NC1yaGVsL2djYy00LjkvMGU0ZDhjMzMxMzZjYTIzNTFjNGRhZWY0MzljMTlhMjZiNDNm
NzJjNi92bWxpbnV6LTQuMS4wLXJjMS0wMDAwNC1nMGU0ZDhjMyIKcm9vdGZzOiBkZWJpYW4teDg2
XzY0LTIwMTUtMDItMDcuY2d6CnJlc3VsdF9yb290OiAiL3Jlc3VsdC93aWxsLWl0LXNjYWxlL3Bl
cmZvcm1hbmNlLW1tYXAyL2xrcC13c3gwMi9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4
Nl82NC1yaGVsL2djYy00LjkvMGU0ZDhjMzMxMzZjYTIzNTFjNGRhZWY0MzljMTlhMjZiNDNmNzJj
Ni8wIgpMS1BfU0VSVkVSOiBpbm4Kam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxlZC9sa3Atd3N4MDIv
eWR1MTlfd2lsbC1pdC1zY2FsZS1wZXJmb3JtYW5jZS1tbWFwMi14ODZfNjQtcmhlbC1IRUFELTBl
NGQ4YzMzMTM2Y2EyMzUxYzRkYWVmNDM5YzE5YTI2YjQzZjcyYzYtNC0yMDE1MDUxNS0yODQ1LTE0
MGlzZmgueWFtbCIKZGVxdWV1ZV90aW1lOiAyMDE1LTA1LTE5IDA5OjEyOjU4Ljc3MTY5MDgyNCAr
MDg6MDAKbWF4X3VwdGltZTogMTUwMAppbml0cmQ6ICIvb3NpbWFnZS9kZWJpYW4vZGViaWFuLXg4
Nl82NC0yMDE1LTAyLTA3LmNneiIKYm9vdGxvYWRlcl9hcHBlbmQ6Ci0gcm9vdD0vZGV2L3JhbTAK
LSB1c2VyPWxrcAotIGpvYj0vbGtwL3NjaGVkdWxlZC9sa3Atd3N4MDIveWR1MTlfd2lsbC1pdC1z
Y2FsZS1wZXJmb3JtYW5jZS1tbWFwMi14ODZfNjQtcmhlbC1IRUFELTBlNGQ4YzMzMTM2Y2EyMzUx
YzRkYWVmNDM5YzE5YTI2YjQzZjcyYzYtNC0yMDE1MDUxNS0yODQ1LTE0MGlzZmgueWFtbAotIEFS
Q0g9eDg2XzY0Ci0ga2NvbmZpZz14ODZfNjQtcmhlbAotIGJyYW5jaD15dXlhbmcvZm9yLWxrcAot
IGNvbW1pdD0wZTRkOGMzMzEzNmNhMjM1MWM0ZGFlZjQzOWMxOWEyNmI0M2Y3MmM2Ci0gQk9PVF9J
TUFHRT0vcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvMGU0ZDhjMzMxMzZjYTIzNTFjNGRh
ZWY0MzljMTlhMjZiNDNmNzJjNi92bWxpbnV6LTQuMS4wLXJjMS0wMDAwNC1nMGU0ZDhjMwotIG1h
eF91cHRpbWU9MTUwMAotIFJFU1VMVF9ST09UPS9yZXN1bHQvd2lsbC1pdC1zY2FsZS9wZXJmb3Jt
YW5jZS1tbWFwMi9sa3Atd3N4MDIvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQt
cmhlbC9nY2MtNC45LzBlNGQ4YzMzMTM2Y2EyMzUxYzRkYWVmNDM5YzE5YTI2YjQzZjcyYzYvMAot
IExLUF9TRVJWRVI9aW5uCi0gfDItCgoKICBlYXJseXByaW50az10dHlTMCwxMTUyMDAgc3lzdGVt
ZC5sb2dfbGV2ZWw9ZXJyCiAgZGVidWcgYXBpYz1kZWJ1ZyBzeXNycV9hbHdheXNfZW5hYmxlZCBy
Y3VwZGF0ZS5yY3VfY3B1X3N0YWxsX3RpbWVvdXQ9MTAwCiAgcGFuaWM9LTEgc29mdGxvY2t1cF9w
YW5pYz0xIG5taV93YXRjaGRvZz1wYW5pYyBvb3BzPXBhbmljIGxvYWRfcmFtZGlzaz0yIHByb21w
dF9yYW1kaXNrPTAKICBjb25zb2xlPXR0eVMwLDExNTIwMCBjb25zb2xlPXR0eTAgdmdhPW5vcm1h
bAoKICBydwpsa3BfaW5pdHJkOiAiL2xrcC9sa3AvbGtwLXg4Nl82NC5jZ3oiCm1vZHVsZXNfaW5p
dHJkOiAiL3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45LzBlNGQ4YzMzMTM2Y2EyMzUxYzRk
YWVmNDM5YzE5YTI2YjQzZjcyYzYvbW9kdWxlcy5jZ3oiCmJtX2luaXRyZDogIi9vc2ltYWdlL2Rl
cHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9sa3AuY2d6LC9vc2ltYWdlL2RlcHMvZGVi
aWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9ydW4taXBjb25maWcuY2d6LC9vc2ltYWdlL2RlcHMv
ZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei90dXJib3N0YXQuY2d6LC9sa3AvYmVuY2htYXJr
cy90dXJib3N0YXQuY2d6LC9sa3AvYmVuY2htYXJrcy93aWxsLWl0LXNjYWxlLmNneiIKam9iX3N0
YXRlOiBmaW5pc2hlZApsb2FkYXZnOiAzOS40MSAyNS44NiAxMC44NCAxLzc3NyAxMjI4NQpzdGFy
dF90aW1lOiAnMTQzMTk5ODA4OCcKZW5kX3RpbWU6ICcxNDMxOTk4NDE3Jwp2ZXJzaW9uOiAiL2xr
cC9sa3AvLnNyYy0yMDE1MDUxOC0xNDE0NDAiCg==

--===============6055763271199425168==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMS9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTEy
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE1L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE4L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1MTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHUyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjAvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyMS9j
cHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9z
eXN0ZW0vY3B1L2NwdTIyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyNC9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTI1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyNy9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTI4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MjkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzL2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzAvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHUzMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgpl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzMvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUzNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzYvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUz
Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTM4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NDAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQyL2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1NDMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHU0NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ1L2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDYv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHU0Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDkvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHU1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1MS9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTUyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1NTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1NC9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU1L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1NTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU4L2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1NTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHU2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjAvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2
MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTYyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2NC9jcHVm
cmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0
ZW0vY3B1L2NwdTY1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4g
L3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVj
aG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2Ny9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTY4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3L2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NzAv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHU3MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTcyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NzMvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHU3NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTc1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NzYvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU3Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTc4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NzkvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1OS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKLi9ydW50ZXN0LnB5IG1tYXAy
IDE2IGJvdGggMSAxMCAyMCAzMCA0MCA2MCA4MAo=

--===============6055763271199425168==--

