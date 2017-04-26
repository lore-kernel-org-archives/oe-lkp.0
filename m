Content-Type: multipart/mixed; boundary="===============7377826884048439902=="
MIME-Version: 1.0
From: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>
To: lkp@lists.01.org
Subject: [PATCH v1 0/2] mm: hwpoison: fix mce-test.ras.fail on 23a003bfd2
Date: Wed, 26 Apr 2017 18:10:39 +0900
Message-ID: <1493197841-23986-1-git-send-email-n-horiguchi@ah.jp.nec.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7377826884048439902==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I wrote fixes for the problems reported by http://lkml.kernel.org/r/2017041=
7055948.GM31394(a)yexl-desktop.
These 2 patches make tsimpleinj.c delivered in mce-test test suite pass.

  [build8:~/mce-test-official/cases/function/hwpoison]$ ./tsimpleinj
  dirty page 0x7f657aecb000
  signal 7 code 4 addr 0x7f657aecb000
  recovered
  mlocked page 0x7f657aeca000
  signal 7 code 4 addr 0x7f657aeca000
  recovered
  clean file page 0x7f657aec9000
  23
  recovered
  file dirty page 0x7f657aec8000
  signal 7 code 4 addr 0x7f657aec8000
  recovered
  no error on msync expect error
  no error on fsync expect error
  hole file dirty page 0x7f657aec7000
  signal 7 code 4 addr 0x7f657aec7000
  recovered
  no error on hole msync expect error
  no error on hole fsync expect error
  SUCCESS

I'm digging another similar issue for hugetlb pages, which need some more
research and code, so I'll send it separately later.

Thanks,
Naoya Horiguchi
---
Summary:

Naoya Horiguchi (2):
      mm: hwpoison: call shake_page() unconditionally
      mm: hwpoison: call shake_page() after try_to_unmap() for mlocked page

 mm/hwpoison-inject.c |  3 +--
 mm/memory-failure.c  | 35 +++++++++++++++++++----------------
 2 files changed, 20 insertions(+), 18 deletions(-)

--===============7377826884048439902==--

