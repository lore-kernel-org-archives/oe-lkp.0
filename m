Content-Type: multipart/mixed; boundary="===============5481511728843033033=="
MIME-Version: 1.0
From: Borislav Petkov <bp@alien8.de>
To: lkp@lists.01.org
Subject: Re: [x86/irq] 4c24cee6b2: IP-Config: Auto-configuration of network failed
Date: Mon, 14 Dec 2015 10:54:27 +0100
Message-ID: <20151214095427.GA11638@pd.tnic>
In-Reply-To: <87d1u9ikqd.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5481511728843033033==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 14, 2015 at 02:54:02PM +0800, Huang, Ying wrote:
> No, there are no other systems reporting the same issue. I will queue
> more tests for make sure this is not a false positive.

I can trigger this too with my guest here.

I have these two ontop of rc5:

cc22b9b83f6a x86/irq: Enhance __assign_irq_vector() to rollback in case of =
failure
45dd79e03e1e x86/irq: Do not reuse struct apic_chip_data.old_domain as temp=
orary buffer
9f9499ae8e64 Linux 4.4-rc5

and my guest stalls while booting.

The new thing I see in dmesg is this:

 ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D-1
+..MP-BIOS bug: 8254 timer not connected to IO-APIC
+...trying to set up timer (IRQ0) through the 8259A ...
+..... (found apic 0 pin 2) ...
+....... failed.
+...trying to set up timer as Virtual Wire IRQ...
+..... failed.
+...trying to set up timer as ExtINT IRQ...
+..... works.
+APIC calibration not consistent with PM-Timer: 111ms instead of 100ms
+APIC delta adjusted to PM-Timer: 6248393 (6997337)

which leads to boot stalling and timeoutting when loading the hdd
driver:

...
[    3.973447] console [netcon0] enabled
[    3.976099] netconsole: network logging started
[    3.979604] rtc_cmos 00:00: setting system clock to 2015-12-14 10:45:35 =
UTC (1450089935)
[    3.985348] PM: Checking hibernation image partition /dev/sdb1
[    6.600706] usb 1-1: New USB device found, idVendor=3D0627, idProduct=3D=
0001
[    6.613651] usb 1-1: New USB device strings: Mfr=3D1, Product=3D3, Seria=
lNumber=3D5
[    6.636905] usb 1-1: Product: QEMU USB Tablet
[    6.642248] usb 1-1: Manufacturer: QEMU
[    6.647109] usb 1-1: SerialNumber: 42
[    7.580995] ata2.00: qc timeout (cmd 0xa0)
[    7.589300] ata2.00: TEST_UNIT_READY failed (err_mask=3D0x5)
[    7.750715] ata2.01: NODEV after polling detection
[    7.759605] ata2.00: configured for MWDMA2
[    8.585691] input: QEMU QEMU USB Tablet as /devices/pci0000:00/0000:00:0=
1.2/usb1/1-1/1-1:1.0/0003:0627:0001.0001/input/input1
[    8.602467] hid-generic 0003:0627:0001.0001: input,hidraw0: USB HID v0.0=
1 Pointer [QEMU QEMU USB Tablet] on usb-0000:00:01.2-1/input0
[   12.760846] ata2.00: qc timeout (cmd 0xa0)
[   12.786543] ata2.00: TEST_UNIT_READY failed (err_mask=3D0x5)
[   12.796576] ata2.00: limiting speed to MWDMA2:PIO3
[   12.958455] ata2.01: NODEV after polling detection
[   12.969693] ata2.00: configured for MWDMA2
[   17.972782] ata2.00: qc timeout (cmd 0xa0)
[   17.978967] ata2.00: TEST_UNIT_READY failed (err_mask=3D0x5)
[   17.983495] ata2.00: disabled
[   17.986352] ata2: soft resetting link
[   18.146586] ata2.01: NODEV after polling detection
[   18.151413] ata2: EH complete
[   32.745227] ata1: lost interrupt (Status 0x50)
[   32.748470] ata1.00: exception Emask 0x0 SAct 0x0 SErr 0x0 action 0x6 fr=
ozen
[   32.756586] ata1.00: failed command: READ DMA
[   32.761251] ata1.00: cmd c8/00:08:00:00:00/00:00:00:00:00/e0 tag 0 dma 4=
096 in
[   32.761251]          res 40/00:00:00:00:00/00:00:00:00:00/00 Emask 0x4 (=
timeout)
[   32.773928] ata1.00: status: { DRDY }
[   32.777028] ata1: soft resetting link
[   32.934437] ata1.01: NODEV after polling detection
[   32.946663] ata1.00: configured for MWDMA2
[   32.949964] ata1.00: device reported invalid CHS sector 0
[   32.953793] ata1: EH complete
[   63.849089] ata1: lost interrupt (Status 0x50)
[   63.857470] ata1.00: limiting speed to MWDMA1:PIO4
[   63.860982] ata1.00: exception Emask 0x0 SAct 0x0 SErr 0x0 action 0x6 fr=
ozen
[   63.865862] ata1.00: failed command: READ DMA
[   63.883697] ata1.00: cmd c8/00:08:00:00:00/00:00:00:00:00/e0 tag 0 dma 4=
096 in
[   63.883697]          res 40/00:00:00:00:00/00:00:00:00:00/00 Emask 0x4 (=
timeout)
[   63.899573] ata1.00: status: { DRDY }
[   63.902649] ata1: soft resetting link
[   64.062580] ata1.01: NODEV after polling detection
[   64.073800] ata1.00: configured for MWDMA1
[   64.076813] ata1.00: device reported invalid CHS sector 0
[   64.096188] ata1: EH complete

-- =

Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.

--===============5481511728843033033==--

