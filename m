Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB2015CD41
	for <oe-lkp@lists.linux.dev>; Tue, 28 Jan 2025 13:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738071549; cv=none; b=RTaQd29WnJCVCFb4RyP53lssfExwcytClREG69iBXDOhOfJLf+kkUNdZBPzW2n5usx4afbdEAX0NdJWhuc2GVwdkZeu5ecPLSobDMukSoDPezNvXes2zjBE9baLO9lX17dtMQ/4nXSH3Q+M8WQ2ZLuP/T8NxLS2VM39B6fem6e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738071549; c=relaxed/simple;
	bh=H0gmNTrTx7YtG/f4y5i6XlfQ0gWJCDAignL3fROT1yM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YFDIEzUkiVAjuSL7mKPyq+oXouW6dAaOBEmkPfSbPPnkRFB5iBM+XHfRBgQ0uhQrjnHhUhJd26cZar62lYpPHD9GNoy81EKpekMgkstot2N+qOtlqFGID/5qdA0NXULtJq5xXU8ElkeL3HLrY/rQHyPnXlsN/IQzyy0ui3ggNIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bgSPv99k; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bgSPv99k"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso138140166b.1
        for <oe-lkp@lists.linux.dev>; Tue, 28 Jan 2025 05:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738071546; x=1738676346; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TzaDT6E8ldXsPjOp4GLG1ShZZeCtmJHlgKtEwqC9QvM=;
        b=bgSPv99kUT0mS+N9ZVEbZKsucjxZHpL991tIUs6Bllxzmzfe3miPkCFGw79dlRLcki
         Hc3qKJJMjmjyyHHP2AGYh/oqg8Xb+6QPowJApB4LPAfA9/0FH5PrLfCah75iVu2Ya2Sa
         Dacy9xxx7ny8S6qblYb/Y2pJ/sLYHBSeaLnvWUvlNfb0ZYbzN+tXERoSFGSR+yhpsQBB
         LLwkvBJcMrowmKcsznZc5OrpTXvjC3TEOy5ayspuHgz+03ms8zX8E7u1RLUMNShVPKey
         ys7Vyi8PibAltLUx7YVoDZs2QEziFLSU7F1Q5m9slcswugiHMf6Lu4mlZRs4QoMBe5+T
         qaXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738071546; x=1738676346;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TzaDT6E8ldXsPjOp4GLG1ShZZeCtmJHlgKtEwqC9QvM=;
        b=RESlD+o0ry6Slx7FhF649lXL6c2hxvE6Bq7UN3OrWnnbnzuaGY1eLfpuuTwqgd8PYc
         Oh2mUqwUD+73v/qY8P8f/hORrVrduRa/JZPZH1QTZf++QzqIaqWFL1EgaVzqqIKEJXiO
         zWY2uav5Xm8qbLib21Ahi90XGVQMU8D/LH8f//Juydur5ffonOX2by3KYKxmgPom+zRS
         egWqpsR/3d16tZopxYUSrrFOwytD8fGZZ39ND7fZg2uN1oZC/2xNwtr5LN+6wONU/UmV
         kr46ELZFDIOlW/Bkg+n+QqZbmtTA5/PMxqTl/42IyiHqoue9T9M7TMaajVE9nq3YqZ7L
         PbVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEHdWCeJd4Ut5p0/KJllnrUZugsDiz6rhrnTPLHKjgBGnHWSZ327a0IUYiZ+Jo/bc5OWFt6bg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzBsL48NRazF84cdHga4o7oBTLO7R/lR02ei1j1K54a59PFrKCP
	JGQCNuqVwvc0bCoUdfmEO1dJZemP0Yz1+qfwy9Tn5zOsCHTFsqU9
X-Gm-Gg: ASbGncuTbtQK8OCGexRctJXLHaVAuZ8NPE6ffB/q2qsMDwkey/dlzgG5wNhnW59u/S5
	Wgi+l3dbNsayCeQk7iX5tO7Z9YYdAa3WvV3gnf0sX/UfHBgGnhByhBo5jU8DimR4wY4/VS2dC3M
	p2FM+C9dtPl//yUtbS8/c9H9C3yacBDBpRIA7HFuRe4iPyHumzMgIGw3zR4mPba+62Vo2/MLfQe
	VtDKc5/VtHY3sUe5xJWm9MoGvjnXJp47DybCJBjvXwWRSVeO4F1osaqNL02hrRxT8ASGoeHuxAb
	n9Rv7AS1ulbOWU3DF215/CBAyHTq
X-Google-Smtp-Source: AGHT+IHo+zkHKoDYgw5qXmmn54Y2fsEOyqbvIazuQC8g8pTWN30QWn/GP1YEgVNWZmTa5ehq0AlGzg==
X-Received: by 2002:a17:907:9802:b0:ab6:949f:c52f with SMTP id a640c23a62f3a-ab6949fccf2mr935422666b.28.1738071546128;
        Tue, 28 Jan 2025 05:39:06 -0800 (PST)
Received: from f (cst-prg-69-60.cust.vodafone.cz. [46.135.69.60])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6c7366dd0sm81505966b.8.2025.01.28.05.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 05:39:05 -0800 (PST)
Date: Tue, 28 Jan 2025 14:38:57 +0100
From: Mateusz Guzik <mjguzik@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [linus:master] [pidfs]  16ecd47cb0:  stress-ng.fstat.ops_per_sec
 12.6% regression
Message-ID: <ea7fq465sidc3gonlqcd33s64tzjogdo2lhnye5tau22pbs4d5@426xzgsios3q>
References: <202501272257.a95372bc-lkp@intel.com>
 <20250128-machart-bemessen-edd873223e02@brauner>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250128-machart-bemessen-edd873223e02@brauner>

On Tue, Jan 28, 2025 at 11:51:49AM +0100, Christian Brauner wrote:
> On Mon, Jan 27, 2025 at 10:32:11PM +0800, kernel test robot wrote:
> > 
> > 
> > Hello,
> > 
> > kernel test robot noticed a 12.6% regression of stress-ng.fstat.ops_per_sec on:
> 
> I'm confused about how this would affect stat performance given that it
> has absolutely nothing to do with stat. Is this stating pidfds at least?
> 
> 

stress-ng is issuing the "claimed" syscall in some capacity, but it also
mixes in other stuff.

In this particular case the test continuously creates and destroys
threads.

This in turn runs into pid alloc/dealloc code you modified.

I verified with bpftrace that contention around pid alloc *is seen*.

one-liner: bpftrace -e 'kprobe:__pv_queued_spin_lock_slowpath { @[kstack()] = count(); }'

@[
    __pv_queued_spin_lock_slowpath+5
    _raw_spin_lock_irqsave+49
    free_pid+44
    release_task+609
    do_exit+1717
    __x64_sys_exit+27
    x64_sys_call+4654
    do_syscall_64+82
    entry_SYSCALL_64_after_hwframe+118
]: 472350
@[
    __pv_queued_spin_lock_slowpath+5
    _raw_spin_lock_irq+42
    alloc_pid+390
    copy_process+6112
    kernel_clone+155
    __do_sys_clone3+194
    do_syscall_64+82
    entry_SYSCALL_64_after_hwframe+118
]: 568447

there is of course tons more

So the new code is plausibly slower to alloc/dealloc and is lowering
throughput as a result.

I'll note though that thread creation/destruction has pretty horrid
scalability as is.
