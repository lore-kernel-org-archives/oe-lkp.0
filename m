Content-Type: multipart/mixed; boundary="===============0714470126353073070=="
MIME-Version: 1.0
From: Cyril Hrubis <chrubis@suse.cz>
To: lkp@lists.01.org
Subject: Re: [LTP] 56cbb429d9: ltp.fs_fill.fail
Date: Thu, 25 Jul 2019 15:26:27 +0200
Message-ID: <20190725132617.GA23135@rei.lan>
In-Reply-To: <20190725110944.GA22106@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============0714470126353073070==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi!
> tst_test.c:1161: INFO: Testing on vfat
> tst_mkfs.c:90: INFO: Formatting /dev/loop0 with vfat opts=3D'' extra opts=
=3D''
> mkfs.vfat: unable to open /dev/loop0: Device or resource busy
> tst_mkfs.c:101: BROK: mkfs.vfat:1: tst_test.c failed with 741

This looks like mkfs.vfat got EBUSY after the loop device was
succesfully umounted.

We do run the test in a loop for several filesystems and the loop
generally does:

next:
	mkfs
	mount
	test
	umount
	goto next;

-- =

Cyril Hrubis
chrubis(a)suse.cz

--===============0714470126353073070==--

