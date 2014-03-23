Content-Type: multipart/mixed; boundary="===============1244639051342594640=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [aio] e52ddd946a: xfstests generic/211 fail
Date: Sun, 23 Mar 2014 08:57:30 +0800
Message-ID: <20140323005730.GA14629@localhost>
In-Reply-To: <20140323005105.GB4173@kvack.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============1244639051342594640==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 22, 2014 at 08:51:05PM -0400, Benjamin LaHaise wrote:
> On Sun, Mar 23, 2014 at 08:40:09AM +0800, Fengguang Wu wrote:
> > Hi Benjamin,
> > =

> > We noticed xfstests fail and the first bad commit is
> =

> What is the failure?  This is awfully vague for a bug report.

In the email title: the generic/211 case of xfstests.

Here are the rough steps to reproduce the problem in KVM:

mkfs -t ext4 -q /dev/vda
mkfs -t ext4 -q /dev/vdd
mount -t ext4 /dev/vda /fs/vda
mount -t ext4 /dev/vdd /fs/vdd
export TEST_DIR=3D/fs/vda
export TEST_DEV=3D/dev/vda
export SCRATCH_DEV=3D/dev/vdd
export SCRATCH_MNT=3D/fs/scratch
mkdir /fs/scratch -p
./check generic/211

Thanks,
Fengguang

--===============1244639051342594640==--

