Content-Type: multipart/mixed; boundary="===============6648964700474709928=="
MIME-Version: 1.0
From: Xing Zhengjun <zhengjun.xing@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [ima] 8eb613c0b8: stress-ng.icache.ops_per_sec -84.2% regression
Date: Thu, 11 Jun 2020 15:10:20 +0800
Message-ID: <cb6a244c-5bab-1ccc-4386-e1b1caf48eb3@linux.intel.com>
In-Reply-To: <1591797185.5140.2.camel@linux.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6648964700474709928==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 6/10/2020 9:53 PM, Mimi Zohar wrote:
> Hi Xing,
> =

> On Wed, 2020-06-10 at 11:21 +0800, Xing Zhengjun wrote:
>> Hi Mimi,
>>
>>       Do you have time to take a look at this? we noticed a 3.7%
>> regression of boot-time.dhcp and a 84.2% regression of
>> stress-ng.icache.ops_per_sec. Thanks.
>>
>> On 6/3/2020 5:11 PM, kernel test robot wrote:
>>> Greeting,
>>>
>>> FYI, we noticed a 3.7% regression of boot-time.dhcp due to commit:
>>>
>>>
>>> commit: 8eb613c0b8f19627ba1846dcf78bb2c85edbe8dd ("ima: verify mprotect=
 change is consistent with mmap policy")
>>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>>>
>>> in testcase: stress-ng
>>> on test machine: 96 threads Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz wi=
th 192G memory
>>> with following parameters:
>>>
>>> 	nr_threads: 100%
>>> 	disk: 1HDD
>>> 	testtime: 30s
>>> 	class: cpu-cache
>>> 	cpufreq_governor: performance
>>> 	ucode: 0x500002c
> =

> Does the following change resolve it?
> =

> diff --git a/security/integrity/ima/ima_main.c b/security/integrity/ima/i=
ma_main.c
> index c44414a7f82e..78e1dfc8a3f2 100644
> --- a/security/integrity/ima/ima_main.c
> +++ b/security/integrity/ima/ima_main.c
> @@ -426,7 +426,8 @@ int ima_file_mprotect(struct vm_area_struct *vma, uns=
igned long prot)
>   	int pcr;
>   =

>   	/* Is mprotect making an mmap'ed file executable? */
> -	if (!vma->vm_file || !(prot & PROT_EXEC) || (vma->vm_flags & VM_EXEC))
> +	if (!(ima_policy_flag & IMA_APPRAISE) || !vma->vm_file ||
> +	    !(prot & PROT_EXEC) || (vma->vm_flags & VM_EXEC))
>   		return 0;
>   =

>   	security_task_getsecid(current, &secid);
> =

Thanks. I test the change, it can resolve the regression.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/debug-setup/nr_threads/disk/tes=
ttime/class/cpufreq_governor/ucode:
 =

lkp-csl-2sp5/stress-ng/debian-x86_64-20191114.cgz/x86_64-rhel-7.6/gcc-9/tes=
t/100%/1HDD/30s/cpu-cache/performance/0x500002c

commit:
   0c4395fb2aa77341269ea619c5419ea48171883f
   8eb613c0b8f19627ba1846dcf78bb2c85edbe8dd
   8745d6eb3a493b1d324eeb9edefec5d23c16cba9 (fix for the regression)

0c4395fb2aa77341 8eb613c0b8f19627ba1846dcf78 8745d6eb3a493b1d324eeb9edef
---------------- --------------------------- ---------------------------
          %stddev     %change         %stddev     %change         %stddev
              \          |                \          |                \
     884.33 =C2=B1  4%      +4.6%     924.67           +45.1%       1283 =
=C2=B1 =

3%  stress-ng.cache.ops
      29.47 =C2=B1  4%      +4.6%      30.82           +45.1%      42.76 =
=C2=B1 =

3%  stress-ng.cache.ops_per_sec
    1245720           -84.3%     195648            -0.8%    1235416 =

   stress-ng.icache.ops
      41522           -84.3%       6520            -0.8%      41179 =

   stress-ng.icache.ops_per_sec



-- =

Zhengjun Xing
--===============6648964700474709928==--

