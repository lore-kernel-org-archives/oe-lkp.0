Content-Type: multipart/mixed; boundary="===============2570209826263467810=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: lkp@lists.01.org
Subject: Re: [printk] fbc14616f4: BUG:kernel_reboot-without-warning_in_test_stage
Date: Fri, 07 Apr 2017 13:44:40 +0900
Message-ID: <20170407044334.GA487@jagdpanzerIV.localdomain>
In-Reply-To: <20170406173306.GD10363@amd>
List-Id: <oe-lkp.lists.linux.dev>

--===============2570209826263467810==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

On (04/06/17 19:33), Pavel Machek wrote:
> > This patch set gives up part of the printk() reliability for bounded
> > latency (at least unless we detect we are really in trouble) which is I=
MHO
> > a good trade-off for lots of users (and others can just turn this featu=
re
> > off).
> =

> If they can ever realize they were bitten by this feature.
> =

> Can we go for different tradeoff?
> =

> In console_unlock(), if you detect too much work, print "Too many
> messages to print, %d bytes delayed" and wake up kernel thread.

"too many messages" is undefined. console_unlock() can be called from
IRQ handler or with preemtion disabled, or under spin_lock, or under
RCU read lock, etc. etc. By the time we decide to wake up printk_kthread
from console_unlock() it may be already too late.

besides, this does not really address any of the concerns you have
pointed out in other emails. we might be unable to wake_up printk_kthread
(because there is a misbehaving higher prio process, or because the
scheduler is misbehaving, etc. etc.) so the "emergency mode" is still
here and still requires special handling.

	-ss

--===============2570209826263467810==--

