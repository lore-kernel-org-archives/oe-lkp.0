Content-Type: multipart/mixed; boundary="===============3723761120942862592=="
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
To: lkp@lists.01.org
Subject: Re: [gpio] 3c702e9987: kmsg.user_verbs:couldn't_register_device_number
Date: Wed, 24 Feb 2016 17:01:52 +0100
Message-ID: <CACRpkdb1bSJA9-XNpBtw6knZHb1J+EtpFqryN=1OtnWcYP4rBQ@mail.gmail.com>
In-Reply-To: <877fhw0w9p.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3723761120942862592==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 23, 2016 at 7:35 AM, Huang, Ying <ying.huang@intel.com> wrote:

>> On Mon, Feb 15, 2016 at 3:39 AM, Huang, Ying <ying.huang@intel.com> wr=
ote:
>>> Michael Welling <mwelling@ieee.org> writes:

>> Then dmesg |grep CHARDEV should tell what we need to know.
>
> Sorry for late, the dmesg with the patch is attached.  And the output of
> dmesg | grep CHARDEV is as follow:
>
> [    0.750037] CHARDEV: allocate major 254 for "gpiochip"
> [    0.897928] CHARDEV: allocate major 253 for "tpm"
> [    0.904196] CHARDEV: allocate major 252 for "ndctl"
> [    0.905295] CHARDEV: allocate major 251 for "dimmctl"
> [    0.909573] CHARDEV: allocate major 250 for "pps"
> [    0.913740] CHARDEV: allocate major 249 for "ptp"
> [    0.916711] CHARDEV: allocate major 248 for "iio"
> [    1.227597] CHARDEV: allocate major 247 for "bsg"
> [    1.577194] CHARDEV: allocate major 246 for "gsmtty"
> [    1.614921] CHARDEV: allocate major 245 for "ttyn"
> [    1.616044] CHARDEV: allocate major 244 for "ttyARC"
> [    1.617177] CHARDEV: allocate major 243 for "ttyRP"
> [    1.618310] CHARDEV: allocate major 242 for "ttyLP"
> [    1.620618] CHARDEV: allocate major 241 for "noz"
> [    1.621707] CHARDEV: allocate major 240 for "ttyIPWp"
> [    1.630024] CHARDEV: allocate major 239 for "telco_clock"
> [    1.632315] CHARDEV: allocate major 239 for "cmm"
> [    1.681375] CHARDEV: allocate major 238 for "hpilo"
> [    1.696757] CHARDEV: allocate major 237 for "aac"
> [    1.699338] CHARDEV: allocate major 236 for "megadev_legacy"
> [    1.704680] CHARDEV: allocate major 235 for "megaraid_sas_ioctl"
> [    1.731179] CHARDEV: allocate major 234 for "pmcsas"
> [    1.737520] CHARDEV: allocate major 233 for "nvme"
> [    2.388531] CHARDEV: allocate major 232 for "firewire"
> [    2.389743] CHARDEV: allocate major 231 for "uio"
> [    2.904429] CHARDEV: allocate major 230 for "ttySDIO"
> [    2.922374] CHARDEV: allocate major 229 for "ib_qib"
> [    2.927559] CHARDEV: allocate major 228 for "hidraw"
> [    2.952328] CHARDEV: allocate major 227 for "fwtty"
> [    2.953435] CHARDEV: allocate major 225 for "fwloop"

Oh that's a complete train wreck. Well I will keep working on the patch
to improve dynamic allocation of majors that I'm reiterating with
Torvalds in the look.

Yours,
Linus Walleij

--===============3723761120942862592==--

