Content-Type: multipart/mixed; boundary="===============8297958427271562201=="
MIME-Version: 1.0
From: Compostella, Jeremy <jeremy.compostella@intel.com>
To: lkp@lists.01.org
Subject: Re: arch/x86/kernel/cpu/intel_epb.c:208:2: error: use of undeclared identifier 'INTEL_FAM6_RAPTORLAKE_P'
Date: Tue, 05 Jul 2022 13:30:15 -0700
Message-ID: <87k08rpajs.fsf@jcompost-mobl.amr.corp.intel.com>
In-Reply-To: <202207060319.AJk61TEP-lkp@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8297958427271562201==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I submitted a patch earlier today to linux-power-mgmt(a)eclists.intel.com a=
nd
linux-drivers-review(a)eclists.intel.com (cf. x86: intel_epb: Set
RaptorLake appropriate EPB.

I received the following robot build error. The information shared
below does not provide the version of the kernel it applied the patch
to and that it tried to build. My understanding is that the family
declaration my patch rely on has been introduced in 5.18. Which
version is the robot using ? I there way to make it use a 5.18 ?

Regards,
Jeremy

kernel test robot <lkp@intel.com> writes:

> tree:   internal-linux-review/Compostella-Jeremy/x86-intel_epb-Set-Raptor=
Lake-desired-normal-EPB/20220706-012133
> head:   be007fa090c5cd552460eb38cca02eb3918afd1c
> commit: be007fa090c5cd552460eb38cca02eb3918afd1c x86: intel_epb: Set Rapt=
orLake desired normal EPB
> date:   2 hours ago
> config: i386-randconfig-a014-20220704 (attached as .config)
> compiler: clang version 15.0.0 (<https://github.com/llvm/llvm-project> 14=
2aca7741d5b06207e87bf4880fbe308c8d6823)
> reproduce (this is a W=3D1 build):
>         wget <https://raw.githubusercontent.com/intel/lkp-tests/master/sb=
in/make.cross> -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout be007fa090c5cd552460eb38cca02eb3918afd1c
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1 O=3Dbuild_dir ARCH=3Di386 SHELL=3D/bin/bash
>
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>>> arch/x86/kernel/cpu/intel_epb.c:208:2: error: use of undeclared identif=
ier 'INTEL_FAM6_RAPTORLAKE_P'
>            X86_MATCH_INTEL_FAM6_MODEL(RAPTORLAKE_P, 7),
>            ^
>    arch/x86/include/asm/cpu_device_id.h:161:39: note: expanded from macro=
 'X86_MATCH_INTEL_FAM6_MODEL'
>            X86_MATCH_VENDOR_FAM_MODEL(INTEL, 6, INTEL_FAM6_##model, data)
>                                                 ^
>    <scratch space>:13:1: note: expanded from here
>    INTEL_FAM6_RAPTORLAKE_P
>    ^
>    1 error generated.
>
>
> vim +/INTEL_FAM6_RAPTORLAKE_P +208 arch/x86/kernel/cpu/intel_epb.c
>
>    205	=

>    206	static const struct x86_cpu_id intel_epb_normal[] =3D {
>    207		X86_MATCH_INTEL_FAM6_MODEL(ALDERLAKE_L, 7),
>  > 208		X86_MATCH_INTEL_FAM6_MODEL(RAPTORLAKE_P, 7),
>    209		{}
>    210	};
>    211	=


--
Jeremy
One Emacs to rule them all

--===============8297958427271562201==--

