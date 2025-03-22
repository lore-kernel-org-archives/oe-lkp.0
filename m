Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BB01D5176
	for <oe-lkp@lists.linux.dev>; Sat, 22 Mar 2025 23:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742685291; cv=none; b=IrvpYpp+bf4yxNyJ4ANMkE8iJKgFh0DpVLa6pA1YBoHstwScNHHLCYe69PTPMM05BUedmzDFT3c8e7MHcnn/sjKfKCZLvbXtCZwViOEVvYQ6n//MEBLzrRbDFvg/A07bHbSAoe2U7Gjp7SMjt6IQOvSrp2Xnzlbt31QzMDJCubw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742685291; c=relaxed/simple;
	bh=p+ipIzxKURRpwjIIPgDxs5c1USXn9lYQ6uV7AMoW1zo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e3uBFcXeiwPrwnubpwlawPb7ucdyt92kcnrUxvS+KJw7CpAW/e7enSy5UL9F62s2CtxLBFViVf4nJw1bL3gxZFjxIcpgSbqYKjw4P6ySRn+P++nQyEHZ1vgMkzRrS23G/JCwnHvbyJvq7AkJHFnTgS8DMXvoWL0NhiGi9Hw+IFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=l9kx22io; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="l9kx22io"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-476f4e9cf92so21240711cf.3
        for <oe-lkp@lists.linux.dev>; Sat, 22 Mar 2025 16:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1742685286; x=1743290086; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XJHqDIUEdiSQHsyrP8cT37rDikvtCQ4w65f+7jAbskE=;
        b=l9kx22ioZyBZ/acTmWKPA4SYQU0Y3mQFpaDAKS5qT05uCPILAc11ET8Vd5JeQnDMTX
         osUwNKDek6IkVlzN9EgLqMXCHDrHiMHrQ9p5vAaq0ZJwl7DNzEiXi20QtfjRLCUoCv0y
         G7egwK22V5LV4cvcsEEEVvChWdMInZygizDIN/SgCf5/HVA2nseFEXP7nEYi3xe1Bidn
         B+hA6h1vV+WfK5z+fLBbnTkW5eIoCuHeKyGaB6KprhWfYZtbcbL82Yiej07w+xTA8N9D
         4butnSUZRIWaHUOucjnDVE/3i6bdpQhIQ9AzzA5iFpVELPHnMoa5T4+EE7w4vdSf6Z3H
         cYzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742685286; x=1743290086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XJHqDIUEdiSQHsyrP8cT37rDikvtCQ4w65f+7jAbskE=;
        b=ZU9owELiWRYoolUcX6DysRkf5vqN+etfPmEZoZv+dWDL+9pztb94FzoV9IyDBFFPjG
         2JUBZzzrbNF7de3iLrbXYIaiw8CUyT6BmnwD891HlRMRwLpnho/o/QqhSsyZRad7mx/z
         AvZL6UshEw8bE7CHvQzFjmtZfkW2g7TCtgjAki0Hc65ZPTj/As7kVQNHM5Pip1gHbAoq
         RPOkKpfXu4y1ZyNK+QmhrMZ99WgmxW8EH8dQt/qaSFk0MTkT8ernMu4T2cB3E8UIr8Te
         uIOLpMk7JdgJmNNpaALX37OT6GtVU2HOBkKe57GIrlCxR7jP8PUmy380tWLPsaKYNmwO
         j5qQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfaeBLZTn05DRx2BIUp1gRzMzWT6wUFV9NRbYZHb6B4qqj7q52d+WqDqH3j7L28vhehW6uKj4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzxdWLSDig7rFQsPRnLHY/3Y4jtJcgYbmyZz57K+jHk+4+ZRPVE
	VMr8WW4blgstZAXvtOROayS1SlYqW/dZXUBNbOtuxKGulNbRVKdtLlSrJgKgwx8=
