Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA27222574
	for <oe-lkp@lists.linux.dev>; Mon, 23 Jun 2025 11:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750678570; cv=none; b=NsSJgXZk1qpM7CyH0g3tKqIpsGZPV74fNn5DTWro3beVhUo/Qe5ieYRHO7vG/pMzm/Ws7a/F7yHGVqZ1CTTJYTJEZvz6dPBcXE++qNZct61E9aY6LAi7EYU1koSQQ9ERm8m5mzmkPBmeZa0TntAjWPtgiy4oFsslzZFvri+qbd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750678570; c=relaxed/simple;
	bh=ZFd7k3PI35/uLKQfV7Afn6XOJIuiDc+wW0uU2AMwEIM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fb0uJWbTQYjHn0rRqo/SB0WdAzx7NtQfEZvl5Zg9N1oRxAYS5pkq1U4AksAuk29wVBIAcSHe2Nz73tKy4fakQEnzATo9q8Sr4oX7qZeMJNBlfYKinbsjOiqNvmZ8BO6lknXVoHOX6x3HjbH4LOLFAsg3Tpo1xYzahK/eJsvEHAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E/JIikFi; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E/JIikFi"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3105ef2a071so45858311fa.1
        for <oe-lkp@lists.linux.dev>; Mon, 23 Jun 2025 04:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750678567; x=1751283367; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DlJHuROHmBDzciOtFdTsSex+vDj1whTc4hjnLYC1zuQ=;
        b=E/JIikFiCCkSCV3oLJbw10GOyczto9T+gVYUvXQdsIYCzo7czS85g2iNDDKGyXm5qN
         cPsBT1KAUKq0YA7/EmpgQgoKv4haMvCXxl+wpB7Scvsb7G1yw46p2zmj2Eh+ZcsAQnHJ
         gfPi4+h8C8IL6TVs/Xmg4oRqJN6srri1hWXtMMTDIFmRfMUUqA0GaOXNx19igHGlggON
         ryieWTPyI6fIdrgxD7aJS4D1yXsO7DHShTzZ8k4IPEPPxZpJEpTJVvbokSVP8+SFptDo
         m3Qw/NWnYTCUiUmoYfoatn+9lO920v43j6NRNlghzPVQy1MF890NJosoobRFDbVlutkW
         3Kug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750678567; x=1751283367;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DlJHuROHmBDzciOtFdTsSex+vDj1whTc4hjnLYC1zuQ=;
        b=LEFCJMJ0Da7nmNkMAudwGRUzghw9SZfiU9DWsqpfeFrq1shIciIfuKvyBTR4BeuCum
         w9ccs/AnjWlCdeRgyzbORhh+eJpMVp6LfoM0XWrAzbICCZtKDlgvHvDS+WF9Ps17kSkN
         2yivjYG0qICUTlzAwKQqk9o8Ugfh9+bU9g1jx29YrJtGBMpEF9xuwC8DeiUv0ccZjssI
         snzUI+J4ItArzeznPcE7TgPBNKCTMKlftW7ytILcxP/S0Lvekv7L9Vn4rPy9KuMmI/Us
         3uQlicva4F6s/CLooEMW2g5myvqYJOuU5PCxqwrFNt0v4ymrqeUvBlA2wVFciK4YwQjk
         zuWg==
X-Forwarded-Encrypted: i=1; AJvYcCXGDCXu4fg8Xk3iOUCQ0/R8+Nn1Eyx5BCNh8y8IIad/8xwSQECeBwTAUf6SAv5/d3bHgNgMVLY=@lists.linux.dev
X-Gm-Message-State: AOJu0YweViW/8zeg3p0PXVqujtVEWEWlIFQnPJYzM4Fxn9cH75LNsgDE
	WrTN87qCUud5m4rpZ91UDpLdXFC3dTFZmdH4NwtMh2usTJprXX0qGxVE
