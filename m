Content-Type: multipart/mixed; boundary="===============2867636612819451436=="
MIME-Version: 1.0
From: Al Viro <viro@ZenIV.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [parallel lookups machinery, part 2] 96352435af: kernel BUG at mm/slab.c:2599!
Date: Mon, 18 Apr 2016 02:55:21 +0100
Message-ID: <20160418015521.GZ25498@ZenIV.linux.org.uk>
In-Reply-To: <87k2jvg1yc.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2867636612819451436==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 18, 2016 at 09:06:35AM +0800, kernel test robot wrote:
> FYI, we noticed the below changes on
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git testing.look=
ups
> commit 96352435afd792d713ec91e2d5693bdcf40a6b03 ("parallel lookups machin=
ery, part 2")

Very odd.  All stores in that commit are to ->d_parent->d_inode->i_dir_seq
of in-lookup dentries.  And if ->d_parent in those gets buggered, we were
really deep in trouble.  Could you try to reproduce that without __d_move()
or __d_add() parts and see which one ends up triggering that crap?

Note that we don't *use* ->i_dir_seq yet...

--===============2867636612819451436==--

