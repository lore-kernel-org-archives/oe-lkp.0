Content-Type: multipart/mixed; boundary="===============4337920635568815588=="
MIME-Version: 1.0
From: Chen, Rong A <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: c522ad0637: kernel hang in boot stage
Date: Wed, 10 Jul 2019 20:11:31 +0800
Message-ID: <4a0eeb89-bc72-cae6-ff14-3b2421e0cf80@intel.com>
In-Reply-To: <83e65fe6-d2ac-65e3-959a-29673a6a5d8f@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4337920635568815588==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 7/10/2019 7:56 PM, Chen, Rong A wrote:
> Hi Erik,
>
> On 7/10/2019 1:53 AM, Schmauss, Erik wrote:
>> Can you give us more information? Which function does it hang on?
>
> It seems the below changes causes the issue.
>
...
Sorry, please ignore the previous conclusion.

I reverted drivers/acpi/acpica/tbxfload.c but the issue is still exist. =

so the problem part is another file:

diff --git a/drivers/acpi/acpica/exconfig.c b/drivers/acpi/acpica/exconfig.c
index 587aeeeb5070a..58c04d7067235 100644
--- a/drivers/acpi/acpica/exconfig.c
+++ b/drivers/acpi/acpica/exconfig.c
@@ -174,12 +174,9 @@ acpi_ex_load_table_op(struct acpi_walk_state =

*walk_state,
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 return_ACPI_STATUS(status);
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }

-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Complete the initialization/resolu=
tion of package objects */
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Complete the initialization/resolu=
tion of new objects */

-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D acpi_ns_walk_namespace(ACP=
I_TYPE_PACKAGE, ACPI_ROOT_OBJECT,
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ACPI_UINT32_MAX, 0,
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 acpi_ns_init_one_package, NULL, =

NULL,
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 NULL);
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 acpi_ns_initialize_objects();

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Parameter Data (optional) */

@@ -437,12 +434,11 @@ acpi_ex_load_op(union acpi_operand_object *obj_desc,
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 return_ACPI_STATUS(status);
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }

-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Complete the initialization/resolu=
tion of package objects */
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Complete the initialization/resolu=
tion of new objects */

-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D acpi_ns_walk_namespace(ACP=
I_TYPE_PACKAGE, ACPI_ROOT_OBJECT,
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ACPI_UINT32_MAX, 0,
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 acpi_ns_init_one_package, NULL, =

NULL,
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 NULL);
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 acpi_ex_exit_interpreter();
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 acpi_ns_initialize_objects();
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 acpi_ex_enter_interpreter();

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Store the ddb_handle into th=
e Target operand */

