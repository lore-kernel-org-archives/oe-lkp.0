Content-Type: multipart/mixed; boundary="===============1755784668152989411=="
MIME-Version: 1.0
From: Jiang Liu <jiang.liu@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/irq] 4c24cee6b2: IP-Config: Auto-configuration of network failed
Date: Tue, 15 Dec 2015 15:55:14 +0800
Message-ID: <566FC762.1040107@linux.intel.com>
In-Reply-To: <20151214095427.GA11638@pd.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============1755784668152989411==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2015/12/14 17:54, Borislav Petkov wrote:
> On Mon, Dec 14, 2015 at 02:54:02PM +0800, Huang, Ying wrote:
>> No, there are no other systems reporting the same issue. I will queue
>> more tests for make sure this is not a false positive.
> =

> I can trigger this too with my guest here.
> =

> I have these two ontop of rc5:
> =

> cc22b9b83f6a x86/irq: Enhance __assign_irq_vector() to rollback in case o=
f failure
> 45dd79e03e1e x86/irq: Do not reuse struct apic_chip_data.old_domain as te=
mporary buffer
> 9f9499ae8e64 Linux 4.4-rc5
> =

> and my guest stalls while booting.
> =

> The new thing I see in dmesg is this:
> =

>  ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D-1
> +..MP-BIOS bug: 8254 timer not connected to IO-APIC
> +...trying to set up timer (IRQ0) through the 8259A ...
> +..... (found apic 0 pin 2) ...
> +....... failed.
> +...trying to set up timer as Virtual Wire IRQ...
> +..... failed.
> +...trying to set up timer as ExtINT IRQ...
> +..... works.
> +APIC calibration not consistent with PM-Timer: 111ms instead of 100ms
> +APIC delta adjusted to PM-Timer: 6248393 (6997337)
> =

> which leads to boot stalling and timeoutting when loading the hdd
> driver:
Hi Boris and Ying,
	Aha, found a possible regression. Could you please help to
apply the attached bugfix patch ontop of "cc22b9b83f6a x86/irq:
Enhance __assign_irq_vector() to rollback in case of failure"?
Hi Ying, I have push this patch to github so it should reach
0day test farm soon:)
Thanks,
Gerry

> =

> ...
> [    3.973447] console [netcon0] enabled
> [    3.976099] netconsole: network logging started
> [    3.979604] rtc_cmos 00:00: setting system clock to 2015-12-14 10:45:3=
5 UTC (1450089935)
> [    3.985348] PM: Checking hibernation image partition /dev/sdb1
> [    6.600706] usb 1-1: New USB device found, idVendor=3D0627, idProduct=
=3D0001
> [    6.613651] usb 1-1: New USB device strings: Mfr=3D1, Product=3D3, Ser=
ialNumber=3D5
> [    6.636905] usb 1-1: Product: QEMU USB Tablet
> [    6.642248] usb 1-1: Manufacturer: QEMU
> [    6.647109] usb 1-1: SerialNumber: 42
> [    7.580995] ata2.00: qc timeout (cmd 0xa0)
> [    7.589300] ata2.00: TEST_UNIT_READY failed (err_mask=3D0x5)
> [    7.750715] ata2.01: NODEV after polling detection
> [    7.759605] ata2.00: configured for MWDMA2
> [    8.585691] input: QEMU QEMU USB Tablet as /devices/pci0000:00/0000:00=
:01.2/usb1/1-1/1-1:1.0/0003:0627:0001.0001/input/input1
> [    8.602467] hid-generic 0003:0627:0001.0001: input,hidraw0: USB HID v0=
.01 Pointer [QEMU QEMU USB Tablet] on usb-0000:00:01.2-1/input0
> [   12.760846] ata2.00: qc timeout (cmd 0xa0)
> [   12.786543] ata2.00: TEST_UNIT_READY failed (err_mask=3D0x5)
> [   12.796576] ata2.00: limiting speed to MWDMA2:PIO3
> [   12.958455] ata2.01: NODEV after polling detection
> [   12.969693] ata2.00: configured for MWDMA2
> [   17.972782] ata2.00: qc timeout (cmd 0xa0)
> [   17.978967] ata2.00: TEST_UNIT_READY failed (err_mask=3D0x5)
> [   17.983495] ata2.00: disabled
> [   17.986352] ata2: soft resetting link
> [   18.146586] ata2.01: NODEV after polling detection
> [   18.151413] ata2: EH complete
> [   32.745227] ata1: lost interrupt (Status 0x50)
> [   32.748470] ata1.00: exception Emask 0x0 SAct 0x0 SErr 0x0 action 0x6 =
frozen
> [   32.756586] ata1.00: failed command: READ DMA
> [   32.761251] ata1.00: cmd c8/00:08:00:00:00/00:00:00:00:00/e0 tag 0 dma=
 4096 in
