Content-Type: multipart/mixed; boundary="===============1883742397749638726=="
MIME-Version: 1.0
From: Stephan Mueller <smueller@chronox.de>
To: lkp@lists.01.org
Subject: [PATCH 0/4] DRBG: Fixes for code review comments
Date: Tue, 01 Jul 2014 15:15:06 +0000
Message-ID: <36957559.tbJt1gJF6I@myon.chronox.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============1883742397749638726==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

the following fixes cover comments from code reviewers. The patch set
is an addition to the patch set offered several days ago [1].

[1] https://lkml.org/lkml/2014/6/28/497

Stephan Mueller (4):
  DRBG: Select correct DRBG core for stdrng
  DRBG: Mix a time stamp into DRBG state
  DRBG: fix memory corruption for AES192
  DRBG: HMAC-SHA1 DRBG has crypto strength of 128 bits

 crypto/drbg.c         | 77 ++++++++++++++++++++++++++++++++---------------=
----
 include/crypto/drbg.h |  2 +-
 2 files changed, 49 insertions(+), 30 deletions(-)

-- =

1.9.3



--===============1883742397749638726==--

