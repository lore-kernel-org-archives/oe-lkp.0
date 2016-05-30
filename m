Content-Type: multipart/mixed; boundary="===============2271808791469793440=="
MIME-Version: 1.0
From: kernel test robot <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: [mm] 55834c5909: boot-slabinfo.num_objs +31.9% increasement
Date: Mon, 30 May 2016 10:17:58 +0800
Message-ID: <20160530021758.GG1689@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============2271808791469793440==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


FYI, we noticed boot-slabinfo.num_objs +31.9% increasement due to commit:

commit 55834c59098d0c5a97b0f3247e55832b67facdcf ("mm: kasan: initial memory=
 quarantine implementation")
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

in testcase: boot
on test machine: vm-lkp-wsx03-2G: 2 threads qemu-system-x86_64 -enable-kvm =
-cpu host with 2G memory
with following parameters: sleep=3D1


Details are as below:
---------------------------------------------------------------------------=
----------------------->


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/sleep/tbox_group/testcase:
  gcc-6/x86_64-randconfig-s4-05280557/debian-x86_64-2015-02-07.cgz/1/vm-lkp=
-wsx03-2G/boot

commit: =

  b8f1a75d61d8405a753380c6fb17ba84a5603cd4
  55834c59098d0c5a97b0f3247e55832b67facdcf

b8f1a75d61d8405a 55834c59098d0c5a97b0f3247e =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    165450 =C2=B1  0%     +31.9%     218176 =C2=B1  1%  boot-slabinfo.num_o=
bjs
     19095 =C2=B1  5%    +104.3%      39013 =C2=B1  3%  boot-slabinfo.num_p=
ages
    107.27 =C2=B1  2%     +14.1%     122.43 =C2=B1 13%  boot-time.boot
     97.13 =C2=B1  1%      +4.3%     101.31 =C2=B1  1%  boot-time.idle
   1105076 =C2=B1  0%      -7.2%    1025056 =C2=B1  0%  boot-meminfo.MemFree
     36269 =C2=B1 12%    +215.7%     114517 =C2=B1  5%  boot-meminfo.SUnrec=
laim
     76469 =C2=B1  5%    +104.5%     156343 =C2=B1  4%  boot-meminfo.Slab



                               boot-slabinfo.num_objs

  230000 ++----------------------------------------------------------------=
-+
         |            O                 O                                  =
 |
  220000 ++O O    O OO OO     O O OO OO                                    =
 |
         OO O OOOO O     OOOOOOO O  O OO O                                 =
 |
  210000 ++                                                                =
 |
         |                                                                 =
 |
  200000 ++                                                                =
 |
         |                                                                 =
 |
  190000 ++                                                                =
 |
         |                                                                 =
 |
  180000 ++                                                                =
 |
         |                                                                 =
 |
  170000 ++                                                                =
 |
         ******************************************************************=
**
  160000 ++----------------------------------------------------------------=
-+


                               boot-slabinfo.num_pages

  45000 ++-------------O---------------------------------------------------=
-+
        | O  O      OO O O O O  OOO                                        =
 |
  40000 +O   OOO OO                OO O  O                                 =
 |
        O  OO      O  O O O O  OO    O  O                                  =
 |
        |       O             O        O                                   =
 |
  35000 ++                                                                 =
 |
        |                                                                  =
 |
  30000 ++                                                                 =
 |
        |                                                                  =
 |
  25000 ++                                                                 =
 |
        |                                                                  =
 |
        |                                                         *    *   =
 *
  20000 +* *  *  ** * *  *   * *  *   ** **** ** * *  *   * *  *  :: * *** =
*|
        * * ** **  * * ** *** * ** ***  * *  *  * * ** *** * ** ** ** *   *=
 |
  15000 ++-----------------------------------------------------------------=
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
Xiaolong

--===============2271808791469793440==--

