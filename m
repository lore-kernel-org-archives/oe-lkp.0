Content-Type: multipart/mixed; boundary="===============5432367663189977502=="
MIME-Version: 1.0
From: Yuanhan Liu <yuanhan.liu@linux.intel.com>
To: lkp@lists.01.org
Subject: c57aa6544 +2.17% kernel-size.text
Date: Mon, 17 Nov 2014 16:46:15 +0800
Message-ID: <20141117084615.GP300@yliu-dev.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5432367663189977502==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Jiri,

JFYI, we noticed that your commit makes the kernel a bit larger: 2.17%.

git://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel

commit c57aa654485e7a1e0588090c1e648edd82d2f0ed
Author:     Jiri Slaby <jslaby@suse.cz>
AuthorDate: Wed Feb 16 13:33:46 2011 +0100
Commit:     Jiri Slaby <jslaby@suse.cz>
CommitDate: Mon Nov 10 19:37:57 2014 +0100

    include condition in the BUG_ON/WARN_ON output
    =

    Signed-off-by: Jiri Slaby <jslaby@suse.cz>

 include/asm-generic/bug.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

	--yliu

--===============5432367663189977502==--