X-Gm-Gg: ASbGncv21Uo4hIXRNsJqJsKh3lhYN/0HdRBk8cHNuXRCxB8QmXPWSrgfnI3kNu8aBw6
	5jDMywlPdwE39IN/Ja2FUIkbEiGdRi6IDYg3KxmROfBZ4L9ZGC3lpeCqsfZJ5NSwVBeJ3mBeGj/
	ug4Q5ML+bA41tR+KmBnTvBk/ssgDn4mz3H15zFznbfzXYE+Gt89XI0vOCdyNvX8J49hDoGS0fRb
	yq8nG8MSSVQO9Nm9vkAe/zVYeE1wo9INL4H/rhW3zLPPZ2fUiVOeIuEpOJtJx6AO+sLOho91ych
	fRCilX+MjyCM06Pq8V7H8ZHTBycVAT5IXO7EqTv80fYLhAbSuq3cUpL1yn+Oq5YuaLjvN5+QmzQ
	2Eon8oK/448w=
X-Google-Smtp-Source: AGHT+IGCoTf2/sK16URuJGlv/NEhBkck1QcOgj4h8WXpgeP6+mwYonBkdE86Wp1LGEoSP1Uo34TBug==
X-Received: by 2002:a05:6512:3c88:b0:553:cc61:1724 with SMTP id 2adb3069b0e04-553e3bb51camr3527946e87.24.1750678566827;
        Mon, 23 Jun 2025 04:36:06 -0700 (PDT)
