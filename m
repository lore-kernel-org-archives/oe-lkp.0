Content-Type: multipart/mixed; boundary="===============8956784039883189551=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/irq] 4c24cee6b2: IP-Config: Auto-configuration of network failed
Date: Mon, 14 Dec 2015 14:54:02 +0800
Message-ID: <87d1u9ikqd.fsf@yhuang-dev.intel.com>
In-Reply-To: <566E63C8.3050000@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8956784039883189551==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Jiang,

Jiang Liu <jiang.liu@linux.intel.com> writes:

> Hi Ying,
> 	Thanks for reporting this issue. But I couldn't figure
> out what's wrong with this commit. And there's no error or
> warning messages in the attached dmesg file. Are there other
> systems reporting the same issue?

No, there are no other systems reporting the same issue.  I will queue
more tests for make sure this is not a false positive.

Best Regards,
Huang, Ying

> Thanks,
> Gerry
>
> On 2015/12/11 15:49, kernel test robot wrote:
>> FYI, we noticed the below changes on
>> =

>> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/urgent
>> commit 4c24cee6b2aeaee3dab896f76fef4fe79d9e4183 ("x86/irq: Enhance
>> __assign_irq_vector() to rollback in case of failure")
>> =

>> =

>> +------------------------------------------------+------------+---------=
---+
>> |                                                | 6dd7cb991f | 4c24cee6=
b2 |
>> +------------------------------------------------+------------+---------=
---+
>> | boot_successes                                 | 6          | 0       =
   |
>> | boot_failures                                  | 0          | 8       =
   |
>> | IP-Config:Auto-configuration_of_network_failed | 0          | 6       =
   |
>> | BUG:kernel_boot_hang                           | 0          | 2       =
   |
>> +------------------------------------------------+------------+---------=
---+
>> =

>> It appears that the Ethernet card doesn't work properly after your patch.
>> =

>> [   15.342990] Waiting up to 110 more seconds for network.
>> [   25.346987] Waiting up to 100 more seconds for network.
>> [   35.350995] Waiting up to 90 more seconds for network.
>> [   45.350993] Waiting up to 80 more seconds for network.
>> [   55.351006] Waiting up to 70 more seconds for network.
>> [   65.350992] Waiting up to 60 more seconds for network.
>> [   75.355017] Waiting up to 50 more seconds for network.
>> [   85.359009] Waiting up to 40 more seconds for network.
>> [   95.363009] Waiting up to 30 more seconds for network.
>> [  305.883015] Waiting up to 20 more seconds for network.
>> [  315.887002] Waiting up to 10 more seconds for network.
>> [  325.887524] Sending DHCP requests ...... timed out!
>> [  417.893036] IP-Config: Auto-configuration of network failed
>> [  417.893852] ALSA device list:
>> [  417.894270]   No soundcards found.
>> [  417.899649] Freeing unused kernel memory: 2884K (ffffffff82574000 - f=
fffffff82845000)
>> =

>> =

>> Thanks,
>> Ying Huang
>> =

> _______________________________________________
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp

--===============8956784039883189551==--

