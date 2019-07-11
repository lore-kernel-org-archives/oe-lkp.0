Content-Type: multipart/mixed; boundary="===============4451346878258452804=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: c522ad0637: kernel hang in boot stage
Date: Thu, 11 Jul 2019 13:19:53 +0800
Message-ID: <7baec3f9-8d65-91ef-fd80-64921aab80cc@intel.com>
In-Reply-To: <CF6A88132359CE47947DB4C6E1709ED53C61089C@ORSMSX122.amr.corp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4451346878258452804==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 7/11/19 5:59 AM, Schmauss, Erik wrote:
> Hi Rong,
>
> Could you try the following patch on top of the kernel that has the hang?


Hi Erik,

The patch can fix kernel hang.

Best Regards,
Rong Chen


>
> Thanks,
> Erik
>
> diff --git a/drivers/acpi/acpica/exconfig.c b/drivers/acpi/acpica/exconfi=
g.c
> index 58c04d706723..46a8baf28bd0 100644
> --- a/drivers/acpi/acpica/exconfig.c
> +++ b/drivers/acpi/acpica/exconfig.c
> @@ -176,7 +176,9 @@ acpi_ex_load_table_op(struct acpi_walk_state *walk_st=
ate,
>
>          /* Complete the initialization/resolution of new objects */
>
> +       acpi_ex_exit_interpreter();
>          acpi_ns_initialize_objects();
> +       acpi_ex_enter_interpreter();
>
>          /* Parameter Data (optional) */
>
>> -----Original Message-----
>> From: Chen, Rong A
>> Sent: Wednesday, July 10, 2019 5:12 AM
>> To: Schmauss, Erik <erik.schmauss@intel.com>
>> Cc: Wysocki, Rafael J <rafael.j.wysocki@intel.com>; LKP <lkp@01.org>=
; Moore,
>> Robert <robert.moore@intel.com>
>> Subject: Re: [LKP] c522ad0637: kernel hang in boot stage
>>
>>
>>
>> On 7/10/2019 7:56 PM, Chen, Rong A wrote:
>>> Hi Erik,
>>>
>>> On 7/10/2019 1:53 AM, Schmauss, Erik wrote:
>>>> Can you give us more information? Which function does it hang on?
>>> It seems the below changes causes the issue.
>>>
>> ...
>> Sorry, please ignore the previous conclusion.
>>
>> I reverted drivers/acpi/acpica/tbxfload.c but the issue is still exist.
>> so the problem part is another file:
>>
>> diff --git a/drivers/acpi/acpica/exconfig.c b/drivers/acpi/acpica/exconf=
ig.c index
>> 587aeeeb5070a..58c04d7067235 100644
>> --- a/drivers/acpi/acpica/exconfig.c
>> +++ b/drivers/acpi/acpica/exconfig.c
>> @@ -174,12 +174,9 @@ acpi_ex_load_table_op(struct acpi_walk_state
>> *walk_state,
>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return_ACPI_STATUS(status);
>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Complete the initialization/res=
olution of package objects */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Complete the initialization/res=
olution of new objects */
>>
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D acpi_ns_walk_namespace(=
ACPI_TYPE_PACKAGE,
>> ACPI_ROOT_OBJECT,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ACPI_UINT32_MAX, 0,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 acpi_ns_init_one_package, NULL, NULL,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NULL);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 acpi_ns_initialize_objects();
>>
>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Parameter Data (optional=
) */
>>
>> @@ -437,12 +434,11 @@ acpi_ex_load_op(union acpi_operand_object
>> *obj_desc,
>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return_ACPI_STATUS(status);
>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Complete the initialization/res=
olution of package objects */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Complete the initialization/res=
olution of new objects */
>>
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D acpi_ns_walk_namespace(=
ACPI_TYPE_PACKAGE,
>> ACPI_ROOT_OBJECT,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ACPI_UINT32_MAX, 0,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 acpi_ns_init_one_package, NULL,
>> NULL,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NULL);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 acpi_ex_exit_interpreter();
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 acpi_ns_initialize_objects();
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 acpi_ex_enter_interpreter();
>>
>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Store the ddb_handle int=
o the Target operand */
>>
>>>> Is this reproducible on every boot?
>>> yes, it always.
>>>
>>> Best Regards,
>>> Rong Chen
>>>
>>>
>>>> Thanks,
>>>> Erik
>>>>
>>>>> -----Original Message-----
>>>>> From: Chen, Rong A
>>>>> Sent: Monday, July 8, 2019 11:45 PM
>>>>> To: Schmauss, Erik <erik.schmauss@intel.com>
>>>>> Cc: Moore, Robert <robert.moore@intel.com>; Wysocki, Rafael J
>>>>> <rafael.j.wysocki@intel.com>; LKP <lkp@01.org>
>>>>> Subject: c522ad0637: kernel hang in boot stage
>>>>>
>>>>> FYI, we noticed the following commit (built with gcc-7):
>>>>>
>>>>> commit: c522ad0637cacca1775a3849c2b554f46577b98d ("ACPICA:
>> Update
>>>>> table load object initialization")
>>>>> https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-
>> next.git
>>>>> master
>>>>>
>>>>> in testcase: fio
>>>>> with following parameters:
>>>>>
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0runtime: 300s
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 disk: 1SSD
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fs: ext4
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nr_task: 1
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test_size: 12=
8G
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rw: write
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bs: 4k
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ioengine: sync
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 direct: direct
>>>>>
>>>>> test-description: Fio is a tool that will spawn a number of threads
>>>>> or processes
>>>>> doing a particular type of I/O action as specified by the user.
>>>>> test-url:https://github.com/axboe/fio
>>>>>
>>>>>
>>>>>
>>>>> on test machine: Intel(R) Xeon(R) Gold 6139 CPU @ 2.30GHz with 128G
>>>>> memory
>>>>>
>>>>> caused below changes (please refer to attached dmesg/kmsg for entire
>>>>> log/backtrace):
>>>>>
>>>>> [=C2=A0=C2=A0=C2=A0 5.408282] smp: Brought up 2 nodes, 72 CPUs
>>>>> [=C2=A0=C2=A0=C2=A0 5.409283] smpboot: Max logical packages: 2
>>>>> [=C2=A0=C2=A0=C2=A0 5.410282] smpboot: Total of 72 processors activat=
ed (331375.89
>>>>> BogoMIPS)
>>>>> [=C2=A0=C2=A0=C2=A0 5.605290] node 0 initialised, 15956993 pages in 1=
92ms
>>>>> [=C2=A0=C2=A0=C2=A0 5.611291] node 1 initialised, 16343433 pages in 1=
98ms
>>>>> [=C2=A0=C2=A0=C2=A0 5.621060] devtmpfs: initialized
>>>>> [=C2=A0=C2=A0=C2=A0 5.621340] x86/mm: Memory block size: 2048MB
>>>>> [=C2=A0=C2=A0=C2=A0 5.622967] PM: Registering ACPI NVS region [mem
>>>>> 0x6b521000-0x6bf50fff]
>>>>> (10682368 bytes)
>>>>> [=C2=A0=C2=A0=C2=A0 5.623599] clocksource: jiffies: mask: 0xffffffff =
max_cycles:
>>>>> 0xffffffff,
>>>>> max_idle_ns: 1911260446275000 ns
>>>>> [=C2=A0=C2=A0=C2=A0 5.624357] futex hash table entries: 32768 (order:=
 9, 2097152
>>>>> bytes)
>>>>> [=C2=A0=C2=A0=C2=A0 5.626618] pinctrl core: initialized pinctrl subsy=
stem
>>>>> [=C2=A0=C2=A0=C2=A0 5.627368] PM: RTC time: 06:13:50, date: 2019-07-09
>>>>> [=C2=A0=C2=A0=C2=A0 5.628697] NET: Registered protocol family 16
>>>>> [=C2=A0=C2=A0=C2=A0 5.629457] audit: initializing netlink subsys (dis=
abled)
>>>>> [=C2=A0=C2=A0=C2=A0 5.630299] audit: type=3D2000 audit(1562652826.903=
:1):
>>>>> state=3Dinitialized
>>>>> audit_enabled=3D0 res=3D1
>>>>> [=C2=A0=C2=A0=C2=A0 5.638286] cpuidle: using governor menu
>>>>> [=C2=A0=C2=A0=C2=A0 5.642292] Detected 1 PCC Subspaces
>>>>> [=C2=A0=C2=A0=C2=A0 5.646314] Registering PCC driver as Mailbox contr=
oller
>>>>> [=C2=A0=C2=A0=C2=A0 5.651409] ACPI FADT declares the system doesn't s=
upport PCIe
>>>>> ASPM, so
>>>>> disable it
>>>>> [=C2=A0=C2=A0=C2=A0 5.659283] ACPI: bus type PCI registered
>>>>> [=C2=A0=C2=A0=C2=A0 5.663282] acpiphp: ACPI Hot Plug PCI Controller D=
river version:
>>>>> 0.5
>>>>> [=C2=A0=C2=A0=C2=A0 5.669472] PCI: MMCONFIG for domain 0000 [bus 00-f=
f] at [mem
>>>>> 0x80000000-0x8fffffff] (base 0x80000000)
>>>>> [=C2=A0=C2=A0=C2=A0 5.679302] PCI: MMCONFIG at [mem 0x80000000-0x8fff=
ffff] reserved in
>>>>> E820
>>>>> [=C2=A0=C2=A0=C2=A0 5.680293] PCI: Using configuration type 1 for bas=
e access
>>>>> [=C2=A0=C2=A0=C2=A0 5.685300] HugeTLB registered 1.00 GiB page size, =
pre-allocated
>>>>> 0 pages
>>>>> [=C2=A0=C2=A0=C2=A0 5.691283] HugeTLB registered 2.00 MiB page size, =
pre-allocated
>>>>> 0 pages
>>>>> [=C2=A0=C2=A0=C2=A0 5.702283] ACPI: Added _OSI(Module Device)
>>>>> [=C2=A0=C2=A0=C2=A0 5.706285] ACPI: Added _OSI(Processor Device)
>>>>> [=C2=A0=C2=A0=C2=A0 5.710282] ACPI: Added _OSI(3.0 _SCP Extensions)
>>>>> [=C2=A0=C2=A0=C2=A0 5.715281] ACPI: Added _OSI(Processor Aggregator D=
evice)
>>>>> [=C2=A0=C2=A0=C2=A0 5.720282] ACPI: Added _OSI(Linux-Dell-Video)
>>>>> [=C2=A0=C2=A0=C2=A0 5.725282] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-A=
udio)
>>>>> [=C2=A0=C2=A0=C2=A0 5.730282] ACPI: Added _OSI(Linux-HPI-Hybrid-Graph=
ics)
>>>>> [=C2=A0=C2=A0=C2=A0 5.776862] ACPI: 4 ACPI AML tables successfully ac=
quired and loaded
>>>>> [=C2=A0=C2=A0=C2=A0 5.786441] ACPI: [Firmware Bug]: BIOS _OSI(Linux) =
query ignored
>>>>> [=C2=A0=C2=A0=C2=A0 5.809488] ACPI: Dynamic OEM Table Load:
>>>>> IFWI Version: SE5C620.86B.OR.64.2018.28.1.01.0847.selfboot
>>>>> Primary Bios Version: SE5C620.86B.00.01.0014.070920180847
>>>>> Backup Bios Version: SE5C620.86B.00.01.0014.070920180847
>>>>> System is booting from BIOS Primary Area!
>>>>> BMC Firmware Version: 1.60.56383BEF
>>>>> SDR Version: SDR Package 1.60
>>>>> ME Firmware Version: 04.00.04.340
>>>>> Platform ID: S2600WF
>>>>> System memory detected: 131072 MB
>>>>> Current memory speed: 2666 MT/s
>>>>> Intel(R) Xeon(R) Gold 6139 CPU @ 2.30GHz Number of physical processors
>>>>> identified: 2 AHCI Capable Controller 1 enabling 8 ports of 6Gb/s
>>>>> SATA AHCI
>>>>> Capable Controller 2 enabling 6 ports of 6Gb/s SATA
>>>>>
>>>>> USB Keyboard detected
>>>>> USB Mouse detected
>>>>>
>>>>> BMC BaseBoard IP Address 1 : 192.168.3.35 BMC BaseBoard IP Address 2 :
>>>>> 192.168.3.35 BMC Dedicated NIC IP Address : 192.168.3.36
>>>>>
>>>>>
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 P=
ress [Enter] to directly boot.
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 P=
ress [F2]=C2=A0=C2=A0=C2=A0 to enter setup and select boot options.
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 P=
ress [F6]=C2=A0=C2=A0=C2=A0 to show boot menu options.
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 P=
ress [F12]=C2=A0=C2=A0 to boot from network.
>>>>>
>>>>> Best Regards,
>>>>> Rong Chen
>>> _______________________________________________
>>> LKP mailing list
>>> LKP(a)lists.01.org
>>> https://lists.01.org/mailman/listinfo/lkp
> _______________________________________________
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp

--===============4451346878258452804==
Content-Type: application/x-xz
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="kmsg.xz"

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
ENO5nLHEZ/sCAAAAAARZWg==
--===============4451346878258452804==--

