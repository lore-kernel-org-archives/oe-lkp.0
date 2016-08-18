Content-Type: multipart/mixed; boundary="===============2931574511253820944=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/hweight] 65ea11ec6a: will-it-scale.per_process_ops 9.3% improvement
Date: Wed, 17 Aug 2016 20:54:11 -0700
Message-ID: <877fbespek.fsf@yhuang-mobile.sh.intel.com>
In-Reply-To: <20160818034513.GA21415@nazgul.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============2931574511253820944==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Borislav Petkov <bp@suse.de> writes:

> On Wed, Aug 17, 2016 at 03:29:04PM -0700, Huang, Ying wrote:
>> branch-miss-rate decreased from ~0.30% to ~0.043%.
>> =

>> So I guess there are some code alignment change, which caused decreased
>> branch miss rate.
>
> Hrrm, I still can't imagine how that would happen if the machine
> supports POPCNT and we never call the __sw_hweight* variants. Or does
> it?
>
> Can you paste /proc/cpuinfo from that Sandy Bridge-EP box?

Here it is.

processor       : 31
vendor_id       : GenuineIntel
cpu family      : 6
model           : 45
model name      : Intel(R) Xeon(R) CPU E5-2680 0 @ 2.70GHz
stepping        : 6
microcode       : 0x603
cpu MHz         : 3158.129
cache size      : 20480 KB
physical id     : 1
siblings        : 16
core id         : 7
cpu cores       : 8
apicid          : 47
initial apicid  : 47
fpu             : yes
fpu_exception   : yes
cpuid level     : 13
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca =
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx p=
dpe1gb rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology=
 nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl vmx sm=
x est tm2 ssse3 cx16 xtpr pdcm pcid dca sse4_1 sse4_2 x2apic popcnt tsc_dea=
dline_timer aes xsave avx lahf_lm tpr_shadow vnmi flexpriority ept vpid xsa=
veopt dtherm ida arat pln pts
bugs            :
bogomips        : 5392.85
clflush size    : 64
cache_alignment : 64
address sizes   : 46 bits physical, 48 bits virtual
power management:

Best Regards,
Huang, Ying

--===============2931574511253820944==--

