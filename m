Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BBB4C89
	for <oe-lkp@lists.linux.dev>; Fri,  2 Dec 2022 16:54:32 +0000 (UTC)
Received: by mail-pg1-f202.google.com with SMTP id q63-20020a632a42000000b0045724b1dfb9so5034678pgq.3
        for <oe-lkp@lists.linux.dev>; Fri, 02 Dec 2022 08:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=W4be2lHBFg2WCV6qZhgqwvxIUVEumxynCQKUkXCdxvk=;
        b=Px9L2aZyxN7M0m1j6cdE9wvoe9DlFFr6V9pBMfV6Qe74oU94DfmBzQjiJmFm/Z7NdA
         Se2GV/J+ZGJU5J3AHKBzHWHYPyKtEVTHW7xJHtfxhcuT3vj4NMuZx+1ysp687XHlqYP7
         supnwsh3llnyikXrpRbKZN8wVwla+4zgByrdGSg2mkBwwuuBP0N9o/hTZwf/nK1+f67A
         54GJE/cPumSBO4Tw18cFvAf8DHpNKpGQQzCjhSoLPb+M4VpMT4xlXI2arVfCcpVaX0mI
         Q4Lm3DoIJ1cUfPVJVF4AWRMpB/bhrO0Ia5NvbQWj4Gb4hvv/AxNACUS4v38qXx6I9cvg
         0sWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W4be2lHBFg2WCV6qZhgqwvxIUVEumxynCQKUkXCdxvk=;
        b=zjL0cAEjEjDH3Y0j8PIxgdrD/xjeCFECf9yKnmOlPLd+MptH5TmxP+oDL+aRCJTu2m
         qBdzLL94yGuAy5rK0+YuS4l4Euw3Rkc2EK55qI2pQoKnA7pevcemUstG0V2gYOPrpM7l
         lt2hH1Aa4q9jfE0FSmTD2o1RX23mAxRMMpJLKPSXv0+irggEZG9VumCFn5h8qGy8XDvO
         sFl0Q8Ui1zrkLJthfcmP0Jc+u+uf479vyTnKe0CdzdgBzraLW0zWQY5gnJtwPrU0FXoG
         mr7Nggx5i67gv8YQY4LY+zBjpMEa35uMloSHbhUHYJ8Pe6Llob7Xs/jepCakgra2C8wq
         L2Tg==
X-Gm-Message-State: ANoB5pkUsthhw/urPSbyZoBWAlOE2fzAz1X0vqhOcnNONt/cbt2nBqmp
	N0Sn5ESMvWDNyX7CToZBe6ME2L76ziJwNQ==
X-Google-Smtp-Source: AA0mqf6c1yIvU/EpzrCsHwOdXo3r7WkG7BPirYqhfsBkw5h+T5ol09HKzMFFE8uOis8dykdyKCnHE3oVns74yw==
X-Received: from shakeelb.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:262e])
 (user=shakeelb job=sendgmr) by 2002:a17:90a:d086:b0:219:227d:d91f with SMTP
 id k6-20020a17090ad08600b00219227dd91fmr3265907pju.0.1670000071361; Fri, 02
 Dec 2022 08:54:31 -0800 (PST)
Date: Fri, 2 Dec 2022 16:54:29 +0000
In-Reply-To: <Y4m8Unt6FhWKC6IH@dhcp22.suse.cz>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202212010958.c1053bd3-yujie.liu@intel.com> <Y4m8Unt6FhWKC6IH@dhcp22.suse.cz>
Message-ID: <20221202165429.wapfvrgw5mp7cz5h@google.com>
Subject: Re: [PATCH] kselftests: cgroup: update kmem test precision tolerance
From: Shakeel Butt <shakeelb@google.com>
To: Michal Hocko <mhocko@suse.com>
Cc: kernel test robot <yujie.liu@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	Andrew Morton <akpm@linux-foundation.org>, kernel test robot <oliver.sang@intel.com>, 
	Soheil Hassas Yeganeh <soheil@google.com>, Feng Tang <feng.tang@intel.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <songmuchun@bytedance.com>, 
	Eric Dumazet <edumazet@google.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	"Michal =?utf-8?Q?Koutn=C3=BD?=" <mkoutny@suse.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Dec 02, 2022 at 09:50:26AM +0100, Michal Hocko wrote:
> OK, so this is a full patch to fix this
> --- 
> From 7f338ed952ba4a100822004bc8399bf720b42899 Mon Sep 17 00:00:00 2001
> From: Michal Hocko <mhocko@suse.com>
> Date: Fri, 2 Dec 2022 09:45:29 +0100
> Subject: [PATCH] kselftests: cgroup: update kmem test precision tolerance
> 
> 1813e51eece0 ("memcg: increase MEMCG_CHARGE_BATCH to 64") has changed
> the batch size while this test case has been left behind. This has led
> to a test failure reported by test bot:
> not ok 2 selftests: cgroup: test_kmem # exit=1
> 
> Update the tolerance for the pcp charges to reflect the
> MEMCG_CHARGE_BATCH change to fix this.
> 
> Reported-by: kernel test robot <yujie.liu@intel.com>
> Link: https://lore.kernel.org/oe-lkp/202212010958.c1053bd3-yujie.liu@intel.com
> Signed-off-by: Michal Hocko <mhocko@suse.com>

Acked-by: Shakeel Butt <shakeelb@google.com>
