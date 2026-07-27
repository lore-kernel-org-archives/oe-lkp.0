Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EA73446C5
	for <oe-lkp@lists.linux.dev>; Mon, 27 Jul 2026 01:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785116798; cv=none; b=jXxogvSENTvZUTzr74lbDc7CjWFG8CG1W81aKk76XYytMt0ltpGCpOlVTakQK4VQiwvaoYRYDu/9vDLU/eI6VgY7bAG4PGbWz96w9PPHFOvJ06/XpS9QyQQVcePP+li97AKbbZkHr4YJuT6TfwTDgOO+92P+/6hq30RpYm9DQBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785116798; c=relaxed/simple;
	bh=68tClLzdVPZIEasab1eMC1jCXZNh27bAqRBQ3x0byzY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=moP7YhT+5QUMNdF68rJwHzhzt55MD5GlqzwCmZxGNUzLniQKR5XGD8Mjpx8WOY8uyW4Wo+rGE2mxQNZG9vanTFvJG+wg2mDgXIhhzuzxx6JLFP+8ura/EAoocU+4emAmqVmZF5/n9C4lTPfiH2ap4ghD3w8hv9HFQ2sxZnTOFYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M3b/p/zu; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M3b/p/zu"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-51c16ac21acso13959741cf.0
        for <oe-lkp@lists.linux.dev>; Sun, 26 Jul 2026 18:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785116796; x=1785721596; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lVCOJq1qiSToLbfY5dL7R4lpViAumORGhYxyWIEbqU0=;
        b=M3b/p/zucwOX0cmWhQbOR0PDgwj8793pjjbkorDOiUf/m4CVPS08i0rVs2LlU0vu+n
         c/G2NclddsAZ480BIGwGVGRHgIYm3QpJiJSUzu5kxcv84tCMeWgO58o32yzspta8NxQ4
         eSuXSqrtZL6+XgOBW6dammJHWkPxjdv2q1QgFBDq9hwlzpm/ahTmyEVxQmckIOXTQ0MI
         DhLiSHo82jvuWhVF8bMkTZPfwomz7S140M/3kf91U3mZJmjKGtJMai+35TirZILx5he0
         AFsipQE2hOQHz5IvHizTTMJe373Ytl6p2PJ3iGCcWDqB+q0pxUbnH6Louit950ZBda9q
         /Xow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785116796; x=1785721596;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lVCOJq1qiSToLbfY5dL7R4lpViAumORGhYxyWIEbqU0=;
        b=YObOlV4Zv7zhScwqLURjghJSwKCRPvX8LKFL600vja/nzHTQfOz9lqipbQ+nag140i
         LxVpwZGrV+rVtcqZUP0rdNxKkyYEOJdw1/eWpmaIU1dkPkixv8Ip+7nm7kpD2PBlueql
         k0SC0tODcfYbIiKIhScXflZNLi+jyRmjT8dwDDejkNpB5IDLvNuIgCWLtEi0j/GUVaoJ
         D8m1aZOevFG1nqxeV5Kq0CxKLii7V2Fo0/wDthiMmMEUId3Np/Zl5GjkUoI3dMMS00iH
         N9Wg47/ayXH4Lf2NrkhSn+Vf7iKAk0EBM3KpJI2ljzXCgOjJ3HMx7TIuBX5Qi354WyR/
         aVHw==
X-Forwarded-Encrypted: i=1; AHgh+Roket7cyjr35Lx9ipRchOwYyR8Dsh6ZOvWjkk/3C0YLyUCCjF7sXuyoKUCp4PsOjQAOy/fsNKk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2YP/aU4xbC8atCa0TKkhx47wVFn10u7B8Hhg/zcsYRsTipiEW
	uE7WRaQjAzSyzMRwjxL62RyOAtpypk6n6f2oI7RuR89OoWoc/L4V23na
