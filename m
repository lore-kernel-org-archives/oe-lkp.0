Content-Type: multipart/mixed; boundary="===============8787741931410200460=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched/numa] a43455a1d57: +94.1% proc-vmstat.numa_hint_faults_local
Date: Thu, 31 Jul 2014 17:57:23 +0200
Message-ID: <20140731155723.GY3588@twins.programming.kicks-ass.net>
In-Reply-To: <20140731104241.GA9918@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============8787741931410200460==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2014 at 12:42:41PM +0200, Peter Zijlstra wrote:
> On Tue, Jul 29, 2014 at 02:39:40AM -0400, Rik van Riel wrote:
> > On Tue, 29 Jul 2014 13:24:05 +0800
> > Aaron Lu <aaron.lu@intel.com> wrote:
> > =

> > > FYI, we noticed the below changes on
> > > =

> > > git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git mas=
ter
> > > commit a43455a1d572daf7b730fe12eb747d1e17411365 ("sched/numa: Ensure =
task_numa_migrate() checks the preferred node")
> > > =

> > > ebe06187bf2aec1  a43455a1d572daf7b730fe12e  =

> > > ---------------  -------------------------  =

> > >      94500 ~ 3%    +115.6%     203711 ~ 6%  ivb42/hackbench/50%-threa=
ds-pipe
> > >      67745 ~ 4%     +64.1%     111174 ~ 5%  lkp-snb01/hackbench/50%-t=
hreads-socket
> > >     162245 ~ 3%     +94.1%     314885 ~ 6%  TOTAL proc-vmstat.numa_hi=
nt_faults_local
> > =

> > Hi Aaron,
> > =

> > Jirka Hladky has reported a regression with that changeset as
> > well, and I have already spent some time debugging the issue.
> =

> Let me see if I can still find my SPECjbb2005 copy to see what that
> does.

Jirka, what kind of setup were you seeing SPECjbb regressions?

I'm not seeing any on 2 sockets with a single SPECjbb instance, I'll go
check one instance per socket now.



--===============8787741931410200460==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.sig"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEuNC4xMiAoR05V
L0xpbnV4KQoKaVFJY0JBRUJBZ0FHQlFKVDJtZGpBQW9KRUhaSDRhUkx3T1M2TStrUC9SRDBTT0FI
aWd5bFFjNkg5ekcwOERLegphUGxKU3AweEgzdjRXdGpGa1R0bWlTQ1pTblFMb2c3Vk9wYThSaVV4
VHpCN3JTNVZqSmZLb3lNMWtsdjlpSmUxClBXMWNUR2IxcGZUQWlrcGZ4b2h3SW5IUlJjK0x6SDEr
RHF3Vzd0U1lmUGFFMGpsc3ZJcDNqaVc5ZzVhR0xHVWIKUXc0blRKYy9NVm92WXVEMlRFMDFWTU9Z
WklISUloT3Jyb2d3MVR0UUxib3pvcHg3cGY0RC9sSUxxb1VlNy9uZAp6VVdYNFZVekMvNjJ0QjlX
NTRHbkJxUWpsbUFwYXA5NXROSFd3UGd0RGZFZnZSNjJMM2FwTlV6S0NicXFReFYrCjBmeGJnZk9H
cVpRY0NpZjZuMkhpdVh5Q0RuZkI1QncydDljS2F6TWRrY3BaVEpyY3F1QnNYU3I5NHI3N2Q4RXQK
cEYveUhMMitPUGtEZzhmT3N5ZmJOMVZOanVDRUFPK0ZkY01hSUptcXVJQW5xSFV5RUVZUEliL2k1
RkxGbEI4ZwpVaDhWZ2JhZmJkZTN5emNjTW5KOUt0RldkQzAyT1J2b0dtWlhxQ3BpZWRxa3h6djkr
Y3J3RURyVWx3U1p1L29TCm5lY25uTnRWOHJHdzN1K0k3TjRFaU44WXNWaTNkTFM2aEVlZDBzcDRX
UFJyRUxZb1FHbm5ldHdJN3pzbkRXa3MKYVBIaGIzMVRJY0s5YjQ0WmFFWm5FdFByWjdYKzVxeUtt
bStaZHJURzZKazRGUTdrcmRqcXh0SmdYN1d3ZUxPQwplOERhQy95TUJxdDRKK1diVnR2WTY2NzFh
WDkyczZSRnVJWEZWRjRxbnFMQUJtWFUvd1lVSThmeVZnQ05Hc2RuClNpN3l5Y21xTmZSTVhpUk9n
QWgzCj1RSjB6Ci0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============8787741931410200460==--

