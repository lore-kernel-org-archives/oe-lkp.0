Content-Type: multipart/mixed; boundary="===============0785984830897858220=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [sched] 36932a9e2b1: +121.2% boot-meminfo.SUnreclaim
Date: Wed, 06 Aug 2014 05:29:48 +0800
Message-ID: <20140805212948.GE14042@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============0785984830897858220==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Peter,

FYI, we noticed the below changes on

git://internal_merge_and_test_tree devel-athens-alpha-201408042000
commit 36932a9e2b1043506d06414fa988cd5b9592841f ("sched: Fix finish_task_sw=
itch vs prev_state")

test case: vm-vp-1G/boot/1

11b4855f1d9f1cc  36932a9e2b1043506d06414fa =

---------------  ------------------------- =

      8524 =C2=B1 1%    +121.2%      18858 =C2=B1 0%  TOTAL boot-meminfo.SU=
nreclaim
      1321 =C2=B1 9%   +3196.6%      43568 =C2=B1 0%  TOTAL boot-meminfo.Ke=
rnelStack
      8756 =C2=B1 0%     +29.8%      11363 =C2=B1 0%  TOTAL boot-slabinfo.n=
um_pages
     34982 =C2=B1 0%     +29.5%      45311 =C2=B1 0%  TOTAL boot-meminfo.Sl=
ab
    535601 =C2=B1 0%      -9.9%     482375 =C2=B1 0%  TOTAL boot-meminfo.Me=
mFree
    116621 =C2=B1 0%      +9.4%     127548 =C2=B1 0%  TOTAL boot-slabinfo.n=
um_objs

Legend:
	=C2=B1XX%    - stddev percent
	[+-]XX% - change percent

Thanks,
Fengguang

--===============0785984830897858220==--

