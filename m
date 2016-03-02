Content-Type: multipart/mixed; boundary="===============0111302697223702618=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To: lkp@lists.01.org
Subject: Re: [printk] 34578dc67f: EIP is at vprintk_emit+0x1ea/0x600
Date: Wed, 02 Mar 2016 19:41:59 +0900
Message-ID: <20160302104159.GA646@swordfish>
In-Reply-To: <20160302103006.GB3166@pathway.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============0111302697223702618==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (03/02/16 11:30), Petr Mladek wrote:
> On Thu 2016-02-25 14:10:05, Sergey Senozhatsky wrote:
> > CONFIG_PREEMPT_NONE=3Dy
> > # CONFIG_PREEMPT_VOLUNTARY is not set
> > # CONFIG_PREEMPT is not set
> > CONFIG_PREEMPT_COUNT=3Dy
> =

> I was curious why your patch actually did not help to avoid the
> softlockup. The infinite printk loop was called in a safe context,
> CONFIG_PREEMPT_COUNT=3Dy, so it did set console_may_schedule =3D 1.
> =

> But it never got console_sem, never called console_unlock()
> and never called cond_resched() there. So, it never got preempted
> in the PREEMPT_NONE kernel. The console_sem was owned by
> another process that was busy handling the flood of messages.
> =

> Note that the infinite cycle calling printk() might be interrupted anywhe=
re
> by the NMI watchdog. It explains why the original report pointed
> at the beginning of the printk. It was not a deadlock.
> I got the softlockup on random locations here.
> =

> Also it is not the classic softlockup in console_unlock().
> The process handling the console actually could sleep if it
> has console_may_schedule =3D 1. This is why console_unlock()
> did not appeared in the softlockup backtrace.
> =

> =

> Conclusion:
> =

> Sergey is correct and his patches are innocent here.

thank you, Petr!


> Sergey, if you send the fix for
> of_unittest_destroy_tracked_overlays(), please add me into CC.

of course, will try to send it out tonight.


> PS: I am sorry for the noise and that it took me so long to shake my
> head around this problem. Thanks a lot for patience.

no problem at all. thank you. the more we double check it - the better.

	-ss

--===============0111302697223702618==--

