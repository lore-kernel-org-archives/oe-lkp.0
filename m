Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6E133EC
	for <oe-lkp@lists.linux.dev>; Fri, 26 Dec 2025 20:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766779317; cv=none; b=lP0BVZOzp7yPPp2phUctz3Yf6kfzDe8D2yTowv8RnXogeSjxB068Pv+4I9nfP5UgRNgyp4H3uqPUdO7MFhq4r3Q2/3vTT6cvsEeqT8eKbay4KA56i7snYU+IJMUoqz8SEBUQO/k322Z9ghqsFimE0wQ+cVhXc03bPlJyz8AmCBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766779317; c=relaxed/simple;
	bh=QQyG4KMrALCAk4qB42lsLkH4v13igT5T+7TUGqsvJ7M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nr3utyKiSImt/CGMeXrn/BVYzj4iAXE2A0mDP9rDzoWtlqmiO+WgFaLvAc2yw7yDAqRvwPbuw0gK+lvj712XuJ+4UGJPCJygV0FX6zI7P5lnlffJzP5a59Fx09Q62JWK8YhlNpCQECIFABaS2TFjNmsEnCcMXSHvcw5YGMOrTyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=di5Kb9pn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="di5Kb9pn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766779315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ojpffjf9WXO3wNJhOKSQJLHQbbSlgOUFtmMuKKKVw8E=;
	b=di5Kb9pntoxLcQdaqJOLu0x7MR5v7TSCCV9GZ66KhO3bvgsTvpHQPK3/TNB5eUWsjesIG3
	PfWrZXCqHOz342YVJr1MhlygDpyb097OUUJ7+vWMMb/HooVc7qqFBLYT7IOMgT6V6LC8Q3
	2zFHeBHj6Q4+9x325Sk7IFwX84G7X+w=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-3XO08wePMM2BJ_iwRnQr2A-1; Fri, 26 Dec 2025 15:01:53 -0500
X-MC-Unique: 3XO08wePMM2BJ_iwRnQr2A-1
X-Mimecast-MFC-AGG-ID: 3XO08wePMM2BJ_iwRnQr2A_1766779313
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c1fa4a1c18so181175285a.3
        for <oe-lkp@lists.linux.dev>; Fri, 26 Dec 2025 12:01:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766779313; x=1767384113;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ojpffjf9WXO3wNJhOKSQJLHQbbSlgOUFtmMuKKKVw8E=;
        b=TS1Vxq/jtxMI7zbA5iHNjPVsKh5a8CIGW/8xItTAXmH4fyn7DFjWUYbXIShLzdrqs9
         4D3WOOCmB9nOhA79w/kZ9AFtg1yDgGvHBKFSkh7/GZMN3YO47cdQee37iZkOCYFwcO97
         +4D1bKO4HJ21zglxEj2zB7/EKmUD5WaOz7Y9cVTPpbbwcOSUKPyJRi62ko4HQhzmm+gi
         taj6dFslMUJe4lcZxWDAAY+imuRxk0bx1V6afuPDBfRCd5mH7gW+364uhf7K6rb3+Df/
         y5fN5fpUF39ZttcxMQn4LduGnN2gBqcFsYEnnB5jPNK8f4g+lEQDTZGqflJ9/noetyEy
         n7qg==
X-Gm-Message-State: AOJu0YxeSA50YrIUftP3vTVbY9OYALOHEuPn5PsgCVQQJxpDS2kFfk3J
	QaTredaGiftKwfZoQt4N2nUNhr/RJ5h3mYalsc7F3cFxb6v/86z3kzY6E7ZkyWOxqE5xYcSznCq
	84SUbVeKXb00ICsMAtzBgzBGgGr5uXVXl9p6S7I0mS2V0QnQB75/25gso5A==
X-Gm-Gg: AY/fxX5hPGAHxw7O6jgAOgG9Ku0WX8y2QFICcyWbtqd18vUmsUO11UAuoS6++4mbBXz
	ijVJccmMcvrefMOrduBPePNkMAccSl/+5cRt24RPesMG8e5gaslLAAtaWqvICPg0LOWTlYz7cIk
	eSIecsSuAxzUjFXcgQkhYa6nnK+BVBaAeIqW8dgUXfrmTRbqFqJfo0cuC9kOKLpFUFXBLVPO2jY
	+4GJazI79QSnL0brjtmp6is2QKH63NfZ2D7Lqg1t9gHr376GagS/bkrytn60MYwu9qIQUGfb8+e
	tuIM1Pc3b5YwW6o0mL1zt5j21Bmv5QyBs9P106ulR/7i37YfGSyI41H/lI8rDr+JXK8YGwwV0tQ
	cSzvgCrk/8t08bg6s32gc2RCFgaAB2oZptrCBf/04NtU7T0BtsQA=
