Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793757295;
	b=dber9nSrwy16DFy3jm2Y20k0yWljPMVOzjJ5Gq5/8mUl7fqqOiEkvRT0xMBUQ4TYSbWC
	 N37EibGTes0gQMbNiYIJCk6zhSAQPy84fJrIRBRLP03dbo1+/58OByoHXFZJj506BwIdJ
	 tIojpzGtFsZ2n6xKyFqyX7HtnkFsuSwP+GAAHNWRER2V3vcBuQmszCl/thRPF4sOtP4/p
	 5IxplrMd2Fr3BtUjJzTmT3w97C5H+GO0rSY8teuqGC7Kd0kfL35IXUGUCA/2qin163Dqa
	 RRX0YT44f4D8O/22ia2ZWpX1ad9jTePGK+rBRprEv+uW8TUcXoDDKdjZOstCvWsey0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793757295;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=rD43JA4hYcckE/hU87aAzyjon8M9gUwibeoeNvvEI/I=;
	b=OZTza1xVV9grDeCn5+57JX+JUooA/Ke5eyTNVzOJIm6so7netrNvPLo4+HhRne6KcPBZ
	 kITM1RTPHQNP8uWpSlIqdkTQ4YIqDdwdJr7TdL7maosBA+0HF2zoW0Gb2hx1qLF87OiNm
	 JLOWMJykwX4tCMgvfDtXP5Awy4Jhv+3o+fzG1RkPOH5vflNKO4t3TtBOdx3hE7KyyIKqX
	 xqDsR9dbt01qywrv0IwGONKYlOWLR4EDEa5hRMVnMxQy5L7UjpfGl+mCvAOwWua2hsr02
	 VbSMYZ7gihtAB8TpAeLLSwIsKUOGbO3r09bol5x4MEx1/NxZVXBf6Z96aLA0PnLFdXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--surenb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DTGMnw1q;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D7E606A329
	for <oe-lkp@lists.linux.dev>; Wed,  4 Nov 2026 01:54:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29D7E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DTGMnw1q
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35cbea41088so231884eec.1
        for <oe-lkp@lists.linux.dev>; Tue, 03 Nov 2026 17:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793757294; x=1794362094; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rD43JA4hYcckE/hU87aAzyjon8M9gUwibeoeNvvEI/I=;
        b=DTGMnw1qNwu8Evq1rtb1Kf3oc3vljBprncumxaEn9uoSqJ8Rl8dr3N+6dyvbIUAcb6
         bc8VdjeKw+joX9k/AotJ6z8g5X81VdOfV2oM1fIMSCWCs/x8ICxEDZHsZqH/UlfnSb8U
         1WlMiX39shWJ9/YlPy+6jU7GJNxX2KxwXt8lbAGk1cMnk6fONOpZcsdqp5uCZs0fR4VW
         AfxbRdnjbHkJ0QCorG0UEtA0FZUVVtk/jV1TRP2fDXnZx9A7wtmGhiZvoREwfb+bb53P
         KZQAogEAMNXq5xRdcA9pT/mDrNUnOYmQdbMtu6PFq74ngd9V7XVl657sJ5pM1/iyaJfd
         VY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793757294; x=1794362094;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rD43JA4hYcckE/hU87aAzyjon8M9gUwibeoeNvvEI/I=;
        b=LnckrrZFPSYYrf2s5j9QfOpr5terFJwYnw4zjYXKtlpvNO0PhBdms3Prf//fSGmF3d
         1C+Qi5iqRQ5hh6aboxopHP3blJmXdR4UKn8bnZ9+8q+RmF9FiIGq3CW2MMgEOyEkAiPE
         0OGEsA1z2nCBNy6bdpVUc1l8X6gJbknG9p8Udwxdh+9Qiw0YNd12ZgxGZXKSBrAGu5hm
         Vy0fW2BHqbFxcuqMyFVEOaBaXVND8HVOfX72xfHpQEqwBSY8qRiGrm7wdV4/PiC3Um1k
         NqG1widZrSoDHjuX2aGcjRsR2zofV6aG1WuB3DuJt2dzruCAL/4dlC1nT/uufU/w8c7C
         nX2A==
X-Forwarded-Encrypted: i=1; AKwUvBwq6f1gKvpZMZ/9B1+vNz5JNV0Q0VLhyqEwoV0h90mgXHczNGtmYgyXaLMUMhVv6hz9l+3d6Ws=@lists.linux.dev
X-Gm-Message-State: APuU4Z+0+B+Dy/f89dPauz14FVL515aWCMML1IYlxHjYHn6wO+JotWMF
	bAn/G7ZQWQlC/wM4eP17u+GyuWv/gIwhrucFFptrod5ipmhEzARUFrSixNqVh0YevQpoUB18khl
	vRg2Aug==
