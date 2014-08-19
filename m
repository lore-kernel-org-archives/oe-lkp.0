Content-Type: multipart/mixed; boundary="===============8416153036492780272=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [writeback] 952648324b9: xfstests.xfs.026.fail
Date: Tue, 19 Aug 2014 12:30:06 +0800
Message-ID: <20140819043006.GA11419@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============8416153036492780272==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Jan,

We find more xfstests changes on "writeback: Per-sb dirty tracking".

008 seems improved, the others are regressions.
063 failure is not 100% reproducible.

df3be46bdbab23e  952648324b969f3fc22d3a2a7  =

---------------  -------------------------  =

         0           +Inf%          1 =C2=B1 0%  TOTAL xfstests.xfs.026.fail
         0           +Inf%          1 =C2=B1 0%  TOTAL xfstests.xfs.027.fail
         0           +Inf%          1 =C2=B1 0%  TOTAL xfstests.xfs.061.fail
         0           +Inf%          1 =C2=B1 0%  TOTAL xfstests.xfs.281.fail
         0           +Inf%          0 =C2=B1200%  TOTAL xfstests.xfs.063.fa=
il
         0 =C2=B1489%    -100.0%          0 =C2=B1 0%  TOTAL xfstests.xfs.0=
08.fail
         0           +Inf%          1 =C2=B1 0%  TOTAL xfstests.xfs.056.fail
         0           +Inf%          1 =C2=B1 0%  TOTAL xfstests.xfs.059.fail
         0           +Inf%          1 =C2=B1 0%  TOTAL xfstests.xfs.060.fail
         0           +Inf%          1 =C2=B1 0%  TOTAL xfstests.xfs.266.fail
         0           +Inf%          1 =C2=B1 0%  TOTAL xfstests.xfs.282.fail
         0           +Inf%          1 =C2=B1 0%  TOTAL xfstests.xfs.283.fail

Thanks,
Fengguang

--===============8416153036492780272==--

