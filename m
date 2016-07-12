Content-Type: multipart/mixed; boundary="===============8347967348856349744=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [ACPI / APEI] a3e2acc5e3: kmsg.BERT:Can't_request_iomem_region<#-#>
Date: Tue, 12 Jul 2016 13:48:43 +0800
Message-ID: <20160712054843.GA8962@yexl-desktop>
In-Reply-To: <E9EB2E0F-5635-4550-9761-FD3910828E3C@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8347967348856349744==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 12, 2016 at 09:21:26AM +0800, Luck, Tony wrote:
>Get BIOS version with:
>
># dmidecode   -t  0

Thanks, here is the machine info:

# dmidecode   -t  0
# dmidecode 2.12
SMBIOS 2.7 present.

Handle 0x0000, DMI type 0, 24 bytes
BIOS Information
	Vendor: American Megatrends Inc.
	Version: BWDEXT.86B.000.012.D127
	Release Date: 10/08/2012
	Address: 0xF0000
	Runtime Size: 64 kB
	ROM Size: 8192 kB
	Characteristics:
		PCI is supported
		BIOS is upgradeable
		BIOS shadowing is allowed
		Boot from CD is supported
		Selectable boot is supported
		BIOS ROM is socketed
		EDD is supported
		5.25"/1.2 MB floppy services are supported (int 13h)
		3.5"/720 kB floppy services are supported (int 13h)
		3.5"/2.88 MB floppy services are supported (int 13h)
		Print screen service is supported (int 5h)
		Serial services are supported (int 14h)
		Printer services are supported (int 17h)
		ACPI is supported
		USB legacy is supported
		BIOS boot specification is supported
		Targeted content distribution is supported
		UEFI is supported
	BIOS Revision: 4.6

# acpidump > acpi_data
# acpixtract -a acpi_data =


Intel ACPI Component Architecture
ACPI Binary Table Extraction Utility version 20150204-64 [Mar  2 2015]
Copyright (c) 2000 - 2015 Intel Corporation

Acpi table [APIC] - 114 bytes written to apic.dat
Acpi table [BERT] - 48 bytes written to bert.dat
Acpi table [DSDT] - 18110 bytes written to dsdt.dat
Acpi table [EINJ] - 304 bytes written to einj.dat
Acpi table [FACP] - 244 bytes written to facp.dat
Acpi table [ERST] - 528 bytes written to erst.dat
Acpi table [HEST] - 168 bytes written to hest.dat
Acpi table [HPET] - 56 bytes written to hpet.dat
Acpi table [MCFG] - 60 bytes written to mcfg.dat
Acpi table [SPCR] - 80 bytes written to spcr.dat
Acpi table [FACS] - 64 bytes written to facs1.dat
Acpi table [FACS] - 64 bytes written to facs2.dat
Acpi table [SSDT] - 1657 bytes written to ssdt1.dat
Acpi table [SSDT] - 562 bytes written to ssdt2.dat
Acpi table [SSDT] - 527 bytes written to ssdt3.dat
Acpi table [SSDT] - 701 bytes written to ssdt4.dat
Acpi table [SSDT] - 1707 bytes written to ssdt5.dat
Acpi table [SSDT] - 351 bytes written to ssdt6.dat
Acpi table [SSDT] - 141 bytes written to ssdt7.dat


processor	: 0
vendor_id	: GenuineIntel
cpu family	: 6
model		: 54
model name	: Intel(R) Atom(TM) CPU S1240   @ 1.60GHz
stepping	: 9
microcode	: 0x107
cpu MHz		: 1600.000
cache size	: 512 KB
physical id	: 0
siblings	: 4
core id		: 0
cpu cores	: 2
apicid		: 0
initial apicid	: 0
fpu		: yes
fpu_exception	: yes
cpuid level	: 10
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat =
pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx lm constan=
t_tsc arch_perfmon pebs bts rep_good nopl nonstop_tsc aperfmperf eagerfpu p=
ni dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm movbe lahf_lm tpr=
_shadow vnmi flexpriority dtherm arat
bugs		:
bogomips	: 3200.33
clflush size	: 64
cache_alignment	: 64
address sizes	: 36 bits physical, 48 bits virtual
power management:

processor	: 1
vendor_id	: GenuineIntel
cpu family	: 6
model		: 54
model name	: Intel(R) Atom(TM) CPU S1240   @ 1.60GHz
stepping	: 9
microcode	: 0x107
cpu MHz		: 1600.000
cache size	: 512 KB
physical id	: 0
siblings	: 4
core id		: 0
cpu cores	: 2
apicid		: 1
initial apicid	: 1
fpu		: yes
fpu_exception	: yes
cpuid level	: 10
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat =
pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx lm constan=
t_tsc arch_perfmon pebs bts rep_good nopl nonstop_tsc aperfmperf eagerfpu p=
ni dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm movbe lahf_lm tpr=
_shadow vnmi flexpriority dtherm arat
bugs		:
bogomips	: 3200.01
clflush size	: 64
cache_alignment	: 64
address sizes	: 36 bits physical, 48 bits virtual
power management:

processor	: 2
vendor_id	: GenuineIntel
cpu family	: 6
model		: 54
model name	: Intel(R) Atom(TM) CPU S1240   @ 1.60GHz
stepping	: 9
microcode	: 0x107
cpu MHz		: 1600.000
cache size	: 512 KB
physical id	: 0
siblings	: 4
core id		: 1
cpu cores	: 2
apicid		: 2
initial apicid	: 2
fpu		: yes
fpu_exception	: yes
cpuid level	: 10
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat =
pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx lm constan=
t_tsc arch_perfmon pebs bts rep_good nopl nonstop_tsc aperfmperf eagerfpu p=
ni dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm movbe lahf_lm tpr=
_shadow vnmi flexpriority dtherm arat
bugs		:
bogomips	: 3200.07
clflush size	: 64
cache_alignment	: 64
address sizes	: 36 bits physical, 48 bits virtual
power management:

processor	: 3
vendor_id	: GenuineIntel
cpu family	: 6
model		: 54
model name	: Intel(R) Atom(TM) CPU S1240   @ 1.60GHz
stepping	: 9
microcode	: 0x107
cpu MHz		: 1600.000
cache size	: 512 KB
physical id	: 0
siblings	: 4
core id		: 1
cpu cores	: 2
apicid		: 3
initial apicid	: 3
fpu		: yes
fpu_exception	: yes
cpuid level	: 10
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat =
pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx lm constan=
t_tsc arch_perfmon pebs bts rep_good nopl nonstop_tsc aperfmperf eagerfpu p=
ni dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm movbe lahf_lm tpr=
_shadow vnmi flexpriority dtherm arat
bugs		:
bogomips	: 3200.03
clflush size	: 64
cache_alignment	: 64
address sizes	: 36 bits physical, 48 bits virtual
power management:

MemTotal:        8164976 kB
MemFree:         7537728 kB
MemAvailable:    7958208 kB
Buffers:               0 kB
Cached:           503900 kB
SwapCached:            0 kB
Active:           124392 kB
Inactive:         402504 kB
Active(anon):      23308 kB
Inactive(anon):    16616 kB
Active(file):     101084 kB
Inactive(file):   385888 kB
Unevictable:           0 kB
Mlocked:               0 kB
SwapTotal:             0 kB
SwapFree:              0 kB
Dirty:                 0 kB
Writeback:             0 kB
AnonPages:         23032 kB
Mapped:            17212 kB
Shmem:             16928 kB
Slab:              50812 kB
SReclaimable:      32796 kB
SUnreclaim:        18016 kB
KernelStack:        3472 kB
PageTables:         4216 kB
NFS_Unstable:          0 kB
Bounce:                0 kB
WritebackTmp:          0 kB
CommitLimit:     4082488 kB
Committed_AS:      82560 kB
VmallocTotal:   34359738367 kB
VmallocUsed:           0 kB
VmallocChunk:          0 kB
HardwareCorrupted:     0 kB
AnonHugePages:      4096 kB
HugePages_Total:       0
HugePages_Free:        0
HugePages_Rsvd:        0
HugePages_Surp:        0
Hugepagesize:       2048 kB
DirectMap4k:       63668 kB
DirectMap2M:     8316928 kB
>
>Sent from my iPhone
>
>> On Jul 11, 2016, at 17:54, Ye, Xiaolong <xiaolong.ye@intel.com> wrote:
>> =

>>> On Sun, Jul 10, 2016 at 08:28:37PM -0700, Tony Luck wrote:
>>> I'm very surprised that there was a BERT table on an Atom machine. More=
 details about the machine please. Also BIOS version.
>> =

>> Hi, ying
>> =

>> Could you tell me what's BERT table? and how to check the BIOS version?
>> =

>> Thanks,
>> Xiaolong
>> =

>>> =

>>> Sent from my iPhone
>>> =

>>>> On Jul 10, 2016, at 18:43, kernel test robot <xiaolong.ye@intel.com>=
 wrote:
>>>> =

>>>> =

>>>> FYI, we noticed the following commit:
>>>> =

>>>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git ma=
ster
>>>> commit a3e2acc5e37b22b6808a0b8e46887c3577de9c9e ("ACPI / APEI: Add Boo=
t Error Record Table (BERT) support")
>>>> =

>>>> in testcase: locktorture
>>>> with following parameters: runtime=3D300s
>>>> =

>>>> on test machine: Atom with 8G memory
>>>> =

>>>> caused below changes:
>>>> =

>>>> =

>>>> [   12.317148] BERT: Can't request iomem region <00000000bfccfc18-0000=
0000bfccfc2b>.
>>>> =

>>>> =

>>>> =

>>>> To reproduce:
>>>> =

>>>>       git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-=
tests.git
>>>>       cd lkp-tests
>>>>       bin/lkp install job.yaml  # job file is attached in this email
>>>>       bin/lkp run     job.yaml
>>>> =

>>>> =

>>>> =

>>>> Thanks,
>>>> Xiaolong
>>>> <config-4.7.0-rc4-00003-ga3e2acc>
>>>> <kmsg.xz>
>>>> <job.yaml>

--===============8347967348856349744==--

