Content-Type: multipart/mixed; boundary="===============0230086002945049249=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [LTP] 56cbb429d9: ltp.fs_fill.fail
Date: Thu, 25 Jul 2019 09:32:13 -0700
Message-ID: <CAHk-=wg+yRjY_AUrjbgrN59OeGAWMF_q=-Dqf2cYtVzoY01j7Q@mail.gmail.com>
In-Reply-To: <20190725132617.GA23135@rei.lan>
List-Id: <oe-lkp.lists.linux.dev>

--===============0230086002945049249==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2019 at 6:26 AM Cyril Hrubis <chrubis@suse.cz> wrote:
>
> This looks like mkfs.vfat got EBUSY after the loop device was
> succesfully umounted.

Hmm. Smells like the RCU-delaying got triggered again.

We have that "synchronize_rcu_expedited()" in namespace_unlock(),
which is so that everything should be done by the time we return to
user space.

Al, maybe that RCU synchronization should be after the mntput()s?

               Linus

--===============0230086002945049249==--

