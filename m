Content-Type: multipart/mixed; boundary="===============3084650561230840482=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: d57108d4f6 ("watchdog/core: Get rid of the thread .."): BUG: unable to handle kernel NULL pointer dereference at 0000000000000208
Date: Fri, 15 Sep 2017 18:24:20 +0200
Message-ID: <alpine.DEB.2.20.1709151820250.1833@nanos>
In-Reply-To: <alpine.DEB.2.20.1709151452470.1890@nanos>
List-Id: <oe-lkp.lists.linux.dev>

--===============3084650561230840482==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 15 Sep 2017, Thomas Gleixner wrote:

> On Fri, 15 Sep 2017, Thomas Gleixner wrote:
> =

> > On Fri, 15 Sep 2017, kernel test robot wrote:
> > > [    0.035023] CPU: Intel Common KVM processor (family: 0xf, model: 0=
x6, stepping: 0x1)
> > > [    0.042302] Performance Events: unsupported Netburst CPU model 6 n=
o PMU driver, software events only.
> > =

> > Cute. So there is no supported PMU, but for some unknown reason the loc=
kup
> > detector can create an event, otherwise the perf availaibility check in
> > lockup_detector_init() would fail ....
> > =

> > Peter???
> =

> In my VM the corresponding dmesg is:
> =

> [    0.038086] Performance Events: unsupported p6 CPU model 61 no PMU dri=
ver, software events only.
> [    0.041031] Hierarchical SRCU implementation.
> [    0.046210] NMI watchdog: Perf event create on CPU 0 failed with -2
> [    0.046980] NMI watchdog: Perf NMI watchdog permanetely disabled
> =

> Confused

I still can't reproduce. Can you please apply the debug patch below and
provide the output?

Thanks,

	tglx

8<-----------------

diff --git a/kernel/watchdog_hld.c b/kernel/watchdog_hld.c
index b2931154b5f2..e6c9ca516945 100644
--- a/kernel/watchdog_hld.c
+++ b/kernel/watchdog_hld.c
@@ -171,6 +171,7 @@ static int hardlockup_detector_event_create(void)
 	/* Try to register using hardware perf events */
 	evt =3D perf_event_create_kernel_counter(wd_attr, cpu, NULL,
 					       watchdog_overflow_callback, NULL);
+	pr_info("EVT create on CPU %u returned %p\n", cpu, evt);
 	if (IS_ERR(evt)) {
 		pr_info("Perf event create on CPU %d failed with %ld\n", cpu,
 			PTR_ERR(evt));
@@ -221,7 +222,10 @@ void hardlockup_detector_perf_cleanup(void)
 		struct perf_event *event =3D per_cpu(watchdog_ev, cpu);
 =

 		per_cpu(watchdog_ev, cpu) =3D NULL;
-		perf_event_release_kernel(event);
+		pr_info("EVT on CPU %u in dead mask: %p\n",  cpu, event);
+		if (event)
+			perf_event_release_kernel(event);
+
 	}
 	cpumask_clear(&dead_events_mask);
 }


--===============3084650561230840482==--

