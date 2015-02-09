Content-Type: multipart/mixed; boundary="===============0517311471489985659=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [kernfs] 2427d387fd2: -1.8% boot-slabinfo.num_objs
Date: Mon, 09 Feb 2015 12:23:44 +0800
Message-ID: <1423455824.5968.51.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0517311471489985659==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
commit 2427d387fd24bc04a5c270161473eaca8239cd39 ("kernfs: convert node name=
 allocation to kstrdup_const")

Some slab memory can be saved with the patch :)

testbox/testcase/testparams: lkp-t410/boot/performance-1

9f5b2beccb0ad113  2427d387fd24bc04a5c2701614  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

      1110 =C2=B1  2%      -8.5%       1016 =C2=B1  5%  boot-meminfo.PageTa=
bles
    144680 =C2=B1  0%      -2.1%     141631 =C2=B1  0%  boot-slabinfo.num_o=
bjs
    107666 =C2=B1  0%      -1.1%     106464 =C2=B1  0%  boot-meminfo.Slab
     26953 =C2=B1  0%      -1.0%      26672 =C2=B1  0%  boot-slabinfo.num_p=
ages

testbox/testcase/testparams: lkp-a03/boot/performance-1

9f5b2beccb0ad113  2427d387fd24bc04a5c2701614  =

----------------  --------------------------  =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

        29 =C2=B1 28%     -60.2%         11 =C2=B1 49%  time.involuntary_co=
ntext_switches
       166 =C2=B1  1%      -2.4%        162 =C2=B1  1%  boot-time.idle
    133976 =C2=B1  0%      -1.8%     131519 =C2=B1  0%  boot-slabinfo.num_o=
bjs

testbox/testcase/testparams: lkp-a04/boot/performance-1

9f5b2beccb0ad113  2427d387fd24bc04a5c2701614  =

----------------  --------------------------  =

    133681 =C2=B1  0%      -1.8%     131309 =C2=B1  0%  boot-slabinfo.num_o=
bjs

lkp-t410: Westmere
Memory: 2G

lkp-a03: Atom
Memory: 8G

lkp-a04: Atom
Memory: 8G


                               boot-slabinfo.num_pages

  27100 ++----------------------------*--*-*------*------------------------=
-+
        |                     .*..*.*         *.*                          =
 |
  27000 ++                  .*                       *.                    =
 |
        | *.. .*     .*.*..*                           *     .*     .*.*..*=
.*
  26900 ++   *  +  .*                                   +  .*  +  .*       =
 |
        |:       *.                                      *.     *.         =
 |
  26800 *+                                                                 =
 |
        |                                                                  =
 |
  26700 ++                               O        O  O O O      O          =
 |
        |               O  O O O  O O O    O  O O           O O            =
 |
  26600 ++                                                                 =
 |
        | O    O                                                           =
 |
  26500 O+   O   O  O O                                                    =
 |
        |                                                                  =
 |
  26400 ++-----------------------------------------------------------------=
-+



        [*] bisect-good sample
        [O] bisect-bad  sample

To reproduce:

        apt-get install ruby ruby-oj
        git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tes=
ts.git
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
Huang, Ying



_______________________________________________
LKP mailing list
LKP(a)linux.intel.com


--===============0517311471489985659==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiBib290CmRlZmF1bHQtbW9uaXRvcnM6IApkZWZhdWx0X3dhdGNoZG9nczoK
ICB3YXRjaC1vb206IAogIHdhdGNoZG9nOiAKY3B1ZnJlcV9nb3Zlcm5vcjogcGVyZm9ybWFuY2UK
bW9kZWw6IFdlc3RtZXJlCm1lbW9yeTogMkcKaGRkX3BhcnRpdGlvbnM6ICIvZGV2L2Rpc2svYnkt
aWQvYXRhLUZVSklUU1VfTUpBMjI1MEJIX0cyX0s5NUNUOUMyRzI5Vy1wYXJ0NiIKc3dhcF9wYXJ0
aXRpb25zOiAKcm9vdGZzX3BhcnRpdGlvbjogIi9kZXYvZGlzay9ieS1pZC9hdGEtRlVKSVRTVV9N
SkEyMjUwQkhfRzJfSzk1Q1Q5QzJHMjlXLXBhcnQ3Igpib290LXNsYWJpbmZvOiAKYm9vdC1tZW1p
bmZvOiAKbWVtbWFwOiAKYm9vdC1tZW1vcnk6IApib290LXRpbWU6IAprZXJuZWwtc2l6ZTogCnNs
ZWVwOiAxCmJyYW5jaDogbmV4dC9tYXN0ZXIKY29tbWl0OiBiNTBjYWRmZmQxNTU3MDhjYmQ4OTBk
MGVlNmNjMzA5YzUxYWYwZjdkCnJlcGVhdF90bzogMQp0ZXN0Ym94OiBsa3AtdDQxMAp0Ym94X2dy
b3VwOiBsa3AtdDQxMAprY29uZmlnOiB4ODZfNjQtbmZzcm9vdAplbnF1ZXVlX3RpbWU6IDIwMTUt
MDItMDQgMTE6NTk6MDcuNjUyODQzNjkwICswODowMAprZXJuZWw6ICIva2VybmVsL3g4Nl82NC1u
ZnNyb290L2I1MGNhZGZmZDE1NTcwOGNiZDg5MGQwZWU2Y2MzMDljNTFhZjBmN2Qvdm1saW51ei0z
LjE5LjAtcmM3LW5leHQtMjAxNTAyMDMtZ2I1MGNhZGYiCnVzZXI6IGxrcApxdWV1ZTogYm9vdApy
b290ZnM6IGRlYmlhbi14ODZfNjQtMjAxNS0wMi0wMi5jZ3oKcmVzdWx0X3Jvb3Q6ICIvcmVzdWx0
L2xrcC10NDEwL2Jvb3QvcGVyZm9ybWFuY2UtMS9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDIuY2d6
L3g4Nl82NC1uZnNyb290L2I1MGNhZGZmZDE1NTcwOGNiZDg5MGQwZWU2Y2MzMDljNTFhZjBmN2Qv
MCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxlZC9sa3AtdDQxMC9ib290X2Jvb3QtcGVyZm9ybWFu
Y2UtMS14ODZfNjQtbmZzcm9vdC1iNTBjYWRmZmQxNTU3MDhjYmQ4OTBkMGVlNmNjMzA5YzUxYWYw
ZjdkLTAueWFtbCIKZGVxdWV1ZV90aW1lOiAyMDE1LTAyLTA0IDEzOjEyOjA4LjU0MTEzODA1OCAr
MDg6MDAKbnJfY3B1OiAiJChucHJvYykiCmpvYl9zdGF0ZTogZmluaXNoZWQKbG9hZGF2ZzogMS4w
NyAwLjM0IDAuMTIgMS8xMjkgMzgzNQpzdGFydF90aW1lOiAnMTQyMzAyNjc3NicKZW5kX3RpbWU6
ICcxNDIzMDI2Nzc3Jwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE1MDIwNC0xMjQ1NTEiCg==

--===============0517311471489985659==--

