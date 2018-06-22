Content-Type: multipart/mixed; boundary="===============1739343831561115377=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [fs] 3deb642f0d: will-it-scale.per_process_ops -8.8% regression
Date: Fri, 22 Jun 2018 18:25:45 +0900
Message-ID: <CA+55aFw5ghByk_zCN25G6rPPSAQma3Mh0t4s18CtLg=h6U9+Zg@mail.gmail.com>
In-Reply-To: <20180622082752.GX11011@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============1739343831561115377==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

[ Added Al, since this all came in through his trees. The guilty
authors were already added by the robot ]

On Fri, Jun 22, 2018 at 5:31 PM kernel test robot <xiaolong.ye@intel.com>=
 wrote:
>
> FYI, we noticed a -8.8% regression of will-it-scale.per_process_ops due t=
o commit:

Guys, this seems pretty big.

What was the alleged advantage of the new poll methods again? Because
it sure isn't obvious - not from the numbers, and not from the commit
messages.

The code seems to be garbage. It replaces our nice generic "you can do
anything you damn well like in your poll function" with two limited
fixed-function "just give me the poll head and the mask".

I was assuming there  was a good reason for it, but looking closer I
see absolutely nothing but negatives. The argument that keyed wake-ups
somehow make multiple wake-queues irrelevant doesn't hold water when
the code is more complex and apparently slower. It's not like anybody
ever *had* to use multiple wait-queues, but the old code was both
simpler and cleaner and *allowed* you to use multiple queues if you
wanted to.

So the old code is simpler, cleaner, and more flexible. And according
to the test robot, it also performs better.

So I'm inclined to just revert the whole mess unless I get some
serious explanations for what the supposed advantages are.

The disadvantages are obvious: every poll event now causes *two*
indirect branches to the low-level filesystem or driver - one to get
he poll head, and one to get the mask. Add to that all the new "do we
have the new-style or old sane poll interface" tests, and poll is
obviously more complicated.

Quite frankly, when I look at it, I just go "that's _stupid_". I'm
entirely  missing the point of the conversion, and it's not explained
in the messages either.

If we could get the poll head by just having a direct pointer in the
'struct file', maybe that would be one thing. As it is, this all
literally just adds overhead for no obvious reason. It replaced one
simple direct call with two dependent but separate ones.

                Linus

--===============1739343831561115377==--