> [   32.761251]          res 40/00:00:00:00:00/00:00:00:00:00/00 Emask 0x4=
 (timeout)
> [   32.773928] ata1.00: status: { DRDY }
> [   32.777028] ata1: soft resetting link
> [   32.934437] ata1.01: NODEV after polling detection
> [   32.946663] ata1.00: configured for MWDMA2
> [   32.949964] ata1.00: device reported invalid CHS sector 0
> [   32.953793] ata1: EH complete
> [   63.849089] ata1: lost interrupt (Status 0x50)
> [   63.857470] ata1.00: limiting speed to MWDMA1:PIO4
> [   63.860982] ata1.00: exception Emask 0x0 SAct 0x0 SErr 0x0 action 0x6 =
frozen
> [   63.865862] ata1.00: failed command: READ DMA
> [   63.883697] ata1.00: cmd c8/00:08:00:00:00/00:00:00:00:00/e0 tag 0 dma=
 4096 in
> [   63.883697]          res 40/00:00:00:00:00/00:00:00:00:00/00 Emask 0x4=
 (timeout)
> [   63.899573] ata1.00: status: { DRDY }
> [   63.902649] ata1: soft resetting link
> [   64.062580] ata1.01: NODEV after polling detection
> [   64.073800] ata1.00: configured for MWDMA1
> [   64.076813] ata1.00: device reported invalid CHS sector 0
> [   64.096188] ata1: EH complete
>=20

--===============1755784668152989411==
Content-Type: text/x-patch
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-.patch"

