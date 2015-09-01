Content-Type: multipart/mixed; boundary="===============5996092561674473625=="
MIME-Version: 1.0
From: Jiang Liu <jiang.liu@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [PCI, x86] 991de2e590: EIP is at _raw_spin_unlock_irqrestore
Date: Tue, 01 Sep 2015 13:37:00 +0800
Message-ID: <55E5397C.6030104@linux.intel.com>
In-Reply-To: <55dc7248.iKNpNImVAd4pyJum%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5996092561674473625==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2015/8/25 21:48, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> =

> commit 991de2e59090e55c65a7f59a049142e3c480f7bd
> Author:     Jiang Liu <jiang.liu@linux.intel.com>
> AuthorDate: Wed Jun 10 16:54:59 2015 +0800
> Commit:     Bjorn Helgaas <bhelgaas@google.com>
> CommitDate: Thu Jul 30 14:05:57 2015 -0500
> =

>     PCI, x86: Implement pcibios_alloc_irq() and pcibios_free_irq()
>     =

>     To support IOAPIC hotplug, we need to allocate PCI IRQ resources on d=
emand
>     and free them when not used anymore.
>     =

>     Implement pcibios_alloc_irq() and pcibios_free_irq() to dynamically
>     allocate and free PCI IRQs.
>     =

>     Remove mp_should_keep_irq(), which is no longer used.
>     =

>     [bhelgaas: changelog]
>     Signed-off-by: Jiang Liu <jiang.liu@linux.intel.com>
>     Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
>     Acked-by: Thomas Gleixner <tglx@linutronix.de>

Hi Bjorn and Fengguang,
	I have tracked down this regression, it's caused by a flaw
in ACPI BIOS implementation, and I have a draft patch for it.
I will send out the patch after v4.3-rc1 is out with more testings.
Thanks!
Gerry

--===============5996092561674473625==--

