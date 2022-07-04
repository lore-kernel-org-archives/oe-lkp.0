Content-Type: multipart/mixed; boundary="===============2735129416641620198=="
MIME-Version: 1.0
From: Vlad Dronov <vdronov@redhat.com>
To: lkp@lists.01.org
Subject: Re: include/crypto/chacha.h:100: undefined reference to `chacha_crypt_arch'
Date: Mon, 04 Jul 2022 17:09:32 +0200
Message-ID: <CAMusb+T03pF7U7-NQraHeWdu6QFjtZKHOiaq-x6e240p8s=D8A@mail.gmail.com>
In-Reply-To: <CAMusb+QDk4CutzAGg-ZVmndnDh9N9q=HK1-Se=r6ebxPpdLp2g@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2735129416641620198==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

It looks like the kernel test robot <lkp@intel.com> is able to create
an invalid config file for
a kernel test build process. Please, see the below thread as a research.

Or surely this research can be incorrect instead, in which case I apologize.

Best regards,
Vladis Dronov | Red Hat, Inc. | The Core Kernel | Senior Software Engineer

On Mon, Jul 4, 2022 at 4:58 PM Vlad Dronov <vdronov@redhat.com> wrote:
>
> Hi,
>
> On Mon, Jul 4, 2022 at 4:35 PM Vlad Dronov <vdronov@redhat.com> wrote:
> >
> > Hi,
> >
> > On Sun, Jul 3, 2022 at 12:51 AM kernel test robot <lkp@intel.com> wro=
te:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git master
> > > head:   69cb6c6556ad89620547318439d6be8bb1629a5a
> > > commit: 349d03ffd5f62c298fd667ffa397c3fdc5c6194b crypto: s390 - add c=
rypto library interface for ChaCha20
> > > date:   7 weeks ago
> > > config: s390-buildonly-randconfig-r005-20220703 (https://download.01.=
org/0day-ci/archive/20220703/202207030630.6SZVkrWf-lkp(a)intel.com/config)
> > > compiler: s390-linux-gcc (GCC) 11.3.0
> > > reproduce (this is a W=3D1 build):
> > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master=
/sbin/make.cross -O ~/bin/make.cross
> > >         chmod +x ~/bin/make.cross
> > >         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/li=
nux.git/commit/?id=3D349d03ffd5f62c298fd667ffa397c3fdc5c6194b
> > >         git remote add linus https://git.kernel.org/pub/scm/linux/ker=
nel/git/torvalds/linux.git
> > >         git fetch --no-tags linus master
> > >         git checkout 349d03ffd5f62c298fd667ffa397c3fdc5c6194b
> > >         # save the config file
> > >         mkdir build_dir && cp config build_dir/.config
> > >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.3.0 make=
.cross W=3D1 O=3Dbuild_dir ARCH=3Ds390 SHELL=3D/bin/bash
> > >
> > > If you fix the issue, kindly add following tag where applicable
> > > Reported-by: kernel test robot <lkp@intel.com>
> > >
> > > All errors (new ones prefixed by >>):
> > >
> > >    s390-linux-ld: lib/crypto/chacha20poly1305.o: in function `chacha_=
crypt':
> > > >> include/crypto/chacha.h:100: undefined reference to `chacha_crypt_=
arch'
> > > >> s390-linux-ld: include/crypto/chacha.h:100: undefined reference to=
 `chacha_crypt_arch'
