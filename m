Content-Type: multipart/mixed; boundary="===============0395310924143891856=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [udp] bc0d3d0639: apachebench.requests_per_second -21% regression
Date: Fri, 30 Jun 2017 14:55:16 +0800
Message-ID: <20170630065516.GI28710@yexl-desktop>
In-Reply-To: <1497022529.3416.16.camel@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0395310924143891856==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Paolo

Sorry for the late.

On 06/09, Paolo Abeni wrote:
>On Wed, 2017-06-07 at 23:40 +0200, Paolo Abeni wrote:
>> I tried to measure the regression using the Apache benchmarking tool
>> directly with:
>> =

>> ab -t 300 -c 1000 -n 1000000 -q -k http://127.0.0.1/
>> =

>> and, across the named patches I see no relevant differences, and =

>> (oddly enough) some measurable improvement=C2=A0vs the vanilla linux-net.
>> Can the measured regression be caused by some fuzz in the test
>> environment, like the test being run on different HW?
>
>I did a lot of run of the ab test tool, on both vanilla and patched
>kernel and I measured a variance well above 21% and a very similar
>distribution for both vanilla and patched kernel. I'm really thinking
>this is a test-suite artifact.
>
>How do you a get stable baseline?
>

We've obtained the test result of your v2 patch.
https://github.com/0day-ci/linux/commits/Paolo-Abeni/udp-reduce-cache-press=
ure/20170607-170609
And it shows a -21% regression of apachebench.requests_per_second as well.
(we got the result by comparing with its parent commit)

a30f845f794044ce10e52ab237060cfe6d792bdc (udp: try to avoid 2 cache miss on=
 dequeue)
585713f9939d005afd2a415e5c5aeb4bf2b2a402 (udp: avoid a cache miss on dequeu=
e)

$ compare -at a30f845f794044ce10e52ab237060cfe6d792bdc 585713f9939d005afd2a=
415e5c5aeb4bf2b2a402
tests: 1
testcase/path_params/tbox_group/run: apachebench/300s-1000-cs-localhost-per=
formance/lkp-denverton2

a30f845f794044ce  585713f9939d005afd2a415e5c  =

----------------  --------------------------  =

         %stddev      change         %stddev
             \          |                \  =

     62.51              27%      79.24        apachebench.time_per_request
     15998             -21%      12620        apachebench.requests_per_seco=
nd
    171829             -21%     135543        apachebench.transfer_rate
     60465              23%      74225        apachebench.connection_time.t=
otal.max
     60465              23%      74225        apachebench.max_latency.100%
      4915 =C2=B1 17%        97%       9676 =C2=B1  6%  apachebench.time.in=
voluntary_context_switches
     64.64              57%     101.21        apachebench.time.elapsed_time
     64.64              57%     101.21        apachebench.time.elapsed_time=
.max
        70             -37%         44        apachebench.time.percent_of_c=
pu_this_job_got
     41218              19%      48963 =C2=B1  4%  interrupts.CAL:Function_=
call_interrupts
         4 =C2=B1 24%       -37%          3        vmstat.procs.r
     74824             -43%      42763        vmstat.system.in
    141619             -52%      67652        vmstat.system.cs
      4915 =C2=B1 17%        97%       9676 =C2=B1  6%  time.involuntary_co=
ntext_switches
     64.64              57%     101.21        time.elapsed_time
        70             -37%         44        time.percent_of_cpu_this_job_=
got
     64.64              57%     101.21        time.elapsed_time.max
     76.01              11%      84.61        mpstat.cpu.idle%
     10.81             -36%       6.97        mpstat.cpu.sys%
     11.00             -36%       7.02        mpstat.cpu.usr%
      2.19             -36%       1.39        mpstat.cpu.soft%
     56381             -12%      49843        meminfo.SUnreclaim
      9683             -13%       8421        meminfo.KernelStack

The steps used in lkp is stated in reproduce script as attached in original=
 report.

	for file in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
	do
		echo performance > $file
	done

	a2enmod auth_basic authn_core authn_file authz_core authz_host authz_user =
access_compat
	systemctl restart apache2
	ab -k -q -t 300 -n 1000000 -c 1000 127.0.0.1/

What config did you use to build kernel, is the one attached in original re=
port? =


Thanks,
Xiaolong


>Thank you,
>
>Paolo

--===============0395310924143891856==--

