Content-Type: multipart/mixed; boundary="===============2043294488074348726=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [acpi] 2e61bac54f: kmsg.acpi_LNXCPU:#f:Failed_to_get_unique_processor_UID(#)
Date: Wed, 08 Mar 2017 14:48:53 +0800
Message-ID: <20170308064853.GA22005@yexl-desktop>
In-Reply-To: <c443f129-0c15-d6b7-1bdd-c16676437a6e@cn.fujitsu.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2043294488074348726==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 03/08, Dou Liyang wrote:
>Hi Ying,
>
>At 03/08/2017 09:03 AM, kernel test robot wrote:
>>FYI, we noticed the following commit:
>>
>>commit: 2e61bac54fad4c018afd23c118bce2399e504020 ("acpi: Move the verific=
ation of duplicate proc_id from booting time to hot-plug time")
>>git://bee.sh.intel.com/git/yexl/linux.git verify-acpi-bug-lkp-hsw-ep2
>>
>>in testcase: boot
>>on test machine: 128 threads 4 Sockets Haswell-EP with 512G memory
>>
>>caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>>
>>
>>kern  :err   : [   11.366678] acpi LNXCPU:20: Failed to get unique proces=
sor _UID (0xff)
>>kern  :err   : [   11.373239] acpi LNXCPU:21: Failed to get unique proces=
sor _UID (0xff)
>>kern  :err   : [   11.379796] acpi LNXCPU:22: Failed to get unique proces=
sor _UID (0xff)
>>kern  :err   : [   11.386349] acpi LNXCPU:23: Failed to get unique proces=
sor _UID (0xff)
>>kern  :err   : [   11.394026] acpi LNXCPU:44: Failed to get unique proces=
sor _UID (0xff)
>>kern  :err   : [   11.400584] acpi LNXCPU:45: Failed to get unique proces=
sor _UID (0xff)
>>kern  :err   : [   11.407141] acpi LNXCPU:46: Failed to get unique proces=
sor _UID (0xff)
>>kern  :err   : [   11.413696] acpi LNXCPU:47: Failed to get unique proces=
sor _UID (0xff)
>>kern  :err   : [   11.421403] acpi LNXCPU:68: Failed to get unique proces=
sor _UID (0xff)
>>kern  :err   : [   11.427963] acpi LNXCPU:69: Failed to get unique proces=
sor _UID (0xff)
>>kern  :err   : [   11.434522] acpi LNXCPU:6a: Failed to get unique proces=
sor _UID (0xff)
>>kern  :err   : [   11.441082] acpi LNXCPU:6b: Failed to get unique proces=
sor _UID (0xff)
>>kern  :err   : [   11.448786] acpi LNXCPU:8c: Failed to get unique proces=
sor _UID (0xff)
>>kern  :err   : [   11.455342] acpi LNXCPU:8d: Failed to get unique proces=
sor _UID (0xff)
>>kern  :err   : [   11.461900] acpi LNXCPU:8e: Failed to get unique proces=
sor _UID (0xff)
>>kern  :err   : [   11.468451] acpi LNXCPU:8f: Failed to get unique proces=
sor _UID (0xff)
>>
>
>These logs in dmesg means there are some processors with the same
>acpi_id 0xff in the DSDT.
>
>As we know, the duplicated processors is forbidden for the DSDT.
>
>So I add this check, and print one line log if we found a duplicated
>processors in the DSDT.

So this is intended behavior, right?

Thanks,
Xiaolong
>
>
>Thanks,
>	Liyang.
>>
>>Thanks,
>>Ying Huang
>>
>>
>
>
>_______________________________________________
>LKP mailing list
>LKP(a)lists.01.org
>https://lists.01.org/mailman/listinfo/lkp

--===============2043294488074348726==--

