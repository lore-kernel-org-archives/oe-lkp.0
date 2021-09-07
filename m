Content-Type: multipart/mixed; boundary="===============2253548805444803171=="
MIME-Version: 1.0
From: Shakeel Butt <shakeelb@google.com>
To: lkp@lists.01.org
Subject: Re: [memcg] 0f12156dff: will-it-scale.per_process_ops -33.6% regression
Date: Tue, 07 Sep 2021 08:57:42 -0700
Message-ID: <CALvZod6S+NmG8+-ftS-w3t3zJg_kbr3-F9h-n4jwSnqh0jTUGQ@mail.gmail.com>
In-Reply-To: <dbc9955d-6c28-1dd5-b842-ef39a762aa3b@kernel.dk>
List-Id: <oe-lkp.lists.linux.dev>

--===============2253548805444803171==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 7, 2021 at 8:46 AM Jens Axboe <axboe@kernel.dk> wrote:
>
> On 9/7/21 9:07 AM, kernel test robot wrote:
> >
> >
> > Greeting,
> >
> > FYI, we noticed a -33.6% regression of will-it-scale.per_process_ops du=
e to commit:
> >
> >
> > commit: 0f12156dff2862ac54235fc72703f18770769042 ("memcg: enable accoun=
ting for file lock caches")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>
> Are we at all worried about these? There's been a number of them
> reported, basically for all the accounting enablements that have been
> done in this merge window.
>
> When io_uring was switched to use accounted memory, we did a bunch of
> work to ameliorate the inevitable slowdowns that happen if you do
> repeated allocs and/or frees and have memcg accounting enabled.
>

I think these are important and we should aim to continuously improve
performance with memcg accounting. I would like to know more about the
io_uring work done to improve memcg accounting. Maybe we can
generalize it to others as well.
--===============2253548805444803171==--

