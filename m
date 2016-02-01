Content-Type: multipart/mixed; boundary="===============7975085403548977191=="
MIME-Version: 1.0
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: lkp@lists.01.org
Subject: Re: [gpio] 1b06d64f73: kmsg.dio-#e#-dio-#e:Unable_to_lock#-dio-#e_port_addresses(#-#)
Date: Sun, 31 Jan 2016 20:20:33 -0500
Message-ID: <56AEB2E1.5070307@gmail.com>
In-Reply-To: <877fipkz99.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7975085403548977191==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 01/31/2016 08:14 PM, kernel test robot wrote:
> FYI, we noticed the below changes on
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git dev=
el
> commit 1b06d64f73746c30ddba43bb57c30ba9a126f53b ("gpio: Add GPIO support =
for the ACCES 104-DIO-48E")
> =

> With your commit, there are the following new messages in kernel log.
> =

> [    6.176052] 104-dio-48e 104-dio-48e: Unable to lock 104-dio-48e port a=
ddresses (0x0-0x10)
> [    6.176052] 104-dio-48e 104-dio-48e: Unable to lock 104-dio-48e port a=
ddresses (0x0-0x10)
> [    6.177538] 104-dio-48e: probe of 104-dio-48e failed with error -16
> [    6.177538] 104-dio-48e: probe of 104-dio-48e failed with error -16
> [    6.178846] 104-idi-48 104-idi-48: Unable to lock 104-idi-48 port addr=
esses (0x0-0x8)
> [    6.178846] 104-idi-48 104-idi-48: Unable to lock 104-idi-48 port addr=
esses (0x0-0x8)
> [    6.180359] 104-idi-48: probe of 104-idi-48 failed with error -16
> [    6.180359] 104-idi-48: probe of 104-idi-48 failed with error -16
> =

> Thanks,
> Ying Huang

This behavior is expected for the 104-dio-48e module and 104-idi-48        =

module: base port address for the hardware must be manually set by the   =

user since the hardware lacks discovery functionality.

William Breathitt Gray

--===============7975085403548977191==--

