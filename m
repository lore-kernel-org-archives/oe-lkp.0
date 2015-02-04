Content-Type: multipart/mixed; boundary="===============0335596746044418699=="
MIME-Version: 1.0
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [rcu] [ INFO: suspicious RCU usage. ]
Date: Wed, 04 Feb 2015 13:00:18 +0000
Message-ID: <20150204130018.GG8656@n2100.arm.linux.org.uk>
In-Reply-To: <1423049947.19547.6.camel@AMDC1943>
List-Id: <oe-lkp.lists.linux.dev>

--===============0335596746044418699==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 04, 2015 at 12:39:07PM +0100, Krzysztof Kozlowski wrote:
> +Cc some ARM people

I wish that people would CC this list with problems seen on ARM.  I'm
minded to just ignore this message because of this in the hope that by
doing so, people will learn something...

> > Another thing I could do would be to have an arch-specific Kconfig
> > variable that made ARM responsible for informing RCU that the CPU
> > was departing, which would allow a call to as follows to be placed
> > immediately after the complete():
> > =

> > rcu_cpu_notify(NULL, CPU_DYING_IDLE, (void *)(long)smp_processor_id());
> > =

> > Note:  This absolutely requires that the rcu_cpu_notify() -always-
> > be allowed to execute!!!  This will not work if there is -any- possibil=
ity
> > of __cpu_die() powering off the outgoing CPU before the call to
> > rcu_cpu_notify() returns.

Exactly, so that's not going to be possible.  The completion at that
point marks the point at which power _could_ be removed from the CPU
going down.

-- =

FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.

--===============0335596746044418699==--