>
>>
>> Is this reproducible on every boot?
>
> yes, it always.
>
> Best Regards,
> Rong Chen
>
>
>>
>> Thanks,
>> Erik
>>
>>> -----Original Message-----
>>> From: Chen, Rong A
>>> Sent: Monday, July 8, 2019 11:45 PM
>>> To: Schmauss, Erik <erik.schmauss@intel.com>
>>> Cc: Moore, Robert <robert.moore@intel.com>; Wysocki, Rafael J
>>> <rafael.j.wysocki@intel.com>; LKP <lkp@01.org>
>>> Subject: c522ad0637: kernel hang in boot stage
>>>
>>> FYI, we noticed the following commit (built with gcc-7):
>>>
>>> commit: c522ad0637cacca1775a3849c2b554f46577b98d ("ACPICA: Update
>>> table load object initialization")
>>> https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-nex=
t.git =

>>>
>>> master
>>>
>>> in testcase: fio
>>> with following parameters:
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0runtime: 300s
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 disk: 1SSD
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fs: ext4
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nr_task: 1
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test_size: 128G
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rw: write
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bs: 4k
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ioengine: sync
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 direct: direct
>>>
>>> test-description: Fio is a tool that will spawn a number of threads =

>>> or processes
>>> doing a particular type of I/O action as specified by the user.
>>> test-url:https://github.com/axboe/fio
>>>
>>>
>>>
>>> on test machine: Intel(R) Xeon(R) Gold 6139 CPU @ 2.30GHz with 128G
>>> memory
>>>
>>> caused below changes (please refer to attached dmesg/kmsg for entire
>>> log/backtrace):
>>>
>>> [=C2=A0=C2=A0=C2=A0 5.408282] smp: Brought up 2 nodes, 72 CPUs
>>> [=C2=A0=C2=A0=C2=A0 5.409283] smpboot: Max logical packages: 2
>>> [=C2=A0=C2=A0=C2=A0 5.410282] smpboot: Total of 72 processors activated=
 (331375.89 =

>>> BogoMIPS)
>>> [=C2=A0=C2=A0=C2=A0 5.605290] node 0 initialised, 15956993 pages in 192=
ms
>>> [=C2=A0=C2=A0=C2=A0 5.611291] node 1 initialised, 16343433 pages in 198=
ms
>>> [=C2=A0=C2=A0=C2=A0 5.621060] devtmpfs: initialized
>>> [=C2=A0=C2=A0=C2=A0 5.621340] x86/mm: Memory block size: 2048MB
>>> [=C2=A0=C2=A0=C2=A0 5.622967] PM: Registering ACPI NVS region [mem =

>>> 0x6b521000-0x6bf50fff]
>>> (10682368 bytes)
>>> [=C2=A0=C2=A0=C2=A0 5.623599] clocksource: jiffies: mask: 0xffffffff ma=
x_cycles: =

>>> 0xffffffff,
>>> max_idle_ns: 1911260446275000 ns
>>> [=C2=A0=C2=A0=C2=A0 5.624357] futex hash table entries: 32768 (order: 9=
, 2097152 =

>>> bytes)
>>> [=C2=A0=C2=A0=C2=A0 5.626618] pinctrl core: initialized pinctrl subsyst=
em
>>> [=C2=A0=C2=A0=C2=A0 5.627368] PM: RTC time: 06:13:50, date: 2019-07-09
>>> [=C2=A0=C2=A0=C2=A0 5.628697] NET: Registered protocol family 16
>>> [=C2=A0=C2=A0=C2=A0 5.629457] audit: initializing netlink subsys (disab=
led)
>>> [=C2=A0=C2=A0=C2=A0 5.630299] audit: type=3D2000 audit(1562652826.903:1=
): =

>>> state=3Dinitialized
>>> audit_enabled=3D0 res=3D1
>>> [=C2=A0=C2=A0=C2=A0 5.638286] cpuidle: using governor menu
>>> [=C2=A0=C2=A0=C2=A0 5.642292] Detected 1 PCC Subspaces
>>> [=C2=A0=C2=A0=C2=A0 5.646314] Registering PCC driver as Mailbox control=
ler
>>> [=C2=A0=C2=A0=C2=A0 5.651409] ACPI FADT declares the system doesn't sup=
port PCIe =

>>> ASPM, so
>>> disable it
>>> [=C2=A0=C2=A0=C2=A0 5.659283] ACPI: bus type PCI registered
>>> [=C2=A0=C2=A0=C2=A0 5.663282] acpiphp: ACPI Hot Plug PCI Controller Dri=
ver version: =

>>> 0.5
>>> [=C2=A0=C2=A0=C2=A0 5.669472] PCI: MMCONFIG for domain 0000 [bus 00-ff]=
 at [mem
>>> 0x80000000-0x8fffffff] (base 0x80000000)
>>> [=C2=A0=C2=A0=C2=A0 5.679302] PCI: MMCONFIG at [mem 0x80000000-0x8fffff=
ff] reserved in
>>> E820
>>> [=C2=A0=C2=A0=C2=A0 5.680293] PCI: Using configuration type 1 for base =
access
>>> [=C2=A0=C2=A0=C2=A0 5.685300] HugeTLB registered 1.00 GiB page size, pr=
e-allocated =

>>> 0 pages
>>> [=C2=A0=C2=A0=C2=A0 5.691283] HugeTLB registered 2.00 MiB page size, pr=
e-allocated =

>>> 0 pages
>>> [=C2=A0=C2=A0=C2=A0 5.702283] ACPI: Added _OSI(Module Device)
>>> [=C2=A0=C2=A0=C2=A0 5.706285] ACPI: Added _OSI(Processor Device)
>>> [=C2=A0=C2=A0=C2=A0 5.710282] ACPI: Added _OSI(3.0 _SCP Extensions)
>>> [=C2=A0=C2=A0=C2=A0 5.715281] ACPI: Added _OSI(Processor Aggregator Dev=
ice)
>>> [=C2=A0=C2=A0=C2=A0 5.720282] ACPI: Added _OSI(Linux-Dell-Video)
>>> [=C2=A0=C2=A0=C2=A0 5.725282] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Aud=
io)
>>> [=C2=A0=C2=A0=C2=A0 5.730282] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphic=
s)
>>> [=C2=A0=C2=A0=C2=A0 5.776862] ACPI: 4 ACPI AML tables successfully acqu=
ired and loaded
>>> [=C2=A0=C2=A0=C2=A0 5.786441] ACPI: [Firmware Bug]: BIOS _OSI(Linux) qu=
ery ignored
>>> [=C2=A0=C2=A0=C2=A0 5.809488] ACPI: Dynamic OEM Table Load:
>>> IFWI Version: SE5C620.86B.OR.64.2018.28.1.01.0847.selfboot
>>> Primary Bios Version: SE5C620.86B.00.01.0014.070920180847
>>> Backup Bios Version: SE5C620.86B.00.01.0014.070920180847
>>> System is booting from BIOS Primary Area!
>>> BMC Firmware Version: 1.60.56383BEF
>>> SDR Version: SDR Package 1.60
>>> ME Firmware Version: 04.00.04.340
>>> Platform ID: S2600WF
>>> System memory detected: 131072 MB
>>> Current memory speed: 2666 MT/s
>>> Intel(R) Xeon(R) Gold 6139 CPU @ 2.30GHz Number of physical processors
>>> identified: 2 AHCI Capable Controller 1 enabling 8 ports of 6Gb/s =

>>> SATA AHCI
>>> Capable Controller 2 enabling 6 ports of 6Gb/s SATA
>>>
>>> USB Keyboard detected
>>> USB Mouse detected
>>>
>>> BMC BaseBoard IP Address 1 : 192.168.3.35 BMC BaseBoard IP Address 2 :
>>> 192.168.3.35 BMC Dedicated NIC IP Address : 192.168.3.36
>>>
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Pres=
s [Enter] to directly boot.
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Pres=
s [F2]=C2=A0=C2=A0=C2=A0 to enter setup and select boot options.
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Pres=
s [F6]=C2=A0=C2=A0=C2=A0 to show boot menu options.
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Pres=
s [F12]=C2=A0=C2=A0 to boot from network.
>>>
>>> Best Regards,
>>> Rong Chen
> _______________________________________________
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp


--===============4337920635568815588==--

