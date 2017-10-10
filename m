Content-Type: multipart/mixed; boundary="===============8718794877724315574=="
MIME-Version: 1.0
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: lkp@lists.01.org
Subject: [PATCH 0/4] x86/unwind: 32-bit unwinder fixes
Date: Mon, 09 Oct 2017 20:20:01 -0500
Message-ID: <cover.1507597785.git.jpoimboe@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8718794877724315574==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Some x86-32 unwinder bug fixes.

Josh Poimboeuf (4):
  x86/unwind: Fix dereference of untrusted pointer
  x86/unwind: Use MSB for frame pointer encoding on 32-bit
  x86/unwind: Align stack pointer in unwinder dump
  x86/unwind: Disable unwinder warnings on 32-bit

 arch/x86/entry/entry_32.S      |  4 ++--
 arch/x86/kernel/unwind_frame.c | 38 ++++++++++++++++++++++++++++++++++++--
 2 files changed, 38 insertions(+), 4 deletions(-)

-- =

2.13.6


--===============8718794877724315574==--

