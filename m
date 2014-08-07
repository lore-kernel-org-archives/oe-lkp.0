Content-Type: multipart/mixed; boundary="===============5909051313222103364=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [setsockopt] WARNING: CPU: 0 PID: 1444 at kernel/sched/core.c:7088 __might_sleep+0x51/0x16f()
Date: Thu, 07 Aug 2014 19:29:01 +0200
Message-ID: <20140807172901.GH3588@twins.programming.kicks-ass.net>
In-Reply-To: <20140807172514.GY9918@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============5909051313222103364==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 07, 2014 at 07:25:14PM +0200, Peter Zijlstra wrote:
> > This isn't the only place that we queue a message for the signalling
> > daemon after a prepare_to_wait() uninterruptibly so this patch would
> > be incomplete as is.
> =

> I'm not sure I follow, this is the only place you do so while then going
> to sleep. All other sites don't sleep while they're enqueued on the
> waitqueue.

Argh, my brain is fried, you're quite right.  I'll go have another stab
at it tomorrow or so.

--===============5909051313222103364==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.sig"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEuNC4xMiAoR05V
L0xpbnV4KQoKaVFJY0JBRUJBZ0FHQlFKVDQ3ZGRBQW9KRUhaSDRhUkx3T1M2SUpZUC9BZ25hR0hE
dUdYSTJ6MXJaR2dJV08wZQpwSURiMktEV25pM3BNaEZNWDVjcUhHVVI5R3dUU0phclFhMFRVcnpI
dnhJeGdPem5xaWorTjM5dUZEVSs1VkxWCjVycjFDUnp5T0NDSFJBUDRocjhIMFQ2TGtUUmVzaDJn
YmpFNEVPRXZadmxmRmZZd2pHd3hOWm1naHpyTVZjdkcKdkpZUnRHV1UxUE00R2UzV1VJRklnRUV0
TFRsa3JGb3dCeGNsc2lCRzVmaEJNR2p6VUlDYVdzOG90K1hwbmk5OApzNkVxRTFWTm5GUGpKNHZ2
ajZDaUhsWC80MGIzYlRCMDRJb3hNRUZBZjMvQmNZUzQxYzFFUTNxMGVLZ3I4NitPCmhJM0luSDcv
VldLL0E5QS9ROTlJbjU1bkxRci9aQ1ZWQ3RGT0wwUUpBLzJRT3ROZ2FjWkt1UFp5Zzg0T25ISE4K
WkhHUEEyWWtRaEwweEwzb0FnS3FrYTJxdUZ1QTBGQTE4VlFqa3ZVcFRXbHRFdS9CTUxwMFMvcG5z
L0dEZW5CaQpZa0lSckp1SytiREcwS0Q5N1hOR1BlUlhvOTAzQnhJY3VCRVNzbHArS2JDNi83MFdk
dmJJY1U0cS9tSnZ1SGZWCnhXMnVqRFl5VmYrUFJPc1RwZjNTRnRXTWJmekFDbE1yaDZYMnd4NjlW
aWdOZlFRd2wyTkZYcFAzNkl6WEh0ZnIKN2loeFZGd3hoQk52a1JzenFrWWxCZzJqaWx1WEljSGJU
Q25yclVuNmdrUDJvMnFuMXBtWitXYVJaVTdzVVcwNgpFWTI5S0Z0R2p2V3JaQ1FmcHAyVHJpQU8y
MGJwc3c4bTlsSGU3VFdZYUY5MTk0QTdWSHNpdnV1ZnNYZUtqZmx6ClZONXR1ZzN2OUhRQ1l2aGF4
aDlPCj1YdDloCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============5909051313222103364==--

