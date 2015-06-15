Content-Type: multipart/mixed; boundary="===============1141767929104360036=="
MIME-Version: 1.0
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [drm/i915] 7f072451f2d: [drm:intel_cpu_fifo_underrun_irq_handler [i915]] *ERROR* CPU pipe B FIFO underrun
Date: Mon, 15 Jun 2015 11:01:57 +0200
Message-ID: <557E9485.8030905@linux.intel.com>
In-Reply-To: <557E77A1.8060607@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1141767929104360036==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hey,

Op 15-06-15 om 08:58 schreef Huang Ying:
> FYI, we noticed the below changes on
>
> git://anongit.freedesktop.org/drm-intel drm-intel-next-queued
> commit 7f072451f2d3d53e4f6939440e15ab36afed2051 ("drm/i915: Implement int=
el_crtc_control using atomic state, v4")
>
> Test Environment check: Succeeded.
> [0/2]  Running Test(s): 0
> [   87.315159] [drm:intel_cpu_fifo_underrun_irq_handler [i915]] *ERROR* C=
PU pipe B FIFO underrun
> [   87.323386] [drm:intel_pch_fifo_underrun_irq_handler [i915]] *ERROR* P=
CH transcoder B FIFO underrun
> [1/2] pass: 1 Running Test(s): 1
> [2/2] dmesg-warn: 1, pass: 1
> Thank you for running Piglit!
> Results have been written to /tmp/lkp/piglit-results-0/results.json
> igt/kms_flip/rcs-wf_vblank-vs-dpms.seconds: 129.532452335
> 2015-06-12 04:39:32 piglit summary console /tmp/lkp/piglit-results-0
> igt/kms_flip/rcs-wf_vblank-vs-dpms: pass
> igt/kms_flip/rcs-wf_vblank-vs-dpms-interruptible: dmesg-warn
> summary:
>        pass: 1
>        fail: 0
>       crash: 0
>        skip: 0
>     timeout: 0
>        warn: 0
>  dmesg-warn: 1
>  dmesg-fail: 0
>       total: 2
> all tests finished
>
>
> To reproduce:
>
> 	apt-get install ruby
> 	git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tests.git
> 	cd lkp-tests
> 	bin/setup-local job.yaml # the job file attached in this email
> 	bin/run-local   job.yaml
>
Are there any tests that already have FIFO underruns, before this commit?

~Maarten

--===============1141767929104360036==--

