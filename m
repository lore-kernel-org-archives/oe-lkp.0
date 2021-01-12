Content-Type: multipart/mixed; boundary="===============1785490636185337168=="
MIME-Version: 1.0
From: Borislav Petkov <bp@alien8.de>
To: lkp@lists.01.org
Subject: Re: [x86/mce] 7bb39313cd: netperf.Throughput_tps -4.5% regression
Date: Tue, 12 Jan 2021 15:14:38 +0100
Message-ID: <20210112141438.GF13086@zn.tnic>
In-Reply-To: <20210112142109.GE30747@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============1785490636185337168==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 10:21:09PM +0800, kernel test robot wrote:
> =

> Greeting,
> =

> FYI, we noticed a -4.5% regression of netperf.Throughput_tps due to commi=
t:
> =

> =

> commit: 7bb39313cd6239e7eb95198950a02b4ad2a08316 ("x86/mce: Make mce_time=
d_out() identify holdout CPUs")
> https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git ras/core
> =

> =

> in testcase: netperf
> on test machine: 192 threads Intel(R) Xeon(R) Platinum 9242 CPU @ 2.30GHz=
 with 192G memory
> with following parameters:
> =

> 	ip: ipv4
> 	runtime: 300s
> 	nr_threads: 16
> 	cluster: cs-localhost
> 	test: TCP_CRR
> 	cpufreq_governor: performance
> 	ucode: 0x5003003
> =

> test-description: Netperf is a benchmark that can be use to measure vario=
us aspect of networking performance.
> test-url: http://www.netperf.org/netperf/

I'm very very sceptical this thing benchmarks #MC exception handler
performance. Because the code this patch adds gets run only during a MCE
exception.

So unless I'm missing something obvious please check your setup.

-- =

Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
--===============1785490636185337168==--

