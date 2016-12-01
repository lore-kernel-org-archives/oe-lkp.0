Content-Type: multipart/mixed; boundary="===============8177179652876841772=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [x86, paravirt] fd6f48529f: aim7.jobs-per-min -26.1% regression
Date: Thu, 01 Dec 2016 08:04:06 +0100
Message-ID: <20161201070406.GI3092@twins.programming.kicks-ass.net>
In-Reply-To: <20161130180729.GB15492@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============8177179652876841772==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 01, 2016 at 02:07:29AM +0800, kernel test robot wrote:
> =

> Greeting,
> =

> FYI, we noticed a -26.1% regression of aim7.jobs-per-min due to commit:
> =

> =

> commit: fd6f48529f4067c6bfbead88d3d7d117d51150f6 ("x86,paravirt: Optimize=
 native pv_lock_ops.vcpu_is_preempted")
> https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/=
core
> =


> =

> 8ba24710fb279053  fd6f48529f4067c6bfbead88d3  =


So that really is against its parent..

Does something like so fix it?

--- a/arch/x86/kernel/paravirt_patch_32.c
+++ b/arch/x86/kernel/paravirt_patch_32.c
@@ -56,15 +56,19 @@ unsigned native_patch(u8 type, u16 clobb
 				end   =3D end_pv_lock_ops_queued_spin_unlock;
 				goto patch_site;
 			}
+			goto patch_default;
+
 		case PARAVIRT_PATCH(pv_lock_ops.vcpu_is_preempted):
 			if (pv_is_native_vcpu_is_preempted()) {
 				start =3D start_pv_lock_ops_vcpu_is_preempted;
 				end   =3D end_pv_lock_ops_vcpu_is_preempted;
 				goto patch_site;
 			}
+			goto patch_default;
 #endif
 =

 	default:
+patch_default:
 		ret =3D paravirt_patch_default(type, clobbers, ibuf, addr, len);
 		break;
 =

--- a/arch/x86/kernel/paravirt_patch_64.c
+++ b/arch/x86/kernel/paravirt_patch_64.c
@@ -68,15 +68,19 @@ unsigned native_patch(u8 type, u16 clobb
 				end   =3D end_pv_lock_ops_queued_spin_unlock;
 				goto patch_site;
 			}
+			goto patch_default;
+
 		case PARAVIRT_PATCH(pv_lock_ops.vcpu_is_preempted):
 			if (pv_is_native_vcpu_is_preempted()) {
 				start =3D start_pv_lock_ops_vcpu_is_preempted;
 				end   =3D end_pv_lock_ops_vcpu_is_preempted;
 				goto patch_site;
 			}
+			goto patch_default;
 #endif
 =

 	default:
+patch_default:
 		ret =3D paravirt_patch_default(type, clobbers, ibuf, addr, len);
 		break;
 =



--===============8177179652876841772==--

