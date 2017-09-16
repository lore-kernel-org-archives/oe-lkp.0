Content-Type: multipart/mixed; boundary="===============0694090972167783330=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: d57108d4f6 ("watchdog/core: Get rid of the thread .."): BUG: unable to handle kernel NULL pointer dereference at 0000000000000208
Date: Sat, 16 Sep 2017 19:35:10 +0200
Message-ID: <alpine.DEB.2.20.1709161850010.2105@nanos>
In-Reply-To: <20170916124652.jpjoj4zgosw2af2z@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0694090972167783330==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, 16 Sep 2017, Fengguang Wu wrote:
> > > [    0.038086] Performance Events: unsupported p6 CPU model 61 no PMU
> > > driver, software events only.
> =

> What's your host CPU? I can reproduce it in Nehalem, Haswell and Sandy
> Bridge machines with the attached script.

My bad. I booted the wrong config ....

> > > [    0.041031] Hierarchical SRCU implementation.
> > > [    0.046210] NMI watchdog: Perf event create on CPU 0 failed with -2
> > > [    0.046980] NMI watchdog: Perf NMI watchdog permanetely disabled
> > > =

> > > Confused
> > =

> > I still can't reproduce. Can you please apply the debug patch below and
> > provide the output?
> =

> OK. I'll try and report back tomorrow.

Don't bother. I found it already. On UP we have:

#define for_each_cpu(cpu, mask)               \
        for ((cpu) =3D 0; (cpu) < 1; (cpu)++, (void)mask)

which is a total fail as it breaks any code which uses for_each_cpu() or
any of the other variants on UP by assuming that all cpumask have bit 0
set.

That means any code which does not have conditional code for some of the
cpumask functions is potentially broken. Sigh.

The simple cure for the watchdog is below.

Thanks,

	tglx
8<------------------

diff --git a/kernel/watchdog_hld.c b/kernel/watchdog_hld.c
index b2931154b5f2..d4c0f75b189e 100644
--- a/kernel/watchdog_hld.c
+++ b/kernel/watchdog_hld.c
@@ -221,7 +221,12 @@ void hardlockup_detector_perf_cleanup(void)
 		struct perf_event *event =3D per_cpu(watchdog_ev, cpu);
 =

 		per_cpu(watchdog_ev, cpu) =3D NULL;
-		perf_event_release_kernel(event);
+		/*
+		 * Check the event, because on UP for_each_cpu() assumes
+		 * idiotically that all masks handed in have bit 0 set.
+		 */
+		if (event)
+			perf_event_release_kernel(event);
 	}
 	cpumask_clear(&dead_events_mask);
 }










--===============0694090972167783330==--

