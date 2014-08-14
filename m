Content-Type: multipart/mixed; boundary="===============4202515796947823326=="
MIME-Version: 1.0
From: kernel test robot <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [writeback] 952648324b9: -24.9% blogbench.write_score
Date: Thu, 14 Aug 2014 12:47:25 +0800
Message-ID: <20140814044725.GD11210@yliu-dev.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4202515796947823326==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we applied your patches and noticed the below changes on

commit 952648324b969f3fc22d3a2a78f4715c0bf43d7f ("writeback: Per-sb dirty t=
racking")

test case: lkp-sb02/blogbench/1HDD-ext4

df3be46bdbab23e  952648324b969f3fc22d3a2a7 =

---------------  ------------------------- =

       834 =C2=B1 3%     -24.9%        627 =C2=B1 3%  TOTAL blogbench.write=
_score
      6043 =C2=B1 3%     -74.0%       1571 =C2=B1 2%  TOTAL slabinfo.jbd2_j=
ournal_head.active_objs
       174 =C2=B1 3%     -66.9%         57 =C2=B1 3%  TOTAL slabinfo.jbd2_j=
ournal_head.num_slabs
       174 =C2=B1 3%     -66.9%         57 =C2=B1 3%  TOTAL slabinfo.jbd2_j=
ournal_head.active_slabs
      6293 =C2=B1 3%     -66.8%       2091 =C2=B1 2%  TOTAL slabinfo.jbd2_j=
ournal_head.num_objs
    171025 =C2=B132%     +78.6%     305412 =C2=B128%  TOTAL cpuidle.C1-SNB.=
time
   1013700 =C2=B136%     +80.6%    1830682 =C2=B117%  TOTAL cpuidle.C1E-SNB=
.time
      0.11 =C2=B127%     +71.7%       0.18 =C2=B116%  TOTAL turbostat.%c1
   1129386 =C2=B1 9%     +35.6%    1531413 =C2=B1 4%  TOTAL meminfo.MemFree
   1128767 =C2=B1 9%     +35.5%    1529806 =C2=B1 4%  TOTAL vmstat.memory.f=
ree
    282835 =C2=B1 9%     +35.3%     382773 =C2=B1 4%  TOTAL proc-vmstat.nr_=
free_pages
       740 =C2=B112%     +46.3%       1083 =C2=B113%  TOTAL cpuidle.C1E-SNB=
.usage
    891706 =C2=B1 8%     -24.9%     669997 =C2=B1 1%  TOTAL proc-vmstat.pga=
ctivate
      1528 =C2=B1 6%     -24.7%       1151 =C2=B1 1%  TOTAL proc-vmstat.nr_=
writeback
       327 =C2=B116%     +33.5%        437 =C2=B110%  TOTAL cpuidle.C1-SNB.=
usage
      6074 =C2=B1 8%     -24.6%       4581 =C2=B1 2%  TOTAL meminfo.Writeba=
ck
     13104 =C2=B1 4%     -17.6%      10794 =C2=B1 3%  TOTAL slabinfo.buffer=
_head.num_slabs
     13104 =C2=B1 4%     -17.6%      10794 =C2=B1 3%  TOTAL slabinfo.buffer=
_head.active_slabs
    511069 =C2=B1 4%     -17.6%     421003 =C2=B1 3%  TOTAL slabinfo.buffer=
_head.num_objs
    510881 =C2=B1 4%     -17.6%     421000 =C2=B1 3%  TOTAL slabinfo.buffer=
_head.active_objs
   3500553 =C2=B1 2%     -20.3%    2788421 =C2=B1 3%  TOTAL proc-vmstat.pgp=
gout
   1722412 =C2=B1 3%     -16.4%    1439377 =C2=B1 3%  TOTAL meminfo.Active(=
file)
   1752356 =C2=B1 3%     -16.2%    1468171 =C2=B1 3%  TOTAL meminfo.Active
    430248 =C2=B1 3%     -16.3%     359905 =C2=B1 3%  TOTAL proc-vmstat.nr_=
active_file
    767908 =C2=B1 2%     -19.2%     620130 =C2=B1 1%  TOTAL proc-vmstat.nr_=
written
     97504 =C2=B1 4%     -15.5%      82412 =C2=B1 3%  TOTAL slabinfo.ext4_i=
node_cache.active_objs
     97544 =C2=B1 4%     -15.5%      82457 =C2=B1 3%  TOTAL slabinfo.ext4_i=
node_cache.num_objs
      6096 =C2=B1 4%     -15.5%       5153 =C2=B1 3%  TOTAL slabinfo.ext4_i=
node_cache.num_slabs
      6096 =C2=B1 4%     -15.5%       5153 =C2=B1 3%  TOTAL slabinfo.ext4_i=
node_cache.active_slabs
       963 =C2=B1 4%     -15.2%        816 =C2=B1 3%  TOTAL slabinfo.ext4_e=
xtent_status.num_slabs
       963 =C2=B1 4%     -15.2%        816 =C2=B1 3%  TOTAL slabinfo.ext4_e=
xtent_status.active_slabs
     98282 =C2=B1 4%     -15.2%      83303 =C2=B1 3%  TOTAL slabinfo.ext4_e=
xtent_status.num_objs
    100050 =C2=B1 4%     -14.8%      85198 =C2=B1 3%  TOTAL slabinfo.shared=
_policy_node.active_objs
    100058 =C2=B1 4%     -14.8%      85218 =C2=B1 3%  TOTAL slabinfo.shared=
_policy_node.num_objs
   2435104 =C2=B1 3%     -14.7%    2077577 =C2=B1 2%  TOTAL meminfo.Cached
      1176 =C2=B1 4%     -14.8%       1002 =C2=B1 3%  TOTAL slabinfo.shared=
_policy_node.active_slabs
      1176 =C2=B1 4%     -14.8%       1002 =C2=B1 3%  TOTAL slabinfo.shared=
_policy_node.num_slabs
   2435823 =C2=B1 3%     -14.6%    2079169 =C2=B1 2%  TOTAL vmstat.memory.c=
ache
    616019 =C2=B1 3%     -14.6%     526020 =C2=B1 2%  TOTAL proc-vmstat.nr_=
file_pages
      3342 =C2=B1 4%     -14.7%       2852 =C2=B1 3%  TOTAL slabinfo.radix_=
tree_node.active_slabs
      3342 =C2=B1 4%     -14.7%       2852 =C2=B1 3%  TOTAL slabinfo.radix_=
tree_node.num_slabs
     93612 =C2=B1 4%     -14.7%      79877 =C2=B1 3%  TOTAL slabinfo.radix_=
tree_node.num_objs
     93574 =C2=B1 4%     -14.7%      79836 =C2=B1 3%  TOTAL slabinfo.radix_=
tree_node.active_objs
     30729 =C2=B1 4%     -14.9%      26163 =C2=B1 3%  TOTAL meminfo.Buffers
    253276 =C2=B1 3%     -14.5%     216563 =C2=B1 3%  TOTAL meminfo.SReclai=
mable
     30737 =C2=B1 4%     -14.8%      26187 =C2=B1 3%  TOTAL vmstat.memory.b=
uff
     97430 =C2=B1 3%     -14.5%      83280 =C2=B1 3%  TOTAL slabinfo.ext4_e=
xtent_status.active_objs
     63268 =C2=B1 3%     -14.4%      54149 =C2=B1 3%  TOTAL proc-vmstat.nr_=
slab_reclaimable
    287129 =C2=B1 3%     -13.6%     248074 =C2=B1 2%  TOTAL meminfo.Slab
    141193 =C2=B1 3%     -12.2%     124025 =C2=B1 2%  TOTAL slabinfo.dentry=
.num_objs
      6723 =C2=B1 3%     -12.2%       5905 =C2=B1 2%  TOTAL slabinfo.dentry=
.active_slabs
      6723 =C2=B1 3%     -12.2%       5905 =C2=B1 2%  TOTAL slabinfo.dentry=
.num_slabs
    141096 =C2=B1 3%     -12.2%     123952 =C2=B1 2%  TOTAL slabinfo.dentry=
.active_objs
    129818 =C2=B1 3%     -11.6%     114766 =C2=B1 2%  TOTAL slabinfo.Acpi-S=
tate.num_objs
      2544 =C2=B1 3%     -11.6%       2249 =C2=B1 2%  TOTAL slabinfo.Acpi-S=
tate.active_slabs
      2544 =C2=B1 3%     -11.6%       2249 =C2=B1 2%  TOTAL slabinfo.Acpi-S=
tate.num_slabs
    129753 =C2=B1 3%     -11.6%     114696 =C2=B1 2%  TOTAL slabinfo.Acpi-S=
tate.active_objs
    969880 =C2=B1 1%     -14.1%     832982 =C2=B1 1%  TOTAL proc-vmstat.nr_=
dirtied
     37692 =C2=B1 1%     +13.3%      42704 =C2=B1 1%  TOTAL softirqs.BLOCK
    726033 =C2=B1 3%      -9.0%     660369 =C2=B1 3%  TOTAL meminfo.Inactiv=
e(file)
    729347 =C2=B1 3%      -9.0%     663672 =C2=B1 3%  TOTAL meminfo.Inactive
    181422 =C2=B1 3%      -9.0%     165116 =C2=B1 3%  TOTAL proc-vmstat.nr_=
inactive_file
     11481 =C2=B1 2%     -20.6%       9116 =C2=B1 2%  TOTAL iostat.sda.wkB/s
     11499 =C2=B1 2%     -20.6%       9128 =C2=B1 3%  TOTAL vmstat.io.bo
   7626315 =C2=B1 1%     -17.3%    6309955 =C2=B1 1%  TOTAL time.file_syste=
m_outputs
       232 =C2=B1 1%     +13.7%        264 =C2=B1 1%  TOTAL iostat.sda.w/s
       652 =C2=B1 1%      -9.7%        589 =C2=B1 1%  TOTAL iostat.sda.wrqm=
/s
     31532 =C2=B1 2%      -9.5%      28546 =C2=B1 1%  TOTAL time.voluntary_=
context_switches
       562 =C2=B1 3%      -8.1%        516 =C2=B1 2%  TOTAL iostat.sda.await
       562 =C2=B1 3%      -8.1%        516 =C2=B1 2%  TOTAL iostat.sda.w_aw=
ait



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

--===============4202515796947823326==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCm1rZnMgLXQgZXh0NCAtcSAvZGV2L3NkYTIKbW91bnQgLXQgZXh0NCAvZGV2L3NkYTIg
L2ZzL3NkYTIKLi9ibG9nYmVuY2ggLWQgL2ZzL3NkYTIK

--===============4202515796947823326==--

