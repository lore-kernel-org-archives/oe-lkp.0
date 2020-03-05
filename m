Content-Type: multipart/mixed; boundary="===============4046010025816362648=="
MIME-Version: 1.0
From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
To: lkp@lists.01.org
Subject: Re: [cpufreq] 909c0e9cc1: fwq.fwq.med 210.0% improvement
Date: Thu, 05 Mar 2020 08:50:00 +0100
Message-ID: <951b0986-bb35-d9a5-1639-0a8cdb3dcd04@intel.com>
In-Reply-To: <20200305013509.GF5972@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============4046010025816362648==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 3/5/2020 2:35 AM, kernel test robot wrote:
> Greeting,
>
> FYI, we noticed a 210.0% improvement of fwq.fwq.med due to commit:

Well, that sounds impressive. :-)


>
> commit: 909c0e9cc11ba39fa5a660583b25c2431cf54deb ("cpufreq: intel_pstate:=
 Use passive mode by default without HWP")
> https://git.kernel.org/cgit/linux/kernel/git/rafael/linux-pm.git intel_ps=
tate-passive
>
> in testcase: fwq
> on test machine: 16 threads Intel(R) Xeon(R) CPU D-1541 @ 2.10GHz with 48=
G memory
> with following parameters:
>
> 	nr_task: 100%
> 	samples: 100000ss
> 	iterations: 18x
> 	cpufreq_governor: powersave

The governor should be schedutil, though, unless it is explicitly set to =

powersave in the test environment.

Is that the case?


--===============4046010025816362648==--

