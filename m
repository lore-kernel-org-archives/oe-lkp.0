Content-Type: multipart/mixed; boundary="===============7331536020707864681=="
MIME-Version: 1.0
From: Alexey Gladkov <legion@kernel.org>
To: lkp@lists.01.org
Subject: [PATCH v2 0/2] ucounts: Fix rlimit max values check
Date: Mon, 29 Nov 2021 21:37:24 +0100
Message-ID: <cover.1638218242.git.legion@kernel.org>
In-Reply-To: <20211129074730.GB18483@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============7331536020707864681==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Checking the rlimit value specified in init_user_ns from the created userns=
 does
not work properly. The issue is that the maximum value is taken by the same
rules as for ucounts. Because of this, we check the current rlimit counter =
value
with RLIM_INFINITY in init_user_ns.

v2:
- Fix a bug that was found by the lkp project.

--

Alexey Gladkov (2):
  ucounts: Fix rlimit max values check
  ucounts: Move rlimit max values from ucounts max

 include/linux/user_namespace.h | 17 ++++++++++++-----
 kernel/fork.c                  | 10 +++++-----
 kernel/ucount.c                | 19 +++++++++----------
 kernel/user_namespace.c        | 10 +++++-----
 4 files changed, 31 insertions(+), 25 deletions(-)

-- =

2.33.0

--===============7331536020707864681==--

