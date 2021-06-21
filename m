Content-Type: multipart/mixed; boundary="===============8374616409697198679=="
MIME-Version: 1.0
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: lkp@lists.01.org
Subject: Re: [init/initramfs.c] e7cb072eb9: invoked_oom-killer:gfp_mask=0x
Date: Mon, 21 Jun 2021 19:02:05 +0200
Message-ID: <f53c0e44-c0c0-8631-50c5-1c5bb549c629@rasmusvillemoes.dk>
In-Reply-To: <20210611084817.GB26476@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============8374616409697198679==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/06/2021 10.48, Oliver Sang wrote:

>>> To reproduce:
>>>
>>>         # build kernel
>>> 	cd linux
>>> 	cp config-5.12.0-11533-ge7cb072eb988 .config
>>> 	make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Di386 olddefconfig prepare module=
s_prepare bzImage modules
>>> 	make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Di386 INSTALL_MOD_PATH=3D<mod-ins=
tall-dir> modules_install
>>> 	cd <mod-install-dir>
>>> 	find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz

Hm, when I do this with that exact commit, config, command lines and
Ubuntu's idea of what gcc-9 is, I get a modules.cgz of 73MB,
decompressing to 215MB. But in the two dmesg captures you've sent, there
are lines

[    0.016519] RAMDISK: [mem 0x74c12000-0x7fffffff]
[    0.023424] RAMDISK: [mem 0x74c16000-0x7fffffff]

corresponding to 189MB compressed. I'm wondering why there is the huge
difference.

Artificially inflating my modules.cgz to around the same size ("cp -r
lib/modules lib/modules2; cp -r lib/modules lib/modules3;") doesn't help
reproduce, unfortunately.

Rasmus
--===============8374616409697198679==--

