Content-Type: multipart/mixed; boundary="===============3567906283792725547=="
MIME-Version: 1.0
From: Cyril Hrubis <chrubis@suse.cz>
To: lkp@lists.01.org
Subject: Re: [LTP] [tun] a4d8f18ebc: ltp.ioctl03.fail
Date: Wed, 21 Sep 2022 09:48:33 +0200
Message-ID: <YyrB0fSRu7PvNvLi@yuki>
In-Reply-To: <202209211425.14116dd2-oliver.sang@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3567906283792725547==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi!
> tag=3Dioctl03 stime=3D1663640405
> cmdline=3D"ioctl03"
> contacts=3D""
> analysis=3Dexit
> <<<test_output>>>
> tst_test.c:1526: TINFO: Timeout per run is 0h 02m 30s
> ioctl03.c:76: TINFO: Available features are: 0x7533
> ioctl03.c:80: TPASS: TUN 0x1
> ioctl03.c:80: TPASS: TAP 0x2
> ioctl03.c:80: TPASS: NO_PI 0x1000
> ioctl03.c:80: TPASS: ONE_QUEUE 0x2000
> ioctl03.c:80: TPASS: VNET_HDR 0x4000
> ioctl03.c:80: TPASS: MULTI_QUEUE 0x100
> ioctl03.c:80: TPASS: IFF_NAPI 0x10
> ioctl03.c:80: TPASS: IFF_NAPI_FRAGS 0x20
> ioctl03.c:85: TFAIL: (UNKNOWN 0x400)

Obviously the test fails since new flag has been advertised. The test
will have to be updated once/if this commit hits mainline.

-- =

Cyril Hrubis
chrubis(a)suse.cz
--===============3567906283792725547==--

