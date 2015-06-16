Content-Type: multipart/mixed; boundary="===============1623230906935030828=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [drm/i915] 7f072451f2d: [drm:intel_cpu_fifo_underrun_irq_handler [i915]] *ERROR* CPU pipe B FIFO underrun
Date: Tue, 16 Jun 2015 08:54:35 +0800
Message-ID: <1434416075.18774.182.camel@intel.com>
In-Reply-To: <557E9485.8030905@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1623230906935030828==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 2015-06-15 at 11:01 +0200, Maarten Lankhorst wrote:
> Hey,
> =

> Op 15-06-15 om 08:58 schreef Huang Ying:
> > FYI, we noticed the below changes on
> >
> > git://anongit.freedesktop.org/drm-intel drm-intel-next-queued
> > commit 7f072451f2d3d53e4f6939440e15ab36afed2051 ("drm/i915: Implement i=
ntel_crtc_control using atomic state, v4")
> >
> > Test Environment check: Succeeded.
> > [0/2]  Running Test(s): 0
> > [   87.315159] [drm:intel_cpu_fifo_underrun_irq_handler [i915]] *ERROR*=
 CPU pipe B FIFO underrun
> > [   87.323386] [drm:intel_pch_fifo_underrun_irq_handler [i915]] *ERROR*=
 PCH transcoder B FIFO underrun
> > [1/2] pass: 1 Running Test(s): 1
> > [2/2] dmesg-warn: 1, pass: 1
> > Thank you for running Piglit!
> > Results have been written to /tmp/lkp/piglit-results-0/results.json
> > igt/kms_flip/rcs-wf_vblank-vs-dpms.seconds: 129.532452335
> > 2015-06-12 04:39:32 piglit summary console /tmp/lkp/piglit-results-0
> > igt/kms_flip/rcs-wf_vblank-vs-dpms: pass
> > igt/kms_flip/rcs-wf_vblank-vs-dpms-interruptible: dmesg-warn
> > summary:
> >        pass: 1
> >        fail: 0
> >       crash: 0
> >        skip: 0
> >     timeout: 0
> >        warn: 0
> >  dmesg-warn: 1
> >  dmesg-fail: 0
> >       total: 2
> > all tests finished
> >
> >
> > To reproduce:
> >
> > 	apt-get install ruby
> > 	git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tests.=
git
> > 	cd lkp-tests
> > 	bin/setup-local job.yaml # the job file attached in this email
> > 	bin/run-local   job.yaml
> >
> Are there any tests that already have FIFO underruns, before this commit?

This test is the first test run on the machine, the command line for
test is as follow:

$ piglit run igt -t igt/kms_flip/rcs-wf_vblank-vs-dpms /tmp/lkp/piglit-resu=
lts-0

But the test system may be via kexec.

Best Regards,
Huang, Ying



--===============1623230906935030828==--

