Content-Type: multipart/mixed; boundary="===============9147044581334703478=="
MIME-Version: 1.0
From: Murali Karicheri <m-karicheri2@ti.com>
To: lkp@lists.01.org
Subject: Re: [PCI] BUG: unable to handle kernel
Date: Fri, 06 Mar 2015 10:48:59 -0500
Message-ID: <54F9CC6B.5070803@ti.com>
In-Reply-To: <54F9C407.5020602@ti.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9147044581334703478==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 03/06/2015 10:13 AM, Murali Karicheri wrote:
> On 03/06/2015 01:06 AM, Fengguang Wu wrote:
>> Greetings,
>>
>> 0day kernel testing robot got the below dmesg and the first bad commit is
>>
>> git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git
>>
>> commit 0b2af171520e5d5e7d5b5f479b90a6a5014d9df6
>> Author: Murali Karicheri<m-karicheri2@ti.com>
>> AuthorDate: Tue Mar 3 12:52:13 2015 -0500
>> Commit: Bjorn Helgaas<bhelgaas@google.com>
>> CommitDate: Tue Mar 3 14:42:58 2015 -0600
>>
>> PCI: Update DMA configuration from DT
>>
----cut-----------------
>> [ 0.576666] Modules linked in:
>> [ 0.576666] Modules linked in:
>>
>> [ 0.576666] CPU: 0 PID: 1 Comm: swapper/0 Not tainted
>> 4.0.0-rc1-00006-g0b2af17 #6
>> [ 0.576666] CPU: 0 PID: 1 Comm: swapper/0 Not tainted
>> 4.0.0-rc1-00006-g0b2af17 #6
>> [ 0.576666] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
>> BIOS 1.7.5-20140531_083030-gandalf 04/01/2014
>> [ 0.576666] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
>> BIOS 1.7.5-20140531_083030-gandalf 04/01/2014
>> [ 0.576666] task: 78060000 ti: 78068000 task.ti: 78068000
>> [ 0.576666] task: 78060000 ti: 78068000 task.ti: 78068000
>> [ 0.576666] EIP: 0060:[<79a20c33>] EFLAGS: 00010246 CPU: 0
>> [ 0.576666] EIP: 0060:[<79a20c33>] EFLAGS: 00010246 CPU: 0
>> [ 0.576666] EIP is at of_pci_dma_configure+0x33/0x70
>> [ 0.576666] EIP is at of_pci_dma_configure+0x33/0x70
>> [ 0.576666] EAX: 00000000 EBX: 78011800 ECX: 00000000 EDX: 00000005
>> [ 0.576666] EAX: 00000000 EBX: 78011800 ECX: 00000000 EDX: 00000005
>> [ 0.576666] ESI: 781d8400 EDI: 781d8000 EBP: 78069cd0 ESP: 78069cc8
>> [ 0.576666] ESI: 781d8400 EDI: 781d8000 EBP: 78069cd0 ESP: 78069cc8
>> [ 0.576666] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068
>> [ 0.576666] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068
>> [ 0.576666] CR0: 8005003b CR2: 000001c4 CR3: 0229f000 CR4: 000006d0
>> [ 0.576666] CR0: 8005003b CR2: 000001c4 CR3: 0229f000 CR4: 000006d0
>> [ 0.576666] Stack:
>> [ 0.576666] Stack:
>> [ 0.576666] 78011800
>> [ 0.576666] 78011800 78011860 78011860 78069d5c 78069d5c 7976c1ac
>> 7976c1ac 00000002 00000002 78069ce8 78069ce8 0000002e 0000002e
>> 00000000 00000000
>>
>> [ 0.576666] 00001100
>> [ 0.576666] 00001100 78011800 78011800 78011860 78011860 781d8000
>> 781d8000 00000000 00000000 00000000 00000000 00000000 00000000
>> 00000000 00000000
>>
>> [ 0.576666] 00000000
>> [ 0.576666] 00000000 00000000 00000000 00000000 00000000 00000000
>> 00000000 00000000 00000000 00000000 00000000 00000000 00000000
>> 00000000 00000000
>>
>> [ 0.576666] Call Trace:
>> [ 0.576666] Call Trace:
>> [ 0.576666] [<7976c1ac>] pci_device_add+0xbc/0x820
>> [ 0.576666] [<7976c1ac>] pci_device_add+0xbc/0x820
>> [ 0.576666] [<7976ca54>] pci_scan_single_device+0x144/0x1c0
>> [ 0.576666] [<7976ca54>] pci_scan_single_device+0x144/0x1c0
>> [ 0.576666] [<7976cb70>] pci_scan_slot+0xa0/0x230
>> [ 0.576666] [<7976cb70>] pci_scan_slot+0xa0/0x230
>> [ 0.576666] [<7976ea6a>] pci_scan_child_bus+0x5a/0x230
>> [ 0.576666] [<7976ea6a>] pci_scan_child_bus+0x5a/0x230
>> [ 0.576666] [<79894626>] ? dev_warn+0x36/0x50
>> [ 0.576666] [<79894626>] ? dev_warn+0x36/0x50
>> [ 0.576666] [<79a48cf5>] pci_acpi_scan_root+0x4c5/0x990
>> [ 0.576666] [<79a48cf5>] pci_acpi_scan_root+0x4c5/0x990
>> [ 0.576666] [<797c9be8>] acpi_pci_root_add+0x4fb/0x64d
>> [ 0.576666] [<797c9be8>] acpi_pci_root_add+0x4fb/0x64d
>> [ 0.576666] [<797be464>] ? acpi_scan_match_handler+0x9d/0x10e
>> [ 0.576666] [<797be464>] ? acpi_scan_match_handler+0x9d/0x10e
>> [ 0.576666] [<797c2a3d>] acpi_bus_attach+0x149/0x381
>> [ 0.576666] [<797c2a3d>] acpi_bus_attach+0x149/0x381
>> [ 0.576666] [<79bd0946>] ? mutex_unlock+0x16/0x30
>> [ 0.576666] [<79bd0946>] ? mutex_unlock+0x16/0x30
>> [ 0.576666] [<7989c2a0>] ? __driver_attach+0x140/0x140
>> [ 0.576666] [<7989c2a0>] ? __driver_attach+0x140/0x140
>> [ 0.576666] [<797c2be5>] acpi_bus_attach+0x2f1/0x381
>> [ 0.576666] [<797c2be5>] acpi_bus_attach+0x2f1/0x381
>> [ 0.576666] [<7989b94d>] ? device_attach+0x6d/0x120
>> [ 0.576666] [<7989b94d>] ? device_attach+0x6d/0x120
>> [ 0.576666] [<7989c2a0>] ? __driver_attach+0x140/0x140
>> [ 0.576666] [<7989c2a0>] ? __driver_attach+0x140/0x140
>> [ 0.576666] [<797c2be5>] acpi_bus_attach+0x2f1/0x381
>> [ 0.576666] [<797c2be5>] acpi_bus_attach+0x2f1/0x381
>> [ 0.576666] [<797c2d06>] acpi_bus_scan+0x91/0xa8
>> [ 0.576666] [<797c2d06>] acpi_bus_scan+0x91/0xa8
>> [ 0.576666] [<7a217b07>] acpi_scan_init+0x137/0x39d
>> [ 0.576666] [<7a217b07>] acpi_scan_init+0x137/0x39d
>> [ 0.576666] [<7a217695>] acpi_init+0x496/0x534
>> [ 0.576666] [<7a217695>] acpi_init+0x496/0x534
>> [ 0.576666] [<7a2171ff>] ? acpi_sleep_proc_init+0x5b/0x5b
>> [ 0.576666] [<7a2171ff>] ? acpi_sleep_proc_init+0x5b/0x5b
>> [ 0.576666] [<790005ae>] do_one_initcall+0x16e/0x3c0
>> [ 0.576666] [<790005ae>] do_one_initcall+0x16e/0x3c0
>> [ 0.576666] [<7a2171ff>] ? acpi_sleep_proc_init+0x5b/0x5b
>> [ 0.576666] [<7a2171ff>] ? acpi_sleep_proc_init+0x5b/0x5b
>> [ 0.576666] [<7a1b8afe>] kernel_init_freeable+0x263/0x3e4
>> [ 0.576666] [<7a1b8afe>] kernel_init_freeable+0x263/0x3e4
>> [ 0.576666] [<79bb7c49>] kernel_init+0x19/0x200
>> [ 0.576666] [<79bb7c49>] kernel_init+0x19/0x200
>> [ 0.576666] [<79bd5d01>] ret_from_kernel_thread+0x21/0x30
>> [ 0.576666] [<79bd5d01>] ret_from_kernel_thread+0x21/0x30
>> [ 0.576666] [<79bb7c30>] ? rest_init+0x180/0x180
>> [ 0.576666] [<79bb7c30>] ? rest_init+0x180/0x180
>> [ 0.576666] Code:
>> [ 0.576666] Code: 80 80 5c 5c c1 c1 7a 7a 01 01 89 89 5d 5d f8 f8 89
>> 89 c3 c3 89 89 75 75 fc fc 83 83 15 15 84 84 5c 5c c1 c1 7a 7a 00 00
>> e8 e8 df df ec ec d4 d4 ff ff 83 83 05 05 88 88 5c 5c c1 c1 7a 7a 01
>> 01 83 83 15 15 8c 8c 5c 5c c1 c1 7a 7a 00 00 89 89 c6 c6 8b 8b 00
>> 00<8b> <8b> 90 90 c4 c4 01 01 00 00 00 00 8d 8d 43 43 60 60 e8 e8 1f
>> 1f 94 94 ff ff ff ff 89 89 f0 f0 83 83 05 05 90 90 5c 5c c1 c1
>>
>> [ 0.576666] EIP: [<79a20c33>]
>> [ 0.576666] EIP: [<79a20c33>]
>> of_pci_dma_configure+0x33/0x70of_pci_dma_configure+0x33/0x70 SS:ESP
>> 0068:78069cc8
>> SS:ESP 0068:78069cc8
>> [ 0.576666] CR2: 00000000000001c4
>> [ 0.576666] CR2: 00000000000001c4
>> [ 0.576666] ---[ end trace af448c13c817976d ]---
>> [ 0.576666] ---[ end trace af448c13c817976d ]---
>>
>> git bisect start f20f4567bfc741f16e0895f4c4e845e7c51e6818
>> 13a7a6ac0a11197edcd0f756a035f472b42cdf8b --
>> git bisect good 6a85284cccce49f687a505a7952fa3889b82628d # 16:02 20+
>> 19 Merge 'kees/yama/tip' into devel-hourly-2015030422
>> git bisect bad e85ea728632a20c9830cbc5c67d64f8a302b452e # 16:05 0- 20
>> Merge 'tip/x86/asm' into devel-hourly-2015030422
>> git bisect bad 0516a34d518ed4a1ae4261736d6678094fd46142 # 16:11 0- 20
>> Merge 'spi/for-next' into devel-hourly-2015030422
>> git bisect bad d8ee2cead70b0d04c58d1a57299fe307f5616b7e # 16:49 0- 20
>> Merge 'sound/topic/hda-unbind' into devel-hourly-2015030422
>> git bisect bad ccbd4806f70ac1599934b7c17582f44af02edca8 # 17:09 0- 20
>> Merge 'perf/tmp.perf/trace_ordered_events' into devel-hourly-2015030422
>> git bisect good a8c718ae516eeb6366d899bae02ebb409ced5453 # 17:12 20+ 0
>> Merge 'mripard/sunxi/dt-for-4.1' into devel-hourly-2015030422
>> git bisect bad 941b9d9416bbace6161718d173a526f9dfd10762 # 17:14 0- 20
>> Merge 'pci/pci/murali-v8' into devel-hourly-2015030422
>> git bisect good 6675a601d72be408025e675599702e30a99188aa # 17:19 20+
>> 16 PCI: Add helper functions pci_get[put]_host_bridge_device()
>> git bisect bad 0b2af171520e5d5e7d5b5f479b90a6a5014d9df6 # 17:21 0- 20
>> PCI: Update DMA configuration from DT
>> git bisect good bdc567f9c1cb6a61100471afc95ee6200f0ba043 # 17:24 20+ 7
>> of/pci: Add of_pci_dma_configure() to update DMA configuration
>> # first bad commit: [0b2af171520e5d5e7d5b5f479b90a6a5014d9df6] PCI:
>> Update DMA configuration from DT
>> git bisect good bdc567f9c1cb6a61100471afc95ee6200f0ba043 # 17:27 60+
>> 33 of/pci: Add of_pci_dma_configure() to update DMA configuration
>> # extra tests with DEBUG_INFO
>> git bisect bad 0b2af171520e5d5e7d5b5f479b90a6a5014d9df6 # 17:40 0- 60
>> PCI: Update DMA configuration from DT
>> # extra tests on HEAD of linux-devel/devel-hourly-2015030422
>> git bisect bad f20f4567bfc741f16e0895f4c4e845e7c51e6818 # 17:41 0- 12
>> 0day head guard for 'devel-hourly-2015030422'
>> # extra tests on tree/branch pci/pci/murali-v8
>> git bisect bad da5cc6061aae665cc15835519838861437b9fdc7 # 17:56 0- 60
>> of: Calculate device DMA masks based on DT dma-range size
>> # extra tests with first bad commit reverted
>> # extra tests on tree/branch linus/master
>> git bisect good 6587457b4b3d663b237a0f95ddf6e67d1828c8ea # 18:08 60+
>> 60 Merge tag 'dma-buf-for-4.0-rc3' of
>> git://git.kernel.org/pub/scm/linux/kernel/git/sumits/dma-buf
>> # extra tests on tree/branch next/master
>>
>>
>> This script may reproduce the error.
>>
>> ------------------------------------------------------------------------=
----
>>
>> #!/bin/bash
>>
>> kernel=3D$1
>>
>> kvm=3D(
>> qemu-system-x86_64
>> -cpu kvm64
>> -enable-kvm
>> -kernel $kernel
>> -m 320
>> -smp 2
>> -net nic,vlan=3D1,model=3De1000
>> -net user,vlan=3D1
>> -boot order=3Dnc
>> -no-reboot
>> -watchdog i6300esb
>> -rtc base=3Dlocaltime
>> -serial stdio
>> -display none
>> -monitor null
>> )
>>
>> append=3D(
>> hung_task_panic=3D1
>> earlyprintk=3DttyS0,115200
>> rd.udev.log-priority=3Derr
>> systemd.log_target=3Djournal
>> systemd.log_level=3Dwarning
>> debug
>> apic=3Ddebug
>> sysrq_always_enabled
>> rcupdate.rcu_cpu_stall_timeout=3D100
>> panic=3D-1
>> softlockup_panic=3D1
>> nmi_watchdog=3Dpanic
>> oops=3Dpanic
>> load_ramdisk=3D2
>> prompt_ramdisk=3D0
>> console=3DttyS0,115200
>> console=3Dtty0
>> vga=3Dnormal
>> root=3D/dev/ram0
>> rw
>> drbd.minor_count=3D8
>> )
>>
>> "${kvm[@]}" --append "${append[*]}"
>> ------------------------------------------------------------------------=
----
>>
>>
>> Thanks,
>> Fengguang
> Fengguang,
>
> Could you or someone point me to the DT file for this platform? I looked
> at the config file and it has CONFIG_OF enabled. Wondering if it has
> dma-ranges defined? This series was tested on ARM platforms that uses
> dma-ranges. If someone can point me to the DT file, this will give me a
> clue on what is going on here.
>
Bjorn,

