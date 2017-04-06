Content-Type: multipart/mixed; boundary="===============8821516574997347987=="
MIME-Version: 1.0
From: Pavel Machek <pavel@ucw.cz>
To: lkp@lists.01.org
Subject: Re: [printk] fbc14616f4: BUG:kernel_reboot-without-warning_in_test_stage
Date: Thu, 06 Apr 2017 19:33:06 +0200
Message-ID: <20170406173306.GD10363@amd>
In-Reply-To: <20170403093152.GB15168@quack2.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============8821516574997347987==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi!

> This patch set gives up part of the printk() reliability for bounded
> latency (at least unless we detect we are really in trouble) which is IMHO
> a good trade-off for lots of users (and others can just turn this feature
> off).

If they can ever realize they were bitten by this feature.

Can we go for different tradeoff?

In console_unlock(), if you detect too much work, print "Too many
messages to print, %d bytes delayed" and wake up kernel thread.

You still get the latency, and people bitten by this feature will at
least get fair warning.

									Pavel
-- =

(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--===============8821516574997347987==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEKCmlFWUVBUkVD
QUFZRkFsam1lOUlBQ2drUU1PZndhcFhiK3ZJQ2l3Q2ZUamU5QVY0eFlQb3NRN3dhUWZCU0Q5Wk0K
dmhrQW5qYlFqT2dBS2xVUG54MU9Hdk82YjVHUmU5REQKPWtlQTAKLS0tLS1FTkQgUEdQIFNJR05B
VFVSRS0tLS0tCg==

--===============8821516574997347987==--

