Content-Type: multipart/mixed; boundary="===============5108309769588103485=="
MIME-Version: 1.0
From: Daniel Borkmann <daniel@iogearbox.net>
To: lkp@lists.01.org
Subject: Re: b915ebe6d9: kernel_selftests.bpf.make_fail
Date: Tue, 28 May 2019 15:32:07 +0200
Message-ID: <0a745756-8c20-8c94-e80b-e57115bf57dc@iogearbox.net>
In-Reply-To: <8fe50bd0-82b8-2f7c-48fd-e696b53e6c3b@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5108309769588103485==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 05/28/2019 10:57 AM, Rong Chen wrote:
> On 5/28/19 4:47 PM, Daniel Borkmann wrote:
>> Hi Rong, [+Yonghong]
>>
>> On 05/28/2019 03:31 AM, kernel test robot wrote:
>>> FYI, we noticed the following commit (built with gcc-7):
>>>
>>> commit: b915ebe6d9c8c6b5427e606c0ecee53df921382b ("bpf, selftest: test =
global data/bss/rodata sections")
>>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git=C2=A0 m=
aster
>>>
>>> in testcase: kernel_selftests
>>> with following parameters:
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0group: kselftests-00
>>>
>>> test-description: The kernel contains a set of "self tests" under the t=
ools/testing/selftests/ directory. These are intended to be small unit test=
s to exercise individual code paths in the kernel.
>>> test-url:https://www.kernel.org/doc/Documentation/kselftest.txt
>>>
>>>
>>> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2=
 -m 4G
>>>
>>> caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):
>>>
>>>
>>> If you fix the issue, kindly add following tag
>>> Reported-by: kernel test robot<rong.a.chen@intel.com>
>>>
>>>
>>> 2019-04-12 21:28:33 make run_tests -C bpf
>>> make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-b915e=
be6d9c8c6b5427e606c0ecee53df921382b/tools/testing/selftests/bpf'
>>> make -C ../../../lib/bpf OUTPUT=3D/usr/src/perf_selftests-x86_64-rhel-7=
.6-b915ebe6d9c8c6b5427e606c0ecee53df921382b/tools/testing/selftests/bpf/
>>> make[1]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-b9=
15ebe6d9c8c6b5427e606c0ecee53df921382b/tools/lib/bpf'
>>>
>>> Auto-detecting system features:
>>> ...=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 li=
belf: [ ^[[32mon^[[m=C2=A0 ]
>>> ...=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 bpf: [ ^[[32mon^[[m=C2=A0 ]
>> [...]
>>> llc -march=3Dbpf -mcpu=3Dprobe=C2=A0 -filetype=3Dobj -o /usr/src/perf_s=
elftests-x86_64-rhel-7.6-b915ebe6d9c8c6b5427e606c0ecee53df921382b/tools/tes=
ting/selftests/bpf/test_global_data.o
>>> LLVM ERROR: Unsupported relocation: try to compile with -O2 or above, o=
r check your static variable usage
>>> Makefile:204: recipe for target '/usr/src/perf_selftests-x86_64-rhel-7.=
6-b915ebe6d9c8c6b5427e606c0ecee53df921382b/tools/testing/selftests/bpf/test=
_global_data.o' failed
>>> make: *** [/usr/src/perf_selftests-x86_64-rhel-7.6-b915ebe6d9c8c6b5427e=
606c0ecee53df921382b/tools/testing/selftests/bpf/test_global_data.o] Error 1
>>> make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-b915eb=
e6d9c8c6b5427e606c0ecee53df921382b/tools/testing/selftests/bpf'
>> Looks like your LLVM version is too old for compiling the selftest.
> =

> Hi Daniel,
> =

> We could compile the selftest successfully with llvm-6, but failed with l=
lvm-7 starting from this commit.
> =

> Do you mean we should update llvm?

Yes, you need a LLVM version with this fix included:

  https://github.com/llvm-mirror/llvm/commit/c0db6b6bd444

Probably Yonghong might know better into which official stable release this=
 fix went.

Thanks,
Daniel

--===============5108309769588103485==--

