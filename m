Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6336525D
	for <oe-lkp@lists.linux.dev>; Wed, 15 Mar 2023 13:10:50 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id cn6so6156056pjb.2
        for <oe-lkp@lists.linux.dev>; Wed, 15 Mar 2023 06:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678885850;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4iM7UqGaYvm7BzQmjPzFTbD+VCi1s05wVU7R+PFPtIQ=;
        b=d2XRh/0jnDbb8BJSVteBA7TvOKV8xbk6pdCqTOQcoOrShowab5iwHiCFFnz0/Pshsz
         vS5a48SIWacvJ8o9s8pgarz8rU7Nk6EQDTx80rj/4iNeASMVgpVtyCttdLykp0wEcbMO
         9ZpYnG0Kd3+JCmpIYNaYbqk+Ms4jtktRfLBDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678885850;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4iM7UqGaYvm7BzQmjPzFTbD+VCi1s05wVU7R+PFPtIQ=;
        b=hKurPzGV+gBXJ89EozdwRQlEDB/ulAozuNmBTGJz2jmDULDYgMHQAk+Q1+LhGsmhBC
         gdaCPJ+ycSEK7dVf/slFBm6s4iKPgEBaJrxzlMfb9vhSViapHgNB5yN14uzJuLKBJqjf
         uARwQP6eVp3LP1w3J2YT0Bq55Qz8gq8wZmZvbB3dvQJJUSMuck8j0ajrBfKtREMwSOU/
         MeyWGXnFw7cGGgTKZHn7xoG7bKlqJnQS8iPgAk1cmfC1B4dYUivEAd4HBUYKT0CUzLg/
         n8rKSu6WqDdv14CiFQF1zgdOqijEziarfMyLXz7OoV1LO7xSyn7oTv/R0yVk1R9MRzcw
         2MGA==
X-Gm-Message-State: AO0yUKVnn5fsflqx8cCHfmPgnT/QYOUauWjiIRk9mDEgOTO5OeRXQLho
	DspTAXl9ETtsyeqOtM9XdZzGhA==
X-Google-Smtp-Source: AK7set9dN3OnjgQ1zJzmAaDS5Ava8qB+TCv5SKJAmAnQ8LoY5y/PvI+b/14sPf9bRAqmxxxgI5nUMw==
X-Received: by 2002:a17:902:e5d0:b0:19e:29bd:8411 with SMTP id u16-20020a170902e5d000b0019e29bd8411mr2794015plf.30.1678885850225;
        Wed, 15 Mar 2023 06:10:50 -0700 (PDT)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
        by smtp.gmail.com with ESMTPSA id d10-20020a170902854a00b001a05bc70e97sm3574903plo.189.2023.03.15.06.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 06:10:49 -0700 (PDT)
Date: Wed, 15 Mar 2023 22:10:43 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Cc: kernel test robot <yujie.liu@intel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Keith Busch <kbusch@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
	Ira Weiny <ira.weiny@intel.com>, Jens Axboe <axboe@kernel.dk>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	linux-fsdevel@vger.kernel.org, ying.huang@intel.com,
	feng.tang@intel.com, zhengjun.xing@linux.intel.com,
	fengwei.yin@intel.com
Subject: Re: [linus:master] [mpage] 7d28631786: fio.write_iops 27.8%
 improvement
Message-ID: <20230315131043.GA1927891@google.com>
References: <202303101630.ef282023-yujie.liu@intel.com>
 <20230315075816.GA32694@lst.de>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230315075816.GA32694@lst.de>

On (23/03/15 08:58), Christoph Hellwig wrote:
> 
> I think this simply accounts for the I/Os now that were skipped
> when using the bdev_read/write path before.

Oh, that would explain it. Otherwise I was slightly surprised (in a good
way) and puzzled.
