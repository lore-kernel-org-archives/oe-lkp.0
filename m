Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA5B328C8
	for <oe-lkp@lists.linux.dev>; Sat,  7 Oct 2023 20:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BYqA/Yb5"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3296b3f03e5so1473816f8f.2
        for <oe-lkp@lists.linux.dev>; Sat, 07 Oct 2023 13:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696709270; x=1697314070; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=frrbQG1KV2zBsqrzA92ZI0bBTicwEVY0Ipaf/Vo55cE=;
        b=BYqA/Yb5sOXoW5akXhz+aFJkmtwp8H+DYf9b6bnQEOKx6qgOLAx5K1r7bsUgchGUN2
         B2CvVS+oHsqdw1nQ0WwamADnMZtT39QhyUVXPD+/VU2oacssTwokzBiofWpKEW5l+sAR
         i9snp6aOTkpSOnXrDbDotWad2ONq+keB/8lsUrbXjRj0q5wPt6JiccetNhNh44Kb2yWV
         O+F8vRtQ6UTvqPtb7R4cAmMNtuwcUy882NS7+wZaNEWusxCckdT9rWpHV2evHkUYYEgO
         pHtimAUqhlS0Ir0WOpr0grzQH79fAGoxlG4Q/ddeO413uqs68RRei/5NMkMeh//UGleT
         Z6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696709270; x=1697314070;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=frrbQG1KV2zBsqrzA92ZI0bBTicwEVY0Ipaf/Vo55cE=;
        b=ro2JzaiOVpKIeDHeeyJHdm7wX4fyxEVzAFV1AQL2JUJ7ohyKi6pKCC92aybJTcHuXF
         /p4tU6z2w2yZe7zPJWuUbDus22d06mFiUzXHvliQ+JLlpG9s0uK/SxMmzGsxJ5nzkyIz
         e4jV6Pl1o7zfNC1EXDLgBZep/2NbvYGOgcrc8cndkMGFyy0j101uQSSI6SyUglkqVijt
         Iz6wJntBP0s3dzj/Bj4hZtPATcMi7jJYKP6IOQ3HJ8LSNAN/uALPktZsFwm3dQ1g8HpD
         64wmrnzQcH+9z4OusVB/90/mTFtP5JrRhAlm73i/obRRMomQZdB6gTnOVKNiFznj9a/5
         4Xjw==
X-Gm-Message-State: AOJu0YzNrJpmbEyMiVQbKi2E6H/bwnBir6AYmvsg79mP3RfitIpA0TZf
	vdh7IwBOY6zuzul8Tovb5Ug=
X-Google-Smtp-Source: AGHT+IGWQk6Kxejzx5y3Pu20Y6dY8/NNiXN6Z/O1O3DHsuExWlc4MtA1UfAL4KQLOm0NSOgL9MlAmw==
X-Received: by 2002:adf:cd0a:0:b0:320:5f:c249 with SMTP id w10-20020adfcd0a000000b00320005fc249mr9265591wrm.30.1696709270256;
        Sat, 07 Oct 2023 13:07:50 -0700 (PDT)
Received: from localhost ([2a00:23c5:dc8c:8701:1663:9a35:5a7b:1d76])
        by smtp.gmail.com with ESMTPSA id o14-20020a5d4a8e000000b003197b85bad2sm5052534wrq.79.2023.10.07.13.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 13:07:48 -0700 (PDT)
Date: Sat, 7 Oct 2023 21:07:48 +0100
From: Lorenzo Stoakes <lstoakes@gmail.com>
To: kernel test robot <yujie.liu@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Muchun Song <muchun.song@linux.dev>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Andy Lutomirski <luto@amacapital.net>,
	linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.cz>,
	Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH v2 3/3] mm: perform the mapping_map_writable() check
 after call_mmap()
Message-ID: <87e0d5f2-7d64-41ec-8a7c-920d5d1ca947@lucifer.local>
References: <6f3aea05c9cc46094b029cbd1138d163c1ae7f9d.1682890156.git.lstoakes@gmail.com>
 <202305161044.bba89e76-yujie.liu@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202305161044.bba89e76-yujie.liu@intel.com>

On Tue, May 16, 2023 at 01:52:06PM +0800, kernel test robot wrote:
> Hello,
>
> kernel test robot noticed "assertion_failure" on:
>
> commit: a0e22a91f487957346732c6613eb6bd1b7c72ab1 ("[PATCH v2 3/3] mm: perform the mapping_map_writable() check after call_mmap()")
> url: https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Stoakes/mm-drop-the-assumption-that-VM_SHARED-always-implies-writable/20230501-062815
> base: https://git.kernel.org/cgit/linux/kernel/git/akpm/mm.git mm-everything
> patch link: https://lore.kernel.org/all/6f3aea05c9cc46094b029cbd1138d163c1ae7f9d.1682890156.git.lstoakes@gmail.com/
> patch subject: [PATCH v2 3/3] mm: perform the mapping_map_writable() check after call_mmap()
>
> in testcase: igt
> version: igt-x86_64-9e9cd7e6-1_20230506
> with following parameters:
>
> 	group: group-11
>
> compiler: gcc-11
> test machine: 20 threads 1 sockets (Commet Lake) with 16G memory
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
> If you fix the issue, kindly add following tag
> | Reported-by: kernel test robot <yujie.liu@intel.com>
> | Link: https://lore.kernel.org/oe-lkp/202305161044.bba89e76-yujie.liu@intel.com
>
>
> 2023-05-11 12:29:38 build/tests/gem_mmap_gtt --run-subtest basic-copy
> IGT-Version: 1.27.1-g9e9cd7e6 (x86_64) (Linux: 6.3.0-10673-ga0e22a91f487 x86_64)
> Starting subtest: basic-copy
> (gem_mmap_gtt:1138) i915/gem_mman-CRITICAL: Test assertion failure function gem_mmap__gtt, file ../lib/i915/gem_mman.c:146:
> (gem_mmap_gtt:1138) i915/gem_mman-CRITICAL: Failed assertion: ptr
> (gem_mmap_gtt:1138) i915/gem_mman-CRITICAL: Last errno: 1, Operation not permitted
> Subtest basic-copy failed.
[snip]

I don't have the hardware to test this (the repro steps don't work and
manually running the test indicates the actual hardware is required) but I
suspect it's a result of i915_gem_mmap() somehow causing
mapping_unmap_writable() to be invoked, which sets mapping->i_mmap_writable
negative, and thus the check after call_mmap() is performed reports the error.

In v3 I will change this to continue to mark the file writable before
invoking call_mmap() which should fix this issue.
