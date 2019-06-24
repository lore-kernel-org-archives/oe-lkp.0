Content-Type: multipart/mixed; boundary="===============3287484833940011350=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [selftests/bpf] 69d96519db: kernel_selftests.bpf.test_socket_cookie.fail
Date: Mon, 24 Jun 2019 08:59:37 +0800
Message-ID: <f3aa0dc2-c959-1166-8b09-84781363f0e0@intel.com>
In-Reply-To: <20190621222745.GH1383@mini-arch>
List-Id: <oe-lkp.lists.linux.dev>

--===============3287484833940011350==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 6/22/19 6:27 AM, Stanislav Fomichev wrote:
> On 06/21, Andrii Nakryiko wrote:
>> )
>>
>> On Fri, Jun 21, 2019 at 9:11 AM Stanislav Fomichev <sdf@fomichev.me> w=
rote:
>>> On 06/21, kernel test robot wrote:
>>>> FYI, we noticed the following commit (built with gcc-7):
>>>>
>>>> commit: 69d96519dbf0bfa1868dc8597d4b9b2cdeb009d7 ("selftests/bpf: conv=
ert socket_cookie test to sk storage")
>>>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>>>>
>>>> in testcase: kernel_selftests
>>>> with following parameters:
>>>>
>>>>        group: kselftests-00
>>>>
>>>> test-description: The kernel contains a set of "self tests" under the =
tools/testing/selftests/ directory. These are intended to be small unit tes=
ts to exercise individual code paths in the kernel.
>>>> test-url: https://www.kernel.org/doc/Documentation/kselftest.txt
>>>>
>>>>
>>>> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp =
2 -m 4G
>>>>
>>>> caused below changes (please refer to attached dmesg/kmsg for entire l=
og/backtrace):
>>>>
>>>>
>>>> If you fix the issue, kindly add following tag
>>>> Reported-by: kernel test robot <rong.a.chen@intel.com>
>>>>
>>>> # selftests: bpf: test_socket_cookie
>>>> # libbpf: failed to create map (name: 'socket_cookies'): Invalid
>>>> # argument
>>> Another case of old clang trying to create a map that depends on BTF?
>>> Should we maybe switch those BTF checks in the kernel to return
>>> EOPNOTSUPP to make it easy to diagnose?
>> For older compilers that don't generate DATASEC/VAR, you'll see a clear =
message:
>>
>> libbpf: DATASEC '.maps' not found.
>>
>> So this must be something else. I just confirmed with clang version
>> 7.0.20180201 that for ./test_socket_cookie that's the first line
>> that's emitted on failure.
> Thanks for checking, I also took a look at the attached kernel_selftests.=
xz,
> here is what it has:
> 2019-06-21 11:58:35 ln -sf /usr/bin/clang-6.0 /usr/bin/clang
> 2019-06-21 11:58:35 ln -sf /usr/bin/llc-6.0 /usr/bin/llc
> ...
> # BTF libbpf test[1] (test_btf_haskv.o): SKIP. No ELF .BTF found
> # BTF libbpf test[2] (test_btf_nokv.o): SKIP. No ELF .BTF found
> ...
> # Test case #0 (btf_dump_test_case_syntax): test_btf_dump_case:71:FAIL
> # failed to load test BTF: -2
> # Test case #1 (btf_dump_test_case_ordering): test_btf_dump_case:71:FAIL
> # failed to load test BTF: -2
> ...
>
> And so on. So there is clearly an old clang that doesn't emit any
> BTF. And I also don't see your recent abd29c931459 before 69d96519dbf0 in
> linux-next, that's why it doesn't complain about missing/corrupt BTF.
>
> We need to convince lkp people to upgrade clang, otherwise, I suppose,
> we'll get more of these reportings after your recent df0b77925982 :-(

Thanks for the clarification, we'll upgrade clang asap.

Best Regards,
Rong Chen


>
>>>> # libbpf: failed to load object './socket_cookie_prog.o'
>>>> # (test_socket_cookie.c:149: errno: Invalid argument) Failed to load
>>>> # ./socket_cookie_prog.o
>>>> # FAILED
>>>> not ok 15 selftests: bpf: test_socket_cookie
>>>>
>>>>
>>>>
>>>>
>>>> To reproduce:
>>>>
>>>>          # build kernel
>>>>        cd linux
>>>>        cp config-5.2.0-rc2-00598-g69d9651 .config
>>>>        make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 olddefconfig
>>>>        make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 prepare
>>>>        make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 modules_prepare
>>>>        make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 SHELL=3D/bin/bash
>>>>        make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 bzImage
>>>>
>>>>
>>>>          git clone https://github.com/intel/lkp-tests.git
>>>>          cd lkp-tests
>>>>          bin/lkp qemu -k <bzImage> job-script # job-script is attached=
 in this email
>>>>
>>>>
>>>>
>>>> Thanks,
>>>> Rong Chen
>>>>
>> <mega snip>

--===============3287484833940011350==--