X-Gm-Gg: AR+sD10HloeSR+XBn8RDJbGgRjMU8Onn4zMj9M6pY5Ppvly8rpINJ+xlnQKNNpMRwtv
	HL+bi7S8uL2XUI+Rf9ZMUKHScv1PyLdLPL/oQPn5KJDkhpK4+g8WJ15/Vpu72+wclnEKpZSorT/
	uK0lCBQIYjfOSzljfYn/9niq+EXdoY41Gi9HVPs4mDayGCSbXR4NoJRN1q/6XmBS1DSl3iAJmw8
	i+wY5vl+d8DbHHLpFyENGCO4+aFNZifEc42jmjpBIlf/F1Kh/wMN3271b9caXjrhg9C+POhFbiq
	IgWA8F5HLB1jWOCM/jzGECVYLHSK0tHZoOxqi5CjcbabJ2fRZOxHxa9ThLT+OVTv10mtSC5TI0F
	iIDLIGuFJ0vyHg8coVKVQucybU6XrvawvxmhW5n/ntS+yfi1zrybgWz5R9hmVZrWsNxbnbigWpt
	Un8H8S3TlATj1Y+6VARySbPnw2sLBwDw==
X-Received: by 2002:a05:622a:1387:b0:51c:1b78:b044 with SMTP id d75a77b69052e-529a8732f62mr73155551cf.61.1785116796193;
        Sun, 26 Jul 2026 18:46:36 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907e8694197sm53772036d6.24.2026.07.26.18.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 18:46:35 -0700 (PDT)
From: Bo Zhang <zhangbo0325@gmail.com>
X-Google-Original-From: Bo Zhang <zhangbo56@xiaomi.com>
To: fmayle@google.com
Cc: jack@suse.cz,
	akpm@linux-foundation.org,
	david@kernel.org,
	kaleshsingh@google.com,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	lkp@intel.com,
	oe-lkp@lists.linux.dev,
	oliver.sang@intel.com,
	surenb@google.com,
	willy@infradead.org,
	baohua@kernel.org,
	Bo Zhang <zhangbo56@xiaomi.com>
Subject: Re: [linux-next:master] [mm] 7b32f64bc5: pts.svt-av1.Preset13.Bosphorus4K.frames_per_second 45.8% regression
Date: Mon, 27 Jul 2026 09:46:10 +0800
Message-Id: <20260727014610.3479784-1-zhangbo56@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAHCxdc64d-6qNBwwSZX8mdz4-V+88No2x0wG4mex5WPXBDE9AA@mail.gmail.com>
References: <CAHCxdc64d-6qNBwwSZX8mdz4-V+88No2x0wG4mex5WPXBDE9AA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, Jul 23, 2026 at 01:34:38PM -0700, Frederick Mayle wrote:
> I maybe missing something subtle, but, I think you've changed it from "don't
> read beyond the VMA" to "if there is a chance we could read beyond the VMA,
> don't read beyond the VMA", which seems like a more complex expression of the
> same behavior.

Hi Frederick,

The subtlety is in how async readahead interacts with _max_index. The two
are not equivalent because async readahead sets ra->start to the end of
the previous readahead window, not to vmf->pgoff. So even though the user
is still faulting well inside the VMA, the readahead target (ra->start)
has already moved past the VMA end, however _max_index blocks it.

