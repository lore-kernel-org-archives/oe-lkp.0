Content-Type: multipart/mixed; boundary="===============7031568965051811013=="
MIME-Version: 1.0
From: Li Zhijian <zhijianx.li@intel.com>
To: lkp@lists.01.org
Subject: Re: 28307d938f ("percpu: make pcpu_alloc() aware of current gfp .."): BUG: kernel reboot-without-warning in boot stage
Date: Wed, 03 Jun 2020 11:05:35 +0800
Message-ID: <1527ee5c-4e2f-7b4a-9ba4-b37d5f7c0258@intel.com>
In-Reply-To: <0405917f-dc4f-f32c-0aeb-043742fc4d6e@suse.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7031568965051811013==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 6/2/20 8:18 PM, Filipe Manana wrote:
> On 02/06/20 05:37, Li Zhijian wrote:
>> Hi Filipe,
>>
>> LKP checked blow dmesg as the indicator in this problem
>>
>>>> [=C2=A0=C2=A0=C2=A0 0.144174] RAMDISK: [mem 0x7fa2e000-0x7fffffff]
>>>> [=C2=A0=C2=A0=C2=A0 0.144559] ACPI: Early table checksum verification =
disabled
>>>> [=C2=A0=C2=A0=C2=A0 0.144985] ACPI: RSDP 0x00000000000F5850 000014 (v0=
0 BOCHS )
>>>> [=C2=A0=C2=A0=C2=A0 0.145424] ACPI: RSDT 0x00000000BFFE15C9 000030 (v0=
1 BOCHS
>>>> BXPCRSDT 00000001 BXPC 00000001)
>>>> [=C2=A0=C2=A0=C2=A0 0.146051] ACPI: FACP 0x00000000BFFE149D 000074 (v0=
1 BOCHS
>>>> BXPCFACP 00000001 BXPC 00000001)
>>>> BUG: kernel reboot-without-warning in boot stage
>>>>
>> And i have reproduced it with script in attachment. this issue is gone
>> when i reverted this commit 28307d938f
>>
>> Please note that
>> - i reproduced it with kernel compiled by gcc-5
>> - i failed to reproduce it in kernel compiled by gcc-7 so far
> Odd.

Indeed !

i tested gcc-5 gcc-6 gcc-7, only gcc-5 triggered this issue, kernel =

built with gcc6 and gcc-7 works well

lizhijian(a)shao2-debian:~$ gcc-6 --version
gcc-6 (Debian 6.5.0-2) 6.5.0 20181026
Copyright (C) 2017 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.=C2=A0 There i=
s NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

lizhijian(a)shao2-debian:~$ gcc-5 --version
gcc-5 (Debian 5.5.0-12) 5.5.0 20171010
Copyright (C) 2015 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.=C2=A0 There i=
s NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

lizhijian(a)shao2-debian:~$ gcc-7 --version
gcc-7 (Debian 7.5.0-3) 7.5.0
Copyright (C) 2017 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.=C2=A0 There i=
s NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Thanks
Zhijian

> Here I tested with:
>
> $ gcc --version
> gcc (Debian 6.3.0-18+deb9u1) 6.3.0 20170516
> Copyright (C) 2016 Free Software Foundation, Inc.
>

--===============7031568965051811013==--

