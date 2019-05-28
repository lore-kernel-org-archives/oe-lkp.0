Content-Type: multipart/mixed; boundary="===============5721407129878623777=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: b915ebe6d9: kernel_selftests.bpf.make_fail
Date: Tue, 28 May 2019 16:57:58 +0800
Message-ID: <8fe50bd0-82b8-2f7c-48fd-e696b53e6c3b@intel.com>
In-Reply-To: <e1a656ef-f83b-c4f5-eb54-b4e296b1da08@iogearbox.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============5721407129878623777==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On 5/28/19 4:47 PM, Daniel Borkmann wrote:
> Hi Rong, [+Yonghong]
>
> On 05/28/2019 03:31 AM, kernel test robot wrote:
>> FYI, we noticed the following commit (built with gcc-7):
>>
>> commit: b915ebe6d9c8c6b5427e606c0ecee53df921382b ("bpf, selftest: test g=
lobal data/bss/rodata sections")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git=C2=A0 ma=
ster
>>
>> in testcase: kernel_selftests
>> with following parameters:
>>
>>  =C2=A0=C2=A0=C2=A0=C2=A0group: kselftests-00
>>
>> test-description: The kernel contains a set of "self tests" under the to=
ols/testing/selftests/ directory. These are intended to be small unit tests=
 to exercise individual code paths in the kernel.
>> test-url:https://www.kernel.org/doc/Documentation/kselftest.txt
>>
>>
>> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 =
-m 4G
>>
>> caused below changes (please refer to attached dmesg/kmsg for entire log=
/backtrace):
>>
>>
>> If you fix the issue, kindly add following tag
>> Reported-by: kernel test robot<rong.a.chen@intel.com>
>>
>>
>> 2019-04-12 21:28:33 make run_tests -C bpf
>> make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-b915eb=
e6d9c8c6b5427e606c0ecee53df921382b/tools/testing/selftests/bpf'
>> make -C ../../../lib/bpf OUTPUT=3D/usr/src/perf_selftests-x86_64-rhel-7.=
6-b915ebe6d9c8c6b5427e606c0ecee53df921382b/tools/testing/selftests/bpf/
>> make[1]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-b91=
5ebe6d9c8c6b5427e606c0ecee53df921382b/tools/lib/bpf'
>>
>> Auto-detecting system features:
>> ...=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libel=
f: [ ^[[32mon^[[m=C2=A0 ]
>> ...=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 bpf: [ ^[[32mon^[[m=C2=A0 ]
> [...]
>> llc -march=3Dbpf -mcpu=3Dprobe=C2=A0 -filetype=3Dobj -o /usr/src/perf_se=
lftests-x86_64-rhel-7.6-b915ebe6d9c8c6b5427e606c0ecee53df921382b/tools/test=
ing/selftests/bpf/test_global_data.o
>> LLVM ERROR: Unsupported relocation: try to compile with -O2 or above, or=
 check your static variable usage
>> Makefile:204: recipe for target '/usr/src/perf_selftests-x86_64-rhel-7.6=
-b915ebe6d9c8c6b5427e606c0ecee53df921382b/tools/testing/selftests/bpf/test_=
global_data.o' failed
>> make: *** [/usr/src/perf_selftests-x86_64-rhel-7.6-b915ebe6d9c8c6b5427e6=
06c0ecee53df921382b/tools/testing/selftests/bpf/test_global_data.o] Error 1
>> make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-b915ebe=
6d9c8c6b5427e606c0ecee53df921382b/tools/testing/selftests/bpf'
> Looks like your LLVM version is too old for compiling the selftest.

Hi Daniel,

We could compile the selftest successfully with llvm-6, but failed with =

llvm-7 starting from this commit.

Do you mean we should update llvm?

Best Regards,
Rong Chen


>
> Thanks,
> Daniel

--===============5721407129878623777==--

