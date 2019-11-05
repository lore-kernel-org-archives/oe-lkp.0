Content-Type: multipart/mixed; boundary="===============4251797609443343629=="
MIME-Version: 1.0
From: Bart Van Assche <bvanassche@acm.org>
To: lkp@lists.01.org
Subject: Re: [scsi] 74eb6c22dc: suspend_stress.fail
Date: Mon, 04 Nov 2019 19:52:59 -0800
Message-ID: <824c5a0b-a31a-b0a2-b14a-ab6edd294d07@acm.org>
In-Reply-To: <20191104085021.GF13369@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============4251797609443343629==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2019-11-04 00:50, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 74eb6c22dc70e395b333c9ca579855cd88db8845 ("[RFC PATCH V3 2/2] scs=
i: core: don't limit per-LUN queue depth for SSD")
> url: https://github.com/0day-ci/linux/commits/Ming-Lei/scsi-core-avoid-ho=
st-wide-host_busy-counter-for-scsi_mq/20191009-015827
> base: https://git.kernel.org/cgit/linux/kernel/git/jejb/scsi.git for-next
> =

> in testcase: suspend_stress
> with following parameters:
> =

> 	mode: freeze
> 	iterations: 10

Hi Ming,

This is the second report by the build robot that this patch causes the
suspend_stress test to fail. I assume that that means that that test
failure is not a coincidence. The previous report (Oct-22) is available
at https://lore.kernel.org/linux-scsi/20191023003027.GD12647(a)shao2-debian=
/.

Bart.
--===============4251797609443343629==--

