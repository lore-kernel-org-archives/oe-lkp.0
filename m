Content-Type: multipart/mixed; boundary="===============3147928336744124538=="
MIME-Version: 1.0
From: Junxiao Bi <junxiao.bi@oracle.com>
To: lkp@lists.01.org
Subject: ocfs2 test for 0-day test
Date: Tue, 01 Dec 2015 10:36:51 +0800
Message-ID: <565D07C3.2020609@oracle.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3147928336744124538==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Fengguang,

I heard you ever asked for test cases from subsystems to merge into your
0-day test framework. For ocfs2, we have a test project "ocfs2-test",
its git tree at
https://oss.oracle.com/git/ocfs2-tools.git/ocfs2-tools-1.8.4?p=3Docfs2-test=
.git;a=3Dsummary
. There is a README in it about test cases and steps to setup test env.

Recently we fixed lots of issues of it and I am using it to test ocfs2
mainline regularly. Two regression bugs have been found by it. It's a
little pain for me that I have to analysis and fix regression bugs
manually. Since 0-day test supports auto bisect, I am curious whether
you are interested in merging it into your 0-day test?

Thanks,
Junxiao.

--===============3147928336744124538==--

