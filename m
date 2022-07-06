Content-Type: multipart/mixed; boundary="===============0465227614471264899=="
MIME-Version: 1.0
From: Chen, Rong A <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: arch/x86/kernel/cpu/intel_epb.c:208:2: error: use of undeclared identifier 'INTEL_FAM6_RAPTORLAKE_P'
Date: Wed, 06 Jul 2022 16:39:03 +0800
Message-ID: <1ce703eb-e3a8-3cc2-67bd-1443a133d472@intel.com>
In-Reply-To: <87k08rpajs.fsf@jcompost-mobl.amr.corp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0465227614471264899==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Jeremy,

The bot applied the patch to tip/x86/core according to the information
in MAINTAINERS files, but the tip/x86/core branch seems old.

   21578 X86 ARCHITECTURE (32-BIT AND 64-BIT)
   21579 M:=E2=80=BA Thomas Gleixner <tglx@linutronix.de>
   21580 M:=E2=80=BA Ingo Molnar <mingo@redhat.com>
   21581 M:=E2=80=BA Borislav Petkov <bp@alien8.de>
   21582 M:=E2=80=BA Dave Hansen <dave.hansen@linux.intel.com>
   21583 M:=E2=80=BA x86(a)kernel.org
   21584 R:=E2=80=BA "H. Peter Anvin" <hpa@zytor.com>
   21585 L:=E2=80=BA linux-kernel(a)vger.kernel.org
   21586 S:=E2=80=BA Maintained
   21587 T:=E2=80=BA git =

git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/core
   21588 F:=E2=80=BA Documentation/devicetree/bindings/x86/
   21589 F:=E2=80=BA Documentation/x86/
   21590 F:=E2=80=BA arch/x86/

we suggest to use '--base' to provide the base info as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information

Best Regards,
Rong Chen

On 7/6/2022 4:30 AM, Compostella, Jeremy wrote:
> I submitted a patch earlier today to linux-power-mgmt(a)eclists.intel.com=
 and
> linux-drivers-review(a)eclists.intel.com (cf. x86: intel_epb: Set
> RaptorLake appropriate EPB.
> =

> I received the following robot build error. The information shared
> below does not provide the version of the kernel it applied the patch
> to and that it tried to build. My understanding is that the family
> declaration my patch rely on has been introduced in 5.18. Which
> version is the robot using ? I there way to make it use a 5.18 ?
> =

> Regards,
> Jeremy
> =

> kernel test robot <lkp@intel.com> writes:
> =

>> tree:   internal-linux-review/Compostella-Jeremy/x86-intel_epb-Set-Rapto=
rLake-desired-normal-EPB/20220706-012133
>> head:   be007fa090c5cd552460eb38cca02eb3918afd1c
>> commit: be007fa090c5cd552460eb38cca02eb3918afd1c x86: intel_epb: Set Rap=
torLake desired normal EPB
>> date:   2 hours ago
>> config: i386-randconfig-a014-20220704 (attached as .config)
>> compiler: clang version 15.0.0 (<https://github.com/llvm/llvm-project> 1=
42aca7741d5b06207e87bf4880fbe308c8d6823)
>> reproduce (this is a W=3D1 build):
>>          wget <https://raw.githubusercontent.com/intel/lkp-tests/master/=
sbin/make.cross> -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          git checkout be007fa090c5cd552460eb38cca02eb3918afd1c
>>          # save the config file
>>          mkdir build_dir && cp config build_dir/.config
>>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross =
W=3D1 O=3Dbuild_dir ARCH=3Di386 SHELL=3D/bin/bash
>>
>> If you fix the issue, kindly add following tag where applicable
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>>> arch/x86/kernel/cpu/intel_epb.c:208:2: error: use of undeclared identi=
fier 'INTEL_FAM6_RAPTORLAKE_P'
>>             X86_MATCH_INTEL_FAM6_MODEL(RAPTORLAKE_P, 7),
>>             ^
>>     arch/x86/include/asm/cpu_device_id.h:161:39: note: expanded from mac=
ro 'X86_MATCH_INTEL_FAM6_MODEL'
>>             X86_MATCH_VENDOR_FAM_MODEL(INTEL, 6, INTEL_FAM6_##model, dat=
a)
>>                                                  ^
>>     <scratch space>:13:1: note: expanded from here
>>     INTEL_FAM6_RAPTORLAKE_P
>>     ^
>>     1 error generated.
>>
>>
>> vim +/INTEL_FAM6_RAPTORLAKE_P +208 arch/x86/kernel/cpu/intel_epb.c
>>
>>     205	=

>>     206	static const struct x86_cpu_id intel_epb_normal[] =3D {
>>     207		X86_MATCH_INTEL_FAM6_MODEL(ALDERLAKE_L, 7),
>>   > 208		X86_MATCH_INTEL_FAM6_MODEL(RAPTORLAKE_P, 7),
>>     209		{}
>>     210	};
>>     211	=

> =

> --
> Jeremy
> One Emacs to rule them all
> =

> =

> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org
>=20
--===============0465227614471264899==--

