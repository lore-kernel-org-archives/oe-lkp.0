Received: from ubuntu20 (unknown [193.203.214.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927171850
	for <oe-lkp@lists.linux.dev>; Mon, 20 Mar 2023 12:46:52 +0000 (UTC)
Received: by ubuntu20 (Postfix, from userid 1003)
	id 1DB41E03F2; Mon, 20 Mar 2023 12:41:00 +0000 (UTC)
From: Yang Yang <yang.yang29@zte.com.cn>
To: yujie.liu@intel.com
Cc: akpm@linux-foundation.org,
	bagasdotme@gmail.com,
	feng.tang@intel.com,
	fengwei.yin@intel.com,
	hannes@cmpxchg.org,
	iamjoonsoo.kim@lge.com,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lkp@intel.com,
	oe-lkp@lists.linux.dev,
	ran.xiaokai@zte.com.cn,
	willy@infradead.org,
	yang.yang29@zte.com.cn,
	ying.huang@intel.com,
	zhengjun.xing@linux.intel.com
Subject: [linus:master] [swap_state] 5649d113ff: vm-scalability.throughput -33.1% regression
Date: Mon, 20 Mar 2023 12:41:00 +0000
Message-Id: <20230320124100.25297-1-yang.yang29@zte.com.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <202303201529.87356b9e-yujie.liu@intel.com>
References: <202303201529.87356b9e-yujie.liu@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> 04bac040bc71b4b3 5649d113ffce9f532a9ecc5ab96 
> ---------------- --------------------------- 
>          %stddev     %change         %stddev
>              \          |                \  
>  10026093 ±  3%     -33.1%    6702748 ±  2%  vm-scalability.throughput

I try to reproduce this and see vm-scalability.throughput really decrease.
And I use ftrace found that functions related to this patch
add_to_swap_cache()/__delete_from_swap_cache()/clear_shadow_from_swap_cache()
consume more time while workingset_update_node() be called much more times.

Since the patch result in consuming much more resource, and the problem this
patch try to solve is not apparent to user, we may abandon this patch.

By the way, as what this test result shows, mapping_set_update() should also
consume much time. Should we care about this?

Thanks.

Reproduce before this patch:
/vm-scalability-master # cat /sys/kernel/debug/tracing/trace_stat/function0
  Function                               Hit    Time            Avg             s^2
--------                               ---    ----            ---             ---
  add_to_swap_cache                    26108    476290.6 us     18.243 us       487.762 us
  __delete_from_swap_cache             26117    462492.6 us     17.708 us       77.801 us
  clear_shadow_from_swap_cache         27840    199925.1 us     7.181 us        313.126 us

Reproduce after this patch:
/vm-scalability-master # cat /sys/kernel/debug/tracing/trace_stat/function*
  Function                               Hit    Time            Avg             s^2
--------                               ---    ----            ---             ---
  add_to_swap_cache                    51268    1371819 us      26.757 us       676.311 us
  __delete_from_swap_cache             51260    1322712 us      25.803 us       123.010 us
  workingset_update_node              157455    770064.9 us     4.890 us        15.108 us
  clear_shadow_from_swap_cache         52928    563597.4 us     10.648 us       199.766 us
