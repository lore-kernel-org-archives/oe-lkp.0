Content-Type: multipart/mixed; boundary="===============4291214237845655669=="
MIME-Version: 1.0
From: Tomasz Nowicki <tomasz.nowicki@linaro.org>
To: lkp@lists.01.org
Subject: Re: [x86, pci] 123873321c4:
Date: Mon, 16 Mar 2015 14:39:51 +0100
Message-ID: <5506DD27.9080604@linaro.org>
In-Reply-To: <1426470477.6711.281.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4291214237845655669==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Ying Huang,

Indeed, the new logic is wrong, I will provide new patch.

Regards,
Tomasz

On 16.03.2015 02:47, Huang Ying wrote:
> FYI, we noticed the below changes on
>
> git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git pci/ecam-tn4
> commit 123873321c4c730f905c1c91de131772024f58ee ("x86, pci: Reorder logic=
 of pci_mmconfig_insert() function")
>
> We found new dmesg as below:
>
> [    1.551098] ACPI: Using IOAPIC for interrupt routing
> [    1.556290] HEST: Table parsing has been initialized.
> [    1.561516] PCI: Using host bridge windows from ACPI; if necessary, us=
e "pci=3Dnocrs" and report a bug
> [    1.571452] [Firmware Bug]: ACPI: BIOS _OSI(Linux) query ignored
> [    1.584690] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
> [    1.591050] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM Cl=
ockPM Segments MSI]
> [    1.599823] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug PME AE=
R PCIeCapability]
> [    1.608188] acpi PNP0A08:00: fail to add MMCONFIG information, can't a=
ccess extended PCI configuration space under this bridge.
> [    1.620188] PCI host bridge to bus 0000:00
> [    1.624464] pci_bus 0000:00: root bus resource [bus 00-ff]
> [    1.630124] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 wind=
ow]
> [    1.637091] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff wind=
ow]
> [    1.644060] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bf=
fff window]
> [    1.651849] pci_bus 0000:00: root bus resource [mem 0xc0000000-0xfffff=
fff window]
> [    1.659652] pci 0000:00:00.0: [8086:3400] type 00 class 0x060000
> [    1.665893] pci 0000:00:00.0: PME# supported from D0 D3hot D3cold
> [    1.672252] pci 0000:00:01.0: [8086:3408] type 01 class 0x060400
> [    1.678493] pci 0000:00:01.0: PME# supported from D0 D3hot D3cold
> [    1.684857] pci 0000:00:02.0: [8086:3409] type 01 class 0x060400
> [    1.691091] pci 0000:00:02.0: PME# supported from D0 D3hot D3cold
> [    1.697446] pci 0000:00:03.0: [8086:340a] type 01 class 0x060400
> [    1.703681] pci 0000:00:03.0: PME# supported from D0 D3hot D3cold
> [    1.710039] pci 0000:00:04.0: [8086:340b] type 01 class 0x060400
> [    1.716269] pci 0000:00:04.0: PME# supported from D0 D3hot D3cold
>
> Something looks suspicious:
>
> [    1.608188] acpi PNP0A08:00: fail to add MMCONFIG information, can't a=
ccess extended PCI configuration space under this bridge.
>
> Thanks,
> Ying Huang
>
>
>
> _______________________________________________
> LKP mailing list
> LKP(a)linux.intel.com
>

--===============4291214237845655669==--

