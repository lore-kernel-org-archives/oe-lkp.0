Content-Type: multipart/mixed; boundary="===============3453507644851945118=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [perf/x86] 81ec3f3c4c: will-it-scale.per_process_ops -5.5% regression
Date: Mon, 24 Feb 2020 14:12:51 -0800
Message-ID: <CAHk-=wgXr1JcW3hyomWh8Y8Kr9wNq-+6r+CocY8EfXvuW7giHg@mail.gmail.com>
In-Reply-To: <8736azzlwq.fsf@x220.int.ebiederm.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============3453507644851945118==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2020 at 2:02 PM Eric W. Biederman <ebiederm@xmission.com>=
 wrote:
>
> Other than scratching my head about why are we optimizing neither do I.

You can see the background on lore

  https://lore.kernel.org/lkml/20200205123216.GO12867(a)shao2-debian/

and the thread about the largely unexplained regression there. I had a
wild handwaving theory on what's going on in

  https://lore.kernel.org/lkml/CAHk-=3DwjkSb1OkiCSn_fzf2v7A=3DK0bNsUEeQa+06=
XMhTO+oQUaA(a)mail.gmail.com/

but yes, the contention only happens once you have a lot of cores.

That said, I suspect it actually improves performance on that
microbenchmark even without the contention - just not as noticeably.
I'm running a kernel with the patch right now, but I wasn't going to
boot back into an old kernel just to test that. I was hoping that the
kernel test robot people would just check it out.

> It would help to have a comment somewhere in the code or the commit
> message that says the issue is contetion under load.

Note that even without the contention, on that "send a lot of signals"
case it does avoid the second atomic op, and the profile really does
look better.

That profile improvement I can see even on my own machine, and I see
how the nasty CPU bug avoidance (the "verw" on the system call exit
path) goes from 30% to 31% cost.

And that increase in the relative cost of the "verw" on the profile
must mean that the actual real code just improved in performance (even
if I didn't actually time it).

With the contention, you get that added odd extra regression that
seems to depend on exact cacheline placement.

So I think the patch improves performance (for this "lots of queued
signals" case) in general, and I hope it will also then get rid of
that contention regression.

                   Linus
--===============3453507644851945118==--