X-Gm-Gg: ASbGncvazUCaBXjJc+VGCoclMwIzNeGc168rDBnhi68bfP0Z0ZrKPBmthL/ZSBL6tK0
	O/CXze5Ox5gshz5/ZLURyDjT3OIoWLF5IfrFJ1dr06G5Ny5lVWBUo3MFcuIuunSkoetmxtZZNQJ
	8SbJPdG5Ekk5AZcT8sJwu6WdYgO7uISLanV5uOFe1WpOdFMeztd+0ukxw+BUbWRV9jsOo8gS7rU
	xHlROISphvDRU6YS0e/uzM+rYuflDAyb/2cTFH+dFqBuT/MRpBdutxwzQ73sjDdp1/KZMUu3Mru
	2oDXzW5gK7mPTQ1M7CUjUKG5lP3Y/AbIvIBrb+S20xk=
X-Google-Smtp-Source: AGHT+IGn+Hfwrgke1zQGLzwV/3qh9WnxZhHDgrV3gDmuUHLVptmjftr0MP8pFPzrqZlO7fZJloZXWg==
X-Received: by 2002:a05:622a:2513:b0:476:8132:c556 with SMTP id d75a77b69052e-4771de61284mr143182971cf.48.1742685286373;
        Sat, 22 Mar 2025 16:14:46 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4771d18f6a3sm27701901cf.38.2025.03.22.16.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Mar 2025 16:14:45 -0700 (PDT)
Date: Sat, 22 Mar 2025 19:14:40 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>,
	Oliver Sang <oliver.sang@intel.com>,
	David Hildenbrand <david@redhat.com>,
	Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org,
	Christian Brauner <brauner@kernel.org>,
	Hannes Reinecke <hare@suse.de>, oe-lkp@lists.linux.dev,
	lkp@intel.com, John Garry <john.g.garry@oracle.com>,
	linux-block@vger.kernel.org, ltp@lists.linux.it,
	Pankaj Raghav <p.raghav@samsung.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	David Bueso <dave@stgolabs.net>
Subject: Re: [linux-next:master] [block/bdev]  3c20917120:
 BUG:sleeping_function_called_from_invalid_context_at_mm/util.c
Message-ID: <20250322231440.GA1894930@cmpxchg.org>
References: <20250311-testphasen-behelfen-09b950bbecbf@brauner>
 <Z9kEdPLNT8SOyOQT@xsang-OptiPlex-9020>
 <Z9krpfrKjnFs6mfE@bombadil.infradead.org>
 <Z9mFKa3p5P9TBSTQ@casper.infradead.org>
 <Z9n_Iu6W40ZNnKwT@bombadil.infradead.org>
 <Z9oy3i3n_HKFu1M1@casper.infradead.org>
 <Z9r27eUk993BNWTX@bombadil.infradead.org>
 <Z9sYGccL4TocoITf@bombadil.infradead.org>
 <Z9sZ5_lJzTwGShQT@casper.infradead.org>
 <Z9wF57eEBR-42K9a@bombadil.infradead.org>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9wF57eEBR-42K9a@bombadil.infradead.org>

Hey Luis,

