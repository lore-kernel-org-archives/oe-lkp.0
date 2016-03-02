Content-Type: multipart/mixed; boundary="===============3769049841554683036=="
MIME-Version: 1.0
From: Petr Mladek <pmladek@suse.com>
To: lkp@lists.01.org
Subject: Re: [printk] 34578dc67f: EIP is at vprintk_emit+0x1ea/0x600
Date: Wed, 02 Mar 2016 11:30:06 +0100
Message-ID: <20160302103006.GB3166@pathway.suse.cz>
In-Reply-To: <20160225051005.GA884@swordfish>
List-Id: <oe-lkp.lists.linux.dev>

--===============3769049841554683036==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu 2016-02-25 14:10:05, Sergey Senozhatsky wrote:
> CONFIG_PREEMPT_NONE=3Dy
> # CONFIG_PREEMPT_VOLUNTARY is not set
> # CONFIG_PREEMPT is not set
> CONFIG_PREEMPT_COUNT=3Dy

I was curious why your patch actually did not help to avoid the
softlockup. The infinite printk loop was called in a safe context,
CONFIG_PREEMPT_COUNT=3Dy, so it did set console_may_schedule =3D 1.

But it never got console_sem, never called console_unlock()
and never called cond_resched() there. So, it never got preempted
in the PREEMPT_NONE kernel. The console_sem was owned by
another process that was busy handling the flood of messages.

Note that the infinite cycle calling printk() might be interrupted anywhere
by the NMI watchdog. It explains why the original report pointed
at the beginning of the printk. It was not a deadlock.
I got the softlockup on random locations here.

Also it is not the classic softlockup in console_unlock().
The process handling the console actually could sleep if it
has console_may_schedule =3D 1. This is why console_unlock()
did not appeared in the softlockup backtrace.


Conclusion:

Sergey is correct and his patches are innocent here.

Sergey, if you send the fix for
of_unittest_destroy_tracked_overlays(), please add me into CC.


Best Regards,
Petr

PS: I am sorry for the noise and that it took me so long to shake my
head around this problem. Thanks a lot for patience.

--===============3769049841554683036==--