> > >    s390-linux-ld: lib/crypto/chacha20poly1305.o: in function `chacha_=
init':
> > > >> include/crypto/chacha.h:86: undefined reference to `chacha_init_ar=
ch'
> > > >> s390-linux-ld: include/crypto/chacha.h:86: undefined reference to =
`chacha_init_arch'
> > >    s390-linux-ld: lib/crypto/chacha20poly1305.o: in function `hchacha=
_block':
> > > >> include/crypto/chacha.h:45: undefined reference to `hchacha_block_=
arch'
> > >    s390-linux-ld: lib/crypto/chacha20poly1305.o: in function `chacha_=
init':
> > > >> include/crypto/chacha.h:86: undefined reference to `chacha_init_ar=
ch'
> > >    s390-linux-ld: lib/crypto/chacha20poly1305.o: in function `chacha_=
crypt':
> > > >> include/crypto/chacha.h:100: undefined reference to `chacha_crypt_=
arch'
> > > >> s390-linux-ld: include/crypto/chacha.h:100: undefined reference to=
 `chacha_crypt_arch'
> > >    s390-linux-ld: lib/crypto/chacha20poly1305.o: in function `chacha_=
init':
> > > >> include/crypto/chacha.h:86: undefined reference to `chacha_init_ar=
ch'
> > > >> s390-linux-ld: include/crypto/chacha.h:86: undefined reference to =
`chacha_init_arch'
> > >    s390-linux-ld: lib/crypto/chacha20poly1305.o: in function `chacha_=
crypt':
> > > >> include/crypto/chacha.h:100: undefined reference to `chacha_crypt_=
arch'
> > > >> s390-linux-ld: include/crypto/chacha.h:100: undefined reference to=
 `chacha_crypt_arch'
> > > >> s390-linux-ld: include/crypto/chacha.h:100: undefined reference to=
 `chacha_crypt_arch'
> > >    s390-linux-ld: lib/crypto/chacha20poly1305-selftest.o: in function=
 `chacha_init':
> > > >> include/crypto/chacha.h:86: undefined reference to `chacha_init_ar=
ch'
> > >    s390-linux-ld: lib/crypto/chacha20poly1305-selftest.o: in function=
 `chacha_crypt':
> > > >> include/crypto/chacha.h:100: undefined reference to `chacha_crypt_=
arch'
> > > >> s390-linux-ld: include/crypto/chacha.h:100: undefined reference to=
 `chacha_crypt_arch'
