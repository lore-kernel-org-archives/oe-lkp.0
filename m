Content-Type: multipart/mixed; boundary="===============9112948828745536513=="
MIME-Version: 1.0
From: syzbot <syzbot+e42ae441c3b10acf9e9d@syzkaller.appspotmail.com>
To: lkp@lists.01.org
Subject: Re: BUG: corrupted list in insert_work
Date: Mon, 15 Aug 2022 22:58:08 -0700
Message-ID: <000000000000c518d505e6556ed8@google.com>
In-Reply-To: <000000000000aaac8505dc135b07@google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9112948828745536513==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

syzbot suspects this issue was fixed by commit:

commit d007f49ab789bee8ed76021830b49745d5feaf61
Author: Al Viro <viro@zeniv.linux.org.uk>
Date:   Wed May 18 06:13:40 2022 +0000

    percpu_ref_init(): clean ->percpu_count_ref on failure

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D10c66b6b0800=
00
start commit:   ebc9fb07d294 ANDROID: random: fix CRC issues with the merge
git tree:       android12-5.10-lts
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D32c952ff4a8ff8c1
dashboard link: https://syzkaller.appspot.com/bug?extid=3De42ae441c3b10acf9=
e9d
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D172a9074080000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D10456caa080000

If the result looks correct, please mark the issue as fixed by replying wit=
h:

#syz fix: percpu_ref_init(): clean ->percpu_count_ref on failure

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
--===============9112948828745536513==--

