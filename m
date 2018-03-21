Content-Type: multipart/mixed; boundary="===============6732207206565432748=="
MIME-Version: 1.0
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [media] 859086ae36: kmsg.uvcvideo:Failed_to_query(GET_INFO)UVC_control#on_unit#:-#(exp.#)
Date: Wed, 21 Mar 2018 12:32:07 +0200
Message-ID: <1637940.NKPajzO43a@avalon>
In-Reply-To: <20180316020039.GU8942@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============6732207206565432748==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

On Friday, 16 March 2018 04:00:39 EET kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 859086ae3636eae0bf9f0fbbce2daf4d41ae9474 ("media: uvcvideo: Apply
> flags from device to actual properties")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =

> in testcase: netperf
> with following parameters:
> =

> 	ip: ipv4
> 	runtime: 300s
> 	nr_threads: 1
> 	cluster: cs-localhost
> 	test: SCTP_STREAM
> 	cpufreq_governor: performance
> =

> test-description: Netperf is a benchmark that can be use to measure vario=
us
> aspect of networking performance. test-url: http://www.netperf.org/netper=
f/
> =

> =

> on test machine: 4 threads Intel(R) Core(TM) i5-3317U CPU @ 1.70GHz with =
4G
> memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire
> log/backtrace):
> =

> =

> [   76.108373] uvcvideo: Failed to query (GET_INFO) UVC control 11 on unit
> 1: -32 (exp. 1).

Just for the record, Kieran is working on this.

> To reproduce:
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml

-- =

Regards,

Laurent Pinchart


--===============6732207206565432748==--

