Content-Type: multipart/mixed; boundary="===============7986124359783031325=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [genirq] cbe16f35be: will-it-scale.per_thread_ops -5.2% regression
Date: Tue, 27 Apr 2021 13:37:53 +0200
Message-ID: <87im48nejy.ffs@nanos.tec.linutronix.de>
In-Reply-To: <de61a3b5b6b1467ea7d377377c443572@hisilicon.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7986124359783031325==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 27 2021 at 09:20, Song Bao Hua wrote:
>> FYI, we noticed a -5.2% regression of will-it-scale.per_thread_ops due to
>> commit:
>> =

>> =

>> commit: cbe16f35bee6880becca6f20d2ebf6b457148552 ("genirq: Add IRQF_NO_A=
UTOEN
>> for request_irq/nmi()")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>> =

>
> Might be relevant. Can't figure out the relation between getppid and
> request_irq().

Me neither ...
--===============7986124359783031325==--