X-Received: from dldyr19-n2.prod.google.com ([2002:a05:701b:4513:20b0:1b2:490b:6fe9])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2702:b0:144:fd7c:84fe
 with SMTP id a92af1059eb24-1ac5e8dea79mr19606416c88.35.1793757293450; Tue, 03
 Nov 2026 17:54:53 -0800 (PST)
Date: Tue,  3 Nov 2026 17:54:46 -0800
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Post: <mailto:oe-lkp@lists.linux.dev>
List-Help: <mailto:oe-lkp+help@lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-lkp+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261104015447.363602-1-surenb@google.com>
Subject: [PATCH v3 1/1] selftests/proc: use RSS in /proc/pid/smaps_rollup
 tearing tests
From: Suren Baghdasaryan <surenb@google.com>
To: david@kernel.org
Cc: akpm@linux-foundation.org, ljs@kernel.org, jannh@google.com, 
	liam@infradead.org, willy@infradead.org, paulmck@kernel.org, pfalcato@suse.de, 
	usama.arif@linux.dev, vbabka@kernel.org, linux-fsdevel@vger.kernel.org, 
	yi1.lai@intel.com, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>
Content-Type: text/plain; charset="UTF-8"

Pss metrics can be affected by map count even if VMA tree stays unchanged,
therefore tests checking VMA tree integrity can't use them. Use Rss instead
and pre-populate the VMAs so that Rss changes if a VMA gets skipped or
double-counted.

To ensure all test VMAs are populated with anonymous pages, remain
mergeable across VMA operations, and do not have their Rss changed by
memory reclaim:

- Map and populate VMAs as writable so that MAP_POPULATE faults in
  anonymous pages rather than the shared zero page, which is not
  accounted in Rss. After mapping, toggle PROT_WRITE using mprotect()
  to make odd mappings read-only and prevent adjacent VMAs from merging.
  This is preferable to toggling PROT_EXEC as it keeps adjacent VMAs
  distinct regardless of READ_IMPLIES_EXEC. Supporting READ_IMPLIES_EXEC
  is important since it is set by default on pre-ARMv6 CPUs.

- Use mprotect() instead of mmap(..., MAP_FIXED) in split_vma() and
  merge_vma() so the first page of the split VMA stays resident.
  mprotect(..., PROT_NONE) splits the VMA without unmapping the first
  page (pte_present() remains true for PAGE_NONE PTEs), and
  mprotect(..., self->mod_info->prot) merges it back. Both parts of the
  split VMA retain their non-zero Rss.

- Lock all present pages in the child so memory pressure cannot reclaim
  pages and alter Rss during the test.

Exclude smaps_rollup checks from test_maps_tearing_from_remap since
mremap(..., MREMAP_DONTUNMAP) moves the last page of the VMA at
next_addr, changing Rss.

Introduce a vma_setup test stage, used by test_maps_tearing_from_remap
to munlock() next_addr once before remapping, so that
mremap(..., MREMAP_DONTUNMAP) does not split the VMA at next_addr.
Use mmap(..., MAP_FIXED) in patch_vma() to restore the whole three-page
destination after remapping, rather than replacing only its middle page
and relying on the remaining anonymous VMAs to merge.

Handle mlockall() failure and skip the tests in case locking violates
locked memory allowance.

Fixes: ca5480fb53fa ("selftests/proc: add /proc/pid/smaps_rollup tearing tests")
Reported-by: kernel test robot <yi1.lai@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202610271934.fd287c3f-lkp@intel.com
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
Changes from v2 [1]:
- changed the way we populate VMAs to ensure the test works with
  READ_IMPLIES_EXEC personality, per Andrew Morton
- handle possiblity of mlockall() failing, per Andrew Morton
- changed patch_vma() to restore the entire three-page destination VMA,
  per Andrew Morton
- added vma_setup test stage to munlock() next_addr VMA only once

[1] https://lore.kernel.org/all/20261101154503.3203036-1-surenb@google.com/

 tools/testing/selftests/proc/proc-maps-race.c | 86 +++++++++++++------
 1 file changed, 58 insertions(+), 28 deletions(-)

