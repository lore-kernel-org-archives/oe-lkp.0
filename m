Content-Type: multipart/mixed; boundary="===============1177362933476971680=="
MIME-Version: 1.0
From: Gavin Shan <gshan@redhat.com>
To: lkp@lists.01.org
Subject: Re: [KVM] e923b0537d: kernel-selftests.kvm.rseq_test.fail
Date: Tue, 16 Aug 2022 15:02:46 +1000
Message-ID: <5034abb9-e176-d480-c577-1ec5dd47182b@redhat.com>
In-Reply-To: <Yvq9wzXNF4ZnlCdk@google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1177362933476971680==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Sean,

On 8/16/22 7:42 AM, Sean Christopherson wrote:
> On Mon, Aug 15, 2022, kernel test robot wrote:
>> commit: e923b0537d28e15c9d31ce8b38f810b325816903 ("KVM: selftests: Fix t=
arget thread to be migrated in rseq_test")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> ...
> =

>> # selftests: kvm: rseq_test
>> # =3D=3D=3D=3D Test Assertion Failure =3D=3D=3D=3D
>> #   rseq_test.c:278: i > (NR_TASK_MIGRATIONS / 2)
>> #   pid=3D49599 tid=3D49599 errno=3D4 - Interrupted system call
>> #      1	0x000000000040265d: main at rseq_test.c:278
>> #      2	0x00007fe44eed07fc: ?? ??:0
>> #      3	0x00000000004026d9: _start at ??:?
>> #   Only performed 23174 KVM_RUNs, task stalled too much?
>> #
>> not ok 56 selftests: kvm: rseq_test # exit=3D254
> =

> ...
> =

>> # Automatically generated file; DO NOT EDIT.
>> # Linux/x86_64 5.19.0-rc6 Kernel Configuration
>> #
>> CONFIG_CC_VERSION_TEXT=3D"gcc-11 (Debian 11.3.0-3) 11.3.0"
>> CONFIG_CC_IS_GCC=3Dy
>> CONFIG_GCC_VERSION=3D110300
>> CONFIG_CLANG_VERSION=3D0
>> CONFIG_AS_IS_GNU=3Dy
>> CONFIG_AS_VERSION=3D23800
>> CONFIG_LD_IS_BFD=3Dy
>> CONFIG_LD_VERSION=3D23800
>> CONFIG_LLD_VERSION=3D0
> =

> Assuming 23800 =3D=3D 2.38, this is a known issue.
> =

> https://lore.kernel.org/all/20220810104114.6838-1-gshan(a)redhat.com
> =


It's probably different story this time. The assert is triggered because
of the following instructions. I would guess the reason is vcpu thread
has been running on CPU where we has high CPU load. In this case, the
vcpu thread can't be run in time. More specific, the vcpu thread can't
be run in the 1 - 10us time window, which is specified by the migration
worker (thread).

     TEST_ASSERT(i > (NR_TASK_MIGRATIONS / 2),
                 "Only performed %d KVM_RUNs, task stalled too much?\n", i);

I think we need to improve the handshake mechanism between the vcpu thread
and migration worker. In current implementation, the handshake is done thro=
ugh
the atomic counter. The mechanism is simple enough, but vcpu thread can miss
the aforementioned time window. Another issue is the test case much more ti=
me
than expected to finish.

Sean, if you think it's reasonable, I can figure out something to do:

- Reuse the atomic counter for a full synchronization between these two
   threads. Something like below:

   #define RSEQ_TEST_STATE_RUN_VCPU       0     // vcpu_run()
   #define RSEQ_TEST_STATE_MIGRATE        1     // sched_setaffinity()
   #define RSEQ_TEST_STATE_CHECK          2     // Check rseq.cpu_id and ge=
t_cpu()

   The atomic counter is reset to RSEQ_TEST_STATE_RUN_VCPU after RSEQ_TEST_=
STATE_RUN_VCPU

- Reduce NR_TASK_MIGRATIONS from 100000 to num_of_online_cpus(). With this,
   less time is needed to finish the test case.

Thanks,
Gavin

   =



--===============1177362933476971680==--

