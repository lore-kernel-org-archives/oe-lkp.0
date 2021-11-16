Content-Type: multipart/mixed; boundary="===============5901248924834430378=="
MIME-Version: 1.0
From: Yin Fengwei <fengwei.yin@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/asm] 0507503671: will-it-scale.per_process_ops -4.9% regression
Date: Tue, 16 Nov 2021 17:33:25 +0800
Message-ID: <e6755428-9bc8-2b74-1c86-14b704943604@intel.com>
In-Reply-To: <41dacaff-ab92-b01b-adb9-c0fe051cef0b@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5901248924834430378==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 11/16/2021 9:40 AM, Yin Fengwei wrote:
> Hi,
> =

> On 11/16/2021 3:20 AM, H. Peter Anvin wrote:
>> [Cc: Peter Z.]
>>
>> This seems totally bizarre... that is an *enormous* change, and if I'm r=
eading it right it seems like this somehow related to the performance monit=
oring framework itself?
> We can rerun the benchmark with performance monitor totally disabled.
The testing is on the queue.

> =

>>
>> The lower-performance init code is all pushed into the pre-boot path, un=
less for some strange reason not all code gets patched e.g. at module loadi=
ng time.
>>
>> A quick peek around made me notice a few minor possibilities, but none o=
f them look particularly sane:
>>
>> 1. We don't use "asm inline" in asm_volatile_goto, and we probably
>> =C2=A0=C2=A0 should; otherwise gcc might get the idea this is a more hea=
vyweight
>> =C2=A0=C2=A0 operation than it actually is.
>> 2. There is a workaround in asm_volatile_goto for a bug which apparently
>> =C2=A0=C2=A0 was fixed in gcc 4.8.x that might mislead gcc's code genera=
tor into
>> =C2=A0=C2=A0 generating worse code.
>>
>> Did you see any functions for which the code got *bigger*?
> I checked 7 or 8 functions. Most of them were same. None of them got bigg=
er.
> This intel_pmu_store_lbr was smaller. I could do a full comparing.
Only compare the System.map file w/o the patch, Following function become b=
igger:

function: (arch_kexec_pre_free_pages) has length 240 without patch, length =
288 with patch
function: (kernel_ident_mapping_init) has length 432 without patch, length =
448 with patch
function: (swsusp_arch_resume) has length 2384 without patch, length 2960 w=
ith patch

And following functions become smaller:
function: (intel_pmu_store_lbr) has length 640 without patch, length 608 wi=
th patch
function: (copy_fpstate_to_sigframe) has length 672 without patch, length 6=
56 with patch
function: (register_page_bootmem_memmap) has length 592 without patch, leng=
th 560 with patch
function: (pti_clone_pgtable.constprop.0) has length 448 without patch, len=
gth 432 with patch
function: (kimage_alloc_crash_control_pages) has length 352 without patch, =
length 336 with patch
function: (kimage_alloc_page) has length 768 without patch, length 736 with=
 patch
function: (sanity_check_segment_list) has length 400 without patch, length =
384 with patch
function: (kimage_alloc_normal_control_pages) has length 416 without patch,=
 length 368 with patch
function: (gup_pte_range) has length 800 without patch, length 784 with pat=
ch
function: (gup_pgd_range) has length 416 without patch, length 400 with pat=
ch
function: (free_pgd_range) has length 336 without patch, length 304 with pa=
tch
function: (unmap_page_range) has length 896 without patch, length 880 with =
patch
function: (__apply_to_page_range) has length 848 without patch, length 800 =
with patch
function: (remap_pfn_range_notrack) has length 944 without patch, length 92=
8 with patch
function: (copy_page_range) has length 720 without patch, length 704 with p=
atch
function: (change_protection_range) has length 896 without patch, length 86=
4 with patch
function: (page_vma_mapped_walk) has length 2336 without patch, length 2320=
 with patch
function: (walk_pgd_range) has length 384 without patch, length 336 with pa=
tch
function: (vmap_range_noflush) has length 1600 without patch, length 1584 w=
ith patch
function: (vmap_small_pages_range_noflush) has length 576 without patch, le=
ngth 560 with patch
function: (unuse_vma) has length 992 without patch, length 960 with patch
function: (vmemmap_remap_range) has length 480 without patch, length 464 wi=
th patch
function: (read_kcore) has length 2272 without patch, length 2256 with patch
function: (write_pool.constprop.0) has length 256 without patch, length 240=
 with patch
