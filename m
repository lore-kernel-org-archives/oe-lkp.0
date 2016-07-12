Content-Type: multipart/mixed; boundary="===============8083989580789937774=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [perf/x86] 8de4a00661: WARNING: CPU: 0 PID: 1 at kernel/locking/mutex-debug.c:80 debug_mutex_unlock+0x20c/0x2b3
Date: Tue, 12 Jul 2016 21:59:23 +0200
Message-ID: <alpine.DEB.2.11.1607122144560.4083@nanos>
In-Reply-To: <alpine.DEB.2.11.1607121916430.4083@nanos>
List-Id: <oe-lkp.lists.linux.dev>

--===============8083989580789937774==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 12 Jul 2016, Thomas Gleixner wrote:
> /me goes digging deeper

and dons a brown paperbag....

8<----------------

Subject: cpuhotplug: Keep enough storage space if SMP=3Dn
From: Thomas Gleixner <tglx@linutronix.de>

The cpuhp_bp_states array is cut short when CONFIG_SMP=3Dn, but the dynamic=
ally
registered callbacks are stored nevertheless and happily scribble outside of
the array bounds.

We need to store them in case that the state is unregistered so we can invo=
ke
the teardown function. That's independent of CONFIG_SMP. Make sure the array
is large enough.

Fixes: cff7d378d3fd "cpu/hotplug: Convert to a state machine for the contro=
l processor"
Reported-by: kernel test robot <xiaolong.ye@intel.com>
Cc: stable(a)vger.kernel.org
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
diff --git a/kernel/cpu.c b/kernel/cpu.c
index d948e44c471e..7b61887f7ccd 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1201,6 +1201,8 @@ static struct cpuhp_step cpuhp_bp_states[] =3D {
 		.teardown		=3D takedown_cpu,
 		.cant_stop		=3D true,
 	},
+#else
+	[CPUHP_BRINGUP_CPU] =3D { },
 #endif
 };
=20

--===============8083989580789937774==--

