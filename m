Content-Type: multipart/mixed; boundary="===============2164857130169815073=="
MIME-Version: 1.0
From: Dou Liyang <douly.fnst@cn.fujitsu.com>
To: lkp@lists.01.org
Subject: Re: [x86/acpi] dc6db24d24: BUG: unable to handle kernel paging request at 0000116007090008
Date: Mon, 13 Feb 2017 16:06:38 +0800
Message-ID: <3bf9ad5e-5903-0f52-cdad-908626348689@cn.fujitsu.com>
In-Reply-To: <20170213060505.GH28502@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============2164857130169815073==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Xiaolong

[...]
>>>
>>> Sorry for my neglect, the result for fd74da217df7d4bd25e95411da showed =
no dmesg
>>> because it's incomplete run and has no demsg stat at all.
>>
>> Is that means:
>>
>> you have already tested the Linux branch which contains the commit
>> fd74da217df7d. and it doesn't work well.
>>
>> Btw, Why the test is incomplete run ?
>
> Yes, We've got plenty test results for kernel that contains fd74da217df7d=
 such as v4.9,
> v4.10-rc1, v4.10-rc2...., they all have the same dmesg errors.

Understood! :)

> For the incomplete run, it may happen sometimes due to kernel panic durin=
g boot time and
> 0day failed to capture its dmesg stat.
>
>>
>>> The bug still persists in v4.9, v4.10-rcx, the lastest kernel head,
>>
>> If the dmesg and stat of the test is NULL, How do you prove that the
>> bug still exists?
>
> This "dmesg stat is empty" refer to test for kernel image which head comm=
it is fd74da217df7d,
> not for all test results.
>
>>
>>> could you help to check?
>>>
>>
>> Yes, I think we first should make the test with commit fd74da217df7d
>> work in the specific test machine.
>>
>> test machine: 72 threads Intel(R) Xeon(R) CPU E5-2699 v3 @ 2.30GHz
>> with 128G memory
>>
>> Am I right? waiting your response.
>
> Yes, currently we just found this issue on a specific machine, and I've q=
ueued the
> same jobs to other machines to see whether they have the same issue.
>

I will investigate it.


[...]

Thanks,
Liyang.



--===============2164857130169815073==--