diff --git a/tools/testing/selftests/proc/proc-maps-race.c b/tools/testing/selftests/proc/proc-maps-race.c
index bf4c5073f6fc..ed048b0ff418 100644
--- a/tools/testing/selftests/proc/proc-maps-race.c
+++ b/tools/testing/selftests/proc/proc-maps-race.c
@@ -174,10 +174,12 @@ typedef bool (*vma_mod_result_check_op)(struct line_content *mod_last_line,
 					struct line_content *restored_first_line);
 
 struct vma_modifier_info {
+	int mlock_error;
 	int vma_count;
 	void *addr;
 	int prot;
 	void *next_addr;
+	vma_modifier_op vma_setup;
 	vma_modifier_op vma_modify;
 	vma_modifier_op vma_restore;
 	vma_mod_result_check_op vma_mod_check;
@@ -528,13 +530,10 @@ static bool compare_smaps_rollup(FIXTURE_DATA(proc_maps_race) *self,
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
@@ -637,14 +636,13 @@ static bool query_addr_at(int maps_fd, void *addr,
 static inline bool split_vma(FIXTURE_DATA(proc_maps_race) *self)
 {
 	/* PROT_NONE differs from both readable neighbors. */
-	return mmap(self->mod_info->addr, self->page_size, PROT_NONE,
-		    MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED, -1, 0) != MAP_FAILED;
+	return mprotect(self->mod_info->addr, self->page_size, PROT_NONE) == 0;
 }
 
 static inline bool merge_vma(FIXTURE_DATA(proc_maps_race) *self)
 {
-	return mmap(self->mod_info->addr, self->page_size, self->mod_info->prot,
-		    MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED, -1, 0) != MAP_FAILED;
+	return mprotect(self->mod_info->addr, self->page_size,
+			self->mod_info->prot) == 0;
 }
 
 static inline bool check_split_result(struct line_content *mod_last_line,
@@ -679,6 +677,12 @@ static inline bool check_shrink_result(struct line_content *mod_last_line,
 	       strcmp(mod_first_line->text, restored_first_line->text) == 0;
 }
 
+static inline bool setup_remap_vma(FIXTURE_DATA(proc_maps_race) *self)
+{
+	/* Unlock next_addr so MREMAP_DONTUNMAP does not split it. */
+	return munlock(self->mod_info->next_addr, self->page_size * 3) == 0;
+}
+
 static inline bool remap_vma(FIXTURE_DATA(proc_maps_race) *self)
 {
 	/*
@@ -694,8 +698,10 @@ static inline bool remap_vma(FIXTURE_DATA(proc_maps_race) *self)
 
 static inline bool patch_vma(FIXTURE_DATA(proc_maps_race) *self)
 {
-	return mprotect(self->mod_info->addr + self->page_size, self->page_size,
-			self->mod_info->prot) == 0;
+	/* Replace all three pieces without relying on anon_vma merging. */
+	return mmap(self->mod_info->addr, self->page_size * 3,
+		    self->mod_info->prot,
+		    MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED, -1, 0) != MAP_FAILED;
 }
 
 static inline bool check_remap_result(struct line_content *mod_last_line,
@@ -754,15 +760,30 @@ FIXTURE_SETUP(proc_maps_race)
 	self->pid = fork();
 	if (!self->pid) {
 		/* Child process modifying the address space */
-		int prot = PROT_READ | PROT_WRITE;
 		int i;
 
 		for (i = 0; i < mod_info->vma_count; i++) {
-			mod_info->child_mapped_addr[i] = mmap(NULL, self->page_size * 3, prot,
-					MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+			mod_info->child_mapped_addr[i] = mmap(NULL, self->page_size * 3,
+					PROT_READ | PROT_WRITE,
+					MAP_PRIVATE | MAP_ANONYMOUS | MAP_POPULATE, -1, 0);
 			ASSERT_NE(mod_info->child_mapped_addr[i], MAP_FAILED);
-			/* change protection in adjacent maps to prevent merging */
-			prot ^= PROT_WRITE;
+			/*
+			 * Populate writable to get anonymous pages, then alternate
+			 * write permission even with READ_IMPLIES_EXEC enabled.
+			 */
+			if (i % 2)
+				ASSERT_EQ(mprotect(mod_info->child_mapped_addr[i],
+						   self->page_size * 3, PROT_READ), 0);
+		}
+		/*
+		 * Lock all present pages in memory so memory reclaim cannot
+		 * change RSS during the test, and use MCL_ONFAULT so
+		 * mremap() expansion does not populate new pages.
+		 */
+		if (mlockall(MCL_CURRENT | MCL_FUTURE | MCL_ONFAULT)) {
+			mod_info->mlock_error = errno;
+			signal_state(mod_info, CHILD_READY);
+			_exit(0);
 		}
 		signal_state(mod_info, CHILD_READY);
 		wait_for_state(mod_info, PARENT_READY);
@@ -772,6 +793,8 @@ FIXTURE_SETUP(proc_maps_race)
 			if (mod_info->exit)
 				break;
 
+			if (mod_info->vma_setup)
+				ASSERT_TRUE(mod_info->vma_setup(self));
 			ASSERT_TRUE(mod_info->vma_modify(self));
 			signal_state(mod_info, SETUP_MAPS_MODIFIED);
 			wait_for_state(mod_info, SETUP_RESTORE_MAPS);
@@ -790,6 +813,21 @@ FIXTURE_SETUP(proc_maps_race)
 		exit(0);
 	}
 
+	/* Check setup before opening proc files: the child may have exited. */
+	wait_for_state(mod_info, CHILD_READY);
+	if (mod_info->mlock_error) {
+		int error = mod_info->mlock_error;
+		int status;
+
+		ASSERT_EQ(waitpid(self->pid, &status, 0), self->pid);
+		pthread_cond_destroy(&mod_info->sync_cond);
+		pthread_mutex_destroy(&mod_info->sync_lock);
+		munmap(mod_info, self->shared_mem_size);
+		if (error == ENOMEM || error == EPERM || error == EAGAIN)
+			SKIP(return, "Cannot lock test mappings: %s", strerror(error));
+		ASSERT_EQ(error, 0);
+	}
+
 	switch (self->maps_file) {
 	case MAPS:
 		sprintf(fname, "/proc/%d/maps", self->pid);
@@ -806,9 +844,6 @@ FIXTURE_SETUP(proc_maps_race)
 	self->maps_fd = open(fname, O_RDONLY);
 	ASSERT_NE(self->maps_fd, -1);
 
-	/* Wait for the child to map the VMAs */
-	wait_for_state(mod_info, CHILD_READY);
-
 	/* Read first two pages */
 	self->page1.data = malloc(self->page_size);
 	ASSERT_NE(self->page1.data, NULL);
@@ -882,6 +917,7 @@ TEST_F(proc_maps_race, test_maps_tearing_from_split)
 	/* re-read the file to avoid using stale data from previous test */
 	ASSERT_TRUE(read_boundary_lines(self, &self->last_line, &self->first_line));
 
+	mod_info->vma_setup = NULL;
 	mod_info->vma_modify = split_vma;
 	mod_info->vma_restore = merge_vma;
 	mod_info->vma_mod_check = check_split_result;
@@ -984,6 +1020,7 @@ TEST_F(proc_maps_race, test_maps_tearing_from_resize)
 	/* re-read the file to avoid using stale data from previous test */
 	ASSERT_TRUE(read_boundary_lines(self, &self->last_line, &self->first_line));
 
+	mod_info->vma_setup = NULL;
 	mod_info->vma_modify = shrink_vma;
 	mod_info->vma_restore = expand_vma;
 	mod_info->vma_mod_check = check_shrink_result;
@@ -1066,13 +1103,13 @@ TEST_F(proc_maps_race, test_maps_tearing_from_remap)
 	struct line_content remapped_first_line;
 	struct line_content restored_last_line;
 	struct line_content restored_first_line;
-	struct smaps_rollup_stats orig_stats;
 
 	wait_for_state(mod_info, SETUP_READY);
 
 	/* re-read the file to avoid using stale data from previous test */
 	ASSERT_TRUE(read_boundary_lines(self, &self->last_line, &self->first_line));
 
+	mod_info->vma_setup = setup_remap_vma;
 	mod_info->vma_modify = remap_vma;
 	mod_info->vma_restore = patch_vma;
 	mod_info->vma_mod_check = check_remap_result;
@@ -1080,8 +1117,6 @@ TEST_F(proc_maps_race, test_maps_tearing_from_remap)
 	report_test_start("Tearing from remap", self->verbose);
 	ASSERT_TRUE(capture_mod_pattern(self, &remapped_last_line, &remapped_first_line,
 					&restored_last_line, &restored_first_line));
-	if (self->maps_file == SMAPS)
-		ASSERT_TRUE(parse_smaps_rollup(self, &orig_stats));
 
 	/* Now start concurrent modifications for self->duration_sec */
 	signal_state(mod_info, TEST_READY);
@@ -1134,11 +1169,6 @@ TEST_F(proc_maps_race, test_maps_tearing_from_remap)
 				     vma_end - vma_start == self->page_size * 3) ||
 				    (vma_start == self->last_line.start_addr + self->page_size &&
 				     vma_end - vma_start == self->page_size));
-		} else {
-			struct smaps_rollup_stats stats;
-
-			ASSERT_TRUE(parse_smaps_rollup(self, &stats));
-			ASSERT_TRUE(compare_smaps_rollup(self, &orig_stats, &stats));
 		}
 		clock_gettime(CLOCK_MONOTONIC_COARSE, &end_ts);
 		end_test_iteration(&end_ts, self->verbose);

base-commit: 0ea6dc8c4a2192227ec25768625686b8fcd5cb09
-- 
2.56.0.385.gac671c819a-goog

