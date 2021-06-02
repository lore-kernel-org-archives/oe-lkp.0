Content-Type: multipart/mixed; boundary="===============4381478229348579154=="
MIME-Version: 1.0
From: Marc Zyngier <maz@kernel.org>
To: lkp@lists.01.org
Subject: Re: [irqdomain] 2cb09c90a4: suspend-stress.fail
Date: Wed, 02 Jun 2021 08:55:10 +0100
Message-ID: <87eedk1z1d.wl-maz@kernel.org>
In-Reply-To: <20210602071230.GC9872@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============4381478229348579154==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Oliver,

On Wed, 02 Jun 2021 08:12:31 +0100,
kernel test robot <oliver.sang@intel.com> wrote:
> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 2cb09c90a4cde464dbfe78a57a9c128625c31122 ("irqdomain: Introduce i=
rq_resolve_mapping()")
> https://git.kernel.org/cgit/linux/kernel/git/maz/arm-platforms.git irq/ge=
neric_handle_irq_domain
> =

> =

> in testcase: suspend-stress
> version: =

> with following parameters:
> =

> 	mode: mem
> 	iterations: 10
> =

> =

> =

> on test machine: 4 threads Ivy Bridge with 4G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> test started
> <--- but cannot finish. in attached dmesg.log
> [   56.989808] SUSPEND RESUME TEST STARTED
> =

> [   56.994723] Suspend to mem 1/10:
> =

> [   57.393914] /usr/bin/wget -q --timeout=3D1800 --tries=3D1 --local-enco=
ding=3DUTF-8 http://internal-lkp-server:80/~lkp/cgi-bin/lkp-jobfile-append-=
var?job_file=3D/lkp/jobs/scheduled/lkp-ivb-toshiba1/suspend-stress-10-mem-d=
ebian-x86_64-20180403.cgz-2cb09c90a4cde464dbfe78a57a9c128625c31122-20210601=
-8940-10ohbtw-21.yaml&job_state=3Dsuspending-1/10 -O /dev/null
> =

> [   57.402918] Done
> =

> [   57.408029] Sleep for 10 seconds
> =

> [   57.413073] Suspend to mem 2/10:
> =

> [   57.417905] network not ready
> =

> [   57.422647] network not ready
> =

> [   57.427328] network not ready
> =

> [   57.431923] network not ready
> =

> [   57.436467] network not ready
> =

> [   57.440953] network not ready
> =

> [   57.445380] network not ready
> =

> [   57.449680] network not ready
> =

> [   57.453960] network not ready
> =

> [   58.066532] network not ready
> =

> [   59.069490] network not ready
> =

> [   60.072399] network not ready
> =

> [   61.075285] network not ready
> =

> [   62.078110] network not ready
> =

> [   62.899660] e1000e 0000:00:19.0 eth0: NIC Link is Up 100 Mbps Full Dup=
lex, Flow Control: None

Can you give a few more details about the failure mode? Did you expect
the network interface to show up earlier? How repeatable is this
issue? Does it show up on any other platform?

It may take me some time to find similar HW, so any help pinpointing
the issue is most welcome.

Thanks,

	M.

-- =

Without deviation from the norm, progress is not possible.
--===============4381478229348579154==--

