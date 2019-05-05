Content-Type: multipart/mixed; boundary="===============3642540225036963050=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: lkp@lists.01.org
Subject: Re: [PATCH] fsnotify: fix unlink performance regression
Date: Mon, 06 May 2019 00:33:43 +0800
Message-ID: <201905060021.I3fgRl4C%lkp@intel.com>
In-Reply-To: <20190505091549.1934-1-amir73il@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3642540225036963050==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Amir,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v5.1-rc7 next-20190503]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp improve the system]

url:    https://github.com/0day-ci/linux/commits/Amir-Goldstein/fsnotify-fi=
x-unlink-performance-regression/20190505-233115
config: riscv-tinyconfig (attached as .config)
compiler: riscv64-linux-gcc (GCC) 8.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=3D8.1.0 make.cross ARCH=3Driscv =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from fs///attr.c:15:
   include/linux/fsnotify.h: In function 'fsnotify_nameremove':
>> include/linux/fsnotify.h:179:23: error: 'struct inode' has no member nam=
ed 'i_fsnotify_mask'
     if (!(d_inode(parent)->i_fsnotify_mask & FS_DELETE) &&
                          ^~
>> include/linux/fsnotify.h:180:20: error: 'struct super_block' has no memb=
er named 's_fsnotify_mask'
         !(dentry->d_sb->s_fsnotify_mask & FS_DELETE))
                       ^~

vim +179 include/linux/fsnotify.h

   153	=

   154	/*
   155	 * fsnotify_nameremove - a filename was removed from a directory
   156	 *
   157	 * This is mostly called under parent vfs inode lock so name and
   158	 * dentry->d_parent should be stable. However there are some corner =
cases where
   159	 * inode lock is not held. So to be on the safe side and be reselien=
t to future
   160	 * callers and out of tree users of d_delete(), we do not assume tha=
t d_parent
   161	 * and d_name are stable and we use dget_parent() and
   162	 * take_dentry_name_snapshot() to grab stable references.
   163	 */
   164	static inline void fsnotify_nameremove(struct dentry *dentry, int is=
dir)
   165	{
   166		struct dentry *parent;
   167		struct name_snapshot name;
   168		__u32 mask =3D FS_DELETE;
   169	=

   170		/* d_delete() of pseudo inode? (e.g. __ns_get_path() playing tricks=
) */
   171		if (IS_ROOT(dentry))
   172			return;
   173	=

   174		if (isdir)
   175			mask |=3D FS_ISDIR;
   176	=

   177		parent =3D dget_parent(dentry);
   178		/* Avoid unneeded take_dentry_name_snapshot() */
 > 179		if (!(d_inode(parent)->i_fsnotify_mask & FS_DELETE) &&
 > 180		    !(dentry->d_sb->s_fsnotify_mask & FS_DELETE))
   181			goto out_dput;
   182	=

   183		take_dentry_name_snapshot(&name, dentry);
   184	=

   185		fsnotify(d_inode(parent), mask, d_inode(dentry), FSNOTIFY_EVENT_INO=
DE,
   186			 name.name, 0);
   187	=

   188		release_dentry_name_snapshot(&name);
   189	=

   190	out_dput:
   191		dput(parent);
   192	}
   193	=


---
0-DAY kernel test infrastructure                Open Source Technology Cent=
er
https://lists.01.org/pipermail/kbuild-all                   Intel Corporati=
on

--===============3642540225036963050==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
2OSOzTsAAA==
--===============3642540225036963050==--

