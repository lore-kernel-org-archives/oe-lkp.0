Content-Type: multipart/mixed; boundary="===============2934525817328898558=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [watchdog/softlockup] 4808e7a5dc: BUG:KASAN:null-ptr-deref_in_h
Date: Wed, 13 Jun 2018 10:27:00 +0200
Message-ID: <20180613082700.GV12198@hirez.programming.kicks-ass.net>
In-Reply-To: <20180613050838.GK12146@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============2934525817328898558==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 13, 2018 at 01:08:38PM +0800, kernel test robot wrote:
> [    0.037000] BUG: KASAN: null-ptr-deref in hrtimer_active+0x70/0xa0
> [    0.037000] Read of size 4 at addr 0000000000000010 by task swapper/1
> [    0.037000] =

> [    0.037000] CPU: 0 PID: 1 Comm: swapper Tainted: G                T 4.=
17.0-11348-g4808e7a #1
> [    0.037000] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [    0.037000] Call Trace:
> [    0.037000]  ? kasan_report+0xe3/0x360
> [    0.037000]  ? hrtimer_active+0x70/0xa0
> [    0.037000]  ? hrtimer_try_to_cancel+0x17/0x210
> [    0.037000]  ? hrtimer_cancel+0x15/0x20
> [    0.037000]  ? softlockup_stop_fn+0x11/0x20
> [    0.037000]  ? lockup_detector_reconfigure+0x25/0xa0
> [    0.037000]  ? lockup_detector_init+0x51/0x5d
> [    0.037000]  ? kernel_init_freeable+0xa9/0x243
> [    0.037000]  ? rest_init+0xd0/0xd0
> [    0.037000]  ? kernel_init+0xf/0x120
> [    0.037000]  ? rest_init+0xd0/0xd0
> [    0.037000]  ? ret_from_fork+0x24/0x30

ARGH, I thought I fixed that one..

I think that'll cure things, but let me do a KASAN build myself.

--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -587,8 +587,8 @@ static __init void lockup_detector_setup
 		return;
 =

 	mutex_lock(&watchdog_mutex);
-	softlockup_initialized =3D true;
 	lockup_detector_reconfigure();
+	softlockup_initialized =3D true;
 	mutex_unlock(&watchdog_mutex);
 }
=20

--===============2934525817328898558==--

