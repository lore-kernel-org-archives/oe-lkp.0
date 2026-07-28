Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACF73A783F
	for <oe-lkp@lists.linux.dev>; Tue, 28 Jul 2026 05:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785216348; cv=none; b=QzZLIhass9JtEAYe8q22ETXs0pq9lcmcJ1GNUV3YxX+IwZdtc3UndG/mgDeDR9ZjLDBE0SNqdMRLLpSk/lfdLnN0qUbIFk1EP21AZzXuezS2kCYRWebnsQhkmJYshd4b8kuXuJ9Qfm7K2/2Wg4IBHnwI5gtTiBnV9n1hecKMOF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785216348; c=relaxed/simple;
	bh=zEfKElDmqeC3lqlwwNQaWgYZXm9HUEgqpQbdsNE+vX8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aNBxS0Jl2LpRG8foFHy8/UoaJp2lu7FW8Eta4TJ3Mntk9NEgUsqsj1Ad9oaD2iw8V3+k6GE432MueSUWAK05gjH0sWr8GtCsJKKHCq1wPSd0h0cvq39FA8Sa2UM2hb62KALhO4vLqFEZwkz2/zvPjqSNoPyijk1flXbbwnY9pVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c2obDMJP; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c2obDMJP"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5218927884fso36819161cf.3
        for <oe-lkp@lists.linux.dev>; Mon, 27 Jul 2026 22:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785216346; x=1785821146; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rBznR6Jhz6jAQdgNETeOJVk7gwSsazLfaU1tbs21Zf0=;
        b=c2obDMJP3n5KJXGjquK/IGIVqU3J5kStHWWaMph7vTSEZYw//jG8hvxVKhGORpIwpw
         CYuJZVNlyNNMeNUdmk/iZG9o+FK+bOk/6amUZxiq9pYOKrCEIbok135aBXprnIHFqjWj
         qT1lAS3bXPxJDYUmFPSeM6jJcPoKtCZDX3YKEmlaLXKnDSyVo6qBgSXHLrulag411/Xz
         c5E92WLnq9J0RFT4BRW+flIJGeJ8ivZZp4FuFInVn0IfhrrRVRen1OwFqWgl+9CrYhfq
         q1DBUx+0RvfiI7EzHI0adx7ruDcQhIgnClmP1Yxyi0jVILWCK5n8iKSO7PLZH4jelH1h
         KA3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785216346; x=1785821146;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rBznR6Jhz6jAQdgNETeOJVk7gwSsazLfaU1tbs21Zf0=;
        b=ddh/zmUDGlohThR7cn8+aCGit2pLGDIRRfjFcARIa1liHerVWpnqYROgbjW0mek+iw
         grtDXZfFY8hBlDi4Xw/RhztICyjtA2+idOpYrQuUQg/EviGZ4v5Hl5WskTsM7qXy/N2D
         q3b4ixtT7YaJPdumuqZcsBuP8sOfRezV31660LawEZgb3ZNN8zUhz4d2EA54ny+iijPC
         QQjArbc7bGz0kS5ROWKVVoMKJPEkNT4o7+p4El8qmdn7s3QJDN8XL1OqvWiVPAwpXYmU
         fWYwOSc3SoyrDxyuFedtj9e5JaoAdVSuSAMAdJT0PxcsYSwtDVAYudXLpxrsZuJpP/Xa
         2CSA==
X-Forwarded-Encrypted: i=1; AHgh+Rpq/ndwNYN4mJGbYvw8pPWD06CfSlmzCCvPsBz+Q0wniYZJUk7TEbvZX669V/AZV29zNPRFcBw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwpRZeU7jqW+vdJxQ4yyq4F620DU2pWxz8azPpwUftQQeOD7j2C
	hZ43XrQICpaEk7A5TFdmd8Cy1aMWJEVY7q13OEHJ1UjgE0rjAy25GNnI
X-Gm-Gg: AR+sD13rfjvlY3bZthhd4SmFNfOWcBKHYtvBXMKg5GebU5imPqEUFlh5tefY9n9dQdS
	RDx3jkwEx8EC6QM1Lefxr2umepK0NH7A2PcDMQvmqUYF1vM53EnahHQ9VsfAkwiERxUMgGUuJwD
	4nlETduzla+oImpPjNhuYQ2HpMmfhekH4K6viq2jgyIzMB1p4FcmRLJd4MsOlm4K0xGC+JA1zBw
	Q8aWtji4WFfnH7f1vngZhdOWEpUSqbYTL5X182ZPArs6QfgRsWo0a8r/CcNuwz2XDtVD0bK4801
	e0vFOv99ZjllGffe3hOmCASkSdUpSa3BjEvlNwcLMbt8Z+ul6GKjvyRep/zNDa+NUM9JF6A/8MK
	82MWpAFRCpR9RCxpHUtN/omcTYwLYs7yxbQaEpMpR8HqI5q34T3KRVqk4apT/evDUIGlIVfzfdg
	xWD1IrZsoq0tqbHza9il3fU3cCbLrXhkXGgmJeDAcmpxy2nQBX+rjmihL93bG/UoUleRgPkv5ET
	IgLhw==
