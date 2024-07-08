Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7624148FFC
	for <oe-lkp@lists.linux.dev>; Mon,  8 Jul 2024 18:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720462581; cv=none; b=gNMQMzvuDfwc2qB0n2W9ORab1GC2iSSqSg4yk/Wamm7Ek6nrDqSq+QcKfDX26VMQBP+XtSNCf+3Pt6V4duAxIS88pEdeGnfH3Mb8un5FEI9z6IdFgPx0cMY3HlHskQnHztCLFatB8yNNUZPeaOkSlN2jV257gRcet7e6NJM4ltA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720462581; c=relaxed/simple;
	bh=qoLJV0rGpO0BHOuUAFSnzNgl5JvCe/xXeB+FpY36BdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h7TKwE8sdgVVAPqwVCI4f7hiZv9gSMJHQS5idvI/tM3QsNe0Fo8N3fsPP7wKe+life/SAACdVR8yAHw/wHiyPe29+v65LM2TxNhjEQg04dZ2UPMZnH1UG7t0XIfNIc7Q1lQ7owZT+jfKYpkLEtghcePhwJ1uvqkWp+mHh13GT2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iPpXHgKy; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iPpXHgKy"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-767506e1136so2182474a12.0
        for <oe-lkp@lists.linux.dev>; Mon, 08 Jul 2024 11:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720462579; x=1721067379; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hVOu8tOcGRmgNUX6aW9mF78kuOpZ6BcRrm5ppPmrGAs=;
        b=iPpXHgKybr4ff0HOZnIYxUhxYU1d+uIEPPQZb8t3cBGX67b8TH6NQUdJGeOvS3hRD/
         3pZwEGZBd6k56PvkclO0wdngYKEwG+F4PY1MWClKPLVDGnphcoman1+4JBu49ATg3pIn
         AVdgKrK7woCZqvhGQXnzaNbEtVTcbUCsunZ2vuufG+/7jU4QbS0IC99V3V9urClLZifn
         IaxlxgNIagPcCBYwFWGhnNkAstuW56KQ5PTPsmEzKibwz47ls1CM30d4lwkLH3J06Vam
         3GygWSq2aHLO11KUVuua7kzcCZUY8huzcu5RECDViQKR3aWoBP19w/xzx8cVM1TVNwa7
         NdPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720462579; x=1721067379;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hVOu8tOcGRmgNUX6aW9mF78kuOpZ6BcRrm5ppPmrGAs=;
        b=Evjw1TkZD8b3/HWgf/UwwDhKIxy/hGH/ff/6jMzluKnKqn0Vxsh9LkH34h5eHl7/fh
         GRONpw3mcdVtS75oHTU2aA/nGUgW8VSfFo/bL7EF3nOs+//J/D9yHCbi6Mv8PJ7Qb8bq
         sf1jTcgPG1kT2JnkV3+IeIWCh48PQ7RaEqK5c8ueCj+iQUlauklLuRWk1xBlNPmsvdLE
         KwUS5dOIEZcQo1curbdTTTmdHAnUh95KNsA1okDAhk8k6mpqN1bVzrzckdeVYJ5mIm/e
         bdm3qU+pDqrP/Q200CKINkob0r3v04mLbWUKKNBCb+PC2nn+RT5NrKry/nZd0E8oQ1ok
         9CbA==
X-Forwarded-Encrypted: i=1; AJvYcCXYCl0vmRYS/r0yAHep2G6aGUibpsUjRCz2eELUE/GGMZ3lpWg4QZhMD4RlNhh4tAyzGFriaZku5Iz0fsB4pqaW0dzFFkXM
X-Gm-Message-State: AOJu0Yz1tkLtzVPqOFd5fMVZamweCWudLwDpL/UPY5OOxuYkldjbfa/n
	nrIj03cO8EswFChQiVWWC8pDQ9TaXz9RNKpu/NUIQqNxtB96Pezd
X-Google-Smtp-Source: AGHT+IGMbQAkkxgOLq1mfit424A5G1iUHBGxH8n+wcYI7QkWWHfqOnbzyWShboUMZbN5cc1DpV4kbQ==
X-Received: by 2002:a17:902:bd94:b0:1fb:3263:2e60 with SMTP id d9443c01a7336-1fbb7fc83c0mr327625ad.13.1720462579121;
        Mon, 08 Jul 2024 11:16:19 -0700 (PDT)
Received: from localhost (dhcp-141-239-149-160.hawaiiantel.net. [141.239.149.160])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-77d682b3909sm129760a12.88.2024.07.08.11.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 11:16:18 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Mon, 8 Jul 2024 08:16:17 -1000
From: Tejun Heo <tj@kernel.org>
To: kernel test robot <oliver.sang@intel.com>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	Lai Jiangshan <jiangshan.ljs@antgroup.com>
Subject: Re: [PATCH V2 4/5] workqueue: Put PWQ allocation and WQ enlistment
 in the same lock C.S.
Message-ID: <Zows8czlE6ji5Ezw@slm.duckdns.org>
References: <20240704034915.2164-5-jiangshanlai@gmail.com>
 <202407081521.83b627c1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202407081521.83b627c1-lkp@intel.com>

Hello,

On Mon, Jul 08, 2024 at 03:54:19PM +0800, kernel test robot wrote:
...
> [ 2.269463][ T1] cpus_read_lock (include/linux/percpu-rwsem.h:53 kernel/cpu.c:488) 
> [ 2.273463][ T1] alloc_workqueue (kernel/workqueue.c:5152 kernel/workqueue.c:5730) 
> [ 2.273463][ T1] padata_alloc (kernel/padata.c:1007 (discriminator 1)) 
> [ 2.273463][ T1] pcrypt_init_padata (crypto/pcrypt.c:327 (discriminator 1)) 
> [ 2.277463][ T1] pcrypt_init (crypto/pcrypt.c:353) 
> [ 2.277463][ T1] do_one_initcall (init/main.c:1267) 
> [ 2.281464][ T1] do_initcalls (init/main.c:1328 (discriminator 1) init/main.c:1345 (discriminator 1)) 
> [ 2.281464][ T1] kernel_init_freeable (init/main.c:1364) 
> [ 2.285464][ T1] kernel_init (init/main.c:1469) 
> [ 2.285464][ T1] ret_from_fork (arch/x86/kernel/process.c:153) 
> [ 2.289466][ T1] ret_from_fork_asm (arch/x86/entry/entry_32.S:737) 
> [ 2.289466][ T1] entry_INT80_32 (arch/x86/entry/entry_32.S:944) 

Ah, this is unfortunate, so pcrypt is allocating a workqueue while holding
cpus_read_lock(), so workqueue code can't do it again as that can lead to
deadlocks if down_write starts after the first down_read. Lai, it looks like
we'd need to switch to workqueue specific locking so that we don't depend on
cpus_read_lock from alloc path.

Thanks.

-- 
tejun
