Content-Type: multipart/mixed; boundary="===============3884135255733650860=="
MIME-Version: 1.0
From: Yuanhan Liu <yuanhan.liu@linux.intel.com>
To: lkp@lists.01.org
Subject: 18aa8a45 +1.03% kernel-size.text
Date: Mon, 17 Nov 2014 12:01:03 +0800
Message-ID: <20141117040103.GO300@yliu-dev.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3884135255733650860==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Kees,

JFYI, we noticed that your following commit make the kernel size a bit
larger: 1.03%

git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git gcc-bug
perf change: 1.03% kernel-size.text
RESULT_ROOT: /result/wsm/boot/performance-1/debian-x86_64.cgz/x86_64-rhel/8=
562cc73288ff2f399625e2965b8f5cc644b5401/0

18aa8a45645640c7a44d15ebb7cb2270d3c23af8 is the first bad commit
commit 18aa8a45645640c7a44d15ebb7cb2270d3c23af8
Author:     Kees Cook <keescook@chromium.org>
AuthorDate: Wed May 7 10:50:04 2014 -0700
Commit:     Kees Cook <keescook@chromium.org>
CommitDate: Fri Nov 14 13:35:42 2014 -0800

    build: re-enable size builtin for gcc 4.8 and later
    =

    Most cases of strict copy from/to user checking are caught by gcc
    now. This re-enables it for gcc 4.8 and later so the gcc bug can be
    explored.
    =

    Signed-off-by: Kees Cook <keescook@chromium.org>

 include/linux/compiler-gcc4.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)


	--yliu

--===============3884135255733650860==--

