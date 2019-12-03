Content-Type: multipart/mixed; boundary="===============8824169044300919619=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [efi] 1c5fecb612: WARNING:at_kernel/iomem.c:#memremap
Date: Tue, 03 Dec 2019 16:20:51 +0800
Message-ID: <51a225fa-6775-ed3f-22ff-4c88de6f6db4@intel.com>
In-Reply-To: <CAKv+Gu8MO_85Fa0y7YZ0iEgxrXbfR5-1e37FbiByzP8LrohcYA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8824169044300919619==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 12/2/19 5:41 PM, Ard Biesheuvel wrote:
> On Sun, 1 Dec 2019 at 16:53, kernel test robot <rong.a.chen@intel.com> =
wrote:
>> FYI, we noticed the following commit (built with gcc-7):
>>
>> commit: 1c5fecb61255aa12a16c4c06335ab68979865914 ("efi: Export Runtime C=
onfiguration Interface table to sysfs")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>
>> in testcase: rcutorture
>> with following parameters:
>>
>>          runtime: 300s
>>          test: default
>>          torture_type: tasks
>>
>> test-description: rcutorture is rcutorture kernel module load/unload tes=
t.
>> test-url: https://www.kernel.org/doc/Documentation/RCU/torture.txt
>>
>>
>> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 =
-m 8G
>>
>> caused below changes (please refer to attached dmesg/kmsg for entire log=
/backtrace):
>>
>>
>> +------------------------------------------------+------------+---------=
---+
>> |                                                | 5828efb95b | 1c5fecb6=
12 |
>> +------------------------------------------------+------------+---------=
---+
>> | boot_successes                                 | 0          | 0       =
   |
>> | boot_failures                                  | 4          | 4       =
   |
>> | Kernel_panic-not_syncing:No_working_init_found | 4          | 4       =
   |
>> | WARNING:at_kernel/iomem.c:#memremap            | 0          | 4       =
   |
>> | EIP:memremap                                   | 0          | 4       =
   |
>> +------------------------------------------------+------------+---------=
---+
>>
> I don't understand this result. Doesn't it say the number of failures
> is the same, but it just fails in a different place? Is there a
> working config that breaks due to that commit?

Hi Ard,

The results means all boot are failed, parent commit fails at =

"Kernel_panic-not_syncing:No_working_init_found"
which may causes by the wrong test environment, but the commit =

"1c5fecb612" introduced a new error:
"WARNING:at_kernel/iomem.c:#memremap".

We prepared the reproduce steps and config file in report mail: =

https://lore.kernel.org/lkml/20191201155238.GR18573(a)shao2-debian/

Best Regards,
Rong Chen

>
>
>> If you fix the issue, kindly add following tag
>> Reported-by: kernel test robot <rong.a.chen@intel.com>
>>
>>
>> [   27.829857] WARNING: CPU: 0 PID: 1 at kernel/iomem.c:82 memremap+0x62=
/0x148
>> [   27.832571] Modules linked in:
>> [   27.833528] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G                T=
 5.3.0-rc1-00004-g1c5fecb61255a #2
>> [   27.836364] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BI=
OS 1.10.2-1 04/01/2014
>> [   27.838876] EIP: memremap+0x62/0x148
>> [   27.840028] Code: 89 c7 83 f8 02 75 2a 80 3d bb 47 c8 c1 00 0f 85 bd =
00 00 00 c6 05 bb 47 c8 c1 01 53 8d 45 ec 50 68 78 3c a5 c1 e8 f2 ff f1 ff =
<0f> 0b e9 9d 00 00 00 31 c0 f7 c6 01 00 00 00 74 65 85 ff 74 0f 89
>> [   27.845798] EAX: 0000003f EBX: 0000001e ECX: 00000000 EDX: 30706000
>> [   27.847665] ESI: 00000001 EDI: 00000002 EBP: e9e03f0c ESP: e9e03ee4
>> [   27.849523] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 0001=
0282
>> [   27.851616] CR0: 80050033 CR2: 08056130 CR3: 01db5000 CR4: 000406b0
>> [   27.853465] Call Trace:
>> [   27.853896]  ? kobject_add+0x5b/0x66
>> [   27.854502]  ? map_properties+0x425/0x425
>> [   27.855171]  efi_rci2_sysfs_init+0x1f/0x1e2
>> [   27.855873]  ? map_properties+0x425/0x425
>> [   27.856545]  do_one_initcall+0xa0/0x1cb
>> [   27.857187]  ? parse_args+0xa3/0x28b
>> [   27.857823]  ? trace_initcall_level+0x53/0x6e
>> [   27.858548]  kernel_init_freeable+0x102/0x190
>> [   27.859300]  ? rest_init+0xee/0xee
>> [   27.859887]  kernel_init+0xd/0xdf
>> [   27.860443]  ret_from_fork+0x1e/0x28
>> [   27.861144] ---[ end trace c5c6f0b028e1905c ]---
>>
>>
>> To reproduce:
>>
>>          # build kernel
>>          cd linux
>>          cp config-5.3.0-rc1-00004-g1c5fecb61255a .config
>>          make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Di386 olddefconfig prepare=
 modules_prepare bzImage
>>
>>          git clone https://github.com/intel/lkp-tests.git
>>          cd lkp-tests
>>          bin/lkp qemu -k <bzImage> job-script # job-script is attached i=
n this email
>>
>>
>>
>> Thanks,
>> Rong Chen
>>

--===============8824169044300919619==--

