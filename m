Content-Type: multipart/mixed; boundary="===============0181263916353665001=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [perf/x86] 81ec3f3c4c: will-it-scale.per_process_ops -5.5% regression
Date: Mon, 24 Feb 2020 19:15:15 -0800
Message-ID: <CAHk-=wisa2xZHaCV=kh3seU-1kFDTjyWW9Ak3w5HH8nDvv7Snw@mail.gmail.com>
In-Reply-To: <20200225025748.GB63065@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0181263916353665001==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2020 at 6:57 PM Feng Tang <feng.tang@intel.com> wrote:
>
> Thanks for the optimization patch for signal!
>
> It makes a big difference, that the performance score is tripled!
> bump from original 17000 to 54000. Also the gap between 5.0-rc6 and
> 5.0-rc6+Jiri's patch is reduced to around 2%.

Ok, so what I think is happening is that the exact same issue still
exists, but now with less contention it's not quite as noticeable.

Can you find some Intel CPU hardware person who could spend a moment
on that odd 32-byte sub-block issue?

Considering that this effect apparently doesn't happen on any other
platform you've tested, and this Cascade Lake platform is the newly
released current Intel server platform, I think it's worth looking at.

That microbenchmark is not important on its own, but the odd timing
behaviour it has would be good to have explained.

And while the signal sending microbenchmark is not likely to be very
relevant to much anything else, I guess I'll apply the patch. Even if
it's just a microbenchmark, it's not like we haven't used those before
to pinpoint some very specific behavior. We used lmbench (and whatever
that odd page cache benchmark was) to do some fairly fundamental
optimizations back in the days.

If you fix the details on all the microbenchmarks you find, eventually
you probably do well on real loads too..

           Linus
--===============0181263916353665001==--