PkZyb20gYzdjM2NjM2EwNDg1NzZmZDFlMTk2ZTY3YjExYWUwMTkzZTdmYmExZSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKRnJvbTogSmlhbmcgTGl1IDxqaWFuZy5saXVAbGludXguaW50ZWwuY29t
PgpEYXRlOiBUdWUsIDE1IERlYyAyMDE1IDE1OjQwOjQzICswODAwClN1YmplY3Q6IFtQQVRDSF0K
CgpTaWduZWQtb2ZmLWJ5OiBKaWFuZyBMaXUgPGppYW5nLmxpdUBsaW51eC5pbnRlbC5jb20+Ci0t
LQogYXJjaC94ODYva2VybmVsL2FwaWMvdmVjdG9yLmMgfCAgIDEwICsrKy0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
YXJjaC94ODYva2VybmVsL2FwaWMvdmVjdG9yLmMgYi9hcmNoL3g4Ni9rZXJuZWwvYXBpYy92ZWN0
b3IuYwppbmRleCBmMDM5NTdlN2M1MGQuLmZjZTI4NTNmNzBkOSAxMDA2NDQKLS0tIGEvYXJjaC94
ODYva2VybmVsL2FwaWMvdmVjdG9yLmMKKysrIGIvYXJjaC94ODYva2VybmVsL2FwaWMvdmVjdG9y
LmMKQEAgLTExNiwxNCArMTE2LDEzIEBAIHN0YXRpYyBpbnQgX19hc3NpZ25faXJxX3ZlY3Rvcihp
bnQgaXJxLCBzdHJ1Y3QgYXBpY19jaGlwX2RhdGEgKmQsCiAJICovCiAJc3RhdGljIGludCBjdXJy
ZW50X3ZlY3RvciA9IEZJUlNUX0VYVEVSTkFMX1ZFQ1RPUiArIFZFQ1RPUl9PRkZTRVRfU1RBUlQ7
CiAJc3RhdGljIGludCBjdXJyZW50X29mZnNldCA9IFZFQ1RPUl9PRkZTRVRfU1RBUlQgJSAxNjsK
LQlpbnQgY3B1LCBlcnI7Ci0JdW5zaWduZWQgaW50IGRlc3QgPSBkLT5jZmcuZGVzdF9hcGljaWQ7
CisJaW50IGNwdSwgZXJyID0gLUVOT1NQQzsKKwl1bnNpZ25lZCBpbnQgZGVzdDsKIAogCWlmIChk
LT5tb3ZlX2luX3Byb2dyZXNzKQogCQlyZXR1cm4gLUVCVVNZOwogCiAJLyogT25seSB0cnkgYW5k
IGFsbG9jYXRlIGlycXMgb24gY3B1cyB0aGF0IGFyZSBwcmVzZW50ICovCi0JZXJyID0gLUVOT1NQ
QzsKIAljcHVtYXNrX2NsZWFyKGQtPm9sZF9kb21haW4pOwogCWNwdW1hc2tfY2xlYXIodXNlZF9j
cHVtYXNrKTsKIAljcHUgPSBjcHVtYXNrX2ZpcnN0X2FuZChtYXNrLCBjcHVfb25saW5lX21hc2sp
OwpAQCAtMTMzLDkgKzEzMiw2IEBAIHN0YXRpYyBpbnQgX19hc3NpZ25faXJxX3ZlY3RvcihpbnQg
aXJxLCBzdHJ1Y3QgYXBpY19jaGlwX2RhdGEgKmQsCiAJCWFwaWMtPnZlY3Rvcl9hbGxvY2F0aW9u
X2RvbWFpbihjcHUsIHZlY3Rvcl9jcHVtYXNrLCBtYXNrKTsKIAogCQlpZiAoY3B1bWFza19zdWJz
ZXQodmVjdG9yX2NwdW1hc2ssIGQtPmRvbWFpbikpIHsKLQkJCWVyciA9IDA7Ci0JCQlpZiAoY3B1
bWFza19lcXVhbCh2ZWN0b3JfY3B1bWFzaywgZC0+ZG9tYWluKSkKLQkJCQlicmVhazsKIAkJCS8q
CiAJCQkgKiBOZXcgY3B1bWFzayB1c2luZyB0aGUgdmVjdG9yIGlzIGEgcHJvcGVyIHN1YnNldCBv
ZgogCQkJICogdGhlIGN1cnJlbnQgaW4gdXNlIG1hc2suIFNvIGNsZWFudXAgdGhlIHZlY3RvcgpA
QCAtMTQ0LDcgKzE0MCw3IEBAIHN0YXRpYyBpbnQgX19hc3NpZ25faXJxX3ZlY3RvcihpbnQgaXJx
LCBzdHJ1Y3QgYXBpY19jaGlwX2RhdGEgKmQsCiAJCQljcHVtYXNrX2FuZCh1c2VkX2NwdW1hc2ss
IGQtPmRvbWFpbiwgdmVjdG9yX2NwdW1hc2spOwogCQkJZXJyID0gYXBpYy0+Y3B1X21hc2tfdG9f
YXBpY2lkX2FuZChtYXNrLCB1c2VkX2NwdW1hc2ssCiAJCQkJCQkJICAgJmRlc3QpOwotCQkJaWYg
KGVycikKKwkJCWlmIChlcnIgfHwgY3B1bWFza19lcXVhbCh2ZWN0b3JfY3B1bWFzaywgZC0+ZG9t
YWluKSkKIAkJCQlicmVhazsKIAkJCWNwdW1hc2tfYW5kbm90KGQtPm9sZF9kb21haW4sIGQtPmRv
bWFpbiwKIAkJCQkgICAgICAgdmVjdG9yX2NwdW1hc2spOwotLSAKMS43LjEwLjQKCg==

--===============1755784668152989411==--

