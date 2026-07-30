Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF0843C04B
	for <oe-lkp@lists.linux.dev>; Thu, 30 Jul 2026 14:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785421822; cv=none; b=p4ONp2nCZSkAAkjfwpwCMT1Ll+vLmev/HKCdguksAMIUCeJSXIb4+fTsdY+nuh2Ov5DB1jJ2o3IUmoQWLKfQ37THR5jqkrND/rroNpsXQP1PxUF+2dGhfVjfQvgExzzpNBu6kszpBeh0UJxDuNw9w69FKFoSeONp1e5QNYbh5SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785421822; c=relaxed/simple;
	bh=6zxsMNNBcnPilLYN0lpOH6oC8qH8IQaVIGoWa8512x4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LzB4efwQv5aV5jcbVGqQVPG+Dp1GuQmSDvXqF0YA/1jOrWeHo2UuzgOQf+983Z9MRAURrQtCWLAFtdEEFdQam3MUCbwyLuz30m8rF64Tp1eNMAzbDHdQT7JlVQAyIcoIX4aNn2HF2Q8s5GiAkr5AtVuNzfVAaPRP3P8W5SbMzzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g5tpr+S0; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g5tpr+S0"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-456d267da8cso956840fac.2
        for <oe-lkp@lists.linux.dev>; Thu, 30 Jul 2026 07:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785421820; x=1786026620; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PziV63Nbks27UfV1soZbzQSjz5qZMrsSwS8b4MFid6w=;
        b=g5tpr+S0mqjEF5UDLjpF3LQkgKNmRaWydHVWS7AaMG6wY5d4wHbntcXiFEgzoPK1/Z
         N1txEiTHXChn2HEJTLAdCFT9mwyj+JpA3LIbkyIFyD5zpqjL40NaKS+PcJ6Y/wXB5wNv
         zmgKYcrGkw6teHKm+tVi0sq5hqNjxJTbjDecFrSPCSItIA75aucqF5Pb6Pg9Etyuk/9m
         V1m4jqyX1UMk8BZ7HAUb6grIOzXx/5sWAYFl8Te5kZ0Mz7SZlx5E7izsPTyLuiVimmRD
         lWRH4EIwqPmIcv2XYKkgiAX0ElWva1PSKQgiC+2edQ7GbTQvxjnL1lC4JPq4BJ3JH/G0
         SdRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785421820; x=1786026620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PziV63Nbks27UfV1soZbzQSjz5qZMrsSwS8b4MFid6w=;
        b=SPwcssiWUcADNbrQY+RqrxTPe1RWjkcKNQasV2vUcsXUPin4MZy+TMwy4b6xDWAV+A
         XWpoad/1AUqh+NntLk88L4SR2NkdrQdFj4yp38HjOtLXtrgrLouRauHIa0qhoexRkMcH
         qDJH3R4E2CXQQ63ydFuGIsBo9frqvlqe1iiiVaQJOCdGIf70VYzHdpAbljKJyoxF9DaG
         bW8ziNHouLPPkLePfQD7Z9BCRhgc2aT0Yn0PsGyjcvNDGh9KqyZiacS5Iju4LCoOC73+
         Da/SFcBtsal82tD6Bb0NhYQbgD6VDNOUIQD9OIhEKPMpG3dvT+vWkY5+Zh3tTypD2vdP
         jzQQ==
X-Gm-Message-State: AOJu0Yz+wWVdC/g+GTUFd7+iXYg7seJNVVcdZmNqS6avQZoE9XHNm1a2
	7V+OKr9/tRq7Mr4Mk7K6vu4H+O3itiYSKb/s6W2r58MDjiJwalDmB8Jn
X-Gm-Gg: AR+sD11PA2xpMEl8BodWE2vvoWL67slLi43m9rcK4fj6ek2oeYP42dX3+BLWizE8M2L
	VNZN25U0EnHJg015OeoM3qRKxQd632wH7v4qhhTII972QGMI8WjxbGG15yNI0Kp5q0hvKsx2rJA
	zz50DT5ClPqm3jxvDP2NQOIU37L4iEPHftb0POpsaxJKa8CEhU7t+6H0gWNpC5eQVjSyvUTRGBL
	PzkzW+2B9yehHg3RZdMZbLPz+VOxKxC1KKcfnVDGSxWNRyk6iHZTkEMnIPWXvSStSt9t765aLNX
	PqUvKhxXMrIyixmh3BKTbOOtyCV3OS/hsayFfCzejePri59+dnSNDeV2aNz0eLeqPGxnAxSy7Qg
	6W81IRIgiEYsi/+I3qN1c9c8ds9i5GuCpxXPJpF11LmuR7WNgAvhvBzosb7GYi0xxYWxBFMGjOu
	Ul0bZZNtZtLN5ke1/Ix9cPY7AhE/jrJipNwmLZMmJpFWq29Y4B3Mwt9Aa1J6RxzteygDB2oocsR
	wZAhADXQz+ZjGu+7IbDCbv+DTP8+Q==
X-Received: by 2002:a05:6870:8263:b0:456:5582:19be with SMTP id 586e51a60fabf-458c1b24576mr1955115fac.38.1785421820045;
        Thu, 30 Jul 2026 07:30:20 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:41::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-458c2947cc5sm1964872fac.11.2026.07.30.07.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 07:30:19 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Oliver Sang <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev,
	lkp@intel.com,
	Johannes Weiner <hannes@cmpxchg.org>,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	"Michal Hocko" <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	"Shakeel Butt" <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	"Andrew Morton" <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam.howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	tim.c.chen@intel.com,
	vinicius.gomes@intel.com,
	ehab.ababneh@intel.com,
	thomas.falcon@intel.com,
	yu.c.chen@intel.com,
	philip.li@intel.com
Subject: Re: [PATCH v4 4/5] mm/memcontrol: convert memcg to use page_counter_stock
Date: Thu, 30 Jul 2026 07:30:16 -0700
Message-ID: <20260730143017.1568456-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <amr1lhRiYC64kYNY@xsang-desk>
References: 
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 30 Jul 2026 14:56:22 +0800 Oliver Sang <oliver.sang@intel.com> wrote:

> hi, Joshua Hahn,
> 
> we are currently piloting AI integrations to help enhance 0-Day's performance
> analysis and regression-detection capabilities. Since this is in an early trial
> phase, we want to ensure we build features that genuinely support your workflow.
> We would love to hear what you would like to see from AI-assisted reports, whether
> it's specific bottleneck explanations, a cleaner format, or filtering ideas.
> 
> Please share your thoughts and suggestions with us to help guide our development!
> 

Hello Oliver,

Thank you for this sample fix, and thank you for the report. It helped me
realize that uncharging should return stock, but only in the networking
side (and not the lru side, since it's already batched there).

This is a personal style preference but I like to keep reply context as
minimal as possible, I think that the AI response might not need to keep
all the performance statistics still in the reply at the end : -)

Otherwise I am a big fan of this (for my patches, at least) as an author.
I'm wondering if reviewers and maintainers may find this to be too noisy
to be sent out in the mailing list.

Thank you again, I hope you have a great day!
Joshua