X-Received: by 2002:a05:622a:1b0f:b0:517:6b57:8164 with SMTP id d75a77b69052e-529d70eabf0mr6863181cf.55.1785216346205;
        Mon, 27 Jul 2026 22:25:46 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529a298988fsm66434241cf.18.2026.07.27.22.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 22:25:45 -0700 (PDT)
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
Date: Tue, 28 Jul 2026 13:25:26 +0800
Message-Id: <20260728052526.3743086-1-zhangbo56@xiaomi.com>
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

I looked into the SVT-AV1 benchmark that triggered this regression and
found why unconditional _max_index causes the 870% major fault increase.

SVT-AV1 uses per-frame mmap on Linux to read its input video file.
From Source/App/EncApp/EbAppProcessCmd.c:

  void read_input_frames(EbConfig *config, ...) {
      if (config->mmap.enable) {
          int64_t offset = get_mmap_offset(config, read_size);
          input_ptr->luma = svt_mmap(&config->mmap, offset, luma_read_size);
          offset += luma_read_size;
          input_ptr->cb = svt_mmap(&config->mmap, offset, chroma_read_size);
          offset += chroma_read_size;
          input_ptr->cr = svt_mmap(&config->mmap, offset, chroma_read_size);
      }
      ...
      svt_av1_enc_send_picture(component_handle, header_ptr);
      if (config->mmap.enable)
          release_memory_mapped_file(config, is_16bit, header_ptr);  /* munmap */
  }

Where svt_mmap() is:

  void *svt_mmap(MemMapFile *h, int64_t offset, int64_t size) {
      uint8_t *base = mmap(NULL, size, PROT_READ, MAP_PRIVATE, h->fd, offset);
      return base + align;
  }

So for Bosphorus 4K (3840x2160 YUV420 8bit), each frame creates 3
separate mmap regions on the SAME file, the layout is:

  Frame N:   [luma 8MB][cb 2MB][cr 2MB]  (file offsets contiguous)
  Frame N+1: [luma 8MB][cb 2MB][cr 2MB]  (immediately follows)

In page counts (ra_pages=32 assumed):
  luma VMA:   ~2025 pages
  chroma VMA: ~506 pages each

These become 3 independent VMAs per frame, but all map contiguous
regions of the same file. The encoder accesses each sequentially,
then munmaps before processing the next frame.

Here is the problem with unconditional _max_index:

  1. Encoder accesses luma VMA sequentially, readahead ramps up.
     Last async readahead window: ra->start=1993, ra->size=32.

  2. Fault at page ~1993 hits PG_readahead, triggers async readahead:
       ra->start += ra->size;  Then ra->start = 2025

  3. In page_cache_ra_order():
       limit = min(file_end, _max_index); so limit = 2024
       while (index <= limit) ...  so 2025 > 2024, reads NOTHING

  4. Pages 2025+ (which are the cb plane data) are never prefetched.
     When encoder accesses the cb mmap, it takes a major fault.

  5. Same thing happens at cb->cr boundary, and at frame N->N+1.
     Result: 3 major faults per frame × 120 frames = hundreds of
     extra major faults, explaining the 870% increase.

Without _max_index (original kernel):
  At step 2, readahead proceeds past page 2025, prefetching the cb
  data into page cache. When the cb mmap is created and accessed,
  the pages are already cached, so minor fault happens only.

With my conditional patch:
  At step 2, vmf->pgoff=1993, vma_pages_left = 2025-1993 = 32.
  The condition "32 < 32" is false, so _max_index stays ULONG_MAX.
  Readahead proceeds normally, prefetching cb data.

  Only when vma_pages_left < ra_pages (for example, the last few pages
  of the VMA), we will set the limit, at that point the readahead window
  has already pushed useful data into the page cache.

For workloads that mmap sequential regions of the same file (SVT-AV1
frames, ELF segment loading, mprotect-split VMAs), the data beyond the
VMA boundary is useful and will be accessed soon via a different mapping.
Blocking readahead at the VMA boundary in these cases hurts performance.

The conditional check preserves the benefit of VMA-bounded readahead
(avoiding useless prefetch for small partial mappings) while allowing
cross-VMA prefetch when the access is clearly sequential and far from
the VMA end.

Thanks to Oliver for reporting this regression and providing the test
case details, looking into the actual SVT-AV1 code made the mechanism
much clearer.

Bo
