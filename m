Content-Type: multipart/mixed; boundary="===============2230660605340634625=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: d57108d4f6 ("watchdog/core: Get rid of the thread .."): BUG: unable to handle kernel NULL pointer dereference at 0000000000000208
Date: Sat, 16 Sep 2017 20:46:52 +0800
Message-ID: <20170916124652.jpjoj4zgosw2af2z@wfg-t540p.sh.intel.com>
In-Reply-To: <alpine.DEB.2.20.1709151820250.1833@nanos>
List-Id: <oe-lkp.lists.linux.dev>

--===============2230660605340634625==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 15, 2017 at 06:24:20PM +0200, Thomas Gleixner wrote:
>On Fri, 15 Sep 2017, Thomas Gleixner wrote:
>
>> On Fri, 15 Sep 2017, Thomas Gleixner wrote:
>>
>> > On Fri, 15 Sep 2017, kernel test robot wrote:
>> > > [    0.035023] CPU: Intel Common KVM processor (family: 0xf, model: =
0x6, stepping: 0x1)
>> > > [    0.042302] Performance Events: unsupported Netburst CPU model 6 =
no PMU driver, software events only.
>> >
>> > Cute. So there is no supported PMU, but for some unknown reason the lo=
ckup
>> > detector can create an event, otherwise the perf availaibility check in
>> > lockup_detector_init() would fail ....
>> >
>> > Peter???
>>
>> In my VM the corresponding dmesg is:
>>
>> [    0.038086] Performance Events: unsupported p6 CPU model 61 no PMU dr=
iver, software events only.

What's your host CPU? I can reproduce it in Nehalem, Haswell and Sandy
Bridge machines with the attached script.

>> [    0.041031] Hierarchical SRCU implementation.
>> [    0.046210] NMI watchdog: Perf event create on CPU 0 failed with -2
>> [    0.046980] NMI watchdog: Perf NMI watchdog permanetely disabled
>>
>> Confused
>
>I still can't reproduce. Can you please apply the debug patch below and
>provide the output?

OK. I'll try and report back tomorrow.

Thanks,
Fengguang

>8<-----------------
>
>diff --git a/kernel/watchdog_hld.c b/kernel/watchdog_hld.c
>index b2931154b5f2..e6c9ca516945 100644
>--- a/kernel/watchdog_hld.c
>+++ b/kernel/watchdog_hld.c
>@@ -171,6 +171,7 @@ static int hardlockup_detector_event_create(void)
> 	/* Try to register using hardware perf events */
> 	evt =3D perf_event_create_kernel_counter(wd_attr, cpu, NULL,
> 					       watchdog_overflow_callback, NULL);
>+	pr_info("EVT create on CPU %u returned %p\n", cpu, evt);
> 	if (IS_ERR(evt)) {
> 		pr_info("Perf event create on CPU %d failed with %ld\n", cpu,
> 			PTR_ERR(evt));
>@@ -221,7 +222,10 @@ void hardlockup_detector_perf_cleanup(void)
> 		struct perf_event *event =3D per_cpu(watchdog_ev, cpu);
>
> 		per_cpu(watchdog_ev, cpu) =3D NULL;
>-		perf_event_release_kernel(event);
>+		pr_info("EVT on CPU %u in dead mask: %p\n",  cpu, event);
>+		if (event)
>+			perf_event_release_kernel(event);
>+
> 	}
> 	cpumask_clear(&dead_events_mask);
> }

--===============2230660605340634625==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="4.13.0-11828-gd57108d1"

IyEvYmluL2Jhc2gKCmtlcm5lbD0kMQoKa3ZtPSgKCXFlbXUtc3lzdGVtLXg4Nl82NAoJLWVuYWJs
ZS1rdm0KCS1jcHUga3ZtNjQKCS1rZXJuZWwgJGtlcm5lbAoJLW0gMzk5Cgktc21wIDIKCS1kZXZp
Y2UgZTEwMDAsbmV0ZGV2PW5ldDAKCS1uZXRkZXYgdXNlcixpZD1uZXQwCgktYm9vdCBvcmRlcj1u
YwoJLW5vLXJlYm9vdAoJLXdhdGNoZG9nIGk2MzAwZXNiCgktd2F0Y2hkb2ctYWN0aW9uIGRlYnVn
CgktcnRjIGJhc2U9bG9jYWx0aW1lCgktc2VyaWFsIHN0ZGlvCgktZGlzcGxheSBub25lCgktbW9u
aXRvciBudWxsCikKCmFwcGVuZD0oCglyb290PS9kZXYvcmFtMAoJaHVuZ190YXNrX3BhbmljPTEK
CWRlYnVnCglhcGljPWRlYnVnCglzeXNycV9hbHdheXNfZW5hYmxlZAoJcmN1cGRhdGUucmN1X2Nw
dV9zdGFsbF90aW1lb3V0PTEwMAoJbmV0LmlmbmFtZXM9MAoJcHJpbnRrLmRldmttc2c9b24KCXBh
bmljPS0xCglzb2Z0bG9ja3VwX3BhbmljPTEKCW5taV93YXRjaGRvZz1wYW5pYwoJb29wcz1wYW5p
YwoJbG9hZF9yYW1kaXNrPTIKCXByb21wdF9yYW1kaXNrPTAKCWRyYmQubWlub3JfY291bnQ9OAoJ
c3lzdGVtZC5sb2dfbGV2ZWw9ZXJyCglpZ25vcmVfbG9nbGV2ZWwKCWNvbnNvbGU9dHR5MAoJZWFy
bHlwcmludGs9dHR5UzAsMTE1MjAwCgljb25zb2xlPXR0eVMwLDExNTIwMAoJdmdhPW5vcm1hbAoJ
cncKCWRyYmQubWlub3JfY291bnQ9OAopCgoiJHtrdm1bQF19IiAtYXBwZW5kICIke2FwcGVuZFsq
XX0iCg==

--===============2230660605340634625==--

