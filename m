Content-Type: multipart/mixed; boundary="===============2639873201286199942=="
MIME-Version: 1.0
From: Chen, Rong A <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [perf/x86/amd] 471af006a7: will-it-scale.per_process_ops -7.6% regression
Date: Fri, 14 Feb 2020 20:02:01 +0800
Message-ID: <ca326232-d084-3562-af78-1d9c6bdacd56@intel.com>
In-Reply-To: <20200212121830.GR14897@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============2639873201286199942==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 2/12/2020 8:18 PM, Peter Zijlstra wrote:
> On Wed, Feb 12, 2020 at 07:35:14PM +0800, kernel test robot wrote:
>> Greeting,
>>
>> FYI, we noticed a -7.6% regression of will-it-scale.per_process_ops due =
to commit:
>>
>>
>> commit: 471af006a747f1c535c8a8c6c0973c320fe01b22 ("perf/x86/amd: Constra=
in Large Increment per Cycle events")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>
>> in testcase: will-it-scale
>> on test machine: 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz wi=
th 128G memory
> That commit only changes code relevant to AMD machines; give you have
> this result on an Intel machine makes me think the bisect is flawed.

Hi,

Sorry for the inconvenience, the regression is stable on our platform, =

we're investigating it.

Best Regards,
Rong Chen
--===============2639873201286199942==--

