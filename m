Content-Type: multipart/mixed; boundary="===============2279950734524812549=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [ext4] e2ae766c1b: BUG:sleeping_function_called_from_invalid_context_at_kernel/locking/rwsem.c
Date: Tue, 13 Dec 2016 09:27:51 +0800
Message-ID: <87mvg08voo.fsf@yhuang-dev.intel.com>
In-Reply-To: <20161212163518.GA20728@quack2.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============2279950734524812549==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Jan Kara <jack@suse.cz> writes:

> On Mon 12-12-16 18:13:21, kernel test robot wrote:
>> FYI, we noticed the following commit:
>> =

>> commit: e2ae766c1b030271b5099b25674e2131d1d1e8c1 ("ext4: convert DAX fau=
lts to iomap infrastructure")
>> https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
>> =

>> in testcase: nvml
>> with following parameters:
>> =

>> 	group: vmem
>> 	test: pmem
>> 	nr_pmem: 1
>> 	fs: ext4
>> 	mount_option: dax
>> =

>> =

>> =

>> on test machine: 64 threads Intel(R) Xeon(R) CPU E5-4650 0 @ 2.70GHz wit=
h 64G memory
>> =

>> caused below changes:
>> =

>> =

>> +------------------------------------------------+------------+---------=
---+
>> |                                                | 96f8ba3dd6 | e2ae766c=
1b |
>> +------------------------------------------------+------------+---------=
---+
>> | boot_successes                                 | 2          | 2       =
   |
>> | boot_failures                                  | 2          | 2       =
   |
>> | BUG:kernel_hang_in_test_stage                  | 2          |         =
   |
>> | WARNING:at_fs/sysfs/dir.c:#sysfs_warn_dup      | 0          | 2       =
   |
>> | calltrace:parport_pc_init                      | 0          | 2       =
   |
>> | calltrace:SyS_finit_module                     | 0          | 2       =
   |
>> | WARNING:at_lib/kobject.c:#kobject_add_internal | 0          | 2       =
   |
>> +------------------------------------------------+------------+---------=
---+
>> =

>> =

>> =

>> user  :notice: [  325.592182] vmem_aligned_alloc/TEST1: SETUP (check/pme=
m/debug)
>> =

>> user  :notice: [  325.603973] vmem_aligned_alloc/TEST1: START: vmem_alig=
ned_alloc
>> kern  :err   : [  325.608906] BUG: sleeping function called from invalid=
 context at kernel/locking/rwsem.c:51
>> kern  :err   : [  325.608908] in_atomic(): 1, irqs_disabled(): 0, pid: 2=
4813, name: vmem_aligned_al
>> kern  :warn  : [  325.608914] CPU: 44 PID: 24813 Comm: vmem_aligned_al T=
ainted: G           O    4.9.0-rc4-00045-ge2ae766 #1
>> kern  :warn  : [  325.608916] Hardware name: Intel Corporation LH Pass/S=
4600LH...., BIOS SE5C600.86B.99.02.1047.032320122259 03/23/2012
>> kern  :warn  : [  325.608922]  ffffc9002c1f7be0
>> kern  :warn  : [  325.608923]  ffffffff81466af9
>> kern  :warn  : [  325.608924]  ffff880fea2425c0
>
> I think this is actually a bug introduced by Ross' PMD support. Attached
> patch should fix it. Ross, can you check it please?

Hi, Jan

Could you provide a git tree commit for me to test it?  If you want it
to be tested by 0day.

Best Regards,
Huang, Ying

> 								Honza

--===============2279950734524812549==--

