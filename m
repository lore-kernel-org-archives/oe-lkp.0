Content-Type: multipart/mixed; boundary="===============5368978316527562831=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [perf/x86] 81ec3f3c4c: will-it-scale.per_process_ops -5.5% regression
Date: Tue, 25 Feb 2020 12:53:49 +0800
Message-ID: <20200225045349.GD63065@shbuild999.sh.intel.com>
In-Reply-To: <CAHk-=wisa2xZHaCV=kh3seU-1kFDTjyWW9Ak3w5HH8nDvv7Snw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5368978316527562831==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Mon, Feb 24, 2020 at 07:15:15PM -0800, Linus Torvalds wrote:
> On Mon, Feb 24, 2020 at 6:57 PM Feng Tang <feng.tang@intel.com> wrote:
> >
> > Thanks for the optimization patch for signal!
> >
> > It makes a big difference, that the performance score is tripled!
> > bump from original 17000 to 54000. Also the gap between 5.0-rc6 and
> > 5.0-rc6+Jiri's patch is reduced to around 2%.
> =

> Ok, so what I think is happening is that the exact same issue still
> exists, but now with less contention it's not quite as noticeable.

I thought that too. =


Since we have the reproducable platform, we will keep an eye on it,
and report back if anything found.

You've mentioned the patch's effect on small system in another mail,
I ran the benchmark on a 4 core Skylake desktop, and it only brought
2% performance gain, as expected.

> =

> Can you find some Intel CPU hardware person who could spend a moment
> on that odd 32-byte sub-block issue?
> =

> Considering that this effect apparently doesn't happen on any other
> platform you've tested, and this Cascade Lake platform is the newly
> released current Intel server platform, I think it's worth looking at.
 =

I'll try to reach some silicon people, and get back if found anything.


> That microbenchmark is not important on its own, but the odd timing
> behaviour it has would be good to have explained.
> =

> And while the signal sending microbenchmark is not likely to be very
> relevant to much anything else, I guess I'll apply the patch. Even if
> it's just a microbenchmark, it's not like we haven't used those before
> to pinpoint some very specific behavior. We used lmbench (and whatever
> that odd page cache benchmark was) to do some fairly fundamental
> optimizations back in the days.

Thanks again for the patch.

- Feng
> =

> If you fix the details on all the microbenchmarks you find, eventually
> you probably do well on real loads too..
> =

>            Linus
--===============5368978316527562831==--