> > >
> > > Kconfig warnings: (for reference only)
> > >    WARNING: unmet direct dependencies detected for CRYPTO_LIB_CHACHA2=
0POLY1305
> > >    Depends on (CRYPTO_ARCH_HAVE_LIB_CHACHA || !CRYPTO_ARCH_HAVE_LIB_C=
HACHA && (CRYPTO_ARCH_HAVE_LIB_POLY1305 || !CRYPTO_ARCH_HAVE_LIB_POLY1305 &=
& CRYPTO
> > >    Selected by
> > >    - WIREGUARD && NETDEVICES && NET_CORE && NET && INET && (IPV6 || !=
IPV6
> > >
> > >
> > > vim +100 include/crypto/chacha.h
> > >
> > > 5fb8ef25803ef3 Ard Biesheuvel    2019-11-08   41
> > > 5fb8ef25803ef3 Ard Biesheuvel    2019-11-08   42  static inline void =
hchacha_block(const u32 *state, u32 *out, int nrounds)
> > > 5fb8ef25803ef3 Ard Biesheuvel    2019-11-08   43  {
> > > 5fb8ef25803ef3 Ard Biesheuvel    2019-11-08   44        if (IS_ENABLE=
D(CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA))
> > > 5fb8ef25803ef3 Ard Biesheuvel    2019-11-08  @45                hchac=
ha_block_arch(state, out, nrounds);
> > > 5fb8ef25803ef3 Ard Biesheuvel    2019-11-08   46        else
> > > 5fb8ef25803ef3 Ard Biesheuvel    2019-11-08   47                hchac=
ha_block_generic(state, out, nrounds);
> > > 5fb8ef25803ef3 Ard Biesheuvel    2019-11-08   48  }
> > > 1ca1b917940c24 Eric Biggers      2018-11-16   49
> > > 96562f286884e2 Dominik Brodowski 2021-12-31   50  enum chacha_constan=
ts { /* expand 32-byte k */
> > > 96562f286884e2 Dominik Brodowski 2021-12-31   51        CHACHA_CONSTA=
NT_EXPA =3D 0x61707865U,
> > > 96562f286884e2 Dominik Brodowski 2021-12-31   52        CHACHA_CONSTA=
NT_ND_3 =3D 0x3320646eU,
> > > 96562f286884e2 Dominik Brodowski 2021-12-31   53        CHACHA_CONSTA=
NT_2_BY =3D 0x79622d32U,
> > > 96562f286884e2 Dominik Brodowski 2021-12-31   54        CHACHA_CONSTA=
NT_TE_K =3D 0x6b206574U
> > > 96562f286884e2 Dominik Brodowski 2021-12-31   55  };
> > > 96562f286884e2 Dominik Brodowski 2021-12-31   56
> > > a181e0fdb21642 Eric Biggers      2021-03-21   57  static inline void =
chacha_init_consts(u32 *state)
> > > 5fb8ef25803ef3 Ard Biesheuvel    2019-11-08   58  {
> > > 96562f286884e2 Dominik Brodowski 2021-12-31   59        state[0]  =3D=
 CHACHA_CONSTANT_EXPA;
> > > 96562f286884e2 Dominik Brodowski 2021-12-31   60        state[1]  =3D=
 CHACHA_CONSTANT_ND_3;
> > > 96562f286884e2 Dominik Brodowski 2021-12-31   61        state[2]  =3D=
 CHACHA_CONSTANT_2_BY;
> > > 96562f286884e2 Dominik Brodowski 2021-12-31   62        state[3]  =3D=
 CHACHA_CONSTANT_TE_K;
> > > a181e0fdb21642 Eric Biggers      2021-03-21   63  }
> > > a181e0fdb21642 Eric Biggers      2021-03-21   64
> > > a181e0fdb21642 Eric Biggers      2021-03-21   65  void chacha_init_ar=
ch(u32 *state, const u32 *key, const u8 *iv);
> > > a181e0fdb21642 Eric Biggers      2021-03-21   66  static inline void =
chacha_init_generic(u32 *state, const u32 *key, const u8 *iv)
> > > a181e0fdb21642 Eric Biggers      2021-03-21   67  {
> > > a181e0fdb21642 Eric Biggers      2021-03-21   68        chacha_init_c=
onsts(state);
> > > 5fb8ef25803ef3 Ard Biesheuvel    2019-11-08   69        state[4]  =3D=
 key[0];
> > > 5fb8ef25803ef3 Ard Biesheuvel    2019-11-08   70        state[5]  =3D=
 key[1];
> > > 5fb8ef25803ef3 Ard Biesheuvel    2019-11-08   71        state[6]  =3D=
 key[2];
> > > 5fb8ef25803ef3 Ard Biesheuvel    2019-11-08   72        state[7]  =3D=
 key[3];
> > > 5fb8ef25803ef3 Ard Biesheuvel    2019-11-08   73        state[8]  =3D=
 key[4];
> > > 5fb8ef25803ef3 Ard Biesheuvel    2019-11-08   74        state[9]  =3D=
 key[5];
> > > 5fb8ef25803ef3 Ard Biesheuvel    2019-11-08   75        state[10] =3D=
 key[6];
> > > 5fb8ef25803ef3 Ard Biesheuvel    2019-11-08   76        state[11] =3D=
 key[7];
> > > 5fb8ef25803ef3 Ard Biesheuvel    2019-11-08   77        state[12] =3D=
 get_unaligned_le32(iv +  0);
> > > 5fb8ef25803ef3 Ard Biesheuvel    2019-11-08   78        state[13] =3D=
 get_unaligned_le32(iv +  4);
> > > 5fb8ef25803ef3 Ard Biesheuvel    2019-11-08   79        state[14] =3D=
 get_unaligned_le32(iv +  8);
> > > 5fb8ef25803ef3 Ard Biesheuvel    2019-11-08   80        state[15] =3D=
 get_unaligned_le32(iv + 12);
> > > 5fb8ef25803ef3 Ard Biesheuvel    2019-11-08   81  }
> > > 1ca1b917940c24 Eric Biggers      2018-11-16   82
> > > 5fb8ef25803ef3 Ard Biesheuvel    2019-11-08   83  static inline void =
chacha_init(u32 *state, const u32 *key, const u8 *iv)
> > > 5fb8ef25803ef3 Ard Biesheuvel    2019-11-08   84  {
> > > 5fb8ef25803ef3 Ard Biesheuvel    2019-11-08   85        if (IS_ENABLE=
D(CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA))
> > > 5fb8ef25803ef3 Ard Biesheuvel    2019-11-08  @86                chach=
a_init_arch(state, key, iv);
> > > 5fb8ef25803ef3 Ard Biesheuvel    2019-11-08   87        else
> > > 5fb8ef25803ef3 Ard Biesheuvel    2019-11-08   88                chach=
a_init_generic(state, key, iv);
> > > 5fb8ef25803ef3 Ard Biesheuvel    2019-11-08   89  }
> > > 5fb8ef25803ef3 Ard Biesheuvel    2019-11-08   90
> > > 5fb8ef25803ef3 Ard Biesheuvel    2019-11-08   91  void chacha_crypt_a=
rch(u32 *state, u8 *dst, const u8 *src,
> > > 5fb8ef25803ef3 Ard Biesheuvel    2019-11-08   92                     =
  unsigned int bytes, int nrounds);
> > > 5fb8ef25803ef3 Ard Biesheuvel    2019-11-08   93  void chacha_crypt_g=
eneric(u32 *state, u8 *dst, const u8 *src,
> > > 5fb8ef25803ef3 Ard Biesheuvel    2019-11-08   94                     =
     unsigned int bytes, int nrounds);
> > > 5fb8ef25803ef3 Ard Biesheuvel    2019-11-08   95
> > > 5fb8ef25803ef3 Ard Biesheuvel    2019-11-08   96  static inline void =
chacha_crypt(u32 *state, u8 *dst, const u8 *src,
> > > 5fb8ef25803ef3 Ard Biesheuvel    2019-11-08   97                     =
           unsigned int bytes, int nrounds)
> > > 5fb8ef25803ef3 Ard Biesheuvel    2019-11-08   98  {
> > > 5fb8ef25803ef3 Ard Biesheuvel    2019-11-08   99        if (IS_ENABLE=
D(CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA))
> > > 5fb8ef25803ef3 Ard Biesheuvel    2019-11-08 @100                chach=
a_crypt_arch(state, dst, src, bytes, nrounds);
> > > 5fb8ef25803ef3 Ard Biesheuvel    2019-11-08  101        else
> > > 5fb8ef25803ef3 Ard Biesheuvel    2019-11-08  102                chach=
a_crypt_generic(state, dst, src, bytes, nrounds);
> > > 5fb8ef25803ef3 Ard Biesheuvel    2019-11-08  103  }
> > > 5fb8ef25803ef3 Ard Biesheuvel    2019-11-08  104
> > >
> > > :::::: The code at line 100 was first introduced by commit
> > > :::::: 5fb8ef25803ef33e2eb60b626435828b937bed75 crypto: chacha - move=
 existing library code into lib/crypto
> > >
> > > :::::: TO: Ard Biesheuvel <ardb@kernel.org>
> > > :::::: CC: Herbert Xu <herbert@gondor.apana.org.au>
> > >
> > > --
> > > 0-DAY CI Kernel Test Service
> > > https://01.org/lkp
> >
> > Ok, this is either weird or I do not understand how the Kconfig system =
works.
> >
> > What I look at is CRYPTO_LIB_CHACHA20POLY1305 definition:
> >
> > [ lib/crypto/Kconfig ]
> > config CRYPTO_LIB_CHACHA20POLY1305
> >     tristate "ChaCha20-Poly1305 AEAD support (8-byte nonce library vers=
ion)"
> >     depends on CRYPTO_ARCH_HAVE_LIB_CHACHA || !CRYPTO_ARCH_HAVE_LIB_CHA=
CHA
> >     depends on CRYPTO_ARCH_HAVE_LIB_POLY1305 || !CRYPTO_ARCH_HAVE_LIB_P=
OLY1305
> >     depends on CRYPTO
> >
> > and this test's random config (s390-buildonly-randconfig-r005-20220703):
> >
> > $ grep -e CRYPTO_LIB_CHACHA20POLY1305 -e CRYPTO_ARCH_HAVE_LIB_CHACHA
> > -e CRYPTO_ARCH_HAVE_LIB_POLY1305 -e CRYPTO=3D config
> > CONFIG_CRYPTO=3Dy
> > CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA=3Dm
> > CONFIG_CRYPTO_LIB_CHACHA20POLY1305=3Dy
> > // missing CRYPTO_ARCH_HAVE_LIB_POLY1305 implies =3Dn (I guess?)
> >
> > I'm following the canonical "Kconfig Language" doc (
> > https://www.kernel.org/doc/html/latest/kbuild/kconfig-language.html )
> > which states:
> >
> > > - dependencies: =E2=80=9Cdepends on=E2=80=9D <expr>
> > > This defines a dependency for this menu entry. If multiple dependenci=
es are defined, they are connected with =E2=80=98&&=E2=80=99.
> >
> > and
> >
> > >         '!' <expr>                           (6)
> > >         <expr> '&&' <expr>                   (7)
> > >         <expr> '||' <expr>                   (8)
> > >
> > > 6. Returns the result of (2-/expr/).
> > > 7. Returns the result of min(/expr/, /expr/).
> > > 8. Returns the result of max(/expr/, /expr/).
> > > An expression can have a value of =E2=80=98n=E2=80=99, =E2=80=98m=E2=
=80=99 or =E2=80=98y=E2=80=99 (or 0, 1, 2 respectively for calculations).
> >
> > So calculating:
> >
> > (CRYPTO_ARCH_HAVE_LIB_CHACHA || !CRYPTO_ARCH_HAVE_LIB_CHACHA) &&
> > (CRYPTO_ARCH_HAVE_LIB_POLY1305 || !CRYPTO_ARCH_HAVE_LIB_POLY1305) &&
> > CRYPTO
> >
> > I find it equal to:
> >
> > (m || !m) && (n || !n) && y  =3D>  m && y && y  =3D>  m
> >
> > So CRYPTO_LIB_CHACHA20POLY1305 should be no higher than M, but it is
> > =3DY in a config file =3D> weird :\ (or me wrong somewhere).
> >
> > WDYT?
> > Best regards,
> > Vladis Dronov | Red Hat, Inc. | The Core Kernel | Senior Software Engin=
eer
>
> Ok, I should have tested this beforehand. With the configs set as above:
>
> CONFIG_CRYPTO=3Dy
> CONFIG_CRYPTO_CHACHA20_X86_64=3Dm // implies the next line =3Dm
> CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA=3Dm
> CONFIG_CRYPTO_ARCH_HAVE_LIB_POLY1305 is not set // =3Dn
>
> "make menuconfig" allows only =3Dn and =3Dm for CRYPTO_LIB_CHACHA20POLY13=
05 indeed.
> So the test robot has fed an invalid config to a build process. Let me
> forward this thread to lkp(a)lists.01.org to report this issue.
>
> Best regards,
> Vladis Dronov | Red Hat, Inc. | The Core Kernel | Senior Software Engineer

--===============2735129416641620198==--

