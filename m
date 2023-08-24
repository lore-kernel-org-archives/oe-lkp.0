Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DC47F
	for <oe-lkp@lists.linux.dev>; Thu, 24 Aug 2023 20:52:08 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-26fc9e49859so162775a91.0
        for <oe-lkp@lists.linux.dev>; Thu, 24 Aug 2023 13:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692910328; x=1693515128;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WkgAkzmNzUul7+4VgInIuDX0DKPGv7dGSQvEsL/Tlso=;
        b=Ts3iXctWYE/25qlkNAS9UaQol0lI2gmph9BUtF5lYFzOvUS9wExVj6Ha68dD/GUIN/
         qHDJz5zyZbYySARDheNK66yH0bpWF1+Ro0dtHyLvsLdhIbKr52/NRPK3oCpUES2Etvqv
         Y0qsbafjgkkMejKctuSMSOMt2jXLxSAapMk+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692910328; x=1693515128;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WkgAkzmNzUul7+4VgInIuDX0DKPGv7dGSQvEsL/Tlso=;
        b=Gu5oPMemZdS0Pz36h8Ywy60Dp1StTg3BhqfhdwoGJH/SCFVXHVH4uJIIoQoBSv9ADF
         Bx8F1IrqED2nGSeWfcTMARhUljSSOWU0Hxv7Vp23G8lk7h/dssHxSMeZnrcZq6zjoRN8
         hKbnkioyIE9pVcz4A76NNDbDxoMDPDD0Ly+K2t0mXiiFalCfE0yxiY8zJvJoUfwv2AnL
         dogk2j8X0AvbAhyO1TzqKFsoPP3t3DPscnYJ03n9ac9rDW/KmmisKxklkyYdpENejwE2
         F7cE47ISxgTxYqlItdmgkYcFwkRALpQi9uZky3cZloHLvAHWUFMrPdlKk5uzZNNWj+ID
         TCVA==
X-Gm-Message-State: AOJu0Yw+eAAIhT3KtmPjjMgeQZzFJnId0EGrFjUbgYbAtbip3iINqxFc
	/oiOYLC3Y93WGnRB1nZsdUbQiQ==
X-Google-Smtp-Source: AGHT+IEjtBiHPtNVLZT2gtMXvB9U83RhiwJfuikZH5BTPX+/cK58qVsSMrLFEnwlOTZelEg/vyUwqA==
X-Received: by 2002:a17:90a:a615:b0:263:4305:4e82 with SMTP id c21-20020a17090aa61500b0026343054e82mr12727466pjq.6.1692910327753;
        Thu, 24 Aug 2023 13:52:07 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 23-20020a17090a01d700b0026fb228fafasm2156603pjd.18.2023.08.24.13.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 13:52:07 -0700 (PDT)
Date: Thu, 24 Aug 2023 13:52:06 -0700
From: Kees Cook <keescook@chromium.org>
To: Yonghong Song <yhs@meta.com>
Cc: kernel test robot <oliver.sang@intel.com>,
	"oe-lkp@lists.linux.dev" <oe-lkp@lists.linux.dev>,
	"lkp@intel.com" <lkp@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Song Liu <song@kernel.org>, Zhen Lei <thunder.leizhen@huawei.com>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [linus:master] [kallsyms]  8cc32a9bbf:
 Kernel_panic-not_syncing:stack-protector:Kernel_stack_is_corrupted_in:test_entry
Message-ID: <202308241351.E3467F14@keescook>
References: <202308232200.1c932a90-oliver.sang@intel.com>
 <202308241323.ABBE0B09B@keescook>
 <SN6PR1501MB2064F8313A3AD64E6F69C2D5CA1DA@SN6PR1501MB2064.namprd15.prod.outlook.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN6PR1501MB2064F8313A3AD64E6F69C2D5CA1DA@SN6PR1501MB2064.namprd15.prod.outlook.com>

On Thu, Aug 24, 2023 at 08:41:03PM +0000, Yonghong Song wrote:
> Debugging now. I already made some progress. Should be able to send a patch soon.

Great; thanks!

-Kees

-- 
Kees Cook
