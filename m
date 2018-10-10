Content-Type: multipart/mixed; boundary="===============3723978992307556557=="
MIME-Version: 1.0
From: Eric Dumazet <edumazet@google.com>
To: lkp@lists.01.org
Subject: Re: [tcp] a337531b94: netperf.Throughput_Mbps -6.1% regression
Date: Tue, 09 Oct 2018 19:05:20 -0700
Message-ID: <CANn89i+RDyhy9k22GHpJVzOWzCK3Hd6z89bABWDXmsgc6w+h9g@mail.gmail.com>
In-Reply-To: <20181010015143.GD13396@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============3723978992307556557==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 9, 2018 at 7:01 PM kernel test robot <rong.a.chen@intel.com> =
wrote:
>
> Greeting,
>
> FYI, we noticed a -6.1% regression of netperf.Throughput_Mbps due to comm=
it:
>
>
> commit: a337531b942bd8a03e7052444d7e36972aac2d92 ("tcp: up initial rmem t=
o 128KB and SYN rwin to around 64KB")
> https://git.kernel.org/cgit/linux/kernel/git/davem/net-next.git master
>
> in testcase: netperf
> on test machine: 16 threads Intel(R) Xeon(R) CPU D-1541 @ 2.10GHz with 8G=
 memory
> with following parameters:
>
>         ip: ipv4
>         runtime: 900s
>         nr_threads: 200%
>         cluster: cs-localhost
>         test: TCP_STREAM
>         ucode: 0x7000013
>         cpufreq_governor: performance
>
> test-description: Netperf is a benchmark that can be use to measure vario=
us aspect of networking performance.
> test-url: http://www.netperf.org/netperf/
>
>

This should have been fixed by :

041a14d2671573611ffd6412bc16e2f64469f7fb tcp: start receiver buffer
autotuning sooner

--===============3723978992307556557==--