X-Received: by 2002:a05:622a:3cc:b0:4e8:baad:9875 with SMTP id d75a77b69052e-4f4abccf532mr368603481cf.4.1766779313169;
        Fri, 26 Dec 2025 12:01:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZnYKkCFK7rhcnq+xYC/+SDh2RlrIBRh7zni7hxgTjidevNQ22xkFYWKyG03JlVIxpiZ0mxg==
X-Received: by 2002:a05:622a:3cc:b0:4e8:baad:9875 with SMTP id d75a77b69052e-4f4abccf532mr368602871cf.4.1766779312766;
        Fri, 26 Dec 2025 12:01:52 -0800 (PST)
Received: from [10.0.0.82] (97-127-77-149.mpls.qwest.net. [97.127.77.149])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac62f59csm161375721cf.20.2025.12.26.12.01.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Dec 2025 12:01:52 -0800 (PST)
Message-ID: <fb920248-a0fc-432f-926f-c27b1760de58@redhat.com>
Date: Fri, 26 Dec 2025 14:01:50 -0600
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master] [fs] 51a146e059:
 BUG:kernel_hang_in_boot_stage
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
 Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <202512230315.1717476b-lkp@intel.com>
From: Eric Sandeen <sandeen@redhat.com>
In-Reply-To: <202512230315.1717476b-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Wj4ODgGUuu4XShhSYgsjFiycYuFMVIgce_4YgzQC6Do_1766779313
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/22/25 8:36 PM, kernel test robot wrote:
> 
> 
> Hello,
> 
> 
> we don't have enough knowledge to analyze the connection between the issue and
> this change. just observed the issue is quite persistent on 51a146e059 and
> clean on its parent.

Odd. Not much to go on, and I don't see any obvious connection either, but
I'll see if i can reproduce.

In the successful dmesg it looks like devtmpfs was next up, maybe that's a clue.

This is probably a classic case of assuming that removing dead code
"can't break anything!" without enough testing. :( I'll see what I can find.

Thanks for the report,
-Eric

> 
> =========================================================================================
> tbox_group/testcase/rootfs/kconfig/compiler/sleep:
>   vm-snb-i386/boot/debian-11.1-i386-20220923.cgz/i386-randconfig-2006-20250804/gcc-14/1
> 
> d5bc4e31f2a3f301 51a146e0595c638c58097a1660f
> ---------------- ---------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>            :200        100%         200:200   last_state.booting
>            :200        100%         200:200   last_state.is_incomplete_run
>            :200        100%         200:200   dmesg.BUG:kernel_hang_in_boot_stage
> 
> 
> we cannot spot out useful information from dmesg which is uploaded to [1]. also
> attached one dmesg from parent commit (d5bc4e31f2) FYI.
> 
> 
> kernel test robot noticed "BUG:kernel_hang_in_boot_stage" on:
> 
> commit: 51a146e0595c638c58097a1660ff6b6e7d3b72f3 ("fs: Remove internal old mount API code")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> 
> [test failed on linux-next/master cc3aa43b44bdb43dfbac0fcb51c56594a11338a8]
> 
> in testcase: boot
> 
> config: i386-randconfig-2006-20250804
> compiler: gcc-14
> test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202512230315.1717476b-lkp@intel.com
> 
> 
> [   15.178608][    T1] signal: max sigframe size: 1760
> [   15.669386][    T1] rcu: Hierarchical SRCU implementation.
> [   15.785114][    T1] rcu: 	Max phase no-delay instances is 1000.
> [  104.130757][    C0] workqueue: round-robin CPU selection forced, expect performance impact
> [  110.182304][    C0] random: crng init done
> BUG: kernel hang in boot stage
> 
> 
> 
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20251223/202512230315.1717476b-lkp@intel.com [1]
> 
> 
> 

