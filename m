Content-Type: multipart/mixed; boundary="===============0914301510294868382=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched/numa] a43455a1d57: +94.1% proc-vmstat.numa_hint_faults_local
Date: Sat, 02 Aug 2014 06:26:43 +0200
Message-ID: <20140802042643.GM19379@twins.programming.kicks-ass.net>
In-Reply-To: <53DC06FA.8030104@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0914301510294868382==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 01, 2014 at 11:30:34PM +0200, Jirka Hladky wrote:
> I see the regression only on this box. It has 4 "Ivy Bridge-EX" Xeon E7-4=
890
> v2 CPUs.

That's the exact CPU I've got in the 4 node machine I did the tests on.


--===============0914301510294868382==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.sig"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEuNC4xMiAoR05V
L0xpbnV4KQoKaVFJY0JBRUJBZ0FHQlFKVDNHaCtBQW9KRUhaSDRhUkx3T1M2SmRnUC8xc3JiaXNL
RHlCUkYzT1dqUTNJMExiLwphQWZPSUtnQ2JBNEJTVDhzN0YvOUsvaE93R0hpa1RlL29rcGlDcXRM
cVFoTjhCVG5Idm5WOWNwREFuMWxEU2xUCkZMUFpZSFJYTWo5cER1L2FLUjRxMmgrU09QVmU0OXhT
OWd5Wk96ZC9RWm9GRTVEbHFTZmdUYjVTSFJzZDlGMmQKNjJjanZ5WlJORnI1VWVHWm53WXFBUGVW
K2xtMUJiTVhWckpuVm5HaVNBOHZsRjV6MmU0MDExWldqNUVmYVBKLwpxWjcyWUdPNGlhSTNiLzBH
YUc5aWh4RE9KR3pYVHp2MVpxUU1zWDNVWW9kOE1ybm1iYmN1RlNOS0tDd3FoL1hGCmRHTk9zSVBD
eHZtQ2dlUG05bE9FZ0xkZ2ZLOVhNc25paXlmbHBGL2tQekNoRVowcjlsNHVWcDg3QmVZS1BTKy8K
eXRVU3RsODFiUXJRcmpZUUdOSFk2NjFtNlVLd2JoUDJQWVFQUm5vbU5saVR0ajQxRnBKNDIxaGtu
eXgzcHBQdQpQWGRJTDh2Qk9CNXQ0dDNqTnNIVHgwSWl0a1dhdXQwMUJDbEdhaWVLaGZQYy9yUnZG
RWhlZmxPbmRPSHBYRHhQCjhaVU1zdE95Umx3SUkyTEFzRW1ueWwvbFV5OFY0Q24xWTErRHZQUVBG
eHFkcTJTR2ZETmdyV1YxYTkvbzlpSEwKNm1KWE41eUpTZSt0c3ZZRHZ0MmpIVnVZdDZ6V1U0U3BP
SFE5MHVmcnpteFNsYnF1U3liU1orZGp3ZiszOHVpNApQK2dGZmpmWkQrSjVnRHRoS2twSVN0Q0Uv
b2pFYUw5d0NnT04rdStqRGdZcXpPcSszVGxLbFdaOXJveG8wcFZTCkFzY1BKL0VLaERzWjBzVFN0
cjRvCj1qSXN5Ci0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============0914301510294868382==--

