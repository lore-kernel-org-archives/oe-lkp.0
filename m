Content-Type: multipart/mixed; boundary="===============6171367222521374553=="
MIME-Version: 1.0
From: Hans-Christian Noren Egtvedt <egtvedt@samfundet.no>
To: lkp@lists.01.org
Subject: Re: [avr32:for-linus 1/3] Makefile:539: arch/avr32/Makefile: No such file or directory
Date: Sun, 05 Mar 2017 10:26:22 +0100
Message-ID: <20170305092617.GA22428@samfundet.no>
In-Reply-To: <20170305004007.6t6y7kf5jp5asvf6@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6171367222521374553==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Around Sun 05 Mar 2017 08:40:07 +0800 or thereabout, Fengguang Wu wrote:

Hello Fengguang,

> Got it. Shall we stop testing avr32?
>

Yes, I think that will be OK. It will either be removed for 4.11 or
eventually for 4.12.

Out of curiosity, I see you state compiler avr-gcc (GCC) 4.9.2 below, is th=
at
some weird typo? avr-gcc was never able to cross compile to AVR32
architecture.

> On Sat, Mar 04, 2017 at 01:28:32PM +0100, Hans-Christian Noren Egtvedt wr=
ote:
>>Around Sat 04 Mar 2017 05:22:33 +0800 or thereabout, kbuild test robot wr=
ote:
>>
>>Hello,
>>
>>this is sort of expected, we are in the process of removing the AVR32
>>architecture support from the kernel tree.
>>
>>>tree:   https://git.kernel.org/pub/scm/linux/kernel/git/egtvedt/linux-av=
r32.git for-linus
>>>head:   c3a4ba794cfb85af19d846b8e4386982e3f636c8
>>>commit: d1dd4384b83af433e842673f0189dc6509dd796c [1/3] avr32: remove sup=
port for AVR32 architecture
>>>config: avr32-atngw100_defconfig
>>>compiler: avr-gcc (GCC) 4.9.2
>>>reproduce:
>>>        wget https://raw.githubusercontent.com/01org/lkp-tests/master/sb=
in/make.cross -O ~/bin/make.cross
>>>        chmod +x ~/bin/make.cross
>>>        git checkout d1dd4384b83af433e842673f0189dc6509dd796c
>>>        make.cross ARCH=3Davr32  atngw100_defconfig
>>>        make.cross ARCH=3Davr32
>>>
>>>All errors (new ones prefixed by >>):
>>>
>>>>>Makefile:539: arch/avr32/Makefile: No such file or directory
>>>>>make[1]: *** No rule to make target 'arch/avr32/Makefile'.
>>>   make[1]: Failed to remake makefile 'arch/avr32/Makefile'.
>>>   make[2]: *** [atngw100_defconfig] Error 1
>>>   make[1]: *** [atngw100_defconfig] Error 2
>>>   make: *** [sub-make] Error 2
>>>--
>>>   Makefile:628: arch/avr32/Makefile: No such file or directory
>>>>>make[1]: *** No rule to make target 'arch/avr32/Makefile'.
>>>   make[1]: Failed to remake makefile 'arch/avr32/Makefile'.
>>>   make: *** [sub-make] Error 2
>>>--
>>>>>Makefile:539: arch/avr32/Makefile: No such file or directory
>>>>>make[1]: *** No rule to make target 'arch/avr32/Makefile'.
>>>   make[1]: Failed to remake makefile 'arch/avr32/Makefile'.
>>>   make[2]: *** [oldconfig] Error 1
>>>   make[1]: *** [oldconfig] Error 2
>>>   make: *** [sub-make] Error 2
>>>--
>>>>>Makefile:539: arch/avr32/Makefile: No such file or directory
>>>>>make[1]: *** No rule to make target 'arch/avr32/Makefile'.
>>>   make[1]: Failed to remake makefile 'arch/avr32/Makefile'.
>>>   make[2]: *** [olddefconfig] Error 1
>>>   make[2]: Target 'oldnoconfig' not remade because of errors.
>>>   make[1]: *** [oldnoconfig] Error 2
>>>   make: *** [sub-make] Error 2
>>>
>>>vim +539 Makefile
>>>
>>>9319f4539 Masahiro Yamada 2014-04-09  523
>>>9319f4539 Masahiro Yamada 2014-04-09  524  __build_one_by_one:
>>>9319f4539 Masahiro Yamada 2014-04-09  525  	$(Q)set -e; \
>>>9319f4539 Masahiro Yamada 2014-04-09  526  	for i in $(MAKECMDGOALS); do=
 \
>>>9319f4539 Masahiro Yamada 2014-04-09  527  		$(MAKE) -f $(srctree)/Makef=
ile $$i; \
>>>9319f4539 Masahiro Yamada 2014-04-09  528  	done
>>>^1da177e4 Linus Torvalds  2005-04-16  529
>>>^1da177e4 Linus Torvalds  2005-04-16  530  else
>>>^1da177e4 Linus Torvalds  2005-04-16  531  ifeq ($(config-targets),1)
>>>^1da177e4 Linus Torvalds  2005-04-16  532  # =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>^1da177e4 Linus Torvalds  2005-04-16  533  # *config targets only - make=
 sure prerequisites are updated, and descend
>>>^1da177e4 Linus Torvalds  2005-04-16  534  # in scripts/kconfig to make =
the *config target
>>>^1da177e4 Linus Torvalds  2005-04-16  535
>>>^1da177e4 Linus Torvalds  2005-04-16  536  # Read arch specific Makefile=
 to set KBUILD_DEFCONFIG as needed.
>>>^1da177e4 Linus Torvalds  2005-04-16  537  # KBUILD_DEFCONFIG may point =
out an alternative default configuration
>>>^1da177e4 Linus Torvalds  2005-04-16  538  # used for 'make defconfig'
>>>a436bb7b8 Masahiro Yamada 2015-03-27 @539  include arch/$(SRCARCH)/Makef=
ile
>>>61bee2044 Al Viro         2008-08-25  540  export KBUILD_DEFCONFIG KBUIL=
D_KCONFIG
>>>^1da177e4 Linus Torvalds  2005-04-16  541
>>>31110ebbe Sam Ravnborg    2008-12-13  542  config: scripts_basic outputm=
akefile FORCE
>>>31110ebbe Sam Ravnborg    2008-12-13  543  	$(Q)$(MAKE) $(build)=3Dscrip=
ts/kconfig $@
>>>31110ebbe Sam Ravnborg    2008-12-13  544
>>>31110ebbe Sam Ravnborg    2008-12-13  545  %config: scripts_basic output=
makefile FORCE
>>>^1da177e4 Linus Torvalds  2005-04-16  546  	$(Q)$(MAKE) $(build)=3Dscrip=
ts/kconfig $@
>>>^1da177e4 Linus Torvalds  2005-04-16  547
>>>
>>>:::::: The code at line 539 was first introduced by commit
>>>:::::: a436bb7b806383ae0593cab53d17fc9676270cd3 kbuild: use relative pat=
h more to include Makefile
>>>
>>>:::::: TO: Masahiro Yamada <yamada.masahiro@socionext.com>
>>>:::::: CC: Michal Marek <mmarek@suse.cz>
>>>
>>>---
>>>0-DAY kernel test infrastructure                Open Source Technology C=
enter
>>>https://lists.01.org/pipermail/kbuild-all                   Intel Corpor=
ation
>>-- =

>>mvh
>>Hans-Christian Noren Egtvedt
> =


-- =

mvh
Hans-Christian Noren Egtvedt

--===============6171367222521374553==--

