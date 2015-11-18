Content-Type: multipart/mixed; boundary="===============4960867631947606823=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [xfs] a45086e27d: -100.0% xfstests.xfs.033.seconds
Date: Wed, 18 Nov 2015 14:57:21 +0800
Message-ID: <87d1v7aj72.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4960867631947606823==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit a45086e27dfa21a4b39134f7505c8f60a3ecdec4 ("xfs: validate metadata LS=
Ns against log on v5 superblocks")

2015-11-17 05:11:29 export TEST_DIR=3D/fs/sdd1
2015-11-17 05:11:29 export TEST_DEV=3D/dev/sdd1
2015-11-17 05:11:29 export FSTYP=3Dxfs
2015-11-17 05:11:29 export SCRATCH_MNT=3D/fs/scratch
2015-11-17 05:11:29 mkdir /fs/scratch -p
2015-11-17 05:11:29 export SCRATCH_DEV=3D/dev/sdg1
2015-11-17 05:11:29 export SCRATCH_LOGDEV=3D/dev/sdh1
2015-11-17 05:11:29 ./check xfs/004 xfs/010 xfs/011 xfs/013 xfs/017 xfs/020=
 xfs/026 xfs/027 xfs/028 xfs/031 xfs/032 xfs/033 xfs/041 xfs/042 xfs/046 xf=
s/047 xfs/049 xfs/050 xfs/054 xfs/056 xfs/059 xfs/060 xfs/061 xfs/063 xfs/0=
64 xfs/065 xfs/066 xfs/068 xfs/073 xfs/076
FSTYP         -- xfs (non-debug)
PLATFORM      -- Linux/x86_64 lkp-ws02 4.3.0-rc2-00002-ga45086e
MKFS_OPTIONS  -- -f -bsize=3D4096 /dev/sdg1
MOUNT_OPTIONS -- /dev/sdg1 /fs/scratch

xfs/004	 3s
xfs/010	 13s
xfs/011	 19s
xfs/013	 318s
xfs/017	 15s
xfs/020	 82s
xfs/026	 14s
xfs/027	 15s
xfs/028	 25s
xfs/031	 58s
xfs/032	 14s
xfs/033	 - output mismatch (see /lkp/benchmarks/xfstests/results//xfs/033.o=
ut.bad)
    --- tests/xfs/033.out	2015-11-12 16:56:51.000000000 +0800
    +++ /lkp/benchmarks/xfstests/results//xfs/033.out.bad	2015-11-17 05:21:=
38.091589526 +0800
    @@ -38,7 +38,19 @@
     Phase 7 - verify and correct link counts...
     resetting inode INO nlinks from 1 to 2
     done
    +mount: wrong fs type, bad option, bad superblock on /dev/sdg1,
    +       missing codepage or helper program, or other error
    +
    +       In some cases useful info is found in syslog - try
    ...
    (Run 'diff -u tests/xfs/033.out /lkp/benchmarks/xfstests/results//xfs/0=
33.out.bad'  to see the entire diff)
xfs/041	 18s
xfs/042	 14s
xfs/046	 15s
xfs/047	 25s
xfs/049	 48s
xfs/050	 23s
xfs/054	 15s
xfs/056	 14s
xfs/059	 18s
xfs/060	 16s
xfs/061	 14s
xfs/063	 14s
xfs/064	 228s
xfs/065	 35s
xfs/066	 28s
xfs/068	 25s
xfs/073	 16s
xfs/076	 53s
Ran: xfs/004 xfs/010 xfs/011 xfs/013 xfs/017 xfs/020 xfs/026 xfs/027 xfs/02=
8 xfs/031 xfs/032 xfs/033 xfs/041 xfs/042 xfs/046 xfs/047 xfs/049 xfs/050 x=
fs/054 xfs/056 xfs/059 xfs/060 xfs/061 xfs/063 xfs/064 xfs/065 xfs/066 xfs/=
068 xfs/073 xfs/076
Failures: xfs/033
Failed 1 of 30 tests


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/disk/fs/test:
  lkp-ws02/xfstests/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/4HDD/x=
fs/xfs-mid1

commit: =

  b7cdc66be54b64daef593894d12ecc405f117829
  a45086e27dfa21a4b39134f7505c8f60a3ecdec4

b7cdc66be54b64da a45086e27dfa21a4b39134f750 =

---------------- -------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

           :4          100%           4:4     last_state.xfstests.exit_code=
.1
           :4          100%           4:4     xfstests.nr_fail
           :4          100%           4:4     xfstests.xfs.033.fail
           :4           25%           1:4     kmsg.XFS(loop0):Filesystem_ha=
s_duplicate_UUID#-#-#f7b-b747-f26a6b2b589b-can't_mount
           :4           25%           1:4     kmsg.XFS(loop0):Filesystem_ha=
s_duplicate_UUID#-#c55-#af8-a93b-#c6382174ba-can't_mount
          1:4          -25%            :4     kmsg.XFS(loop0):Filesystem_ha=
s_duplicate_UUID#-#d5c-#dd8-#c4c-#b9758dd7946-can't_mount
          1:4          -25%            :4     kmsg.XFS(loop0):Filesystem_ha=
s_duplicate_UUID#-#d8b-#bd0-bd22-be703a050d73-can't_mount
           :4           25%           1:4     kmsg.XFS(loop0):Filesystem_ha=
s_duplicate_UUID#-#e49-#-#f14-c1f5b7a39914-can't_mount
           :4           25%           1:4     kmsg.XFS(loop0):Filesystem_ha=
s_duplicate_UUID#-#f2c-#ba-#-#a8309204098-can't_mount
          1:4          -25%            :4     kmsg.XFS(loop0):Filesystem_ha=
s_duplicate_UUID#-#f88-#-a30c-f7972224a2c2-can't_mount
          1:4          -25%            :4     kmsg.XFS(loop0):Filesystem_ha=
s_duplicate_UUID#-a0f8-#-b678-a0e21fca1aea-can't_mount
           :4          100%           4:4     kmsg.XFS(sdg1):log_mount/reco=
very_failed:error

lkp-ws02: Westmere-EP
Memory: 16G

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

--===============4960867631947606823==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogeGZzdGVzdHMKZGVmYXVsdC1tb25pdG9yczoKICB3YWl0OiBhY3RpdmF0ZS1tb25p
dG9yCiAga21zZzogCiAgdm1zdGF0OgogICAgaW50ZXJ2YWw6IDEwCmRlZmF1bHQtd2F0Y2hkb2dz
OgogIG9vbS1raWxsZXI6IAogIHdhdGNoZG9nOiAKY29tbWl0OiA5NmEyZjIxNjJkZWI5Nzc2MGE0
NGFkODU1OGUzNzQzNDIyNjBjZWU2Cm1vZGVsOiBXZXN0bWVyZS1FUAptZW1vcnk6IDE2Rwpucl9o
ZGRfcGFydGl0aW9uczogMTEKaGRkX3BhcnRpdGlvbnM6ICIvZGV2L2Rpc2svYnktaWQvc2NzaS0z
NTAwMGM1MDAqLXBhcnQxIgpzd2FwX3BhcnRpdGlvbnM6IApyb290ZnNfcGFydGl0aW9uOiAiL2Rl
di9kaXNrL2J5LWlkL2F0YS1XRENfV0QxMDAyRkFFWC0wMFozQTBfV0QtV0NBVFI1NDA4NTY0LXBh
cnQzIgpjcHVmcmVxX2dvdmVybm9yOiAKY2F0ZWdvcnk6IGZ1bmN0aW9uYWwKZGlzazogNEhERApm
czogeGZzCnhmc3Rlc3RzOgogIHRlc3Q6IHhmcy1taWQxCnF1ZXVlOiBjeWNsaWMKdGVzdGJveDog
bGtwLXdzMDIKdGJveF9ncm91cDogbGtwLXdzMDIKa2NvbmZpZzogeDg2XzY0LXJoZWwKZW5xdWV1
ZV90aW1lOiAyMDE1LTExLTE0IDA5OjM1OjQwLjk5OTI1NzQzMCArMDg6MDAKaWQ6IDM3ZGYzYTU0
YmNlZDhhNjljOGRhZjdjOTliZmZmNDRkOTkwNjIyZTcKdXNlcjogbGtwCmNvbXBpbGVyOiBnY2Mt
NC45CmhlYWRfY29tbWl0OiA5NmEyZjIxNjJkZWI5Nzc2MGE0NGFkODU1OGUzNzQzNDIyNjBjZWU2
CmJhc2VfY29tbWl0OiA2YTEzZmViOWM4MjgwM2UyYjgxNWVjYTcyZmE3YTlmNTU2MWQ3ODYxCmJy
YW5jaDogbGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTUxMTE0MTAKa2VybmVsOiAiL3BrZy9s
aW51eC94ODZfNjQtcmhlbC9nY2MtNC45Lzk2YTJmMjE2MmRlYjk3NzYwYTQ0YWQ4NTU4ZTM3NDM0
MjI2MGNlZTYvdm1saW51ei00LjMuMC1ib2Nocy12aXJ0aW8tZ3B1LXdsLWF0aC0xNjcxOS1nOTZh
MmYyMSIKcm9vdGZzOiBkZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6CnJlc3VsdF9yb290OiAi
L3Jlc3VsdC94ZnN0ZXN0cy80SERELXhmcy14ZnMtbWlkMS9sa3Atd3MwMi9kZWJpYW4teDg2XzY0
LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2djYy00LjkvOTZhMmYyMTYyZGViOTc3NjBhNDRh
ZDg1NThlMzc0MzQyMjYwY2VlNi8wIgpqb2JfZmlsZTogIi9sa3Avc2NoZWR1bGVkL2xrcC13czAy
L2N5Y2xpY194ZnN0ZXN0cy00SERELXhmcy14ZnMtbWlkMS14ODZfNjQtcmhlbC1DWUNMSUNfSEVB
RC05NmEyZjIxNjJkZWI5Nzc2MGE0NGFkODU1OGUzNzQzNDIyNjBjZWU2LTIwMTUxMTE0LTc1OTAy
LTFmampkZXAtMC55YW1sIgpkZXF1ZXVlX3RpbWU6IDIwMTUtMTEtMTQgMTI6NDk6MTguNTkwMTYx
NDIxICswODowMApucl9jcHU6ICIkKG5wcm9jKSIKbWF4X3VwdGltZTogMzYwMAppbml0cmQ6ICIv
b3NpbWFnZS9kZWJpYW4vZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNneiIKYm9vdGxvYWRlcl9h
cHBlbmQ6Ci0gcm9vdD0vZGV2L3JhbTAKLSB1c2VyPWxrcAotIGpvYj0vbGtwL3NjaGVkdWxlZC9s
a3Atd3MwMi9jeWNsaWNfeGZzdGVzdHMtNEhERC14ZnMteGZzLW1pZDEteDg2XzY0LXJoZWwtQ1lD
TElDX0hFQUQtOTZhMmYyMTYyZGViOTc3NjBhNDRhZDg1NThlMzc0MzQyMjYwY2VlNi0yMDE1MTEx
NC03NTkwMi0xZmpqZGVwLTAueWFtbAotIEFSQ0g9eDg2XzY0Ci0ga2NvbmZpZz14ODZfNjQtcmhl
bAotIGJyYW5jaD1saW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNTExMTQxMAotIGNvbW1pdD05
NmEyZjIxNjJkZWI5Nzc2MGE0NGFkODU1OGUzNzQzNDIyNjBjZWU2Ci0gQk9PVF9JTUFHRT0vcGtn
L2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvOTZhMmYyMTYyZGViOTc3NjBhNDRhZDg1NThlMzc0
MzQyMjYwY2VlNi92bWxpbnV6LTQuMy4wLWJvY2hzLXZpcnRpby1ncHUtd2wtYXRoLTE2NzE5LWc5
NmEyZjIxCi0gbWF4X3VwdGltZT0zNjAwCi0gUkVTVUxUX1JPT1Q9L3Jlc3VsdC94ZnN0ZXN0cy80
SERELXhmcy14ZnMtbWlkMS9sa3Atd3MwMi9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4
Nl82NC1yaGVsL2djYy00LjkvOTZhMmYyMTYyZGViOTc3NjBhNDRhZDg1NThlMzc0MzQyMjYwY2Vl
Ni8wCi0gTEtQX1NFUlZFUj1pbm4KLSB8LQogIGlwbWlfd2F0Y2hkb2cuc3RhcnRfbm93PTEKCiAg
ZWFybHlwcmludGs9dHR5UzAsMTE1MjAwIHN5c3RlbWQubG9nX2xldmVsPWVycgogIGRlYnVnIGFw
aWM9ZGVidWcgc3lzcnFfYWx3YXlzX2VuYWJsZWQgcmN1cGRhdGUucmN1X2NwdV9zdGFsbF90aW1l
b3V0PTEwMAogIHBhbmljPS0xIHNvZnRsb2NrdXBfcGFuaWM9MSBubWlfd2F0Y2hkb2c9cGFuaWMg
b29wcz1wYW5pYyBsb2FkX3JhbWRpc2s9MiBwcm9tcHRfcmFtZGlzaz0wCiAgY29uc29sZT10dHlT
MCwxMTUyMDAgY29uc29sZT10dHkwIHZnYT1ub3JtYWwKCiAgcncKbGtwX2luaXRyZDogIi9sa3Av
bGtwL2xrcC14ODZfNjQuY2d6Igptb2R1bGVzX2luaXRyZDogIi9wa2cvbGludXgveDg2XzY0LXJo
ZWwvZ2NjLTQuOS85NmEyZjIxNjJkZWI5Nzc2MGE0NGFkODU1OGUzNzQzNDIyNjBjZWU2L21vZHVs
ZXMuY2d6IgpibV9pbml0cmQ6ICIvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0w
Ny5jZ3ovbGtwLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ov
cnVuLWlwY29uZmlnLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5j
Z3ovZnMuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ZnN0
ZXN0cy5jZ3osL2xrcC9iZW5jaG1hcmtzL3hmc3Rlc3RzLmNneiIKam9iX3N0YXRlOiBmaW5pc2hl
ZApsb2FkYXZnOiAwLjY2IDAuNzIgMC41NiAxLzM1MCAyNjQ2NQpzdGFydF90aW1lOiAnMTQ0NzQ3
NjY0NycKZW5kX3RpbWU6ICcxNDQ3NDc3NDg2Jwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE1
MTExMy0xODA1MjYiCg==

--===============4960867631947606823==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

bWtmcyAtdCB4ZnMgL2Rldi9zZGQxCm1rZnMgLXQgeGZzIC9kZXYvc2RrMQpta2ZzIC10IHhmcyAv
ZGV2L3NkZzEKbWtmcyAtdCB4ZnMgL2Rldi9zZGgxCm1vdW50IC10IHhmcyAtbyBub2JhcnJpZXIs
aW5vZGU2NCAvZGV2L3NkZDEgL2ZzL3NkZDEKbW91bnQgLXQgeGZzIC1vIG5vYmFycmllcixpbm9k
ZTY0IC9kZXYvc2RoMSAvZnMvc2RoMQptb3VudCAtdCB4ZnMgLW8gbm9iYXJyaWVyLGlub2RlNjQg
L2Rldi9zZGsxIC9mcy9zZGsxCm1vdW50IC10IHhmcyAtbyBub2JhcnJpZXIsaW5vZGU2NCAvZGV2
L3NkZzEgL2ZzL3NkZzEKZXhwb3J0IFRFU1RfRElSPS9mcy9zZGQxCmV4cG9ydCBURVNUX0RFVj0v
ZGV2L3NkZDEKZXhwb3J0IEZTVFlQPXhmcwpleHBvcnQgU0NSQVRDSF9NTlQ9L2ZzL3NjcmF0Y2gK
bWtkaXIgL2ZzL3NjcmF0Y2ggLXAKZXhwb3J0IFNDUkFUQ0hfREVWPS9kZXYvc2RnMQpleHBvcnQg
U0NSQVRDSF9MT0dERVY9L2Rldi9zZGgxCi4vY2hlY2sgeGZzLzAwNCB4ZnMvMDEwIHhmcy8wMTEg
eGZzLzAxMyB4ZnMvMDE3IHhmcy8wMjAgeGZzLzAyNiB4ZnMvMDI3IHhmcy8wMjggeGZzLzAzMSB4
ZnMvMDMyIHhmcy8wMzMgeGZzLzA0MSB4ZnMvMDQyIHhmcy8wNDYgeGZzLzA0NyB4ZnMvMDQ5IHhm
cy8wNTAgeGZzLzA1NCB4ZnMvMDU2IHhmcy8wNTkgeGZzLzA2MCB4ZnMvMDYxIHhmcy8wNjMgeGZz
LzA2NCB4ZnMvMDY1IHhmcy8wNjYgeGZzLzA2OCB4ZnMvMDczIHhmcy8wNzYK

--===============4960867631947606823==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="xfstests.obj"

MjAxNS0xMS0xNyAwNToxMToyOSBleHBvcnQgVEVTVF9ESVI9L2ZzL3NkZDEKMjAxNS0xMS0xNyAw
NToxMToyOSBleHBvcnQgVEVTVF9ERVY9L2Rldi9zZGQxCjIwMTUtMTEtMTcgMDU6MTE6MjkgZXhw
b3J0IEZTVFlQPXhmcwoyMDE1LTExLTE3IDA1OjExOjI5IGV4cG9ydCBTQ1JBVENIX01OVD0vZnMv
c2NyYXRjaAoyMDE1LTExLTE3IDA1OjExOjI5IG1rZGlyIC9mcy9zY3JhdGNoIC1wCjIwMTUtMTEt
MTcgMDU6MTE6MjkgZXhwb3J0IFNDUkFUQ0hfREVWPS9kZXYvc2RnMQoyMDE1LTExLTE3IDA1OjEx
OjI5IGV4cG9ydCBTQ1JBVENIX0xPR0RFVj0vZGV2L3NkaDEKMjAxNS0xMS0xNyAwNToxMToyOSAu
L2NoZWNrIHhmcy8wMDQgeGZzLzAxMCB4ZnMvMDExIHhmcy8wMTMgeGZzLzAxNyB4ZnMvMDIwIHhm
cy8wMjYgeGZzLzAyNyB4ZnMvMDI4IHhmcy8wMzEgeGZzLzAzMiB4ZnMvMDMzIHhmcy8wNDEgeGZz
LzA0MiB4ZnMvMDQ2IHhmcy8wNDcgeGZzLzA0OSB4ZnMvMDUwIHhmcy8wNTQgeGZzLzA1NiB4ZnMv
MDU5IHhmcy8wNjAgeGZzLzA2MSB4ZnMvMDYzIHhmcy8wNjQgeGZzLzA2NSB4ZnMvMDY2IHhmcy8w
NjggeGZzLzA3MyB4ZnMvMDc2CkZTVFlQICAgICAgICAgLS0geGZzIChub24tZGVidWcpClBMQVRG
T1JNICAgICAgLS0gTGludXgveDg2XzY0IGxrcC13czAyIDQuMy4wLXJjMi0wMDAwMi1nYTQ1MDg2
ZQpNS0ZTX09QVElPTlMgIC0tIC1mIC1ic2l6ZT00MDk2IC9kZXYvc2RnMQpNT1VOVF9PUFRJT05T
IC0tIC9kZXYvc2RnMSAvZnMvc2NyYXRjaAoKeGZzLzAwNAkgM3MKeGZzLzAxMAkgMTNzCnhmcy8w
MTEJIDE5cwp4ZnMvMDEzCSAzMThzCnhmcy8wMTcJIDE1cwp4ZnMvMDIwCSA4MnMKeGZzLzAyNgkg
MTRzCnhmcy8wMjcJIDE1cwp4ZnMvMDI4CSAyNXMKeGZzLzAzMQkgNThzCnhmcy8wMzIJIDE0cwp4
ZnMvMDMzCSAtIG91dHB1dCBtaXNtYXRjaCAoc2VlIC9sa3AvYmVuY2htYXJrcy94ZnN0ZXN0cy9y
ZXN1bHRzLy94ZnMvMDMzLm91dC5iYWQpCiAgICAtLS0gdGVzdHMveGZzLzAzMy5vdXQJMjAxNS0x
MS0xMiAxNjo1Njo1MS4wMDAwMDAwMDAgKzA4MDAKICAgICsrKyAvbGtwL2JlbmNobWFya3MveGZz
dGVzdHMvcmVzdWx0cy8veGZzLzAzMy5vdXQuYmFkCTIwMTUtMTEtMTcgMDU6MjE6MzguMDkxNTg5
NTI2ICswODAwCiAgICBAQCAtMzgsNyArMzgsMTkgQEAKICAgICBQaGFzZSA3IC0gdmVyaWZ5IGFu
ZCBjb3JyZWN0IGxpbmsgY291bnRzLi4uCiAgICAgcmVzZXR0aW5nIGlub2RlIElOTyBubGlua3Mg
ZnJvbSAxIHRvIDIKICAgICBkb25lCiAgICArbW91bnQ6IHdyb25nIGZzIHR5cGUsIGJhZCBvcHRp
b24sIGJhZCBzdXBlcmJsb2NrIG9uIC9kZXYvc2RnMSwKICAgICsgICAgICAgbWlzc2luZyBjb2Rl
cGFnZSBvciBoZWxwZXIgcHJvZ3JhbSwgb3Igb3RoZXIgZXJyb3IKICAgICsKICAgICsgICAgICAg
SW4gc29tZSBjYXNlcyB1c2VmdWwgaW5mbyBpcyBmb3VuZCBpbiBzeXNsb2cgLSB0cnkKICAgIC4u
LgogICAgKFJ1biAnZGlmZiAtdSB0ZXN0cy94ZnMvMDMzLm91dCAvbGtwL2JlbmNobWFya3MveGZz
dGVzdHMvcmVzdWx0cy8veGZzLzAzMy5vdXQuYmFkJyAgdG8gc2VlIHRoZSBlbnRpcmUgZGlmZikK
eGZzLzA0MQkgMThzCnhmcy8wNDIJIDE0cwp4ZnMvMDQ2CSAxNXMKeGZzLzA0NwkgMjVzCnhmcy8w
NDkJIDQ4cwp4ZnMvMDUwCSAyM3MKeGZzLzA1NAkgMTVzCnhmcy8wNTYJIDE0cwp4ZnMvMDU5CSAx
OHMKeGZzLzA2MAkgMTZzCnhmcy8wNjEJIDE0cwp4ZnMvMDYzCSAxNHMKeGZzLzA2NAkgMjI4cwp4
ZnMvMDY1CSAzNXMKeGZzLzA2NgkgMjhzCnhmcy8wNjgJIDI1cwp4ZnMvMDczCSAxNnMKeGZzLzA3
NgkgNTNzClJhbjogeGZzLzAwNCB4ZnMvMDEwIHhmcy8wMTEgeGZzLzAxMyB4ZnMvMDE3IHhmcy8w
MjAgeGZzLzAyNiB4ZnMvMDI3IHhmcy8wMjggeGZzLzAzMSB4ZnMvMDMyIHhmcy8wMzMgeGZzLzA0
MSB4ZnMvMDQyIHhmcy8wNDYgeGZzLzA0NyB4ZnMvMDQ5IHhmcy8wNTAgeGZzLzA1NCB4ZnMvMDU2
IHhmcy8wNTkgeGZzLzA2MCB4ZnMvMDYxIHhmcy8wNjMgeGZzLzA2NCB4ZnMvMDY1IHhmcy8wNjYg
eGZzLzA2OCB4ZnMvMDczIHhmcy8wNzYKRmFpbHVyZXM6IHhmcy8wMzMKRmFpbGVkIDEgb2YgMzAg
dGVzdHMKCg==

--===============4960867631947606823==--

