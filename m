Content-Type: multipart/mixed; boundary="===============6670384971806619744=="
MIME-Version: 1.0
From: Boqun Feng <boqun.feng@gmail.com>
To: lkp@lists.01.org
Subject: Re: [locking/ww_mutex] 857811a371 INFO: task swapper/0:1 blocked for more than 120 seconds.
Date: Fri, 10 Mar 2017 17:45:41 +0800
Message-ID: <20170310094541.4ou4t3iuauqqxjvt@tardis>
In-Reply-To: <20170310030746.43zyebko27f62ehd@tardis>
List-Id: <oe-lkp.lists.linux.dev>

--===============6670384971806619744==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 10, 2017 at 11:07:46AM +0800, Boqun Feng wrote:
> On Fri, Mar 10, 2017 at 10:56:49AM +0800, Fengguang Wu wrote:
> > Hi Boqun,
> > =

> =

> Hello Fengguang,
> =

> > FYI here is another bisect result. I report it once again since the
> > attached reproduce-* may be more handy for debug. :)
> > =

> =

> That's very helpful! lkp is a bit difficult for me to set up ;-)
> =


Hmm... hit this when run the reproduce script:

early console in setup code
KVM internal error. Suberror: 3
extra data[0]: 80000306
extra data[1]: 31
RAX=3D0000000000000000 RBX=3Dffffffff800c0038 RCX=3D1ffffffff0d8c301 RDX=3D=
dffffc0000000000
RSI=3D0000000000000001 RDI=3Dffffffff86c61e78 RBP=3Dffffffff800c0028 RSP=3D=
ffffffff800c0000
R8 =3D0000000000000001 R9 =3D0000000000000001 R10=3Dffffffff85e07bd0 R11=3D=
ffffffff85e079d7
R12=3D0000000000000006 R13=3D0000000000000003 R14=3D00000000000199a0 R15=3D=
0000000000000001
RIP=3Dffffffff84a84715 RFL=3D00010046 [---Z-P-] CPL=3D0 II=3D0 A20=3D1 SMM=
=3D0 HLT=3D0
ES =3D0000 0000000000000000 ffffffff 00000000
CS =3D0010 0000000000000000 ffffffff 00a09b00 DPL=3D0 CS64 [-RA]
SS =3D0000 0000000000000000 ffffffff 00000000
DS =3D0000 0000000000000000 ffffffff 00000000
FS =3D0000 0000000000000000 ffffffff 00000000
GS =3D0000 ffffffff8737a000 ffffffff 00000000
LDT=3D0000 0000000000000000 ffffffff 00000000
TR =3D0020 0000000000000000 00000fff 00808b00 DPL=3D0 TSS64-busy
GDT=3D     ffffffff8738c000 0000007f
IDT=3D     ffffffff877ad000 00000fff
CR0=3D80050033 CR2=3Dffff880000014200 CR3=3D0000000007567000 CR4=3D000000a0
DR0=3D0000000000000000 DR1=3D0000000000000000 DR2=3D0000000000000000 DR3=3D=
0000000000000000
DR6=3D00000000ffff0ff0 DR7=3D0000000000000400
EFER=3D0000000000000d01
Code=3D00 00 00 00 00 00 00 01 00 00 00 00 00 00 00 88 47 a8 84 ff <ff> ff =
ff 07 67 72 81 ff ff ff ff d0 7a b6 86 ff ff ff ff 79 84 4e 81 ff ff ff ff =
8b 25 d2

Using reproduce script for some other kernel is fine. Any idea?

My host is ArchLinux with kernel 4.9.11-1-ARCH.

Regards,
Boqun

--===============6670384971806619744==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUFCQ0FBZEZpRUVqNUlvc1FUUHo4
WFUxd1JIU1hub3c3VUgrcmdGQWxqQ2RjRUFDZ2tRU1hub3c3VUgKK3JoWmpRZitQRnRXelYwRjZH
MTAvR2xieTl6cXdqZU1tSnhkMXQ2TE5xYnlGN2MrM0YycDFaOGVKYnNleHU1bgpNZXBCY0xpclhW
aGc1TEpISFpPL1VqY09mUGRMckN3dk9YZXZDTENRdUZnWjMwODdPaVRzR1RXUnVkdUtLRUlnCnlw
TGs2dElVWmlhenozVzZmV0VCK3ZzZjFRa2tEM1E0b005Zk93R3gyUmMwVkhGS1UwNmJXNnl6NERz
UFFjSEkKMDU3YnZPdXNDbWJpYjh0amswaVhBU3dmZmZJWEhDUXRmSjNrcnhtSmlHdERTaVZvZy9w
a0RFeDEzd2c3V2wwdgpwQWNjMi9FRm8waWVtUzJsSTQzNVVMcmlpbGVWZGxtOTA2Q0Z4bitzU2Fk
WVpORWVBV2RPbWl4enhKTThyMGNVCkd6L2hHMWcySjVYbGxFTDNDcmtKb3kzdmx5MnhHQT09Cj1V
dlJlCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============6670384971806619744==--

