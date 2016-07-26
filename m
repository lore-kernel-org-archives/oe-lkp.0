Content-Type: multipart/mixed; boundary="===============3301396313588831932=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: More information please. Re: [fs] 54cc07a761: BUG: kernel test crashed
Date: Tue, 26 Jul 2016 22:35:45 +0800
Message-ID: <20160726143545.GA23656@wfg-t540p.sh.intel.com>
In-Reply-To: <877fc9a6mb.fsf@x220.int.ebiederm.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============3301396313588831932==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Eric,

Sorry for the delay!

On Mon, Jul 25, 2016 at 01:57:00PM -0500, Eric W. Biederman wrote:
>kernel test robot <xiaolong.ye@intel.com> writes:
>
>> FYI, we noticed the following commit:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace.=
git for-testing
>> commit 54cc07a761deb38318aca64ddf07fc45157c85e0 ("fs: Call d_automount w=
ith the filesystems creds")
>>
>> in testcase: boot
>>
>> on test machine: 1 threads qemu-system-x86_64 -enable-kvm -cpu Westmere =
with 320M memory
>>
>> caused below changes:
>>
>>
>> +-------------------------+------------+------------+
>> |                         | 8175435777 | 54cc07a761 |
>> +-------------------------+------------+------------+
>> | boot_successes          | 102        | 16         |
>> | boot_failures           | 0          | 3          |
>> | BUG:kernel_test_crashed | 0          | 3          |
>> | timestamp.last          | 0          | 54.951425  |
>> +-------------------------+------------+------------+
>>
>>
>>
>> [   19.206454] VFS: Warning: trinity-c0 using old stat() call. Recompile=
 your binary.
>>
>> Elapsed time: 70
>> BUG: kernel test crashed
>
>What application generated the line "BUG: kernel test crashed."
>What flavor of crash was this?

It's a simple boot test with a quick trinity run. So there will be
some randomness in this test.

The "BUG: kernel test crashed" means the VM reboots by itself while
the trinity test is running. If the error message is "BUG: kernel boot
crashed" it'd mean VM abnormally reboots before any test is launched.

>Given the last boot test failure that was reported to me was about 10
>commits after the problem commit I unfortunately can't take it at face
>value that the appropriate commit has been pinpointed.
>
>If you could give me enough information to dig into this that would
>be great.  Otherwise I am going to have to proceed forward on the basis
>that this is a testing robot failure, and that the people who maintain
>the testing robot don't care enough to look after it.

I queued more tests in various KVM instances and find the kernel test
crashes can also happen in the parent commit. So it looks like a false
report. Sorry for the noise!

81754357770ebd90  aeaa4a79ff6a5ed912b7362f20
----------------  --------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
          5:100          0%           5:100   dmesg.BUG:kernel_test_crashed
           :100          1%           1:100   dmesg.Mem-Info
           :100          1%           1:100   dmesg.invoked_oom-killer:gfp_=
mask=3D0x
 =

Regards,
Fengguang

--===============3301396313588831932==--

