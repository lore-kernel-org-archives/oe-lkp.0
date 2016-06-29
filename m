Content-Type: multipart/mixed; boundary="===============6332533764363621129=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [LTP] [lkp] [signal] 98ea270c46: ltp.float_exp_log.fail
Date: Wed, 29 Jun 2016 21:01:21 +0200
Message-ID: <alpine.DEB.2.11.1606292100510.3707@nanos>
In-Reply-To: <20160628085608.GA31668@rei.suse.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============6332533764363621129==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 28 Jun 2016, Cyril Hrubis wrote:
> Looking at the test it creates a separate thread to handle signals which
> sleeps in sigwait() which is implemented in glibc via the sigtimedwait
> syscall with NULL timeout.
> =

> Looking at the patch the ktime_t timeout is initialized to 0 instead of
> MAX_SCHEDULE_TIMEOUT now so I guess that the call with NULL timeout does
> poll instead of sleeping in kernel waiting for signals to arrive. That
> should be fixed.

You're right. I misread the code...

--===============6332533764363621129==--

