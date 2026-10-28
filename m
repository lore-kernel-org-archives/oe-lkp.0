Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793164398;
	b=bbAuO6IeVbf00VolZiiIE8RVUEwv/9XBS1iZkTqgYKq03sudY1VTSme2aUR4DM4ZfKVk
	 x8enhxuRzE+eAZXqN8XG0sDNRU9QqjVRpfG2BUXwucJLJ0h19DYU3b7n+Q6eqwCjsv7A0
	 BHSFjlUoRsDcyIIZ/zROORRkNTvs0UhKkzWL9kltCveGvkVQOEmR+SlzJjGRmCMicXWhz
	 kGAx0+jx+nXw6CUaSd0mmXMRkExSL8mIs2z72voRnOlwqPCDiqHnMqfwyxOLSYjKRYV9Q
	 N9YECYZaSfqjVBYXCP48J5qW11qJr7OzDENV6sbE9nFtju9LDqmJ36LmVunIjeJuHPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793164398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=jGHdCexy6WO9vn70fAdnEqZgjYrf6z9TvrrdavCztqo=;
	b=LdWdZzDejpNq2z6KpBSSqDiWIqe/3jB3gIchlHNfX3BmaONumF9Imhyv4ykYkazXmNuG
	 gymyBTdJwRZtHPSgfDd3WPibniSRQ4cmcvxjvVHJR+u4baEb1MywndEjTzC0CR8thPdzw
	 3CKpkTYSrrgAb4XT63RjcYPuPOSJ8G7WvkysMPYAxrE8fX7kqKVBSv45nz1jrbPFF/GUq
	 baSO1Du9XiIcnIxuASW6K9e+8ZDs351r2geOt+kRsZc60NF2nJN4JboKS7AYSwplYoiud
	 ic9j9anw35RoEY0Wb08HtYNmq+oftsncC79XKzf9KTjYbeyRds3fKrpZoZnTi09i1Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--surenb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OH7YbEoX;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B44F606A323
	for <oe-lkp@lists.linux.dev>; Wed, 28 Oct 2026 05:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B44F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OH7YbEoX
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1111322eec.1
        for <oe-lkp@lists.linux.dev>; Tue, 27 Oct 2026 22:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793164397; x=1793769197; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jGHdCexy6WO9vn70fAdnEqZgjYrf6z9TvrrdavCztqo=;
        b=OH7YbEoXGS01NRmojkJKGLJLhPxltIMqfUlNvgXLj+ujKj3JoK3YWTYqb/32AyQv+c
         yGXl2mEZ8fPV0Hswf3U4i0oSGBecZOVNXedlbvJap9/iesAbmRNqljVPmCEw0lLx/PLB
         f0U456YIwwTKJsNwAvaD+/8Tj0UVCbr0ABf/UzV4pvJDyQluwOwqpfi0Loc++edreRFf
         iJiV0+Lebn6TQod+8iZRN7wZmy7GVVSixMdN4SqYT3tj0KT5wzHxR8ZTR3BZ1zA+WBiP
         LaHXCJwAllefK1d4yynnR30nFcC+TCIoben3WhC65aljYU0tIrmfUM8kq+WgNS9jkKqM
         +WGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793164397; x=1793769197;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jGHdCexy6WO9vn70fAdnEqZgjYrf6z9TvrrdavCztqo=;
        b=jHFXhRlcznnyiZmLMXoJo8rY3UFSS/jQbLUvIjIr8ehL1Raayl/hkI73xusre3R1T0
         GHfhdn894ifdAIZhVp1lS/KHiSRhZEG07aqPTFHTsLmOt64lSWIhVSXqzaxJkBFkYBQd
         9WrmyuLTxKdTWzruyLRQh3czWgkA1LaS4jYz02csr7TGoLIqxGDjsv0vxfN3xT9cYSaf
         Van3xfHpdq75uT6L7eY5Ai76MCw/+0n447orzYHQukLfM4CWRmGB7xf5erfchT/BaJ4+
         wTwoqC4YfHaqVD9uxdEivq8EdSQWlwK8MIXVdxh1E9smluI8WbHkU/+jc4zHY3Nz0eMW
         Etfw==
