Content-Type: multipart/mixed; boundary="===============0363290365359388883=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched] 143e1e28cb4: +17.9% aim7.jobs-per-min, -9.7% hackbench.throughput
Date: Sun, 10 Aug 2014 17:05:03 +0200
Message-ID: <20140810150503.GV9918@twins.programming.kicks-ass.net>
In-Reply-To: <20140810105413.GA29451@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============0363290365359388883==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 10, 2014 at 06:54:13PM +0800, Fengguang Wu wrote:
> The "brickland1/aim7/6000-page_test" is the test case part.
> =

> The "TOTAL XXX" is the metric part. One test run may generate lots of
> metrics, reflecting different aspect of the system dynamics.
> =

> This view may be easier to read, by grouping the metrics by test case.

Right, at least that makes more sense.

> test case: brickland1/aim7/6000-page_test

Ok, so next question, what is a brickland? I suspect its a machine of
sorts, seeing how some others had wsm in that part of the test. Now I
know what a westmere is, but I've never heard of a brickland.

Please describe the machine, this is a topology patch, so we need to
know the topology of the affected machines.

--===============0363290365359388883==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.sig"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEuNC4xMiAoR05V
L0xpbnV4KQoKaVFJY0JBRUJBZ0FHQlFKVDU0b2ZBQW9KRUhaSDRhUkx3T1M2SHNFUC9SMWQ2NFY5
eXBESVBEWVpPQVcyYjUybApLUzhpbStKaVE1eUl5ZFZKLzhRcTI5R1dIbnVIZXJUOVVRY2pLNHdn
dXRLUWJaOER5c1NVU0VSelVHRnRMejJFCktLR1JKemZ1dEI5ZXBVbk1BaGtXZWsxcnQxS1pIbDI3
eHRRQ0Q0V0UzNE9tU09aMjlGejMvSURHTlRZM3d2MHEKbEZJZXlUUU5YdmFTRHpoTFlxYkhzb0Fm
R2RkZU94UFQxdEFUOVRVMjVRZDVndmQ3NVZ0SFZDOTlFV3MyUkNjMgphL3RBZDJuRkJpbHpoSXlk
YWZXRTIyNlRSTDVodDludVhhbjhaYlFYZTEvc3FURTNGdSt0aFRwZldOKzJVNDAzCk1hWVZKU1hl
ajJXbTZrUVdHNDJpR0JneWlwSXQ0M0FQWkdEZENJeXR0Q2lKanZVUkpqY2d4REdoRGE2WWNrOHYK
NGJxTDdzKzR3VmFxZnQwM0lCYXVnK3JjYjgxUHg1MUxQOXllaUFvQW1CY0F3M3NLOVBqMjV3NTFO
Z0RiWmo5cwpjQ0k5ZWpZQXhlL0xyYjdPKzd6NTFCbVVoZUxadmd5Yk9mbFFPaUJhTE40bkRIMmlT
eUh2U2daMExaUXJJcW5aCnFIY0JMY3BHNmNZaVBiUkhRRVBDTVUwcjJBYnpmWVRMTHFhQkFYUVVq
OEVWYzlFV1hvcklCUzFtdnFJTFpGbTUKMjNpWUNpK2NvUXdqU3I2ODRqZXljQmpKdWQrOGZqRitW
V09tWlg2YXpTaTFPZ2x3WndTalYzVS83citZZVJHaApzWElNTEgvbkM5UGpDR0Vha2UvWFpnUlR5
eGxMUlFMbERoMjkycmZRR2h5QUlQek53VkcyVktZYm1wMUdDTlBYCk02aWhtbjN3WXVDNm5sbDRV
aGRpCj1MMk1tCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============0363290365359388883==--

