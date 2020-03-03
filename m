Content-Type: multipart/mixed; boundary="===============0460580829897856750=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: acf49bb928 ("mm/mlock: split ClearPageLRU from page isolation .."): [ 36.045721] BUG: sleeping function called from invalid context at mm/rmap.c:1861
Date: Tue, 03 Mar 2020 12:58:18 +0800
Message-ID: <62e36f31-33a4-92ce-8735-4d81845c5401@intel.com>
In-Reply-To: <4bed495a-8a96-6ded-07cd-bd0b61237bce@linux.alibaba.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0460580829897856750==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

lkp(a)intel.com is better, it's the mail address of bot. lkp(a)lists.01.org=
 is a mailing list.

Best Regards,
Rong Chen

On 3/3/20 12:52 PM, Alex Shi wrote:
> Btw,
> when credit to lkp, which email address is suitable, lkp(a)intel.com or l=
kp(a)lists.01.org?
>
> Thanks
> Alex
>
> =E5=9C=A8 2020/3/3 =E4=B8=8A=E5=8D=8810:26, Rong Chen =E5=86=99=E9=81=93:
>> Hi Alex,
>>
>> On 3/3/20 10:21 AM, Alex Shi wrote:
>>> Thanks a lot. Rong!
>>> I did this, and fixed the bug, sent to upstream with your credit. :)
>>>
>>> Thanks again!
>>>
>>>
>>> Btw, the yocto-trinity.cgz has 404 error for me. I got one from fenggua=
ng's github, which name is slight different. anyway it could be use just wi=
th some complains.
>>>
>>> [kuiliang.as(a)r10o07403.sqa.zmf /home/kuiliang.as/linux]
>>> $bash ../yocto-kvm.sh
>>> --2020-03-03 10:19:40--=C2=A0 https://download.01.org/0day-ci/lkp-qemu/=
osimage/yocto/yocto-x86_64-trinity.cgz
>>> Resolving download.01.org (download.01.org)... 23.34.100.46, 2600:1417:=
76:483::4b21, 2600:1417:76:480::4b21
>>> Connecting to download.01.org (download.01.org)|23.34.100.46|:443... co=
nnected.
>>> HTTP request sent, awaiting response... 404 Not Found
>>> 2020-03-03 10:19:41 ERROR 404: Not Found.
>> We'll update the files in https://download.01.org
>>
>> Best Regards,
>> Rong Chen
>>
>>
>>>
>>> =E5=9C=A8 2020/3/3 =E4=B8=8A=E5=8D=888:14, Rong Chen =E5=86=99=E9=81=93:
>>>> Hi Alex,
>>>>
>>>> You can reproduce with the script "reproduce-yocto-vm-yocto-61:2020030=
1143758:x86_64-randconfig-a002-20200228:5.6.0-rc3-00009-gacf49bb928471:1":
>>>>
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 ./reproduce-... $kernel
>>>>
>>>> Best Regards,
>>>> Rong Chen
>>>>
>>>> On 3/2/20 2:31 PM, Alex Shi wrote:
>>>>> Thanks for the report!
>>>>>
>>>>> Do you know how to reproduce this bug?
>>>>>
>>>>>
>>>>> Thanks!
>>>>>
>>>>> =E5=9C=A8 2020/3/1 =E4=B8=8B=E5=8D=888:35, kernel test robot =E5=86=
=99=E9=81=93:
>>>>>> Greetings,
>>>>>>
>>>>>> 0day kernel testing robot got the below dmesg and the first bad comm=
it is
>>>>>>
>>>>>> https://github.com/alexshi/linux.git lrunext
>>>>>>
>>>>>> commit acf49bb9284710c28524098098bda22eb1602275
>>>>>> Author:=C2=A0=C2=A0=C2=A0=C2=A0 Alex Shi <alex.shi@linux.alibaba.c=
om>
>>>>>> AuthorDate: Thu Feb 27 12:24:11 2020 +0800
>>>>>> Commit:=C2=A0=C2=A0=C2=A0=C2=A0 Alex Shi <alex.shi@linux.alibaba.c=
om>
>>>>>> CommitDate: Thu Feb 27 19:45:28 2020 +0800
>>>>>>
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mm/mlock: split ClearPageLRU from pa=
ge isolation and remain Mlocked guard
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 This is one=
 of effort to split the PageLRU clear from old page
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 isolation.
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 This patch =
move the lru_lock after get PageLRU, which takes holding
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PageLRU as precondition for page iso=
lation, as a preparation for later
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lru_lock replacment. So we have to u=
nfold __munlock_isolate_lru_page.
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 __split_hug=
e_page_refcount doesn't exist, but we still have to guard
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PageMlocked in __split_huge_page_tai=
l. that make code ugly and bear
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 few unrelated code in lock. anyway s=
till removed few goto's to dress up
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 current code.
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 Signed-off-=
by: Alex Shi <alex.shi@linux.alibaba.com>
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Cc: Kirill A. Shutemov <kirill@shu=
temov.name>
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Cc: Andrew Morton <akpm@linux-foun=
dation.org>
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Cc: Johannes Weiner <hannes@cmpxch=
g.org>
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Cc: Matthew Wilcox <willy@infradea=
d.org>
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Cc: Hugh Dickins <hughd@google.com>
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Cc: linux-mm(a)kvack.org
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Cc: linux-kernel(a)vger.kernel.org
>>>>>>
>>>>>> e46563ef83=C2=A0 mm/lru: add page isolation precondition in __isolat=
e_lru_page
>>>>>> acf49bb928=C2=A0 mm/mlock: split ClearPageLRU from page isolation an=
d remain Mlocked guard
>>>>>> 4eddfb57a6=C2=A0 mm/memcg: add debug checking in lock_page_memcg
>>>>>> +----------------------------------------------------------------+--=
----------+------------+------------+
>>>>>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | e46563ef83 | acf49bb928 | 4eddfb57a6 |
>>>>>> +----------------------------------------------------------------+--=
----------+------------+------------+
>>>>>> | boot_successes=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>>>> | boot_failures=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 10=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>>>> | WARNING:at_mm/usercopy.c:#usercopy_warn=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |
>>>>>> | RIP:usercopy_warn=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>>>> | INFO:rcu_sched_self-detected_stall_on_CPU=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>>>> | RIP:clear_page_erms=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>>>> | INFO:rcu_sched_detected_stalls_on_CPUs/tasks=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>>>> | BUG:kernel_hang_in_boot_stage=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>>>> | BUG:kernel_timeout_in_boot_stage=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>>>> | BUG:sleeping_function_called_from_invalid_context_at_mm/rmap.c | 0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 6=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>>>> | BUG:kernel_hang_in_early-boot_stage=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |
>>>>>> | RIP:copy_user_enhanced_fast_string=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |
>>>>>> +----------------------------------------------------------------+--=
----------+------------+------------+
>>>>>>
>>>>>> If you fix the issue, kindly add following tag
>>>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>>>>
>>>>>> [child5:606] nfsservctl (180) returned ENOSYS, marking as inactive.
>>>>>> [child5:606] clock_getres (266:[32BIT]) returned ENOSYS, marking as =
inactive.
>>>>>> [child3:603] mq_getsetattr (245) returned ENOSYS, marking as inactiv=
e.
>>>>>> [child3:616] mq_timedreceive (243) returned ENOSYS, marking as inact=
ive.
>>>>>> [child3:616] kexec_load (246) returned ENOSYS, marking as inactive.
>>>>>> [=C2=A0=C2=A0 36.045721] BUG: sleeping function called from invalid =
context at mm/rmap.c:1861
>>>>>> [=C2=A0=C2=A0 36.047309] in_atomic(): 1, irqs_disabled(): 1, non_blo=
ck: 0, pid: 606, name: trinity-c5
>>>>>> [=C2=A0=C2=A0 36.048622] CPU: 0 PID: 606 Comm: trinity-c5 Not tainte=
d 5.6.0-rc3-00009-gacf49bb928471 #1
>>>>>> [=C2=A0=C2=A0 36.049991] Hardware name: QEMU Standard PC (i440FX + P=
IIX, 1996), BIOS 1.12.0-1 04/01/2014
>>>>>> [=C2=A0=C2=A0 36.051424] Call Trace:
>>>>>> [=C2=A0=C2=A0 36.051773]=C2=A0 dump_stack+0x7c/0xa5
>>>>>> [=C2=A0=C2=A0 36.052198]=C2=A0 ___might_sleep+0x161/0x180
>>>>>> [=C2=A0=C2=A0 36.052682]=C2=A0 rmap_walk_anon+0x135/0x320
>>>>>> [=C2=A0=C2=A0 36.053597]=C2=A0 rmap_walk+0x51/0x60
>>>>>> [=C2=A0=C2=A0 36.053999]=C2=A0 try_to_munlock+0x86/0xb0
>>>>>> [=C2=A0=C2=A0 36.054464]=C2=A0 ? page_mkclean+0x140/0x140
>>>>>> [=C2=A0=C2=A0 36.055335]=C2=A0 ? page_remove_rmap+0x4a0/0x4a0
>>>>>> [=C2=A0=C2=A0 36.055862]=C2=A0 ? anon_vma_ctor+0x70/0x70
>>>>>> [=C2=A0=C2=A0 36.056343]=C2=A0 ? page_get_anon_vma+0x180/0x180
>>>>>> [=C2=A0=C2=A0 36.057299]=C2=A0 __munlock_isolated_page+0x46/0xd0
>>>>>> [=C2=A0=C2=A0 36.057954]=C2=A0 munlock_vma_page+0x3be/0x4f0
>>>>>> [=C2=A0=C2=A0 36.058446]=C2=A0 wp_page_copy+0xaba/0xaf0
>>>>>> [=C2=A0=C2=A0 36.059313]=C2=A0 ? follow_pfn+0x160/0x160
>>>>>> [=C2=A0=C2=A0 36.059780]=C2=A0 ? __kasan_check_read+0x11/0x20
>>>>>> [=C2=A0=C2=A0 36.060294]=C2=A0 ? try_to_wake_up+0x183/0xbd0
>>>>>> [=C2=A0=C2=A0 36.061211]=C2=A0 do_wp_page+0x292/0x9b0
>>>>>> [=C2=A0=C2=A0 36.061643]=C2=A0 ? finish_mkwrite_fault+0x210/0x210
>>>>>> [=C2=A0=C2=A0 36.062199]=C2=A0 ? _raw_read_lock_irq+0x40/0x40
>>>>>> [=C2=A0=C2=A0 36.063149]=C2=A0 __handle_mm_fault+0x96a/0x18b0
>>>>>> [=C2=A0=C2=A0 36.063659]=C2=A0 ? apply_to_existing_page_range+0x10/0=
x10
>>>>>> [=C2=A0=C2=A0 36.064280]=C2=A0 ? _raw_spin_lock+0x75/0xc0
>>>>>> [=C2=A0=C2=A0 36.065163]=C2=A0 ? _raw_read_lock_irq+0x40/0x40
>>>>>> [=C2=A0=C2=A0 36.065693]=C2=A0 ? update_rq_clock+0x126/0x1f0
>>>>>> [=C2=A0=C2=A0 36.066646]=C2=A0 ? __kasan_check_read+0x11/0x20
>>>>>> [=C2=A0=C2=A0 36.067170]=C2=A0 ? __count_memcg_events+0x54/0x120
>>>>>> [=C2=A0=C2=A0 36.068041]=C2=A0 handle_mm_fault+0x1d2/0x2f0
>>>>>> [=C2=A0=C2=A0 36.068953]=C2=A0 __get_user_pages+0x2b8/0xa50
>>>>>> [=C2=A0=C2=A0 36.069466]=C2=A0 ? follow_page_mask+0xa00/0xa00
>>>>>> [=C2=A0=C2=A0 36.069993]=C2=A0 ? down_read+0xeb/0x1c0
>>>>>> [=C2=A0=C2=A0 36.070873]=C2=A0 ? down_read_killable+0x1d0/0x1d0
>>>>>> [=C2=A0=C2=A0 36.071409]=C2=A0 populate_vma_page_range+0x96/0xb0
>>>>>> [=C2=A0=C2=A0 36.071955]=C2=A0 __mm_populate+0x128/0x1f0
>>>>>> [=C2=A0=C2=A0 36.072850]=C2=A0 ? populate_vma_page_range+0xb0/0xb0
>>>>>> [=C2=A0=C2=A0 36.073424]=C2=A0 __x64_sys_mlockall+0x215/0x270
>>>>>> [=C2=A0=C2=A0 36.073960]=C2=A0 do_syscall_64+0xb7/0x390
>>>>>> [=C2=A0=C2=A0 36.074435]=C2=A0 entry_SYSCALL_64_after_hwframe+0x44/0=
xa9
>>>>>> [=C2=A0=C2=A0 36.075056] RIP: 0033:0x457729
>>>>>> [=C2=A0=C2=A0 36.075445] Code: 00 f3 c3 66 2e 0f 1f 84 00 00 00 00 0=
0 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4=
c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 2b 84 00 00 c3 66 2e 0f 1f 84 00 00=
 00 00
