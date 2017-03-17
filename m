Content-Type: multipart/mixed; boundary="===============3061739421429709215=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [locking/lockdep] 383776fa75: INFO: trying to register non-static key.
Date: Fri, 17 Mar 2017 14:41:09 +0100
Message-ID: <20170317134109.e7qmjwpryelpbgz2@hirez.programming.kicks-ass.net>
In-Reply-To: <58cad449.RTO+aYLdogbZs5Le%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3061739421429709215==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 17, 2017 at 02:07:05AM +0800, kernel test robot wrote:

>     locking/lockdep: Handle statically initialized PER_CPU locks properly

> [   11.712266] INFO: trying to register non-static key.

Blergh; so the problem is that when we assign can_addr to lock->key, we
can, upon using a different subclass, reach static_obj(lock->key), which
will fail on the can_addr.

One way to fix this would be to redefine the canonical address as the
per-cpu address for a specific cpu; the below hard codes cpu0, but I'm
not sure we want to rely on cpu0 being a valid cpu.


---
diff --git a/kernel/module.c b/kernel/module.c
index 5ef618133849..bdd9d62ce08c 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -682,8 +682,10 @@ bool __is_module_percpu_address(unsigned long addr, un=
signed long *can_addr)
 			void *va =3D (void *)addr;
 =

 			if (va >=3D start && va < start + mod->percpu_size) {
-				if (can_addr)
+				if (can_addr) {
 					*can_addr =3D (unsigned long) (va - start);
+					*can_addr +=3D (unsigned long)per_cpu_ptr(mod->percpu, 0);
+				}
 				preempt_enable();
 				return true;
 			}
diff --git a/mm/percpu.c b/mm/percpu.c
index e30c995f2b7b..a5d7b7477888 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -1296,8 +1296,10 @@ bool __is_kernel_percpu_address(unsigned long addr, =
unsigned long *can_addr)
 		void *va =3D (void *)addr;
 =

 		if (va >=3D start && va < start + static_size) {
-			if (can_addr)
+			if (can_addr) {
 				*can_addr =3D (unsigned long) (va - start);
+				*can_addr +=3D (unsigned long)per_cpu_ptr(base, 0);
+			}
 			return true;
 		}
 	}

--===============3061739421429709215==--