X-Forwarded-Encrypted: i=1; AKwUvBw+63GunzPZzJv1yVIq+uRz+bgsH/qBrDJp+Et4qh4NXCo9sR4fJo+ALPamB+CoajeNBryzKk4=@lists.linux.dev
X-Gm-Message-State: AFq9FYKvt9birkhkDQkq1ovagh8uozpNuVhNR28W3RGRiO7QZExGkLXV
	NqPN3Xd0SbbpCFJCkhdLzk6IkhgiOw8HYUrIsWFer9TbRSuJ6lC9thDQ+JY2O1pJEH33njSmVor
	RK6cYzA==
X-Received: from dlbrl12.prod.google.com ([2002:a05:7022:f50c:b0:195:e16b:fdd2])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:126:b0:16a:c6f2:60c2
 with SMTP id a92af1059eb24-1a6cd498ddemr1946287c88.12.1793164396372; Tue, 27
 Oct 2026 22:13:16 -0700 (PDT)
Date: Tue, 27 Oct 2026 22:13:12 -0700
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Post: <mailto:oe-lkp@lists.linux.dev>
List-Help: <mailto:oe-lkp+help@lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-lkp+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261028051312.1505295-1-surenb@google.com>
Subject: [PATCH 1/1] selftests/proc: use RSS in /proc/pid/smaps_rollup tearing tests
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: david@kernel.org, ljs@kernel.org, jannh@google.com, liam@infradead.org, 
	willy@infradead.org, paulmck@kernel.org, pfalcato@suse.de, 
	usama.arif@linux.dev, vbabka@kernel.org, linux-fsdevel@vger.kernel.org, 
	yi1.lai@intel.com, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>
Content-Type: text/plain; charset="UTF-8"

Pss metrics can be affected by map count even if VMA tree stays unchanged,
therefore test checking VMA tree integrity can't use them. Use Rss instead
and pre-populate the VMAs so that Rss changes if a VMA gets skipped or
double-counted.

Fixes: ca5480fb53fa ("selftests/proc: add /proc/pid/smaps_rollup tearing tests")
Reported-by: kernel test robot <yi1.lai@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202610271934.fd287c3f-lkp@intel.com
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 tools/testing/selftests/proc/proc-maps-race.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/proc/proc-maps-race.c b/tools/testing/selftests/proc/proc-maps-race.c
index bf4c5073f6fc..b6d88afb252b 100644
--- a/tools/testing/selftests/proc/proc-maps-race.c
+++ b/tools/testing/selftests/proc/proc-maps-race.c
@@ -528,13 +528,10 @@ static bool compare_smaps_rollup(FIXTURE_DATA(proc_maps_race) *self,
 		struct smaps_rollup_stats *actual)
 {
 	/*
-	 * Clean/dirty metrics might change but Pss-related ones
-	 * should stay constant.
+	 * Clean/dirty metrics might change. Pss depends on map count and might
+	 * change as well. Rss should stay constant.
 	 */
-	if (cmp_smaps_rollup_stat(expected, actual, Pss) &&
-	    cmp_smaps_rollup_stat(expected, actual, Pss_Anon) &&
-	    cmp_smaps_rollup_stat(expected, actual, Pss_File) &&
-	    cmp_smaps_rollup_stat(expected, actual, Pss_Shmem))
+	if (cmp_smaps_rollup_stat(expected, actual, Rss))
 		return true;
 
 	print_smaps_rollup_stats("Expected stats:", self, expected);
@@ -759,7 +756,7 @@ FIXTURE_SETUP(proc_maps_race)
 
 		for (i = 0; i < mod_info->vma_count; i++) {
 			mod_info->child_mapped_addr[i] = mmap(NULL, self->page_size * 3, prot,
-					MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+					MAP_PRIVATE | MAP_ANONYMOUS | MAP_POPULATE, -1, 0);
 			ASSERT_NE(mod_info->child_mapped_addr[i], MAP_FAILED);
 			/* change protection in adjacent maps to prevent merging */
 			prot ^= PROT_WRITE;

base-commit: 39274b454e9993cea319f4ac342a8082a9ee1730
-- 
2.56.0.307.g5fe7bd680c-goog

