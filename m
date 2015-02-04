Content-Type: multipart/mixed; boundary="===============7470200957766891525=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
To: lkp@lists.01.org
Subject: Re: [rcu] [ INFO: suspicious RCU usage. ]
Date: Wed, 04 Feb 2015 17:43:44 +0100
Message-ID: <1423068224.24415.15.camel@AMDC1943>
In-Reply-To: <20150204162814.GG5370@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7470200957766891525==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On =C5=9Bro, 2015-02-04 at 08:28 -0800, Paul E. McKenney wrote:
> On Wed, Feb 04, 2015 at 05:10:56PM +0100, Krzysztof Kozlowski wrote:
> > On =C5=9Bro, 2015-02-04 at 07:56 -0800, Paul E. McKenney wrote:
> > > On Wed, Feb 04, 2015 at 04:22:28PM +0100, Krzysztof Kozlowski wrote:
> > > > =

> > > > Actually the timeout versions but I think that doesn't matter.
> > > > The wait_on_bit will busy-loop with testing for the bit. Inside the=
 loop
> > > > it calls the 'action' which in my case will be bit_wait_io_timeout(=
).
> > > > This calls schedule_timeout().
> > > =

> > > Ah, good point.
> > > =

> > > > See proof of concept in attachment. One observed issue: hot unplug =
from
> > > > commandline takes a lot more time. About 7 seconds instead of ~0.5.
> > > > Probably I did something wrong.
> > > =

> > > Well, you do set the timeout to five seconds, and so if the condition
> > > does not get set before the surviving CPU finds its way to the
> > > out_of_line_wait_on_bit_timeout(), you are guaranteed to wait for at
> > > least five seconds.
> > >
> > > One alternative approach would be to have a loop around a series of
> > > shorter waits.  Other thoughts?
> > =

> > Right! That was the issue. It seems it works. I'll think also on
> > self-adapting interval as you said below. I'll test it more and send a
> > patch.
> =

> Sounds good!
> =

> Are you doing ARM, ARM64, or both?  I of course vote for both.  ;-)

I'll do both but first I need to find who has ARM64 board in my team.

Best regards,
Krzysztof




--===============7470200957766891525==--

