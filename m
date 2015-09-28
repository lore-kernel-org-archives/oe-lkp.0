Content-Type: multipart/mixed; boundary="===============5721509531866005957=="
MIME-Version: 1.0
From: Al Stone <al.stone@linaro.org>
To: lkp@lists.01.org
Subject: Re: [ACPI / tables] d23117244a: WARNING: CPU: 0 PID: 0 at arch/x86/kernel/apic/apic_noop.c:102 noop_apic_read()
Date: Mon, 28 Sep 2015 14:20:50 -0600
Message-ID: <5609A122.3020507@linaro.org>
In-Reply-To: <5813017.Ttrey5nkk4@vostro.rjw.lan>
List-Id: <oe-lkp.lists.linux.dev>

--===============5721509531866005957==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 09/27/2015 07:28 AM, Rafael J. Wysocki wrote:
> On Saturday, September 26, 2015 10:25:01 PM kernel test robot wrote:
>> This is a multi-part message in MIME format.
>>
>> --=3D_5606aabd.7+9TmBQ/us56m64fix39ih1r6UcMAst4WhUlI2MFiEWfPVoU
>> Content-Type: text/plain; charset=3Dus-ascii
>> Content-Transfer-Encoding: 7bit
>> Content-Disposition: inline
>>
>> Greetings,
>>
>> 0day kernel testing robot got the below dmesg and the first bad commit is
>>
>> git://internal_merge_and_test_tree devel-catchup-201509260834
>>
>> commit d23117244a466b3821824a9daf6c42cc4c90b12b
>> Author:     Al Stone <al.stone@linaro.org>
>> AuthorDate: Wed Sep 16 17:26:41 2015 -0600
>> Commit:     Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>> CommitDate: Sat Sep 26 00:56:07 2015 +0200
>>
>>     ACPI / tables: add in a bad_madt_entry() function to eventually repl=
ace the macro
>>     =

> =

> OK, I'll drop the series then and please fix this.
> =

> Thanks,
> Rafael
> =


Fix in progress.

-- =

ciao,
al
-----------------------------------
Al Stone
Software Engineer
Linaro Enterprise Group
al.stone(a)linaro.org
-----------------------------------

--===============5721509531866005957==--

