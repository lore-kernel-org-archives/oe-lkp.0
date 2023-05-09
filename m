Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EC11C04
	for <oe-lkp@lists.linux.dev>; Tue,  9 May 2023 06:54:37 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1ab14cb3aaeso38543075ad.2
        for <oe-lkp@lists.linux.dev>; Mon, 08 May 2023 23:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20221208.gappssmtp.com; s=20221208; t=1683615277; x=1686207277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8f7AFFRkXXKxkzsTH7JfwHgWYybfOeRANzMf6aB4GvY=;
        b=oS/3s1VQfCdROM7w06UUy1feQDAkekR15S+W+Lck1hb5ImBoiw9PTJrGHvLGdhTWxX
         YIO5QVFOI+XUkjxUqxVV3Jqo2HpFqpr0K5ZFfmXsTsaGMWK05+dMdJyyfOOjAoqu9k0M
         GO33YahzUNlU+1+5U7niPyeqwzkzx/fVZs7IEsHtO22XI+sIS4ZGG2JF9rogkh2/8Q64
         pJ2AA1fb4Lyq/cQl6LGsYw5vjhO7zc7/9CxueqbTm5gm8Zrb451c4H1g7aVDJKy5LfpF
         yP8zbgyeQlqJ/c47Q/1Woo4pxbo+jHEAqO2sNJGFYpVV8etIY3Of/UPdn8K3elJmevyL
         ZXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683615277; x=1686207277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8f7AFFRkXXKxkzsTH7JfwHgWYybfOeRANzMf6aB4GvY=;
        b=ATbwGd2kZH6A9sGTY+67D7SUdG792EIQpEKWTWuBs1uhWRS50Q+EJTMJayDWxzwZZk
         bQjZs+FzEm/5pCjgG8yEqSiz7ZE9EWVbYzYa83R8fUqHCbPUQ/7PYOyi7BlWs2nO7sFs
         aDlHm85vH7abja/0JlFudJMzv02X1Nu1lLHfDz/RBHsx0m5uAFYBhyJBZGY8MJvNlfM0
         /H5SgJwbClaKO6ydHlPxkofSKHKfXqBlMwEfsODEu5svp2sAdeAs4ccW+4vcv7O9Vxho
         L5/c4qIHju1VjublxxlV0vMQcz/XTy0Emck5dmNUBgtFVHle5an7E5kSUg0m0SUcLXvw
         jpgA==
X-Gm-Message-State: AC+VfDxXdMQZGdYGPXr8juhPRrAlwhESUPc2khWEZA1KTaPRdeTn3icm
	bkIsD66Ph25xpwSpd7FmqD2VXw==
X-Google-Smtp-Source: ACHHUZ7LdOHTKLDLgTu5Mf4elrCAwM8dbTu05hZuRJn2cRPKqYLnO0y9skDG4YG19caNlHilV8oKBA==
X-Received: by 2002:a17:902:eb46:b0:1a6:5487:3f97 with SMTP id i6-20020a170902eb4600b001a654873f97mr12176228pli.64.1683615277073;
        Mon, 08 May 2023 23:54:37 -0700 (PDT)
Received: from dread.disaster.area (pa49-181-88-204.pa.nsw.optusnet.com.au. [49.181.88.204])
        by smtp.gmail.com with ESMTPSA id g7-20020a170902868700b001aad4be4503sm719394plo.2.2023.05.08.23.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 23:54:36 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1pwHF3-00D7ut-QH; Tue, 09 May 2023 16:54:33 +1000
Date: Tue, 9 May 2023 16:54:33 +1000
From: Dave Chinner <david@fromorbit.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: Dave Chinner <dchinner@redhat.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	"Darrick J. Wong" <djwong@kernel.org>, linux-xfs@vger.kernel.org,
	ying.huang@intel.com, feng.tang@intel.com, fengwei.yin@intel.com
Subject: Re: [linus:master] [xfs]  2edf06a50f:  fsmark.files_per_sec -5.7%
 regression
Message-ID: <20230509065433.GT3223426@dread.disaster.area>
References: <202305090905.aff4e0e6-oliver.sang@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202305090905.aff4e0e6-oliver.sang@intel.com>

On Tue, May 09, 2023 at 10:13:19AM +0800, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed a -5.7% regression of fsmark.files_per_sec on:
> 
> 
> commit: 2edf06a50f5bbe664283f3c55c480fc013221d70 ("xfs: factor xfs_alloc_vextent_this_ag() for  _iterate_ags()")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

This is just a refactoring patch and doesn't change any logic.
Hence I'm sceptical that it actually resulted in a performance
regression. Indeed, the profile indicates a significant change of
behaviour in the allocator and I can't see how the commit above
would cause anything like that.

Was this a result of a bisect? If so, what were the original kernel
versions where the regression was detected?

Cheers,

Dave.

-- 
Dave Chinner
david@fromorbit.com
