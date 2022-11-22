Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D042F3F
	for <oe-lkp@lists.linux.dev>; Tue, 22 Nov 2022 22:42:48 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id b1-20020a17090a7ac100b00213fde52d49so240560pjl.3
        for <oe-lkp@lists.linux.dev>; Tue, 22 Nov 2022 14:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OHmFcekX2nghj6K3yYTF3UfA+z88ogrDddAGW0uTMMQ=;
        b=IZKEJ/eyL163tLYNjYsB6V+Orch889GjNf75EuwI63y8CtzNejtTFnpeIeN82rEtAh
         GuzVPJ7PFL5wxV+GoJu2XOVSS/jCtS9Gsx6x0tOeMfnvLE7gF1VrZaicwq/loQAD1sJr
         jSVHnKHktTPdY2YU2RUUYv19mr+Gt7goHhsbzgWuvvMYnsgWSxnVosDrOXl2KDrdaK0H
         31CfwldjP721BvpPL+txGx8Jp3w2P9RUg4AJ/DojrHApn7Sk2vOh3wZdNwIBt0cl7nS9
         dQqG+JymcXtfL/AbRdBt8VEFWzVyr34eBCaUG9p4EMeVFaWuX5hL8anJvtoTFLjIlCrU
         GDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OHmFcekX2nghj6K3yYTF3UfA+z88ogrDddAGW0uTMMQ=;
        b=6C2g7CJ0IZk+iOL3gHU5ViEj9XeufVfYcM/+dQCj1B/MagILsq9hiHYRt5Busx9iS2
         qyjb4E/pl2QINhxYLxo1JIwTTHnIu2Bc6stJv1owT4TMS/tWDOk/tZzNA9TNbOZhDcrf
         /AMlVV9CuuFkC/tuLTM8l7NIlyDJ98TTnYKUpA8Ghz6xJnuQqswOHhHH8fP1yQmlkzQW
         Gv1TkZfenhay28ERuqs7tAH5H8g6G88a5IMaOqdxHouEppQb6B7IhOOmLXZ+RWP/uDa/
         Nx4N8iy9Z5byC58E1ABwFeyXVQmSVBHbVF2PRheUrjbSIUTYa3yR0n9ppn+GZZD443MM
         amxQ==
X-Gm-Message-State: ANoB5pm7pnG/dZ93YEmK8DUnWbFf6x14nFQtrJDx63FIczAagt4L+pb8
	yJ7LvGHR8MLVxK/mQ7BeTBNQBw==
X-Google-Smtp-Source: AA0mqf58wviWfQsfRaSAqOlo8p4navvCEjA52xb4TnyBjrYz+0CHYg862H1If5As/w3Bn21CvgHgIA==
X-Received: by 2002:a17:902:ce90:b0:186:6d34:b7b5 with SMTP id f16-20020a170902ce9000b001866d34b7b5mr9088185plg.37.1669156967537;
        Tue, 22 Nov 2022 14:42:47 -0800 (PST)
Received: from dread.disaster.area (pa49-186-65-106.pa.vic.optusnet.com.au. [49.186.65.106])
        by smtp.gmail.com with ESMTPSA id u5-20020a170903124500b00186c3afb49esm12607967plh.209.2022.11.22.14.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 14:42:46 -0800 (PST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1oxbyV-00HR09-OU; Wed, 23 Nov 2022 09:42:43 +1100
Date: Wed, 23 Nov 2022 09:42:43 +1100
From: Dave Chinner <david@fromorbit.com>
To: Oliver Sang <oliver.sang@intel.com>
Cc: Gao Xiang <hsiangkao@linux.alibaba.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, Zirong Lang <zlang@redhat.com>,
	linux-xfs@vger.kernel.org, ying.huang@intel.com,
	feng.tang@intel.com, zhengjun.xing@linux.intel.com,
	fengwei.yin@intel.com, "Darrick J. Wong" <djwong@kernel.org>,
	Dave Chinner <dchinner@redhat.com>,
	Brian Foster <bfoster@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] xfs: account extra freespace btree splits for multiple
 allocations
Message-ID: <20221122224243.GS3600936@dread.disaster.area>
References: <20221109034802.40322-1-hsiangkao@linux.alibaba.com>
 <202211220854.48dad6fd-oliver.sang@intel.com>
 <Y3wm8hwPMXcFNjiO@B-P7TQMD6M-0146.local>
 <Y3yeVzzt5WIIHfhm@xsang-OptiPlex-9020>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y3yeVzzt5WIIHfhm@xsang-OptiPlex-9020>

On Tue, Nov 22, 2022 at 06:03:03PM +0800, Oliver Sang wrote:
> hi Gao Xiang,
> 
> On Tue, Nov 22, 2022 at 09:33:38AM +0800, Gao Xiang wrote:
> > On Tue, Nov 22, 2022 at 09:09:34AM +0800, kernel test robot wrote:
> > > 
> > > please be noted we noticed Gao Xiang and Dave Chinner have already had lots of
> > > discussion around this patch, which seems there is maybe new version later.
> > > we just sent out this report FYI the possible performance impact of this patch.
> > > 
> > > 
> > > Greeting,
> > > 
> > > FYI, we noticed a -15.1% regression of fxmark.ssd_xfs_MWCM_72_directio.works/sec due to commit:
> > 
> > Thanks for your report!
> > 
> > At a glance, I have no idea why this commit can have performance
> > impacts.  Is the result stable?
> 
> in our tests, the result is quite stable.
>      45589           -15.1%      38687 ±  2%  fxmark.ssd_xfs_MWCM_72_directio.works/sec
> 
> and detail data is as below:
> for this commit:
>   "fxmark.ssd_xfs_MWCM_72_directio.works/sec": [
>     39192.224368,
>     39665.690567,
>     38980.680601,
>     37298.99538,
>     37483.256377,
>     39504.606569
>   ],
> 
> for parent:
>   "fxmark.ssd_xfs_MWCM_72_directio.works/sec": [
>     45381.458009,
>     45314.376204,
>     45724.688965,
>     45751.955937,
>     45614.323267,
>     45747.216475
>   ],

This MWCM workload uses a shared directory. Every worker thread (72
of them) iterates creating a new file, writes 4kB of data to it and
then closes it. There is no synchronisation between worker threads.

The worker threads will lockstep on the directory lock for file
creation, they will all attempt to allocate data in the same AG as
the file is created. Hence writeback will race with file creation
for AG locks, too.  Once the first AG is full, they will all attempt
to allocate in the next AG (file creation and writeback).

IOWs, this workload will race to fill AGs, will exercise the "AG
full so skip to next AG" allocator fallbacks, etc.

Changing where/how AGs are considered full will impact how the AG
selection is made. I'm betting that there's a mismatch between the
code that selects the initial AG for allocation (from
xfs_bmap_btalloc() via the nullfb case) and the code that selects
the actual AG for allocation (xfs_alloc_vextent() w/ NEAR_BNO
policy) as a result of this change. This then results in
xfs_alloc_vextent() trying to initially allocate from an AG that
xfs_alloc_fix_freelist() considers to be full, so it skips the
initial selected AG and starts searching for an AG it can allocate
into.

Combine that with AGF lock contention from 70+ tasks all trying to
allocate in the same location...

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
