Content-Type: multipart/mixed; boundary="===============7794435413235668287=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [block] 7647d99c22: BUG: KASAN: global-out-of-bounds in ide_cd_queue_pc at addr ffffffff853d51e0
Date: Tue, 10 Jan 2017 17:05:37 +0800
Message-ID: <20170110090537.fbqkry6oflki6w6u@wfg-t540p.sh.intel.com>
In-Reply-To: <20170110084655.GB18886@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============7794435413235668287==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

On Tue, Jan 10, 2017 at 09:46:55AM +0100, Christoph Hellwig wrote:
>> [   82.521845] BUG: KASAN: global-out-of-bounds in ide_cd_queue_pc+0xcd/=
0x2fb at addr ffffffff853d51e0
>
>Just curious:  how hard would be to resolve these function-relative addres=
ses
>to a source line (ala gdb, l *(ide_cd_queue_pc+0xcd)) automaticaly as
>part of the lkp run?

It should be relatively easy and worth trying.

Our normal kernel builds do not save vmlinux and their kconfigs are
not guaranteed to have the debug symbols built-in. However it'd be
convenient to build one extra kernel image with the above debug info
for the first-bad-commit before reporting regression out. CC Philip
for managing it as a TODO feature.

Regards,
Fengguang

--===============7794435413235668287==--

