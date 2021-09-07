Content-Type: multipart/mixed; boundary="===============2294501634889908478=="
MIME-Version: 1.0
From: Jens Axboe <axboe@kernel.dk>
To: lkp@lists.01.org
Subject: Re: [memcg] 0f12156dff: will-it-scale.per_process_ops -33.6% regression
Date: Tue, 07 Sep 2021 10:43:46 -0600
Message-ID: <774dee70-69bd-9f95-d197-4cff83e4e633@kernel.dk>
In-Reply-To: <CAHk-=wgrF65BpP6P6_a6+k+C8V+JOBiEx0X-c9idiM87uk32FQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2294501634889908478==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 9/7/21 10:39 AM, Linus Torvalds wrote:
> On Tue, Sep 7, 2021 at 8:46 AM Jens Axboe <axboe@kernel.dk> wrote:
>>
>> Are we at all worried about these? There's been a number of them
>> reported, basically for all the accounting enablements that have been
>> done in this merge window.
> =

> We are worried about them. I'm considering reverting several of them
> because I think the problems are
> =

>  (a) big
> =

>  (b) nontrivial
> =

> and the patches clearly weren't ready and people weren't aware of this is=
sue.

I think that is prudent. When I first enabled it for io_uring it was a
bit of a shit show in terms of performance degradations, and some work
had to be done before it could get enabled in a sane fashion.

The accounting needs to be more efficient if we're seeing 30-50%
slowdowns simply by enabling it on a kmem cache.

-- =

Jens Axboe

--===============2294501634889908478==--