>>>>>> [=C2=A0=C2=A0 36.077682] RSP: 002b:00007ffedac862c8 EFLAGS: 00000246=
 ORIG_RAX: 0000000000000097
>>>>>> [=C2=A0=C2=A0 36.078591] RAX: ffffffffffffffda RBX: 0000000000000097=
 RCX: 0000000000457729
>>>>>> [=C2=A0=C2=A0 36.079434] RDX: 000000000000fffd RSI: 000000000d0d0d0d=
 RDI: 0000000000000001
>>>>>> [=C2=A0=C2=A0 36.080278] RBP: 00007ffedac86370 R08: 0000c8dc6a7819c3=
 R09: 947ab93afb7ffb80
>>>>>> [=C2=A0=C2=A0 36.081154] R10: 0000000000000038 R11: 0000000000000246=
 R12: 0000000000000002
>>>>>> [=C2=A0=C2=A0 36.082009] R13: 00007f4b65400058 R14: 0000000001057830=
 R15: 00007f4b65400000
>>>>>> [child3:616] Dumped trace to /boot/trace.txt
>>>>>> *** Error in `/bin/trinity': free(): invalid pointer: 0x00000000004b=
77e0 ***
>>>>>> =3D=3D=3D=3D=3D=3D=3D Backtrace: =3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>>>
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # HH:MM RES=
ULT GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
>>>>>> git bisect start 0eb7fc20ae4de315c2379e589ce9f184ff635fce f8788d86ab=
28f61f7b46eb6be375f8a726783636 --
>>>>>> git bisect=C2=A0 bad 7a9a8c69941e1374e2686376b8137dd20b28cdc8=C2=A0 =
# 22:25=C2=A0 B=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0 3=
=C2=A0=C2=A0 19=C2=A0=C2=A0 0=C2=A0 Merge 'linux-review/Gustavo-A-R-Silva/s=
390-Replace-zero-length-array-with-flexible-array-member/20200223-025126' i=
nto devel-hourly-2020022819
>>>>>> git bisect good 6d7ab7e685c4a4f5f3d3199b184f5499f4b02c85=C2=A0 # 23:=
19=C2=A0 G=C2=A0=C2=A0=C2=A0=C2=A0 11=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=
=C2=A0 4=C2=A0=C2=A0 4=C2=A0 Merge 'linux-review/Isaac-J-Manjarres/of-of_re=
served_mem-Increase-limit-on-number-of-reserved-regions/20200225-033755' in=
to devel-hourly-2020022819
>>>>>> git bisect good 66084a0a5eabcfd704f0bbab048cd9126e7c24ab=C2=A0 # 23:=
53=C2=A0 G=C2=A0=C2=A0=C2=A0=C2=A0 11=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=
=C2=A0 2=C2=A0=C2=A0 2=C2=A0 Merge 'linux-review/Zhangfei-Gao/MAINTAINERS-a=
dd-maintainers-for-uacce/20200226-093543' into devel-hourly-2020022819
>>>>>> git bisect good 2c0ff33777d53be39ccd428650598a52b7080a2d=C2=A0 # 01:=
13=C2=A0 G=C2=A0=C2=A0=C2=A0=C2=A0 11=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=
=C2=A0 3=C2=A0=C2=A0 3=C2=A0 Merge 'linux-review/Suman-Anna/Drop-PRUSS-and-=
OMAP4-IPU-DSP-hwmod-data/20200225-072420' into devel-hourly-2020022819
>>>>>> git bisect=C2=A0 bad a346803f887ad079c21179d1fd69586cc2f5147c=C2=A0 =
# 01:36=C2=A0 B=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0 3=
=C2=A0=C2=A0 19=C2=A0=C2=A0 0=C2=A0 Merge 'linux-review/Prarit-Bhargava/x86=
-tsc-Add-kernel-options-to-disable-CPUID-and-MSR-calibrations/20200227-0346=
07' into devel-hourly-2020022819
>>>>>> git bisect=C2=A0 bad 360d08b6abbf3adae740222d62ca8032996019e8=C2=A0 =
# 02:41=C2=A0 B=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0 1=
=C2=A0=C2=A0 17=C2=A0=C2=A0 0=C2=A0 Merge 'linux-review/jack-yu-realtek-com=
/ASoC-rt1015-modify-some-structure-to-be-static/20200227-101356' into devel=
-hourly-2020022819
>>>>>> git bisect good 86faac9834b0e94a3901cc1db4272ae41b11a48e=C2=A0 # 07:=
51=C2=A0 G=C2=A0=C2=A0=C2=A0=C2=A0 10=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=
=C2=A0 5=C2=A0=C2=A0 5=C2=A0 Merge 'linux-review/Anson-Huang/arm64-dts-imx8=
mn-Adjust-1-2GHz-OPP-voltage-to-OD-mode/20200224-101803' into devel-hourly-=
2020022819
>>>>>> git bisect=C2=A0 bad 1776718bda27b7f353dc434e8384fbd7a9b3980d=C2=A0 =
# 08:48=C2=A0 B=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0 2=
=C2=A0=C2=A0 18=C2=A0=C2=A0 0=C2=A0 Merge 'linux-review/Qian-Cai/tick-sched=
-fix-data-races-at-tick_do_timer_cpu/20200225-111352' into devel-hourly-202=
0022819
>>>>>> git bisect=C2=A0 bad 0abbb41ee5a632a0cfaa8a0ee59b4e46c9e8544f=C2=A0 =
# 10:00=C2=A0 B=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0 2=
=C2=A0=C2=A0 18=C2=A0=C2=A0 0=C2=A0 Merge 'alexshi/lrunext' into devel-hour=
ly-2020022819
>>>>>> git bisect=C2=A0 bad b8e71301886b2ad0b0754fbc6884b6a24ac1931b=C2=A0 =
# 10:52=C2=A0 B=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0 1=
=C2=A0=C2=A0 17=C2=A0=C2=A0 0=C2=A0 mm/lru: take PageLRU first in moving pa=
ge between lru lists
>>>>>> git bisect good 602a257cff49bd0349d0dadc1aa4f0393c77457c=C2=A0 # 13:=
15=C2=A0 G=C2=A0=C2=A0=C2=A0=C2=A0 10=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=
=C2=A0 2=C2=A0=C2=A0 2=C2=A0 mm/thp: clean up lru_add_page_tail
>>>>>> git bisect good 2282ec703a69b8c626c8c36fd6a73f3ac95c4206=C2=A0 # 13:=
55=C2=A0 G=C2=A0=C2=A0=C2=A0=C2=A0 10=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=
=C2=A0 5=C2=A0=C2=A0 5=C2=A0 mm/lru: introduce TestClearPageLRU
>>>>>> git bisect=C2=A0 bad acf49bb9284710c28524098098bda22eb1602275=C2=A0 =
# 14:37=C2=A0 B=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0 1=
=C2=A0=C2=A0 17=C2=A0=C2=A0 0=C2=A0 mm/mlock: split ClearPageLRU from page =
isolation and remain Mlocked guard
>>>>>> git bisect good e46563ef83b1583c2f2d54e412222cae5b48bc1d=C2=A0 # 15:=
59=C2=A0 G=C2=A0=C2=A0=C2=A0=C2=A0 10=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=
=C2=A0 2=C2=A0=C2=A0 2=C2=A0 mm/lru: add page isolation precondition in __i=
solate_lru_page
>>>>>> # first bad commit: [acf49bb9284710c28524098098bda22eb1602275] mm/ml=
ock: split ClearPageLRU from page isolation and remain Mlocked guard
>>>>>> git bisect good e46563ef83b1583c2f2d54e412222cae5b48bc1d=C2=A0 # 16:=
05=C2=A0 G=C2=A0=C2=A0=C2=A0=C2=A0 30=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=
=C2=A0 1=C2=A0=C2=A0 3=C2=A0 mm/lru: add page isolation precondition in __i=
solate_lru_page
>>>>>> # extra tests with debug options
>>>>>> git bisect good acf49bb9284710c28524098098bda22eb1602275=C2=A0 # 16:=
50=C2=A0 G=C2=A0=C2=A0=C2=A0=C2=A0 10=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=
 10=C2=A0 10=C2=A0 mm/mlock: split ClearPageLRU from page isolation and rem=
ain Mlocked guard
>>>>>> # extra tests on head commit of alexshi/lrunext
>>>>>> git bisect=C2=A0 bad 4eddfb57a6f7eb0e614389fec3be79bc7b7da65b=C2=A0 =
# 18:32=C2=A0 B=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0 1=
=C2=A0=C2=A0 17=C2=A0=C2=A0 0=C2=A0 mm/memcg: add debug checking in lock_pa=
ge_memcg
>>>>>> # bad: [4eddfb57a6f7eb0e614389fec3be79bc7b7da65b] mm/memcg: add debu=
g checking in lock_page_memcg
>>>>>>
>>>>>> ---
>>>>>> 0-DAY CI Kernel Test Service, Intel Corporation
>>>>>> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org
>>>>>>

--===============0460580829897856750==--

