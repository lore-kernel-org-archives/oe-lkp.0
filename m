Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB8313CAA2
	for <oe-lkp@lists.linux.dev>; Tue, 28 May 2024 09:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716887166; cv=none; b=HkcvRepF1wprvxpiKw0pY0cWPqYnA2DSl8kV/jPw6oukCt7+g9q71DaloEujoPCqN6DjnQAgAZjvLjz5omfp2jxs4L++0cNtaM42MliiYlmBAtgRCGf018IeVV3xIyaOF9/jjEucBAw9cR85Tx9Po6guVn0ZAUygdDxBWZdm2u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716887166; c=relaxed/simple;
	bh=IPoUmmQ9ywqnxNgyGdiwic0zYVLFK3kG7DBsH2IKA6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FuAudnWa4SlnDXB/0Z5OCJHkDzWKC9lXvKg0l0YZUqqyBgssrF4jIDu6jluJni1TQNDxGhEFbRrsh6RNJVKdHCrUoshkYHtunCG0r121AchaZUqv6+skMsF3vvMJYxdJMKrZFGSP1LvgIzVPN/Fic0M45rqGUt7GU2lgKyAD7s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ec+NEOu4; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ec+NEOu4"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2e95a1eff78so6926811fa.0
        for <oe-lkp@lists.linux.dev>; Tue, 28 May 2024 02:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716887163; x=1717491963; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h9GBjGS9fFbW/fU1vLeGXiJute0gIkIeWTpDiyJ3yp4=;
        b=ec+NEOu4Cm8gHLDsD6B5drDy5tfwtdRAaW75pF2n4GKqIs2BExT8Kw5sWammr32jX0
         lO2+fvxeXp2k8/3N7AbL0bZRo210oP+c0dK33dkxJ8C8klIcpx+9vfALXTKyO0svHbTB
         QECq+w57lZkY/w7KzpJMWAdmdEt351vzDVkWjbfXhF8oj/fzzmEx0pEi004n9YRlp993
         njdmmNRVplpICRaZxXCNRCV4gY9TLKhaaWuewZdn+DI7cgmYDE7eau6P4qoXgh82IsB4
         /vV+vELLYAw0bu8UMFtEnLerE9eAPnR2fguuhiiUAlNXfKhJrLIPsqkXq+p79u0FPlXT
         bBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716887163; x=1717491963;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9GBjGS9fFbW/fU1vLeGXiJute0gIkIeWTpDiyJ3yp4=;
        b=V0aBR3PDjnIU5glu4EKyk68zSujvX2SYSk3DastFWTJOtWRVR5yWvNMLupTBhok4uS
         +ZnP9M+ZpU2Z5JpZxmeTG0EOMO/5y2igHnALEiYyDu0yChHNG5DtuYuq4nI2ynNigKOS
         wta/24CHaNMc80GdsET2hbpw/11U27qTASxNurn1pIpPRIz4uJApVZ0xVwdTV5598gFU
         6mUgFpmKiI5oJALvvIIrAzzC9QXJ0+WNc0wx864TShRJDGwQNeTuBDBJij5BTkREO2ig
         z6giRnv+3NKISFQPEJSasAZ75DxZwNUp4+fypOrjopJePgaeQSH7iqvg7xW7zkBm0/IS
         7ccg==
X-Gm-Message-State: AOJu0YxTaGeL0DQ1l3W25IhbNoAdwGzSbRiVINhqeKFZ6SP0GHuyF/2n
	rxfuK7ZmXSRF9o6Rf+jh8lw+HjGo47zIvc3A8jpjwLeqsDPiUBct
X-Google-Smtp-Source: AGHT+IG7IJ8KKtLK3X6nQm3e0XhIyT4vFHu2mAvltAVPSuRSDVnJteTvWHRuSuhAbrSXJaGOw8GA5Q==
X-Received: by 2002:a2e:9c94:0:b0:2e2:a85f:f222 with SMTP id 38308e7fff4ca-2e95b042c1dmr111346181fa.10.1716887162532;
        Tue, 28 May 2024 02:06:02 -0700 (PDT)
Received: from f (cst-prg-92-138.cust.vodafone.cz. [46.135.92.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3557dcf06dcsm11212668f8f.106.2024.05.28.02.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 02:06:01 -0700 (PDT)
Date: Tue, 28 May 2024 11:05:54 +0200
From: Mateusz Guzik <mjguzik@gmail.com>
To: Dennis Zhou <dennis@kernel.org>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, 
	Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org, ltp@lists.linux.it
Subject: Re: [dennis-percpu:for-6.11] [percpu_counter]  05dbad003f:
 ltp.getrusage03.fail
Message-ID: <pywb7wcml44gzgidn7mtwwr23mybbilakckchk4777wfibtruj@n4yiwwpvglf7>
References: <202405281421.127ddddf-oliver.sang@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202405281421.127ddddf-oliver.sang@intel.com>

On Tue, May 28, 2024 at 02:45:35PM +0800, kernel test robot wrote:
> Hello,
> 
> kernel test robot noticed "ltp.getrusage03.fail" on:
> 
> commit: 05dbad003f2b2ececb1cc7428bfa8f470cc34b95 ("percpu_counter: add a cmpxchg-based _add_batch variant")
> https://git.kernel.org/cgit/linux/kernel/git/dennis/percpu.git for-6.11
> 
> in testcase: ltp
> version: ltp-x86_64-14c1f76-1_20240525
> with following parameters:
> 
> 	disk: 1HDD
> 	fs: xfs
> 	test: syscalls-03/getrusage03
> 
> 
> 
> Running tests.......
> <<<test_start>>>
> tag=getrusage03 stime=1716734654
> cmdline="getrusage03"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1733: TINFO: LTP version: 20240524-4-g22004c7db
> tst_test.c:1617: TINFO: Timeout per run is 0h 02m 30s
> getrusage03.c:43: TPASS: initial.self ~= child.self
> getrusage03.c:59: TFAIL: initial.children = 0, expected 102400
> getrusage03.c:66: TPASS: child.children == 0
> getrusage03.c:86: TFAIL: child.children = 0, expected 307200
> getrusage03.c:104: TPASS: initial.children ~= pre_wait.children
> getrusage03.c:114: TFAIL: post_wait.children = 0, expected 409600
> getrusage03.c:133: TPASS: initial.children ~= after_zombie.children
> getrusage03_child.c:57: TPASS: initial.self ~= exec.self
> getrusage03_child.c:62: TPASS: initial.children ~= exec.children
> 

I confirm this patch broke things, thanks for the report.

Make sure to sit before you take a look at the fix:

commit 6e8b4caf667fb6fad1c63b061e303faab6d917ef
Author: Mateusz Guzik <mjguzik@gmail.com>
Date:   Tue May 28 04:52:10 2024 -0400

    lol

diff --git a/lib/percpu_counter.c b/lib/percpu_counter.c
index c3140276bb36..51bc5246986d 100644
--- a/lib/percpu_counter.c
+++ b/lib/percpu_counter.c
@@ -97,7 +97,7 @@ void percpu_counter_add_batch(struct percpu_counter *fbc, s64 amount, s32 batch)

        count = this_cpu_read(*fbc->counters);
        do {
-               if (unlikely(abs(count + amount)) >= batch) {
+               if (unlikely(abs(count + amount) >= batch)) {
                        raw_spin_lock_irqsave(&fbc->lock, flags);
                        /*
                         * Note: by now we might have migrated to another CPU


Dennis, do I need to submit a v4? Given that this is a trivial one line
fixup perhaps it would be handier if you massaged the stuff on your
branch. I'm fine either way.

That said this really should have been reported by something.
