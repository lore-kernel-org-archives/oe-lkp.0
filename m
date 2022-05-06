Content-Type: multipart/mixed; boundary="===============2841241147814165425=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [timekeeping] 3aeaac747d: PANIC:early_exception
Date: Fri, 06 May 2022 09:59:13 +0200
Message-ID: <8735hnhz1q.ffs@tglx>
In-Reply-To: <20220506032023.GA23061@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============2841241147814165425==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, May 06 2022 at 11:20, kernel test robot wrote:
> PANIC: early exception 0x0d IP 10:ffffffff812cef11 error 0 cr2 0xffff8880=
04a3aff8
> [ 0.000000][ T0] add_device_randomness (kbuild/src/rand-3/drivers/char/ra=
ndom.c:1028) =

> [ 0.000000][ T0] ? dmi_walk_early (kbuild/src/rand-3/drivers/firmware/dmi=
_scan.c:470) =

> [ 0.000000][ T0] dmi_walk_early (kbuild/src/rand-3/drivers/firmware/dmi_s=
can.c:151) =

> [ 0.000000][ T0] dmi_present (kbuild/src/rand-3/drivers/firmware/dmi_scan=
.c:605)

Duh.

So this wants to be:

--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -2380,6 +2381,20 @@ static int timekeeping_validate_timex(co
 	return 0;
 }
 =

+/**
+ * random_get_entropy_fallback - Returns the raw clock source value,
+ * used by random.c for platforms with no valid random_get_entropy().
+ */
+unsigned long random_get_entropy_fallback(void)
+{
+	struct tk_read_base *tkr =3D &tk_core.timekeeper.tkr_mono;
+	struct clocksource *clock =3D READ_ONCE(tkr->clock);
+
+	if (!timekeeping_suspended && clock)
+		return clock->read(clock);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(random_get_entropy_fallback);
 =

 /**
  * do_adjtimex() - Accessor function to NTP __do_adjtimex function
--===============2841241147814165425==--

