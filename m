Content-Type: multipart/mixed; boundary="===============2548854314955145825=="
MIME-Version: 1.0
From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: submitting corrected patch
Date: Fri, 15 Jul 2022 17:09:20 -0500
Message-ID: <2953bca5213bff727a2c76a6d28b947628d94e2f.camel@linux.vnet.ibm.com>
In-Reply-To: <202207081010.mn8e8rca-lkp@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2548854314955145825==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

Can I just send an amended patch to this email? I believe that it just
needed a dependency for a config option.

-Greg

On Fri, 2022-07-08 at 10:35 +0800, kernel test robot wrote:
> Hi,
> =

> Thank you for the patch! Yet something to improve:
> =

> [auto build test ERROR on axboe-block/for-next]
> [also build test ERROR on linus/master v5.19-rc5 next-20220707]
> [If your patch is applied to the wrong git tree, kindly drop us a
> note.
> And when submitting patch, we suggest to use '--base' as documented
> in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> =

> url:    =

> https://github.com/intel-lab-lkp/linux/commits/gjoyce-linux-vnet-ibm-com/=
sed-opal-keyrings-discovery-revert-and-key-store/20220706-104204
> base:   =

> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git
>  for-next
> config: arm-randconfig-r036-20220706 (
> https://download.01.org/0day-ci/archive/20220708/202207081010.mn8e8rca-lk=
p(a)intel.com/config
> )
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project
> f553287b588916de09c66e3e32bf75e5060f967f)
> reproduce (this is a W=3D1 build):
>         wget =

> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross
>  -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         # =

> https://github.com/intel-lab-lkp/linux/commit/b984dda112cdbda6b41045bf63f=
790a3c2903c7a
>         git remote add linux-review =

> https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review gjoyce-linux-vnet-ibm-
> com/sed-opal-keyrings-discovery-revert-and-key-store/20220706-104204
>         git checkout b984dda112cdbda6b41045bf63f790a3c2903c7a
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross
> W=3D1 O=3Dbuild_dir ARCH=3Darm SHELL=3D/bin/bash
> =

> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All error/warnings (new ones prefixed by >>):
> =

