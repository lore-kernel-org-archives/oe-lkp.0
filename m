Received: from mail-yx2-f1.google.com (mail-yx2-f1.google.com [74.125.224.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C8E239085
	for <oe-lkp@lists.linux.dev>; Wed,  1 Jul 2026 23:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782949460; cv=none; b=H90MIQ9qACWGIZmUnt+QwKoPz6TctoC1wO6NRWHba6fSDknfvUTvgUz/wdIOY6jH0yEJLAoP9uvWOcqv0Hx8K1QiW3R1BummK+s5QS8ckMfbVp3HJwpfl9jMQD1b0KW+46TtexNSiX62ztmBUCQt6ocbgZIafKIt5ktrSIeYVvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782949460; c=relaxed/simple;
	bh=4XZkSkC3QlAOEWhMXJEUxtmWxRtjqMmLeUGr9o50oyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pVTYmZX6KsrNNZEdRrlNszlkXm0mXQMpuRq7NZDNf+AgOfCLOEsT1yzRRTUp7x2NmruuZT5PDwHreCp8p9dPbKT+a09NhSuZY4gWiY+GYwgLqJixZd+81BVv4xb4HsoCj8EceonKCsyJrH+nYOT0ZMmAykiJ6CtcO0XuxKSB738=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aeb+4FcF; arc=none smtp.client-ip=74.125.224.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aeb+4FcF"
Received: by mail-yx2-f1.google.com with SMTP id 00721157ae682-8081d7b4af1so7797877b3.0
        for <oe-lkp@lists.linux.dev>; Wed, 01 Jul 2026 16:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782949458; x=1783554258; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+lRzVKM3rxWIeA0xqidur9ZTphZLEKeOdJI1P0EvDk=;
        b=aeb+4FcFql2EVQ6M0bUgvIC0vnMPpvttR5JMTaMBHdReL7PSkJBuI6pApaQZWhcyPd
         nwd7CKb1fuJ44oRnMEJRHt0CTMvcV4nC67hCTc0nhf2HeucbQvDFd7Z/NOTRGTLK96Sz
         VSVMCDAdPGzeMAk29bF4Jby4kc1THXm5thH87GavnlJZA7PtrA/yl88PyvcYnstj79f5
         nXm6EZVHDLJ3HNpeuTO9c9mvztROsHb/+ATrfTGoq/xKOIFkTrFfY02cYkvV7eQwFxBo
         ZPV88mcYtSw44gxMqIj7m4KsxRb0beLPYA9XcHOrQ94EBcWfpaALCcJDjortKNDpKvqg
         A1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782949458; x=1783554258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G+lRzVKM3rxWIeA0xqidur9ZTphZLEKeOdJI1P0EvDk=;
        b=UIkDi0NpyPwwlVEW1ycbfsSIlkN81a8C2OKYxHMsu0e83nGYU8lNkV01vz5yoGgDnU
         GgjC+Uc8VEcgQJ2JANlIeHOM+YinEYK/jXB+CGkyDsJ5NZc8SpBvCRmnOXcGQ+Ho7d/A
         q0Ornw/ztb2MoTuBe8CHfYonr/0DnXNC5igkuvjYOB9Bn5VZFJHAHmEUUveIkyruD42q
         WOnIIavoy1U0yIdrGNAHIYvpz1cr0XI+UNf9RaiLh5RqSZIXYwNbakkxKLkZFbcQCY3/
         eXKxSit7dnz2OQ6I8Ug/iXGQjzSUtPlvg2/8PYakrvwhS/LNxAhy1SdPTbBtF+OVSgUh
         AG/g==
X-Forwarded-Encrypted: i=1; AHgh+RrQw67B8ZPLR/6cdMdIUGArEh4gC4ePxc273D1O+e3vJ/5v/YjuzjxN5XsXNdWDmw8C2Jny65M=@lists.linux.dev
X-Gm-Message-State: AOJu0YxPYPmMg5q7NEAk8UOZz+h83+XfRQDHL1pMUxuMTOPLXWmgKAk7
	8LecG0mJuUhShLDUDFeaHYLFHvThc8Ybxc3MvxY3KuD05RkJyKsObp8j
X-Gm-Gg: AfdE7ckTUZ2hqT/ZFHOZ5Hvjz3llfKqYD/vAAAGwDUPZOV+jJ5zkNMNJMWwl7I59d5d
	UlwdI5vhdFA7Y8DXY21iUdtcE7Pp/9VdDqSGUNmX7cm4XN1RiNPmJ2jNeqLoCyDY+INrr8JWHvm
	w99Xq/9MVs5AHEmR6kyR2kdfvXO/EvB9gN8Rxdp09W8otGS7DrYhDns+kT/8F7ld7DyX8CHDcHp
	1Y8kK56WvENa+MdzvXMSwZ0XctcPsnt7uoBhBSiEDl2PZvSGuosWH80h9js3AEaaofyIK/hreDz
	MAh6atNOTJ9WeC1IYusoRu2hNfF7fNmHnkC3zQSfy8PTA1Yn2WUkF6+U58SxzYzRXJv3dR4Du1j
	9OLb2+gCB5NxkXd6oGNsjH/AZ3TAqQ80gPnxT4+vQWJ0j+ToaF6QZ47Y64gcTy2OdQJUidXpulZ
	xa1CmpkF4=
X-Received: by 2002:a05:690c:6c92:b0:80c:2874:67ce with SMTP id 00721157ae682-812e9cc6e16mr43982877b3.30.1782949454439;
        Wed, 01 Jul 2026 16:44:14 -0700 (PDT)
Received: from localhost ([2a03:2880:25ff:5d::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144b52da92sm6074367b3.33.2026.07.01.16.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 16:44:13 -0700 (PDT)
From: Leo Martins <loemra.dev@gmail.com>
To: kernel test robot <oliver.sang@intel.com>,
	oe-lkp@lists.linux.dev
Cc: lkp@intel.com,
	linux-btrfs@vger.kernel.org,
	kernel-team@fb.com,
	David Sterba <dsterba@suse.com>
Subject: Re: [linux-next:master] [btrfs]  9a8eec6165:  fio.write_iops 22.6% regression
Date: Wed,  1 Jul 2026 16:44:11 -0700
Message-ID: <20260701234412.4048647-1-loemra.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <202603112240.f7605968-lkp@intel.com>
References: <202603112240.f7605968-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Oliver,

Thanks for the report. I'm aware of this regression and the cause is
understood: the flagged commit adds a per-COW xarray store on every
COW'd metadata block, and on this single-task 4k randwrite ftruncate
workload that store is what costs the write_iops.

A fix has been posted to linux-btrfs that replaces the xarray with a
non-allocating fixed inline buffer and recovers the lost throughput:

  "btrfs: replace writeback inhibition xarray with a fixed inline buffer"

It carries the Reported-by and Closes tags pointing at this report.

Thanks,
Leo
