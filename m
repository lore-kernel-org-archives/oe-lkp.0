Content-Type: multipart/mixed; boundary="===============0024990463269765665=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [memcg] 0f12156dff: will-it-scale.per_process_ops -33.6% regression
Date: Tue, 07 Sep 2021 09:39:05 -0700
Message-ID: <CAHk-=wgrF65BpP6P6_a6+k+C8V+JOBiEx0X-c9idiM87uk32FQ@mail.gmail.com>
In-Reply-To: <dbc9955d-6c28-1dd5-b842-ef39a762aa3b@kernel.dk>
List-Id: <oe-lkp.lists.linux.dev>

--===============0024990463269765665==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 7, 2021 at 8:46 AM Jens Axboe <axboe@kernel.dk> wrote:
>
> Are we at all worried about these? There's been a number of them
> reported, basically for all the accounting enablements that have been
> done in this merge window.

We are worried about them. I'm considering reverting several of them
because I think the problems are

 (a) big

 (b) nontrivial

and the patches clearly weren't ready and people weren't aware of this issu=
e.

           Linus
--===============0024990463269765665==--

