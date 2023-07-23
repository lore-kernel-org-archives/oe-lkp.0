Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75EC2F51
	for <oe-lkp@lists.linux.dev>; Sun, 23 Jul 2023 19:09:26 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1b890e2b9b7so17845915ad.3
        for <oe-lkp@lists.linux.dev>; Sun, 23 Jul 2023 12:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690139366; x=1690744166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7v07lcKVDFmLScNKcZ0mUkKiHYa5lP2jZjbn8NMGSaA=;
        b=bMpFAC7EebSHAb+kUtyidIURprmXbm80OO72McgKUaOSlQZNSAAEIvY+ACn5NDZcqa
         6NJw3+9TmE1BNTQ5l2qxknFwzQJKW03gHbtIDAS1GbUSxpLC3sgstiL2EuOmSp2YNKLu
         tI/hBQfwQw+DOA7xdYK8fAfuKws1Uy/uPLp1Z7kLlSiDeDK4/dv4wBhuiPz5pH+ei564
         AkTxjjlgtMt/w0ZSLfhyQNGhsQZe4laf2wCZIee+hvcDYVONGhZDDAz1Cwo1eKD+n9SH
         K/x7pjUcYOl/3WDkwCY/nmEAKyBjW9RVsJOvZ5bmd1uzjubJQsWdP/QhZYC1ExMsPn2l
         LtLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690139366; x=1690744166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7v07lcKVDFmLScNKcZ0mUkKiHYa5lP2jZjbn8NMGSaA=;
        b=JJOGRou1ddOBISBLsg/zQ+DRMVX/pNFOcrM2l3BzNZ8IokbmQmQmIMhIUIe0vaT8FF
         ElWknyEm1KOs/Rh/djYH0Jptv5IK9gxYSqKcgAiLFjO3lNIJrxL1Io9DckfMoV287Laf
         LuIMZF/ucw40SFabX5jvJNkRaY01MRdiT4/mEcsRtbPUKxkS7+V47Ldf21vAlFTOAqYD
         r7D1SWg9KUNeusXkTJl/+ikK7cqmw6BCAOuYt41sy7MiAcLkrIYgeP7DrZJ/pMs6jwR1
         CGyzdYmHwoCzIUdVNtRkjaGLitxCjyDRbyOXxHUHYnP0N2j27bFJk1HAeVd4aGBBbK1n
         rX1w==
X-Gm-Message-State: ABy/qLb56TBxayJ1VdzhVEoG0ahX77Ybl1wCaQltdrxrYFfVEVWGgwcN
	iMw6Gx6SE4ciTJXfaW4+vD0=
X-Google-Smtp-Source: APBJJlE+z1ZxrexXyi9TWVUOJNx3yFc0kYxggupimycaR2uzOUodTj/6xjrQkzfnpB/iSrPQasSGkA==
X-Received: by 2002:a17:902:db06:b0:1b8:a2af:fe23 with SMTP id m6-20020a170902db0600b001b8a2affe23mr6244094plx.2.1690139365916;
        Sun, 23 Jul 2023 12:09:25 -0700 (PDT)
Received: from fedora.. ([1.245.179.104])
        by smtp.gmail.com with ESMTPSA id s10-20020a170902ea0a00b001b53d3d8f3dsm7168625plg.299.2023.07.23.12.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jul 2023 12:09:25 -0700 (PDT)
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
To: Vlastimil Babka <vbabka@suse.cz>,
	Christoph Lameter <cl@linux.com>,
	Pekka Enberg <penberg@kernel.org>,
	Joonsoo Kim <iamjoonsoo.kim@lge.com>,
	David Rientjes <rientjes@google.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Roman Gushchin <roman.gushchin@linux.dev>,
	Feng Tang <feng.tang@intel.com>,
	"Sang, Oliver" <oliver.sang@intel.com>,
	Jay Patel <jaypatel@linux.ibm.com>,
	Binder Makin <merimus@google.com>,
	aneesh.kumar@linux.ibm.com,
	tsahu@linux.ibm.com,
	piyushs@linux.ibm.com,
	fengwei.yin@intel.com,
	ying.huang@intel.com,
	lkp <lkp@intel.com>,
	"oe-lkp@lists.linux.dev" <oe-lkp@lists.linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>
Subject: [RFC 0/2] An attempt to improve SLUB on NUMA / under memory pressure
Date: Mon, 24 Jul 2023 04:09:04 +0900
Message-ID: <20230723190906.4082646-1-42.hyeyoo@gmail.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello folks,

This series is motivated by kernel test bot report [1] on Jay's patch
that modifies slab order. While the patch was not merged and not in the
final form, I think it was a good lesson that changing slab order has more
impacts on performance than we expected.

While inspecting the report, I found some potential points to improve
SLUB. [2] It's _potential_ because it shows no improvements on hackbench.
but I believe more realistic workloads would benefit from this. Due to
lack of resources and lack of my understanding of *realistic* workloads,
I am asking you to help evaluating this together.

It only consists of two patches. Patch #1 addresses inaccuracy in
SLUB's heuristic, which can negatively affect workloads' performance
when large folios are not available from buddy.

Patch #2 changes SLUB's behavior when there are no slabs available on the
local node's partial slab list, increasing NUMA locality when there are
available memory (without reclamation) on the local node from buddy.

This is early state, but I think it's a good enough to start discussion.
Any feedbacks and ideas are welcome. Thank you in advance!

Hyeonggon

https://lore.kernel.org/linux-mm/202307172140.3b34825a-oliver.sang@intel.com [1]
https://lore.kernel.org/linux-mm/CAB=+i9S6Ykp90+4N1kCE=hiTJTE4wzJDi8k5pBjjO_3sf0aeqg@mail.gmail.com [2]

Hyeonggon Yoo (2):
  Revert "mm, slub: change percpu partial accounting from objects to
    pages"
  mm/slub: prefer NUMA locality over slight memory saving on NUMA
    machines

 include/linux/slub_def.h |  2 --
 mm/slab.h                |  6 ++++
 mm/slub.c                | 76 ++++++++++++++++++++++++++--------------
 3 files changed, 55 insertions(+), 29 deletions(-)

-- 
2.41.0

