Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015A01F63EE
	for <oe-lkp@lists.linux.dev>; Fri, 17 Jan 2025 03:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737083083; cv=none; b=gd8JWaGlLAykrJ4wNzhJQ+5t1pT9ailKIzXIjxV2EWvusid0AM6vykm32WL4NCr8D/b7ZPaFgKtGy/Wzn2zva7uNl0Bk6PIINOtttG0/Xxxrh/JP+Sp2YC0NC+phPhiS1HRGoibtTnrhUgpx5PuyGjhQeBcOH8ImQgL3HNQt+Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737083083; c=relaxed/simple;
	bh=GYjgPU9QqpbTgDJfdh4tnf/pEUrSMlTiFAYvBLY2sKc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=U2yS3/6DwYqi69NmTlo4mQfCW5KL011jvlA3COa0MgyHrscMkdNX5T2hzZchyW0cThKBypneQZT0rFY6QGRt8W/Mf35B3mrszm21i0hTD9KRYeM1MDVG4pFUgf1WF7Gr8Iu6lP9evBcrzElx/vHqEhCe/X+ZKibVqyckrgwkQ1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YRX35ylJ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YRX35ylJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737083081; x=1768619081;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=GYjgPU9QqpbTgDJfdh4tnf/pEUrSMlTiFAYvBLY2sKc=;
  b=YRX35ylJWdDtmv4T8rBPcXHimi7hBM13hEz52JfavxV57o+9lztaatIH
   XAefS1XPmBcFhQ/NGP5Yk7xgX6U4poF59Q2YSxKPKfnQe3h4H1JNf8DhL
   RgwCAVfa1oHRvCI/5umuOQhK1n5zDPhja9FjzdDeige05Hv4hNnzB2Txn
   Z1dwohmZiNuDGDxFKNe/EjmkR9INRkhxf9v05zYXWeM2F6zVYGKKNWnP/
   CD3Sgfoh145QcYcyQSJmj03UwrdIR2qQnBSpI06pwYfbbCTBOtypP1sNk
   xVB3yXDi7imi0eWpXqNDcPQs3qVxn18qH3B2VcUCJP7l2Nd/wWcBAXf9o
   w==;
X-CSE-ConnectionGUID: hxmaJqtkRymQ/C53g+HeDQ==
X-CSE-MsgGUID: /ocZ+pdiSL2vtuOtueOU1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="25099652"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="25099652"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 19:04:40 -0800
X-CSE-ConnectionGUID: JAu2agUQRm6UqGE/tRwyhA==
X-CSE-MsgGUID: ONH0PAWfS4Sz6SpS+hzbkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="110681866"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.245.128]) ([10.124.245.128])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 19:04:38 -0800
Message-ID: <6c23d536-484f-4c4b-aa85-3e0b9544611a@linux.intel.com>
Date: Fri, 17 Jan 2025 11:04:35 +0800
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master] [KVM] 7803339fa9:
 kernel-selftests.kvm.pmu_counters_test.fail
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>,
 kernel test robot <oliver.sang@intel.com>, g@google.com
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
 Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org,
 xudong.hao@intel.com
References: <202501141009.30c629b4-lkp@intel.com>
 <Z4a_PmUVVmUtOd4p@google.com>
 <a2adf1b8-c394-4741-a42b-32288657b07e@linux.intel.com>
