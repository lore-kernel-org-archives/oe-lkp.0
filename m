Content-Type: multipart/mixed; boundary="===============3677879638192552111=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To: lkp@lists.01.org
Subject: Re: [printk] fbc14616f4: BUG:kernel_reboot-without-warning_in_test_stage
Date: Sat, 08 Apr 2017 00:40:47 +0900
Message-ID: <20170407154047.GB384@tigerII.localdomain>
In-Reply-To: <20170407152304.bkbceqmg3kxeqvur@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============3677879638192552111==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (04/07/17 17:23), Peter Zijlstra wrote:
[..]
> > we are looking at different typical setups :) serial console being 45
> > seconds behind logbuf does not surprise me anymore.
> =

> That does sound like you're doing something wrong and should look at
> reducing printk() more than anything else.

yeah, 45sec is an extreme case that simply doesn't surprise me anymore ;)
that's not a normal/usual delay, of course, we are not this mad. on average
it's much better and may be not so far 2 seconds after all. a massive OOM
report, of course, appends logbuf messages at a much higher rate than UART
serial console can swallow, so the delay is getting larger, expectedly.
and, no, I don't add any printk-s, I'm looking at the lockup reports

	-ss

--===============3677879638192552111==--

