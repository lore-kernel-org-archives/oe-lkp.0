Content-Type: multipart/mixed; boundary="===============0269542614987676480=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [microcode/load_module] WARNING: CPU: 0 PID: 1444 at kernel/sched/core.c:7094 __might_sleep+0x51/0x16f()
Date: Thu, 07 Aug 2014 14:11:37 +0200
Message-ID: <20140807121137.GT9918@twins.programming.kicks-ass.net>
In-Reply-To: <87r40scy3k.fsf@rustcorp.com.au>
List-Id: <oe-lkp.lists.linux.dev>

--===============0269542614987676480==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 07, 2014 at 09:26:15PM +0930, Rusty Russell wrote:
> Peter Zijlstra <peterz@infradead.org> writes:
> > On Wed, Aug 06, 2014 at 05:12:24AM +0800, Fengguang Wu wrote:
> >> Greetings,
> >> =

> >> Here is a microcode/load_module error triggered by debug check commit
> >> 64c2181bc433b17f04da8fe8592aa83cceac9606 ("sched: Debug nested
> >> sleeps"):
> =

> Hmm, google lead me to that.  Yuck, that's subtle.

It is, hence it would be _good_ to have debug infrastructure to help
out.

> > +++ b/kernel/module.c
> > @@ -3094,6 +3094,28 @@ static int may_init_module(void)
> >  	return 0;
> >  }
> >  =

> > +int wait_finished_loading(struct module *mod)
> > +{
> =

> Is this something we can generalize?  At least needs a comment on
> why we don't just use the normal wait_event_interruptible...

I've so far not generalized this because I feel (but maybe other people
feel differently) that we should not do these things if at all possible,
and thus we should not make it too easy.

But sure I can add a comment..

--===============0269542614987676480==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.sig"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEuNC4xMiAoR05V
L0xpbnV4KQoKaVFJY0JBRUJBZ0FHQlFKVDQyejVBQW9KRUhaSDRhUkx3T1M2SlNjUUFKUTJjSUF4
OThZc0VuWlp2Wm56bGpIWApHTXRjZ3dHUGhvWlJXeC9TSkl2VjJ3WStub21FY2V3eXBTbjlzT2pz
Uy8wL3hQemE5S2thSyt1Ynoya2JUaWptCmEzV1pFdnMvcGJlWWFIN21acS9QVTNqNUVnTzd3QWd3
QjBlQTdpbG5COStPbUdOYWcyZTFaVWp3aFM1bFpoQU4KMm1pMklqNnBYTndjWk9NR1ovQmdiTnZ1
TXEwcmtjckNaalFOODlyQlJwRWVhdEpGdU4yU29KNm8vMC9oTXlsegozeC9PaW4yU0ZQdkRHMDVt
ZDNwRFdIU1hoRCtjODJNSWJrOXRtaUgycjVUR09uclBzTTl1REV5Y2ZaODZYQTZOCjhJMDRtOThQ
RUpMNHhDVUlRL2hNZS9WSG1LZS9jcnl2NVBjVEtWMVppWVBUM2U0WDFnaVRBQ0h3QXhCNlBMcVoK
cVhXbTdYMzg3OFZibHlOZThOTU9JNWhZL3gxellySjl0Y0U4TFAya2xtd0JTNFFXZEhvZ0ZnVVAr
cUpJKzNFdwp0cUFEWjA3L2I2aWxSb250UHkzY2hmM2Q2bkNlV2hNWk02L3Y5VU4yTWthN00vaTdD
YTZ1ajl6RjBneG92QVNCClhkVG80SlRTL2ZueFBKaWpYclA3TFo0amE4cHpLbnl1MHhMSVRxNzIr
SXJoVTMrdHBvTndWL0RlY2k2a2YxQngKTkNGZ1QvQmlCWDhyOGQzdFBJcDF4UVdkQk1tUHZKVmhU
V29waFNGcktEUFhhb3lPcGJseGlXaFpOOVQzSzhNUgpTZUFGZlhmWis5ZVhOQ29GSlJ4SFBHa0lu
bkVvTit1dVNIQm5HRGFweUpwYzBocmlsM05kL05VZUQwTVNQMm1qCkVhc2NoUW80RThwUTNLVUh0
bVk5Cj12eHc4Ci0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============0269542614987676480==--

