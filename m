Content-Type: multipart/mixed; boundary="===============1466429815049112361=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 38ac256d1c: stress-ng.vm-segv.ops_per_sec -13.8% regression
Date: Wed, 21 Apr 2021 14:03:08 +0200
Message-ID: <YIAUfFXFFY9Jggra@hirez.programming.kicks-ass.net>
In-Reply-To: <87bla8ue3e.mognet@arm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1466429815049112361==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 21, 2021 at 11:27:49AM +0100, Valentin Schneider wrote:
> o 2-socket Xeon E5-2690 (x86, 40 cores)
> =

> and found at worse a -0.3% regression and at best a 2% improvement. I know
> that x86 box is somewhat ancient, but it's been my go-to "have I broken
> x86?" test victim for a while :-)

It happens that my main test-box is an E5-2680. I've got a slightly more
modern one too, but that boots like treacle so I end up using the IVB-EP
most :-)
--===============1466429815049112361==--

