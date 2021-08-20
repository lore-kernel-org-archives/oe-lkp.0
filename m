Content-Type: multipart/mixed; boundary="===============0671238523610848028=="
MIME-Version: 1.0
From: Yonghong Song <yhs@fb.com>
To: lkp@lists.01.org
Subject: Re: [bpf] b89fbfbb85: netperf.Throughput_tps -21.3% regression
Date: Thu, 19 Aug 2021 23:29:27 -0700
Message-ID: <449d7b62-9339-2d1f-1798-2150e2764063@fb.com>
In-Reply-To: <20210820055009.GA29369@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============0671238523610848028==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 8/19/21 10:50 PM, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed a -21.3% regression of netperf.Throughput_tps due to comm=
it:
> =

> =

> commit: b89fbfbb854c9afc3047e8273cc3a694650b802e ("bpf: Implement minimal=
 BPF perf link")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

Could you do a test again to double check?
The above patch is related to bpf perf_event area.
It should not have any impact with netperf.

> =

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
> =

> =

> =

[...]
--===============0671238523610848028==--

