Content-Type: multipart/mixed; boundary="===============0955245162795841867=="
MIME-Version: 1.0
From: Rik van Riel <riel@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [sched/fair] 6d46bd3d97: netperf.Throughput_tps -11.3% regression
Date: Thu, 14 Sep 2017 11:56:43 -0400
Message-ID: <1505404603.12821.19.camel@redhat.com>
In-Reply-To: <CAJWu+oryGEK7=_R2AU6HaFCJcuS1DjLPgjYGLD7c_gWmGpiO=Q@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0955245162795841867==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, 2017-09-10 at 23:32 -0700, Joel Fernandes wrote:
> =

> To make the load check more meaningful, I am thinking if using
> wake_affine()'s balance check is a better thing to do than the
> 'nr_running < 2' check I used in this patch. Then again, since commit
> 3fed382b46baac ("sched/numa: Implement NUMA node level
> wake_affine()",
> wake_affine() doesn't do balance check for CPUs within a socket so
> probably bringing back something like the *old* wake_affine that
> checked load between different CPUs within a socket is needed to
> avoid
> a potentially disastrous sync decision?=C2=A0

This is because regardless of whether or not we did
an affine wakeup, the code called select_idle_sibling
within that socket, anyway.

In other words, the behavior for within-socket
wakeups was not substantially different with or
without an affine wakeup.

All that changed is which CPU select_idle_sibling
starts searching at, and that only if the woken
task's previous CPU is not idle.

> =C2=A0The commit I refer to was
> added with the reason that select_idle_sibling was selecting cores
> anywhere within a socket, but with my patch we're more specifically
> selecting the waker's CPU on passing the sync flag. Could you share
> your thoughts about this?

On systems with SMT, it may make more sense for
sync wakeups to look for idle threads of the same
core, than to have the woken task end up on the =

same thread, and wait for the current task to stop
running.

"Strong sync" wakeups like you propose would also
change the semantics of wake_wide() and potentially
other bits of code...

-- =

All rights reversed

--===============0955245162795841867==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjIKCmlRRWNCQUFC
Q0FBR0JRSlp1cWE3QUFvSkVNNTUzcEtFeE42RFQ1a0gvMkhMYWFqNzNwekIvdHNkSjhudXBLbkQK
U1RiZVdKRUN1ZHhTZDVOL1ZNb1NPcC92Q0hGcGtTNEorTWtIOFI1UjBrVUNwUDRNZXozdHhYcW81
cm5uayt0Ywpnd0VvbFdmdThkSGduTXcvS3Z6Y1FWSVo3K0hFaHUzTE1HaDdmN1hCdmhTWFcyNmRU
WVFFbTV3K01QZ0c1QzN2CitxTjFHQ0tuME9RcVJiQ2JyNFl4V3JoMllPUUJEa3JzclR2cmFQaDV6
RW8rejAyaU52TkVkbjhQcnBXcVVTM2oKVExnNHAyZkYxV2Iwem9rYnFMUDcxRG1MWFEvMVZ4YTd2
TGRXb3ljYlF3eDVxVDBtSS9hVXp1MGlVTkRaNzVMSgp6MjdiZUVVcFpWUnEydTU2OFlrbHpVNW5S
STZHZU5xdEd3MG0zSFFUMDV4UW9ZL0tVL0kydlpYdExmeU1rbmM9Cj1JSjZTCi0tLS0tRU5EIFBH
UCBTSUdOQVRVUkUtLS0tLQo=

--===============0955245162795841867==--