Looks like there is a NULL being encountered (either root bridge or root =

bridge's parent) in the patch. I have added check for this and attached =

a debug patch. Can this be applied so that we can look at the boot log =

for clue? Meanwhile if someone can point me to the DTS for this =

platform, that will help to debug this.

I am assuming dma-ranges is not defined. So one of these could be NULL. =

I am not sure why it could be NULL on this platform though. Any clue?

Murali

-- =

Murali Karicheri
Linux Kernel, Texas Instruments

--===============9147044581334703478==
Content-Type: text/x-diff
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-pci-of-fix-kernel-crash.patch"

PkZyb20gMDk4YjRmNWU0YWI5NDA3ZmJkYmZjY2EzYTkxNzg1YzE3ZTI1Y2YwMyBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKRnJvbTogTXVyYWxpIEthcmljaGVyaSA8bS1rYXJpY2hlcmkyQHRpLmNv
bT4KRGF0ZTogRnJpLCA2IE1hciAyMDE1IDEwOjIzOjA4IC0wNTAwClN1YmplY3Q6IFtQQVRDSF0g
cGNpOiBvZiA6IGZpeCBrZXJuZWwgY3Jhc2gKClRoaXMgaXMgYSBkZWJ1ZyBwYXRjaCB0byByb290
IGNhdXNlIHRoZSBrZXJuZWwgY3Jhc2gKCgljb21taXQgMGIyYWYxNzE1MjBlNWQ1ZTdkNWI1ZjQ3
OWI5MGE2YTUwMTRkOWRmNgoKCVBDSTogVXBkYXRlIERNQSBjb25maWd1cmF0aW9uIGZyb20gRFQK
ClNpZ25lZC1vZmYtYnk6IE11cmFsaSBLYXJpY2hlcmkgPG0ta2FyaWNoZXJpMkB0aS5jb20+Ci0t
LQogZHJpdmVycy9vZi9vZl9wY2kuYyAgICAgICB8ICAgIDggKysrKysrKysKIGRyaXZlcnMvcGNp
L2hvc3QtYnJpZGdlLmMgfCAgICA1ICsrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL29mL29mX3BjaS5jIGIvZHJpdmVycy9vZi9vZl9w
Y2kuYwppbmRleCA4NmQzYzM4Li41YTU5ZmI4IDEwMDY0NAotLS0gYS9kcml2ZXJzL29mL29mX3Bj
aS5jCisrKyBiL2RyaXZlcnMvb2Yvb2ZfcGNpLmMKQEAgLTEyOSw2ICsxMjksMTQgQEAgdm9pZCBv
Zl9wY2lfZG1hX2NvbmZpZ3VyZShzdHJ1Y3QgcGNpX2RldiAqcGNpX2RldikKIAlzdHJ1Y3QgZGV2
aWNlICpkZXYgPSAmcGNpX2Rldi0+ZGV2OwogCXN0cnVjdCBkZXZpY2UgKmJyaWRnZSA9IHBjaV9n
ZXRfaG9zdF9icmlkZ2VfZGV2aWNlKHBjaV9kZXYpOwogCisJaWYgKCFicmlkZ2UgfHwgIWJyaWRn
ZS0+cGFyZW50KSB7CisJCWlmICghYnJpZGdlKQorCQkJcHJfZXJyKCJQQ0kgYnJpZGdlIG5vdCBm
b3VuZFxuIik7CisJCWlmICghYnJpZGdlLT5wYXJlbnQpCisJCQlwcl9lcnIoIlBDSSBicmlkZ2Ug
cGFyZW50IG5vdCBmb3VuZFxuIik7CisJCXJldHVybjsKKwl9CisKIAlvZl9kbWFfY29uZmlndXJl
KGRldiwgYnJpZGdlLT5wYXJlbnQtPm9mX25vZGUpOwogCXBjaV9wdXRfaG9zdF9icmlkZ2VfZGV2
aWNlKGJyaWRnZSk7CiB9CmRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9ob3N0LWJyaWRnZS5jIGIv
ZHJpdmVycy9wY2kvaG9zdC1icmlkZ2UuYwppbmRleCAzZTViYmY5Li5lZjJhYjUxIDEwMDY0NAot
LS0gYS9kcml2ZXJzL3BjaS9ob3N0LWJyaWRnZS5jCisrKyBiL2RyaXZlcnMvcGNpL2hvc3QtYnJp
ZGdlLmMKQEAgLTI4LDYgKzI4LDExIEBAIHN0cnVjdCBkZXZpY2UgKnBjaV9nZXRfaG9zdF9icmlk
Z2VfZGV2aWNlKHN0cnVjdCBwY2lfZGV2ICpkZXYpCiAJc3RydWN0IHBjaV9idXMgKnJvb3RfYnVz
ID0gZmluZF9wY2lfcm9vdF9idXMoZGV2LT5idXMpOwogCXN0cnVjdCBkZXZpY2UgKmJyaWRnZSA9
IHJvb3RfYnVzLT5icmlkZ2U7CiAKKwlpZiAoIWJyaWRnZSkgeworCQlwcl9lcnIoIlBDSTogYnJp
ZGdlIG5vdCBmb3VuZFxuIik7CisJCXJldHVybiBOVUxMOworCX0KKwogCWtvYmplY3RfZ2V0KCZi
cmlkZ2UtPmtvYmopOwogCXJldHVybiBicmlkZ2U7CiB9Ci0tIAoxLjcuOS41Cgo=

--===============9147044581334703478==--

