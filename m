Content-Type: multipart/mixed; boundary="===============8854078323200336810=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [fs, elf] 4ed2863951: 32bit.hugetlb_minimal_copy=no_xb_linkhuge.killed_by_signal
Date: Tue, 28 Aug 2018 16:55:50 +0800
Message-ID: <4ac692fa-22ea-c0e4-5a59-02ce49fbc299@intel.com>
In-Reply-To: <20180824091156.GF29735@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============8854078323200336810==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 08/24/2018 05:11 PM, Michal Hocko wrote:
> On Fri 24-08-18 15:29:00, Rong Chen wrote:
>> FYI, we noticed the following commit (built with gcc-7):
>>
>> commit 4ed28639519c7bad5f518e70b3284c6e0763e650 ("fs, elf: drop MAP_FIXED
>> usage from elf_map")
>> git://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git
>> tags/next-20180412~2^2~67
>>
>> in testcase: libhugetlbfs-test
>> with following parameters:
>>
>>  =C2=A0=C2=A0=C2=A0 pagesize: 2MB
>>  =C2=A0=C2=A0=C2=A0 pagenum: 32
>>
>> on test machine: 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz wi=
th
>> 64G memory
>>
>> caused below changes (please refer to attached dmesg/kmsg for entire
>> log/backtrace):
> So the log says
> kern  :info  : [   61.148875] 3691 (xB.linkhuge): Uhuuh, elf segment at 0=
0000000edee789a requested but the memory is mapped already
> kern  :info  : [   61.184587] 3700 (xB.linkhuge): Uhuuh, elf segment at 0=
0000000edee789a requested but the memory is mapped already
> kern  :info  : [   61.216521] 3704 (xB.linkshare): Uhuuh, elf segment at =
000000006da4f715 requested but the memory is mapped already
> kern  :info  : [   61.269555] 3725 (xB.linkshare): Uhuuh, elf segment at =
000000006da4f715 requested but the memory is mapped already
>
> This means that the linker has tried to map over an already existing
> mapping. This is usually bad. Why is it legitimate in this case? What
> does xB.linkhuge resp. xB.linkshare try to do?
I'm sorry I'm not familiar with the testcase.
Maybe you can get help from https://github.com/libhugetlbfs/libhugetlbfs

Best Regards,
Rong Chen



--===============8854078323200336810==--

