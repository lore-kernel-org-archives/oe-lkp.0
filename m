Content-Type: multipart/mixed; boundary="===============3957910083441725202=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Wed, 17 Aug 2016 18:24:51 +0200
Message-ID: <20160817162451.GC24652@twins.programming.kicks-ass.net>
In-Reply-To: <20160815050300.GA16267@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3957910083441725202==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 15, 2016 at 07:03:00AM +0200, Ingo Molnar wrote:
> =

> * Linus Torvalds <torvalds@linux-foundation.org> wrote:
> =

> > Make sure you actually use "perf record -e cycles:pp" or something
> > that uses PEBS to get real profiles using CPU performance counters.
> =

> Btw., 'perf record -e cycles:pp' is the default now for modern versions
> of perf tooling (on most x86 systems) - if you do 'perf record' it will
> just use the most precise profiling mode available on that particular
> CPU model.
> =

> If unsure you can check the event that was used, via:
> =

>   triton:~> perf report --stdio 2>&1 | grep '# Samples'
>   # Samples: 27K of event 'cycles:pp'

Problem here is that Dave is using a KVM thingy. Getting hardware
counters in a guest is somewhat tricky but doable, but PEBS does not
virtualize.



--===============3957910083441725202==--

