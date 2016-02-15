Content-Type: multipart/mixed; boundary="===============3546332953301995046=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [gpio] 3c702e9987: kmsg.user_verbs:couldn't_register_device_number
Date: Mon, 15 Feb 2016 10:39:11 +0800
Message-ID: <8760xqd7e8.fsf@yhuang-dev.intel.com>
In-Reply-To: <20160214080643.GA31304@qwerty.qwertyembedded>
List-Id: <oe-lkp.lists.linux.dev>

--===============3546332953301995046==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Michael Welling <mwelling@ieee.org> writes:

> On Sun, Feb 14, 2016 at 02:59:06PM +0800, kernel test robot wrote:
>> FYI, we noticed the below changes on
>> =

>> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git ch=
ardev
>> commit 3c702e9987e261042a07e43460a8148be254412e ("gpio: add a userspace =
chardev ABI for GPIOs")
>> =

>> =

>> [    1.951191] user_verbs: couldn't register device number
>
> Looks like user_verbs is using a static device node setup.
>
> enum {
>         IB_UVERBS_MAJOR       =3D 231,
>         IB_UVERBS_BASE_MINOR  =3D 192,
>         IB_UVERBS_MAX_DEVICES =3D 32
> };
>
> #define IB_UVERBS_BASE_DEV      MKDEV(IB_UVERBS_MAJOR, IB_UVERBS_BASE_MIN=
OR)
>
> Something tells me that a new GPIO chardev is taking this spot.
>
> It looks like the device is documented to be using the range:
> https://www.kernel.org/doc/Documentation/devices.txt
>
> Could you run cat /proc/devices?
>

Sorry, the test mechanism is not flexible enough to run some shell
command in test system.  Could you provide a specialized debug kernel to
dump the necessary information in kernel log?  We can collect dmesg
easily.

Best Regards,
Huang, Ying

--===============3546332953301995046==--

