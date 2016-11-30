Content-Type: multipart/mixed; boundary="===============1736901251547944458=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86, paravirt] fd6f48529f: aim7.jobs-per-min -26.1% regression
Date: Thu, 01 Dec 2016 07:17:58 +0800
Message-ID: <20161130231758.GB18574@yexl-desktop>
In-Reply-To: <20161201070406.GI3092@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============1736901251547944458==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12/01, Peter Zijlstra wrote:
>On Thu, Dec 01, 2016 at 02:07:29AM +0800, kernel test robot wrote:
>> =

>> Greeting,
>> =

>> FYI, we noticed a -26.1% regression of aim7.jobs-per-min due to commit:
>> =

>> =

>> commit: fd6f48529f4067c6bfbead88d3d7d117d51150f6 ("x86,paravirt: Optimiz=
e native pv_lock_ops.vcpu_is_preempted")
>> https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking=
/core
>> =

>
>> =

>> 8ba24710fb279053  fd6f48529f4067c6bfbead88d3  =

>
>So that really is against its parent..
>
>Does something like so fix it?

I'll queue the test job for below patch and provide the result later.

Thanks,
Xiaolong
>
>--- a/arch/x86/kernel/paravirt_patch_32.c
>+++ b/arch/x86/kernel/paravirt_patch_32.c
>@@ -56,15 +56,19 @@ unsigned native_patch(u8 type, u16 clobb
> 				end   =3D end_pv_lock_ops_queued_spin_unlock;
> 				goto patch_site;
> 			}
>+			goto patch_default;
>+
> 		case PARAVIRT_PATCH(pv_lock_ops.vcpu_is_preempted):
> 			if (pv_is_native_vcpu_is_preempted()) {
> 				start =3D start_pv_lock_ops_vcpu_is_preempted;
> 				end   =3D end_pv_lock_ops_vcpu_is_preempted;
> 				goto patch_site;
> 			}
>+			goto patch_default;
> #endif
> =

> 	default:
>+patch_default:
> 		ret =3D paravirt_patch_default(type, clobbers, ibuf, addr, len);
> 		break;
> =

>--- a/arch/x86/kernel/paravirt_patch_64.c
>+++ b/arch/x86/kernel/paravirt_patch_64.c
>@@ -68,15 +68,19 @@ unsigned native_patch(u8 type, u16 clobb
> 				end   =3D end_pv_lock_ops_queued_spin_unlock;
> 				goto patch_site;
> 			}
>+			goto patch_default;
>+
> 		case PARAVIRT_PATCH(pv_lock_ops.vcpu_is_preempted):
> 			if (pv_is_native_vcpu_is_preempted()) {
> 				start =3D start_pv_lock_ops_vcpu_is_preempted;
> 				end   =3D end_pv_lock_ops_vcpu_is_preempted;
> 				goto patch_site;
> 			}
>+			goto patch_default;
> #endif
> =

> 	default:
>+patch_default:
> 		ret =3D paravirt_patch_default(type, clobbers, ibuf, addr, len);
> 		break;
> =

>

--===============1736901251547944458==--