On Thu, Mar 20, 2025 at 05:11:19AM -0700, Luis Chamberlain wrote:
> On Wed, Mar 19, 2025 at 07:24:23PM +0000, Matthew Wilcox wrote:
> > On Wed, Mar 19, 2025 at 12:16:41PM -0700, Luis Chamberlain wrote:
> > > On Wed, Mar 19, 2025 at 09:55:11AM -0700, Luis Chamberlain wrote:
> > > > FWIW, I'm not seeing this crash or any kernel splat within the
> > > > same time (I'll let this run the full 2.5 hours now to verify) on
> > > > vanilla 6.14.0-rc3 + the 64k-sector-size patches, which would explain why I
> > > > hadn't seen this in my earlier testing over 10 ext4 profiles on fstests. This
> > > > particular crash seems likely to be an artifact on the development cycle on
> > > > next-20250317.
> > > 
> > > I confirm that with a vanilla 6.14.0-rc3 + the 64k-sector-size patches a 2.5
> > > hour run generic/750 doesn't crash at all. So indeed something on the
> > > development cycle leads to this particular crash.
> > 
> > We can't debug two problems at once.
> > 
> > FOr the first problem, I've demonstrated what the cause is, and that's
> > definitely introduced by your patch, so we need to figure out a
> > solution.
> 
> Sure, yeah I followed that.
> 
> > For the second problem, we don't know what it is.  Do you want to bisect
> > it to figure out which commit introduced it?
> 
> Sure, the culprit is the patch titled:
> 
> mm: page_alloc: trace type pollution from compaction capturing
> 
> Johannes, any ideas? You can reproduce easily (1-2 minutes) by running
> fstests against ext4 with a 4k block size filesystem on linux-next
> against the test generic/750.

Sorry for the late reply, I just saw your emails now.

> Below is the splat decoded.
> 
> Mar 20 11:52:55 extra-ext4-4k kernel: Linux version 6.14.0-rc6+ (mcgrof@beefy) (gcc (Debian 14.2.0-16) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44) #51 SMP PREEMPT_DYNAMIC Thu Mar 20 11:50:32 UTC 2025
> Mar 20 11:52:55 extra-ext4-4k kernel: Command line: BOOT_IMAGE=/boot/vmlinuz-6.14.0-rc6+ root=PARTUUID=503fa6f2-2d5b-4d7e-8cf8-3a811de326ce ro console=tty0 console=tty1 console=ttyS0,115200n8 console=ttyS0
> 
> < -- etc -->
> 
> Mar 20 11:55:27 extra-ext4-4k unknown: run fstests generic/750 at 2025-03-20 11:55:27
> Mar 20 11:55:28 extra-ext4-4k kernel: EXT4-fs (loop5): mounted filesystem c20cbdee-a370-4743-80aa-95dec0beaaa2 r/w with ordered data mode. Quota mode: none.
> Mar 20 11:56:29 extra-ext4-4k kernel: BUG: unable to handle page fault for address: ffff93098000ba00
> Mar 20 11:56:29 extra-ext4-4k kernel: #PF: supervisor read access in kernel mode
> Mar 20 11:56:29 extra-ext4-4k kernel: #PF: error_code(0x0000) - not-present page
> Mar 20 11:56:29 extra-ext4-4k kernel: PGD 3a201067 P4D 3a201067 PUD 0
> Mar 20 11:56:29 extra-ext4-4k kernel: Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
> Mar 20 11:56:29 extra-ext4-4k kernel: CPU: 0 UID: 0 PID: 74 Comm: kcompactd0 Not tainted 6.14.0-rc6+ #51
> Mar 20 11:56:29 extra-ext4-4k kernel: Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 2024.11-5 01/28/2025
> Mar 20 11:56:29 extra-ext4-4k kernel: RIP: 0010:__zone_watermark_ok (mm/page_alloc.c:3256) 
> Mar 20 11:56:29 extra-ext4-4k kernel: Code: 00 00 00 41 f7 c0 38 02 00 00 0f 85 2c 01 00 00 48 8b 4f 30 48 63 d2 48 01 ca 85 db 0f 84 f3 00 00 00 49 29 d1 bb 80 00 00 00 <4c> 03 54 f7 38 31 d2 4d 39 ca 0f 8d d2 00 00 00 ba 01 00 00 00 85
> All code
> ========
>    0:	00 00                	add    %al,(%rax)
>    2:	00 41 f7             	add    %al,-0x9(%rcx)
>    5:	c0 38 02             	sarb   $0x2,(%rax)
>    8:	00 00                	add    %al,(%rax)
>    a:	0f 85 2c 01 00 00    	jne    0x13c
>   10:	48 8b 4f 30          	mov    0x30(%rdi),%rcx
>   14:	48 63 d2             	movslq %edx,%rdx
>   17:	48 01 ca             	add    %rcx,%rdx
>   1a:	85 db                	test   %ebx,%ebx
>   1c:	0f 84 f3 00 00 00    	je     0x115
>   22:	49 29 d1             	sub    %rdx,%r9
>   25:	bb 80 00 00 00       	mov    $0x80,%ebx
>   2a:*	4c 03 54 f7 38       	add    0x38(%rdi,%rsi,8),%r10		<-- trapping instruction

This looks like the same issue the bot reported here:

https://lore.kernel.org/all/20250321135524.GA1888695@cmpxchg.org/

There is a fix for it queued in next-20250318 and later. Could you
please double check with your reproducer against a more recent next?

Thanks
