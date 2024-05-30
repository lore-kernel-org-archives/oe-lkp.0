Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB92214290
	for <oe-lkp@lists.linux.dev>; Thu, 30 May 2024 07:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717054673; cv=none; b=NzgaHiIFKhQd+1dCzc4P1IhPcpsq5NNnpWL1pHf1iqx2QLxKgufBBFhkT7++tDM6eLerIphshRVOUIYgG2/8XsL3T52EqF9RAhXxjmI5dEts4S8NuLYjeKJVGr18dDpJcZ0j0eB57fDr4QUVnH/QqIUPsVkR5lZBKlWU+htBNfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717054673; c=relaxed/simple;
	bh=gFvPGd/GOwdbWalVNT4aW5mjXz8rzEAiL3wltYmPa6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p5hf4eZ2RK2QmJEksj0x5cxvVpL0QlBhdfG+zCgx3bkrEa2Vn3+85zGWnLFhAoboMy6UVlecqTQ52zpdl3A1MxxlAFt+r76OKGB7S9W69CbWMySqQc2sQ/CjwFKzuV5lE/CK2ldFR+BffdIw029niHLCbtQXzPD2ynnO024lXQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J/lz2gBc; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J/lz2gBc"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6ad74e5afeaso3506496d6.0
        for <oe-lkp@lists.linux.dev>; Thu, 30 May 2024 00:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717054671; x=1717659471; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=550m7jm8I2c4tBa/pg01mJQwXAb2hba6vqvQBtGQrp0=;
        b=J/lz2gBcXwLRbaZL3MhMd2CDOt4HnOcveA4Tx1hvjHAN8PeAgDMSaTHSk0RpEgWUkZ
         pX4IjKC3day3bJBkS2AMSN38P26EK1HLHE5kF8RvhDrfGFSw4BbmPLWKPYfy4Z39Z0qT
         wbQoHIhSGbUGEUvxWu6xldrNF74yZF7YSRt4o8+1e/IuPg28A1Qtwlam61NJfcamp40+
         y2lsmGY1W7E2/8hsA3MuhjNO/icWvNEry/a6qMRwhlqxLNb5oHebNK5/wanw6pl3eHyc
         nW6ZbQiBnuQkLwzaQRBOkLvqw+/6vyIpnC8P2xzp0ba5+d54V3oDSNjblZ2c1NYD0z6/
         yXuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717054671; x=1717659471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=550m7jm8I2c4tBa/pg01mJQwXAb2hba6vqvQBtGQrp0=;
        b=OKxlNTwhpG5Gb+1VkvEUTtpB8cMHLAd3EYtEFkMrkLlnD/l33SC2N13egTHyNDy3Eg
         jKtd3SchHanSI7HNh9Prdc1L0GRGy3dqYpo+Jbo1OoaBXWmi+/3+DPrb9lw5eKlpNF0v
         CUnt3Eg3EuYwhYLw8ASS1cPlUhRN5H+VUgW2v/giIXsInyxCm0xx5XoVZTZv5vBD925Q
         LdMMrQc3uF/tKUNzTH397UA1TOVFKqa4dWt22Eadu69GrOngBtAAXA1yHADX1HMIg3qu
         1eXIwtpJmql3icZ59TAo8WhclhPbqpy3X8oWO67pGSp5+CO+g7BkIqIevxvWfhgm+Png
         ElfA==
X-Forwarded-Encrypted: i=1; AJvYcCVCYLqHuGttlvYaNrKsNTEfozDNUAqSnYXBZ2DfxsIKwFiQIkZkb+vrWDfnIarn3SKULb4F3LnG6Ut+moPEr8zpa+FLYnkB
X-Gm-Message-State: AOJu0YwchB+Jcvb6LvxwvNIfVybgFaOy7o0p2BUsI1Efc8PuW5jF3v3T
	apJgOVlj4G1W1mObbuKQ6VNUjQ7TKGxlPu6rPqd0jXWwZGIEdUjUo/6TacslnFBMJBwFqUIHeMO
	fLk3Ij5lvCNbxJgg61zVyBKpTc/Y=
X-Google-Smtp-Source: AGHT+IEM6EoEcqJtHVn4gpWAdF7QhgkkO41aWkjwpJKVm9CM2RuEAKjVBtYHiEW+YYjJv5m71Z8+96lIKYufz8AVhYg=
X-Received: by 2002:a0c:f40f:0:b0:6aa:2d64:2015 with SMTP id
 6a1803df08f44-6ae0fad1a32mr21653536d6.18.1717054670651; Thu, 30 May 2024
 00:37:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202405291318.4dfbb352-oliver.sang@intel.com> <CAHk-=wg29dKaLVo7UQ-0CWhja-XdbDmUOuN7RrY9-X-0i-wZdA@mail.gmail.com>
In-Reply-To: <CAHk-=wg29dKaLVo7UQ-0CWhja-XdbDmUOuN7RrY9-X-0i-wZdA@mail.gmail.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Thu, 30 May 2024 15:37:13 +0800
Message-ID: <CALOAHbDYSXzv-c-bOBTR0Rp70zZWGWBG0Hwd-0OkA-YzA-QHtg@mail.gmail.com>
Subject: Re: [linus:master] [vfs] 681ce86235: filebench.sum_operations/s -7.4% regression
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Waiman Long <longman@redhat.com>, 
	Matthew Wilcox <willy@infradead.org>, Wangkai <wangkai86@huawei.com>, 
	Colin Walters <walters@verbum.org>, linux-fsdevel@vger.kernel.org, ying.huang@intel.com, 
	feng.tang@intel.com, fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 30, 2024 at 12:38=E2=80=AFAM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, 28 May 2024 at 22:52, kernel test robot <oliver.sang@intel.com> w=
rote:
> >
> > kernel test robot noticed a -7.4% regression of filebench.sum_operation=
s/s on:
> >
> > commit: 681ce8623567 ("vfs: Delete the associated dentry when deleting =
a file")
>
> Well, there we are. I guess I'm reverting this, and we're back to the
> drawing board for some of the other alternatives to fixing Yafang's
> issue.

Hi Linus,

I just checked the test case webproxy.f[0], which triggered the regression.

This test case follows a deletefile-createfile pattern, as shown below:

  - flowop deletefile name=3Ddeletefile1, filesetname=3Dbigfileset
  - flowop createfile name=3Dcreatefile1, filesetname=3Dbigfileset, fd=3D1

It seems that this pattern is causing the regression. As we discussed
earlier, my patch might negatively impact this delete-create pattern.
The question is whether this scenario is something we need to address.
Perhaps it only occurs in this specific benchmark and doesn't
represent a real-world workload.

[0] https://github.com/filebench/filebench/blob/master/workloads/webproxy.f

>
> Al, did you decide on what approach you'd prefer?
>
>                      Linus



--=20
Regards
Yafang
