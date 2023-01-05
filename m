Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0522F27
	for <oe-lkp@lists.linux.dev>; Thu,  5 Jan 2023 14:47:29 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id 17so39599078pll.0
        for <oe-lkp@lists.linux.dev>; Thu, 05 Jan 2023 06:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uW5/0Xy5zahrkQgqdMY2BKgM//oxkezjC3Vpdg59WdU=;
        b=hn+H7TefgeYaXEnhb2fgrjPcF4N/UL+fxwpDi5Zyg4qLS2ayKIchBIGdIgxNKAM6y4
         mssN/3tYOmPirqlwsFuTDyZoq2Ax2xSIQ6kcRkTY9TSf9+HgdbhhtsbiHwSNk0rZCUcJ
         Ikc/vzsTrC48vzr5TXWIW2pGheX3K9pSjbjT4wLqHA/W4ckBGs3NTNUruAIZwqBpaJC+
         LX5Ds7hrGu6OKKrZfDyOFW5DIZh4GjW+xQuoCii+YEfQGQUP2ZxdEs3A5KkDWfadTYJ0
         b8+aFTXYn6I2jxv432nP+czU3YrZNR2aznXTN1MpuCcRg6GrxGPP9zU3DeOZEXHw6YSk
         kJLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uW5/0Xy5zahrkQgqdMY2BKgM//oxkezjC3Vpdg59WdU=;
        b=cPfhRiJzLFJJDCuaN4j2nLryNEbLEHPwQFLsxgsG84O+3R6cSA3Ul83u7F2NJkXZwV
         3ALaUDscyLllTD55igoBk1e5H49WuvOkDKGQX/zPGfve+Xw5LDDwli5rvULd5V4Bxzog
         W8PYkzW0FmbCqSpnMc/iD8CWvihfYb9ZqLgvV05YbuGqv3zl1TdfkYqz6o2imHfo/gJ8
         0cNhg4RmXY+0uvlnPTzNlUUFCOu0yKrDoSdAS1ElW0EwuHfwIraPY/cTC8FhKQfxyhba
         3Qf8C7L6Cm2JGr/T0x19uJVqYloXLUKSK4Gw4EKMF4w2dnvJNRz7U4UwAgu2SsOPY2eA
         Hq+g==
X-Gm-Message-State: AFqh2kpeFHrhUUhsoDxm7U1CkSraHq+HugkjjfELzL6235f3NTxdU2Ds
	1skU5LelJP4QGqxRYrwF/6Q=
X-Google-Smtp-Source: AMrXdXsSPNPB6c83FlYsfpPDbUIYRVOAEwabbDYDFz7NTMAp/QZN7zX8kJ/WC9Fzyo20J3ievNftyg==
X-Received: by 2002:a17:90a:d246:b0:226:1020:3460 with SMTP id o6-20020a17090ad24600b0022610203460mr32230548pjw.34.1672930049320;
        Thu, 05 Jan 2023 06:47:29 -0800 (PST)
Received: from hyeyoo ([114.29.91.56])
        by smtp.gmail.com with ESMTPSA id e22-20020a63f556000000b00499a90cce5bsm17145067pgk.50.2023.01.05.06.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 06:47:28 -0800 (PST)
Date: Thu, 5 Jan 2023 23:47:22 +0900
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
To: Oliver Sang <oliver.sang@intel.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, oe-lkp@lists.linux.dev, lkp@intel.com,
	Mike Rapoport <rppt@linux.ibm.com>,
	Christoph Lameter <cl@linux.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>
Subject: Re: [linus:master] [mm, slub] 0af8489b02:
 kernel_BUG_at_include/linux/mm.h
Message-ID: <Y7bi+mjxEJb/pkVZ@hyeyoo>
References: <202212312021.bc1efe86-oliver.sang@intel.com>
 <41276905-b8a5-76ae-8a17-a8ec6558e988@suse.cz>
 <Y7Qxucg5le7WOzr7@xsang-OptiPlex-9020>
 <Y7VBFLHY/PMbb4XS@hyeyoo>
 <Y7Yr3kEkDEd51xns@xsang-OptiPlex-9020>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7Yr3kEkDEd51xns@xsang-OptiPlex-9020>

On Thu, Jan 05, 2023 at 09:46:06AM +0800, Oliver Sang wrote:
> If you need more information, please let us know. Thanks

Can we get a vmcore dump using kdump functionality?

-- 
Thanks,
Hyeonggon
