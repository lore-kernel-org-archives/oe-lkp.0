Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF99190
	for <oe-lkp@lists.linux.dev>; Mon, 30 Jan 2023 16:30:03 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id 123so14686848ybv.6
        for <oe-lkp@lists.linux.dev>; Mon, 30 Jan 2023 08:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EoLH3reILvg5UVXU0ViAEu7dA7E4/FUTiJhGYqbHLag=;
        b=JvovbOEiurqKGKaZhU2wemRT5er0dvcPAJ8Oyt1QHHlgoH+mDwsz7Kex9v0WUqBK7/
         2XBOTku+YhdryYTMfPMCZcpJHBaHS5bU5SWyxFQYxjPFil+lPv7bZ6S57tS97gc5jiLp
         xEXnkW46XyXyeHpeRkVriP2wvFOo71ICa3q+UTODbvv6WhAV6TWKtULk7/nMtK2KuSEV
         bOU6D8jNbojMDToEAQHxJC19COfYXNBUD2uGSLV+VyRP5WsSspOp/VMF4hBnixh9PxY4
         UxTRWnT4pWq6v2Z6RNkOGXDJ/nArI6KdpFo8QJPwfALO8bY2pbi/iFlupQQFXBHfWw/B
         /OSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EoLH3reILvg5UVXU0ViAEu7dA7E4/FUTiJhGYqbHLag=;
        b=NZ6F6vV8VevM+hmR7TkJsb88eT1Nl2QaprLvUL8znoxv7y2LY0PUTdUo3JPBgWLWBK
         mJT65VwCyfPjEnCNV7DJemXSho4WADvRJ7ngEq+PMe12K/IpnYO83mWH0bedHjpaEs3U
         ddRCz/sfvguQIqw1+PJROxn0jxqjAeiVnRTkjihkI36/fhGq6JM+KwvgwBSK39XhPz3o
         h1ar+jt6mLEKYguXzk/MPIssoqHYatcxn0xMTn9GIlRASxhNIS58rWObLDIHzLpbTKPP
         252FSCqe+z/sQj+Pkbfa+zImWcEtrpoCjtrsXj/jhNJJAONbjsn3RY1O98NMprA0ctWP
         CKhw==
X-Gm-Message-State: AFqh2krx7N6hF6zJ3GrLr/pvwYboJJnIZZ93iLNCbNMFvg1RvJGluBLJ
	oGbN0itZAlxUz0V/mXNeV3BuJzfH+3yuS4nAt3CLGw==
X-Google-Smtp-Source: AMrXdXvEh4f28D7UERcineZdxy+w6tqcZMWpPWqMrL3XsVvr7822ktkTlmkQdg/CndeoBp2VW6Bo0kvA2kTRk4CZpqA=
X-Received: by 2002:a25:7c47:0:b0:7c0:46a9:5e62 with SMTP id
 x68-20020a257c47000000b007c046a95e62mr5513768ybc.245.1675096202014; Mon, 30
 Jan 2023 08:30:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202212051324.182a6363-yujie.liu@intel.com> <CALvZod4CD+O7-ynGAHU-6vxE6CbSmuQei1=SVJsx0zFfQdmV2g@mail.gmail.com>
 <875yepfe4j.fsf@yhuang6-desk2.ccr.corp.intel.com> <Y9ctU3HtkAC7G05Q@xsang-OptiPlex-9020>
In-Reply-To: <Y9ctU3HtkAC7G05Q@xsang-OptiPlex-9020>
From: Shakeel Butt <shakeelb@google.com>
Date: Mon, 30 Jan 2023 08:29:51 -0800
Message-ID: <CALvZod7rBAyT58YsVe5Rn5SMjNpdTX8ryqo-WCOVPps_0oDKCQ@mail.gmail.com>
Subject: Re: [linux-next:master] [mm] f1a7941243: unixbench.score -5.1% regression
To: Oliver Sang <oliver.sang@intel.com>
Cc: "Huang, Ying" <ying.huang@intel.com>, kernel test robot <yujie.liu@intel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, Andrew Morton <akpm@linux-foundation.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, 
	Linux Memory Management List <linux-mm@kvack.org>, linux-kernel@vger.kernel.org, feng.tang@intel.com, 
	zhengjun.xing@linux.intel.com, fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 29, 2023 at 6:37 PM Oliver Sang <oliver.sang@intel.com> wrote:
>
> Hi, Shakeel Butt,
>
> please be noted we noticed the regression is still existing after this commit
> merged to mainline, we reported as
> https://lore.kernel.org/all/202301301057.e55dad5b-oliver.sang@intel.com/
>

Let's discuss this on the other email chain.
