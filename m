Content-Type: multipart/mixed; boundary="===============3083467515511409104=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [btrfs] 4c468fd7485: +7.8% blogbench.write_score, -5.1% turbostat.Pkg_W
Date: Sat, 16 Aug 2014 15:52:33 +0800
Message-ID: <20140816075233.GA26842@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============3083467515511409104==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Chris,

FYI, we noticed increased performance and reduced power consumption on

commit 4c468fd74859d901c0b78b42bef189295e00d74f ("btrfs: disable strict fil=
e flushes for renames and truncates")

test case: lkp-sb02/blogbench/1HDD-btrfs

0954d74f8f37a47  4c468fd74859d901c0b78b42b =

---------------  ------------------------- =

      1094 =C2=B1 1%      +7.8%       1180 =C2=B1 2%  TOTAL blogbench.write=
_score
      1396 =C2=B119%    -100.0%          0 =C2=B1 0%  TOTAL slabinfo.btrfs_=
delalloc_work.active_objs
      1497 =C2=B117%    -100.0%          0 =C2=B1 0%  TOTAL slabinfo.btrfs_=
delalloc_work.num_objs
       426 =C2=B145%    -100.0%          0 =C2=B1 0%  TOTAL proc-vmstat.nr_=
vmscan_write
      1.02 =C2=B138%    +193.1%       2.99 =C2=B137%  TOTAL turbostat.%pc6
      0.12 =C2=B148%    +113.8%       0.25 =C2=B129%  TOTAL turbostat.%pc3
      0.38 =C2=B118%    +117.7%       0.84 =C2=B134%  TOTAL turbostat.%pc2
     19377 =C2=B114%     -50.9%       9520 =C2=B120%  TOTAL proc-vmstat.wor=
kingset_refault
        44 =C2=B141%     +68.8%         75 =C2=B128%  TOTAL cpuidle.POLL.us=
age
     31549 =C2=B1 1%     +95.7%      61732 =C2=B1 1%  TOTAL softirqs.BLOCK
      4547 =C2=B110%     -38.3%       2804 =C2=B1 9%  TOTAL slabinfo.btrfs_=
ordered_extent.active_objs
      4628 =C2=B110%     -37.1%       2913 =C2=B1 9%  TOTAL slabinfo.btrfs_=
ordered_extent.num_objs
     17597 =C2=B1 8%     -30.2%      12291 =C2=B114%  TOTAL proc-vmstat.nr_=
writeback
     70335 =C2=B1 8%     -30.1%      49174 =C2=B114%  TOTAL meminfo.Writeba=
ck
      3606 =C2=B1 6%     -29.1%       2556 =C2=B110%  TOTAL slabinfo.mnt_ca=
che.active_objs
     14763 =C2=B112%     -29.9%      10350 =C2=B1 8%  TOTAL proc-vmstat.nr_=
dirty
      3766 =C2=B1 5%     -27.8%       2720 =C2=B110%  TOTAL slabinfo.mnt_ca=
che.num_objs
      3509 =C2=B1 6%     -28.5%       2510 =C2=B111%  TOTAL slabinfo.kmallo=
c-4096.active_objs
     59201 =C2=B111%     -30.1%      41396 =C2=B1 8%  TOTAL meminfo.Dirty
       479 =C2=B113%     -30.5%        333 =C2=B110%  TOTAL slabinfo.kmallo=
c-4096.num_slabs
       479 =C2=B113%     -30.5%        333 =C2=B110%  TOTAL slabinfo.kmallo=
c-4096.active_slabs
      3636 =C2=B1 6%     -26.6%       2669 =C2=B110%  TOTAL slabinfo.kmallo=
c-4096.num_objs
      6040 =C2=B1 8%     -28.6%       4314 =C2=B1 6%  TOTAL slabinfo.kmallo=
c-96.num_objs
      5358 =C2=B1 5%     -25.1%       4011 =C2=B1 7%  TOTAL slabinfo.kmallo=
c-96.active_objs
    757208 =C2=B1 4%     -22.1%     589874 =C2=B1 4%  TOTAL meminfo.MemFree
    189508 =C2=B1 4%     -22.2%     147518 =C2=B1 4%  TOTAL proc-vmstat.nr_=
free_pages
    762781 =C2=B1 4%     -21.1%     601525 =C2=B1 4%  TOTAL vmstat.memory.f=
ree
     10491 =C2=B1 2%     -16.8%       8725 =C2=B1 2%  TOTAL slabinfo.kmallo=
c-64.num_objs
      2513 =C2=B1 4%     +16.3%       2923 =C2=B1 4%  TOTAL slabinfo.kmallo=
c-128.active_objs
      9768 =C2=B1 3%     -15.1%       8298 =C2=B1 1%  TOTAL slabinfo.kmallo=
c-64.active_objs
      2627 =C2=B1 4%     +14.0%       2995 =C2=B1 4%  TOTAL slabinfo.kmallo=
c-128.num_objs
     96242 =C2=B1 2%     +15.5%     111120 =C2=B1 2%  TOTAL slabinfo.btrfs_=
path.active_objs
      3448 =C2=B1 2%     +15.1%       3968 =C2=B1 2%  TOTAL slabinfo.btrfs_=
path.num_slabs
      3448 =C2=B1 2%     +15.1%       3968 =C2=B1 2%  TOTAL slabinfo.btrfs_=
path.active_slabs
     96580 =C2=B1 2%     +15.1%     111132 =C2=B1 2%  TOTAL slabinfo.btrfs_=
path.num_objs
      2526 =C2=B1 2%     +13.5%       2867 =C2=B1 1%  TOTAL slabinfo.btrfs_=
extent_state.num_slabs
      2526 =C2=B1 2%     +13.5%       2867 =C2=B1 1%  TOTAL slabinfo.btrfs_=
extent_state.active_slabs
    106133 =C2=B1 2%     +13.5%     120434 =C2=B1 1%  TOTAL slabinfo.btrfs_=
extent_state.num_objs
    104326 =C2=B1 2%     +12.3%     117189 =C2=B1 1%  TOTAL slabinfo.btrfs_=
extent_state.active_objs
    110759 =C2=B1 2%     +13.4%     125640 =C2=B1 2%  TOTAL slabinfo.btrfs_=
inode.active_objs
    110759 =C2=B1 2%     +13.4%     125642 =C2=B1 2%  TOTAL slabinfo.btrfs_=
delayed_node.active_objs
      4261 =C2=B1 2%     +13.4%       4832 =C2=B1 2%  TOTAL slabinfo.btrfs_=
delayed_node.num_slabs
      4261 =C2=B1 2%     +13.4%       4832 =C2=B1 2%  TOTAL slabinfo.btrfs_=
delayed_node.active_slabs
    110797 =C2=B1 2%     +13.4%     125663 =C2=B1 2%  TOTAL slabinfo.btrfs_=
delayed_node.num_objs
    110815 =C2=B1 2%     +13.4%     125669 =C2=B1 2%  TOTAL slabinfo.btrfs_=
inode.num_objs
      6926 =C2=B1 2%     +13.4%       7853 =C2=B1 2%  TOTAL slabinfo.btrfs_=
inode.num_slabs
      6926 =C2=B1 2%     +13.4%       7853 =C2=B1 2%  TOTAL slabinfo.btrfs_=
inode.active_slabs
      5607 =C2=B1 3%     -11.0%       4991 =C2=B1 3%  TOTAL slabinfo.kmallo=
c-256.active_objs
      6077 =C2=B1 2%      -9.9%       5476 =C2=B1 3%  TOTAL slabinfo.kmallo=
c-256.num_objs
     11153 =C2=B1 1%      -7.7%      10295 =C2=B1 2%  TOTAL proc-vmstat.nr_=
slab_unreclaimable
    547824 =C2=B1 3%     +16.5%     638368 =C2=B1 8%  TOTAL meminfo.Inactiv=
e(file)
    112124 =C2=B1 2%     +11.6%     125105 =C2=B1 2%  TOTAL slabinfo.radix_=
tree_node.active_objs
    112169 =C2=B1 2%     +11.6%     125134 =C2=B1 2%  TOTAL slabinfo.radix_=
tree_node.num_objs
      4005 =C2=B1 2%     +11.6%       4468 =C2=B1 2%  TOTAL slabinfo.radix_=
tree_node.num_slabs
      4005 =C2=B1 2%     +11.6%       4468 =C2=B1 2%  TOTAL slabinfo.radix_=
tree_node.active_slabs
    551119 =C2=B1 3%     +16.4%     641663 =C2=B1 8%  TOTAL meminfo.Inactive
    285596 =C2=B1 2%     +11.4%     318160 =C2=B1 2%  TOTAL meminfo.SReclai=
mable
       156 =C2=B1 3%    +118.0%        340 =C2=B1 2%  TOTAL iostat.sda.w/s
       282 =C2=B1 3%     -43.2%        160 =C2=B1 3%  TOTAL iostat.sda.avgr=
q-sz
      1.45 =C2=B112%     -28.9%       1.03 =C2=B118%  TOTAL iostat.sda.rrqm=
/s
       633 =C2=B1 2%     -26.5%        465 =C2=B1 2%  TOTAL iostat.sda.wrqm=
/s
    154423 =C2=B1 5%     +17.4%     181309 =C2=B1 3%  TOTAL time.voluntary_=
context_switches
       536 =C2=B1 5%     -11.5%        474 =C2=B1 9%  TOTAL iostat.sda.await
    102.71 =C2=B1 5%     +10.4%     113.36 =C2=B1 6%  TOTAL iostat.sda.avgq=
u-sz
     20842 =C2=B1 2%      -6.5%      19493 =C2=B1 2%  TOTAL iostat.sda.wkB/s
     20856 =C2=B1 2%      -6.4%      19525 =C2=B1 2%  TOTAL vmstat.io.bo
     75.48 =C2=B1 4%      -6.9%      70.27 =C2=B1 5%  TOTAL turbostat.%c0
       285 =C2=B1 4%      -6.6%        266 =C2=B1 5%  TOTAL time.percent_of=
_cpu_this_job_got
     34.58 =C2=B1 2%      -5.5%      32.68 =C2=B1 3%  TOTAL turbostat.Cor_W
     39.86 =C2=B1 2%      -5.1%      37.82 =C2=B1 3%  TOTAL turbostat.Pkg_W
      5805 =C2=B1 1%      -4.3%       5558 =C2=B1 3%  TOTAL vmstat.system.in
  10069454 =C2=B1 1%      +6.3%   10699830 =C2=B1 1%  TOTAL time.file_syste=
m_outputs


Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.

Thanks,
Fengguang

--===============3083467515511409104==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCm1rZnMgLXQgYnRyZnMgL2Rldi9zZGEyCm1vdW50IC10IGJ0cmZzIC9kZXYvc2RhMiAv
ZnMvc2RhMgouL2Jsb2diZW5jaCAtZCAvZnMvc2RhMgo=

--===============3083467515511409104==--

