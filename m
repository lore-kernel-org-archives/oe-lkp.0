Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDDC20FA
	for <oe-lkp@lists.linux.dev>; Tue,  9 May 2023 07:10:56 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-24de3a8bfcfso5268358a91.1
        for <oe-lkp@lists.linux.dev>; Tue, 09 May 2023 00:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20221208.gappssmtp.com; s=20221208; t=1683616256; x=1686208256;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pD3vC44u/JrX7UZU0G86FxBlR+SBjPWE0ROlIx+IJIE=;
        b=FLHiOAoe0smn7K67HbKp6fRUgNgCB30KutCREjN24an2Kp06DnitpwwBBCQHFRpEgW
         fSl/XBWjgAjYlm46nnvSn1FGoTk1Fe5oJOmBb0NNdfGwPcWbU/w8IPxBJshYO4X78KKb
         vdGhRDApbyvBRJGD3/ssL/39jjFwC6ge0Wzi6CJKgBsIBYDVCHEpUXrqHQrB5MJ0iJoE
         1ztodMxlTcFZ3/I3OJujfKI40F/D4XfWbxQLsb78nYpYU4AheiYq+6QpT0AvpBJvEe6A
         zSL/XRZRUlrfedKUW6YH9CH/45wIVj43pq2fH4TQIq1ATCdHxldkH4Q04O4Gchw9wa0y
         6xzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683616256; x=1686208256;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pD3vC44u/JrX7UZU0G86FxBlR+SBjPWE0ROlIx+IJIE=;
        b=aPn5TJm5LsuMLXbhhk5gwth/QY3PtBF7nM+3b+hulVdX0Dflw2zVkSsA8pRDlEX9N0
         bdgmBrD86mGInahtvv2nAHihzmaU0gWaY2c1L0DZ7eI6V76PqD/V+jrCfMhiedU2DZJB
         VkHylA5SZAYnqZDfQ/dWo/PIP+Y1FOgE8DBDti/vvytgg5gXrU3D2Ts0L6fWkKwBKdVB
         m5QvA3Fb6esUvXuDjw4SZ9iyy2R54xWvioLXj4ZZlb/Enyi3K3t5r289plcOPZR6QJiQ
         hcoUquFzot83k9Bcyuyfv9n7hstEIDkIEYqLPj49VAAY/zkPo79+DFDAq/ad1IXg7fZZ
         38BA==
X-Gm-Message-State: AC+VfDzczq/vrq45JlKHE9Irl++4q53QxLAwhjIZgXyjETbPEcbfhVQv
	eDFCHg0UK5MDrr45M+aGQj2xjQ==
X-Google-Smtp-Source: ACHHUZ5LPq6vbiUiGn8QucrxfCUTAIA2DuQwFde7Y5Ilh0P5usC+N7y1yI4KbGRdKXEjFLumzQfXTg==
X-Received: by 2002:a17:90b:1296:b0:24e:596:624f with SMTP id fw22-20020a17090b129600b0024e0596624fmr13309175pjb.22.1683616256482;
        Tue, 09 May 2023 00:10:56 -0700 (PDT)
Received: from dread.disaster.area (pa49-181-88-204.pa.nsw.optusnet.com.au. [49.181.88.204])
        by smtp.gmail.com with ESMTPSA id v24-20020a17090ac91800b0024df90a4c58sm11023412pjt.36.2023.05.09.00.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 00:10:55 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1pwHUr-00D8HE-7l; Tue, 09 May 2023 17:10:53 +1000
Date: Tue, 9 May 2023 17:10:53 +1000
From: Dave Chinner <david@fromorbit.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: Dave Chinner <dchinner@redhat.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	"Darrick J. Wong" <djwong@kernel.org>, linux-xfs@vger.kernel.org,
	ying.huang@intel.com, feng.tang@intel.com, fengwei.yin@intel.com
Subject: Re: [linus:master] [xfs]  2edf06a50f:  fsmark.files_per_sec -5.7%
 regression
Message-ID: <20230509071053.GE2651828@dread.disaster.area>
References: <202305090905.aff4e0e6-oliver.sang@intel.com>
 <20230509065433.GT3223426@dread.disaster.area>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230509065433.GT3223426@dread.disaster.area>

On Tue, May 09, 2023 at 04:54:33PM +1000, Dave Chinner wrote:
> On Tue, May 09, 2023 at 10:13:19AM +0800, kernel test robot wrote:
> > 
> > 
> > Hello,
> > 
> > kernel test robot noticed a -5.7% regression of fsmark.files_per_sec on:
> > 
> > 
> > commit: 2edf06a50f5bbe664283f3c55c480fc013221d70 ("xfs: factor xfs_alloc_vextent_this_ag() for  _iterate_ags()")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> 
> This is just a refactoring patch and doesn't change any logic.
> Hence I'm sceptical that it actually resulted in a performance
> regression. Indeed, the profile indicates a significant change of
> behaviour in the allocator and I can't see how the commit above
> would cause anything like that.
> 
> Was this a result of a bisect? If so, what were the original kernel
> versions where the regression was detected?

Oh, CONFIG_XFS_DEBUG=y, which means:

static int
xfs_alloc_ag_vextent_lastblock(
        struct xfs_alloc_arg    *args,
        struct xfs_alloc_cur    *acur,
        xfs_agblock_t           *bno,
        xfs_extlen_t            *len,
        bool                    *allocated)
{
        int                     error;
        int                     i;

#ifdef DEBUG
        /* Randomly don't execute the first algorithm. */
        if (get_random_u32_below(2))
                return 0;
#endif

We randomly chose a near block allocation strategy to use to improve
code coverage, not the optimal one for IO performance. Hence the CPU
usage and allocation patterns that impact IO performance are simply
not predictable or reproducable from run to run. So, yeah, trying to
bisect a minor difference in performance as a result of this
randomness will not be reliable....

Cheers,

Dave.

-- 
Dave Chinner
david@fromorbit.com
