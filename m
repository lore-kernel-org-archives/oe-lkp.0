Content-Type: multipart/mixed; boundary="===============4532932557013409048=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched/numa] a43455a1d57: +94.1% proc-vmstat.numa_hint_faults_local
Date: Fri, 01 Aug 2014 09:29:11 +0200
Message-ID: <20140801072911.GE19379@twins.programming.kicks-ass.net>
In-Reply-To: <20140801020330.GA30211@aaronlu.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4532932557013409048==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 01, 2014 at 10:03:30AM +0800, Aaron Lu wrote:
> > > > ebe06187bf2aec1  a43455a1d572daf7b730fe12e  =

> > > > ---------------  -------------------------  =

> > > >      94500 ~ 3%    +115.6%     203711 ~ 6%  ivb42/hackbench/50%-thr=
eads-pipe
> > > >      67745 ~ 4%     +64.1%     111174 ~ 5%  lkp-snb01/hackbench/50%=
-threads-socket
> > > >     162245 ~ 3%     +94.1%     314885 ~ 6%  TOTAL proc-vmstat.numa_=
hint_faults_local

> It means, for commit ebe06187bf2aec1, the number for
> num_hint_local_faults is 94500 for ivb42 machine and 67745 for lkp-snb01
> machine. The 3%, 4% following that number means the deviation of the
> different runs to their average(we usually run it multiple times to
> phase out possible sharp values). We should probably remove that
> percentage, as they cause confusion if no detailed explanation and may
> not mean much to the commit author and others(if the deviation is big
> enough, we should simply drop that result).

Nah, variance is good, but the typical symbol would be +- or the fancy
=C2=B1.

~ when used as a unary op means 'approx' or 'about' or 'same order'
~ when used as a binary op means equivalence, a weaker equal, often in
the vein of the unary op meaning.

Also see: http://en.wikipedia.org/wiki/Tilde#Mathematics

So while I think having a measure of variance is good, I think you
picked entirely the wrong symbol.

--===============4532932557013409048==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.sig"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEuNC4xMiAoR05V
L0xpbnV4KQoKaVFJY0JBRUJBZ0FHQlFKVDIwSEhBQW9KRUhaSDRhUkx3T1M2aEtNUC8yb0ZGbWll
NWpEenRXNEtMMzZoc1M3eApLTXowNkh4ZjcwTWNBaFRPdG1mYlgyTzQxSi9BNTZoL0E2cjFIMUdR
VE1kUHEwSUtJcll3RGpNUGNXU3ZuMFdiCnArMGRxcTdWRm1PRDJkcWI1YnI0UXhTWVlTMTFDa2Qx
a3ptVXNDR0ZnbEVuaWw2bFBodEx4anpxeEJ6bVlSQzIKOHdIamZVYWpRUjUvU1NtTVRyT0p0d1dl
Ylk1OTZ6eEk1U3BLanlKTlZXSjFyeWZKY0gyUVh2dXJ6VmJ4VW9xTApyQk1CVWdLM09ZeGRRQUR0
Vlh4WFVuemhaK1dWZW1RbHRlTXU2ckxMa2tQUTN0N2RJdEk0OEI5cUxvYitkQXpjCi95UENiU09m
ZnhXNjlxOTYzSWxyNUwzbml1c3ZlWVBCeEJmS1lpQVh3VWVXN2lVSUNMZnRiaS8yc1hXSHEwZkoK
TDQ1cG5waGpUV2lOOWQ0NEo4Sk1PSlBLY29aaGwySnIrWTZ2OUdhcjlzUURIdkNmSXduL0UrRk9Z
MHpEQlJ6bwpqUlgwUDNla1NtQ2toSEh3ZnJHWWowS1Q1RTYwUFRXcmMzblgxR0pUSUszeGpOTVM5
L3ljTVNrakZ1UTZoVlJUCmFEMjVINVdDRm5tWFd6ek9UVlN6M3ZrSGVhWi9mK3E1SlI1VHhGYjNU
bW9kaDlDMU0vRmNaVTVOQlM2bFVsd20KbitldHVZVlkrYlQ1Yi9IcVZhOUNzSHE5MytlL2VRREc5
aUVreFNVU0FEOUU1YlFaaldJVlJGQndkVU4wbVJDZgp6eUVsbHVKLzZjNTRhY0loa2hIUVIvWUVm
Z3VxUzF5clh6QlZGMWpzZ3VuTXp5ZEJRRlozWm01V2laa1VESWxUCnBjU21WcTBWZExIME1CRU9n
ZHRTCj01a3UxCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============4532932557013409048==--

