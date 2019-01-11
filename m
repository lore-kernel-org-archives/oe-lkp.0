Content-Type: multipart/mixed; boundary="===============2487819100612177320=="
MIME-Version: 1.0
From: kernel test robot <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [btrfs] 05a37c4860: kmsg.BTRFS_error(device_vdd):failed_to_verify_dev_extents_against_chunks
Date: Fri, 11 Jan 2019 23:45:45 +0800
Message-ID: <20190111154545.GN17624@shao2-debian>
In-Reply-To: <819023c9-a7f1-44be-6e8d-5525eb6b0fc9@suse.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============2487819100612177320==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 11, 2019 at 10:39:45PM +0800, Qu Wenruo wrote:
> =

> =

> On 2019/1/11 =E4=B8=8B=E5=8D=8810:03, kernel test robot wrote:
> > FYI, we noticed the following commit (built with gcc-7):
> > =

> > commit: 05a37c48604c19b50873fd9663f9140c150469d1 ("btrfs: volumes: Make=
 sure no dev extent is beyond device boundary")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> > =

> > in testcase: xfstests
> > with following parameters:
> > =

> > 	disk: 6HDD
> > 	fs: btrfs
> > 	test: btrfs-group1
> > =

> > test-description: xfstests is a regression test suite for xfs and other=
 files ystems.
> > test-url: git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git
> > =

> > =

> > on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2=
 -m 4G
> > =

> > caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):
> =

> For the LKP tests, would you please not bind all fstests test cases into
> one LKP test case?
> =

> That's pretty hard for us to locate the problem. not to mention there
> will be tons of generic tests, and new tests could easily screw up your
> existing result.
> =

> It will make more sense to generate test cases based on
> fstests/tests/btrfs/group, and save their result for each fstests test ca=
se.
> =


Thanks for your suggestion, we'll adapt the test cases.

Best Regards,
Rong Chen

--===============2487819100612177320==--

