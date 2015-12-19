Content-Type: multipart/mixed; boundary="===============0885030993202352212=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [x86/irq] 4c24cee6b2: IP-Config: Auto-configuration of network failed
Date: Sat, 19 Dec 2015 21:31:32 +0100
Message-ID: <alpine.DEB.2.11.1512192130450.28591@nanos>
In-Reply-To: <566FC762.1040107@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0885030993202352212==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 15 Dec 2015, Jiang Liu wrote:
> Hi Boris and Ying,
> 	Aha, found a possible regression. Could you please help to
> apply the attached bugfix patch ontop of "cc22b9b83f6a x86/irq:
> Enhance __assign_irq_vector() to rollback in case of failure"?
> Hi Ying, I have push this patch to github so it should reach
> 0day test farm soon:)

So if that's fixed, can you please resend the series with everything
folded back?

Thanks,

	tglx

--===============0885030993202352212==--