Received: from pc636 (host-95-203-1-180.mobileonline.telia.com. [95.203.1.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41bbc84sm1371439e87.112.2025.06.23.04.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 04:36:06 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Mon, 23 Jun 2025 13:36:03 +0200
To: David Wang <00107082@163.com>
Cc: Suren Baghdasaryan <surenb@google.com>, oliver.sang@intel.com,
	urezki@gmail.com, ahuang12@lenovo.com, akpm@linux-foundation.org,
	bhe@redhat.com, hch@infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, lkp@intel.com, mjguzik@gmail.com,
	oe-lkp@lists.linux.dev, harry.yoo@oracle.com,
	kent.overstreet@linux.dev
Subject: Re: CONFIG_TEST_VMALLOC=y conflict/race with alloc_tag_init
Message-ID: <aFk8I4qNG9ntonTa@pc636>
References: <202506181351.bba867dd-lkp@intel.com>
 <20250620100258.595495-1-00107082@163.com>
 <CAJuCfpFLKR7CqAHG+QjHt4wCLgWmP7dD+f5D8Jx6gHUoXSe1AA@mail.gmail.com>
 <375419f4.2ba1.1979aad313a.Coremail.00107082@163.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <375419f4.2ba1.1979aad313a.Coremail.00107082@163.com>

On Mon, Jun 23, 2025 at 10:45:31AM +0800, David Wang wrote:
> 
> At 2025-06-23 06:50:44, "Suren Baghdasaryan" <surenb@google.com> wrote:
> >On Fri, Jun 20, 2025 at 3:03 AM David Wang <00107082@163.com> wrote:
> >>
> >> On Wed, Jun 18, 2025 at 02:25:37PM +0800, kernel test robot wrote:
> >> >
> >> > Hello,
> >> >
> >> > for this change, we reported
> >> > "[linux-next:master] [lib/test_vmalloc.c]  7fc85b92db: Mem-Info"
> >> > in
> >> > https://lore.kernel.org/all/202505071555.e757f1e0-lkp@intel.com/
> >> >
> >> > at that time, we made some tests with x86_64 config which runs well.
> >> >
> >> > now we noticed the commit is in mainline now.
> >>
> >> > the config still has expected diff with parent:
> >> >
> >> > --- /pkg/linux/x86_64-randconfig-161-20250614/gcc-12/7a73348e5d4715b5565a53f21c01ea7b54e46cbd/.config   2025-06-17 14:40:29.481052101 +0800
> >> > +++ /pkg/linux/x86_64-randconfig-161-20250614/gcc-12/2d76e79315e403aab595d4c8830b7a46c19f0f3b/.config   2025-06-17 14:41:18.448543738 +0800
> >> > @@ -7551,7 +7551,7 @@ CONFIG_TEST_IDA=m
> >> >  CONFIG_TEST_MISC_MINOR=m
> >> >  # CONFIG_TEST_LKM is not set
> >> >  CONFIG_TEST_BITOPS=m
> >> > -CONFIG_TEST_VMALLOC=m
> >> > +CONFIG_TEST_VMALLOC=y
> >> >  # CONFIG_TEST_BPF is not set
> >> >  CONFIG_FIND_BIT_BENCHMARK=m
> >> >  # CONFIG_TEST_FIRMWARE is not set
> >> >
> >> >
> >> > then we noticed similar random issue with x86_64 randconfig this time.
> >> >
> >> > 7a73348e5d4715b5 2d76e79315e403aab595d4c8830
> >> > ---------------- ---------------------------
> >> >        fail:runs  %reproduction    fail:runs
> >> >            |             |             |
> >> >            :199         34%          67:200   dmesg.KASAN:null-ptr-deref_in_range[#-#]
> >> >            :199         34%          67:200   dmesg.Kernel_panic-not_syncing:Fatal_exception
> >> >            :199         34%          67:200   dmesg.Mem-Info
> >> >            :199         34%          67:200   dmesg.Oops:general_protection_fault,probably_for_non-canonical_address#:#[##]SMP_KASAN
> >> >            :199         34%          67:200   dmesg.RIP:down_read_trylock
> >> >
> >> > we don't have enough knowledge to understand the relationship between code
> >> > change and the random issues. just report what we obsverved in our tests FYI.
> >> >
> >>
> >> I think this is caused by a race between vmalloc_test_init and alloc_tag_init.
> >>
> >> vmalloc_test actually depends on alloc_tag via alloc_tag_top_users, because when
> >> memory allocation fails show_mem() would invoke alloc_tag_top_users.
> >>
> >> With following configuration:
> >>
> >> CONFIG_TEST_VMALLOC=y
> >> CONFIG_MEM_ALLOC_PROFILING=y
> >> CONFIG_MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT=y
> >> CONFIG_MEM_ALLOC_PROFILING_DEBUG=y
> >>
> >> If vmalloc_test_init starts before alloc_tag_init, show_mem() would cause
> >> a NULL deference because alloc_tag_cttype was not init yet.
> >>
> >> I add some debug to confirm this theory
> >> diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> >> index d48b80f3f007..9b8e7501010f 100644
> >> --- a/lib/alloc_tag.c
> >> +++ b/lib/alloc_tag.c
> >> @@ -133,6 +133,8 @@ size_t alloc_tag_top_users(struct codetag_bytes *tags, size_t count, bool can_sl
> >>         struct codetag *ct;
> >>         struct codetag_bytes n;
> >>         unsigned int i, nr = 0;
> >> +       pr_info("memory profiling alloc top %d: %llx\n", mem_profiling_support, (long long)alloc_tag_cttype);
> >> +       return 0;
> >>
> >>         if (can_sleep)
> >>                 codetag_lock_module_list(alloc_tag_cttype, true);
> >> @@ -831,6 +833,7 @@ static int __init alloc_tag_init(void)
> >>                 shutdown_mem_profiling(true);
> >>                 return PTR_ERR(alloc_tag_cttype);
> >>         }
> >> +       pr_info("memory profiling ready %d: %llx\n", mem_profiling_support, (long long)alloc_tag_cttype);
> >>
> >>         return 0;
> >>  }
> >>
> >> When bootup the kernel, the log shows:
> >>
> >> $ sudo dmesg -T | grep profiling
> >> [Fri Jun 20 17:29:35 2025] memory profiling alloc top 1: 0  <--- alloc_tag_cttype == NULL
> >> [Fri Jun 20 17:30:24 2025] memory profiling ready 1: ffff9b1641aa06c0
> >>
> >>
> >> vmalloc_test_init should happened after alloc_tag_init if CONFIG_TEST_VMALLOC=y,
> >> or mem_show() should check whether alloc_tag is done initialized when calling
> >> alloc_tag_top_users
> >
> >Thanks for reporting!
> >So, IIUC https://lore.kernel.org/all/20250620195305.1115151-1-harry.yoo@oracle.com/
> >will address this issue as well. Is that correct?
> 
> Yes, the panic can be fix by that patch.
> 
> I still feel it better to delay vmalloc_test_init, make it happen after alloc_tag_init.
>
We can, but then we would not notice the bag that is in question :)

At least we should, i think, to exclude the tests which trigger warnings
when the test-suite is run with default configurations, i.e. run the tests
which are not supposed to fail.

--
Uladzislau Rezki
