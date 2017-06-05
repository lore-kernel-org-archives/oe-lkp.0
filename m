Content-Type: multipart/mixed; boundary="===============0011552753605274559=="
MIME-Version: 1.0
From: Zhuo, Qiuxu <qiuxu.zhuo@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [EDAC, sb_edac] e2f747b1f4: kmsg.EDAC_sbridge:Failed_to_register_device_with_error
Date: Mon, 05 Jun 2017 13:07:37 +0000
Message-ID: <E6AF1AFDEA62A94A97508F458CBDD47F6F5A2058@SHSMSX101.ccr.corp.intel.com>
In-Reply-To: <20170605062231.GA2969@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============0011552753605274559==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Xiaolong,

   Thanks!  I'll look at it, and feedback ASAP.

BR
qiuxu

-----Original Message-----
From: lkp-robot-request(a)eclists.intel.com [mailto:lkp-robot-request(a)ecl=
ists.intel.com] On Behalf Of Ye, Xiaolong
Sent: Monday, June 5, 2017 2:23 PM
To: Zhuo, Qiuxu <qiuxu.zhuo@intel.com>
Cc: Borislav Petkov <bp@suse.de>; linux-edac <linux-edac@vger.kernel.or=
g>; LKML <linux-kernel@vger.kernel.org>; Stephen Rothwell <sfr@canb.auu=
g.org.au>; lkp(a)01.org
Subject: [lkp-robot] [EDAC, sb_edac] e2f747b1f4: kmsg.EDAC_sbridge:Failed_t=
o_register_device_with_error


FYI, we noticed the following commit:

commit: e2f747b1f42a2f6b0cf5416be1684c1b94a42f0f ("EDAC, sb_edac: Assign ED=
AC memory controller per h/w controller") https://git.kernel.org/cgit/linux=
/kernel/git/next/linux-next.git master

in testcase: netperf
with following parameters:

	ip: ipv4
	runtime: 300s
	nr_threads: 25%
	cluster: cs-localhost
	test: TCP_CRR
	cpufreq_governor: performance

test-description: Netperf is a benchmark that can be use to measure various=
 aspect of networking performance.
test-url: http://www.netperf.org/netperf/


on test machine: 16 threads Intel(R) Xeon(R) CPU D-1541 @ 2.10GHz with 8G m=
emory

caused below changes (please refer to attached dmesg/kmsg for entire log/ba=
cktrace):


kern  :err   : [   17.309988] EDAC sbridge: Some needed devices are missing
kern  :info  : [   17.504765] ast 0000:07:00.0: fb0: astdrmfb frame buffer =
device
kern  :info  : [   17.533508] EDAC MC: Removed device 0 for sbridge_edac.c =
Broadwell SrcID#0_Ha#0: DEV 0000:ff:12.0
kern  :err   : [   17.533529] EDAC sbridge: Couldn't find mci handler
kern  :err   : [   17.533530] EDAC sbridge: Failed to register device with =
error -19.




To reproduce:

        git clone https://github.com/01org/lkp-tests.git
        cd lkp-tests
        bin/lkp install job.yaml  # job file is attached in this email
        bin/lkp run     job.yaml



Thanks,
Xiaolong

--===============0011552753605274559==--

