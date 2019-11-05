Content-Type: multipart/mixed; boundary="===============7848171787621321386=="
MIME-Version: 1.0
From: Ming Lei <ming.lei@redhat.com>
To: lkp@lists.01.org
Subject: Re: [scsi] 74eb6c22dc: suspend_stress.fail
Date: Tue, 05 Nov 2019 14:11:50 +0800
Message-ID: <20191105061150.GA17084@ming.t460p>
In-Reply-To: <824c5a0b-a31a-b0a2-b14a-ab6edd294d07@acm.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============7848171787621321386==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 04, 2019 at 07:52:59PM -0800, Bart Van Assche wrote:
> On 2019-11-04 00:50, kernel test robot wrote:
> > FYI, we noticed the following commit (built with gcc-7):
> > =

> > commit: 74eb6c22dc70e395b333c9ca579855cd88db8845 ("[RFC PATCH V3 2/2] s=
csi: core: don't limit per-LUN queue depth for SSD")
> > url: https://github.com/0day-ci/linux/commits/Ming-Lei/scsi-core-avoid-=
host-wide-host_busy-counter-for-scsi_mq/20191009-015827
> > base: https://git.kernel.org/cgit/linux/kernel/git/jejb/scsi.git for-ne=
xt
> > =

> > in testcase: suspend_stress
> > with following parameters:
> > =

> > 	mode: freeze
> > 	iterations: 10
> =

> Hi Ming,
> =

> This is the second report by the build robot that this patch causes the
> suspend_stress test to fail. I assume that that means that that test
> failure is not a coincidence. The previous report (Oct-22) is available
> at https://lore.kernel.org/linux-scsi/20191023003027.GD12647(a)shao2-debi=
an/.

Yeah, it should be one real issue, and there are other issues too. I will w=
ork
out a new version for addressing all.

Thanks,
Ming

--===============7848171787621321386==--

