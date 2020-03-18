Content-Type: multipart/mixed; boundary="===============0375989353328993199=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [sched/numa] f6183ef98b: phoronix-test-suite.aom-av1.0.frames_per_second -25.0% regression
Date: Wed, 18 Mar 2020 16:43:40 +0800
Message-ID: <74027441-8ae2-044e-7cdb-74be5e3e0ab2@intel.com>
In-Reply-To: <20200305123918.GR3818@techsingularity.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============0375989353328993199==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 3/5/20 8:39 PM, Mel Gorman wrote:
> On Thu, Mar 05, 2020 at 07:15:40PM +0800, Chen, Rong A wrote:
>>
>> On 3/5/2020 6:12 PM, Mel Gorman wrote:
>>> On Thu, Mar 05, 2020 at 10:58:22AM +0800, Rong Chen wrote:
>>>> Hi,
>>>>
>>>> I tested on branch tip/sched/core, the regression is still there.
>>>>
>>>>
>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase/ucod=
e:
>>>>     gcc-7/performance/x86_64-rhel-7.6/debian-x86_64-phoronix/lkp-nhm-2=
ep1/aom-av1-1.2.0/phoronix-test-suite/0x1d
>>>>
>>>> commit:
>>>>     6d4d22468dae3d8757af9f8b81b848a76ef4409d ("sched/fair: Reorder enq=
ueue/dequeue_task_fair path")
>>>>     6499b1b2dd1b8d404a16b9fbbf1af6b9b3c1d83d ("sched/numa: Replace run=
nable_load_avg by load_avg")
>>>>     253e2b69ef8fda4d9345ff496b12058faaeeff6b ("sched/fair: fix statist=
ics for find_idlest_group()")
>>>>
>>> Are you sure? I ask because tip/sched/core does not have the
>>> patch "sched/fair: fix statistics for find_idlest_group" in it
>>> nor is commit 253e2b69ef8fda4d9345ff496b12058faaeeff6b part of the
>>> tip/sched/core history. You'd need to test the full series in the curre=
nt
>>> tip/sched/core with minimally 289de3598481 ("sched/fair: Fix statistics
>>> for find_idlest_group()") from tip/sched/urgent on top. That's still
>>> missing two fixes but one is a build issue and the other is a missing
>>> rcu_read_lock that is unlikely to cause corruption unless there is a
>>> hotplug event during the test.
>> Yes, commit 6d4d22468dae3=C2=A0 is not from tip/sched/core, I created it=
 based on
>> tip/sched/core.
>>
> Understood.
>
>> $ git log --oneline 6d4d22468dae3d8757af9f8b81b848a76ef4409d~..253e2b69e=
f8fda4d9345ff496b12058faaeeff6b
>> 253e2b69ef8fd sched/fair: fix statistics for find_idlest_group()
>> a0f03b617c3b2 sched/numa: Stop an exhastive search if a reasonable swap
>> candidate or idle CPU is found
>> 88cca72c9673e sched/numa: Bias swapping tasks based on their preferred n=
ode
>> 5fb52dd93a2fe sched/numa: Find an alternative idle CPU if the CPU is par=
t of
>> an active NUMA balance
>> ff7db0bf24db9 sched/numa: Prefer using an idle CPU as a migration target
>> instead of comparing tasks
>> 070f5e860ee2b sched/fair: Take into account runnable_avg to classify gro=
up
>> 9f68395333ad7 sched/pelt: Add a new runnable average signal
>> 0dacee1bfa70e sched/pelt: Remove unused runnable load average
>> fb86f5b211924 sched/numa: Use similar logic to the load balancer for mov=
ing
>> between domains with spare capacity
>> 6499b1b2dd1b8 sched/numa: Replace runnable_load_avg by load_avg
>> 6d4d22468dae3 sched/fair: Reorder enqueue/dequeue_task_fair path
>>
> Excellent. Now in your previous mail, the regression was reported based
> on
>
> commit:
>    6d4d22468dae3d8757af9f8b81b848a76ef4409d ("sched/fair: Reorder enqueue=
/dequeue_task_fair path")
>    6499b1b2dd1b8d404a16b9fbbf1af6b9b3c1d83d ("sched/numa: Replace runnabl=
e_load_avg by load_avg")
>    253e2b69ef8fda4d9345ff496b12058faaeeff6b ("sched/fair: fix statistics =
for find_idlest_group()")
>
> Can you confirm whether the report is based on just those commits or the
> entire series? If it's not the entire series, can you give me the report
> for the full series please? We know for a fact that this series is not
> bisection safe in terms of performance.

Hi,

Sorry for the late, yes the report is based on the entire series, the =

result of head commit is 0.03:

commit:
 =C2=A0 a0f03b617c3b2644d3d47bf7d9e60aed01bd5b10 ("sched/numa: Stop an =

exhastive search if a reasonable swap candidate or idle CPU is found")

$ ag -A9 phoronix-test-suite.aom-av1.0.frames_per_second =

/result/phoronix-test-suite/performance-aom-av1-1.2.0-ucode=3D0x1d/lkp-nhm-=
2ep1/debian-x86_64-phoronix/x86_64-rhel-7.6/gcc-7/a0f03b617c3b2644d3d47bf7d=
9e60aed01bd5b10/matrix.json
2:=C2=A0 "phoronix-test-suite.aom-av1.0.frames_per_second": [
3-=C2=A0=C2=A0=C2=A0 0.03,
4-=C2=A0=C2=A0=C2=A0 0.03,
5-=C2=A0=C2=A0=C2=A0 0.03,
6-=C2=A0=C2=A0=C2=A0 0.03,
7-=C2=A0=C2=A0=C2=A0 0.03,
8-=C2=A0=C2=A0=C2=A0 0.03,
9-=C2=A0=C2=A0=C2=A0 0.03,
10-=C2=A0=C2=A0=C2=A0 0.03
11-=C2=A0 ],


>
>>> Also, can you tell me more about the hardware? The stats indicate it's =
NUMA
>>> but it only has 16 threads which seems very low for a modern NUMA machi=
ne.
>>>
>> root(a)lkp-nhm-2ep1:~# lscpu
>> Architecture:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 x86_=
64
>> CPU op-mode(s):=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32-bit, 64-bit
>> Byte Order:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Little Endian
>> CPU(s):=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 16
>> On-line CPU(s) list:=C2=A0=C2=A0 0-15
>> Thread(s) per core:=C2=A0=C2=A0=C2=A0 2
>> Core(s) per socket:=C2=A0=C2=A0=C2=A0 4
>> Socket(s):=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 2
>> NUMA node(s):=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2
>> Vendor ID:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 GenuineIntel
>> CPU family:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 6
>> Model:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 26
>> Model name:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Intel(R) Xeon(R) CPU=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 X5570=C2=A0 @ 2.93GHz
>> Stepping:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 5
>> CPU MHz:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 1655.106
>> CPU max MHz:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 2927.0000
>> CPU min MHz:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 1596.0000
>> BogoMIPS:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 5852.83
>> Virtualization:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VT-x
>> L1d cache:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 32K
>> L1i cache:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 32K
>> L2 cache:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 256K
>> L3 cache:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 8192K
>> NUMA node0 CPU(s):=C2=A0=C2=A0=C2=A0=C2=A0 0,2,4,6,8,10,12,14
>> NUMA node1 CPU(s):=C2=A0=C2=A0=C2=A0=C2=A0 1,3,5,7,9,11,13,15
>> Flags:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fpu vme de pse tsc msr pae mce cx8 apic sep =
mtrr pge
>> mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ht tm pbe syscall =
nx
>> rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology
>> nonstop_tsc cpuid aperfmperf pni dtes64 monitor ds_cpl vmx est tm2 ssse3
>> cx16 xtpr pdcm dca sse4_1 sse4_2 popcnt lahf_lm pti ssbd ibrs ibpb stibp
>> tpr_shadow vnmi flexpriority ept vpid dtherm ida flush_l1d
>>
> Ok, that makes some sense. It's an 11 year old Nehalem machine that is
> no longer manufactured. No wonder I did not catch anything on my own
> tests.
>
> Can you tell me if this regression is machine-specific or are you seeing
> it on a range of machines, particularly newer ones?
>

I tested on a Cascade Lake machine and doesn't see the regression.
As you'd expect, it's machine-specific.

Best Regards,
Rong Chen

--===============0375989353328993199==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRl
bnQ9InRleHQvaHRtbDsKICAgICAgY2hhcnNldD1JU08tODg1OS0xNSI+CiAgPC9oZWFkPgogIDxi
b2R5IHRleHQ9IiMwMDAwMDAiIGJnY29sb3I9IiNGRkZGRkYiPgogICAgPGJyPgogICAgPGJyPgog
ICAgPGRpdiBjbGFzcz0ibW96LWNpdGUtcHJlZml4Ij5PbiAzLzUvMjAgODozOSBQTSwgTWVsIEdv
cm1hbiB3cm90ZTo8YnI+CiAgICA8L2Rpdj4KICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiCiAg
ICAgIGNpdGU9Im1pZDoyMDIwMDMwNTEyMzkxOC5HUjM4MThAdGVjaHNpbmd1bGFyaXR5Lm5ldCI+
CiAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+T24gVGh1LCBNYXIgMDUs
IDIwMjAgYXQgMDc6MTU6NDBQTSArMDgwMCwgQ2hlbiwgUm9uZyBBIHdyb3RlOgo8L3ByZT4KICAg
ICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+CiAgICAgICAgPHByZSBjbGFzcz0ibW96LXF1b3Rl
LXByZSIgd3JhcD0iIj4KCk9uIDMvNS8yMDIwIDY6MTIgUE0sIE1lbCBHb3JtYW4gd3JvdGU6Cjwv
cHJlPgogICAgICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPgogICAgICAgICAgPHByZSBjbGFz
cz0ibW96LXF1b3RlLXByZSIgd3JhcD0iIj5PbiBUaHUsIE1hciAwNSwgMjAyMCBhdCAxMDo1ODoy
MkFNICswODAwLCBSb25nIENoZW4gd3JvdGU6CjwvcHJlPgogICAgICAgICAgPGJsb2NrcXVvdGUg
dHlwZT0iY2l0ZSI+CiAgICAgICAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90ZS1wcmUiIHdyYXA9
IiI+SGksCgpJIHRlc3RlZCBvbiBicmFuY2ggdGlwL3NjaGVkL2NvcmUsIHRoZSByZWdyZXNzaW9u
IGlzIHN0aWxsIHRoZXJlLgoKCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CmNvbXBp
bGVyL2NwdWZyZXFfZ292ZXJub3Iva2NvbmZpZy9yb290ZnMvdGJveF9ncm91cC90ZXN0L3Rlc3Rj
YXNlL3Vjb2RlOgogICBnY2MtNy9wZXJmb3JtYW5jZS94ODZfNjQtcmhlbC03LjYvZGViaWFuLXg4
Nl82NC1waG9yb25peC9sa3AtbmhtLTJlcDEvYW9tLWF2MS0xLjIuMC9waG9yb25peC10ZXN0LXN1
aXRlLzB4MWQKCmNvbW1pdDoKICAgNmQ0ZDIyNDY4ZGFlM2Q4NzU3YWY5ZjhiODFiODQ4YTc2ZWY0
NDA5ZCAoInNjaGVkL2ZhaXI6IFJlb3JkZXIgZW5xdWV1ZS9kZXF1ZXVlX3Rhc2tfZmFpciBwYXRo
IikKICAgNjQ5OWIxYjJkZDFiOGQ0MDRhMTZiOWZiYmYxYWY2YjliM2MxZDgzZCAoInNjaGVkL251
bWE6IFJlcGxhY2UgcnVubmFibGVfbG9hZF9hdmcgYnkgbG9hZF9hdmciKQogICAyNTNlMmI2OWVm
OGZkYTRkOTM0NWZmNDk2YjEyMDU4ZmFhZWVmZjZiICgic2NoZWQvZmFpcjogZml4IHN0YXRpc3Rp
Y3MgZm9yIGZpbmRfaWRsZXN0X2dyb3VwKCkiKQoKPC9wcmU+CiAgICAgICAgICA8L2Jsb2NrcXVv
dGU+CiAgICAgICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPkFyZSB5b3Ug
c3VyZT8gSSBhc2sgYmVjYXVzZSB0aXAvc2NoZWQvY29yZSBkb2VzIG5vdCBoYXZlIHRoZQpwYXRj
aCAic2NoZWQvZmFpcjogZml4IHN0YXRpc3RpY3MgZm9yIGZpbmRfaWRsZXN0X2dyb3VwIiBpbiBp
dApub3IgaXMgY29tbWl0IDI1M2UyYjY5ZWY4ZmRhNGQ5MzQ1ZmY0OTZiMTIwNThmYWFlZWZmNmIg
cGFydCBvZiB0aGUKdGlwL3NjaGVkL2NvcmUgaGlzdG9yeS4gWW91J2QgbmVlZCB0byB0ZXN0IHRo
ZSBmdWxsIHNlcmllcyBpbiB0aGUgY3VycmVudAp0aXAvc2NoZWQvY29yZSB3aXRoIG1pbmltYWxs
eSAyODlkZTM1OTg0ODEgKCJzY2hlZC9mYWlyOiBGaXggc3RhdGlzdGljcwpmb3IgZmluZF9pZGxl
c3RfZ3JvdXAoKSIpIGZyb20gdGlwL3NjaGVkL3VyZ2VudCBvbiB0b3AuIFRoYXQncyBzdGlsbApt
aXNzaW5nIHR3byBmaXhlcyBidXQgb25lIGlzIGEgYnVpbGQgaXNzdWUgYW5kIHRoZSBvdGhlciBp
cyBhIG1pc3NpbmcKcmN1X3JlYWRfbG9jayB0aGF0IGlzIHVubGlrZWx5IHRvIGNhdXNlIGNvcnJ1
cHRpb24gdW5sZXNzIHRoZXJlIGlzIGEKaG90cGx1ZyBldmVudCBkdXJpbmcgdGhlIHRlc3QuCjwv
cHJlPgogICAgICAgIDwvYmxvY2txdW90ZT4KICAgICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUt
cHJlIiB3cmFwPSIiPgpZZXMsIGNvbW1pdCA2ZDRkMjI0NjhkYWUzoCBpcyBub3QgZnJvbSB0aXAv
c2NoZWQvY29yZSwgSSBjcmVhdGVkIGl0IGJhc2VkIG9uCnRpcC9zY2hlZC9jb3JlLgoKPC9wcmU+
CiAgICAgIDwvYmxvY2txdW90ZT4KICAgICAgPHByZSBjbGFzcz0ibW96LXF1b3RlLXByZSIgd3Jh
cD0iIj4KVW5kZXJzdG9vZC4KCjwvcHJlPgogICAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIj4K
ICAgICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPiQgZ2l0IGxvZyAtLW9u
ZWxpbmUgNmQ0ZDIyNDY4ZGFlM2Q4NzU3YWY5ZjhiODFiODQ4YTc2ZWY0NDA5ZH4uLjI1M2UyYjY5
ZWY4ZmRhNGQ5MzQ1ZmY0OTZiMTIwNThmYWFlZWZmNmIKMjUzZTJiNjllZjhmZCBzY2hlZC9mYWly
OiBmaXggc3RhdGlzdGljcyBmb3IgZmluZF9pZGxlc3RfZ3JvdXAoKQphMGYwM2I2MTdjM2IyIHNj
aGVkL251bWE6IFN0b3AgYW4gZXhoYXN0aXZlIHNlYXJjaCBpZiBhIHJlYXNvbmFibGUgc3dhcApj
YW5kaWRhdGUgb3IgaWRsZSBDUFUgaXMgZm91bmQKODhjY2E3MmM5NjczZSBzY2hlZC9udW1hOiBC
aWFzIHN3YXBwaW5nIHRhc2tzIGJhc2VkIG9uIHRoZWlyIHByZWZlcnJlZCBub2RlCjVmYjUyZGQ5
M2EyZmUgc2NoZWQvbnVtYTogRmluZCBhbiBhbHRlcm5hdGl2ZSBpZGxlIENQVSBpZiB0aGUgQ1BV
IGlzIHBhcnQgb2YKYW4gYWN0aXZlIE5VTUEgYmFsYW5jZQpmZjdkYjBiZjI0ZGI5IHNjaGVkL251
bWE6IFByZWZlciB1c2luZyBhbiBpZGxlIENQVSBhcyBhIG1pZ3JhdGlvbiB0YXJnZXQKaW5zdGVh
ZCBvZiBjb21wYXJpbmcgdGFza3MKMDcwZjVlODYwZWUyYiBzY2hlZC9mYWlyOiBUYWtlIGludG8g
YWNjb3VudCBydW5uYWJsZV9hdmcgdG8gY2xhc3NpZnkgZ3JvdXAKOWY2ODM5NTMzM2FkNyBzY2hl
ZC9wZWx0OiBBZGQgYSBuZXcgcnVubmFibGUgYXZlcmFnZSBzaWduYWwKMGRhY2VlMWJmYTcwZSBz
Y2hlZC9wZWx0OiBSZW1vdmUgdW51c2VkIHJ1bm5hYmxlIGxvYWQgYXZlcmFnZQpmYjg2ZjViMjEx
OTI0IHNjaGVkL251bWE6IFVzZSBzaW1pbGFyIGxvZ2ljIHRvIHRoZSBsb2FkIGJhbGFuY2VyIGZv
ciBtb3ZpbmcKYmV0d2VlbiBkb21haW5zIHdpdGggc3BhcmUgY2FwYWNpdHkKNjQ5OWIxYjJkZDFi
OCBzY2hlZC9udW1hOiBSZXBsYWNlIHJ1bm5hYmxlX2xvYWRfYXZnIGJ5IGxvYWRfYXZnCjZkNGQy
MjQ2OGRhZTMgc2NoZWQvZmFpcjogUmVvcmRlciBlbnF1ZXVlL2RlcXVldWVfdGFza19mYWlyIHBh
dGgKCjwvcHJlPgogICAgICA8L2Jsb2NrcXVvdGU+CiAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90
ZS1wcmUiIHdyYXA9IiI+CkV4Y2VsbGVudC4gTm93IGluIHlvdXIgcHJldmlvdXMgbWFpbCwgdGhl
IHJlZ3Jlc3Npb24gd2FzIHJlcG9ydGVkIGJhc2VkCm9uCgpjb21taXQ6CiAgNmQ0ZDIyNDY4ZGFl
M2Q4NzU3YWY5ZjhiODFiODQ4YTc2ZWY0NDA5ZCAoInNjaGVkL2ZhaXI6IFJlb3JkZXIgZW5xdWV1
ZS9kZXF1ZXVlX3Rhc2tfZmFpciBwYXRoIikKICA2NDk5YjFiMmRkMWI4ZDQwNGExNmI5ZmJiZjFh
ZjZiOWIzYzFkODNkICgic2NoZWQvbnVtYTogUmVwbGFjZSBydW5uYWJsZV9sb2FkX2F2ZyBieSBs
b2FkX2F2ZyIpCiAgMjUzZTJiNjllZjhmZGE0ZDkzNDVmZjQ5NmIxMjA1OGZhYWVlZmY2YiAoInNj
aGVkL2ZhaXI6IGZpeCBzdGF0aXN0aWNzIGZvciBmaW5kX2lkbGVzdF9ncm91cCgpIikKCkNhbiB5
b3UgY29uZmlybSB3aGV0aGVyIHRoZSByZXBvcnQgaXMgYmFzZWQgb24ganVzdCB0aG9zZSBjb21t
aXRzIG9yIHRoZQplbnRpcmUgc2VyaWVzPyBJZiBpdCdzIG5vdCB0aGUgZW50aXJlIHNlcmllcywg
Y2FuIHlvdSBnaXZlIG1lIHRoZSByZXBvcnQKZm9yIHRoZSBmdWxsIHNlcmllcyBwbGVhc2U/IFdl
IGtub3cgZm9yIGEgZmFjdCB0aGF0IHRoaXMgc2VyaWVzIGlzIG5vdApiaXNlY3Rpb24gc2FmZSBp
biB0ZXJtcyBvZiBwZXJmb3JtYW5jZS48L3ByZT4KICAgIDwvYmxvY2txdW90ZT4KICAgIDxicj4K
ICAgIEhpLDxicj4KICAgIDxicj4KICAgIFNvcnJ5IGZvciB0aGUgbGF0ZSwgeWVzIHRoZSByZXBv
cnQgaXMgYmFzZWQgb24gdGhlIGVudGlyZSBzZXJpZXMsCiAgICB0aGUgcmVzdWx0IG9mIGhlYWQg
Y29tbWl0IGlzIDAuMDM6PGJyPgogICAgPGJyPgogICAgY29tbWl0Ojxicj4KICAgIKAgYTBmMDNi
NjE3YzNiMjY0NGQzZDQ3YmY3ZDllNjBhZWQwMWJkNWIxMCAoInNjaGVkL251bWE6IFN0b3AgYW4K
ICAgIGV4aGFzdGl2ZSBzZWFyY2ggaWYgYSByZWFzb25hYmxlIHN3YXAgY2FuZGlkYXRlIG9yIGlk
bGUgQ1BVIGlzCiAgICBmb3VuZCIpPGJyPgogICAgPGJyPgogICAgJCBhZyAtQTkgcGhvcm9uaXgt
dGVzdC1zdWl0ZS5hb20tYXYxLjAuZnJhbWVzX3Blcl9zZWNvbmQKL3Jlc3VsdC9waG9yb25peC10
ZXN0LXN1aXRlL3BlcmZvcm1hbmNlLWFvbS1hdjEtMS4yLjAtdWNvZGU9MHgxZC9sa3AtbmhtLTJl
cDEvZGViaWFuLXg4Nl82NC1waG9yb25peC94ODZfNjQtcmhlbC03LjYvZ2NjLTcvYTBmMDNiNjE3
YzNiMjY0NGQzZDQ3YmY3ZDllNjBhZWQwMWJkNWIxMC9tYXRyaXguanNvbjxicj4KICAgIDI6oCAi
cGhvcm9uaXgtdGVzdC1zdWl0ZS5hb20tYXYxLjAuZnJhbWVzX3Blcl9zZWNvbmQiOiBbPGJyPgog
ICAgMy2goKAgMC4wMyw8YnI+CiAgICA0LaCgoCAwLjAzLDxicj4KICAgIDUtoKCgIDAuMDMsPGJy
PgogICAgNi2goKAgMC4wMyw8YnI+CiAgICA3LaCgoCAwLjAzLDxicj4KICAgIDgtoKCgIDAuMDMs
PGJyPgogICAgOS2goKAgMC4wMyw8YnI+CiAgICAxMC2goKAgMC4wMzxicj4KICAgIDExLaAgXSw8
YnI+CiAgICA8YnI+CiAgICA8YnI+CiAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIgogICAgICBj
aXRlPSJtaWQ6MjAyMDAzMDUxMjM5MTguR1IzODE4QHRlY2hzaW5ndWxhcml0eS5uZXQiPgogICAg
ICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPgoKPC9wcmU+CiAgICAgIDxibG9j
a3F1b3RlIHR5cGU9ImNpdGUiPgogICAgICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPgogICAg
ICAgICAgPHByZSBjbGFzcz0ibW96LXF1b3RlLXByZSIgd3JhcD0iIj4KQWxzbywgY2FuIHlvdSB0
ZWxsIG1lIG1vcmUgYWJvdXQgdGhlIGhhcmR3YXJlPyBUaGUgc3RhdHMgaW5kaWNhdGUgaXQncyBO
VU1BCmJ1dCBpdCBvbmx5IGhhcyAxNiB0aHJlYWRzIHdoaWNoIHNlZW1zIHZlcnkgbG93IGZvciBh
IG1vZGVybiBOVU1BIG1hY2hpbmUuCgo8L3ByZT4KICAgICAgICA8L2Jsb2NrcXVvdGU+CiAgICAg
ICAgPHByZSBjbGFzcz0ibW96LXF1b3RlLXByZSIgd3JhcD0iIj4Kcm9vdEBsa3AtbmhtLTJlcDE6
fiMgbHNjcHUKQXJjaGl0ZWN0dXJlOqCgoKCgoKCgoCB4ODZfNjQKQ1BVIG9wLW1vZGUocyk6oKCg
oKCgoCAzMi1iaXQsIDY0LWJpdApCeXRlIE9yZGVyOqCgoKCgoKCgoKCgIExpdHRsZSBFbmRpYW4K
Q1BVKHMpOqCgoKCgoKCgoKCgoKCgoCAxNgpPbi1saW5lIENQVShzKSBsaXN0OqCgIDAtMTUKVGhy
ZWFkKHMpIHBlciBjb3JlOqCgoCAyCkNvcmUocykgcGVyIHNvY2tldDqgoKAgNApTb2NrZXQocyk6
oKCgoKCgoKCgoKCgIDIKTlVNQSBub2RlKHMpOqCgoKCgoKCgoCAyClZlbmRvciBJRDqgoKCgoKCg
oKCgoKAgR2VudWluZUludGVsCkNQVSBmYW1pbHk6oKCgoKCgoKCgoKAgNgpNb2RlbDqgoKCgoKCg
oKCgoKCgoKCgIDI2Ck1vZGVsIG5hbWU6oKCgoKCgoKCgoKAgSW50ZWwoUikgWGVvbihSKSBDUFWg
oKCgoKCgoKCgIFg1NTcwoCBAIDIuOTNHSHoKU3RlcHBpbmc6oKCgoKCgoKCgoKCgoCA1CkNQVSBN
SHo6oKCgoKCgoKCgoKCgoKAgMTY1NS4xMDYKQ1BVIG1heCBNSHo6oKCgoKCgoKCgoCAyOTI3LjAw
MDAKQ1BVIG1pbiBNSHo6oKCgoKCgoKCgoCAxNTk2LjAwMDAKQm9nb01JUFM6oKCgoKCgoKCgoKCg
oCA1ODUyLjgzClZpcnR1YWxpemF0aW9uOqCgoKCgoKAgVlQteApMMWQgY2FjaGU6oKCgoKCgoKCg
oKCgIDMySwpMMWkgY2FjaGU6oKCgoKCgoKCgoKCgIDMySwpMMiBjYWNoZTqgoKCgoKCgoKCgoKCg
IDI1NksKTDMgY2FjaGU6oKCgoKCgoKCgoKCgoCA4MTkySwpOVU1BIG5vZGUwIENQVShzKTqgoKCg
IDAsMiw0LDYsOCwxMCwxMiwxNApOVU1BIG5vZGUxIENQVShzKTqgoKCgIDEsMyw1LDcsOSwxMSwx
MywxNQpGbGFnczqgoKCgoKCgoKCgoKCgoKCgIGZwdSB2bWUgZGUgcHNlIHRzYyBtc3IgcGFlIG1j
ZSBjeDggYXBpYyBzZXAgbXRyciBwZ2UKbWNhIGNtb3YgcGF0IHBzZTM2IGNsZmx1c2ggZHRzIGFj
cGkgbW14IGZ4c3Igc3NlIHNzZTIgaHQgdG0gcGJlIHN5c2NhbGwgbngKcmR0c2NwIGxtIGNvbnN0
YW50X3RzYyBhcmNoX3BlcmZtb24gcGVicyBidHMgcmVwX2dvb2Qgbm9wbCB4dG9wb2xvZ3kKbm9u
c3RvcF90c2MgY3B1aWQgYXBlcmZtcGVyZiBwbmkgZHRlczY0IG1vbml0b3IgZHNfY3BsIHZteCBl
c3QgdG0yIHNzc2UzCmN4MTYgeHRwciBwZGNtIGRjYSBzc2U0XzEgc3NlNF8yIHBvcGNudCBsYWhm
X2xtIHB0aSBzc2JkIGlicnMgaWJwYiBzdGlicAp0cHJfc2hhZG93IHZubWkgZmxleHByaW9yaXR5
IGVwdCB2cGlkIGR0aGVybSBpZGEgZmx1c2hfbDFkCgo8L3ByZT4KICAgICAgPC9ibG9ja3F1b3Rl
PgogICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPgpPaywgdGhhdCBtYWtl
cyBzb21lIHNlbnNlLiBJdCdzIGFuIDExIHllYXIgb2xkIE5laGFsZW0gbWFjaGluZSB0aGF0IGlz
Cm5vIGxvbmdlciBtYW51ZmFjdHVyZWQuIE5vIHdvbmRlciBJIGRpZCBub3QgY2F0Y2ggYW55dGhp
bmcgb24gbXkgb3duCnRlc3RzLgoKQ2FuIHlvdSB0ZWxsIG1lIGlmIHRoaXMgcmVncmVzc2lvbiBp
cyBtYWNoaW5lLXNwZWNpZmljIG9yIGFyZSB5b3Ugc2VlaW5nCml0IG9uIGEgcmFuZ2Ugb2YgbWFj
aGluZXMsIHBhcnRpY3VsYXJseSBuZXdlciBvbmVzPwoKPC9wcmU+CiAgICA8L2Jsb2NrcXVvdGU+
CiAgICA8YnI+CiAgICBJIHRlc3RlZCBvbiBhIENhc2NhZGUgTGFrZSBtYWNoaW5lIGFuZCBkb2Vz
bid0IHNlZSB0aGUgcmVncmVzc2lvbi48YnI+CiAgICA8c3BhbiBpZD0id183OSIgY2xhc3M9IiI+
QXMgPC9zcGFuPjxzcGFuIGlkPSJ3XzgwIiBjbGFzcz0iIj55b3U8L3NwYW4+PHNwYW4KICAgICAg
aWQ9IndfODEiIGNsYXNzPSIiPidkIDwvc3Bhbj48c3BhbiBpZD0id184MiIgY2xhc3M9IiI+ZXhw
ZWN0PC9zcGFuPjxzcGFuCiAgICAgIGlkPSJ3XzgzIiBjbGFzcz0iIj4soCA8L3NwYW4+aXQncyBt
YWNoaW5lLXNwZWNpZmljLjxicj4KICAgIDxicj4KICAgIEJlc3QgUmVnYXJkcyw8YnI+CiAgICBS
b25nIENoZW4gPGJyPgogIDwvYm9keT4KPC9odG1sPgo=

--===============0375989353328993199==--

