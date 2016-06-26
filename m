Content-Type: multipart/mixed; boundary="===============8509770570828549615=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [dcache_{readdir, dir_lseek}() users] 4e82901cd6: reaim.jobs_per_min -49.1% regression
Date: Sun, 26 Jun 2016 14:20:06 -0700
Message-ID: <CA+55aFz0Aog4gEareAtVdwtCH5qRx4s8SBuKNjVYt+8+00gLbw@mail.gmail.com>
In-Reply-To: <20160626180604.GW14480@ZenIV.linux.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============8509770570828549615==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 26, 2016 at 11:06 AM, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> FWIW, #work.dcache_readdir in vfs.git seems to recover the performance.
> Not sure if it's worth pushing right now, but if it ends up the next
> cycle stuff, I think it'll be worth Cc:stable.

Hmm. I guess that if you're confident enough about it, we might as
well merge it now and avoid the backport and stable headache.

              Linus

--===============8509770570828549615==--

