Content-Type: multipart/mixed; boundary="===============7456285504631894553=="
MIME-Version: 1.0
From: Zhang Rui <rui.zhang@intel.com>
To: lkp@lists.01.org
Subject: Re: [irqdomain] 2cb09c90a4: suspend-stress.fail
Date: Wed, 02 Jun 2021 16:25:31 +0800
Message-ID: <9f9acc2f1bd9710b7a1a48bf0a179c34760a48bb.camel@intel.com>
In-Reply-To: <87eedk1z1d.wl-maz@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============7456285504631894553==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-06-02 at 08:55 +0100, Marc Zyngier wrote:
> Hi Oliver,
> =

> On Wed, 02 Jun 2021 08:12:31 +0100,
> kernel test robot <oliver.sang@intel.com> wrote:
> > =

> > Greeting,
> > =

> > FYI, we noticed the following commit (built with gcc-9):
> > =

> > commit: 2cb09c90a4cde464dbfe78a57a9c128625c31122 ("irqdomain:
> > Introduce irq_resolve_mapping()")
> > https://git.kernel.org/cgit/linux/kernel/git/maz/arm-platforms.git
> > irq/generic_handle_irq_domain
> > =

> > =

> > in testcase: suspend-stress
> > version: =

> > with following parameters:
> > =

> > 	mode: mem
> > 	iterations: 10
> > =

> > =

> > =

> > on test machine: 4 threads Ivy Bridge with 4G memory
> > =

> > caused below changes (please refer to attached dmesg/kmsg for
> > entire log/backtrace):
> > =

> > =

> > =

> > =

> > If you fix the issue, kindly add following tag
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> > =

> > test started
> > <--- but cannot finish. in attached dmesg.log
> > [   56.989808] SUSPEND RESUME TEST STARTED
> > =

> > [   56.994723] Suspend to mem 1/10:
> > =

> > [   57.393914] /usr/bin/wget -q --timeout=3D1800 --tries=3D1 --local-
> > encoding=3DUTF-8 =

> > http://internal-lkp-server:80/~lkp/cgi-bin/lkp-jobfile-append-var?job_f=
ile=3D/lkp/jobs/scheduled/lkp-ivb-toshiba1/suspend-stress-10-mem-debian-x86=
_64-20180403.cgz-2cb09c90a4cde464dbfe78a57a9c128625c31122-20210601-8940-10o=
hbtw-21.yaml&job_state=3Dsuspending-1/10
> >  -O /dev/null
> > =

> > [   57.402918] Done
> > =

> > [   57.408029] Sleep for 10 seconds
> > =

> > [   57.413073] Suspend to mem 2/10:
> > =

> > [   57.417905] network not ready
> > =

> > [   57.422647] network not ready
> > =

> > [   57.427328] network not ready
> > =

> > [   57.431923] network not ready
> > =

> > [   57.436467] network not ready
> > =

> > [   57.440953] network not ready
> > =

> > [   57.445380] network not ready
> > =

> > [   57.449680] network not ready
> > =

> > [   57.453960] network not ready
> > =

> > [   58.066532] network not ready
> > =

> > [   59.069490] network not ready
> > =

> > [   60.072399] network not ready
> > =

> > [   61.075285] network not ready
> > =

> > [   62.078110] network not ready
> > =

> > [   62.899660] e1000e 0000:00:19.0 eth0: NIC Link is Up 100 Mbps
> > Full Duplex, Flow Control: None
> =

> Can you give a few more details about the failure mode? Did you
> expect
> the network interface to show up earlier?

TBH, we don't know if this is caused by the network failure or not.
It is a remote machine that I need to take some time to verify this.

>  How repeatable is this
> issue?

It seems to be intermittent but relatively easy to reproduce.
Here is what I did.
1. run 10 suspend iterations after boot
2. reboot and repeat step 1 by 10 times.

The test is done on three different machines, an old Ivybridge laptop,
a skylake laptop and a kabylake laptop.

without the commit, all three machines are still running well after 10
10 suspend iterations, in 10 different fresh boot.
with the commit, when doing 10 back-to-back suspend, the three machines
are alive only 1 or even 0 time, out of 10 reboot cycles.

So I think this is kind of a generic problem that may affect many
machines. You can pick some laptop and do 10 suspend iteration and
check if the system is still alive, if yes, do a reboot and check if it
still can pass the 10 suspend test.

thanks,
rui

>  Does it show up on any other platform?
> =

> It may take me some time to find similar HW, so any help pinpointing
> the issue is most welcome.
> =

> Thanks,
> =

> 	M.
>=20

--===============7456285504631894553==--

