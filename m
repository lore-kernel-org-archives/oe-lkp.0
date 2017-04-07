Content-Type: multipart/mixed; boundary="===============1564882354222169596=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: lkp@lists.01.org
Subject: Re: [printk] fbc14616f4: BUG:kernel_reboot-without-warning_in_test_stage
Date: Fri, 07 Apr 2017 21:10:21 +0900
Message-ID: <20170407121021.GA379@jagdpanzerIV.localdomain>
In-Reply-To: <20170407081449.GA12859@amd>
List-Id: <oe-lkp.lists.linux.dev>

--===============1564882354222169596==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (04/07/17 10:14), Pavel Machek wrote:
[..]
> Well. This is what we had for 20 years.

I guess it's not just me who is a bit unhappy with printk. ask
Peter Zijlstra what's the first word that comes into his mind
when we reads "printk"  :)


[..]
> I believe "spend at most 2 seconds in printk(), then print a warning
> and offload" is a solution closer to what we had before.

a warning here can be very noisy.

it's quite common that serial console (`console_seq') is a bit behind
the logbuf head (`log_next_seq'). because log_store() can be much faster
that call into console drivers.

another case is that  printk() !=3D console_unlock().  console_sem can be
locked by VT, TTY, fbdev, (not to mention that some other CPU might be
doing printing), etc. etc. all printk()-s in the meantime will just
log_store() messages, so we can have a bunch on pending messsges in
logbuf, it's normal. the CPU that owns the console_sem will print all
those pending messages from console_unlock() path. the distance between
`log_next_seq' and `console_seq' can be much bigger than 2 seconds or
240/320/etc chars. so wrong offloading can leave with nothing valuable
in the serial output, even if we would defer it.

well, I'm not arguing. just saying that it's not so easy to do everything
right here.

what we have been thinking about is something like printk-stall detection.
we probably (there are some if-s) can detect in printk() that offloading
does not work and we must automatically switch to printk_emergency mode.
that, in theory, can relax our dependency on printk_emergency_begin/end
being in the right place at the right time. need to think more about it.

	-ss

--===============1564882354222169596==--

