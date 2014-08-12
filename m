Content-Type: multipart/mixed; boundary="===============0361692458987767993=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched] 143e1e28cb4: +17.9% aim7.jobs-per-min, -9.7% hackbench.throughput
Date: Tue, 12 Aug 2014 08:41:56 +0200
Message-ID: <20140812064156.GK9918@twins.programming.kicks-ass.net>
In-Reply-To: <53E99117.9010500@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0361692458987767993==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2014 at 09:29:19AM +0530, Preeti U Murthy wrote:
> On 08/11/2014 07:03 PM, Peter Zijlstra wrote:
> > =

> > Now I think I see why this is; we've reduced load balancing frequency
> > significantly on this machine due to:
> =

> We have also changed the value of busy_factor to 32 from 64 across all
> domains. This would contribute to increased frequency of load balancing?

Not enough to offset the changes in min/max. Lowering it makes sense
because we've increased min/max for most situations.=20

--===============0361692458987767993==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.sig"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEuNC4xMiAoR05V
L0xpbnV4KQoKaVFJY0JBRUJBZ0FHQlFKVDZiYzBBQW9KRUhaSDRhUkx3T1M2bm5vUUFMRG1YZ2Vo
NUZHenBnVWdRWHBPUDVMQwpIRlRDTk9haUFBbmgyS21xSmJXdHVIRmVpQ0JNc2JTQW14dGplSW55
TGlYMEFDNU5ndk1sUWIyekR1N0dFakZKCmUvb1l3WTBseHorc2xNdVU2aWlGcFNrNys4NWJRQ0Nw
Tklsa1p1STVESHFSQ2pJRXZjYVorcHZ3OGkrSk9aZlgKSWozUFdCenBvLzdPTHI2WDc0Z0gwQlJs
MXFBQnJuODY0MGdRaUlDK3hwWGNwVTdBdFBTSlpJYkpHNWdMZzJJRApWN25pTUtIdnViUkVFYTN0
b3ZmdEY3VktCV0JaY2t6T0IzZDQ3VG0rSjNtdWgxNlZUZWU5dDc1dWp3QWpRSjFzCjFMTEsrQ1FZ
VnQ1NFRSZE1IN0tKUGhmZlR3WjBzZE80azdtTXF3NzhUL0hURW9VRThSNlNnNkpNb2EwR3gyRkIK
T0dpSUxJcDZqQnhVcTBXdlhtQXhmN3NCMDNzK1NLM3I2S1V6SHhBNy90dlo3dkJicExqanRQUURO
N3c2RncrbAplRU5jdzdPQlh5ZFVnc095Wi9ienRVUXVrWmtVQmFwSlNDT1RjNXdFRlBaYlpqaS94
dFN2THFVMEdwUjZmK3ZKCnRnOFJramh0MHYyWFBqVFJkS1lST1VXMEdsU3VxcGx4TXhTaVoyTE9G
TitMbnkyeTJLNzZtV0Q0V2xLSVJMMW8KbjdYRzhUeEkxWlZFajdjUWUrWFo4QU85RDRnS1pXZ2Q4
SkZtZVlwY0FOUmNZaVgzS09ya21PaXFIQ0VGQW5kbQp5akt0c3VFNGl1eTlFaEZybWxQV2xoSkVw
SWJHSDBRV2tKQ0ZiWXY2SU1kNDUyTXpXM0lxT2U3Z2VrM2NqREhlCmFETWxyT1VVVlRocVZyQWl3
cm5yCj1XeTJtCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============0361692458987767993==--

