Content-Type: multipart/mixed; boundary="===============3630192266116762407=="
MIME-Version: 1.0
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: lkp@lists.01.org
Subject: cross-compiling a 64-bit kernel on a 32-bit host
Date: Thu, 10 May 2018 17:36:19 -0500
Message-ID: <20180510223619.jwdlle42brksfp4v@treble>
List-Id: <oe-lkp.lists.linux.dev>

--===============3630192266116762407==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Fengguang,

I occasionally get compilation bug reports from people who are
cross-compiling an x86-64 kernel target on an x86-32 host.

Any chance the 0-day build bot could test that configuration?  I think
just building a defconfig would be sufficient.  It would help sort out
issues in objtool and other host-built scripts.

-- =

Josh

--===============3630192266116762407==--

