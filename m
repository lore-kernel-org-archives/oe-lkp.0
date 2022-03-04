Content-Type: multipart/mixed; boundary="===============1133674701396948580=="
MIME-Version: 1.0
From: Qu Wenruo <quwenruo.btrfs@gmx.com>
To: lkp@lists.01.org
Subject: Re: [btrfs] 3626a285f8: divide_error:#[##]
Date: Fri, 04 Mar 2022 15:26:19 +0800
Message-ID: <dbc84dd2-7e6d-95b0-d7bc-373f897a7063@gmx.com>
In-Reply-To: <20220302084435.GA28137@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============1133674701396948580==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 2022/3/2 16:44, Oliver Sang wrote:
> Hi Qu,
>
> On Tue, Mar 01, 2022 at 03:47:38PM +0800, Qu Wenruo wrote:
>>
>>
>> On 2022/3/1 14:30, kernel test robot wrote:
>>>
>>>
>>> Greeting,
>>>
>>> FYI, we noticed the following commit (built with gcc-9):
>>>
>>> commit: 3626a285f87dceb4ca649d0ef015d7b295206cdf ("btrfs: introduce ded=
icated helper to scrub simple-stripe based range")
>>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>>>
>>> in testcase: xfstests
>>> version: xfstests-x86_64-1de1db8-1_20220217
>>> with following parameters:
>>>
>>> 	disk: 6HDD
>>> 	fs: btrfs
>>> 	test: btrfs-group-07
>>> 	ucode: 0x28
>>>
>>> test-description: xfstests is a regression test suite for xfs and other=
 files ystems.
>>> test-url: git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git
>>>
>>>
>>> on test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4770 CPU @ 3.=
40GHz with 8G memory
>>>
>>> caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):
>>>
>>>
>>>
>>> If you fix the issue, kindly add following tag
>>> Reported-by: kernel test robot <oliver.sang@intel.com>
>>>
>>>
>>> [   65.408303][ T3224] BTRFS info (device sdb2): flagging fs with big m=
etadata feature
>>> [   65.415944][ T3224] BTRFS info (device sdb2): disk space caching is =
enabled
>>> [   65.422842][ T3224] BTRFS info (device sdb2): has skinny extents
>>> [   65.436656][ T3224] BTRFS info (device sdb2): checking UUID tree
>>> [   66.134430][ T3293] BTRFS info (device sdb2): dev_replace from /dev/=
sdb3 (devid 2) to /dev/sdb6 started
>>> [   67.823326][ T3293] divide error: 0000 [#1] SMP KASAN PTI
>>> [   67.828668][ T3293] CPU: 3 PID: 3293 Comm: btrfs Not tainted 5.17.0-=
rc5-00101-g3626a285f87d #1
>>> [   67.837169][ T3293] Hardware name: Dell Inc. OptiPlex 9020/0DNKMN, B=
IOS A05 12/05/2013
>>> [ 67.844982][ T3293] RIP: 0010:scrub_stripe (kbuild/src/consumer/fs/btr=
fs/scrub.c:3448 kbuild/src/consumer/fs/btrfs/scrub.c:3486 kbuild/src/consum=
er/fs/btrfs/scrub.c:3644) btrfs
>>> [ 67.850976][ T3293] Code: 00 00 fc ff df 48 89 f9 48 c1 e9 03 0f b6 0c=
 11 48 89 fa 83 e2 07 83 c2 03 38 ca 7c 08 84 c9 0f 85 27 09 00 00 41 8b 5d=
 1c 99 <f7> fb 48 8b 54 24 30 48 c1 ea 03 48 63 e8 48 b8 00 00 00 00 00 fc
>>> All code
>>
>> This is weird, the code is from simple_stripe_full_stripe_len(), which
>> means the chunk map must be RAID0 or RAID10.
>>
>> In that case, their sub_stripes should be either 1 or 2, why we got 0 th=
ere?
>>
>> In fact, from volumes.c, all sub_stripes is from btrfs_raid_array[],
>> which all have either 1 or 2 sub_stripes.
>>
>>
>> Although the code is old, not the latest version, it should still not
>> cause such problem.
>>
>> Mind to retest with my branch to see if it can be reproduced?
>> https://github.com/adam900710/linux/tree/refactor_scrub
>
> we tested head of this branch:
>    d6e3a8c42f2fad btrfs: scrub: rename scrub_bio::pagev and related membe=
rs
> and:
>    fdad4a9615f180 btrfs: introduce dedicated helper to scrub simple-strip=
e based range
> on this branch.
>
> by attached config.
>
> still reproduce the same issue.
>
> attached dmesgs FYI.

Still failed to reproduce here.

Those btrfs/07[0123] tests are already in scrub/replace group, thus I
ran them almost hourly during the development.


Although there are some ASSERT()s doing extra sanity checks, they should
not affect the result anyway.

Thus I pushed a branch with more explicit BUG_ON()s to catch the
possible divide by zero bugs.
(https://github.com/adam900710/linux/tree/refactor_scrub_testing)

Mind to give it a try?

Thanks,
Qu

>
>
>>
>> Thanks,
>> Qu
>>
>>> =3D=3D=3D=3D=3D=3D=3D=3D
>>>      0:	00 00                	add    %al,(%rax)
>>>      2:	fc                   	cld
>>>      3:	ff                   	(bad)
>>>      4:	df 48 89             	fisttps -0x77(%rax)
>>>      7:	f9                   	stc
>>>      8:	48 c1 e9 03          	shr    $0x3,%rcx
>>>      c:	0f b6 0c 11          	movzbl (%rcx,%rdx,1),%ecx
>>>     10:	48 89 fa             	mov    %rdi,%rdx
>>>     13:	83 e2 07             	and    $0x7,%edx
>>>     16:	83 c2 03             	add    $0x3,%edx
>>>     19:	38 ca                	cmp    %cl,%dl
>>>     1b:	7c 08                	jl     0x25
>>>     1d:	84 c9                	test   %cl,%cl
>>>     1f:	0f 85 27 09 00 00    	jne    0x94c
>>>     25:	41 8b 5d 1c          	mov    0x1c(%r13),%ebx
>>>     29:	99                   	cltd
>>>     2a:*	f7 fb                	idiv   %ebx		<-- trapping instruction
>>>     2c:	48 8b 54 24 30       	mov    0x30(%rsp),%rdx
>>>     31:	48 c1 ea 03          	shr    $0x3,%rdx
>>>     35:	48 63 e8             	movslq %eax,%rbp
>>>     38:	48                   	rex.W
>>>     39:	b8 00 00 00 00       	mov    $0x0,%eax
>>>     3e:	00 fc                	add    %bh,%ah
>>>
>>> Code starting with the faulting instruction
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>      0:	f7 fb                	idiv   %ebx
>>>      2:	48 8b 54 24 30       	mov    0x30(%rsp),%rdx
>>>      7:	48 c1 ea 03          	shr    $0x3,%rdx
>>>      b:	48 63 e8             	movslq %eax,%rbp
>>>      e:	48                   	rex.W
>>>      f:	b8 00 00 00 00       	mov    $0x0,%eax
>>>     14:	00 fc                	add    %bh,%ah
>>> [   67.870187][ T3293] RSP: 0018:ffffc9000a71f450 EFLAGS: 00010246
>>> [   67.876028][ T3293] RAX: 0000000000000004 RBX: 0000000000000000 RCX:=
 0000000000000000
>>> [   67.883756][ T3293] RDX: 0000000000000000 RSI: 0000000000000004 RDI:=
 ffff888129ec6d1c
>>> [   67.891491][ T3293] RBP: ffff8881453682a0 R08: 0000000000000001 R09:=
 0000000000000000
>>> [   67.899230][ T3293] R10: ffff88821534a063 R11: ffffed1042a6940c R12:=
 ffff888121238000
>>> [   67.906955][ T3293] R13: ffff888129ec6d00 R14: ffff888145368000 R15:=
 0000000000000008
>>> [   67.914680][ T3293] FS:  00007f2851eb08c0(0000) GS:ffff8881a6d80000(=
0000) knlGS:0000000000000000
>>> [   67.923351][ T3293] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> [   67.929709][ T3293] CR2: 00007ffea4ff07f8 CR3: 000000010a0fc005 CR4:=
 00000000001706e0
>>> [   67.937437][ T3293] DR0: 0000000000000000 DR1: 0000000000000000 DR2:=
 0000000000000000
>>> [   67.945163][ T3293] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:=
 0000000000000400
>>> [   67.952891][ T3293] Call Trace:
>>> [   67.955992][ T3293]  <TASK>
>>> [ 67.958749][ T3293] ? kasan_save_stack (kbuild/src/consumer/mm/kasan/c=
ommon.c:39)
>>> [ 67.963395][ T3293] ? kasan_set_track (kbuild/src/consumer/mm/kasan/co=
mmon.c:45)
>>> [ 67.967951][ T3293] ? kasan_set_free_info (kbuild/src/consumer/mm/kasa=
n/generic.c:372)
>>> [ 67.972851][ T3293] ? mutex_unlock (kbuild/src/consumer/arch/x86/inclu=
de/asm/atomic64_64.h:190 kbuild/src/consumer/include/linux/atomic/atomic-lo=
ng.h:449 kbuild/src/consumer/include/linux/atomic/atomic-instrumented.h:179=
0 kbuild/src/consumer/kernel/locking/mutex.c:178 kbuild/src/consumer/kernel=
/locking/mutex.c:537)
>>>
>>>
>>> To reproduce:
>>>
>>>           git clone https://github.com/intel/lkp-tests.git
>>>           cd lkp-tests
>>>           sudo bin/lkp install job.yaml           # job file is attache=
d in this email
>>>           bin/lkp split-job --compatible job.yaml # generate the yaml f=
ile for lkp run
>>>           sudo bin/lkp run generated-yaml-file
>>>
>>>           # if come across any failure that blocks the test,
>>>           # please remove ~/.lkp and /lkp dir to run from a clean state.
>>>
>>>
>>>
>>> ---
>>> 0DAY/LKP+ Test Infrastructure                   Open Source Technology =
Center
>>> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel Cor=
poration
>>>
>>> Thanks,
>>> Oliver Sang
>>>
--===============1133674701396948580==--

