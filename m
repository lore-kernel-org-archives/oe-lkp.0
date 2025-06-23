Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6D617F7
	for <oe-lkp@lists.linux.dev>; Mon, 23 Jun 2025 11:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750678170; cv=none; b=ZC5IVN9FrPhv483qxLIdIB5YPoGyU+jCavHbs88ZRCeH8d8Ied9wc5buD5nLoF8c4fmUyGvMAQpk2QzPHvCvphf9Z7+uR1Hson4IFATvhyqPDOJztasQeWXOJ01p7lZ4IBYW+zd8oESbudInX48jwLORnM+tcD4fqep9tBYQ86I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750678170; c=relaxed/simple;
	bh=wLQFKtSJGzFg4lKtATX7H7j9UPlk+P13KegXT5k15Eo=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TwyVlRKZ6arpAMPLhSlhT0vaDuCr9OZsriEGJV9lKtP+a+N527iINCIrzYWZUkMO7qyPd7/IFHNv7RHjADR5ll7KzSlKg5aVnwIjFGm90XqUrDTfcM2QZmOSNeYD1PPj4RIXoehaNqQxBxwDYVUB3unZz8KQmMBxvRDYo3EisPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IFIKamBY; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IFIKamBY"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-32b43cce9efso32451581fa.3
        for <oe-lkp@lists.linux.dev>; Mon, 23 Jun 2025 04:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750678167; x=1751282967; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YgfPRIB+BYAuUXDEK/9DOfwH7aJtQFPBBRMLIHLTgX8=;
        b=IFIKamBYdUr829ePP9SO0Bt0mSC4euJ63MisYtbntW9akjz8YgJ4z1Wxz2GcTmZ6Aq
         MHjI2A2g2f+JJAK0lctjirCNITRskjEvRGii7MXVwHvRARUgAmFGFlOH2AXP9s0D74ZL
         Uvd3yABUIjPWXdBKC9XB4SCrIPbztVouvQ4W2byx/9EGVtp0Yjv2G/J3ROHa6fQ/NIcK
         +ImsWvVqlsO+d7aPwThnxKTf7webgSOxoQPfJJk/z8+3raFfreLGxNs+4WheeK5Gi/bn
         smfTdbIjRxoqk12gkckECbDwF3BeTgW0duqYsj6/NAcdZQ4IDA5mdQcn2PQiPuTdkyFq
         2SGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750678167; x=1751282967;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YgfPRIB+BYAuUXDEK/9DOfwH7aJtQFPBBRMLIHLTgX8=;
        b=EUs8Cms92jLGK8G5VD6Kayuw7ePU7cdkH4m/6D3oCJkPMPK6U9avJJrdpBpaDziMtc
         uMhkVZg9T0I//7i98u4X/B2SL8JEzoUBupdGN9wGW/5517Ux1apzJ3wG3aBwqm85wjTW
         LHSumFc6P7REUZngfgFLyYVEcgeJM8Ehi7RkuX/p7VP792GYUzOI0kPvohy7+pJo+KXv
         SA77qq9jyvc9eyhEVveQh3mFnamnDuxEBIOERVfWWVvJm23npSh0y8xbk8OolYueXxpn
         agDck04P+Ne8NL4enT8qI4rHA82CzoV+WMk/hdq2VviT0ucw8NTRYOuxrHJ3cuPy4dAU
         gjXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHo/ywuIRT7dfR2SLj7Ms2yXwHoz2jurv9NlR00LUSAYSiXU6/4R9Q+gBrtUOTB1Z7tjehNX4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzmAAn6iO4hGBzVeV2mEOpF+czN/NbTBuB+1VGVMGLaeQiZKqiw
	0Shr5CnsIA9TzhzTeR0Nd5bSkZuzfY84l0mU0EehOKAVV8t9JyTTJplX
X-Gm-Gg: ASbGncsMPl5j2/HRXHlNVRDVvU2k3NEYX4ESwsIC9G9QmYLNkpFVYc88/iHSdSVFFZD
	pzNi4sSgA4rQh0B6TsNPt+GSFrtHd8uTcFRy/7zG6fIi2IKiQb1i8qbEOvRN30OnB/NYpaP3/1G
	ItHiQ0haO3Mz39aSiGHWrFnqpgigo7RWrRzymvSVY5lIclg5lOPQBTmlkToHOhEs1jk0BNH/RUy
	JLxeD7HnntwdFKQgxqm09vcqbs915LjwBDmEcrSUuqy4a0RvSjRFdZX8YjQweFRgvIXn1iaP/qU
	ur3hN2q/D0Iev1UfHIw6BmM26L9rkcEOsH/l6YahwtXEwgeZe20kVyeS5xADOR9O1g1zROfTADw
	rNwfZRvEdpR0=