> > > block/sed-opal.c:286:8: error: call to undeclared function
> > > 'key_alloc'; ISO C99 and later do not support implicit function
> > > declarations [-Wimplicit-function-declaration]
>            key =3D key_alloc(&key_type_user, desc, GLOBAL_ROOT_UID,
> GLOBAL_ROOT_GID,
>                  ^
> > > block/sed-opal.c:286:19: error: use of undeclared identifier
> > > 'key_type_user'
>            key =3D key_alloc(&key_type_user, desc, GLOBAL_ROOT_UID,
> GLOBAL_ROOT_GID,
>                             ^
> > > block/sed-opal.c:288:5: error: use of undeclared identifier
> > > 'KEY_USR_VIEW'
>                                    KEY_USR_VIEW | KEY_USR_SEARCH |
> KEY_USR_WRITE,
>                                    ^
> > > block/sed-opal.c:288:20: error: use of undeclared identifier
> > > 'KEY_USR_SEARCH'
>                                    KEY_USR_VIEW | KEY_USR_SEARCH |
> KEY_USR_WRITE,
>                                                   ^
> > > block/sed-opal.c:288:37: error: use of undeclared identifier
> > > 'KEY_USR_WRITE'
>                                    KEY_USR_VIEW | KEY_USR_SEARCH |
> KEY_USR_WRITE,
>                                                                    ^
> > > block/sed-opal.c:294:8: error: call to undeclared function
> > > 'key_instantiate_and_link'; ISO C99 and later do not support
> > > implicit function declarations [-Wimplicit-function-declaration]
>            ret =3D key_instantiate_and_link(key, key_data, keylen,
>                  ^
>    block/sed-opal.c:294:8: note: did you mean 'd_instantiate_anon'?
>    include/linux/dcache.h:223:24: note: 'd_instantiate_anon' declared
> here
>    extern struct dentry * d_instantiate_anon(struct dentry *, struct
> inode *);
>                           ^
>    block/sed-opal.c:307:2: error: unknown type name 'key_ref_t'; did
> you mean 'key_perm_t'?
>            key_ref_t kref;
>            ^~~~~~~~~
>            key_perm_t
>    include/linux/key.h:31:18: note: 'key_perm_t' declared here
>    typedef uint32_t key_perm_t;
>                     ^
> > > block/sed-opal.c:313:9: error: call to undeclared function
> > > 'keyring_search'; ISO C99 and later do not support implicit
> > > function declarations [-Wimplicit-function-declaration]
>            kref =3D keyring_search(make_key_ref(sed_opal_keyring,
> true),
>                   ^
>    block/sed-opal.c:314:4: error: use of undeclared identifier
> 'key_type_user'
>                    &key_type_user,
>                     ^
> > > block/sed-opal.c:318:13: warning: incompatible integer to pointer
> > > conversion passing 'key_perm_t' (aka 'unsigned int') to parameter
> > > of type 'const void *' [-Wint-conversion]
>            if (IS_ERR(kref)) {
>                       ^~~~
>    include/linux/err.h:34:60: note: passing argument to parameter
> 'ptr' here
>    static inline bool __must_check IS_ERR(__force const void *ptr)
>                                                               ^
>    block/sed-opal.c:319:17: warning: incompatible integer to pointer
> conversion passing 'key_perm_t' (aka 'unsigned int') to parameter of
> type 'const void *' [-Wint-conversion]
>                    ret =3D PTR_ERR(kref);
>                                  ^~~~
>    include/linux/err.h:29:61: note: passing argument to parameter
> 'ptr' here
>    static inline long __must_check PTR_ERR(__force const void *ptr)
>                                                                ^
> > > block/sed-opal.c:322:17: error: incomplete definition of type
> > > 'struct key'
>                    down_read(&key->sem);
>                               ~~~^
>    include/linux/key.h:33:8: note: forward declaration of 'struct
> key'
>    struct key;
>           ^
>    block/sed-opal.c:325:20: error: incomplete definition of type
> 'struct key'
>                            if (buflen > key->datalen)
>                                         ~~~^
>    include/linux/key.h:33:8: note: forward declaration of 'struct
> key'
>    struct key;
>           ^
>    block/sed-opal.c:326:17: error: incomplete definition of type
> 'struct key'
>                                    buflen =3D key->datalen;
>                                             ~~~^
>    include/linux/key.h:33:8: note: forward declaration of 'struct
> key'
>    struct key;
>           ^
>    block/sed-opal.c:328:13: error: incomplete definition of type
> 'struct key'
>                            ret =3D key->type->read(key, (char *)buffer,
> buflen);
>                                  ~~~^
>    include/linux/key.h:33:8: note: forward declaration of 'struct
> key'
>    struct key;
>           ^
>    block/sed-opal.c:330:15: error: incomplete definition of type
> 'struct key'
>                    up_read(&key->sem);
>                             ~~~^
>    include/linux/key.h:33:8: note: forward declaration of 'struct
> key'
>    struct key;
>           ^
> > > block/sed-opal.c:2938:7: error: call to undeclared function
> > > 'keyring_alloc'; ISO C99 and later do not support implicit
> > > function declarations [-Wimplicit-function-declaration]
>            kr =3D keyring_alloc(".sed_opal",
>                 ^
> > > block/sed-opal.c:2940:4: error: use of undeclared identifier
> > > 'KEY_POS_ALL'
>                    (KEY_POS_ALL & ~KEY_POS_SETATTR) | KEY_USR_VIEW |
>                     ^
> > > block/sed-opal.c:2940:19: error: use of undeclared identifier
> > > 'KEY_POS_SETATTR'
>                    (KEY_POS_ALL & ~KEY_POS_SETATTR) | KEY_USR_VIEW |
>                                    ^
>    block/sed-opal.c:2940:38: error: use of undeclared identifier
> 'KEY_USR_VIEW'
>                    (KEY_POS_ALL & ~KEY_POS_SETATTR) | KEY_USR_VIEW |
>                                                       ^
> > > block/sed-opal.c:2941:3: error: use of undeclared identifier
> > > 'KEY_USR_READ'
>                    KEY_USR_READ | KEY_USR_SEARCH | KEY_USR_WRITE,
>                    ^
>    fatal error: too many errors emitted, stopping now [-ferror-
> limit=3D]
>    2 warnings and 20 errors generated.
> =

> =

> vim +/key_alloc +286 block/sed-opal.c
> =

> 455a7b238cd6bc6 Scott Bauer 2017-02-03  274  =

> 8a2b115580e8f7c Greg Joyce  2022-07-05  275  /*
> 8a2b115580e8f7c Greg Joyce  2022-07-05  276   * Allocate/update a SED
> Opal key and add it to the SED Opal keyring.
> 8a2b115580e8f7c Greg Joyce  2022-07-05  277   */
> 8a2b115580e8f7c Greg Joyce  2022-07-05  278  static int
> update_sed_opal_key(const char *desc, u_char *key_data, int keylen)
> 8a2b115580e8f7c Greg Joyce  2022-07-05  279  {
> 8a2b115580e8f7c Greg Joyce  2022-07-05  280  	int ret;
> 8a2b115580e8f7c Greg Joyce  2022-07-05  281  	struct key *key;
> 8a2b115580e8f7c Greg Joyce  2022-07-05  282  =

> 8a2b115580e8f7c Greg Joyce  2022-07-05  283  	if (!sed_opal_keyring)
> 8a2b115580e8f7c Greg Joyce  2022-07-05  284  		return -ENOKEY;
> 8a2b115580e8f7c Greg Joyce  2022-07-05  285  =

> 8a2b115580e8f7c Greg Joyce  2022-07-05 @286  	key =3D
> key_alloc(&key_type_user, desc, GLOBAL_ROOT_UID, GLOBAL_ROOT_GID,
> 8a2b115580e8f7c Greg Joyce  2022-07-05  287  				=

> current_cred(),
> 8a2b115580e8f7c Greg Joyce  2022-07-05 @288  				=

> KEY_USR_VIEW | KEY_USR_SEARCH | KEY_USR_WRITE,
> 8a2b115580e8f7c Greg Joyce  2022-07-05  289  				=

> 0,
> 8a2b115580e8f7c Greg Joyce  2022-07-05  290  				=

> NULL);
> 8a2b115580e8f7c Greg Joyce  2022-07-05  291  	if (IS_ERR(key))
> 8a2b115580e8f7c Greg Joyce  2022-07-05  292  		return
> PTR_ERR(key);
> 8a2b115580e8f7c Greg Joyce  2022-07-05  293  =

> 8a2b115580e8f7c Greg Joyce  2022-07-05 @294  	ret =3D
> key_instantiate_and_link(key, key_data, keylen,
> 8a2b115580e8f7c Greg Joyce  2022-07-05  295  			sed_opa
> l_keyring, NULL);
> 8a2b115580e8f7c Greg Joyce  2022-07-05  296  	key_put(key);
> 8a2b115580e8f7c Greg Joyce  2022-07-05  297  =

> 8a2b115580e8f7c Greg Joyce  2022-07-05  298  	return ret;
> 8a2b115580e8f7c Greg Joyce  2022-07-05  299  }
> 8a2b115580e8f7c Greg Joyce  2022-07-05  300  =

> 8a2b115580e8f7c Greg Joyce  2022-07-05  301  /*
> 8a2b115580e8f7c Greg Joyce  2022-07-05  302   * Read a SED Opal key
> from the SED Opal keyring.
> 8a2b115580e8f7c Greg Joyce  2022-07-05  303   */
> 8a2b115580e8f7c Greg Joyce  2022-07-05  304  static int
> read_sed_opal_key(const char *key_name, u_char *buffer, int buflen)
> 8a2b115580e8f7c Greg Joyce  2022-07-05  305  {
> 8a2b115580e8f7c Greg Joyce  2022-07-05  306  	int ret;
> 8a2b115580e8f7c Greg Joyce  2022-07-05  307  	key_ref_t kref;
> 8a2b115580e8f7c Greg Joyce  2022-07-05  308  	struct key *key;
> 8a2b115580e8f7c Greg Joyce  2022-07-05  309  =

> 8a2b115580e8f7c Greg Joyce  2022-07-05  310  	if (!sed_opal_keyring)
> 8a2b115580e8f7c Greg Joyce  2022-07-05  311  		return -ENOKEY;
> 8a2b115580e8f7c Greg Joyce  2022-07-05  312  =

> 8a2b115580e8f7c Greg Joyce  2022-07-05 @313  	kref =3D
> keyring_search(make_key_ref(sed_opal_keyring, true),
> 8a2b115580e8f7c Greg Joyce  2022-07-05  314  		&key_type_user,
> 8a2b115580e8f7c Greg Joyce  2022-07-05  315  		key_name,
> 8a2b115580e8f7c Greg Joyce  2022-07-05  316  		true);
> 8a2b115580e8f7c Greg Joyce  2022-07-05  317  =

> 8a2b115580e8f7c Greg Joyce  2022-07-05 @318  	if (IS_ERR(kref)) {
> 8a2b115580e8f7c Greg Joyce  2022-07-05  319  		ret =3D
> PTR_ERR(kref);
> 8a2b115580e8f7c Greg Joyce  2022-07-05  320  	} else {
> 8a2b115580e8f7c Greg Joyce  2022-07-05  321  		key =3D
> key_ref_to_ptr(kref);
> 8a2b115580e8f7c Greg Joyce  2022-07-05 @322  		down_read(&key-
> > sem);
> 8a2b115580e8f7c Greg Joyce  2022-07-05  323  		ret =3D
> key_validate(key);
> 8a2b115580e8f7c Greg Joyce  2022-07-05  324  		if (ret =3D=3D 0) {
> 8a2b115580e8f7c Greg Joyce  2022-07-05  325  			if
> (buflen > key->datalen)
> 8a2b115580e8f7c Greg Joyce  2022-07-05  326  				=

> buflen =3D key->datalen;
> 8a2b115580e8f7c Greg Joyce  2022-07-05  327  =

> 8a2b115580e8f7c Greg Joyce  2022-07-05  328  			ret =3D
> key->type->read(key, (char *)buffer, buflen);
> 8a2b115580e8f7c Greg Joyce  2022-07-05  329  		}
> 8a2b115580e8f7c Greg Joyce  2022-07-05  330  		up_read(&key-
> > sem);
> 8a2b115580e8f7c Greg Joyce  2022-07-05  331  =

> 8a2b115580e8f7c Greg Joyce  2022-07-05  332  		key_ref_put(kre
> f);
> 8a2b115580e8f7c Greg Joyce  2022-07-05  333  	}
> 8a2b115580e8f7c Greg Joyce  2022-07-05  334  =

> 8a2b115580e8f7c Greg Joyce  2022-07-05  335  	return ret;
> 8a2b115580e8f7c Greg Joyce  2022-07-05  336  }
> 8a2b115580e8f7c Greg Joyce  2022-07-05  337  =

>=20

--===============2548854314955145825==--