Content-Language: en-US
In-Reply-To: <a2adf1b8-c394-4741-a42b-32288657b07e@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 1/15/2025 10:44 AM, Mi, Dapeng wrote:
> On 1/15/2025 3:47 AM, Sean Christopherson wrote:
>> +Dapeng
>>
>> On Tue, Jan 14, 2025, kernel test robot wrote:
>>> we fould the test failed on a Cooper Lake, not sure if this is expected.
>>> below full report FYI.
>>>
>>>
>>> kernel test robot noticed "kernel-selftests.kvm.pmu_counters_test.fail" on:
>>>
>>> commit: 7803339fa929387bbc66479532afbaf8cbebb41b ("KVM: selftests: Use data load to trigger LLC references/misses in Intel PMU")
>>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>>>
>>> [test failed on linux-next/master 37136bf5c3a6f6b686d74f41837a6406bec6b7bc]
>>>
>>> in testcase: kernel-selftests
>>> version: kernel-selftests-x86_64-7503345ac5f5-1_20241208
>>> with following parameters:
>>>
>>> 	group: kvm
>>>
>>> config: x86_64-rhel-9.4-kselftests
>>> compiler: gcc-12
>>> test machine: 224 threads 4 sockets Intel(R) Xeon(R) Platinum 8380H CPU @ 2.90GHz (Cooper Lake) with 192G memory
>> *sigh*
>>
>> This fails on our Skylake and Cascade Lake systems, but I only tested an Emerald
>> Rapids.
>>
>>> # Testing fixed counters, PMU version 0, perf_caps = 2000
>>> # Testing arch events, PMU version 1, perf_caps = 0
>>> # ==== Test Assertion Failure ====
>>> #   x86/pmu_counters_test.c:129: count >= (10 * 4 + 5)
>>> #   pid=6278 tid=6278 errno=4 - Interrupted system call
>>> #      1	0x0000000000411281: assert_on_unhandled_exception at processor.c:625
>>> #      2	0x00000000004075d4: _vcpu_run at kvm_util.c:1652
>>> #      3	 (inlined by) vcpu_run at kvm_util.c:1663
>>> #      4	0x0000000000402c5e: run_vcpu at pmu_counters_test.c:62
>>> #      5	0x0000000000402e4d: test_arch_events at pmu_counters_test.c:315
>>> #      6	0x0000000000402663: test_arch_events at pmu_counters_test.c:304
>>> #      7	 (inlined by) test_intel_counters at pmu_counters_test.c:609
>>> #      8	 (inlined by) main at pmu_counters_test.c:642
>>> #      9	0x00007f3b134f9249: ?? ??:0
>>> #     10	0x00007f3b134f9304: ?? ??:0
>>> #     11	0x0000000000402900: _start at ??:?
>>> #   count >= NUM_INSNS_RETIRED
>> The failure is on top-down slots.  I modified the assert to actually print the
>> count (I'll make sure to post a patch regardless of where this goes), and based
>> on the count for failing vs. passing, I'm pretty sure the issue is not the extra
>> instruction, but instead is due to changing the target of the CLFUSH from the
>> address of the code to the address of kvm_pmu_version.
>>
>> However, I think the blame lies with the assertion itself, i.e. with commit
>> 4a447b135e45 ("KVM: selftests: Test top-down slots event in x86's pmu_counters_test").
>> Either that or top-down slots is broken on the Lakes.
>>
>> By my rudimentary measurements, tying the number of available slots to the number
>> of instructions *retired* is fundamentally flawed.  E.g. on the Lakes (SKX is more
>> or less identical to CLX), omitting the CLFLUSHOPT entirely results in *more*
>> slots being available throughout the lifetime of the measured section.
>>
>> My best guess is that flushing the cache line use for the data load causes the
>> backend to saturate its slots with prefetching data, and as a result the number
>> of slots that are available goes down.
>>
>>         CLFLUSHOPT .    | CLFLUSHOPT [%m]       | NOP
>> CLX     350-100         | 20-60[*]              | 135-150  
>> SPR     49000-57000     | 32500-41000           | 6760-6830
>>
>> [*] CLX had a few outliers in the 200-400 range, but the majority of runs were
>>     in the 20-60 range.
>>
>> Reading through more (and more and more) of the TMA documentation, I don't think
>> we can assume anything about the number of available slots, beyond a very basic
>> assertion that it's practically impossible for there to never be an available
>> slot.  IIUC, retiring an instruction does NOT require an available slot, rather
>> it requires the opposite: an occupied slot for the uop(s).
> I'm not quite sure about this. IIUC, retiring an instruction may not need a
> cycle, but it needs a slot at least except the instruction is macro-fused.
> Anyway, let me double check with our micro-architecture and perf experts.

Hi Sean,

Just double check with our perf experts, the understanding that "retiring
an instruction needs a slot at least except the instruction is macro-fused"
is correct. The reason of this error is that the architectural topdown
slots event is just introduced from Ice lake platform and it's not
supported on skylake and cascade lake platforms. On these earlier platforms
the event 0x01a4 is another event which counts different thing instead of
topdown slots. On these earlier platforms, the slots event is derived from
0x3c event.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/x86/events/intel/core.c#n466


I don't understand why current pmu_counters_test code would validate an
architectural event which KVM (HW) doesn't support, it's not reasonable and
could cause misleading.

        /*
         * Force iterating over known arch events regardless of whether or not
         * KVM/hardware supports a given event.
         */
        nr_arch_events = max_t(typeof(nr_arch_events), nr_arch_events,
NR_INTEL_ARCH_EVENTS);

I would provide a patch to fix this.

BTW, currently KVM doesn't check if user space sets a valid pmu version in
kvm_check_cpuid(). The user space could set KVM a PMU version which is
larger than KVM supported maximum PMU version, just like currently
pmu_counters_test does. This is not correct. I originally intent to fix
this with the mediated vPMU patch series, but It looks we can send the
patches just with this fix together, then the issue can be fixed earlier.

Thanks,

Dapeng Mi

>
>
>> I'm mildly curious as to why the counts for SPR are orders of magnitude higher
>> that CLX (simple accounting differences?), but I don't think it changes anything
>> in the test itself.
>>
>> Unless someone has a better idea, my plan is to post a patch to assert that the
>> top-down slots count is non-zero, not that it's >= instructions retired.  E.g.
>>
>> diff --git a/tools/testing/selftests/kvm/x86/pmu_counters_test.c b/tools/testing/selftests/kvm/x86/pmu_counters_test.c
>> index accd7ecd3e5f..21acedcd46cd 100644
>> --- a/tools/testing/selftests/kvm/x86/pmu_counters_test.c
>> +++ b/tools/testing/selftests/kvm/x86/pmu_counters_test.c
>> @@ -123,10 +123,8 @@ static void guest_assert_event_count(uint8_t idx,
>>                 fallthrough;
>>         case INTEL_ARCH_CPU_CYCLES_INDEX:
>>         case INTEL_ARCH_REFERENCE_CYCLES_INDEX:
>> -               GUEST_ASSERT_NE(count, 0);
>> -               break;
>>         case INTEL_ARCH_TOPDOWN_SLOTS_INDEX:
>> -               GUEST_ASSERT(count >= NUM_INSNS_RETIRED);
>> +               GUEST_ASSERT_NE(count, 0);
>>                 break;
>>         default:
>>                 break;
>>
