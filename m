Content-Type: multipart/mixed; boundary="===============5258135532053073128=="
MIME-Version: 1.0
From: Yujie Liu <yujie.liu@intel.com>
To: lkp@lists.01.org
Subject: Re: [kbuild] b3830bad81: System_halted
Date: Tue, 11 Oct 2022 17:36:11 +0800
Message-ID: <f09f2fb1-ae86-5419-4361-bdd8f8a22e11@intel.com>
In-Reply-To: <CAK7LNASUhDMo72eNge_GvdfbmOkpBCJA88Xw=_V69jcf+_072Q@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5258135532053073128==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/11/2022 03:29, Masahiro Yamada wrote:
> On Sun, Oct 9, 2022 at 10:21 AM kernel test robot <yujie.liu@intel.com>=
 wrote:
>>
>> Greeting,
>>
>> FYI, we noticed the following commit (built with gcc-11):
>>
>> commit: b3830bad81e872632431363853c810c5f652a040 ("[PATCH v3 2/8] kbuild=
: rebuild .vmlinux.export.o when its prerequisite is updated")
>> url: https://github.com/intel-lab-lkp/linux/commits/Masahiro-Yamada/Unif=
y-linux-export-h-and-asm-export-h-remove-EXPORT_DATA_SYMBOL-faster-TRIM_UNU=
SED_KSYMS/20220928-144539
>> base: https://git.kernel.org/cgit/linux/kernel/git/masahiroy/linux-kbuil=
d.git for-next
>> patch link: https://lore.kernel.org/linux-kbuild/20220928063947.299333-3=
-masahiroy(a)kernel.org
>>
>> in testcase: boot
>>
>> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 =
-m 16G
>>
>> caused below changes (please refer to attached dmesg/kmsg for entire log=
/backtrace):
> =

> =

> I think this is a false-positive alarm.
> =

> As I replied before [1], I know my patch set is broken.
> I think 0day bot is testing the patch set I had already retracted.
> =

> I only picked up low-hanging fruits with fixes to my tree,
> and did boot tests.
> =

> Please let me know if linux-next is broken.
> =

> =

> [1] : https://lore.kernel.org/linux-kbuild/CAK7LNATcD6k+R66YFVg_mhe7-FGNc=
0nYaTPuORCcd34Qw3ra2g(a)mail.gmail.com/T/#t
> =


Sorry for this false-positive report.

Thanks for the info, we noticed that this patch has been merged into
linux-next, so we tested below commits:

b9f85101cad33 (tag: next-20221011, linux-next/master) Add linux-next specif=
ic files for 20221011
5d4aeffbf7092 kbuild: rebuild .vmlinux.export.o when its prerequisite is up=
dated

They all passed the boot tests.

--
Best Regards,
Yujie
--===============5258135532053073128==--

