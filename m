Content-Type: multipart/mixed; boundary="===============6982926829759742088=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [ACPI] 73a092e801: cannot_create/sys/devices/system/cpu/cpu*/cpufreq/scaling_governor:Directory_nonexistent
Date: Thu, 17 Sep 2015 10:55:58 +0800
Message-ID: <87r3lxg3ep.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6982926829759742088==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://linux-arm.org/linux-skn acpi_lpi
commit 73a092e801e9938496b71acc9434fb33a9d65d34 ("ACPI: tables: simplify ac=
pi_parse_entries")

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/ip/runtime/nr_=
threads/cluster/test:
  lkp-nex04/netperf/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/perfor=
mance/ipv4/300s/200%/cs-localhost/UDP_RR

commit: =

  34f6273d2bb1ddd7da4f9fe4babc78b0a60ad71f
  73a092e801e9938496b71acc9434fb33a9d65d34

34f6273d2bb1ddd7 73a092e801e9938496b71acc94 =

---------------- -------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

           :10         100%          10:10    stderr./lkp/lkp/src/setup/cpu=
freq_governor:#:/lkp/lkp/src/setup/cpufreq_governor:cannot_create/sys/devic=
es/system/cpu/cpu*/cpufreq/scaling_governor:Directory_nonexistent
           :10         100%          10:10    last_state.cpufreq_governor.e=
xit_code.2
           :10         100%          10:10    last_state.exit_fail
           :10         100%          10:10    last_state.is_incomplete_run


lkp-nex04: Nehalem-EX
Memory: 256G


In short, the cpufrequ_governor sysfs interface is not available after
your commit.  Caused ACPI cpufreq driver to stop working?

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

--===============6982926829759742088==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogbmV0cGVyZgpkZWZhdWx0LW1vbml0b3JzOgogIHdhaXQ6IGFjdGl2YXRlLW1vbml0
b3IKICBrbXNnOiAKICB1cHRpbWU6IAogIGlvc3RhdDogCiAgdm1zdGF0OiAKICBudW1hLW51bWFz
dGF0OiAKICBudW1hLXZtc3RhdDogCiAgbnVtYS1tZW1pbmZvOiAKICBwcm9jLXZtc3RhdDogCiAg
cHJvYy1zdGF0OgogICAgaW50ZXJ2YWw6IDEwCiAgbWVtaW5mbzogCiAgc2xhYmluZm86IAogIGlu
dGVycnVwdHM6IAogIGxvY2tfc3RhdDogCiAgbGF0ZW5jeV9zdGF0czogCiAgc29mdGlycXM6IAog
IGJkaV9kZXZfbWFwcGluZzogCiAgZGlza3N0YXRzOiAKICBuZnNzdGF0OiAKICBjcHVpZGxlOiAK
ICBjcHVmcmVxLXN0YXRzOiAKICB0dXJib3N0YXQ6IAogIHBtZXRlcjogCiAgc2NoZWRfZGVidWc6
CiAgICBpbnRlcnZhbDogNjAKY3B1ZnJlcV9nb3Zlcm5vcjogcGVyZm9ybWFuY2UKZGVmYXVsdC13
YXRjaGRvZ3M6CiAgb29tLWtpbGxlcjogCiAgd2F0Y2hkb2c6IApjb21taXQ6IDk1NjhkZGJhNDY3
NTEwMzU2MGY3OGUxNTI1ZDRkNjA1ZTFkODczMTEKbW9kZWw6IE5laGFsZW0tRVgKbWVtb3J5OiAy
NTZHCm5yX2NwdTogNjQKbnJfc3NkX3BhcnRpdGlvbnM6IDYKc3NkX3BhcnRpdGlvbnM6ICIvZGV2
L2Rpc2svYnktaWQvYXRhLVdEQ19XRDEwRUFSUy0wMFk1QjFfV0QtV0NBVjVGMDU5MDc0LXBhcnQx
Igpzd2FwX3BhcnRpdGlvbnM6ICIvZGV2L2Rpc2svYnktaWQvYXRhLVdEQ19XRDEwRUFSUy0wMFk1
QjFfV0QtV0NBVjVGMDU5MDc0LXBhcnQyIgpjYXRlZ29yeTogYmVuY2htYXJrCmlwOiBpcHY0CnJ1
bnRpbWU6IDMwMHMKbnJfdGhyZWFkczogMjAwJQpwZXJmLXByb2ZpbGU6CiAgZnJlcTogODAwCmNs
dXN0ZXI6IGNzLWxvY2FsaG9zdAppZiByb2xlIHNlcnZlcjoKICBuZXRzZXJ2ZXI6IAppZiByb2xl
IGNsaWVudDoKICBuZXRwZXJmOgogICAgdGVzdDogVURQX1JSCnF1ZXVlOiBjeWNsaWMKdGVzdGJv
eDogbGtwLW5leDA0CnRib3hfZ3JvdXA6IGxrcC1uZXgwNAprY29uZmlnOiB4ODZfNjQtcmhlbApl
bnF1ZXVlX3RpbWU6IDIwMTUtMDktMTUgMjA6NDk6NTIuMzE1MTk3MDUwICswODowMAppZDogNGQx
YjQ1ZDQzOWRhMDU3MGIyMzdkMmFhM2NhZTgzNGMyNTNhNmJiZAp1c2VyOiBsa3AKY29tcGlsZXI6
IGdjYy00LjkKaGVhZF9jb21taXQ6IDk1NjhkZGJhNDY3NTEwMzU2MGY3OGUxNTI1ZDRkNjA1ZTFk
ODczMTEKYmFzZV9jb21taXQ6IDZmZjMzZjM5MDJjM2IxYzVkMGRiNmIxZTJjNzBiNmQ3NmZiYTM1
N2YKYnJhbmNoOiBsaW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNTA5MTYwMwprZXJuZWw6ICIv
cGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvOTU2OGRkYmE0Njc1MTAzNTYwZjc4ZTE1MjVk
NGQ2MDVlMWQ4NzMxMS92bWxpbnV6LTQuMy4wLXJjMS13bC1hdGgtMDA5NzAtZzk1NjhkZGIiCnJv
b3RmczogZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnegpub2RlX3JvbGVzOiBzZXJ2ZXIgY2xp
ZW50CnJlc3VsdF9yb290OiAiL3Jlc3VsdC9uZXRwZXJmL3BlcmZvcm1hbmNlLWlwdjQtMzAwcy0y
MDAlLWNzLWxvY2FsaG9zdC1VRFBfUlIvbGtwLW5leDA0L2RlYmlhbi14ODZfNjQtMjAxNS0wMi0w
Ny5jZ3oveDg2XzY0LXJoZWwvZ2NjLTQuOS85NTY4ZGRiYTQ2NzUxMDM1NjBmNzhlMTUyNWQ0ZDYw
NWUxZDg3MzExLzAiCmpvYl9maWxlOiAiL2xrcC9zY2hlZHVsZWQvbGtwLW5leDA0L2N5Y2xpY19u
ZXRwZXJmLXBlcmZvcm1hbmNlLWlwdjQtMzAwcy0yMDAlLWNzLWxvY2FsaG9zdC1VRFBfUlIteDg2
XzY0LXJoZWwtQ1lDTElDX0hFQUQtOTU2OGRkYmE0Njc1MTAzNTYwZjc4ZTE1MjVkNGQ2MDVlMWQ4
NzMxMS0yMDE1MDkxNS04MzU0Mi1kYTR6cHYtMC55YW1sIgpkZXF1ZXVlX3RpbWU6IDIwMTUtMDkt
MTYgMDM6NTE6MjQuNTU1NjgzNDA2ICswODowMAptYXhfdXB0aW1lOiAxNTAwCmluaXRyZDogIi9v
c2ltYWdlL2RlYmlhbi9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6Igpib290bG9hZGVyX2Fw
cGVuZDoKLSByb290PS9kZXYvcmFtMAotIHVzZXI9bGtwCi0gam9iPS9sa3Avc2NoZWR1bGVkL2xr
cC1uZXgwNC9jeWNsaWNfbmV0cGVyZi1wZXJmb3JtYW5jZS1pcHY0LTMwMHMtMjAwJS1jcy1sb2Nh
bGhvc3QtVURQX1JSLXg4Nl82NC1yaGVsLUNZQ0xJQ19IRUFELTk1NjhkZGJhNDY3NTEwMzU2MGY3
OGUxNTI1ZDRkNjA1ZTFkODczMTEtMjAxNTA5MTUtODM1NDItZGE0enB2LTAueWFtbAotIEFSQ0g9
eDg2XzY0Ci0ga2NvbmZpZz14ODZfNjQtcmhlbAotIGJyYW5jaD1saW51eC1kZXZlbC9kZXZlbC1o
b3VybHktMjAxNTA5MTYwMwotIGNvbW1pdD05NTY4ZGRiYTQ2NzUxMDM1NjBmNzhlMTUyNWQ0ZDYw
NWUxZDg3MzExCi0gQk9PVF9JTUFHRT0vcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvOTU2
OGRkYmE0Njc1MTAzNTYwZjc4ZTE1MjVkNGQ2MDVlMWQ4NzMxMS92bWxpbnV6LTQuMy4wLXJjMS13
bC1hdGgtMDA5NzAtZzk1NjhkZGIKLSBtYXhfdXB0aW1lPTE1MDAKLSBSRVNVTFRfUk9PVD0vcmVz
dWx0L25ldHBlcmYvcGVyZm9ybWFuY2UtaXB2NC0zMDBzLTIwMCUtY3MtbG9jYWxob3N0LVVEUF9S
Ui9sa3AtbmV4MDQvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2Mt
NC45Lzk1NjhkZGJhNDY3NTEwMzU2MGY3OGUxNTI1ZDRkNjA1ZTFkODczMTEvMAotIExLUF9TRVJW
RVI9aW5uCi0gfDItCgoKICBlYXJseXByaW50az10dHlTMCwxMTUyMDAgc3lzdGVtZC5sb2dfbGV2
ZWw9ZXJyCiAgZGVidWcgYXBpYz1kZWJ1ZyBzeXNycV9hbHdheXNfZW5hYmxlZCByY3VwZGF0ZS5y
Y3VfY3B1X3N0YWxsX3RpbWVvdXQ9MTAwCiAgcGFuaWM9LTEgc29mdGxvY2t1cF9wYW5pYz0xIG5t
aV93YXRjaGRvZz1wYW5pYyBvb3BzPXBhbmljIGxvYWRfcmFtZGlzaz0yIHByb21wdF9yYW1kaXNr
PTAKICBjb25zb2xlPXR0eVMwLDExNTIwMCBjb25zb2xlPXR0eTAgdmdhPW5vcm1hbAoKICBydwps
a3BfaW5pdHJkOiAiL2xrcC9sa3AvbGtwLXg4Nl82NC5jZ3oiCm1vZHVsZXNfaW5pdHJkOiAiL3Br
Zy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45Lzk1NjhkZGJhNDY3NTEwMzU2MGY3OGUxNTI1ZDRk
NjA1ZTFkODczMTEvbW9kdWxlcy5jZ3oiCmJtX2luaXRyZDogIi9vc2ltYWdlL2RlcHMvZGViaWFu
LXg4Nl82NC0yMDE1LTAyLTA3LmNnei9sa3AuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82
NC0yMDE1LTAyLTA3LmNnei9ydW4taXBjb25maWcuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4
Nl82NC0yMDE1LTAyLTA3LmNnei90dXJib3N0YXQuY2d6LC9sa3AvYmVuY2htYXJrcy90dXJib3N0
YXQuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9uZXRwZXJm
LmNneiwvbGtwL2JlbmNobWFya3MvbmV0cGVyZi5jZ3oiCmpvYl9zdGF0ZTogZmluaXNoZWQKbG9h
ZGF2ZzogMS42MyAwLjM2IDAuMTIgMS8xMzMgNDg3CnN0YXJ0X3RpbWU6ICcnCmVuZF90aW1lOiAn
MTQ0MjM0NjczNicKdmVyc2lvbjogIi9sa3AvbGtwLy5zcmMtMjAxNTA5MTUtMjM1MTU5Igo=

--===============6982926829759742088==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdSovY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCg==

--===============6982926829759742088==--

