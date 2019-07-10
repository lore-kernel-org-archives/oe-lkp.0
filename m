Content-Type: multipart/mixed; boundary="===============5702216619327121621=="
MIME-Version: 1.0
From: Chen, Rong A <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: c522ad0637: kernel hang in boot stage
Date: Wed, 10 Jul 2019 19:56:35 +0800
Message-ID: <83e65fe6-d2ac-65e3-959a-29673a6a5d8f@intel.com>
In-Reply-To: <CF6A88132359CE47947DB4C6E1709ED53C60F1C8@ORSMSX122.amr.corp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5702216619327121621==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Erik,

On 7/10/2019 1:53 AM, Schmauss, Erik wrote:
> Can you give us more information? Which function does it hang on?

It seems the below changes causes the issue.

diff --git a/drivers/acpi/acpica/tbxfload.c b/drivers/acpi/acpica/tbxfload.c
index ef8f8a9f3c9c5..86f1693f6d29a 100644
--- a/drivers/acpi/acpica/tbxfload.c
+++ b/drivers/acpi/acpica/tbxfload.c
@@ -297,15 +297,11 @@ acpi_status acpi_load_table(struct =

acpi_table_header *table)
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D =

acpi_tb_install_and_load_table(ACPI_PTR_TO_PHYSADDR(table),
ACPI_TABLE_ORIGIN_EXTERNAL_VIRTUAL,
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 FALSE, &table_=
index);
-
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ACPI_SUCCESS(status)) {
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 /* Complete the initialization/resolution of package =

objects */

-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 status =3D acpi_ns_walk_namespace(ACPI_TYPE_PACKAGE,
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ACPI_ROOT_OBJECT,
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ACPI_UINT32_MAX, 0,
- acpi_ns_init_one_package,
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL, NULL, NULL);
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 /* Complete the initialization/resolution of new objects */
+
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 acpi_ns_initialize_objects();
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return_ACPI_STATUS(status);


>
> Is this reproducible on every boot?

yes, it always.

Best Regards,
Rong Chen


>
> Thanks,
> Erik
>
>> -----Original Message-----
>> From: Chen, Rong A
>> Sent: Monday, July 8, 2019 11:45 PM
>> To: Schmauss, Erik <erik.schmauss@intel.com>
>> Cc: Moore, Robert <robert.moore@intel.com>; Wysocki, Rafael J
>> <rafael.j.wysocki@intel.com>; LKP <lkp@01.org>
>> Subject: c522ad0637: kernel hang in boot stage
>>
>> FYI, we noticed the following commit (built with gcc-7):
>>
>> commit: c522ad0637cacca1775a3849c2b554f46577b98d ("ACPICA: Update
>> table load object initialization")
>> https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next=
.git
>> master
>>
>> in testcase: fio
>> with following parameters:
>>
>> 	runtime: 300s
>>           disk: 1SSD
>>           fs: ext4
>>           nr_task: 1
>>           test_size: 128G
>>           rw: write
>>           bs: 4k
>>           ioengine: sync
>>           direct: direct
>>
>> test-description: Fio is a tool that will spawn a number of threads or p=
rocesses
>> doing a particular type of I/O action as specified by the user.
>> test-url:https://github.com/axboe/fio
>>
>>
>>
>> on test machine: Intel(R) Xeon(R) Gold 6139 CPU @ 2.30GHz with 128G
>> memory
>>
>> caused below changes (please refer to attached dmesg/kmsg for entire
>> log/backtrace):
>>
>> [    5.408282] smp: Brought up 2 nodes, 72 CPUs
>> [    5.409283] smpboot: Max logical packages: 2
>> [    5.410282] smpboot: Total of 72 processors activated (331375.89 Bogo=
MIPS)
>> [    5.605290] node 0 initialised, 15956993 pages in 192ms
>> [    5.611291] node 1 initialised, 16343433 pages in 198ms
>> [    5.621060] devtmpfs: initialized
>> [    5.621340] x86/mm: Memory block size: 2048MB
>> [    5.622967] PM: Registering ACPI NVS region [mem 0x6b521000-0x6bf50ff=
f]
>> (10682368 bytes)
>> [    5.623599] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffff=
ffff,
>> max_idle_ns: 1911260446275000 ns
>> [    5.624357] futex hash table entries: 32768 (order: 9, 2097152 bytes)
>> [    5.626618] pinctrl core: initialized pinctrl subsystem
>> [    5.627368] PM: RTC time: 06:13:50, date: 2019-07-09
>> [    5.628697] NET: Registered protocol family 16
>> [    5.629457] audit: initializing netlink subsys (disabled)
>> [    5.630299] audit: type=3D2000 audit(1562652826.903:1): state=3Diniti=
alized
>> audit_enabled=3D0 res=3D1
>> [    5.638286] cpuidle: using governor menu
>> [    5.642292] Detected 1 PCC Subspaces
>> [    5.646314] Registering PCC driver as Mailbox controller
>> [    5.651409] ACPI FADT declares the system doesn't support PCIe ASPM, =
so
>> disable it
>> [    5.659283] ACPI: bus type PCI registered
>> [    5.663282] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
>> [    5.669472] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem
>> 0x80000000-0x8fffffff] (base 0x80000000)
>> [    5.679302] PCI: MMCONFIG at [mem 0x80000000-0x8fffffff] reserved in
>> E820
>> [    5.680293] PCI: Using configuration type 1 for base access
>> [    5.685300] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pa=
ges
>> [    5.691283] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pa=
ges
>> [    5.702283] ACPI: Added _OSI(Module Device)
>> [    5.706285] ACPI: Added _OSI(Processor Device)
>> [    5.710282] ACPI: Added _OSI(3.0 _SCP Extensions)
>> [    5.715281] ACPI: Added _OSI(Processor Aggregator Device)
>> [    5.720282] ACPI: Added _OSI(Linux-Dell-Video)
>> [    5.725282] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
>> [    5.730282] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
>> [    5.776862] ACPI: 4 ACPI AML tables successfully acquired and loaded
>> [    5.786441] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
>> [    5.809488] ACPI: Dynamic OEM Table Load:
>> IFWI Version: SE5C620.86B.OR.64.2018.28.1.01.0847.selfboot
>> Primary Bios Version: SE5C620.86B.00.01.0014.070920180847
>> Backup Bios Version: SE5C620.86B.00.01.0014.070920180847
>> System is booting from BIOS Primary Area!
>> BMC Firmware Version: 1.60.56383BEF
>> SDR Version: SDR Package 1.60
>> ME Firmware Version: 04.00.04.340
>> Platform ID: S2600WF
>> System memory detected: 131072 MB
>> Current memory speed: 2666 MT/s
>> Intel(R) Xeon(R) Gold 6139 CPU @ 2.30GHz Number of physical processors
>> identified: 2 AHCI Capable Controller 1 enabling 8 ports of 6Gb/s SATA A=
HCI
>> Capable Controller 2 enabling 6 ports of 6Gb/s SATA
>>
>> USB Keyboard detected
>> USB Mouse detected
>>
>> BMC BaseBoard IP Address 1 : 192.168.3.35 BMC BaseBoard IP Address 2 :
>> 192.168.3.35 BMC Dedicated NIC IP Address : 192.168.3.36
>>
>>
>>             Press [Enter] to directly boot.
>>             Press [F2]    to enter setup and select boot options.
>>             Press [F6]    to show boot menu options.
>>             Press [F12]   to boot from network.
>>
>> Best Regards,
>> Rong Chen

--===============5702216619327121621==--

