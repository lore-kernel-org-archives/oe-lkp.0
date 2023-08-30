Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDDF7465
	for <oe-lkp@lists.linux.dev>; Wed, 30 Aug 2023 17:08:55 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1693415333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z68yy1gRXjN/t5bcIFM5RwxhqkBdWlGSHE+gAXhE0Ns=;
	b=ul4p9FQua7SnaUeBeRMx1o4lRESfCI/8TMgqltJ/2QbLKBsWFf56g1PPdykbYg0nUhzJLV
	5wQ6/7TJSa6PW+HPY/6gXy7gt9+ij3vUVftzZ6EHUo+4gt4xGpVgeR9cTaXaqAl2kmbuk/
	gFGRbXInfLbGQBkpaY/ZFEDZCCSSSZ9Z2Az6dssQ2NoIm1FzJn/I6F4dHEqLhRk4t5Ztpt
	l6Lv675kcRy5pNtU5g4fC0aRq59hpykIaMCkpC4liorAQtH0PBoO3VN3rjthPMcjrFyiRC
	GdMPhRnMmBPPEAx20JljfDGPyuyehLbjxGsr2rN2DDxzPMsXBKZdgqgDavLXyw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1693415333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z68yy1gRXjN/t5bcIFM5RwxhqkBdWlGSHE+gAXhE0Ns=;
	b=2BYt7r37DLUjsJ9JQXQM1oMcZBebcRY+pCdVLsnUUcp97qdHHR1LA5bdfvafKVc9AATfqo
	FdHXzlwsVmFNzcBw==
To: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
Cc: "Du, Julie" <julie.du@intel.com>, "oe-lkp@lists.linux.dev"
 <oe-lkp@lists.linux.dev>, lkp <lkp@intel.com>, "Sang, Oliver"
 <oliver.sang@intel.com>
Subject: RE: [tglx-devel:x86/microcode] [x86/microcode/32] 7f1f6ace4c:
 BUG:unable_to_handle_page_fault_for_address
In-Reply-To: <CY8PR11MB7134FE7B8ED92A94CB649B0089E6A@CY8PR11MB7134.namprd11.prod.outlook.com>
References: <202308291502.2d535a18-oliver.sang@intel.com>
 <DS7PR11MB59651DCF238053376F5927C88FE6A@DS7PR11MB5965.namprd11.prod.outlook.com>
 <CY8PR11MB7134FE7B8ED92A94CB649B0089E6A@CY8PR11MB7134.namprd11.prod.outlook.com>
Date: Wed, 30 Aug 2023 19:08:52 +0200
Message-ID: <87il8w5ufv.ffs@tglx>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Aug 30 2023 at 14:04, Qiuxu Zhuo wrote:
>> From: Sang, Oliver <oliver.sang@intel.com>
>> Sent: Tuesday, August 29, 2023 4:00 PM
>> To: Thomas Gleixner <tglx@linutronix.de>
>> ...
>> BUG:unable_to_handle_page_fault_for_address
>> ...
>> [    0.139017][    T0] BUG: unable to handle page fault for address: 027025c4
>> ...
>> [    0.139017][    T0] CR0: 80050033 CR2: 027025c4 CR3: 02cdf000 CR4:
>
> The bit31 of CR0 was set which indicated that the paging was enabled as expected by your patch [1].
>
>> ...
>> [ 0.139017][ T0] EIP: load_ucode_ap
>> (arch/x86/kernel/cpu/microcode/core.c:177
>> arch/x86/kernel/cpu/microcode/core.c:187)
>
> The fault EIP was due to accessing the following memory in the physical address:
>     check_loader_disabled_ap() -> return *((bool *)__pa_nodebug(&dis_ucode_ldr));
>
> Your patch [1] moved the 32-bit early ucode update after paging was enabled.
> So, seems like all the following places need memory access in the virtual address.
>
> I can't reproduce the issue if I apply the following patch.
> Please let me know if you want me to create a separate patch.
>
> [1] 7f1f6ace4ce1 ("x86/microcode/32: Move early loading after paging enable")

Ooops. I completely forgot to reply to this report. I've fixed that up
today in the morning already and pushed out an updated version into that
x86/microcode branch. It's pretty much the same as you did +/- a detail.

Sorry for stealing your time.

Thanks,

        Thomas
