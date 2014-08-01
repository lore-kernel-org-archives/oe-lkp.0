Content-Type: multipart/mixed; boundary="===============7214706311115589809=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched/numa] a43455a1d57: +94.1% proc-vmstat.numa_hint_faults_local
Date: Fri, 01 Aug 2014 17:02:46 +0200
Message-ID: <20140801150246.GC3588@twins.programming.kicks-ass.net>
In-Reply-To: <20140731173705.GC19379@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============7214706311115589809==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2014 at 07:37:05PM +0200, Peter Zijlstra wrote:
> On Thu, Jul 31, 2014 at 06:39:05PM +0200, Jirka Hladky wrote:
> > I'm doing 3 iterations (3 runs) to get some statistics. To speed up the=
 test
> > significantly please do the run with 20 warehouses only
> > (or in general with #warehouses =3D=3D  number of nodes * number of PHY=
SICAL
> > cores)
> =

> Yeah, went and did that for my 4 node machine, its got a ton more cores, =
but I
> matches the warehouses to it:
> =

> -a43455a1d57	tip/master
> =

> 979996.47	1144715.44
> 876146		1098499.07
> 1058974.18	1019499.38
> 1055951.59	1139405.22
> 970504.01	1099659.09
> =

> 988314.45	1100355.64	(avg)
> 75059.546179565	50085.7473975167(stdev)
> =

> So for 5 runs, tip/master (which includes the offending patch) wins hands=
 down.
> =

> Each run is 2 minutes.

Because Rik asked for a43455a1d57^1 numbers:

546423.08
546558.63
545990.01
546015.98

some a43455a1d57 numbers:

538652.93
544333.57
542684.77

same setup and everything. So clearly the patches after that made 'some'
difference indeed, seeing how tip/master is almost twice that.

So the reason I didn't so a43455a1d57^1 vs a43455a1d57 is because we already
fingered a commit, after that what you test is the revert of that commit,
because revert is what you typically end up doing if a commit is fail.

But on the state of tip/master, taking that commit out is a net negative for
everything I've tested.

--===============7214706311115589809==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.sig"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEuNC4xMiAoR05V
L0xpbnV4KQoKaVFJY0JBRUJBZ0FHQlFKVDI2d1dBQW9KRUhaSDRhUkx3T1M2K2dVUUFLbExzSkY0
MDUxeHA3bkdFT1F1SmhvUgpQRTg5OUVldlZYR0hSbGdzOG8yZ25Ha0N0M1VuUGRJRldpaEZ0RXFB
Mk15MU1IY1ZJenBreis1bm5tRVpoQkE5Cm5Jd0YyY29GMnFHcm84V1VSYUEzYlhSN2JBRElXZlpj
bmszS1pqSmEyaWJUODdmK3dIUnE0L0ZpcnJiOEdSVTcKcmFpcnF1bGg4M0lWM0ZGZExscUFna011
TDIwSUg5ZGhQR05rSjRGck96UzZvejJxYlhPNjMyOXFIL1ZDMDUrWgpYQUg2MXBFVmZON0JZYk9T
MlROQWZFR0NnelY2THIwMWtQaGMvcWVPTGJhdVZDelZVRU5hdzlRZTNnT3Bza0ZNClB4alJxdjNS
NlBrTnRmTDJvQS9aYmcrN2J6L1gzMlI1bW8ybytIQ3FReVQ0SWpVUkJSUXN5ZGZlc3pTNHZkbXMK
L2Nva3FvMWIySDBDblUyQk1aTHhNU3NiMzZRbDZ4amNOZHAyL2prSG5aNXRGS2RmeTIvYzVKY21m
LzJhand5bwpyQS92eEhxNnlraHRaU3c3MSszSjdObnJOVTBsNEtyWmZsRTY2WGhhSjlkVk9Uczgy
NlFJcEZXMEQwcnphSEp2CjdqOUdDemU1U0c0RHQweGtpMm9jSkpzeVJUbkJueHdsWnB4T1U3eGNE
SXpHZlRqVGZzbXVYd2FTZm16WGxtVnIKb1hFT2prUDBCVUtjVzhSVmRNNy9La3lHam16WDltUU9t
RFhnZ3IzQkZtclJtVkpFZUNnNjNNMG5rdEcxT3JWYQpBK0lvd0NmZm9IN1BSblAySzVmVmdhS3BZ
R2hHZEdnYXpDTjlWTzFYemZxWEpkbXlhUUxURzFraDh2a09aYjZ4Cjl6S0pVa3NBUFYzamZ5TmdE
dVBnCj1kZGxzCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============7214706311115589809==--