function: (extract_buf) has length 336 without patch, length 320 with patch
function: (crng_reseed) has length 560 without patch, length 544 with patch
function: (do_numa_crng_init) has length 480 without patch, length 464 with=
 patch
function: (register_mem_block_under_node_early) has length 224 without patc=
h, length 208 with patch
function: (exc_nmi) has length 288 without patch, length 272 with patch
function: (__kernel_physical_mapping_init) has length 521 without patch, le=
ngth 514 with patch
function: (firmware_map_remove) has length 148 without patch, length 147 wi=
th patch


I am not sure whether the code gen is critical here. Because we saw another=
 case:
The patch added one syscall and one variable. Even no one call the function=
 actually. The
performance of netperf throughput dropped about 11%.

Link is here:
https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org/thread/M4IQCUGJNTNT=
UNA56XRLKOKUBKDMBBCF/


Regards
Yin, Fengwei


> =

>>
>>
>> Not directly related, but it would be really helpful to get an r-value w=
ith your statistics.=C2=A0 It would greatly help avoiding chasing ghosts.
> Can you share what's the "r-value" and how to get it? Thanks.
> =

> =

> Regards
> Yin, Fengwei
> =

>>
>>
>>
>>
>> On 11/15/21 01:53, Yin Fengwei wrote:
>>> Hi,
>>>
>>> On 11/15/2021 3:37 PM, kernel test robot wrote:
>>>>
>>>>
>>>> Greeting,
>>>>
>>>> FYI, we noticed a -4.9% regression of will-it-scale.per_process_ops du=
e to commit:
>>>>
>>>>
>>>> commit: 0507503671f9b1c867e889cbec0f43abf904f23c ("x86/asm: Avoid addi=
ng register pressure for the init case in static_cpu_has()")
>>>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>>>
>>>> in testcase: will-it-scale
>>>> on test machine: 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU =
@ 2.00GHz with 256G memory
>>>> with following parameters:
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0nr_task: 50%
>>>> =C2=A0=C2=A0=C2=A0=C2=A0mode: process
>>>> =C2=A0=C2=A0=C2=A0=C2=A0test: mmap2
>>>> =C2=A0=C2=A0=C2=A0=C2=A0cpufreq_governor: performance
>>>> =C2=A0=C2=A0=C2=A0=C2=A0ucode: 0xd000280
>>>>
>>>> test-description: Will It Scale takes a testcase and runs it from 1 th=
rough to n parallel copies to see if the testcase will scale. It builds bot=
h a process and threads based test in order to see any differences between =
the two.
>>>> test-url: https://github.com/antonblanchard/will-it-scale
>>>>
>>>>
>>>> please be noted, since we don't have clue why this commit could cause
>>>> performance drop, so we did further tests on other platforms or with
>>>> different parameters, and got below results.
>>> Add Kees in case he is interest to this behavior.
>>>
>>> Observation on this regression:
>>> =C2=A0=C2=A0=C2=A0 After the patch, the better code is generated. De-as=
sembled the function intel_pmu_store_lbr with
>>> =C2=A0=C2=A0=C2=A0 vmlinux built from commit f87bc8dc7a7c and 050750367=
1f9 and got:
>>> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 With commit f87bc8dc7a7c (parent commit=
):
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 https://zerobin.net/?22efb1114b097030#ry=
D/8LpasEIg8WrS6O/M+sHYJp7c/LoAXPfeB7BUqu4=3D
>>>
>>> =C2=A0=C2=A0=C2=A0 With commit 0507503671f9:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 https://zerobin.net/?e57652572b3ec83c#Cv=
obUggve54SIHmlZ6jkzs3s4k8iQN4ophFoOs7LHMI=3D
>>>
>>> =C2=A0=C2=A0=C2=A0 The assembly code with commit 0507503671f9 is smalle=
r than with parent commit. The
>>> =C2=A0=C2=A0=C2=A0 register r12 in parent commit is strange IIUC.
>>>
>>>
>>> =C2=A0=C2=A0=C2=A0 BTW, the reason that we picked up function intel_pmu=
_store_lbr is:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 It's the first function in System.map wh=
ich has different size w/o the patch
>>>
>>>
>>> Suppose the performance data with commit 0507503671f9 should be better.=
 But the
>>> test result showed it had improvement only on one test box. On other th=
ree test box,
>>> it introduced regressions. Looks like strange.
>>>
>>>
>>> Regards
>>> Yin, Fengwei
>>>
>>>>
>>>> except the 1% improvement from the first test on a 4 sockets Haswell-E=
X,
>>>> others all show similar regression:
>>>>
>>>> +------------------+--------------------------------------------------=
--------------------------------+
>>>> | testcase: change | will-it-scale: will-it-scale.per_process_ops +1.0=
% improvement=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>> | test machine=C2=A0=C2=A0=C2=A0=C2=A0 | 144 threads 4 sockets Intel(R=
) Xeon(R) CPU E7-8890 v3 @ 2.50GHz with 512G memory |
>>>> | test parameters=C2=A0 | cpufreq_governor=3Dperformance=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |
>>>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | mode=3Dprocess=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |
>>>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | nr_task=3D50%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |
>>>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | test=3Dmmap2=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |
>>>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | ucode=3D0x16=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |
>>>> +------------------+--------------------------------------------------=
--------------------------------+
>>>> | testcase: change | will-it-scale: will-it-scale.per_process_ops -3.7=
% regression=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>> | test machine=C2=A0=C2=A0=C2=A0=C2=A0 | 144 threads 4 sockets Intel(R=
) Xeon(R) Gold 5318H CPU @ 2.50GHz with 128G memory |
>>>> | test parameters=C2=A0 | cpufreq_governor=3Dperformance=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |
>>>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | mode=3Dprocess=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |
>>>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | nr_task=3D50%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |
>>>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | test=3Dmmap2=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |
>>>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | ucode=3D0x700001e=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>> +------------------+--------------------------------------------------=
--------------------------------+
>>>> | testcase: change | will-it-scale: will-it-scale.per_process_ops -5.1=
% regression=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>> | test machine=C2=A0=C2=A0=C2=A0=C2=A0 | 128 threads 2 sockets Intel(R=
) Xeon(R) Gold 6338 CPU @ 2.00GHz with 256G memory=C2=A0 |
>>>> | test parameters=C2=A0 | cpufreq_governor=3Dperformance=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |
>>>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | mode=3Dprocess=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |
>>>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | nr_task=3D16=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |
>>>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | test=3Dmmap2=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |
>>>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | ucode=3D0xd000280=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>> +------------------+--------------------------------------------------=
--------------------------------+
>>>> | testcase: change | will-it-scale: will-it-scale.per_process_ops -5.9=
% regression=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>> | test machine=C2=A0=C2=A0=C2=A0=C2=A0 | 88 threads 2 sockets Intel(R)=
 Xeon(R) Gold 6238M CPU @ 2.10GHz with 128G memory=C2=A0 |
>>>> | test parameters=C2=A0 | cpufreq_governor=3Dperformance=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |
>>>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | mode=3Dprocess=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |
>>>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | nr_task=3D16=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |
>>>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | test=3Dmmap1=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |
>>>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | ucode=3D0x5003006=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>> +------------------+--------------------------------------------------=
--------------------------------+
>>>> | testcase: change | will-it-scale: will-it-scale.per_process_ops -3.5=
% regression=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>> | test machine=C2=A0=C2=A0=C2=A0=C2=A0 | 88 threads 2 sockets Intel(R)=
 Xeon(R) Gold 6238M CPU @ 2.10GHz with 128G memory=C2=A0 |
>>>> | test parameters=C2=A0 | cpufreq_governor=3Dperformance=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |
>>>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | mode=3Dprocess=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |
>>>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | nr_task=3D50%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |
>>>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | test=3Dmmap2=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |
>>>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | ucode=3D0x5003006=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>> +------------------+--------------------------------------------------=
--------------------------------+
>>>>
>>>>
>>>> If you fix the issue, kindly add following tag
>>>> Reported-by: kernel test robot <oliver.sang@intel.com>
>>>>
>>>>
>>>> Details are as below:
>>>> ----------------------------------------------------------------------=
---------------------------->
>>>>
>>>>
>>>> To reproduce:
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git clone https://git=
hub.com/intel/lkp-tests.git
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cd lkp-tests
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sudo bin/lkp install =
job.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # job =
file is attached in this email
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin/lkp split-job --c=
ompatible job.yaml # generate the yaml file for lkp run
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sudo bin/lkp run gene=
rated-yaml-file
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # if come across any =
failure that blocks the test,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # please remove ~/.lk=
p and /lkp dir to run from a clean state.
>>>>
>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/=
testcase/ucode:
>>>> =C2=A0=C2=A0 gcc-9/performance/x86_64-rhel-8.3/process/50%/debian-10.4=
-x86_64-20200603.cgz/lkp-icl-2sp2/mmap2/will-it-scale/0xd000280
>>>>
>>>> commit:
>>>> =C2=A0=C2=A0 f87bc8dc7a ("x86/asm: Add _ASM_RIP() macro for x86-64 (%r=
ip) suffix")
>>>> =C2=A0=C2=A0 0507503671 ("x86/asm: Avoid adding register pressure for =
the init case in static_cpu_has()")
>>>>
>>>> f87bc8dc7a7c438c 0507503671f9b1c867e889cbec0
>>>> ---------------- ---------------------------
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev=C2=A0=
=C2=A0=C2=A0=C2=A0 %change=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
%stddev
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 \=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 \
>>>> =C2=A0=C2=A0 41898923=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -4.9%=C2=A0=C2=A0 39829159=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 will-it-scale.64.processes
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 654670=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 -4.9%=C2=A0=C2=A0=C2=A0=C2=A0 622330=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 will-it-scale.per_process_ops
>>>> =C2=A0=C2=A0 41898923=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -4.9%=C2=A0=C2=A0 39829159=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 will-it-scale.workload
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6918 =C2=B1 54%=C2=A0=C2=A0=C2=A0=
 +116.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 14975 =C2=B1 14%=C2=A0 softirqs.CPU2=
0.SCHED
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 240.00 =C2=B1 18%=C2=A0=C2=A0=C2=A0=C2=A0 +57=
.8%=C2=A0=C2=A0=C2=A0=C2=A0 378.67 =C2=B1 20%=C2=A0 slabinfo.biovec-64.acti=
ve_objs
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 240.00 =C2=B1 18%=C2=A0=C2=A0=C2=A0=C2=A0 +57=
.8%=C2=A0=C2=A0=C2=A0=C2=A0 378.67 =C2=B1 20%=C2=A0 slabinfo.biovec-64.num_=
objs
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.01 =C2=B1 28%=C2=A0=C2=A0=C2=A0=
=C2=A0 -36.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.01 =C2=B1 14%=C2=A0 per=
f-sched.sch_delay.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_aft=
er_hwframe.[unknown]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6114 =C2=B1 24%=C2=A0=C2=A0=C2=A0=
=C2=A0 -46.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3296 =C2=B1 46%=C2=A0 per=
f-sched.wait_and_delay.max.ms.schedule_hrtimeout_range_clock.poll_schedule_=
timeout.constprop.0.do_sys_poll
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6114 =C2=B1 24%=C2=A0=C2=A0=C2=A0=
=C2=A0 -46.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3296 =C2=B1 46%=C2=A0 per=
f-sched.wait_time.max.ms.schedule_hrtimeout_range_clock.poll_schedule_timeo=
ut.constprop.0.do_sys_poll
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1409 =C2=B1 30%=C2=A0=C2=A0=C2=A0=
=C2=A0 -30.7%=C2=A0=C2=A0=C2=A0=C2=A0 977.00 =C2=B1 23%=C2=A0 interrupts.CP=
U1.CAL:Function_call_interrupts
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3001 =C2=B1 58%=C2=A0=C2=A0=C2=A0=
=C2=A0 -70.3%=C2=A0=C2=A0=C2=A0=C2=A0 892.50 =C2=B1 69%=C2=A0 interrupts.CP=
U1.RES:Rescheduling_interrupts
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 669.83 =C2=B1172%=C2=A0=C2=A0=C2=A0 +696.9%=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5338 =C2=B1102%=C2=A0 interrupts.CPU10=
8.NMI:Non-maskable_interrupts
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org
>=20
--===============5901248924834430378==--

