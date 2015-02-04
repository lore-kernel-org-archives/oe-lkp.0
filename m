Content-Type: multipart/mixed; boundary="===============0175709286796916028=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
To: lkp@lists.01.org
Subject: Re: [rcu] [ INFO: suspicious RCU usage. ]
Date: Wed, 04 Feb 2015 17:10:56 +0100
Message-ID: <1423066256.24415.13.camel@AMDC1943>
In-Reply-To: <20150204155615.GF5370@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0175709286796916028==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On =C5=9Bro, 2015-02-04 at 07:56 -0800, Paul E. McKenney wrote:
> On Wed, Feb 04, 2015 at 04:22:28PM +0100, Krzysztof Kozlowski wrote:
> > =

> > Actually the timeout versions but I think that doesn't matter.
> > The wait_on_bit will busy-loop with testing for the bit. Inside the loop
> > it calls the 'action' which in my case will be bit_wait_io_timeout().
> > This calls schedule_timeout().
> =

> Ah, good point.
> =

> > See proof of concept in attachment. One observed issue: hot unplug from
> > commandline takes a lot more time. About 7 seconds instead of ~0.5.
> > Probably I did something wrong.
> =

> Well, you do set the timeout to five seconds, and so if the condition
> does not get set before the surviving CPU finds its way to the
> out_of_line_wait_on_bit_timeout(), you are guaranteed to wait for at
> least five seconds.
>
> One alternative approach would be to have a loop around a series of
> shorter waits.  Other thoughts?

Right! That was the issue. It seems it works. I'll think also on
self-adapting interval as you said below. I'll test it more and send a
patch.

Best regards,
Krzysztof

> =

> > > You know, this situation is giving me a bad case of nostalgia for the
> > > old Sequent Symmetry and NUMA-Q hardware.  On those platforms, the
> > > outgoing CPU could turn itself off, and thus didn't need to tell some
> > > other CPU when it was ready to be turned off.  Seems to me that this
> > > self-turn-off capability would be a great feature for future systems!
> > =

> > There are a lot more issues with hotplug on ARM...
> =

> Just trying to clean up this particular corner at the moment.  ;-)
> =

> > Patch/RFC attached.
> =

> Again, I believe that you will need to loop over a shorter timeout
> in order to get reasonable latencies.  If waiting a millisecond at
> a time is an energy-efficiency concern (don't know why it would be
> in this rare case, but...), then one approach would be to start
> with very short waits, then increase the wait time, for example,
> doubling the wait time on each pass through the loop would result
> in a smallish number of wakeups, but would mean that you waited
> no more than twice as long as necessary.
> =

> Thoughts?



--===============0175709286796916028==--

