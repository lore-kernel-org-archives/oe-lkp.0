Content-Type: multipart/mixed; boundary="===============0023511470961243993=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [parallel lookups machinery, part 2] 96352435af: kernel BUG at mm/slab.c:2599!
Date: Mon, 18 Apr 2016 10:08:37 +0800
Message-ID: <87mvorvfbu.fsf@yhuang-dev.intel.com>
In-Reply-To: <20160418015521.GZ25498@ZenIV.linux.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============0023511470961243993==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Al Viro <viro@ZenIV.linux.org.uk> writes:

> On Mon, Apr 18, 2016 at 09:06:35AM +0800, kernel test robot wrote:
>> FYI, we noticed the below changes on
>> =

>> https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git testing.loo=
kups
>> commit 96352435afd792d713ec91e2d5693bdcf40a6b03 ("parallel lookups machi=
nery, part 2")
>
> Very odd.  All stores in that commit are to ->d_parent->d_inode->i_dir_seq
> of in-lookup dentries.  And if ->d_parent in those gets buggered, we were
> really deep in trouble.  Could you try to reproduce that without __d_move=
()
> or __d_add() parts and see which one ends up triggering that crap?

Could you provide a debug branch in your tree for that?

Best Regards,
Huang, Ying

> Note that we don't *use* ->i_dir_seq yet...
> _______________________________________________
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp

--===============0023511470961243993==--

