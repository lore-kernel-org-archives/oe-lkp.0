Content-Type: multipart/mixed; boundary="===============6387090490082733055=="
MIME-Version: 1.0
From: Xing Zhengjun <zhengjun.xing@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [ima] 8eb613c0b8: stress-ng.icache.ops_per_sec -84.2% regression
Date: Fri, 12 Jun 2020 08:39:08 +0800
Message-ID: <d5b6a48b-005c-e5cb-a82f-5f7225741100@linux.intel.com>
In-Reply-To: <1591872811.5140.41.camel@linux.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6387090490082733055==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 6/11/2020 6:53 PM, Mimi Zohar wrote:
> On Thu, 2020-06-11 at 15:10 +0800, Xing Zhengjun wrote:
>> On 6/10/2020 9:53 PM, Mimi Zohar wrote:
>>   	ucode: 0x500002c
>>>
>>> Does the following change resolve it?
>>>
>>> diff --git a/security/integrity/ima/ima_main.c b/security/integrity/ima=
/ima_main.c
>>> index c44414a7f82e..78e1dfc8a3f2 100644
>>> --- a/security/integrity/ima/ima_main.c
>>> +++ b/security/integrity/ima/ima_main.c
>>> @@ -426,7 +426,8 @@ int ima_file_mprotect(struct vm_area_struct *vma, u=
nsigned long prot)
>>>    	int pcr;
>>>    =

>>>    	/* Is mprotect making an mmap'ed file executable? */
>>> -	if (!vma->vm_file || !(prot & PROT_EXEC) || (vma->vm_flags & VM_EXEC))
>>> +	if (!(ima_policy_flag & IMA_APPRAISE) || !vma->vm_file ||
>>> +	    !(prot & PROT_EXEC) || (vma->vm_flags & VM_EXEC))
>>>    		return 0;
>>>    =

>>>    	security_task_getsecid(current, &secid);
>>>
>> Thanks. I test the change, it can resolve the regression.
> =

> Thanks!  Can I get your "Tested-by" tag?
> =

> Mimi
> =


Sure.

-- =

Zhengjun Xing
--===============6387090490082733055==--

