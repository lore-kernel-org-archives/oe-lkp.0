Content-Type: multipart/mixed; boundary="===============0206311319143137273=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [crng_reseed] WARNING: inconsistent lock state
Date: Sun, 29 Apr 2018 20:17:45 +0800
Message-ID: <20180429121745.6csnvc2jjay6ozfc@wfg-t540p.sh.intel.com>
In-Reply-To: <CA+55aFwwsHmfn7i9TjQW73RYDctBdt4QBgyUG-OJ=+on_n0f_Q@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0206311319143137273==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 29, 2018 at 03:07:06AM +0000, Linus Torvalds wrote:
>On Sat, Apr 28, 2018 at 7:26 PM Fengguang Wu <fengguang.wu@intel.com> wr=
ote:
>
>> FYI this happens in mainline kernel 4.17.0-rc2.
>> It looks like a new regression.
>
>> It occurs in 3 out of 3 boots.
>
>> There is another "[  294.642506] BUG: sleeping function called from
>> invalid context at mm/slab.h:421" at the bottom of this long dmesg:
>
>This should be fixed by commit 6c1e851c4edc ("random: fix possible sleeping
>allocation from irq context").

Yes that fixes the bug. Sorry for the late report!

Regards,
Fengguang

--===============0206311319143137273==--

