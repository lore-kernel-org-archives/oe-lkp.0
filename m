Content-Type: multipart/mixed; boundary="===============8590761755712460051=="
MIME-Version: 1.0
From: Bart Van Assche <bvanassche@acm.org>
To: lkp@lists.01.org
Subject: Re: 2463a604a8: netperf.Throughput_tps 12.8% improvement
Date: Tue, 25 May 2021 09:44:26 -0700
Message-ID: <f572997b-8979-26bb-cb3b-9926086c4cc7@acm.org>
In-Reply-To: <20210525064427.GC7744@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============8590761755712460051==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 5/24/21 11:44 PM, kernel test robot wrote:
> FYI, we noticed a 12.8% improvement of netperf.Throughput_tps due to comm=
it:
> =

> commit: 2463a604a86728777ce4284214a52de46a808c9e ("[PATCH v3 2/3] Introdu=
ce enums for the SAM, message, host and driver status codes")
> url: https://github.com/0day-ci/linux/commits/Bart-Van-Assche/Introduce-e=
nums-for-SCSI-status-codes/20210524-105751
> base: https://git.kernel.org/cgit/linux/kernel/git/mkp/scsi.git for-next
> =

> in testcase: netperf
> on test machine: 192 threads 4 sockets Intel(R) Xeon(R) Platinum 9242 CPU=
 @ 2.30GHz with 192G memory
> with following parameters:
> =

> 	ip: ipv4
> 	runtime: 300s
> 	nr_threads: 16
> 	cluster: cs-localhost
> 	test: TCP_CRR
> 	cpufreq_governor: performance
> 	ucode: 0x5003006
> =

> test-description: Netperf is a benchmark that can be use to measure vario=
us aspect of networking performance.
> test-url: http://www.netperf.org/netperf/

The above email reports a performance improvement for the networking
subsystem while my patch only affects the SCSI subsystem and should not
have any performance impact. I'm confused by the above feedback ...

Bart.
--===============8590761755712460051==--

