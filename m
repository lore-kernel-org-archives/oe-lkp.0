Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B172A194C87
	for <oe-lkp@lists.linux.dev>; Wed, 29 May 2024 16:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717000710; cv=none; b=Ets48SSSUNjcBIoWUDsiuQKarVG5u0gLcuLHC/iVIbEoFKbgzJ+PpzNAYHJ8h3GkaUIm15Okq3WyDXsdmsbgQqJAjnMTlO/uMtfuuXo/QKL2Z9CdWFmwsFOk8voywECAz2hryBx7jwt1pHrxl7e++1qdch3EbA4PkO7yOgl2mpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717000710; c=relaxed/simple;
	bh=n62JW954QEMEN8kU8631qHanrwdqcccUF5S3VBPtOqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tq6ugkVea+1aEe8LA0bLrZBB/Kx73jlpAO4OMjjRn3vp4wLf3ALysEZHwfOYJJw6quVPmfXzMQ+bRgjgMJ22nRX+zfLSjxoXvBsxdrQJObnZAZD3qlcxCn92xY/zFim6WQAvWoyIao9fbewA/SCM0XFpWtYQN84sUXCEQfuOfEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Dk1nR+/n; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Dk1nR+/n"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52b0d25b54eso1400673e87.3
        for <oe-lkp@lists.linux.dev>; Wed, 29 May 2024 09:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1717000706; x=1717605506; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RCN7EOEnVC70hLcRtdygQ9XQdGWocXnG58vuARKxgkQ=;
        b=Dk1nR+/niPFKoYjHdLnflmbT+D7ol9upndGpIxDMngPCKEoyZaBhxvVaI13mnU4M8M
         +wMQfJypHkan1yzcLnHwHQ114mnwAJnpIUQmKOBXzbscZ0vGstIswID0hBVGHHR+pEVj
         uVTwABSk/cuzD9d7kUUriegyoonzy2aWxJdKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717000706; x=1717605506;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RCN7EOEnVC70hLcRtdygQ9XQdGWocXnG58vuARKxgkQ=;
        b=H/hQtqtPSvNYtZ6Qd7dunmtQdfb8nWGpeG9l9bVtM8p4z1FE3D7G4oXU5r34ttgqtq
         zoG+Qs183WpC6msjwCihLiAAw76t6fEVDln6A7ECeAsDXl1+rL2mViPyWXpfnbDfHcmI
         6QARSbeuI8SmjZ9gPChFIPH1XVsxvGQTxUtB0e0DL7pQxZxYzioNfPPW49BvShhk03ap
         i5Nav2UXEOOgIMLHeqdSD+OC7Xj9B6/vy6DqZiG8MMdyq1nI/tRD2n3pDivyyl2hLOSG
         PeqzLr8ME3l0NC0yBdKKRBi1X3JB8Kmp36dMzS33P7O3Jx39jKGYWO6s5gKV+FeutpKV
         xcRw==
X-Forwarded-Encrypted: i=1; AJvYcCWX2w1cON+CR/Bxfb75+8fNRNORKdGmVmaMLTcxLDcJT8eWk9wP2MZqa67tgSYiSmOJvcsHtMBYOKEh3m6oULkXqFFlW4R1
X-Gm-Message-State: AOJu0Yz0ioTXBElj6CkD9PARqQw/8qe8Jow7v8NAqFB+S4FLQKNDp6Sd
	NW+2jMiGUhPWxw5jGBPV3wqV7XkT/DybccSYFPlUYx7L3eBloiLCrSLCa4qSFKKCBs96Cb3j1zV
	KRFKaLg==
X-Google-Smtp-Source: AGHT+IEjRTgQd6ICGufuMgYL8VnQbplDvg6pbJvXyt/QxrCjmSs3sHfz0fhj2q2YVsVbpHIJ3/NYVw==
X-Received: by 2002:ac2:5ec5:0:b0:52a:fdcb:6649 with SMTP id 2adb3069b0e04-52afdcb66e4mr1748404e87.62.1717000706548;
        Wed, 29 May 2024 09:38:26 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5296f227265sm1317855e87.115.2024.05.29.09.38.25
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 09:38:25 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52388d9ca98so3579006e87.0
        for <oe-lkp@lists.linux.dev>; Wed, 29 May 2024 09:38:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWjUEzh/GIFbsqr5rvuF/p01GfbjYfmV/MfkHzDdovZeqi9YMTMxopWi+pASIV5ulw2iJMmhy+L870JS9e9H0Rfo/W+w9CU
X-Received: by 2002:ac2:454e:0:b0:521:92f6:3d34 with SMTP id
 2adb3069b0e04-5296594cf46mr11225856e87.22.1717000705215; Wed, 29 May 2024
 09:38:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202405291318.4dfbb352-oliver.sang@intel.com>
In-Reply-To: <202405291318.4dfbb352-oliver.sang@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 29 May 2024 09:38:08 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg29dKaLVo7UQ-0CWhja-XdbDmUOuN7RrY9-X-0i-wZdA@mail.gmail.com>
Message-ID: <CAHk-=wg29dKaLVo7UQ-0CWhja-XdbDmUOuN7RrY9-X-0i-wZdA@mail.gmail.com>
Subject: Re: [linus:master] [vfs] 681ce86235: filebench.sum_operations/s -7.4% regression
To: kernel test robot <oliver.sang@intel.com>
Cc: Yafang Shao <laoar.shao@gmail.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Waiman Long <longman@redhat.com>, 
	Matthew Wilcox <willy@infradead.org>, Wangkai <wangkai86@huawei.com>, 
	Colin Walters <walters@verbum.org>, linux-fsdevel@vger.kernel.org, ying.huang@intel.com, 
	feng.tang@intel.com, fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 May 2024 at 22:52, kernel test robot <oliver.sang@intel.com> wrote:
>
> kernel test robot noticed a -7.4% regression of filebench.sum_operations/s on:
>
> commit: 681ce8623567 ("vfs: Delete the associated dentry when deleting a file")

Well, there we are. I guess I'm reverting this, and we're back to the
drawing board for some of the other alternatives to fixing Yafang's
issue.

Al, did you decide on what approach you'd prefer?

                     Linus
