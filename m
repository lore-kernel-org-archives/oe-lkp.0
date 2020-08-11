Content-Type: multipart/mixed; boundary="===============2220616914304210128=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [mm] 2a9127fcf2: hackbench.throughput -69.2% regression
Date: Tue, 11 Aug 2020 08:51:17 -0700
Message-ID: <CAHk-=wg36CfqcBr8ucE_xcqCaPWeL8LmkAuYMsY4yW74F9=ZOA@mail.gmail.com>
In-Reply-To: <20200811083315.GB7488@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============2220616914304210128==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2020 at 1:34 AM kernel test robot <rong.a.chen@intel.com>=
 wrote:
>
> FYI, we noticed a -69.2% regression of hackbench.throughput due to commit:
>
> commit: 2a9127fcf2296674d58024f83981f40b128fffea ("mm: rewrite wait_on_pa=
ge_bit_common() logic")
>
> in testcase: hackbench
>
> In addition to that, the commit also has significant impact on the follow=
ing tests:

You can say that again. It's all over the map. with some benchmarks
showing huge improvement and some showing a lot of downside.

Which is not surprising, I guess. Waking things up earlier can cause
more of a thundering herd effect, and it looks like some path ends up
just going right back to sleep again, with voluntary_context_switches
growing by a factor of 25x, and involuntary_context_switches growing
by 110x if I read that right.

And the reason really does seem to be due to having a _lot_ more
runnable active threads:nr_running.avg increases by 2x, and
runnable_avg.min is 4x what it used to be.

I think this is more of a "Hugh load" - it was likely already scaling
the load past the machine limits, and the more aggressive wakeups just
made it go even further past what resources there were available.

The odd thing is that in the profile, wakup_up_common does show up,
but it has nothing to do with the page lock. It's the
unix_stream_sendmsg() waking up readers.

I wonder if it used to be synchronized more on the page lock, and now
it's past that, and we end up having a lot of readers on the same unix
domain socket, and we get a thundering herd there when the writer
comes along. Or something.

              Linus
--===============2220616914304210128==--

