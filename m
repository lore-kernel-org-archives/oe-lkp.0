Content-Type: multipart/mixed; boundary="===============1154253173250307232=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [clocksource] 6c52b5f3cf: stress-ng.opcode.ops_per_sec -14.4% regression
Date: Mon, 26 Apr 2021 22:05:12 +0800
Message-ID: <20210426140512.GA23119@shbuild999.sh.intel.com>
In-Reply-To: <87pmyhte2q.ffs@nanos.tec.linutronix.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============1154253173250307232==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Mon, Apr 26, 2021 at 08:39:25PM +0800, Thomas Gleixner wrote:
> On Sat, Apr 24 2021 at 20:29, Feng Tang wrote:
> > On Fri, Apr 23, 2021 at 07:02:54AM -0700, Paul E. McKenney wrote:
> > And I'm eager to know if there is any real case of an unreliable tsc
> > on the 'large numbers' of x86 system which complies with our cpu feature
> > check. And if there is, my 2/2 definitely should be dropped.   =

> =

> Nothing prevents BIOS tinkerers from trying to be 'smart'. My most
> recent encounter (3 month ago) was on a laptop where TSC drifted off on
> CPU0 very slowly, but was caught due to the TSC_ADJUST check in idle.

Thanks for sharing the info! So this laptop can still work with the
tsc_adjust check and restore, without triggering the 'unstable' alarm.

Why are those BIOSes playing the trick? Maybe some other OS has hard limit
for SMI's maxim handling time, so they try to hide the time?

> I'm still thinking about a solution to avoid that extra timer and the
> watchdog for these systems, but haven't found anything which I don't
> hate with a passion yet.

I see. So should I hold my two patches (tsc_adjust timer and tsc watchdog
check lifting) for a while?

Thanks,
Feng

> Thanks,
> =

>         tglx
--===============1154253173250307232==--

