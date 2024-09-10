Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21D618B493
	for <oe-lkp@lists.linux.dev>; Tue, 10 Sep 2024 09:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725961260; cv=none; b=TQ4bQUJnKkAubTR7vXdpWQ2Ym/PdXg1qBmGDOT4dCZG14tiIeDagmCdqQBtZKdqlcnUUYx2dI9hPD33uNCOBD5RWuPHcJOJUGdXwoPTYODijaUL++Lhvdtdo/lo/jQ6g6V/l0MWFPdxj3d+NtM6LrJux5Obf7HthU9XVY/WOKlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725961260; c=relaxed/simple;
	bh=QezpWS23xd5vJDMMNigCK5XhC99wLHRZ/swRepKuqCc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZqLSrE3SyvraV916RpIa3OsQ+bG2aovdVLRFb/7V8dLoQkUknF+negcCH4hnqQcD0mM6jxjcYv7rjrjTI7qHvXZG7rg/z3fT4yUS+ZLZzjT9VqNBUQo7YDSDytcPgqfFO3VXIZHQRL+vT+u/SIQz1kq0LEanc+pMRZJS6OoSDcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dGLHjnBu; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dGLHjnBu"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5365928acd0so4757984e87.2
        for <oe-lkp@lists.linux.dev>; Tue, 10 Sep 2024 02:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725961257; x=1726566057; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fajWxBiy4PS4lT/zSjH/RDRg02stX3Be05OcCvOuUaI=;
        b=dGLHjnBu0dsXUAZ5WC7h5ruj63xh3vc+YIuCdjcxswTvDvMG+fMIX19Y3aHknhntCP
         BzRAYQXiUYG11zTJil5un4ntkzvg55XLfOkaEsIA4m1+HZiGWfd+h49vip5FPDzJl82B
         HrSCz6kSnNNrZtW4fAtdapDbeqTLBo3v/6DgXqlMoD1a9p2vK5Qe3RzjEfobVTzovjOw
         okDtb3Hw3OhtdsbdjF7jmLiPeBoNZKk/DDUf2vX6voyP1oQMD9OGPuXYNJhcRUwc06RQ
         R+P8UWeOKOAKXWcoesp3svm5GXzhLdxY1dzsk5GioYLMdWv2v87ghCRwUstZhxrx+xSZ
         FIDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725961257; x=1726566057;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fajWxBiy4PS4lT/zSjH/RDRg02stX3Be05OcCvOuUaI=;
        b=LnXgS9vc84JW+vcDR4K2GkYn3qlF2YK+NfuoHoVbGjaVrgfmNPYVwE+hWfXIOnF1Yr
         tGsACs93vTcASENumu0Q36DEKXZAdmpGqtGvZvIQ3dKDzIfeIE94oAA9rUazCky4W0NG
         z5QUgu4vOg25X0edKj02bFXu3dsJdezVwvzHJ6v0hFgcwGy/Pj6izi4NOnEj2LpmjZIQ
         PyOIW/WOPQOIZ6t4wIxEvPpf0J8HTkfShOims7UBTx3pym2HsOsPfOFLxt5bJ83f8Zez
         GdgbYyhvacdSzAnMDER0uX7Y7yAn2JmC+EeiiG/Af8zVm4GpYYrgnm7Bei995yZhA3O0
         vllA==
X-Gm-Message-State: AOJu0YynHTjqP5uI2MNJUnM/xbpiQqsOh9hge923J2ZdG1z9Y4kGwEVF
	bKgMqZorFoGasB+MgUi/BgWCfM3WKLVkz+0rs4TmQToZmKLaeCzu
X-Google-Smtp-Source: AGHT+IFR8pHm2fMH39Q46tLYMV0naDybZlhCm5bcPv5GJ0t8ujY0n6ef4iASZg0nRoroU8WNUNqkeg==
X-Received: by 2002:a05:6512:1092:b0:533:e4d:3374 with SMTP id 2adb3069b0e04-53658813b0emr8796902e87.57.1725961255684;
        Tue, 10 Sep 2024 02:40:55 -0700 (PDT)
Received: from ?IPV6:2001:6b0:1:1041:b4e6:135d:cfae:1d65? ([2001:6b0:1:1041:b4e6:135d:cfae:1d65])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f870b71sm1059500e87.95.2024.09.10.02.40.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 02:40:55 -0700 (PDT)
Message-ID: <a0d77ee7-ff3c-4c63-903c-e7c9e2fb70c7@gmail.com>
Date: Tue, 10 Sep 2024 11:40:54 +0200
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [tip:locking/urgent] [jump_label] de752774f3:
 kernel_BUG_at_arch/x86/kernel/jump_label.c
From: Klara Modin <klarasmodin@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
 kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
 x86@kernel.org, "Darrick J. Wong" <djwong@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>
References: <202409082005.393050e2-oliver.sang@intel.com>
 <20240909091531.GA4723@noisy.programming.kicks-ass.net>
 <20240909105623.GH4928@noisy.programming.kicks-ass.net>
 <4a554ab4-b53b-485f-beef-96001100511a@kasm.eu>
Content-Language: en-US
In-Reply-To: <4a554ab4-b53b-485f-beef-96001100511a@kasm.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2024-09-10 11:39, Klara Modin wrote:
> Hi,
> 
> On 2024-09-09 12:56, Peter Zijlstra wrote:
>> On Mon, Sep 09, 2024 at 11:15:31AM +0200, Peter Zijlstra wrote:
>>> On Sun, Sep 08, 2024 at 09:06:55PM +0800, kernel test robot wrote:
>>>>
>>>>
>>>> Hello,
>>>>
>>>> kernel test robot noticed 
>>>> "kernel_BUG_at_arch/x86/kernel/jump_label.c" on:
>>>>
>>>> commit: de752774f38bb766941ed1bf910ba5a9f6cc6bf7 ("jump_label: Fix 
>>>> static_key_slow_dec() yet again")
>>>> https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git locking/urgent
>>>>
>>>> in testcase: boot
>>>>
>>>> compiler: clang-18
>>>> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 
>>>> -m 16G
>>>>
>>>
>>>> The kernel config and materials to reproduce are available at:
>>>> https://download.01.org/0day-ci/archive/20240908/202409082005.393050e2-oliver.sang@intel.com
>>>
>>> So the whole thing actually boots and works on my real machine, so I had
>>> to resort to using this qemu nonsense, as such I did as instructed in
>>> the reproduce file.
>>>
>>> I build the thing using clang-17 (for some reason debian is shitting
>>> itself trying to install clang-18 on this machine and I don't want to
>>> spend the day fighting that).
>>>
>>> Except, once I do:
>>>
>>>    bin/lkp qemu -k /usr/src/linux-2.6/tmp-build/arch/x86/boot/bzImage 
>>> -m /usr/src/linux-2.6/tmp-build/mod/modules.cgz job-script
>>>
>>> The whole thing grinds to a halt like so:
>>
>> Since I'm not able to reproduce, could you please run the thing against:
>>
>>    git://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git 
>> locking/urgent
>>
>> and see what that does?
>>
> 
> I hit this bug on today's next. Reverting 
> de752774f38bb766941ed1bf910ba5a9f6cc6bf7 and applying the updated 
> version (6b01e5a8c11611a3dbd3d9efd915427cbce9352a) fixed it for me.
> 
> Thanks,
> Tested-by: Klara Modin <klarasmodin@gmail.com>

Sorry, this should now be from my usual email.
