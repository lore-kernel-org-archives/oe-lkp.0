Content-Type: multipart/mixed; boundary="===============3671644627552504923=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [Jfs-discussion] [fs] 05c5a0273b: netperf.Throughput_total_tps -71.8% regression
Date: Thu, 14 May 2020 13:12:18 +0800
Message-ID: <5d4fbe21-7959-d53f-76c5-ed0299d8db23@intel.com>
In-Reply-To: <alpine.DEB.2.22.395.2005132123020.14542@trent.utfs.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============3671644627552504923==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 5/14/20 12:27 PM, Christian Kujau wrote:
> On Tue, 12 May 2020, kernel test robot wrote:
>> FYI, we noticed a -71.8% regression of netperf.Throughput_total_tps due =
to commit:
> As noted in this report, netperf is used to "measure various aspect of
> networking performance". Are we sure the bisect is correct? JFS is a
> filesystem and is not touching net/ in any way. So, having not attempted
> to reproduce this, maybe the JFS commit is a red herring?
>
> C.

Hi,

The commit also causes -74.6% regression of will-it-scale.per_thread_ops:

in testcase: will-it-scale
on test machine: 8 threads Intel(R) Core(TM) i7-3770K CPU @ 3.50GHz with 16=
G memory
with following parameters:

	nr_task: 100%
	mode: thread
	test: unlink2
	cpufreq_governor: performance
	ucode: 0x21

I'll send another report for this regression.

Best Regards,
Rong Chen

--===============3671644627552504923==--

