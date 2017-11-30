Content-Type: multipart/mixed; boundary="===============1328140033611421732=="
MIME-Version: 1.0
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [futex] 35ca678967 WARNING: CPU: 0 PID: 2334 at kernel/sched/core.c:6845 migrate_enable
Date: Thu, 30 Nov 2017 19:16:11 +0100
Message-ID: <20171130181611.GB14267@linutronix.de>
In-Reply-To: <20171127010914.2ay5kisugrvnprgz@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1328140033611421732==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2017-11-27 09:09:14 [+0800], Fengguang Wu wrote:
> Greetings,
Him

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git lin=
ux-4.14.y-rt-rebase

I looked at this and those other report you sent. The
boot-RT-in-the-middle-of-the-queue is kind of difficult. There are a lot
of warnings on the RT part and this is not really a surprise. Here we
have the migrate-enable/disable fixup but locking with migrate-disable
is not yet introduced. Here we have it logically sorted in the futex
corner however. There are a lot of things that get broken once sleeping
locks are wired-up properly so it is not that easy.

Would it be possible to limit the testing part to a complete kernel i.e.
to the last patch in the tree?

Sebastian

--===============1328140033611421732==--

