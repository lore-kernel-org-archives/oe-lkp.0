Content-Type: multipart/mixed; boundary="===============2307445694976086024=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [genirq/msi] 495c66aca3: BUG:sleeping_function_called_from_invalid_context_at_kernel/locking/mutex.c
Date: Mon, 10 Jan 2022 21:43:36 +0100
Message-ID: <87fspvqq2v.ffs@tglx>
In-Reply-To: <da2cd97c-bd64-ebbd-549b-259ca56e3023@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2307445694976086024==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 28 2021 at 20:25, Heiner Kallweit wrote:
> On 28.12.2021 19:40, Thomas Gleixner wrote:
>>  	if (jumbo_max)
>>  		netdev_info(dev, "jumbo features [frames: %d bytes, tx checksumming: =
%s]\n",
>
> Thanks for the patch, I'll submit it with your SoB.

Thank you!

> Apart from pci_irq_vector() incl. underlying msi_get_virq(), are there
> more functions that must not be called from atomic context any longer?

I don't think so. The allocation/free functions were always restricted
to preemptible context.

> Maybe the new constraint should be added to kernel-doc of affected
> functions?

Probably.

Thanks,

        tglx
--===============2307445694976086024==--

