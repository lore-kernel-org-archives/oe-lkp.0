Content-Type: multipart/mixed; boundary="===============4232121553197600070=="
MIME-Version: 1.0
From: Aaron Lu <aaron.lu@intel.com>
To: lkp@lists.01.org
Subject: [sched] 517b8b57fb5: -31.6% cpuidle.C3-NHM.usage
Date: Mon, 14 Jul 2014 13:28:19 +0800
Message-ID: <53C36A73.4050004@intel.com>
In-Reply-To: <53c36a09.4ijHQ/6a1RwydD2z%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4232121553197600070==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://bee.sh.intel.com/git/ydu19/linux cc-v4.7-on-3.16-rc3
commit 517b8b57fb5e6ceb175439474d4e539dfeb74bfe ("sched: Remove update_rq_r=
unnable_avg")

test case: xps2/pigz/100%-128K

      v3.16-rc3  517b8b57fb5e6ceb175439474  =

---------------  -------------------------  =

       776 ~22%     -31.6%        531 ~16%  TOTAL cpuidle.C3-NHM.usage
      0.26 ~ 5%     -25.5%       0.19 ~ 5%  TOTAL turbostat.%c6
   6904073 ~ 2%     -23.4%    5290138 ~ 2%  TOTAL cpuidle.C6-NHM.time
      7762 ~ 0%     +22.1%       9481 ~ 1%  TOTAL proc-vmstat.nr_active_anon
     31071 ~ 0%     +22.1%      37939 ~ 1%  TOTAL meminfo.Active(anon)
      7847 ~ 0%     +21.9%       9563 ~ 1%  TOTAL proc-vmstat.nr_anon_pages
     31404 ~ 0%     +21.9%      38271 ~ 1%  TOTAL meminfo.AnonPages
      2369 ~ 1%     -15.5%       2002 ~ 1%  TOTAL proc-vmstat.pgactivate
     10420 ~ 2%     +16.1%      12102 ~ 0%  TOTAL time.maximum_resident_set=
_size
       970 ~ 3%     +12.6%       1092 ~ 0%  TOTAL slabinfo.kmalloc-96.num_o=
bjs
       970 ~ 3%     +12.6%       1092 ~ 0%  TOTAL slabinfo.kmalloc-96.activ=
e_objs
      4.56 ~ 4%     +13.6%       5.18 ~ 8%  TOTAL perf-profile.cpu-cycles.c=
opy_user_generic_string.copy_page_from_iter.pipe_write.new_sync_write.vfs_w=
rite
    108172 ~ 0%     +10.4%     119392 ~ 0%  TOTAL meminfo.Active
     12905 ~ 0%     +11.6%      14408 ~ 0%  TOTAL time.minor_page_faults

Legend:
	~XX%    - stddev percent
	[+-]XX% - change percent


                               time.minor_page_faults

  15000 ++-----------------------------------------------------------------=
-+
        O    O               O                                             =
 |
        |         O     O                                                  =
 |
  14500 ++                        O                    O          O        =
 O
        |                              O     O    O         O          O   =
 |
        |                                                                  =
 |
  14000 ++                                                                 =
 |
        |                                                                  =
 |
  13500 ++                                                                 =
 |
        |                                                                  =
 |
        |                                                                  =
 |
  13000 ++                           ..*.....*....                         =
 |
        *....*....*.....*....*....*..             *....*                   =
 |
        |                                                                  =
 |
  12500 ++-----------------------------------------------------------------=
-+


	[*] bisect-good sample
	[O] bisect-bad  sample


Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.

Thanks,
Aaron

--===============4232121553197600070==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVj
aG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgoK

--===============4232121553197600070==--

