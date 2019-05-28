Content-Type: multipart/mixed; boundary="===============2556291957701732248=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] mm: memcontrol: don't batch updates of local VM stats and events
Date: Tue, 28 May 2019 10:37:15 -0700
Message-ID: <CAHk-=wgaLQjZ8AZj76_cwvk_wLPJjr+Dc=Qvac_vHY2RruuBww@mail.gmail.com>
In-Reply-To: <CALvZod5KFJvfBfTZKWiDo_ux_OkLKK-b6sWtnYeFCY2ARiiKwQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2556291957701732248==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2019 at 9:00 AM Shakeel Butt <shakeelb@google.com> wrote:
>
> I was suspecting the following for-loop+atomic-add for the regression.

If I read the kernel test robot reports correctly, Johannes' fix patch
does fix the regression (well - mostly. The original reported
regression was 26%, and with Johannes' fix patch it was 3% - so still
a slight performance regression, but not nearly as bad).

> Why the above atomic-add is the culprit?

I think the problem with that one is that it's cross-cpu statistics,
so you end up with lots of cacheline bounces on the local counts when
you have lots of load.

But yes, the recursive updates still do show a small regression,
probably because there's still some overhead from the looping up in
the hierarchy. You still get *those* cacheline bounces, but now they
are limited to the upper hierarchies that only get updated at batch
time.

Johannes? Am I reading this right?

                   Linus

--===============2556291957701732248==--

