Content-Type: multipart/mixed; boundary="===============1668244447982210256=="
MIME-Version: 1.0
From: Shakeel Butt <shakeelb@google.com>
To: lkp@lists.01.org
Subject: Re: [memcg] 0f12156dff: will-it-scale.per_process_ops -33.6% regression
Date: Tue, 07 Sep 2021 09:49:16 -0700
Message-ID: <CALvZod5Q_K=xLpBWTLgg38X_w23HVSyqW2_Jnz7p=JR+kDD_-w@mail.gmail.com>
In-Reply-To: <CAHk-=wgrF65BpP6P6_a6+k+C8V+JOBiEx0X-c9idiM87uk32FQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1668244447982210256==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 7, 2021 at 9:40 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, Sep 7, 2021 at 8:46 AM Jens Axboe <axboe@kernel.dk> wrote:
> >
> > Are we at all worried about these? There's been a number of them
> > reported, basically for all the accounting enablements that have been
> > done in this merge window.
>
> We are worried about them. I'm considering reverting several of them
> because I think the problems are
>
>  (a) big
>
>  (b) nontrivial
>
> and the patches clearly weren't ready and people weren't aware of this is=
sue.
>

Sounds good to me. Please let me know which patches you are planning
to revert. I will work on the followup to make those acceptable.

thanks,
Shakeel
--===============1668244447982210256==--

