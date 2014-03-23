Content-Type: multipart/mixed; boundary="===============1423870393445384294=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [aio] e52ddd946a: xfstests generic/211 fail
Date: Sun, 23 Mar 2014 08:58:33 +0800
Message-ID: <20140323005833.GA14807@localhost>
In-Reply-To: <20140323005730.GA14629@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============1423870393445384294==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 23, 2014 at 08:57:30AM +0800, Fengguang Wu wrote:
> On Sat, Mar 22, 2014 at 08:51:05PM -0400, Benjamin LaHaise wrote:
> > On Sun, Mar 23, 2014 at 08:40:09AM +0800, Fengguang Wu wrote:
> > > Hi Benjamin,
> > > =

> > > We noticed xfstests fail and the first bad commit is
> > =

> > What is the failure?  This is awfully vague for a bug report.
> =

> In the email title: the generic/211 case of xfstests.
> =

> Here are the rough steps to reproduce the problem in KVM:
> =

> mkfs -t ext4 -q /dev/vda
> mkfs -t ext4 -q /dev/vdd
> mount -t ext4 /dev/vda /fs/vda
> mount -t ext4 /dev/vdd /fs/vdd
> export TEST_DIR=3D/fs/vda
> export TEST_DEV=3D/dev/vda
> export SCRATCH_DEV=3D/dev/vdd
> export SCRATCH_MNT=3D/fs/scratch
> mkdir /fs/scratch -p
> ./check generic/211

generic/211      [failed, exit status 1] - output mismatch (see /lkp/benchm=
arks/xfstests/results//generic/211.out.bad)
    --- tests/generic/211.out   2013-09-16 21:19:49.000000000 +0800
    +++ /lkp/benchmarks/xfstests/results//generic/211.out.bad   2014-03-23 =
02:55:53.390625000 +0800
    @@ -1,2 +1,2 @@
     QA output created by 211
    -aio-free-ring-with-bogus-nr-pages: Success!
    +aio-free-ring-with-bogus-nr-pages: Error: io_setup returned -11, expec=
ted -ENOMEM
     ...
     (Run 'diff -u tests/generic/211.out /lkp/benchmarks/xfstests/results//=
generic/211.out.bad' to see the entire diff)


--===============1423870393445384294==--

