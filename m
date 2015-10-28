Content-Type: multipart/mixed; boundary="===============5827330257286024984=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [mm, page_alloc] 43993977ba: +88% OOM possibility
Date: Wed, 28 Oct 2015 13:36:02 +0800
Message-ID: <87oafjpnb1.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5827330257286024984==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
commit 43993977baecd838d66ccabc7f682342fc6ff635 ("mm, page_alloc: distingui=
sh between being unable to sleep, unwilling to sleep and avoiding waking ks=
wapd")

We found the OOM possibility increased 88% in a virtual machine with 1G mem=
ory.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/disk/fs/test:
  vm-kbuild-1G/xfstests/debian-x86_64-2015-02-07.cgz/x86_64-allyesdebian/gc=
c-4.9/4HDD/btrfs/generic-mid

commit: =

  74fad8a3a917b9e0a407af8a4150c61f7b836591
  43993977baecd838d66ccabc7f682342fc6ff635

74fad8a3a917b9e0 43993977baecd838d66ccabc7f =

---------------- -------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

          1:24          -4%            :24    xfstests.generic.192.fail
          1:24          -4%            :24    xfstests.nr_fail
           :24          88%          21:24    dmesg.Mem-Info
           :24          62%          15:24    dmesg.page_allocation_failure=
:order:#,mode
           :24          88%          21:24    dmesg.warn_alloc_failed+0x
           :24          75%          18:24    last_state.is_incomplete_run
          1:24          -4%            :24    last_state.xfstests.exit_code=
.1
           :24          54%          13:24    last_state.xfstests.exit_code=
.143
           :24          71%          17:24    kmsg.SLAB:Unable_to_allocate_=
memory_on_node#(gfp=3D#)
          1:24          -4%            :24    kmsg.TDH<#>
          1:24          -4%            :24    kmsg.TDH<c7>
          1:24          -4%            :24    kmsg.TDT<#>
          1:24          -4%            :24    kmsg.TDT<c7>
          1:24          -4%            :24    kmsg.Tx_Queue<#>
          1:24          -4%            :24    kmsg.buffer_info[next_to_clea=
n]
          1:24          -4%            :24    kmsg.e1000#:#:#eth0:Detected_=
Tx_Unit_Hang
          1:24          -4%            :24    kmsg.jiffies<#>
          1:24          -4%            :24    kmsg.jiffies<#c5c>
          1:24          -4%            :24    kmsg.next_to_clean<#>
          1:24          -4%            :24    kmsg.next_to_clean<c7>
          1:24          -4%            :24    kmsg.next_to_use<#>
          1:24          -4%            :24    kmsg.next_to_use<c9>
          1:24          -4%            :24    kmsg.next_to_watch.status<#>
          1:24          -4%            :24    kmsg.next_to_watch<#>
          1:24          -4%            :24    kmsg.next_to_watch<c8>
          1:24          -4%            :24    kmsg.time_stamp<#>
          1:24          -4%            :24    kmsg.time_stamp<#afd>


vm-kbuild-1G: qemu-system-x86_64 -enable-kvm -cpu Haswell,+smep,+smap
Memory: 1G


To reproduce:

        git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tes=
ts.git
        cd lkp-tests
        bin/lkp install job.yaml  # job file is attached in this email
        bin/lkp run     job.yaml


Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.


Thanks,
Ying Huang

--===============5827330257286024984==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogeGZzdGVzdHMKZGVmYXVsdC1tb25pdG9yczoKICB3YWl0OiBhY3RpdmF0ZS1tb25p
dG9yCiAga21zZzogCiAgdm1zdGF0OgogICAgaW50ZXJ2YWw6IDEwCmRlZmF1bHQtd2F0Y2hkb2dz
OgogIG9vbS1raWxsZXI6IAogIHdhdGNoZG9nOiAKY3B1ZnJlcV9nb3Zlcm5vcjogCm1vZGVsOiBx
ZW11LXN5c3RlbS14ODZfNjQgLWVuYWJsZS1rdm0gLWNwdSBIYXN3ZWxsLCtzbWVwLCtzbWFwCm5y
X3ZtOiAxNgpucl9jcHU6IDIKbWVtb3J5OiAxRwpkaXNrX3R5cGU6IHZpcnRpby1zY3NpCnJvb3Rm
czogZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnegpoZGRfcGFydGl0aW9uczogIi9kZXYvc2Rh
IC9kZXYvc2RiIC9kZXYvc2RjIC9kZXYvc2RkIgpzd2FwX3BhcnRpdGlvbnM6ICIvZGV2L3NkZSIK
c3NoX2Jhc2VfcG9ydDogMjMwMDAKY2F0ZWdvcnk6IGZ1bmN0aW9uYWwKZGlzazogNEhERApmczog
YnRyZnMKeGZzdGVzdHM6CiAgdGVzdDogZ2VuZXJpYy1taWQKZW5xdWV1ZV90aW1lOiAyMDE1LTEw
LTE5IDIzOjM2OjA1LjgwNjQxMzMxNiArMDg6MDAKYnJhbmNoOiBsaW51eC1yZXZpZXcvUmljaGFy
ZC1GaXR6Z2VyYWxkL0FkZC1zdXBwb3J0LWZvci1DaXJydXMtTG9naWMtQ1M0N0wyNC1hbmQtV00x
ODMxLWNvZGVjcy8yMDE1MTAxOS0yMjE3NTQKY29tbWl0OiA3MGUyNWQ5ZTE1ZmRhZTM0NWFlNzQ5
OTEzMWM2NDNkYjUwNmQwOGUwCnF1ZXVlOiByYW5kCnJlcGVhdF90bzogMgp0ZXN0Ym94OiB2bS1r
YnVpbGQtMUctMTEKdGJveF9ncm91cDogdm0ta2J1aWxkLTFHCmtjb25maWc6IHg4Nl82NC1hbGx5
ZXNkZWJpYW4KaWQ6IDY0ZDY0NWRiMzY3MTc1ZGI3MDhhYzY5ZDMyMWFhNTQ3YTdmMjM5MDAKdXNl
cjogbGtwCmNvbXBpbGVyOiBnY2MtNC45Cmtlcm5lbDogIi9wa2cvbGludXgveDg2XzY0LWFsbHll
c2RlYmlhbi9nY2MtNC45LzcwZTI1ZDllMTVmZGFlMzQ1YWU3NDk5MTMxYzY0M2RiNTA2ZDA4ZTAv
dm1saW51ei00LjMuMC1yYzUtbmV4dC0yMDE1MTAxNi0wMDAwMy1nNzBlMjVkOSIKcmVzdWx0X3Jv
b3Q6ICIvcmVzdWx0L3hmc3Rlc3RzLzRIREQtYnRyZnMtZ2VuZXJpYy1taWQvdm0ta2J1aWxkLTFH
L2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LWFsbHllc2RlYmlhbi9nY2MtNC45
LzcwZTI1ZDllMTVmZGFlMzQ1YWU3NDk5MTMxYzY0M2RiNTA2ZDA4ZTAvMCIKam9iX2ZpbGU6ICIv
bGtwL3NjaGVkdWxlZC92bS1rYnVpbGQtMUctMTEvcmFuZF94ZnN0ZXN0cy00SERELWJ0cmZzLWdl
bmVyaWMtbWlkLWRlYmlhbi14ODZfNjQuY2d6LXg4Nl82NC1hbGx5ZXNkZWJpYW4tNzBlMjVkOWUx
NWZkYWUzNDVhZTc0OTkxMzFjNjQzZGI1MDZkMDhlMC0yMDE1MTAxOS0xMjg5MjQtdXQ5cm5wLTAu
eWFtbCIKZGVxdWV1ZV90aW1lOiAyMDE1LTEwLTIwIDAwOjI0OjU4LjUwNTY4MTAwNiArMDg6MDAK
bWF4X3VwdGltZTogMzYwMAppbml0cmQ6ICIvb3NpbWFnZS9kZWJpYW4vZGViaWFuLXg4Nl82NC0y
MDE1LTAyLTA3LmNneiIKYm9vdGxvYWRlcl9hcHBlbmQ6Ci0gcm9vdD0vZGV2L3JhbTAKLSB1c2Vy
PWxrcAotIGpvYj0vbGtwL3NjaGVkdWxlZC92bS1rYnVpbGQtMUctMTEvcmFuZF94ZnN0ZXN0cy00
SERELWJ0cmZzLWdlbmVyaWMtbWlkLWRlYmlhbi14ODZfNjQuY2d6LXg4Nl82NC1hbGx5ZXNkZWJp
YW4tNzBlMjVkOWUxNWZkYWUzNDVhZTc0OTkxMzFjNjQzZGI1MDZkMDhlMC0yMDE1MTAxOS0xMjg5
MjQtdXQ5cm5wLTAueWFtbAotIEFSQ0g9eDg2XzY0Ci0ga2NvbmZpZz14ODZfNjQtYWxseWVzZGVi
aWFuCi0gYnJhbmNoPWxpbnV4LXJldmlldy9SaWNoYXJkLUZpdHpnZXJhbGQvQWRkLXN1cHBvcnQt
Zm9yLUNpcnJ1cy1Mb2dpYy1DUzQ3TDI0LWFuZC1XTTE4MzEtY29kZWNzLzIwMTUxMDE5LTIyMTc1
NAotIGNvbW1pdD03MGUyNWQ5ZTE1ZmRhZTM0NWFlNzQ5OTEzMWM2NDNkYjUwNmQwOGUwCi0gQk9P
VF9JTUFHRT0vcGtnL2xpbnV4L3g4Nl82NC1hbGx5ZXNkZWJpYW4vZ2NjLTQuOS83MGUyNWQ5ZTE1
ZmRhZTM0NWFlNzQ5OTEzMWM2NDNkYjUwNmQwOGUwL3ZtbGludXotNC4zLjAtcmM1LW5leHQtMjAx
NTEwMTYtMDAwMDMtZzcwZTI1ZDkKLSBtYXhfdXB0aW1lPTM2MDAKLSBSRVNVTFRfUk9PVD0vcmVz
dWx0L3hmc3Rlc3RzLzRIREQtYnRyZnMtZ2VuZXJpYy1taWQvdm0ta2J1aWxkLTFHL2RlYmlhbi14
ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LWFsbHllc2RlYmlhbi9nY2MtNC45LzcwZTI1ZDll
MTVmZGFlMzQ1YWU3NDk5MTMxYzY0M2RiNTA2ZDA4ZTAvMAotIExLUF9TRVJWRVI9aW5uCi0gfDIt
CgoKICBlYXJseXByaW50az10dHlTMCwxMTUyMDAgc3lzdGVtZC5sb2dfbGV2ZWw9ZXJyCiAgZGVi
dWcgYXBpYz1kZWJ1ZyBzeXNycV9hbHdheXNfZW5hYmxlZCByY3VwZGF0ZS5yY3VfY3B1X3N0YWxs
X3RpbWVvdXQ9MTAwCiAgcGFuaWM9LTEgc29mdGxvY2t1cF9wYW5pYz0xIG5taV93YXRjaGRvZz1w
YW5pYyBvb3BzPXBhbmljIGxvYWRfcmFtZGlzaz0yIHByb21wdF9yYW1kaXNrPTAKICBjb25zb2xl
PXR0eVMwLDExNTIwMCBjb25zb2xlPXR0eTAgdmdhPW5vcm1hbAoKICBydwpsa3BfaW5pdHJkOiAi
L2xrcC9sa3AvbGtwLXg4Nl82NC5jZ3oiCm1vZHVsZXNfaW5pdHJkOiAiL3BrZy9saW51eC94ODZf
NjQtYWxseWVzZGViaWFuL2djYy00LjkvNzBlMjVkOWUxNWZkYWUzNDVhZTc0OTkxMzFjNjQzZGI1
MDZkMDhlMC9tb2R1bGVzLmNneiIKYm1faW5pdHJkOiAiL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2
XzY0LTIwMTUtMDItMDcuY2d6L2xrcC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIw
MTUtMDItMDcuY2d6L3J1bi1pcGNvbmZpZy5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0
LTIwMTUtMDItMDcuY2d6L2ZzLmNneiwvbGtwL2JlbmNobWFya3MveGZzdGVzdHMuY2d6Igpqb2Jf
c3RhdGU6IHVwbG9hZF9kbWVzZwo=

--===============5827330257286024984==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

bWtmcyAtdCBidHJmcyAvZGV2L3NkZApta2ZzIC10IGJ0cmZzIC9kZXYvc2RiCm1rZnMgLXQgYnRy
ZnMgL2Rldi9zZGEKbWtmcyAtdCBidHJmcyAvZGV2L3NkYwptb3VudCAtdCBidHJmcyAvZGV2L3Nk
YSAvZnMvc2RhCm1vdW50IC10IGJ0cmZzIC9kZXYvc2RiIC9mcy9zZGIKbW91bnQgLXQgYnRyZnMg
L2Rldi9zZGMgL2ZzL3NkYwptb3VudCAtdCBidHJmcyAvZGV2L3NkZCAvZnMvc2RkCmV4cG9ydCBU
RVNUX0RJUj0vZnMvc2RhCmV4cG9ydCBURVNUX0RFVj0vZGV2L3NkYQpleHBvcnQgRlNUWVA9YnRy
ZnMKZXhwb3J0IFNDUkFUQ0hfTU5UPS9mcy9zY3JhdGNoCm1rZGlyIC9mcy9zY3JhdGNoIC1wCmV4
cG9ydCBTQ1JBVENIX0RFVl9QT09MPSIvZGV2L3NkYiAvZGV2L3NkYyAvZGV2L3NkZCIKLi9jaGVj
ayBnZW5lcmljLzA2OCBnZW5lcmljLzEwMCBnZW5lcmljLzExNyBnZW5lcmljLzEyMCBnZW5lcmlj
LzEyNSBnZW5lcmljLzEzMCBnZW5lcmljLzE5MiBnZW5lcmljLzIwOSBnZW5lcmljLzIyMyBnZW5l
cmljLzIyNSBnZW5lcmljLzIyNiBnZW5lcmljLzIzMCBnZW5lcmljLzI0MSBnZW5lcmljLzI0NyBn
ZW5lcmljLzI1NiBnZW5lcmljLzI3NQo=

--===============5827330257286024984==--

