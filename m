Content-Type: multipart/mixed; boundary="===============3974274802325061209=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [clocksource] 6c52b5f3cf: stress-ng.opcode.ops_per_sec -14.4% regression
Date: Mon, 26 Apr 2021 14:39:25 +0200
Message-ID: <87pmyhte2q.ffs@nanos.tec.linutronix.de>
In-Reply-To: <20210424122920.GB85095@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3974274802325061209==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 24 2021 at 20:29, Feng Tang wrote:
> On Fri, Apr 23, 2021 at 07:02:54AM -0700, Paul E. McKenney wrote:
> And I'm eager to know if there is any real case of an unreliable tsc
> on the 'large numbers' of x86 system which complies with our cpu feature
> check. And if there is, my 2/2 definitely should be dropped.   =


Nothing prevents BIOS tinkerers from trying to be 'smart'. My most
recent encounter (3 month ago) was on a laptop where TSC drifted off on
CPU0 very slowly, but was caught due to the TSC_ADJUST check in idle.

I'm still thinking about a solution to avoid that extra timer and the
watchdog for these systems, but haven't found anything which I don't
hate with a passion yet.

Thanks,

        tglx
--===============3974274802325061209==--

