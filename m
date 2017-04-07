Content-Type: multipart/mixed; boundary="===============1450078493675960154=="
MIME-Version: 1.0
From: Steven Rostedt <rostedt@goodmis.org>
To: lkp@lists.01.org
Subject: Re: [printk] fbc14616f4: BUG:kernel_reboot-without-warning_in_test_stage
Date: Fri, 07 Apr 2017 10:29:17 -0400
Message-ID: <20170407102917.3121e9f0@gandalf.local.home>
In-Reply-To: <20170407081449.GA12859@amd>
List-Id: <oe-lkp.lists.linux.dev>

--===============1450078493675960154==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 7 Apr 2017 10:14:49 +0200
Pavel Machek <pavel@ucw.cz> wrote:

> > serial console can be quite slow. and port->lock, that is acquired by
> > console_unlock()->call_console_drivers()->write(), is also accessible
> > by serial driver's IRQ handler, and this lock may be busy long
> > enough -- as long as that IRQ handler transmits/receives chars. but
> > that's not the point.  =

> =

> Well. This is what we had for 20 years.

But for the last 20 years we were not booting on machines with over 200
CPUs. Well, we were, but those had custom kernels (which probably
dismantled printk).

-- Steve

--===============1450078493675960154==--

