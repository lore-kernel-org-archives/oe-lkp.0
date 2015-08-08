Content-Type: multipart/mixed; boundary="===============1296512713210436279=="
MIME-Version: 1.0
From: Norbert Holze <norbert.holze@web.de>
To: lkp@lists.01.org
Subject: btusb regression / 0a12:0001 CSR
Date: Sat, 08 Aug 2015 09:47:02 +0200
Message-ID: <55C5B3F6.8070701@web.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============1296512713210436279==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello mailing list,

my bluetooth usb-stick worked fine with kernel up to 3.19. With 4.x
there is no hci device found.

lsusb
Bus 004 Device 002: ID 0a12:0001 Cambridge Silicon Radio, Ltd Bluetooth
Dongle (HCI mode)

hcitool dev
Devices:

sudo hciconfig
hci0:	Type: BR/EDR  Bus: USB
	BD Address: 00:15:83:15:A3:0B  ACL MTU: 672:4  SCO MTU: 48:1
	DOWN
	RX bytes:890 acl:0 sco:0 events:30 errors:0
	TX bytes:126 acl:0 sco:0 commands:30 errors:0

sudo hciconfig hci0 up
Can't init device hci0: Operation not supported (95)

rfkill list
0: hci0: Bluetooth
	Soft blocked: no
	Hard blocked: no
1: phy0: Wireless LAN
	Soft blocked: no
	Hard blocked: no


Is this a regression. Or does it work in different way with 4.x?

Regards,

Norbert

--===============1296512713210436279==--

