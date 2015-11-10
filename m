Content-Type: multipart/mixed; boundary="===============5420305699983750103=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [ext4] dfbd72d0d6: -100.0% xfstests.ext4.001.seconds
Date: Tue, 10 Nov 2015 13:26:51 +0800
Message-ID: <87twoubf1g.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5420305699983750103==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://github.com/0day-ci/linux Jan-Kara/ext4-Fix-races-between-page-fault=
s-and-hole-punching/20151105-002716
commit dfbd72d0d6f10086064b918419fb2094ff9fbdb6 ("ext4: Fix races between p=
age faults and hole punching")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/disk/fs/test:
  vm-kbuild-2G/xfstests/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/4H=
DD/ext4/ext4

commit: =

  32b88194f71d6ae7768a29f87fbba454728273ee
  dfbd72d0d6f10086064b918419fb2094ff9fbdb6

32b88194f71d6ae7 dfbd72d0d6f10086064b918419 =

---------------- -------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

           :4          100%           4:4     last_state.xfstests.exit_code=
.1
           :4          100%           4:4     xfstests.ext4.001.fail
           :4          100%           4:4     xfstests.nr_fail

vm-kbuild-2G: qemu-system-x86_64 -enable-kvm -cpu Haswell,+smep,+smap
Memory: 2G

The output of xfstests is as follow:

2015-11-09 01:42:14 export TEST_DIR=3D/fs/vda
2015-11-09 01:42:14 export TEST_DEV=3D/dev/vda
2015-11-09 01:42:14 export FSTYP=3Dext4
2015-11-09 01:42:14 export SCRATCH_MNT=3D/fs/scratch
2015-11-09 01:42:14 mkdir /fs/scratch -p
2015-11-09 01:42:14 export SCRATCH_DEV=3D/dev/vdd
2015-11-09 01:42:14 ./check ext4/001 ext4/002 ext4/003 ext4/004 ext4/005 ex=
t4/006 ext4/007 ext4/008 ext4/009 ext4/010 ext4/011 ext4/012 ext4/013 ext4/=
014 ext4/015 ext4/016 ext4/017 ext4/018 ext4/019 ext4/271 ext4/301 ext4/305=
 ext4/306 ext4/307 ext4/308
FSTYP         -- ext4
PLATFORM      -- Linux/x86_64 vm-kbuild-2G-3 4.3.0-rc7-00001-gdfbd72d
MKFS_OPTIONS  -- /dev/vdd
MOUNT_OPTIONS -- -o acl,user_xattr /dev/vdd /fs/scratch

ext4/001	 - output mismatch (see /lkp/benchmarks/xfstests/results//ext4/001=
.out.bad)
    --- tests/ext4/001.out	2015-11-04 17:39:25.000000000 +0800
    +++ /lkp/benchmarks/xfstests/results//ext4/001.out.bad	2015-11-09 01:42=
:55.408281000 +0800
    @@ -131,14 +131,10 @@
     2: [32..39]: hole
     daa100df6e6711906b61c9ab5aa16032
     	11. data -> hole -> data
    -0: [0..7]: data
    -1: [8..31]: unwritten
    -2: [32..39]: data
    +0: [0..39]: data
    ...
    (Run 'diff -u tests/ext4/001.out /lkp/benchmarks/xfstests/results//ext4=
/001.out.bad'  to see the entire diff)
ext4/002	 16s
ext4/003	 17s
ext4/004	 13s
ext4/005	 7s
ext4/006	 [not run] Couldn't find e2fuzz
ext4/007	 [not run] metadata_csum not supported by this filesystem
ext4/008	 [not run] metadata_csum not supported by this filesystem
ext4/009	 [not run] metadata_csum not supported by this filesystem
ext4/010	 [not run] metadata_csum not supported by this filesystem
ext4/011	 [not run] metadata_csum not supported by this filesystem
ext4/012	 [not run] metadata_csum not supported by this filesystem
ext4/013	 [not run] metadata_csum not supported by this filesystem
ext4/014	 [not run] metadata_csum not supported by this filesystem
ext4/015	 [not run] metadata_csum not supported by this filesystem
ext4/016	 [not run] metadata_csum not supported by this filesystem
ext4/017	 [not run] metadata_csum not supported by this filesystem
ext4/018	 [not run] metadata_csum not supported by this filesystem
ext4/019	 [not run] metadata_csum not supported by this filesystem
ext4/271	 17s
ext4/301	 114s
ext4/305	 40s
ext4/306	 18s
ext4/307	 50s
ext4/308	 22s
Ran: ext4/001 ext4/002 ext4/003 ext4/004 ext4/005 ext4/271 ext4/301 ext4/30=
5 ext4/306 ext4/307 ext4/308
Not run: ext4/006 ext4/007 ext4/008 ext4/009 ext4/010 ext4/011 ext4/012 ext=
4/013 ext4/014 ext4/015 ext4/016 ext4/017 ext4/018 ext4/019
Failures: ext4/001
Failed 1 of 11 tests

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

--===============5420305699983750103==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogeGZzdGVzdHMKZGVmYXVsdC1tb25pdG9yczoKICB3YWl0OiBhY3RpdmF0ZS1tb25p
dG9yCiAga21zZzogCiAgdm1zdGF0OgogICAgaW50ZXJ2YWw6IDEwCmRlZmF1bHQtd2F0Y2hkb2dz
OgogIG9vbS1raWxsZXI6IAogIHdhdGNoZG9nOiAKY3B1ZnJlcV9nb3Zlcm5vcjogCm1vZGVsOiBx
ZW11LXN5c3RlbS14ODZfNjQgLWVuYWJsZS1rdm0gLWNwdSBIYXN3ZWxsLCtzbWVwLCtzbWFwCm5y
X3ZtOiAxNgpucl9jcHU6IDIKbWVtb3J5OiAyRwpyb290ZnM6IGRlYmlhbi14ODZfNjQtMjAxNS0w
Mi0wNy5jZ3oKaGRkX3BhcnRpdGlvbnM6ICIvZGV2L3ZkYSAvZGV2L3ZkYiAvZGV2L3ZkYyAvZGV2
L3ZkZCAvZGV2L3ZkZSAvZGV2L3ZkZiIKc3dhcF9wYXJ0aXRpb25zOiAiL2Rldi92ZGciCnNzaF9i
YXNlX3BvcnQ6IDIzMDE2CmNhdGVnb3J5OiBmdW5jdGlvbmFsCmRpc2s6IDRIREQKZnM6IGV4dDQK
eGZzdGVzdHM6CiAgdGVzdDogZXh0NAplbnF1ZXVlX3RpbWU6IDIwMTUtMTEtMDggMDI6MzQ6MjEu
MzM4NjA5NDA5ICswODowMApicmFuY2g6IGxpbnV4LWRldmVsL2RldmVsLWhvdXJseS0yMDE1MTEw
NzAxCmNvbW1pdDogYzkyMzc5YzBhN2JkNjc1OTlhMjEyZjE0OTY1YmQ5YmU0Mjg0ODllMgpxdWV1
ZTogcmFuZApyZXBlYXRfdG86IDIKY29tcGlsZXI6IGdjYy00LjkKdGVzdGJveDogdm0ta2J1aWxk
LTJHLTExCnRib3hfZ3JvdXA6IHZtLWtidWlsZC0yRwprY29uZmlnOiB4ODZfNjQtcmhlbAppZDog
ZWFlZWVhNjg4NmExOGI4M2M5YzcyNDE3Yzk5ZjA5ZTYyODg3NzBkNQp1c2VyOiBsa3AKa2VybmVs
OiAiL3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45L2M5MjM3OWMwYTdiZDY3NTk5YTIxMmYx
NDk2NWJkOWJlNDI4NDg5ZTIvdm1saW51ei00LjMuMC1ib2Nocy12aXJ0aW8tZ3B1LXdsLWF0aC0x
MDczNS1nYzkyMzc5YyIKcmVzdWx0X3Jvb3Q6ICIvcmVzdWx0L3hmc3Rlc3RzLzRIREQtZXh0NC1l
eHQ0L3ZtLWtidWlsZC0yRy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVs
L2djYy00LjkvYzkyMzc5YzBhN2JkNjc1OTlhMjEyZjE0OTY1YmQ5YmU0Mjg0ODllMi8wIgpqb2Jf
ZmlsZTogIi9sa3Avc2NoZWR1bGVkL3ZtLWtidWlsZC0yRy0xMS9yYW5kX3hmc3Rlc3RzLTRIREQt
ZXh0NC1leHQ0LWRlYmlhbi14ODZfNjQuY2d6LXg4Nl82NC1yaGVsLWM5MjM3OWMwYTdiZDY3NTk5
YTIxMmYxNDk2NWJkOWJlNDI4NDg5ZTItMjAxNTExMDgtMjY1OTUtcHAzZ214LTAueWFtbCIKZGVx
dWV1ZV90aW1lOiAyMDE1LTExLTA4IDAyOjM1OjEwLjE5MzgwMDk1NyArMDg6MDAKbWF4X3VwdGlt
ZTogMzYwMAppbml0cmQ6ICIvb3NpbWFnZS9kZWJpYW4vZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3
LmNneiIKYm9vdGxvYWRlcl9hcHBlbmQ6Ci0gcm9vdD0vZGV2L3JhbTAKLSB1c2VyPWxrcAotIGpv
Yj0vbGtwL3NjaGVkdWxlZC92bS1rYnVpbGQtMkctMTEvcmFuZF94ZnN0ZXN0cy00SERELWV4dDQt
ZXh0NC1kZWJpYW4teDg2XzY0LmNnei14ODZfNjQtcmhlbC1jOTIzNzljMGE3YmQ2NzU5OWEyMTJm
MTQ5NjViZDliZTQyODQ4OWUyLTIwMTUxMTA4LTI2NTk1LXBwM2dteC0wLnlhbWwKLSBBUkNIPXg4
Nl82NAotIGtjb25maWc9eDg2XzY0LXJoZWwKLSBicmFuY2g9bGludXgtZGV2ZWwvZGV2ZWwtaG91
cmx5LTIwMTUxMTA3MDEKLSBjb21taXQ9YzkyMzc5YzBhN2JkNjc1OTlhMjEyZjE0OTY1YmQ5YmU0
Mjg0ODllMgotIEJPT1RfSU1BR0U9L3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45L2M5MjM3
OWMwYTdiZDY3NTk5YTIxMmYxNDk2NWJkOWJlNDI4NDg5ZTIvdm1saW51ei00LjMuMC1ib2Nocy12
aXJ0aW8tZ3B1LXdsLWF0aC0xMDczNS1nYzkyMzc5YwotIG1heF91cHRpbWU9MzYwMAotIFJFU1VM
VF9ST09UPS9yZXN1bHQveGZzdGVzdHMvNEhERC1leHQ0LWV4dDQvdm0ta2J1aWxkLTJHL2RlYmlh
bi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwvZ2NjLTQuOS9jOTIzNzljMGE3YmQ2
NzU5OWEyMTJmMTQ5NjViZDliZTQyODQ4OWUyLzAKLSBMS1BfU0VSVkVSPWlubgotIHwyLQoKCiAg
ZWFybHlwcmludGs9dHR5UzAsMTE1MjAwIHN5c3RlbWQubG9nX2xldmVsPWVycgogIGRlYnVnIGFw
aWM9ZGVidWcgc3lzcnFfYWx3YXlzX2VuYWJsZWQgcmN1cGRhdGUucmN1X2NwdV9zdGFsbF90aW1l
b3V0PTEwMAogIHBhbmljPS0xIHNvZnRsb2NrdXBfcGFuaWM9MSBubWlfd2F0Y2hkb2c9cGFuaWMg
b29wcz1wYW5pYyBsb2FkX3JhbWRpc2s9MiBwcm9tcHRfcmFtZGlzaz0wCiAgY29uc29sZT10dHlT
MCwxMTUyMDAgY29uc29sZT10dHkwIHZnYT1ub3JtYWwKCiAgcncKbGtwX2luaXRyZDogIi9sa3Av
bGtwL2xrcC14ODZfNjQuY2d6Igptb2R1bGVzX2luaXRyZDogIi9wa2cvbGludXgveDg2XzY0LXJo
ZWwvZ2NjLTQuOS9jOTIzNzljMGE3YmQ2NzU5OWEyMTJmMTQ5NjViZDliZTQyODQ4OWUyL21vZHVs
ZXMuY2d6IgpibV9pbml0cmQ6ICIvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0w
Ny5jZ3ovbGtwLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ov
cnVuLWlwY29uZmlnLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5j
Z3ovZnMuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ZnN0
ZXN0cy5jZ3osL2xrcC9iZW5jaG1hcmtzL3hmc3Rlc3RzLmNneiIKam9iX3N0YXRlOiBmaW5pc2hl
ZApsb2FkYXZnOiAyLjQ1IDIuOTIgMS42OCAxLzk5IDEzNzI0CnN0YXJ0X3RpbWU6ICcxNDQ2OTIx
NTAxJwplbmRfdGltZTogJzE0NDY5MjE4OTQnCnZlcnNpb246ICIvbGtwL2xrcC8uc3JjLTIwMTUx
MTA2LTE5MDAyMSIK

--===============5420305699983750103==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

bWtmcyAtdCBleHQ0IC1xIC1GIC9kZXYvdmRjCm1rZnMgLXQgZXh0NCAtcSAtRiAvZGV2L3ZkYgpt
a2ZzIC10IGV4dDQgLXEgLUYgL2Rldi92ZGQKbWtmcyAtdCBleHQ0IC1xIC1GIC9kZXYvdmRhCm1v
dW50IC10IGV4dDQgL2Rldi92ZGEgL2ZzL3ZkYQptb3VudCAtdCBleHQ0IC9kZXYvdmRiIC9mcy92
ZGIKbW91bnQgLXQgZXh0NCAvZGV2L3ZkYyAvZnMvdmRjCm1vdW50IC10IGV4dDQgL2Rldi92ZGQg
L2ZzL3ZkZApleHBvcnQgVEVTVF9ESVI9L2ZzL3ZkYQpleHBvcnQgVEVTVF9ERVY9L2Rldi92ZGEK
ZXhwb3J0IEZTVFlQPWV4dDQKZXhwb3J0IFNDUkFUQ0hfTU5UPS9mcy9zY3JhdGNoCm1rZGlyIC9m
cy9zY3JhdGNoIC1wCmV4cG9ydCBTQ1JBVENIX0RFVj0vZGV2L3ZkZAouL2NoZWNrIGV4dDQvMDAx
IGV4dDQvMDAyIGV4dDQvMDAzIGV4dDQvMDA0IGV4dDQvMDA1IGV4dDQvMDA2IGV4dDQvMDA3IGV4
dDQvMDA4IGV4dDQvMDA5IGV4dDQvMDEwIGV4dDQvMDExIGV4dDQvMDEyIGV4dDQvMDEzIGV4dDQv
MDE0IGV4dDQvMDE1IGV4dDQvMDE2IGV4dDQvMDE3IGV4dDQvMDE4IGV4dDQvMDE5IGV4dDQvMjcx
IGV4dDQvMzAxIGV4dDQvMzA1IGV4dDQvMzA2IGV4dDQvMzA3IGV4dDQvMzA4Cg==

--===============5420305699983750103==--

