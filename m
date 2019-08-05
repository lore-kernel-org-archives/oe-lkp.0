Content-Type: multipart/mixed; boundary="===============3239125793821993266=="
MIME-Version: 1.0
From: Chen, Rong A <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/boot] 5b51ae969e: kexec boot failed
Date: Mon, 05 Aug 2019 19:46:33 +0800
Message-ID: <d25662bc-c70c-7118-263a-63da41d5bcf1@intel.com>
In-Reply-To: <20190802075949.GA4681@dhcp-128-65.nay.redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3239125793821993266==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On 8/2/2019 3:59 PM, Dave Young wrote:
> Hi,
>
> On 08/02/19 at 03:48pm, kernel test robot wrote:
>> FYI, we noticed the following commit (built with gcc-7):
>>
>> commit: 5b51ae969e3d8ab0134ee3c98a769ad6d2cc2e24 ("x86/boot: Call get_rs=
dp_addr() after console_init()")
>> https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux.=
git  master
>>
>> in testcase: boot
>>
>> on test machine: Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz with 4G memory
>>
>> The commit broke kexec boot on physical machines, We have to set "nokasl=
r" to kernel cmdline to avoid the issue.
>>
> Does moving line of "sanitize_boot_params(boot_params);" after get_rsdp_a=
ddr()
> callback work?

It doesn't work with the following patch:

diff --git a/arch/x86/boot/compressed/misc.c =

b/arch/x86/boot/compressed/misc.c
index 24e65a0f756d6..a3746e154e971 100644
--- a/arch/x86/boot/compressed/misc.c
+++ b/arch/x86/boot/compressed/misc.c
@@ -351,8 +351,6 @@ asmlinkage __visible void *extract_kernel(void =

*rmode, memptr heap,
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Clear flags intended for sol=
ely in-kernel use. */
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 boot_params->hdr.loadflags &=3D=
 ~KASLR_FLAG;

-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sanitize_boot_params(boot_params);
-
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (boot_params->screen_info.or=
ig_video_mode =3D=3D 7) {
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 vidmem =3D (char *) 0xb0000;
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 vidport =3D 0x3b4;
@@ -373,6 +371,8 @@ asmlinkage __visible void *extract_kernel(void =

*rmode, memptr heap,
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 boot_params->acpi_rsdp_addr =3D=
 get_rsdp_addr();

+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sanitize_boot_params(boot_params);
+
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 debug_putstr("early console in =
extract_kernel\n");

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 free_mem_ptr=C2=A0=C2=A0=C2=A0=
=C2=A0 =3D heap;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Heap */

Best Regards,
Rong Chen

--===============3239125793821993266==--

