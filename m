Content-Type: multipart/mixed; boundary="===============4608074195422324834=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [irqdomain] 601b26a867: BUG:kernel_hang_in_boot_stage
Date: Thu, 16 Feb 2017 09:31:35 +0100
Message-ID: <alpine.DEB.2.20.1702160930240.3543@nanos>
In-Reply-To: <20170216012621.GB14534@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============4608074195422324834==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 16 Feb 2017, kernel test robot wrote:
> FYI, we noticed the following commit:
> =

> commit: 601b26a867a514b6d43e85a6b0dad937a41feed6 ("irqdomain: Avoid activ=
ating interrupts more than once")
> url: https://github.com/0day-ci/linux/commits/Marc-Zyngier/irqdomain-Avoi=
d-activating-interrupts-more-than-once/20170118-033226
 =

That's been reported by 0day before and it's fixed with commit:

       aaaec6fc7554: x86/irq: Make irq activate operations symmetric

Thanks,

	tglx

--===============4608074195422324834==--

