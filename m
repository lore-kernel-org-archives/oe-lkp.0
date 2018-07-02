Content-Type: multipart/mixed; boundary="===============8390197873428274337=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [fs] 5c6de586e8: vm-scalability.throughput +12.4% improvement (from reorganizing struct inode?)
Date: Mon, 02 Jul 2018 11:59:30 -0700
Message-ID: <CA+55aFy-tgKkq_oiQaZge3URgZL0ruvoJ6pUCf=H+aschPdqAw@mail.gmail.com>
In-Reply-To: <CAOQ4uxgRXzq+ZSmwRB_nyGijFJsiuWXaM_F74W-3JOyTvAEz-Q@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8390197873428274337==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 1, 2018 at 11:27 PM Amir Goldstein <amir73il@gmail.com> wrote:
>
> This may be a test fluctuation or as a result of moving
> i_blkbits closer to i_bytes and i_lock.

Hey, I certainly am not against shrinking the inode (and in general,
removing 'enum's from internal structures), although that benchmark
improvement looks suspiciously large. The kernel test robot is lovely,
but some of the performance fluctuations may be more noise than
others.

I was hoping the patch would go through the regular vfs tree, though. Al?

              Linus

--===============8390197873428274337==--

