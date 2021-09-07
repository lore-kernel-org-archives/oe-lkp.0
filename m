Content-Type: multipart/mixed; boundary="===============7812076502050789532=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [memcg] 0f12156dff: will-it-scale.per_process_ops -33.6% regression
Date: Tue, 07 Sep 2021 11:33:32 -0700
Message-ID: <CAHk-=whiFC8Az2wD5_DCeysw+DV4srAj3sCbVP4asPPEJbOpqQ@mail.gmail.com>
In-Reply-To: <CAHk-=wgW3dYJyh6S_U5ot_0Q-OU0-vrS=L8Uky4+Y5fZXeLcKw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7812076502050789532==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 7, 2021 at 10:52 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> So _right_now_ my plan is to revert the two obvious cases:
>
>     0f12156dff28 memcg: enable accounting for file lock caches
>     b65584344415 memcg: enable accounting for pollfd and select bits arra=
ys

That "my plan" became "my action", because I ended up having another
VM revert due to an oops report and once I started doing that, I just
did all my pending reverts.

If people are aware of any other cases I missed, please holler.
Because right now my revert queue is empty, but it migth be because I
overlooked something.

                  Linus
--===============7812076502050789532==--

