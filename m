Content-Type: multipart/mixed; boundary="===============5028178457047009704=="
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
To: lkp@lists.01.org
Subject: Re: [gpio] 3c702e9987: kmsg.user_verbs:couldn't_register_device_number
Date: Sun, 14 Feb 2016 18:56:20 +0100
Message-ID: <CACRpkda-8iz4XavJLYpDQEAmoL19dPNGqR2YK6eNOLBdqQz2nQ@mail.gmail.com>
In-Reply-To: <20160214174947.GA21558@kroah.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5028178457047009704==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 14, 2016 at 6:49 PM, Greg KH <gregkh@linuxfoundation.org> wro=
te:
> On Sun, Feb 14, 2016 at 06:42:11PM +0100, Linus Walleij wrote:
>> Greg, heads-up on this... you'd know if this happened
>> before.
>>
>> On Sun, Feb 14, 2016 at 9:06 AM, Michael Welling <mwelling@ieee.org> w=
rote:
>> > On Sun, Feb 14, 2016 at 02:59:06PM +0800, kernel test robot wrote:
>> >> FYI, we noticed the below changes on
>> >>
>> >> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git=
 chardev
>> >> commit 3c702e9987e261042a07e43460a8148be254412e ("gpio: add a userspa=
ce chardev ABI for GPIOs")
>> >>
>> >>
>> >> [    1.951191] user_verbs: couldn't register device number
>> >
>> > Looks like user_verbs is using a static device node setup.
>> >
>> > enum {
>> >         IB_UVERBS_MAJOR       =3D 231,
>> >         IB_UVERBS_BASE_MINOR  =3D 192,
>> >         IB_UVERBS_MAX_DEVICES =3D 32
>> > };
>> >
>> > #define IB_UVERBS_BASE_DEV      MKDEV(IB_UVERBS_MAJOR, IB_UVERBS_BASE_=
MINOR)
>>
>> That's annoying...
>> I notice that infiniband is using register_chrdev_region() at
>> module_init() time, counting on device major 231 to be free.
>
> That device major is assigned to Infiniband, why shouldn't it be doing
> this?

I mean it's annoying that they collide. (Because of the details I
write below, it's fine it's using the assigned number.

> Why not just ask for a new reserved one?  We could give you 261 and
> everything should be fine, right?

Sure I can post a patch for that, but it just mitigates the problem.

The report point to the serious problem that on this system
some dynamic allocations have already stolen major device
numbers 232 thru 255, and 232 and 233 are also assigned.

What do you think about a patch that makes fs/char_dev.c
emit a warning when it starts assigning dynamic numbers
233 and below?

Yours,
Linus Walleij

--===============5028178457047009704==--

