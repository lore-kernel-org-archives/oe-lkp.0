Content-Type: multipart/mixed; boundary="===============9121357224438487268=="
MIME-Version: 1.0
From: David Drysdale <drysdale@google.com>
To: lkp@lists.01.org
Subject: Extending the 0-day system with syzkaller?
Date: Tue, 15 Dec 2015 11:49:54 +0000
Message-ID: <CAHse=S-4sRLKeURK-mr7s5NQ_g28iq8szVn2u82c3dFdB6Ho=g@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9121357224438487268==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Fengguang / LKP-folk,

Quick question -- how easy is it to add extra builds/tests/checks to
your marvellous 0-day kbuild system?

The reason I ask is that I've recently been exploring syzkaller [1],
which is a system call fuzzer written by some of my colleagues here at
Google (cc'ed).  Although it's fairly new, it has uncovered a bunch of
kernel bugs already [2] so I wondered if it might be a good candidate
for inclusion in the 0-day checks at some point.

(As an aside, I'm in the process of writing an article about syzkaller
for LWN, which might also expose it to more folk.)

What do you think?

Thanks,
David

[1] https://github.com/google/syzkaller
[2] https://github.com/google/syzkaller/wiki/Found-Bugs

--===============9121357224438487268==--

