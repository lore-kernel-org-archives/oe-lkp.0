Content-Type: multipart/mixed; boundary="===============2257476692772029029=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [intel_pstate] adacdf3f2b8: +119.9% aim9.shell_rtns_3.ops_per_sec, +51.6% turbostat.Pkg_W
Date: Wed, 01 Oct 2014 15:50:20 +0800
Message-ID: <20141001075020.GB21294@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2257476692772029029==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Dirk,

FYI, we noticed the below changes on commit
adacdf3f2b8e65aa441613cf61c4f598e9042690 ("intel_pstate: Remove C0 tracking=
")

test case: brickland3/aim9/300s-shell_rtns_3

      v3.15-rc8  adacdf3f2b8e65aa441613cf6 =

---------------  ------------------------- =

       125 =C2=B1 5%    +119.9%        275 =C2=B1 1%  TOTAL aim9.shell_rtns=
_3.ops_per_sec
     96.81 =C2=B1 3%     +51.6%     146.77 =C2=B1 5%  TOTAL turbostat.Pkg_W
     36.74 =C2=B1 9%    +121.4%      81.34 =C2=B110%  TOTAL turbostat.Cor_W
     38.36 =C2=B1 1%     +63.6%      62.76 =C2=B1 0%  TOTAL turbostat.RAM_W
    -13794 =C2=B1-5%     -13.4%     -11946 =C2=B1-6%  TOTAL sched_debug.cfs=
_rq[1]:/.spread0
    -10828 =C2=B1-8%     -34.7%      -7069 =C2=B1-20%  TOTAL sched_debug.cf=
s_rq[34]:/.spread0
    -14141 =C2=B1-8%     -19.1%     -11441 =C2=B1-19%  TOTAL sched_debug.cf=
s_rq[24]:/.spread0
    -13819 =C2=B1-7%     -13.6%     -11944 =C2=B1-6%  TOTAL sched_debug.cfs=
_rq[7]:/.spread0
      6006 =C2=B1 8%     -71.6%       1703 =C2=B121%  TOTAL sched_debug.cpu=
#33.ttwu_local
      6281 =C2=B136%     -68.3%       1988 =C2=B149%  TOTAL sched_debug.cpu=
#7.ttwu_count
      3177 =C2=B147%    +235.5%      10660 =C2=B1 6%  TOTAL cpuidle.C1-IVT-=
4S.usage
       268 =C2=B145%     -68.5%         84 =C2=B131%  TOTAL sched_debug.cpu=
#45.ttwu_local
      6658 =C2=B134%     -66.1%       2260 =C2=B130%  TOTAL sched_debug.cpu=
#21.ttwu_count
       292 =C2=B144%     -71.7%         82 =C2=B111%  TOTAL sched_debug.cpu=
#23.ttwu_local
      5351 =C2=B1 6%     -61.8%       2045 =C2=B129%  TOTAL sched_debug.cpu=
#48.ttwu_local
      2395 =C2=B129%     -62.9%        888 =C2=B114%  TOTAL sched_debug.cpu=
#37.ttwu_count
      2269 =C2=B111%    +144.0%       5537 =C2=B126%  TOTAL sched_debug.cfs=
_rq[91]:/.blocked_load_avg
      2040 =C2=B117%    +154.5%       5192 =C2=B114%  TOTAL sched_debug.cfs=
_rq[106]:/.blocked_load_avg
      1.24 =C2=B1 6%    +154.8%       3.15 =C2=B1 0%  TOTAL turbostat.GHz
      2417 =C2=B110%    +135.2%       5685 =C2=B125%  TOTAL sched_debug.cfs=
_rq[91]:/.tg_load_contrib
        69 =C2=B129%     -52.4%         33 =C2=B136%  TOTAL sched_debug.cfs=
_rq[41]:/.avg->runnable_avg_sum
      4422 =C2=B129%     -57.6%       1875 =C2=B1 9%  TOTAL sched_debug.cpu=
#3.ttwu_local
      2210 =C2=B114%    +140.9%       5324 =C2=B114%  TOTAL sched_debug.cfs=
_rq[106]:/.tg_load_contrib
      1445 =C2=B116%    +126.6%       3276 =C2=B114%  TOTAL sched_debug.cfs=
_rq[3]:/.blocked_load_avg
      1448 =C2=B116%    +127.4%       3293 =C2=B114%  TOTAL sched_debug.cfs=
_rq[3]:/.tg_load_contrib
    561248 =C2=B1 4%    +145.3%    1376953 =C2=B1 0%  TOTAL cpuidle.C6-IVT-=
4S.usage
      4975 =C2=B128%     -63.7%       1805 =C2=B113%  TOTAL sched_debug.cpu=
#4.ttwu_local
      1348 =C2=B119%    +137.8%       3206 =C2=B112%  TOTAL sched_debug.cfs=
_rq[48]:/.blocked_load_avg
      1696 =C2=B113%    +106.7%       3507 =C2=B115%  TOTAL sched_debug.cfs=
_rq[32]:/.tg_load_contrib
      1684 =C2=B113%    +106.6%       3478 =C2=B115%  TOTAL sched_debug.cfs=
_rq[32]:/.blocked_load_avg
      1619 =C2=B122%    +118.1%       3532 =C2=B113%  TOTAL sched_debug.cfs=
_rq[17]:/.blocked_load_avg
      1626 =C2=B122%    +117.4%       3537 =C2=B113%  TOTAL sched_debug.cfs=
_rq[17]:/.tg_load_contrib
      1354 =C2=B119%    +137.0%       3209 =C2=B112%  TOTAL sched_debug.cfs=
_rq[48]:/.tg_load_contrib
     21314 =C2=B1 5%    +125.6%      48083 =C2=B1 2%  TOTAL sched_debug.cfs=
_rq[85]:/.tg_load_avg
     21409 =C2=B1 5%    +125.1%      48199 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[83]:/.tg_load_avg
     21340 =C2=B1 5%    +125.8%      48193 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[84]:/.tg_load_avg
     21291 =C2=B1 5%    +125.7%      48060 =C2=B1 2%  TOTAL sched_debug.cfs=
_rq[86]:/.tg_load_avg
     21191 =C2=B1 6%    +126.2%      47929 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[102]:/.tg_load_avg
     21266 =C2=B1 5%    +126.0%      48058 =C2=B1 2%  TOTAL sched_debug.cfs=
_rq[90]:/.tg_load_avg
     21289 =C2=B1 5%    +125.7%      48054 =C2=B1 2%  TOTAL sched_debug.cfs=
_rq[89]:/.tg_load_avg
     21186 =C2=B1 6%    +126.2%      47929 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[101]:/.tg_load_avg
     21314 =C2=B1 6%    +125.8%      48131 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[113]:/.tg_load_avg
     21266 =C2=B1 5%    +126.1%      48083 =C2=B1 2%  TOTAL sched_debug.cfs=
_rq[91]:/.tg_load_avg
     21298 =C2=B1 6%    +125.3%      47981 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[106]:/.tg_load_avg
     21309 =C2=B1 6%    +125.0%      47953 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[105]:/.tg_load_avg
     21178 =C2=B1 6%    +126.4%      47953 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[100]:/.tg_load_avg
     21236 =C2=B1 6%    +126.5%      48095 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[93]:/.tg_load_avg
     21271 =C2=B1 5%    +126.0%      48077 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[88]:/.tg_load_avg
     21286 =C2=B1 5%    +126.0%      48096 =C2=B1 2%  TOTAL sched_debug.cfs=
_rq[87]:/.tg_load_avg
     21269 =C2=B1 6%    +126.1%      48093 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[92]:/.tg_load_avg
     21291 =C2=B1 6%    +125.2%      47956 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[104]:/.tg_load_avg
     21303 =C2=B1 6%    +125.3%      48005 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[107]:/.tg_load_avg
     21247 =C2=B1 6%    +125.7%      47957 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[94]:/.tg_load_avg
     21350 =C2=B1 6%    +125.7%      48185 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[119]:/.tg_load_avg
     21357 =C2=B1 6%    +125.3%      48108 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[114]:/.tg_load_avg
     21263 =C2=B1 6%    +125.6%      47968 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[103]:/.tg_load_avg
     21362 =C2=B1 6%    +125.4%      48154 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[118]:/.tg_load_avg
     21470 =C2=B1 5%    +124.6%      48223 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[82]:/.tg_load_avg
      1513 =C2=B124%    +122.0%       3358 =C2=B116%  TOTAL sched_debug.cfs=
_rq[47]:/.blocked_load_avg
     21170 =C2=B1 6%    +126.4%      47936 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[98]:/.tg_load_avg
     21216 =C2=B1 6%    +126.0%      47943 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[95]:/.tg_load_avg
     21183 =C2=B1 6%    +126.3%      47936 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[97]:/.tg_load_avg
     21351 =C2=B1 6%    +125.3%      48106 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[115]:/.tg_load_avg
     21194 =C2=B1 6%    +126.2%      47952 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[96]:/.tg_load_avg
     21181 =C2=B1 6%    +126.3%      47929 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[99]:/.tg_load_avg
     21366 =C2=B1 6%    +125.1%      48101 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[116]:/.tg_load_avg
     21352 =C2=B1 6%    +125.5%      48145 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[112]:/.tg_load_avg
     21381 =C2=B1 6%    +125.1%      48131 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[117]:/.tg_load_avg
     21507 =C2=B1 5%    +124.3%      48244 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[81]:/.tg_load_avg
     21346 =C2=B1 6%    +125.5%      48126 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[111]:/.tg_load_avg
     22339 =C2=B1 4%    +124.5%      50156 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[5]:/.tg_load_avg
     21569 =C2=B1 5%    +123.7%      48256 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[80]:/.tg_load_avg
     21343 =C2=B1 6%    +125.0%      48018 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[108]:/.tg_load_avg
      1528 =C2=B123%    +120.8%       3373 =C2=B116%  TOTAL sched_debug.cfs=
_rq[47]:/.tg_load_contrib
     21616 =C2=B1 5%    +123.2%      48245 =C2=B1 2%  TOTAL sched_debug.cfs=
_rq[78]:/.tg_load_avg
     21595 =C2=B1 4%    +124.7%      48525 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[41]:/.tg_load_avg
     21622 =C2=B1 5%    +123.4%      48294 =C2=B1 2%  TOTAL sched_debug.cfs=
_rq[77]:/.tg_load_avg
     21571 =C2=B1 4%    +123.7%      48245 =C2=B1 2%  TOTAL sched_debug.cfs=
_rq[79]:/.tg_load_avg
     22460 =C2=B1 4%    +124.3%      50377 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[4]:/.tg_load_avg
     22257 =C2=B1 5%    +124.2%      49910 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[8]:/.tg_load_avg
     22291 =C2=B1 5%    +124.0%      49922 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[7]:/.tg_load_avg
     22586 =C2=B1 4%    +123.3%      50430 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[3]:/.tg_load_avg
     22236 =C2=B1 5%    +124.1%      49831 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[9]:/.tg_load_avg
     21599 =C2=B1 4%    +124.4%      48473 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[42]:/.tg_load_avg
     22118 =C2=B1 6%    +123.8%      49501 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[12]:/.tg_load_avg
     21591 =C2=B1 4%    +124.8%      48544 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[40]:/.tg_load_avg
     21348 =C2=B1 6%    +125.3%      48090 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[110]:/.tg_load_avg
     21636 =C2=B1 4%    +123.4%      48331 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[43]:/.tg_load_avg
     22170 =C2=B1 5%    +123.5%      49543 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[11]:/.tg_load_avg
     22117 =C2=B1 6%    +123.8%      49505 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[13]:/.tg_load_avg
     21656 =C2=B1 5%    +122.8%      48260 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[44]:/.tg_load_avg
     22206 =C2=B1 5%    +123.4%      49613 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[10]:/.tg_load_avg
     22307 =C2=B1 4%    +124.3%      50042 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[6]:/.tg_load_avg
      1438 =C2=B122%    +123.8%       3218 =C2=B113%  TOTAL sched_debug.cfs=
_rq[18]:/.blocked_load_avg
     21389 =C2=B1 6%    +124.7%      48064 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[109]:/.tg_load_avg
      1438 =C2=B122%    +124.0%       3222 =C2=B113%  TOTAL sched_debug.cfs=
_rq[18]:/.tg_load_contrib
     21612 =C2=B1 4%    +124.6%      48541 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[39]:/.tg_load_avg
       103 =C2=B115%     -56.4%         45 =C2=B132%  TOTAL sched_debug.cfs=
_rq[30]:/.avg->runnable_avg_sum
     22746 =C2=B1 4%    +122.6%      50626 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[2]:/.tg_load_avg
     22689 =C2=B1 4%    +122.6%      50512 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[1]:/.tg_load_avg
      1498 =C2=B112%    +118.2%       3271 =C2=B116%  TOTAL sched_debug.cfs=
_rq[33]:/.tg_load_contrib
     21710 =C2=B1 5%    +122.1%      48223 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[45]:/.tg_load_avg
     21675 =C2=B1 5%    +123.9%      48522 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[68]:/.tg_load_avg
     22702 =C2=B1 4%    +123.0%      50638 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[0]:/.tg_load_avg
     21791 =C2=B1 5%    +120.8%      48114 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[47]:/.tg_load_avg
     21768 =C2=B1 5%    +122.1%      48352 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[57]:/.tg_load_avg
     21611 =C2=B1 4%    +123.9%      48393 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[72]:/.tg_load_avg
     21668 =C2=B1 4%    +124.2%      48578 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[38]:/.tg_load_avg
     21661 =C2=B1 5%    +123.5%      48416 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[71]:/.tg_load_avg
     21653 =C2=B1 5%    +123.0%      48291 =C2=B1 2%  TOTAL sched_debug.cfs=
_rq[76]:/.tg_load_avg
     21748 =C2=B1 5%    +122.7%      48426 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[62]:/.tg_load_avg
     21770 =C2=B1 5%    +121.2%      48162 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[46]:/.tg_load_avg
     21688 =C2=B1 5%    +122.7%      48295 =C2=B1 2%  TOTAL sched_debug.cfs=
_rq[75]:/.tg_load_avg
     21651 =C2=B1 5%    +123.5%      48392 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[74]:/.tg_load_avg
    101524 =C2=B1 6%    +122.3%     225684 =C2=B1 4%  TOTAL proc-vmstat.pga=
lloc_dma32
     21758 =C2=B1 5%    +122.5%      48417 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[63]:/.tg_load_avg
     21721 =C2=B1 5%    +123.2%      48488 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[67]:/.tg_load_avg
      2057 =C2=B110%    +137.4%       4885 =C2=B118%  TOTAL sched_debug.cfs=
_rq[61]:/.blocked_load_avg
     21704 =C2=B1 5%    +123.2%      48439 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[64]:/.tg_load_avg
     21695 =C2=B1 5%    +123.2%      48422 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[70]:/.tg_load_avg
     21706 =C2=B1 5%    +123.1%      48428 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[69]:/.tg_load_avg
     21837 =C2=B1 5%    +121.2%      48294 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[56]:/.tg_load_avg
     21761 =C2=B1 4%    +122.3%      48370 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[61]:/.tg_load_avg
     21769 =C2=B1 4%    +123.2%      48581 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[37]:/.tg_load_avg
     21704 =C2=B1 5%    +123.4%      48479 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[66]:/.tg_load_avg
     21643 =C2=B1 5%    +123.5%      48365 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[73]:/.tg_load_avg
     21693 =C2=B1 5%    +123.5%      48480 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[65]:/.tg_load_avg
      1498 =C2=B112%    +117.5%       3260 =C2=B116%  TOTAL sched_debug.cfs=
_rq[33]:/.blocked_load_avg
     21762 =C2=B1 4%    +122.0%      48313 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[58]:/.tg_load_avg
     21873 =C2=B1 5%    +120.1%      48132 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[48]:/.tg_load_avg
     21778 =C2=B1 4%    +123.3%      48623 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[36]:/.tg_load_avg
     21887 =C2=B1 3%    +122.3%      48647 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[35]:/.tg_load_avg
     22106 =C2=B1 6%    +123.1%      49330 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[14]:/.tg_load_avg
     21743 =C2=B1 5%    +122.5%      48382 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[60]:/.tg_load_avg
     21761 =C2=B1 5%    +122.2%      48362 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[59]:/.tg_load_avg
     21933 =C2=B1 3%    +121.8%      48653 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[34]:/.tg_load_avg
     22003 =C2=B1 3%    +121.9%      48833 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[29]:/.tg_load_avg
     21927 =C2=B1 5%    +119.2%      48069 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[49]:/.tg_load_avg
     21970 =C2=B1 4%    +123.1%      49009 =C2=B1 2%  TOTAL sched_debug.cfs=
_rq[22]:/.tg_load_avg
     21979 =C2=B1 5%    +123.1%      49045 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[21]:/.tg_load_avg
     22033 =C2=B1 5%    +123.1%      49153 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[19]:/.tg_load_avg
     21979 =C2=B1 5%    +118.8%      48084 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[52]:/.tg_load_avg
     22059 =C2=B1 3%    +121.2%      48794 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[28]:/.tg_load_avg
     21984 =C2=B1 4%    +122.9%      48996 =C2=B1 2%  TOTAL sched_debug.cfs=
_rq[23]:/.tg_load_avg
     21965 =C2=B1 4%    +119.1%      48128 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[53]:/.tg_load_avg
     22037 =C2=B1 3%    +121.4%      48784 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[30]:/.tg_load_avg
     22069 =C2=B1 3%    +121.1%      48793 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[31]:/.tg_load_avg
     21957 =C2=B1 4%    +119.6%      48208 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[54]:/.tg_load_avg
     21954 =C2=B1 5%    +118.8%      48030 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[50]:/.tg_load_avg
     22117 =C2=B1 6%    +122.8%      49277 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[15]:/.tg_load_avg
     21978 =C2=B1 5%    +118.6%      48046 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[51]:/.tg_load_avg
     21963 =C2=B1 4%    +119.7%      48246 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[55]:/.tg_load_avg
     22012 =C2=B1 3%    +121.3%      48712 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[32]:/.tg_load_avg
     22037 =C2=B1 3%    +121.6%      48838 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[27]:/.tg_load_avg
     22029 =C2=B1 3%    +122.0%      48908 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[26]:/.tg_load_avg
     21990 =C2=B1 4%    +122.3%      48891 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[25]:/.tg_load_avg
     22010 =C2=B1 4%    +122.2%      48914 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[24]:/.tg_load_avg
     21985 =C2=B1 3%    +121.4%      48671 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[33]:/.tg_load_avg
     22023 =C2=B1 5%    +122.8%      49058 =C2=B1 2%  TOTAL sched_debug.cfs=
_rq[20]:/.tg_load_avg
     22054 =C2=B1 5%    +123.3%      49240 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[17]:/.tg_load_avg
     22112 =C2=B1 6%    +122.7%      49239 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[16]:/.tg_load_avg
     22058 =C2=B1 5%    +122.8%      49137 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[18]:/.tg_load_avg
      2237 =C2=B1 9%    +124.1%       5013 =C2=B118%  TOTAL sched_debug.cfs=
_rq[61]:/.tg_load_contrib
     15018 =C2=B1 5%    +114.2%      32164 =C2=B1 0%  TOTAL sched_debug.cpu=
#61.ttwu_local
     15138 =C2=B1 5%    +113.2%      32273 =C2=B1 1%  TOTAL sched_debug.cpu=
#91.ttwu_local
     15141 =C2=B1 6%    +116.6%      32798 =C2=B1 4%  TOTAL sched_debug.cpu=
#106.ttwu_local
  13386019 =C2=B1 4%    +113.7%   28610387 =C2=B1 2%  TOTAL proc-vmstat.pga=
lloc_normal
  13484197 =C2=B1 4%    +113.8%   28830514 =C2=B1 2%  TOTAL proc-vmstat.pgf=
ree
     76806 =C2=B1 5%    +111.6%     162514 =C2=B1 1%  TOTAL sched_debug.cpu=
#91.nr_switches
     76808 =C2=B1 5%    +111.8%     162667 =C2=B1 1%  TOTAL sched_debug.cpu=
#91.sched_count
  13084681 =C2=B1 4%    +113.2%   27900527 =C2=B1 2%  TOTAL proc-vmstat.num=
a_local
  13084697 =C2=B1 4%    +113.2%   27900563 =C2=B1 2%  TOTAL proc-vmstat.num=
a_hit
     76596 =C2=B1 6%    +112.9%     163099 =C2=B1 2%  TOTAL sched_debug.cpu=
#106.nr_switches
     30771 =C2=B1 6%    +111.9%      65201 =C2=B1 2%  TOTAL sched_debug.cpu=
#106.sched_goidle
     30881 =C2=B1 5%    +110.9%      65122 =C2=B1 2%  TOTAL sched_debug.cpu=
#91.sched_goidle
  18389572 =C2=B1 5%    +111.8%   38945748 =C2=B1 1%  TOTAL proc-vmstat.pgf=
ault
   3250107 =C2=B1 5%    +111.8%    6885051 =C2=B1 1%  TOTAL numa-numastat.n=
ode1.local_node
   3250110 =C2=B1 5%    +111.8%    6885062 =C2=B1 1%  TOTAL numa-numastat.n=
ode1.numa_hit
   3262764 =C2=B1 5%    +115.3%    7024497 =C2=B1 4%  TOTAL numa-numastat.n=
ode2.numa_hit
   3262758 =C2=B1 5%    +115.3%    7024485 =C2=B1 4%  TOTAL numa-numastat.n=
ode2.local_node
   3279215 =C2=B1 4%    +113.9%    7015147 =C2=B1 4%  TOTAL numa-numastat.n=
ode0.numa_hit
   3279211 =C2=B1 4%    +113.9%    7015136 =C2=B1 4%  TOTAL numa-numastat.n=
ode0.local_node
     76121 =C2=B1 4%    +112.9%     162034 =C2=B1 1%  TOTAL sched_debug.cpu=
#61.nr_switches
     77527 =C2=B1 6%    +109.0%     162036 =C2=B1 1%  TOTAL sched_debug.cpu=
#61.sched_count
    243.30 =C2=B133%     -51.6%     117.69 =C2=B129%  TOTAL sched_debug.cfs=
_rq[92]:/.exec_clock
     30594 =C2=B1 4%    +112.1%      64904 =C2=B1 2%  TOTAL sched_debug.cpu=
#61.sched_goidle
   3281833 =C2=B1 4%    +109.8%    6886537 =C2=B1 1%  TOTAL numa-numastat.n=
ode3.local_node
   3281836 =C2=B1 4%    +109.8%    6886541 =C2=B1 1%  TOTAL numa-numastat.n=
ode3.numa_hit
     78218 =C2=B1 6%    +109.1%     163583 =C2=B1 3%  TOTAL sched_debug.cpu=
#106.sched_count
   1727502 =C2=B1 6%    +107.5%    3583823 =C2=B1 4%  TOTAL numa-vmstat.nod=
e2.numa_local
   1742994 =C2=B1 5%    +103.7%    3550217 =C2=B1 1%  TOTAL numa-vmstat.nod=
e3.numa_local
   1794367 =C2=B1 5%    +101.6%    3617858 =C2=B1 1%  TOTAL numa-vmstat.nod=
e1.numa_local
   1810000 =C2=B1 5%    +102.6%    3666376 =C2=B1 3%  TOTAL numa-vmstat.nod=
e2.numa_hit
   1825404 =C2=B1 5%     +99.0%    3632638 =C2=B1 1%  TOTAL numa-vmstat.nod=
e3.numa_hit
   1816414 =C2=B1 5%    +101.8%    3666109 =C2=B1 3%  TOTAL numa-vmstat.nod=
e0.numa_local
   1843627 =C2=B1 6%    +100.6%    3698703 =C2=B1 1%  TOTAL numa-vmstat.nod=
e1.numa_hit
      3135 =C2=B112%     -46.7%       1672 =C2=B115%  TOTAL sched_debug.cpu=
#34.ttwu_local
   1849929 =C2=B1 4%     +98.3%    3668167 =C2=B1 3%  TOTAL numa-vmstat.nod=
e0.numa_hit
      8992 =C2=B113%     -50.9%       4418 =C2=B141%  TOTAL sched_debug.cpu=
#30.sched_count
    241.28 =C2=B124%     -40.6%     143.43 =C2=B125%  TOTAL sched_debug.cfs=
_rq[11]:/.exec_clock
     18020 =C2=B139%     -55.2%       8066 =C2=B116%  TOTAL sched_debug.cpu=
#4.ttwu_count
       319 =C2=B122%     +61.6%        516 =C2=B113%  TOTAL cpuidle.C1E-IVT=
-4S.usage
      4156 =C2=B115%     -47.6%       2176 =C2=B141%  TOTAL sched_debug.cpu=
#30.sched_goidle
      8343 =C2=B115%     -47.6%       4375 =C2=B141%  TOTAL sched_debug.cpu=
#30.nr_switches
     29165 =C2=B1 1%     +76.4%      51461 =C2=B1 3%  TOTAL sched_debug.cpu=
#106.ttwu_count
     28980 =C2=B1 2%     +73.4%      50247 =C2=B1 1%  TOTAL sched_debug.cpu=
#61.ttwu_count
     29138 =C2=B1 1%     +74.5%      50853 =C2=B1 1%  TOTAL sched_debug.cpu=
#91.ttwu_count
     22537 =C2=B1 8%     +70.7%      38465 =C2=B119%  TOTAL sched_debug.cpu=
#47.ttwu_count
      1641 =C2=B1 3%     +67.9%       2757 =C2=B1 1%  TOTAL proc-vmstat.pga=
ctivate
       131 =C2=B119%     -37.4%         82 =C2=B1 5%  TOTAL sched_debug.cpu=
#106.cpu_load[4]
     13130 =C2=B1 2%     +62.4%      21321 =C2=B1 8%  TOTAL sched_debug.cpu=
#47.sched_goidle
      7089 =C2=B113%     +54.9%      10979 =C2=B111%  TOTAL sched_debug.cpu=
#20.sched_goidle
     26562 =C2=B1 2%     +61.5%      42903 =C2=B1 7%  TOTAL sched_debug.cpu=
#47.nr_switches
     14233 =C2=B113%     +54.5%      21991 =C2=B111%  TOTAL sched_debug.cpu=
#20.nr_switches
        88 =C2=B117%     +54.3%        135 =C2=B125%  TOTAL sched_debug.cpu=
#107.ttwu_local
      4777 =C2=B112%     +54.7%       7389 =C2=B114%  TOTAL sched_debug.cfs=
_rq[34]:/.min_vruntime
       119 =C2=B112%     -32.7%         80 =C2=B1 8%  TOTAL sched_debug.cpu=
#61.cpu_load[4]
       149 =C2=B117%     -33.5%         99 =C2=B1 9%  TOTAL sched_debug.cpu=
#106.cpu_load[3]
     11071 =C2=B117%     -26.7%       8120 =C2=B122%  TOTAL sched_debug.cpu=
#34.ttwu_count
      3831 =C2=B1 6%     +42.6%       5463 =C2=B1 7%  TOTAL numa-meminfo.no=
de2.KernelStack
      1712 =C2=B111%     -43.0%        975 =C2=B122%  TOTAL sched_debug.cpu=
#1.ttwu_local
       239 =C2=B1 6%     +41.7%        339 =C2=B1 7%  TOTAL numa-vmstat.nod=
e2.nr_kernel_stack
      3638 =C2=B124%     -32.8%       2443 =C2=B132%  TOTAL sched_debug.cpu=
#1.ttwu_count
       135 =C2=B1 7%     -37.0%         85 =C2=B111%  TOTAL sched_debug.cpu=
#91.cpu_load[4]
      5131 =C2=B118%     -21.3%       4038 =C2=B1 5%  TOTAL meminfo.AnonHug=
ePages
       227 =C2=B112%     -28.6%        162 =C2=B118%  TOTAL sched_debug.cpu=
#91.cpu_load[0]
     66199 =C2=B1 6%     +49.7%      99076 =C2=B1 1%  TOTAL sched_debug.cpu=
#106.nr_load_updates
     31880 =C2=B1 6%     +41.2%      45012 =C2=B110%  TOTAL sched_debug.cpu=
#47.sched_count
     13581 =C2=B1 3%     +47.7%      20066 =C2=B1 5%  TOTAL sched_debug.cpu=
#32.sched_goidle
     29309 =C2=B112%     +41.2%      41372 =C2=B1 9%  TOTAL sched_debug.cpu=
#32.sched_count
     69667 =C2=B1 4%     +42.5%      99307 =C2=B1 1%  TOTAL sched_debug.cpu=
#91.nr_load_updates
       160 =C2=B115%     -26.9%        117 =C2=B118%  TOTAL sched_debug.cfs=
_rq[61]:/.load
     27436 =C2=B1 3%     +47.3%      40401 =C2=B1 5%  TOTAL sched_debug.cpu=
#32.nr_switches
     70549 =C2=B1 4%     +41.8%     100061 =C2=B1 1%  TOTAL sched_debug.cpu=
#61.nr_load_updates
     13693 =C2=B1 5%     +48.4%      20325 =C2=B1 6%  TOTAL sched_debug.cpu=
#17.sched_goidle
      3973 =C2=B1 6%     +41.4%       5619 =C2=B1 6%  TOTAL numa-meminfo.no=
de3.KernelStack
     27719 =C2=B1 5%     +47.9%      40984 =C2=B1 6%  TOTAL sched_debug.cpu=
#17.nr_switches
       248 =C2=B1 6%     +40.7%        349 =C2=B1 6%  TOTAL numa-vmstat.nod=
e3.nr_kernel_stack
      6508 =C2=B1 1%     +49.1%       9705 =C2=B122%  TOTAL sched_debug.cpu=
#35.sched_goidle
       138 =C2=B114%     -27.4%        100 =C2=B110%  TOTAL sched_debug.cpu=
#61.cpu_load[3]
     13073 =C2=B1 2%     +48.7%      19438 =C2=B122%  TOTAL sched_debug.cpu=
#35.nr_switches
       666 =C2=B114%     +50.7%       1004 =C2=B117%  TOTAL cpuidle.C3-IVT-=
4S.usage
        80 =C2=B133%     -45.9%         43 =C2=B134%  TOTAL sched_debug.cfs=
_rq[39]:/.avg->runnable_avg_sum
     19457 =C2=B1 7%     +31.6%      25610 =C2=B1 7%  TOTAL sched_debug.cpu=
#47.nr_load_updates
     21711 =C2=B113%     +45.4%      31570 =C2=B119%  TOTAL sched_debug.cpu=
#17.ttwu_count
     13418 =C2=B1 3%     +45.3%      19492 =C2=B122%  TOTAL sched_debug.cpu=
#35.sched_count
     22622 =C2=B1 5%     +37.5%      31103 =C2=B115%  TOTAL sched_debug.cpu=
#32.ttwu_count
        21 =C2=B1 9%     -19.6%         17 =C2=B112%  TOTAL sched_debug.cpu=
#99.ttwu_local
       191 =C2=B112%     -25.1%        143 =C2=B110%  TOTAL sched_debug.cpu=
#91.cpu_load[1]
       154 =C2=B1 9%     -31.6%        105 =C2=B111%  TOTAL sched_debug.cpu=
#91.cpu_load[3]
       160 =C2=B115%     -27.2%        116 =C2=B114%  TOTAL sched_debug.cpu=
#106.cpu_load[2]
     15464 =C2=B115%     +43.3%      22163 =C2=B111%  TOTAL sched_debug.cpu=
#20.sched_count
       176 =C2=B114%     -24.4%        133 =C2=B123%  TOTAL sched_debug.cpu=
#106.cpu_load[1]
       169 =C2=B110%     -25.2%        126 =C2=B110%  TOTAL sched_debug.cpu=
#91.cpu_load[2]
        20 =C2=B110%     -15.5%         17 =C2=B1 8%  TOTAL sched_debug.cpu=
#74.ttwu_local
     87151 =C2=B117%     +34.6%     117307 =C2=B1 3%  TOTAL sched_debug.cfs=
_rq[106]:/.spread0
     23131 =C2=B1 9%     -20.8%      18314 =C2=B112%  TOTAL sched_debug.cpu=
#33.ttwu_count
      9097 =C2=B111%     -23.5%       6955 =C2=B1 8%  TOTAL sched_debug.cfs=
_rq[0]:/.exec_clock
      1485 =C2=B1 2%     +25.6%       1866 =C2=B1 7%  TOTAL proc-vmstat.nr_=
kernel_stack
      1788 =C2=B1 2%     -20.6%       1419 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[106]:/.tg->runnable_avg
      1810 =C2=B1 2%     -20.6%       1436 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[119]:/.tg->runnable_avg
      1809 =C2=B1 2%     -20.7%       1435 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[118]:/.tg->runnable_avg
      1784 =C2=B1 2%     -20.6%       1417 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[105]:/.tg->runnable_avg
      1798 =C2=B1 2%     -20.7%       1426 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[111]:/.tg->runnable_avg
      1803 =C2=B1 2%     -20.5%       1433 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[115]:/.tg->runnable_avg
      1801 =C2=B1 2%     -20.5%       1431 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[114]:/.tg->runnable_avg
      1790 =C2=B1 2%     -20.6%       1421 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[107]:/.tg->runnable_avg
      1799 =C2=B1 2%     -20.6%       1428 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[112]:/.tg->runnable_avg
      1792 =C2=B1 2%     -20.6%       1423 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[108]:/.tg->runnable_avg
      1782 =C2=B1 2%     -20.5%       1415 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[104]:/.tg->runnable_avg
      1800 =C2=B1 2%     -20.6%       1430 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[113]:/.tg->runnable_avg
      1805 =C2=B1 2%     -20.6%       1434 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[116]:/.tg->runnable_avg
      1806 =C2=B1 2%     -20.6%       1435 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[117]:/.tg->runnable_avg
      1795 =C2=B1 2%     -20.7%       1424 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[109]:/.tg->runnable_avg
     95310 =C2=B1 4%     +23.7%     117875 =C2=B1 2%  TOTAL sched_debug.cfs=
_rq[91]:/.spread0
      1796 =C2=B1 2%     -20.7%       1425 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[110]:/.tg->runnable_avg
      1778 =C2=B1 2%     -20.5%       1414 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[103]:/.tg->runnable_avg
      1771 =C2=B1 2%     -20.3%       1411 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[100]:/.tg->runnable_avg
      1772 =C2=B1 2%     -20.3%       1413 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[101]:/.tg->runnable_avg
      1768 =C2=B1 2%     -20.3%       1410 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[99]:/.tg->runnable_avg
      1774 =C2=B1 2%     -20.3%       1413 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[102]:/.tg->runnable_avg
     97534 =C2=B1 4%     +21.8%     118768 =C2=B1 5%  TOTAL sched_debug.cfs=
_rq[61]:/.spread0
      1766 =C2=B1 2%     -20.2%       1408 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[98]:/.tg->runnable_avg
      1762 =C2=B1 2%     -20.1%       1407 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[97]:/.tg->runnable_avg
      1760 =C2=B1 2%     -20.1%       1405 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[96]:/.tg->runnable_avg
      1756 =C2=B1 2%     -20.0%       1405 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[95]:/.tg->runnable_avg
      1747 =C2=B1 2%     -19.8%       1400 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[92]:/.tg->runnable_avg
      1753 =C2=B1 2%     -19.9%       1404 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[94]:/.tg->runnable_avg
      1751 =C2=B1 2%     -19.9%       1402 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[93]:/.tg->runnable_avg
      1743 =C2=B1 2%     -19.8%       1398 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[91]:/.tg->runnable_avg
     23871 =C2=B1 2%     +24.3%      29667 =C2=B1 8%  TOTAL meminfo.KernelS=
tack
      1739 =C2=B1 2%     -19.7%       1397 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[90]:/.tg->runnable_avg
      1734 =C2=B1 2%     -19.6%       1395 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[89]:/.tg->runnable_avg
      1729 =C2=B1 2%     -19.4%       1394 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[88]:/.tg->runnable_avg
      1725 =C2=B1 2%     -19.3%       1392 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[87]:/.tg->runnable_avg
      1724 =C2=B1 2%     -19.3%       1390 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[86]:/.tg->runnable_avg
      1721 =C2=B1 2%     -19.3%       1389 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[85]:/.tg->runnable_avg
      1718 =C2=B1 2%     -19.2%       1388 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[84]:/.tg->runnable_avg
    102757 =C2=B113%     +28.2%     131768 =C2=B1 3%  TOTAL sched_debug.cfs=
_rq[106]:/.min_vruntime
      1699 =C2=B1 2%     -19.0%       1376 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[77]:/.tg->runnable_avg
      1701 =C2=B1 2%     -19.0%       1378 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[78]:/.tg->runnable_avg
      1692 =C2=B1 2%     -18.9%       1373 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[75]:/.tg->runnable_avg
      1695 =C2=B1 2%     -19.0%       1373 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[76]:/.tg->runnable_avg
      1715 =C2=B1 2%     -19.1%       1387 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[83]:/.tg->runnable_avg
     21038 =C2=B1 5%     +20.1%      25263 =C2=B1 5%  TOTAL sched_debug.cpu=
#17.nr_load_updates
      1683 =C2=B1 2%     -18.8%       1367 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[71]:/.tg->runnable_avg
      1709 =C2=B1 2%     -18.9%       1385 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[82]:/.tg->runnable_avg
      1701 =C2=B1 2%     -18.9%       1379 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[79]:/.tg->runnable_avg
      1686 =C2=B1 2%     -18.8%       1369 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[73]:/.tg->runnable_avg
      1681 =C2=B1 2%     -18.8%       1365 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[70]:/.tg->runnable_avg
      1705 =C2=B1 2%     -18.9%       1382 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[80]:/.tg->runnable_avg
      1683 =C2=B1 2%     -18.7%       1368 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[72]:/.tg->runnable_avg
      1672 =C2=B1 2%     -18.5%       1362 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[67]:/.tg->runnable_avg
      1688 =C2=B1 2%     -18.8%       1371 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[74]:/.tg->runnable_avg
      1663 =C2=B1 2%     -18.5%       1356 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[63]:/.tg->runnable_avg
      1679 =C2=B1 2%     -18.7%       1364 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[69]:/.tg->runnable_avg
      1670 =C2=B1 2%     -18.5%       1362 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[66]:/.tg->runnable_avg
      1675 =C2=B1 2%     -18.6%       1363 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[68]:/.tg->runnable_avg
      1665 =C2=B1 2%     -18.5%       1357 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[64]:/.tg->runnable_avg
      1707 =C2=B1 2%     -18.9%       1384 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[81]:/.tg->runnable_avg
      1667 =C2=B1 2%     -18.5%       1359 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[65]:/.tg->runnable_avg
       152 =C2=B114%     -18.9%        123 =C2=B112%  TOTAL sched_debug.cpu=
#61.cpu_load[2]
      1658 =C2=B1 2%     -18.3%       1355 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[62]:/.tg->runnable_avg
      1652 =C2=B1 2%     -18.1%       1353 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[61]:/.tg->runnable_avg
      1650 =C2=B1 2%     -18.0%       1352 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[60]:/.tg->runnable_avg
      1643 =C2=B1 2%     -17.9%       1348 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[57]:/.tg->runnable_avg
    113140 =C2=B1 4%     +17.8%     133227 =C2=B1 5%  TOTAL sched_debug.cfs=
_rq[61]:/.min_vruntime
      1648 =C2=B1 2%     -18.0%       1351 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[59]:/.tg->runnable_avg
    110916 =C2=B1 4%     +19.3%     132335 =C2=B1 2%  TOTAL sched_debug.cfs=
_rq[91]:/.min_vruntime
      1625 =C2=B1 1%     -17.2%       1346 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[55]:/.tg->runnable_avg
      1638 =C2=B1 2%     -17.8%       1347 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[56]:/.tg->runnable_avg
      1646 =C2=B1 2%     -17.9%       1350 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[58]:/.tg->runnable_avg
      1615 =C2=B1 1%     -17.0%       1340 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[51]:/.tg->runnable_avg
      1616 =C2=B1 1%     -17.0%       1341 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[52]:/.tg->runnable_avg
      1620 =C2=B1 1%     -17.1%       1343 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[53]:/.tg->runnable_avg
      1611 =C2=B1 1%     -17.0%       1337 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[50]:/.tg->runnable_avg
      1622 =C2=B1 1%     -17.1%       1345 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[54]:/.tg->runnable_avg
      1605 =C2=B1 1%     -16.8%       1335 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[49]:/.tg->runnable_avg
      1601 =C2=B1 1%     -16.9%       1331 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[48]:/.tg->runnable_avg
     14782 =C2=B1 5%     -18.7%      12017 =C2=B1 7%  TOTAL sched_debug.cfs=
_rq[91]:/.avg->runnable_avg_sum
      1595 =C2=B1 1%     -16.8%       1327 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[47]:/.tg->runnable_avg
       321 =C2=B1 5%     -18.9%        260 =C2=B1 7%  TOTAL sched_debug.cfs=
_rq[91]:/.tg_runnable_contrib
     17810 =C2=B134%     +39.1%      24766 =C2=B1 4%  TOTAL sched_debug.cpu=
#2.nr_load_updates
      1590 =C2=B1 1%     -16.6%       1326 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[46]:/.tg->runnable_avg
      1587 =C2=B1 1%     -16.5%       1324 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[45]:/.tg->runnable_avg
      1581 =C2=B1 1%     -16.3%       1323 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[44]:/.tg->runnable_avg
     20364 =C2=B1 6%     +21.0%      24646 =C2=B1 5%  TOTAL sched_debug.cpu=
#32.nr_load_updates
     23451 =C2=B111%     +16.0%      27201 =C2=B110%  TOTAL sched_debug.cpu=
#18.nr_load_updates
      1576 =C2=B1 1%     -16.1%       1322 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[43]:/.tg->runnable_avg
      4393 =C2=B1 3%     +17.0%       5138 =C2=B1 2%  TOTAL slabinfo.signal=
_cache.num_objs
      1573 =C2=B1 1%     -16.0%       1321 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[42]:/.tg->runnable_avg
      1568 =C2=B1 1%     -15.9%       1319 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[41]:/.tg->runnable_avg
      1564 =C2=B1 1%     -15.7%       1318 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[40]:/.tg->runnable_avg
       296 =C2=B1 4%     -14.6%        253 =C2=B1 4%  TOTAL sched_debug.cfs=
_rq[61]:/.tg_runnable_contrib
      1560 =C2=B1 1%     -15.5%       1318 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[39]:/.tg->runnable_avg
      1554 =C2=B1 1%     -15.3%       1317 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[38]:/.tg->runnable_avg
     13680 =C2=B1 3%     -14.7%      11667 =C2=B1 4%  TOTAL sched_debug.cfs=
_rq[61]:/.avg->runnable_avg_sum
      1544 =C2=B1 1%     -14.8%       1315 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[37]:/.tg->runnable_avg
      3309 =C2=B1 5%     -17.4%       2734 =C2=B1 2%  TOTAL sched_debug.cfs=
_rq[32]:/.exec_clock
      1534 =C2=B1 1%     -14.6%       1310 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[34]:/.tg->runnable_avg
      1537 =C2=B1 1%     -14.6%       1312 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[35]:/.tg->runnable_avg
      1540 =C2=B1 1%     -14.7%       1314 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[36]:/.tg->runnable_avg
       553 =C2=B143%     +59.0%        879 =C2=B1 3%  TOTAL numa-vmstat.nod=
e0.nr_kernel_stack
      1530 =C2=B1 1%     -14.5%       1308 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[33]:/.tg->runnable_avg
      1523 =C2=B1 1%     -14.3%       1306 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[32]:/.tg->runnable_avg
      8851 =C2=B143%     +59.3%      14097 =C2=B1 3%  TOTAL numa-meminfo.no=
de0.KernelStack
      1519 =C2=B1 1%     -14.1%       1306 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[31]:/.tg->runnable_avg
      1516 =C2=B1 1%     -14.0%       1304 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[30]:/.tg->runnable_avg
      1510 =C2=B1 1%     -14.0%       1300 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[28]:/.tg->runnable_avg
      1513 =C2=B1 1%     -14.0%       1302 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[29]:/.tg->runnable_avg
      1507 =C2=B1 1%     -13.9%       1297 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[27]:/.tg->runnable_avg
      1504 =C2=B1 1%     -13.8%       1296 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[26]:/.tg->runnable_avg
      1496 =C2=B1 1%     -13.6%       1293 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[24]:/.tg->runnable_avg
      1492 =C2=B1 1%     -13.5%       1292 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[23]:/.tg->runnable_avg
      1499 =C2=B1 1%     -13.6%       1295 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[25]:/.tg->runnable_avg
    795010 =C2=B1 3%     -10.6%     710653 =C2=B1 6%  TOTAL sched_debug.cpu=
#32.avg_idle
      1489 =C2=B1 1%     -13.3%       1291 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[22]:/.tg->runnable_avg
      1467 =C2=B1 1%     -12.9%       1278 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[17]:/.tg->runnable_avg
      1485 =C2=B1 1%     -13.2%       1290 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[21]:/.tg->runnable_avg
      1463 =C2=B1 1%     -12.8%       1276 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[16]:/.tg->runnable_avg
      1027 =C2=B1 6%     +16.2%       1194 =C2=B1 4%  TOTAL slabinfo.kmallo=
c-192.active_slabs
      1027 =C2=B1 6%     +16.2%       1194 =C2=B1 4%  TOTAL slabinfo.kmallo=
c-192.num_slabs
     43031 =C2=B1 6%     +16.3%      50041 =C2=B1 4%  TOTAL slabinfo.kmallo=
c-192.active_objs
     43170 =C2=B1 6%     +16.2%      50161 =C2=B1 4%  TOTAL slabinfo.kmallo=
c-192.num_objs
      1472 =C2=B1 1%     -12.9%       1282 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[18]:/.tg->runnable_avg
      1479 =C2=B1 1%     -13.0%       1287 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[20]:/.tg->runnable_avg
      1456 =C2=B1 1%     -12.5%       1273 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[15]:/.tg->runnable_avg
      1452 =C2=B1 1%     -12.3%       1273 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[14]:/.tg->runnable_avg
       862 =C2=B1 8%     -12.9%        750 =C2=B1 5%  TOTAL slabinfo.RAW.nu=
m_objs
       862 =C2=B1 8%     -12.9%        750 =C2=B1 5%  TOTAL slabinfo.RAW.ac=
tive_objs
      1475 =C2=B1 1%     -12.9%       1284 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[19]:/.tg->runnable_avg
      4393 =C2=B1 3%     +14.5%       5028 =C2=B1 2%  TOTAL slabinfo.signal=
_cache.active_objs
      1446 =C2=B1 1%     -12.1%       1272 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[12]:/.tg->runnable_avg
      1448 =C2=B1 1%     -12.1%       1273 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[13]:/.tg->runnable_avg
      1442 =C2=B1 1%     -11.9%       1271 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[11]:/.tg->runnable_avg
      1439 =C2=B1 1%     -11.7%       1271 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[10]:/.tg->runnable_avg
      1437 =C2=B1 1%     -11.5%       1271 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[9]:/.tg->runnable_avg
      1431 =C2=B1 1%     -11.2%       1270 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[8]:/.tg->runnable_avg
      1428 =C2=B1 1%     -11.1%       1269 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[7]:/.tg->runnable_avg
      1423 =C2=B1 1%     -10.8%       1270 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[6]:/.tg->runnable_avg
      1421 =C2=B1 1%     -10.6%       1270 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[5]:/.tg->runnable_avg
      1418 =C2=B1 1%     -10.5%       1269 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[4]:/.tg->runnable_avg
      1417 =C2=B1 1%     -10.5%       1268 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[3]:/.tg->runnable_avg
      5041 =C2=B1 4%     +12.8%       5687 =C2=B1 1%  TOTAL slabinfo.task_x=
state.active_objs
      5041 =C2=B1 4%     +12.8%       5687 =C2=B1 1%  TOTAL slabinfo.task_x=
state.num_objs
        20 =C2=B118%     -18.6%         16 =C2=B1 2%  TOTAL sched_debug.cpu=
#104.ttwu_local
     83828 =C2=B1 1%      +9.4%      91675 =C2=B1 3%  TOTAL slabinfo.kmallo=
c-64.active_objs
      1406 =C2=B1 1%     -10.1%       1264 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[2]:/.tg->runnable_avg
      1404 =C2=B1 1%     -10.1%       1262 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[1]:/.tg->runnable_avg
    109592 =C2=B1 4%      +6.3%     116546 =C2=B1 2%  TOTAL numa-meminfo.no=
de1.FilePages
     27397 =C2=B1 4%      +6.3%      29136 =C2=B1 2%  TOTAL numa-vmstat.nod=
e1.nr_file_pages
        36 =C2=B1 2%      +8.3%         39 =C2=B1 2%  TOTAL turbostat.CTMP
      1382 =C2=B1 1%      -9.2%       1255 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[0]:/.tg->runnable_avg
     52240 =C2=B1 5%      +8.9%      56888 =C2=B1 4%  TOTAL numa-meminfo.no=
de0.Slab
     31564 =C2=B1 7%     +14.9%      36254 =C2=B1 5%  TOTAL numa-meminfo.no=
de1.Active
      1331 =C2=B1 0%      +8.1%       1439 =C2=B1 3%  TOTAL slabinfo.kmallo=
c-64.active_slabs
      1331 =C2=B1 0%      +8.1%       1439 =C2=B1 3%  TOTAL slabinfo.kmallo=
c-64.num_slabs
     85255 =C2=B1 0%      +8.1%      92172 =C2=B1 3%  TOTAL slabinfo.kmallo=
c-64.num_objs
    217201 =C2=B1 5%    +125.5%     489860 =C2=B1 0%  TOTAL time.voluntary_=
context_switches
  17206167 =C2=B1 5%    +118.8%   37639010 =C2=B1 1%  TOTAL time.minor_page=
_faults
    115930 =C2=B1 5%    +116.5%     251005 =C2=B1 1%  TOTAL time.involuntar=
y_context_switches
      0.00 =C2=B1 9%    +121.4%       0.00 =C2=B110%  TOTAL energy.energy-c=
ores
      0.00 =C2=B1 1%     +63.6%       0.00 =C2=B1 0%  TOTAL energy.energy-r=
am
      0.00 =C2=B1 3%     +51.6%       0.00 =C2=B1 5%  TOTAL energy.energy-p=
kg
      7352 =C2=B1 1%     +39.9%      10285 =C2=B1 0%  TOTAL vmstat.system.cs
     89.70 =C2=B1 0%     -14.0%      77.11 =C2=B1 1%  TOTAL time.user_time
      1.06 =C2=B1 0%     -12.9%       0.92 =C2=B1 0%  TOTAL turbostat.%c0
       214 =C2=B1 0%      +5.9%        227 =C2=B1 0%  TOTAL time.system_time


                                 time.user_time

  95 ++--------------------------------------------------------------------=
-+
     |                *..                                                  =
 |
     |               :   *..  .*.                                          =
 |
  90 *+.*..*..*.*..  :      *.   *..*..*..*..*                             =
 |
     |              :                                                      =
 |
     |             *                                                       =
 |
  85 ++                                                                    =
 |
     |                                                                     =
 |
  80 ++                                                                    =
 |
     |          O                                                     O    =
 |
     |  O  O  O    O                                             O         =
 O
  75 O+               O     O    O     O                   O  O    O     O =
 |
     |                   O     O    O     O  O  O O  O  O                  =
 |
     |                                                                     =
 |
  70 ++--------------------------------------------------------------------=
-+


                                 time.system_time

  235 ++-------------------------------------------------------------------=
-+
      |                                                                    =
 |
      |                        O                                           =
 |
  230 ++                          O  O  O O  O  O  O  O O                  =
 |
      O                   O O                              O  O     O    O =
 |
      |  O  O O     O  O                                         O    O    =
 O
  225 ++         O                                                         =
 |
      |                                                                    =
 |
  220 ++                                                                   =
 |
      |                                                                    =
 |
      |             *                                                      =
 |
  215 ++           + :           .*..                                      =
 |
      |           +   :   *.*..*.    *..*.*..*                             =
 |
      *..*..*.*..*    : ..                                                 =
 |
  210 ++---------------*---------------------------------------------------=
-+


                           time.voluntary_context_switches

  500000 ++------------------------------------------------------O--O--O---=
-O
         |                                                               O =
 |
  450000 ++                                                    O           =
 |
         |                    O                             O              =
 |
  400000 ++                 O    O  O O  O  O  O O  O  O O                 =
 |
         |  O       O                                                      =
 |
  350000 O+   O  O    O  O                                                 =
 |
         |                                                                 =
 |
  300000 ++                                                                =
 |
         |                                                                 =
 |
  250000 ++                                                                =
 |
         *..*.*..*..*.          .*..*.     .*..                            =
 |
  200000 ++           *..*..*.*.      *..*.    *                           =
 |
         |                                                                 =
 |
  150000 ++----------------------------------------------------------------=
-+


                                  energy.energy-cores

  2.5e-08 ++---------------------------------------------------------------=
-+
          |                                                            O   =
 |
          |                                                                =
 |
    2e-08 ++                                                               =
 |
          |                                                      O  O    O =
 O
          |                                                    O           =
 |
  1.5e-08 ++                   O                                           =
 |
          |  O       O                    O                 O              =
 |
    1e-08 O+   O  O    O  O O     O O  O    O  O  O O  O  O                =
 |
          |            *..*.*..*..*.*..*..*.*..*                           =
 |
          |            :                                                   =
 |
    5e-09 ++          :                                                    =
 |
          |           :                                                    =
 |
          |          :                                                     =
 |
        0 *+-*-*--*--*-----------------------------------------------------=
-+


                                   energy.energy-pkg

    4e-08 ++---------------------------------------------------------------=
-+
          |                                                            O   =
 |
  3.5e-08 ++                                                               =
 O
          |                                                    O O  O    O =
 |
    3e-08 ++                   O                                           =
 |
  2.5e-08 ++ O       O      O     O O  O  O O  O  O O  O  O O              =
 |
          O    O  O    O..O.*..*..*.*..*..*.*..*                           =
 |
    2e-08 ++           :                                                   =
 |
          |            :                                                   =
 |
  1.5e-08 ++          :                                                    =
 |
    1e-08 ++          :                                                    =
 |
          |           :                                                    =
 |
    5e-09 ++          :                                                    =
 |
          |          :                                                     =
 |
        0 *+-*-*--*--*-----------------------------------------------------=
-+


                           aim9.shell_rtns_3.ops_per_sec

  300 ++-------------------------------------------------------------------=
-+
  280 ++                                                              O    =
 |
      |                                                          O  O    O =
 O
  260 ++                                                      O            =
 |
  240 ++                    O                              O               =
 |
      |                   O    O  O  O  O O  O  O  O  O O                  =
 |
  220 ++ O       O                                                         =
 |
  200 O+    O O     O  O                                                   =
 |
  180 ++                                                                   =
 |
      |                                                                    =
 |
  160 ++                                                                   =
 |
  140 ++                                                                   =
 |
      |                  .*.*..*..*..*..*.*..*                             =
 |
  120 *+.*..*.*..*..*..*.                                                  =
 |
  100 ++-------------------------------------------------------------------=
-+


                                   turbostat.%c0

  1.12 ++------------------------------------------------------------------=
-+
   1.1 ++                 *..*                                             =
 |
       |                 +    +                                            =
 |
  1.08 ++   .*.        .*      +                                           =
 |
  1.06 *+.*.   *..*..*.         *..*.*..*..*..*                            =
 |
  1.04 ++                                                                  =
 |
  1.02 ++                                                                  =
 |
       |                                                                   =
 |
     1 ++                                                                  =
 |
  0.98 O+    O       O  O O          O                                     =
 |
  0.96 ++ O    O  O          O  O  O    O  O  O O  O  O  O                 =
 |
  0.94 ++                                                  O  O            =
 |
       |                                                              O    =
 |
  0.92 ++                                                        O  O    O =
 O
   0.9 ++------------------------------------------------------------------=
-+


                                  turbostat.Pkg_W

  170 ++-------------------------------------------------------------------=
-+
      |                                                               O    =
 |
  160 ++                                                                   =
 |
  150 ++                                                                   =
 |
      |                                                                    =
 O
  140 ++                                                         O  O    O =
 |
      |                                                                    =
 |
  130 ++                                                      O            =
 |
      |                     O                                              =
 |
  120 ++                                                                   =
 |
  110 ++ O       O                      O                  O               =
 |
      O     O O     O  O  O    O  O  O    O  O  O  O  O O                  =
 |
  100 ++                                                                   =
 |
      *..*..*.*..*..*..*..*.*..*..*..*..*.*..*                             =
 |
   90 ++-------------------------------------------------------------------=
-+


                                  turbostat.Cor_W

  100 ++--------------------------------------------------------------O----=
-+
      |                                                                    =
 |
   90 ++                                                                   =
 |
      |                                                                    =
 |
   80 ++                                                                   =
 O
      |                                                          O  O    O =
 |
   70 ++                                                      O            =
 |
      |                     O                                              =
 |
   60 ++                                                                   =
 |
      |  O                                                                 =
 |
   50 ++         O        O    O  O  O  O O  O  O  O  O O  O               =
 |
      O     O O     O  O                                                   =
 |
   40 ++                                                                   =
 |
      *..*..*.*..*..*..*..*.*..*..*..*..*.*..*                             =
 |
   30 ++-------------------------------------------------------------------=
-+

	[*] bisect-good sample
	[O] bisect-bad  sample

To reproduce:

	apt-get install ruby ruby-oj
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
Fengguang

_______________________________________________
LKP mailing list
LKP(a)linux.intel.com

--===============2257476692772029029==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiBhaW05CmRlZmF1bHRfbW9uaXRvcnM6CiAgd2F0Y2gtb29tOiAKICB3YWl0
OiBwcmUtdGVzdAogIHVwdGltZTogCiAgaW9zdGF0OiAKICB2bXN0YXQ6IAogIG51bWEtbnVtYXN0
YXQ6IAogIG51bWEtdm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mtdm1zdGF0OiAKICBw
cm9jLXN0YXQ6IAogIG1lbWluZm86IAogIHNsYWJpbmZvOiAKICBpbnRlcnJ1cHRzOiAKICBsb2Nr
X3N0YXQ6IAogIGxhdGVuY3lfc3RhdHM6IAogIHNvZnRpcnFzOiAKICBiZGlfZGV2X21hcHBpbmc6
IAogIGRpc2tzdGF0czogCiAgZW5lcmd5OiAKICBjcHVpZGxlOiAKICBjcHVmcmVxOiAKICB0dXJi
b3N0YXQ6IAogIHNjaGVkX2RlYnVnOgogICAgaW50ZXJ2YWw6IDEwCiAgcG1ldGVyOiAKbW9kZWw6
IEJyaWNrbGFuZCBJdnkgQnJpZGdlLUVYCm5yX2NwdTogMTIwCm1lbW9yeTogNTEyRwpoZGRfcGFy
dGl0aW9uczogCnN3YXBfcGFydGl0aW9uczogCmFpbTk6CiAgdGVzdHRpbWU6IDMwMHMKICB0ZXN0
OgogIC0gc2hlbGxfcnRuc18zCmJyYW5jaDogbGludXMvbWFzdGVyCmNvbW1pdDogMTk1ODNjYTU4
NGQ2ZjU3NDM4NGUxN2ZlNzYxM2RmYWVhZGNkYzRhNgpyZXBlYXRfdG86IDMKZW5xdWV1ZV90aW1l
OiAyMDE0LTA5LTI1IDIxOjU2OjE1LjA2OTUzOTMyMiArMDg6MDAKdGVzdGJveDogYnJpY2tsYW5k
MwprY29uZmlnOiB4ODZfNjQtcmhlbAprZXJuZWw6ICIva2VybmVsL3g4Nl82NC1yaGVsLzE5NTgz
Y2E1ODRkNmY1NzQzODRlMTdmZTc2MTNkZmFlYWRjZGM0YTYvdm1saW51ei0zLjE2LjAiCnVzZXI6
IGxrcApxdWV1ZTogd2ZnCnJlc3VsdF9yb290OiAiL3Jlc3VsdC9icmlja2xhbmQzL2FpbTkvMzAw
cy1zaGVsbF9ydG5zXzMvZGViaWFuLXg4Nl82NC5jZ3oveDg2XzY0LXJoZWwvMTk1ODNjYTU4NGQ2
ZjU3NDM4NGUxN2ZlNzYxM2RmYWVhZGNkYzRhNi8wIgpqb2JfZmlsZTogIi9sa3Avc2NoZWR1bGVk
L2JyaWNrbGFuZDMvd2ZnX2FpbTktMzAwcy1zaGVsbF9ydG5zXzMteDg2XzY0LXJoZWwtMTk1ODNj
YTU4NGQ2ZjU3NDM4NGUxN2ZlNzYxM2RmYWVhZGNkYzRhNi0yLnlhbWwiCmRlcXVldWVfdGltZTog
MjAxNC0wOS0zMCAxMTo0MjoyMS44OTQ2OTYxNDUgKzA4OjAwCmhpc3RvcnlfdGltZTogMzQ4Ljg3
CmpvYl9zdGF0ZTogZmluaXNoZWQKbG9hZGF2ZzogMC44NCAwLjY2IDAuMzEgMS85NjcgNTI5MDQK
c3RhcnRfdGltZTogJzE0MTIwNDg2MjUnCmVuZF90aW1lOiAnMTQxMjA0ODkyNScKdmVyc2lvbjog
Ii9sa3AvbGtwLy5zcmMtMjAxNDA5MjktMTUyMDQzIgo=

--===============2257476692772029029==--