X-Google-Smtp-Source: AGHT+IE1MZF6wlC72ECSHVOr+2VOUjVmkH4XiG30NEvX7gqf7FRE361lIOqKCXeUz4nUIgSU9qz8Zg==
X-Received: by 2002:a05:6512:3186:b0:553:34ea:fc41 with SMTP id 2adb3069b0e04-553e3d0ecdcmr3278922e87.56.1750678166243;
        Mon, 23 Jun 2025 04:29:26 -0700 (PDT)
Received: from pc636 (host-95-203-1-180.mobileonline.telia.com. [95.203.1.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41cc0d4sm1359864e87.197.2025.06.23.04.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 04:29:25 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Mon, 23 Jun 2025 13:29:22 +0200
To: Suren Baghdasaryan <surenb@google.com>
Cc: Uladzislau Rezki <urezki@gmail.com>, Harry Yoo <harry.yoo@oracle.com>,
	kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>, Adrian Huang <ahuang12@lenovo.com>,
	Christop Hellwig <hch@infradead.org>,
	Mateusz Guzik <mjguzik@gmail.com>, linux-mm@kvack.org,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: Re: Kernel crash due to alloc_tag_top_users() being called when
 !mem_profiling_support?
Message-ID: <aFk6krRwyMtbH0y4@pc636>
References: <202506181351.bba867dd-lkp@intel.com>
 <aFQaY4Bxle8-GT6O@harry>
 <aFQnEj0UASzl2Lxa@hyeyoo>
 <aFUgJgrc_eIHRy5-@pc636>
 <CAJuCfpHRVq+T8v-7J0kJ=mnbSJYX2kjG_8spgZFdfe4Tzbcs4g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpHRVq+T8v-7J0kJ=mnbSJYX2kjG_8spgZFdfe4Tzbcs4g@mail.gmail.com>

On Sun, Jun 22, 2025 at 03:54:51PM -0700, Suren Baghdasaryan wrote:
> On Fri, Jun 20, 2025 at 1:47 AM Uladzislau Rezki <urezki@gmail.com> wrote:
> >
> > On Fri, Jun 20, 2025 at 12:04:50AM +0900, Harry Yoo wrote:
> > > On Thu, Jun 19, 2025 at 11:10:43PM +0900, Harry Yoo wrote:
> > > > On Wed, Jun 18, 2025 at 02:25:37PM +0800, kernel test robot wrote:
> > > > >
> > > > > Hello,
> > > > >
> > > > > for this change, we reported
> > > > > "[linux-next:master] [lib/test_vmalloc.c]  7fc85b92db: Mem-Info"
> > > > > in
> > > > > https://lore.kernel.org/all/202505071555.e757f1e0-lkp@intel.com/
> > > > >
> > > > > at that time, we made some tests with x86_64 config which runs well.
> > > > >
> > > > > now we noticed the commit is in mainline now.
> > > >
> > > > (Re-sending due to not Ccing people and the list...)
> > > >
> > > > Hi, I'm facing the same error on my testing environment.
> > >
> > > I should have clarified that the reason the kernel failed to allocate
> > > memory on my machine was due to running out of memory, not because of the
> > > vmalloc test module.
> > >
> > > But based on the fact that the test case (align_shift_alloc_test) is
> > > expected to fail, the issue here is not memory allocation failure
> > > itself, but rather that the kernel crashes when the allocation fails.
> > >
> > It looks someone tries to test the CONFIG_TEST_VMALLOC=y as built-in
> > approach test-cases. Yes, it will trigger a lot of warnings as some
> > use cases are supposed to be failed. This will trigger a lot of kernel
> > warnings which can be considered by test-robot or people as problem.
> >
> > In this case i can exclude those use cases or even not run at all unless
> > boot-parameters properly sets if built-in.
> 
> Sorry, I'm catching up on my email backlog. IIUC
> https://lore.kernel.org/all/20250620195305.1115151-1-harry.yoo@oracle.com/
> addresses this issue. Is my understanding correct?
> 
I checked/tested the .config from the test-robot in order to reproduce
the kernel crash. Unfortunately i can not trigger this. But, people from
the another thread already confirmed that it solves the crash.

--
Uladzislau Rezki
