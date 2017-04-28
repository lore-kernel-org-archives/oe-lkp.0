Content-Type: multipart/mixed; boundary="===============3260338459098898524=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [perf] 924726b2b5: double_fault:#[##]
Date: Fri, 28 Apr 2017 10:44:26 +0800
Message-ID: <20170428024426.GK31795@yexl-desktop>
In-Reply-To: <20170427162527.rrbqykvthgyryg25@breakpoint.cc>
List-Id: <oe-lkp.lists.linux.dev>

--===============3260338459098898524==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 04/27, Sebastian Andrzej Siewior wrote:
>On 2017-04-27 10:58:36 [+0800], kernel test robot wrote:
>> =

>> FYI, we noticed the following commit:
>> =

>> commit: 924726b2b5e5000dfb8eb6032651baed1b1bdc6c ("perf: Cure hotplug lo=
ck ordering issues")
>> https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git smp/hotplug
>
>I can't find that commit in tip so I used
>   14aff62ede39 ("perf: Cure hotplug lock ordering issues")
>
>which should be the same thing.

Yes, git patch-id tells they are the same thing.

>
>> in testcase: boot
>> =

>> on test machine: qemu-system-x86_64 -enable-kvm -smp 2 -m 512M
>
>I booted this. I grabbed the command line the yaml file attached and
>quantal-core-x86_64.cgz from github.
>
>> [  203.023547] mmap: trinity-c0 (2509) uses deprecated remap_file_pages(=
) syscall. See Documentation/vm/remap_file_pages.txt.
>> [child0:2509] uid changed! Was: 0, now 252
>> [child1:2511] child exiting.
>> Bailing main loop. Exit reason: UID changed.
>> [watchdog] [2502] Watchdog exiting
>> [  204.078036] double fault: 0000 [#1] SMP DEBUG_PAGEALLOC
>> [  204.078036] double fault: 0000 [#1] SMP DEBUG_PAGEALLOC
>
>I don't see that.
>

I can't reproduce it either after I rebuilt kernel for commit 14aff62ede39 =
for
6 times test.

>> To reproduce:
>> =

>>         git clone https://github.com/01org/lkp-tests.git
>>         cd lkp-tests
>>         bin/lkp qemu -k <bzImage> job-script  # job-script is attached i=
n this email
>
>I tried that, too. The difference between running qemu manually and this
>seems that the manual approach runs the kernel a few times while this
>aborts after the first run. I attached my manual run. It looks similar
>(including the trinity segfault) but the kernels runs smooth.
>
>You don't seem to inject / load the kernels modules you compile.

Yes, as 0day built a large number of kernel everyday, we won't upload kernel
images and modules to github, it depends user to generate and append it to
initrd.

Thanks,
Xiaolong

>
>> Thanks,
>> Xiaolong
>
>Sebastian



--===============3260338459098898524==--

