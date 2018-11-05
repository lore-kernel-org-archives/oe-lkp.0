Content-Type: multipart/mixed; boundary="===============7200426885621287773=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [mm] 9bc8039e71: will-it-scale.per_thread_ops -64.1% regression
Date: Mon, 05 Nov 2018 10:35:31 -0800
Message-ID: <CAHk-=whr2Aio3R49TVWqW3es6heyxXDuxGHcv8Bcc=_kw4vDeQ@mail.gmail.com>
In-Reply-To: <4feae9c4-432d-a362-58e4-11e0cb10b24d@linux.alibaba.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7200426885621287773==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 5, 2018 at 10:28 AM Yang Shi <yang.shi@linux.alibaba.com> wro=
te:
>
> Actually, the commit is mainly for optimizing the long stall time caused
> by holding mmap_sem by write when unmapping or shrinking large mapping.
> It downgrades write mmap_sem to read when zapping pages. So, it looks
> the downgrade incurs more context switches. This is kind of expected.
>
> However, the test looks just shrink the mapping with one normal 4K page
> size. It sounds the overhead of context switches outpace the gain in
> this case at the first glance.

I'm not seeing why there should be a context switch in the first place.

Even if you have lots of concurrent brk() users, they should all block
exactly the same way as before (a write lock blocks against a write
lock, but it *also* blocks against a downgraded read lock).

So no, I don't want just some limit to hide this problem for that
particular test. There's something else going on.

                 Linus

--===============7200426885621287773==--

