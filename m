Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD531C6B1
	for <oe-lkp@lists.linux.dev>; Wed, 25 Oct 2023 08:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="GZ+fhNaP"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-9a6190af24aso842400966b.0
        for <oe-lkp@lists.linux.dev>; Wed, 25 Oct 2023 01:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1698221883; x=1698826683; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xF6RmXe0iwrBVlFJKvkrtWsUWK5y+quiCOALv0ygLjY=;
        b=GZ+fhNaP1OZb6VLgfKpirerzDckbiYwYELOLlZkVF/frNaJ3S94JLMgIr8dGXGx4IP
         nfytvsyxrI/EjuKegrbmsQnf7PUAXwVNSjEenM2BPMuuQwnfSk+aZVVZAm78/Wv/MnMd
         2PYtM2UT5jXQIFMxBTWGV9xl8aTF3FW+x8mZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698221883; x=1698826683;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xF6RmXe0iwrBVlFJKvkrtWsUWK5y+quiCOALv0ygLjY=;
        b=jVwId0MPSzdxdTAhTQGLdwYgP1bvzh9+d4vbwwFi6kEKKaoU+wwjvDIEJgFGwz6pHJ
         ypsqk0iQf0b8VYKKzlJzYH+fSzD5hMjHkfQVoMilegU51y0olv6wMlSbnwkSGFV/jX8b
         RJLGuO7KjroMegJs5P7UdAKTQQCgMnAS0CEJvjMhUAnX5rPh/nDd74AZJkiKV+zqSXCz
         X0XwDXsrFgeZzeBiOs75kfMNP847phirV5M3OI0Lr1VlLcJnlfu+p7Dn6A4/ZOgtfAIs
         IhWyQ+Menhx9vf57bgeTeGziz0r1TwSUAPULwcu7E3STviEF08yh2cxnPHaS6IMuUjls
         hAHg==
X-Gm-Message-State: AOJu0Yzo0u1kVruhFN68WnzX7f2mY5I4ynZfEJQY/XQ0fZcmWU2Bzwuu
	88bJEgpIZoRTSSw17No1Luw70g==
X-Google-Smtp-Source: AGHT+IFIy8aB1unRqCPL9qYewTHPkrA5JVy0EuoyQaAtd8SKKnjyQjwdjhFVPf1/NxxldDs9u8D+LQ==
X-Received: by 2002:a17:907:1c0b:b0:9be:45b3:1c3c with SMTP id nc11-20020a1709071c0b00b009be45b31c3cmr12738251ejc.64.1698221882709;
        Wed, 25 Oct 2023 01:18:02 -0700 (PDT)
Received: from [172.16.11.116] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id ov5-20020a170906fc0500b009a1fef32ce6sm9561110ejb.177.2023.10.25.01.18.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 01:18:02 -0700 (PDT)
Message-ID: <374465d3-dceb-43b1-930e-dd4e9b7322d2@rasmusvillemoes.dk>
Date: Wed, 25 Oct 2023 10:18:00 +0200
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] lib/find: Make functions safe on changing bitmaps
Content-Language: en-US, da
To: kernel test robot <oliver.sang@intel.com>, Jan Kara <jack@suse.cz>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, Yury Norov <yury.norov@gmail.com>,
 linux-kernel@vger.kernel.org, ying.huang@intel.com, feng.tang@intel.com,
 fengwei.yin@intel.com, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>,
 Matthew Wilcox <willy@infradead.org>, linux-fsdevel@vger.kernel.org
References: <202310251458.48b4452d-oliver.sang@intel.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
In-Reply-To: <202310251458.48b4452d-oliver.sang@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/10/2023 09.18, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed a 3.7% improvement of will-it-scale.per_thread_ops on:

So with that, can we please just finally say "yeah, let's make the
generic bitmap library functions correct and usable in more cases"
instead of worrying about random micro-benchmarks that just show
you-win-some-you-lose-some.

Yes, users will have to treat results from the find routines carefully
if their bitmap may be concurrently modified. They do. Nobody wins if
those users are forced to implement their own bitmap routines for their
lockless algorithms.

Rasmus

