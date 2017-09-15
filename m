Content-Type: multipart/mixed; boundary="===============0620134438734946869=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: d57108d4f6 ("watchdog/core: Get rid of the thread .."): BUG: unable to handle kernel NULL pointer dereference at 0000000000000208
Date: Fri, 15 Sep 2017 14:54:43 +0200
Message-ID: <alpine.DEB.2.20.1709151452470.1890@nanos>
In-Reply-To: <alpine.DEB.2.20.1709150947550.1890@nanos>
List-Id: <oe-lkp.lists.linux.dev>

--===============0620134438734946869==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 15 Sep 2017, Thomas Gleixner wrote:

> On Fri, 15 Sep 2017, kernel test robot wrote:
> > [    0.035023] CPU: Intel Common KVM processor (family: 0xf, model: 0x6=
, stepping: 0x1)
> > [    0.042302] Performance Events: unsupported Netburst CPU model 6 no =
PMU driver, software events only.
> =

> Cute. So there is no supported PMU, but for some unknown reason the lockup
> detector can create an event, otherwise the perf availaibility check in
> lockup_detector_init() would fail ....
> =

> Peter???

In my VM the corresponding dmesg is:

[    0.038086] Performance Events: unsupported p6 CPU model 61 no PMU drive=
r, software events only.
[    0.041031] Hierarchical SRCU implementation.
[    0.046210] NMI watchdog: Perf event create on CPU 0 failed with -2
[    0.046980] NMI watchdog: Perf NMI watchdog permanetely disabled

Confused

--===============0620134438734946869==--

