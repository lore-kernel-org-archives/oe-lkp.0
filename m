Content-Type: multipart/mixed; boundary="===============8553440636738707137=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [include/linux/string.h] 6974f0c455: kernel_BUG_at_lib/string.c
Date: Thu, 20 Jul 2017 22:48:01 -0700
Message-ID: <CAGXu5jLWHfDC+9aYF381zP_A1rktVVhROAKQo=WK51mePmJZKA@mail.gmail.com>
In-Reply-To: <20170721015941.GB9355@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============8553440636738707137==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 20, 2017 at 6:59 PM, Ye Xiaolong <xiaolong.ye@intel.com> wrot=
e:
> On 07/19, Linus Torvalds wrote:
>>Hmm. I wonder why the kernel test robot ends up having that annoying
>>line doubling for the dmesg.
>>
>
> Hmm, this line doubling issue should be caused by we set both
> 'earlyprintk=3DttyS0,115200' and 'console=3DttyS0,115200' in cmdline, aft=
er I
> remove any of it, this issue is gone, is it an inappropriate setting?

This is a weird behavior. Normally the boot console (in this case
"earlyser0") should be disabled when the regular console starts. In
your dmesg I see:

[    0.000000] bootconsole [earlyser0] enabled
...
[    0.003333] console [ttyS0] enabled
[    0.003333] console [ttyS0] enabled

This is where repeating starts, and I would have expected to see:

[    0.000000] bootconsole [earlyser0] enabled
...
[    0.000000] console [ttyS0] enabled
[    0.000000] console [ttyS0] enabled
[    0.000000] bootconsole [earlyser0] disabled
[    0.000000] bootconsole [earlyser0] disabled

And that would be the end of doubling.

Actually, with your command-line ("earlyprintk=3DttyS0,115200
console=3DttyS0,115200 console=3Dtty0") I would expect:

[    0.000000] console [tty0] enabled
[    0.000000] bootconsole [earlyser0] disabled
[    0.000000] console [ttyS0] enabled

I don't see any mention of tty0, though. I wonder if that is confusing
the disable code. The only way I would normally expect the boot
console not to get unregistered is if ",keep" was appended to it...
The code is in kernel/printk/printk.c, FWIW.

Also, it looks like your kernel command line is cut off:

... earlyprintk=3DttyS0,115200 console=3DttyS0,115200 console=3Dtty0 vga=3D

With your script showing "... vga=3Dnormal ..."

That's only 968 characters, well shy of x86's 2048 limit. Is this a
line length issue with qemu output, or does /proc/cmdline report the
same truncation?

-Kees

-- =

Kees Cook
Pixel Security

--===============8553440636738707137==--