Here is the concrete scenario (ra_pages=128, VMA covers pages 0-1023):

  1. Fault at page 0 triggers sync readahead: reads pages 0-127,
     places PG_readahead marker at page ~96.

  2. Sequential faults continue. Fault at page 96 hits PG_readahead,
     triggers async readahead in do_async_mmap_readahead().

  3. page_cache_async_ra() detects sequential pattern (index == expected)
     and does:
       ra->start += ra->size;  /* pushes start to end of previous window */
     So ra->start = 128 (NOT vmf->pgoff=96), ra->size = 256 which is doubled

  4. page_cache_ra_order() calculates:
       limit = min(file_end, ractl->_max_index)

  With the unconditional approach:
     _max_index = 1023 (always set)
     limit = 1023, ra->start(128) < limit (It works fine here)

  But after several ramp-ups, when the window reaches the boundary:

  5. Fault at page ~896 hits PG_readahead, async readahead fires.
     page_cache_async_ra() does ra->start += ra->size:
       ra->start = 1024  (previous window ended at 1023)
       ra->size  = 128

  6. page_cache_ra_order():
       limit = min(file_end, 1023) = 1023
       ra->start(1024) > limit(1023) (Which will read NOTHING)

  Result: page 1024 (in VMA2) is never prefetched. When the process
  enters VMA2, it takes a major fault and readahead ramps up from scratch.

With my conditional approach:
  At step 5, vmf->pgoff=896, vma_pages_left = 1024-896 = 128
  128 < 128 (the condition is false), so _max_index stays ULONG_MAX
  ra->start(1024) < ULONG_MAX, and it will prefetch pages 1024-1151 normally.
  Page 1024 is already cached when VMA2 is entered, only minor fault happens.

The key point: when mprotect splits a large file mapping into adjacent
VMAs (common for ELF segments, or read-then-write patterns), there's no
benefit in preventing readahead from crossing the boundary, so the data is
still sequential in the file. The limit only helps when we're actually
near the end of useful data (within ra_pages of the VMA end).

I confirmed this with a test program that mmap's a 256MB file and uses
mprotect to split it into 4MB segments (simulating mprotect-split VMAs):

  #include <stdio.h>
  #include <stdlib.h>
  #include <fcntl.h>
  #include <sys/mman.h>
  #include <time.h>
  #include <unistd.h>

  #define FILE_SIZE (256UL * 1024 * 1024)
  #define SEGMENT_SIZE (4UL * 1024 * 1024)

  int main() {
      int fd = open("/tmp/testfile", O_RDONLY);
      char *addr = mmap(NULL, FILE_SIZE, PROT_READ, MAP_PRIVATE, fd, 0);

      /* Split into 4MB VMAs via alternating mprotect */
      for (size_t off = 0; off < FILE_SIZE; off += SEGMENT_SIZE * 2)
          if (off + SEGMENT_SIZE < FILE_SIZE)
              mprotect(addr + off + SEGMENT_SIZE, SEGMENT_SIZE,
                       PROT_READ | PROT_WRITE);

      /* Sequential read across all VMA boundaries */
      struct timespec start, end;
      volatile unsigned long sum = 0;
      clock_gettime(CLOCK_MONOTONIC, &start);
      for (size_t i = 0; i < FILE_SIZE; i += 4096)
          sum += addr[i];
      clock_gettime(CLOCK_MONOTONIC, &end);

      double ms = (end.tv_sec - start.tv_sec) * 1000.0 +
                  (end.tv_nsec - start.tv_nsec) / 1e6;
      printf("%.1f ms (%.1f MB/s)\n", ms, 256000.0 / ms);
      munmap(addr, FILE_SIZE);
      close(fd);
  }

Results on Qualcomm SM8850 mobile phone (ra_pages=128, UFS 4.0),
sequential read across 64 mprotect-split VMAs (256MB file, 4MB segments):

  Without VMA limit (baseline):                  ~158 ms, ~1620 MB/s
  With unconditional _max_index (7b32f64bc512):  ~180 ms, ~1420 MB/s
  With conditional _max_index (this fix):        ~158 ms, ~1620 MB/s

The unconditional approach shows ~13% throughput regression for this
workload due to readahead stalling at every 4MB VMA boundary. The
conditional approach has zero measurable regression while still limiting
readahead for the last ra_pages of each VMA (the original goal).

Does this clarify the difference? The conditional check is "don't limit 
when the async readahead mechanism would set ra->start beyond the VMA
boundary and get blocked, even though the actual fault is still well
within the VMA."

Thanks,
Bo
