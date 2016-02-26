Content-Type: multipart/mixed; boundary="===============8003822251208492745=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [x86/topology] 6a1447190e: BUG: unable to handle kernel paging request at ffffffffffffffff
Date: Fri, 26 Feb 2016 10:21:32 +0100
Message-ID: <alpine.DEB.2.11.1602261001190.3638@nanos>
In-Reply-To: <87a8mn7trd.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8003822251208492745==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 26 Feb 2016, Huang, Ying wrote:
> Thomas Gleixner <tglx@linutronix.de> writes:
> Sorry, the reproduce steps in the original email is not correct.  In
> fact, this is a boot error even before the user space run.  The qemu
> command line i demsg.xz attached in the original email may help producing.
> =

> qemu-system-x86_64 -enable-kvm -kernel ....

Ok, found it. Patch below fixes the issue.

Thanks

	tglx - wearing a brown paperbag for the rest of the day :)

8<----------------------

diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index 03f5fd0..3bf1e0b 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -329,9 +329,9 @@ static void __init smp_init_package_map(void)
 	size =3D max_physical_pkg_id * sizeof(unsigned int);
 	physical_to_logical_pkg =3D kmalloc(size, GFP_KERNEL);
 	memset(physical_to_logical_pkg, 0xff, size);
-	size =3D BITS_TO_LONGS(max_physical_pkg_id);
+	size =3D BITS_TO_LONGS(max_physical_pkg_id) * sizeof(unsigned long);
 	physical_package_map =3D kzalloc(size, GFP_KERNEL);
-	size =3D BITS_TO_LONGS(__max_logical_packages);
+	size =3D BITS_TO_LONGS(__max_logical_packages) * sizeof(unsigned long);
 	logical_package_map =3D kzalloc(size, GFP_KERNEL);
 =

 	pr_info("Max logical packages: %u\n", __max_logical_packages);


--===============8003822251208492745==--

