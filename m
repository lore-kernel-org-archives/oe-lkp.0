Content-Type: multipart/mixed; boundary="===============4824448418009662295=="
MIME-Version: 1.0
From: Mel Gorman <mgorman@techsingularity.net>
To: lkp@lists.01.org
Subject: Re: [mm, page_alloc] e6cbd7f2ef: pixz.throughput -5.1% regression
Date: Tue, 30 Aug 2016 11:06:33 +0100
Message-ID: <20160830100633.GU8119@techsingularity.net>
In-Reply-To: <05540bdb-5b31-c75f-887f-64f60ce2580e@leemhuis.info>
List-Id: <oe-lkp.lists.linux.dev>

--===============4824448418009662295==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 28, 2016 at 11:51:20AM +0200, Thorsten Leemhuis wrote:
> Lo! On 08.08.2016 10:29, kernel test robot wrote:
> > =

> > FYI, we noticed a -5.1% regression of pixz.throughput due to commit:
> > =

> > commit e6cbd7f2efb433d717af72aa8510a9db6f7a7e05 ("mm, page_alloc: remov=
e fair zone allocation policy")
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git mast=
er
> > =

> > in testcase: pixz
> > on test machine: 48 threads Ivytown Ivy Bridge-EP with 64G memory
> > with following parameters:
> > =

> > 	nr_threads: 100%
> > 	cpufreq_governor: performance
> =

> Mel, this report made it to the regression list for 4.8, but it seems
> nothing happened after the initial report. Was it discussed (and maybe
> even fixed?) elsewhere? Or was it deemed not important enough? Should I
> drop it for the regression list?
> =


Drop it for the moment.

My expectation is that it's a relatively minor hazard. The removal of the
fair zone allocation policy is a shorter path which benefits a number
of workloads but also potentially changes the color of pages used in
microbenchmarks which can have a cache effect.  It's on my TODO list to
reproduce this exactly as LKP does but my own preliminary experiments using
pbzip (yes, it's different) on 4 machines showed gains on all 4 machines
so something relatively subtle is going on or it's machine specific.

-- =

Mel Gorman
SUSE Labs

--===============4824448418009662295==--

