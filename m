Content-Type: multipart/mixed; boundary="===============3143941763650662903=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [cpufreq] 909c0e9cc1: fwq.fwq.med 210.0% improvement
Date: Fri, 06 Mar 2020 11:29:53 +0800
Message-ID: <87zhcuyxce.fsf@yhuang-dev.intel.com>
In-Reply-To: <CAJZ5v0g2vzYQ04GyrpubLx2+B0O4SDbqoTDCvhnSyaj1j1xswA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3143941763650662903==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Rafael,

"Rafael J. Wysocki" <rafael@kernel.org> writes:

> On Thu, Mar 5, 2020 at 9:18 AM Rong Chen <rong.a.chen@intel.com> wrote:
>>
>>
>>
>> On 3/5/20 3:50 PM, Rafael J. Wysocki wrote:
>> > On 3/5/2020 2:35 AM, kernel test robot wrote:
>> >> Greeting,
>> >>
>> >> FYI, we noticed a 210.0% improvement of fwq.fwq.med due to commit:
>> >
>> > Well, that sounds impressive. :-)
>> >
>> >
>> >>
>> >> commit: 909c0e9cc11ba39fa5a660583b25c2431cf54deb ("cpufreq:
>> >> intel_pstate: Use passive mode by default without HWP")
>> >> https://git.kernel.org/cgit/linux/kernel/git/rafael/linux-pm.git
>> >> intel_pstate-passive
>> >>
>> >> in testcase: fwq
>> >> on test machine: 16 threads Intel(R) Xeon(R) CPU D-1541 @ 2.10GHz
>> >> with 48G memory
>> >> with following parameters:
>> >>
>> >>     nr_task: 100%
>> >>     samples: 100000ss
>> >>     iterations: 18x
>> >>     cpufreq_governor: powersave
>> >
>> > The governor should be schedutil, though, unless it is explicitly set
>> > to powersave in the test environment.
>> >
>> > Is that the case?
>> >
>> >
>>
>> Hi Rafael,
>>
>> Yes, we set to powersave for this test.
>
> I wonder why this is done?  Is there any particular technical reason
> for doing that?

fwq is a noise benchmark to measure the hardware and software noise
level.  More information could be found in the following document.

https://asc.llnl.gov/sequoia/benchmarks/FTQ_summary_v1.1.pdf

In 0day, to measure the noise introduced by power management, we will
run fwq with the performance and powersave governors.  Do you think this
is reasonable?  Or we should use some other governors?

Best Regards,
Huang, Ying
--===============3143941763650662903==--

