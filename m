Content-Type: multipart/mixed; boundary="===============3357428039469318885=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched/core] 9edfbfed3f5: +88.2% hackbench.time.involuntary_context_switches
Date: Mon, 09 Feb 2015 10:27:35 +0100
Message-ID: <20150209092735.GP5029@twins.programming.kicks-ass.net>
In-Reply-To: <CAC=cRTN3VKmgM4BYUrN=rMfg8stiP-F_oWR+2LSPFR9m1Wmfqg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3357428039469318885==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 09, 2015 at 04:47:07PM +0800, huang ying wrote:
> There are no distinguishable difference between the parent and the child
> for hackbench throughput number.
> =

> Usually you will not consider statistics such as involuntary context
> switches?

Only if there's a 'problem' with the primary performance metric (total
runtime in case of hackbench).

Once the primary metric shifts, you go look at what the cause of this
change might be, at that point things like # context switches etc.. are
interesting. As long as the primary performance metric is stable, meh.

As such; I would suggest _always_ reporting the primary metric for each
benchmark, preferably on top and not hidden somewhere in the mass of
numbers.

I now had to very carefully waste a few minutes of my time reading those
numbers to see if there was anything useful in; there wasn't.

--===============3357428039469318885==--

