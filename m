Content-Type: multipart/mixed; boundary="===============0138583878230473966=="
MIME-Version: 1.0
From: Zhang Rui <rui.zhang@intel.com>
To: lkp@lists.01.org
Subject: Re: [thermal] 24bc2fa031: BUG: KASAN: slab-out-of-bounds in thermal_zone_device_register+0x749/0x10a0 at addr ffff880000134140
Date: Fri, 17 Jun 2016 17:25:18 +0800
Message-ID: <1466155518.9422.41.camel@intel.com>
In-Reply-To: <20160616012737.GA25904@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============0138583878230473966==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On =E5=9B=9B, 2016-06-16 at 09:27 +0800, kernel test robot wrote:
> FYI, we noticed the following commit:
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> master
> commit 24bc2fa031f094c05c017a862732924cb46ad2c1 ("thermal: core: move
> trips attributes to tz->device.groups")
> =

this should be fixed in the latest thermal -next branch, by the
following refreshed patch,

thanks,
rui

>From e1e917e790b70b88bd418545a29b1eefa01a5566 Mon Sep 17 00:00:00 2001
From: Eduardo Valentin <edubezval@gmail.com>
Date: Mon, 30 May 2016 23:18:21 -0700
Subject: [PATCH] thermal: core: move trips attributes to tz->device.groups

Finally, move the last thermal zone sysfs attributes to
tz->device.groups: trips attributes. This requires adding a
attribute_group to thermal_zone_device, creating it dynamically, and
then setting all trips attributes in it. The trips attribute is then
added to the tz->device.groups.

As the removal of all attributes are handled by device core, the device
remove calls are not needed anymore.

Cc: Zhang Rui <rui.zhang@intel.com>
Cc: linux-pm(a)vger.kernel.org
Cc: linux-kernel(a)vger.kernel.org
Signed-off-by: Eduardo Valentin <edubezval@gmail.com>
Signed-off-by: Zhang Rui <rui.zhang@intel.com>
---
=C2=A0drivers/thermal/thermal_core.c | 78 ++++++++++++++++++++++-----------=
---------
=C2=A0include/linux/thermal.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0|=C2=A0=C2=A02 ++
=C2=A02 files changed, 42 insertions(+), 38 deletions(-)

diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core.c
index 657ba02..9926c89 100644
--- a/drivers/thermal/thermal_core.c
+++ b/drivers/thermal/thermal_core.c
@@ -1188,8 +1188,9 @@ static const struct attribute_group *thermal_zone_att=
ribute_groups[] =3D {
=C2=A0 */
=C2=A0static int create_trip_attrs(struct thermal_zone_device *tz, int mask)
=C2=A0{
-	int indx;
=C2=A0	int size =3D sizeof(struct thermal_attr) * tz->trips;
+	struct attribute **attrs;
+	int indx;
=C2=A0
=C2=A0	tz->trip_type_attrs =3D kzalloc(size, GFP_KERNEL);
=C2=A0	if (!tz->trip_type_attrs)
@@ -1210,6 +1211,15 @@ static int create_trip_attrs(struct thermal_zone_dev=
ice *tz, int mask)
=C2=A0		}
=C2=A0	}
=C2=A0
+	attrs =3D kzalloc(sizeof(*attrs) * tz->trips * 3 + 1, GFP_KERNEL);
+	if (!attrs) {
+		kfree(tz->trip_type_attrs);
+		kfree(tz->trip_temp_attrs);
+		if (tz->ops->get_trip_hyst)
+			kfree(tz->trip_hyst_attrs);
+		return -ENOMEM;
+	}
+
=C2=A0	for (indx =3D 0; indx < tz->trips; indx++) {
=C2=A0		/* create trip type attribute */
=C2=A0		snprintf(tz->trip_type_attrs[indx].name, THERMAL_NAME_LENGTH,
@@ -1220,9 +1230,7 @@ static int create_trip_attrs(struct thermal_zone_devi=
ce *tz, int mask)
=C2=A0						tz->trip_type_attrs[indx].name;
=C2=A0		tz->trip_type_attrs[indx].attr.attr.mode =3D S_IRUGO;
=C2=A0		tz->trip_type_attrs[indx].attr.show =3D trip_point_type_show;
-
-		device_create_file(&tz->device,
-				=C2=A0=C2=A0=C2=A0&tz->trip_type_attrs[indx].attr);
+		attrs[indx] =3D &tz->trip_type_attrs[indx].attr.attr;
=C2=A0
=C2=A0		/* create trip temp attribute */
=C2=A0		snprintf(tz->trip_temp_attrs[indx].name, THERMAL_NAME_LENGTH,
@@ -1239,9 +1247,7 @@ static int create_trip_attrs(struct thermal_zone_devi=
ce *tz, int mask)
=C2=A0			tz->trip_temp_attrs[indx].attr.store =3D
=C2=A0							trip_point_temp_store;
=C2=A0		}
-
-		device_create_file(&tz->device,
-				=C2=A0=C2=A0=C2=A0&tz->trip_temp_attrs[indx].attr);
+		attrs[indx + tz->trips] =3D &tz->trip_temp_attrs[indx].attr.attr;
=C2=A0
=C2=A0		/* create Optional trip hyst attribute */
=C2=A0		if (!tz->ops->get_trip_hyst)
@@ -1259,45 +1265,39 @@ static int create_trip_attrs(struct thermal_zone_de=
vice *tz, int mask)
=C2=A0			tz->trip_hyst_attrs[indx].attr.store =3D
=C2=A0					trip_point_hyst_store;
=C2=A0		}
-
-		device_create_file(&tz->device,
-				=C2=A0=C2=A0=C2=A0&tz->trip_hyst_attrs[indx].attr);
+		attrs[indx + tz->trips * 2] =3D
+					&tz->trip_hyst_attrs[indx].attr.attr;
=C2=A0	}
-	return 0;
-}
+	attrs[tz->trips * 3] =3D NULL;
=C2=A0
-static void remove_trip_attrs(struct thermal_zone_device *tz)
-{
-	int indx;
+	tz->trips_attribute_group.attrs =3D attrs;
=C2=A0
-	for (indx =3D 0; indx < tz->trips; indx++) {
-		device_remove_file(&tz->device,
-				=C2=A0=C2=A0=C2=A0&tz->trip_type_attrs[indx].attr);
-		device_remove_file(&tz->device,
-				=C2=A0=C2=A0=C2=A0&tz->trip_temp_attrs[indx].attr);
-		if (tz->ops->get_trip_hyst)
-			device_remove_file(&tz->device,
-					=C2=A0=C2=A0=C2=A0&tz->trip_hyst_attrs[indx].attr);
-	}
-	kfree(tz->trip_type_attrs);
-	kfree(tz->trip_temp_attrs);
-	kfree(tz->trip_hyst_attrs);
+	return 0;
=C2=A0}
=C2=A0
-static int thermal_zone_create_device_groups(struct thermal_zone_device *t=
z)
+static int thermal_zone_create_device_groups(struct thermal_zone_device *t=
z,
+					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int mask)
=C2=A0{
=C2=A0	const struct attribute_group **groups;
-	int i, size;
+	int i, size, result;
=C2=A0
-	size =3D ARRAY_SIZE(thermal_zone_attribute_groups) + 1;
+	/* we need one extra for trips and the NULL to terminate the array */
+	size =3D ARRAY_SIZE(thermal_zone_attribute_groups) + 2;
=C2=A0	/* This also takes care of API requirement to be NULL terminated */
=C2=A0	groups =3D kcalloc(size, sizeof(*groups), GFP_KERNEL);
=C2=A0	if (!groups)
=C2=A0		return -ENOMEM;
=C2=A0
-	for (i =3D 0; i < size - 1; i++)
+	for (i =3D 0; i < size - 2; i++)
=C2=A0		groups[i] =3D thermal_zone_attribute_groups[i];
=C2=A0
+	if (tz->trips) {
+		result =3D create_trip_attrs(tz, mask);
+		if (result)
+			return result;
+		groups[size - 2] =3D &tz->trips_attribute_group;
+	}
+
=C2=A0	tz->device.groups =3D groups;
=C2=A0
=C2=A0	return 0;
@@ -1934,8 +1934,12 @@ struct thermal_zone_device *thermal_zone_device_regi=
ster(const char *type,
=C2=A0	tz->passive_delay =3D passive_delay;
=C2=A0	tz->polling_delay =3D polling_delay;
=C2=A0
+	/* sys I/F */
=C2=A0	/* Add nodes that are always present via .groups */
-	thermal_zone_create_device_groups(tz);
+	result =3D thermal_zone_create_device_groups(tz, mask);
+	if (result)
+		goto unregister;
+
=C2=A0	/* A new thermal zone needs to be updated anyway. */
=C2=A0	atomic_set(&tz->need_update, 1);
=C2=A0
@@ -1947,11 +1951,6 @@ struct thermal_zone_device *thermal_zone_device_regi=
ster(const char *type,
=C2=A0		return ERR_PTR(result);
=C2=A0	}
=C2=A0
-	/* sys I/F */
-	result =3D create_trip_attrs(tz, mask);
-	if (result)
-		goto unregister;
-
=C2=A0	for (count =3D 0; count < trips; count++) {
=C2=A0		if (tz->ops->get_trip_type(tz, count, &trip_type))
=C2=A0			set_bit(count, &tz->trips_disabled);
@@ -2056,7 +2055,10 @@ void thermal_zone_device_unregister(struct thermal_z=
one_device *tz)
=C2=A0
=C2=A0	thermal_zone_device_set_polling(tz, 0);
=C2=A0
-	remove_trip_attrs(tz);
+	kfree(tz->trip_type_attrs);
+	kfree(tz->trip_temp_attrs);
+	kfree(tz->trip_hyst_attrs);
+	kfree(tz->trips_attribute_group.attrs);
=C2=A0	thermal_set_governor(tz, NULL);
=C2=A0
=C2=A0	thermal_remove_hwmon_sysfs(tz);
diff --git a/include/linux/thermal.h b/include/linux/thermal.h
index ee517be..580809c 100644
--- a/include/linux/thermal.h
+++ b/include/linux/thermal.h
@@ -28,6 +28,7 @@
=C2=A0#include <linux/of.h>
=C2=A0#include <linux/idr.h>
=C2=A0#include <linux/device.h>
+#include <linux/sysfs.h>
=C2=A0#include <linux/workqueue.h>
=C2=A0#include <uapi/linux/thermal.h>
=C2=A0
@@ -187,6 +188,7 @@ struct thermal_zone_device {
=C2=A0	int id;
=C2=A0	char type[THERMAL_NAME_LENGTH];
=C2=A0	struct device device;
+	struct attribute_group trips_attribute_group;
=C2=A0	struct thermal_attr *trip_temp_attrs;
=C2=A0	struct thermal_attr *trip_type_attrs;
=C2=A0	struct thermal_attr *trip_hyst_attrs;
--=C2=A0
2.7.4


> =

> on test machine: vm-lkp-wsx03-quantal-x86_64: 2 threads qemu-system-
> x86_64 -enable-kvm -cpu Haswell,+smep,+smap with 360M memory
> =

> caused below changes:
> =

> =

> +------------------------------------------------------------------
> ----+------------+------------+
> > =

> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > =C2=A0=C2=A0| 79f34853ba | 24bc2fa031 |
> +------------------------------------------------------------------
> ----+------------+------------+
> > =

> > boot_successes=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > =C2=A0=C2=A0| 2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0| 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
> > boot_failures=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > =C2=A0=C2=A0| 6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0| 8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
> > IP-Config:Auto-
> > configuration_of_network_failed=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0|
> > 6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 4=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
> > BUG:KASAN:slab-out-of-
> > bounds_in_thermal_zone_device_register_at_addr | 0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
> > 8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
> > BUG:KASAN:slab-out-of-
> > bounds_in_internal_create_group_at_addr=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0| 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0|
> > 8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
> > backtrace:power_supply_register=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > =C2=A0=C2=A0| 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0| 8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
> > backtrace:test_power_init=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > =C2=A0=C2=A0| 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0| 8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
> > backtrace:kernel_init_freeable=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > =C2=A0=C2=A0| 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0| 8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
> +------------------------------------------------------------------
> ----+------------+------------+
> =

> =

> =

> [=C2=A0=C2=A0=C2=A0=C2=A07.103767] __power_supply_register: Expected prop=
er parent device
> for 'test_ac'
> [=C2=A0=C2=A0=C2=A0=C2=A07.105699] __power_supply_register: Expected prop=
er parent device
> for 'test_battery'
> [=C2=A0=C2=A0=C2=A0=C2=A07.108318]
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [=C2=A0=C2=A0=C2=A0=C2=A07.109325] BUG: KASAN: slab-out-of-bounds in
> thermal_zone_device_register+0x749/0x10a0 at addr ffff880000134140
> [=C2=A0=C2=A0=C2=A0=C2=A07.110709] Write of size 8 by task swapper/1
> [=C2=A0=C2=A0=C2=A0=C2=A07.111312] CPU: 0 PID: 1 Comm: swapper Not tainte=
d 4.7.0-rc3-
> 00014-g24bc2fa0 #1
> [=C2=A0=C2=A0=C2=A0=C2=A07.112309] Hardware name: QEMU Standard PC (i440F=
X + PIIX, 1996),
> BIOS Debian-1.8.2-1 04/01/2014
> [=C2=A0=C2=A0=C2=A0=C2=A07.113506]=C2=A0=C2=A0ffff880000134160 ffff880010=
897b58 ffffffff817356d9
> ffff880010897bd8
> [=C2=A0=C2=A0=C2=A0=C2=A07.114588]=C2=A0=C2=A0ffffffff811ebffc 0000000000=
000000 0000000000000000
> 0000000000000297
> [=C2=A0=C2=A0=C2=A0=C2=A07.115652]=C2=A0=C2=A0ffffffff811eadf5 ffff880000=
13415f 1ffff1000002682c
> ffff880010897bd8
> [=C2=A0=C2=A0=C2=A0=C2=A07.116720] Call Trace:
> [=C2=A0=C2=A0=C2=A0=C2=A07.117080]=C2=A0=C2=A0[<ffffffff817356d9>] dump_s=
tack+0x19/0x20
> [=C2=A0=C2=A0=C2=A0=C2=A07.117777]=C2=A0=C2=A0[<ffffffff811ebffc>] kasan_=
report_error+0x1ec/0x5a0
> [=C2=A0=C2=A0=C2=A0=C2=A07.118598]=C2=A0=C2=A0[<ffffffff811eadf5>] ?
> kasan_unpoison_shadow+0x35/0x50
> [=C2=A0=C2=A0=C2=A0=C2=A07.119454]=C2=A0=C2=A0[<ffffffff811eb4a9>] ? kasa=
n_kmalloc+0xd9/0x100
> [=C2=A0=C2=A0=C2=A0=C2=A07.120239]=C2=A0=C2=A0[<ffffffff811ec3e3>] kasan_=
report+0x33/0x40
> [=C2=A0=C2=A0=C2=A0=C2=A07.120967]=C2=A0=C2=A0[<ffffffff81d44e39>] ?
> thermal_zone_device_register+0x749/0x10a0
> [=C2=A0=C2=A0=C2=A0=C2=A07.121949]=C2=A0=C2=A0[<ffffffff811ebc81>] __asan=
_store8+0x61/0x70
> [=C2=A0=C2=A0=C2=A0=C2=A07.122699]=C2=A0=C2=A0[<ffffffff81d44e39>]
> thermal_zone_device_register+0x749/0x10a0
> [=C2=A0=C2=A0=C2=A0=C2=A07.123646]=C2=A0=C2=A0[<ffffffff81d446f0>] ?
> thermal_notify_framework+0x10/0x10
> [=C2=A0=C2=A0=C2=A0=C2=A07.124545]=C2=A0=C2=A0[<ffffffff818f0640>] ? dev_=
warn+0xe0/0xe0
> [=C2=A0=C2=A0=C2=A0=C2=A07.125259]=C2=A0=C2=A0[<ffffffff821c5d49>] ? _raw=
_spin_unlock_irq+0x9/0x20
> [=C2=A0=C2=A0=C2=A0=C2=A07.126104]=C2=A0=C2=A0[<ffffffff8190959c>] ?
> device_wakeup_enable+0xbc/0x110
> [=C2=A0=C2=A0=C2=A0=C2=A07.126956]=C2=A0=C2=A0[<ffffffff81ca1179>]
> __power_supply_register+0x5c9/0x700
> [=C2=A0=C2=A0=C2=A0=C2=A07.127840]=C2=A0=C2=A0[<ffffffff81ca185e>] power_=
supply_register+0xe/0x10
> [=C2=A0=C2=A0=C2=A0=C2=A07.128663]=C2=A0=C2=A0[<ffffffff83269716>] test_p=
ower_init+0x35/0xeb
> [=C2=A0=C2=A0=C2=A0=C2=A07.129433]=C2=A0=C2=A0[<ffffffff832696e1>] ?
> wm8350_power_driver_init+0x14/0x14
> [=C2=A0=C2=A0=C2=A0=C2=A07.130328]=C2=A0=C2=A0[<ffffffff832222cd>] do_one=
_initcall+0xef/0x1a1
> [=C2=A0=C2=A0=C2=A0=C2=A07.131111]=C2=A0=C2=A0[<ffffffff83221aae>] ? repa=
ir_env_string+0x2f/0x73
> [=C2=A0=C2=A0=C2=A0=C2=A07.131912]=C2=A0=C2=A0[<ffffffff832221de>] ? star=
t_kernel+0x447/0x447
> [=C2=A0=C2=A0=C2=A0=C2=A07.132689]=C2=A0=C2=A0[<ffffffff810fca00>] ? para=
meq+0xa0/0xa0
> [=C2=A0=C2=A0=C2=A0=C2=A07.133385]=C2=A0=C2=A0[<ffffffff83221a7f>] ? set_=
debug_rodata+0x12/0x12
> [=C2=A0=C2=A0=C2=A0=C2=A07.134192]=C2=A0=C2=A0[<ffffffff83222516>] kernel=
_init_freeable+0x197/0x228
> [=C2=A0=C2=A0=C2=A0=C2=A07.135042]=C2=A0=C2=A0[<ffffffff821b4d2e>] kernel=
_init+0xe/0x110
> [=C2=A0=C2=A0=C2=A0=C2=A07.135751]=C2=A0=C2=A0[<ffffffff821c629f>] ret_fr=
om_fork+0x1f/0x40
> [=C2=A0=C2=A0=C2=A0=C2=A07.136488]=C2=A0=C2=A0[<ffffffff821b4d20>] ? rest=
_init+0x90/0x90
> [=C2=A0=C2=A0=C2=A0=C2=A07.137207] Object at ffff880000134140, in cache k=
malloc-32
> [=C2=A0=C2=A0=C2=A0=C2=A07.137952] Object allocated with size 1 bytes.
> [=C2=A0=C2=A0=C2=A0=C2=A07.138572] Allocation:
> [=C2=A0=C2=A0=C2=A0=C2=A07.138909] PID =3D 1
> [=C2=A0=C2=A0=C2=A0=C2=A07.139216]=C2=A0=C2=A0[<ffffffff81032e55>] save_s=
tack_trace+0x25/0x40
> [=C2=A0=C2=A0=C2=A0=C2=A07.139993]=C2=A0=C2=A0[<ffffffff811ead36>] save_s=
tack+0x46/0xd0
> [=C2=A0=C2=A0=C2=A0=C2=A07.140714]=C2=A0=C2=A0[<ffffffff811eb4a9>] kasan_=
kmalloc+0xd9/0x100
> [=C2=A0=C2=A0=C2=A0=C2=A07.141479]=C2=A0=C2=A0[<ffffffff811e92a6>] __kmal=
loc+0xe6/0x1d0
> [=C2=A0=C2=A0=C2=A0=C2=A07.142201]=C2=A0=C2=A0[<ffffffff81d44a9c>]
> thermal_zone_device_register+0x3ac/0x10a0
> [=C2=A0=C2=A0=C2=A0=C2=A07.143162]=C2=A0=C2=A0[<ffffffff81ca1179>]
> __power_supply_register+0x5c9/0x700
> [=C2=A0=C2=A0=C2=A0=C2=A07.144076]=C2=A0=C2=A0[<ffffffff81ca185e>] power_=
supply_register+0xe/0x10
> [=C2=A0=C2=A0=C2=A0=C2=A07.144913]=C2=A0=C2=A0[<ffffffff83269716>] test_p=
ower_init+0x35/0xeb
> [=C2=A0=C2=A0=C2=A0=C2=A07.145698]=C2=A0=C2=A0[<ffffffff832222cd>] do_one=
_initcall+0xef/0x1a1
> [=C2=A0=C2=A0=C2=A0=C2=A07.146487]=C2=A0=C2=A0[<ffffffff83222516>] kernel=
_init_freeable+0x197/0x228
> [=C2=A0=C2=A0=C2=A0=C2=A07.147359]=C2=A0=C2=A0[<ffffffff821b4d2e>] kernel=
_init+0xe/0x110
> [=C2=A0=C2=A0=C2=A0=C2=A07.148105]=C2=A0=C2=A0[<ffffffff821c629f>] ret_fr=
om_fork+0x1f/0x40
> [=C2=A0=C2=A0=C2=A0=C2=A07.148860] Memory state around the buggy address:
> [=C2=A0=C2=A0=C2=A0=C2=A07.149548]=C2=A0=C2=A0ffff880000134000: 00 fc fc =
fc fc fc fc fc 00 03 fc fc
> fc fc fc fc
> [=C2=A0=C2=A0=C2=A0=C2=A07.150578]=C2=A0=C2=A0ffff880000134080: 06 fc fc =
fc fc fc fc fc 03 fc fc fc
> fc fc fc fc
> =

> =

> FYI, raw QEMU command line is:
> =

> 	qemu-system-x86_64 -enable-kvm -cpu Haswell,+smep,+smap -kernel
> /pkg/linux/x86_64-randconfig-s1-06151451/gcc-
> 6/24bc2fa031f094c05c017a862732924cb46ad2c1/vmlinuz-4.7.0-rc3-00014-
> g24bc2fa0 -append 'root=3D/dev/ram0 user=3Dlkp job=3D/lkp/scheduled/vm-lk=
p-
> wsx03-quantal-x86_64-8/bisect_boot-1-quantal-core-x86_64.cgz-x86_64-
> randconfig-s1-06151451-24bc2fa031f094c05c017a862732924cb46ad2c1-
> 20160615-110339-ip9qk6-0.yaml~ ARCH=3Dx86_64 kconfig=3Dx86_64-randconfig-
> s1-06151451 branch=3Dlinux-devel/devel-spot-201606151338
> commit=3D24bc2fa031f094c05c017a862732924cb46ad2c1
> BOOT_IMAGE=3D/pkg/linux/x86_64-randconfig-s1-06151451/gcc-
> 6/24bc2fa031f094c05c017a862732924cb46ad2c1/vmlinuz-4.7.0-rc3-00014-
> g24bc2fa0 max_uptime=3D600 RESULT_ROOT=3D/result/boot/1/vm-lkp-wsx03-
> quantal-x86_64/quantal-core-x86_64.cgz/x86_64-randconfig-s1-
> 06151451/gcc-6/24bc2fa031f094c05c017a862732924cb46ad2c1/0
> LKP_SERVER=3Dinn earlyprintk=3DttyS0,115200 systemd.log_level=3Derr debug
> apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D100
> panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic
> load_ramdisk=3D2 prompt_ramdisk=3D0 console=3DttyS0,115200 console=3Dtty0
> vga=3Dnormal rw ip=3D::::vm-lkp-wsx03-quantal-x86_64-8::dhcp
> drbd.minor_count=3D8'=C2=A0=C2=A0-initrd /fs/sdc1/initrd-vm-lkp-wsx03-qua=
ntal-
> x86_64-8 -m 360 -smp 2 -device e1000,netdev=3Dnet0 -netdev user,id=3Dnet0
> -boot order=3Dnc -no-reboot -watchdog i6300esb -rtc base=3Dlocaltime
> -pidfile /dev/shm/kboot/pid-vm-lkp-wsx03-quantal-x86_64-8 -serial
> file:/dev/shm/kboot/serial-vm-lkp-wsx03-quantal-x86_64-8 -daemonize
> -display none -monitor null=C2=A0
> =

> =

> =

> =

> =

> Thanks,
> Xiaolong

--===============0138583878230473966==--

