Content-Type: multipart/mixed; boundary="===============7298731568344385514=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [block] 52b85909f8: ndctl.test-libndctl.fail
Date: Wed, 20 Oct 2021 23:08:16 +0800
Message-ID: <20211020150816.GB22721@xsang-OptiPlex-9020>
In-Reply-To: <20210901113424.GA6637@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============7298731568344385514==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Christoph Hellwig,

On Wed, Sep 01, 2021 at 01:34:24PM +0200, Christoph Hellwig wrote:
> On Tue, Aug 31, 2021 at 10:50:36PM +0800, kernel test robot wrote:
> > =

> > =

> > Greeting,
> > =

> > FYI, we noticed the following commit (built with gcc-9):
> > =

> > commit: 52b85909f85d06efa69aaf4210e72467f1f58d2b ("block: fold register=
_disk into device_add_disk")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> Can someone help to decode the output?  I'm a little lost in debug output
> from libkmod but can't really find anything substancial that looks wrong.

sorry for late, we retested on this commit and its parent,
also we noticed a fix commit:
commit d55174cccac2e4c2a58ff68b6b573fc0836f73bd (nvdimm/libnvdimm-fixes)
Author: Christoph Hellwig <hch@lst.de>
Date:   Wed Sep 22 19:34:29 2021 +0200

    nvdimm/pmem: fix creating the dax group

    The recent block layer refactoring broke the way how the pmem driver
    abused device_add_disk.  Fix this by properly passing the attribute gro=
ups
    to device_add_disk.

    Fixes: 52b85909f85d ("block: fold register_disk into device_add_disk")


rerun on all these 3 commits, we now confirmed the ndctl.test-libndctl.fail
can be reproduced on all of them.

sorry for inconvenience.


--===============7298731568344385514==--

