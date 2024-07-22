Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9611216F82E;
	Mon, 22 Jul 2024 18:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721671405; cv=none; b=ODSk33A7JLh9ED+aZr0yPW0G/JgwmLS3KkoLC81iUKS/k/7x35JFXg8vHgrCYkzhHP8QLQPL2ArogaxfJSG9TiFi5+IhF+TYGoSkZIfNRYMpEB4DSgVj14ZJ7XN9+I+ztdfqE/m5ZCjG6L+K01lIQEOGDOcR8e55wMmIhEEoRO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721671405; c=relaxed/simple;
	bh=qUb3DOnLjgMbqSEnz+xXy0T7tDP22JPLfd7jyRPdUNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WhRu2tOKzmMMNTgk5v9yjU8hl8TJZ6N97ilBHKPE9f8pT7GFXtGZOuAudfMYE759JsPEn0xsoniHuW9COEOSBzq2MUbbo6bLLQRideIMXcJTlDLfcsjmS5WPo9+hr0M+FxrSVpydhNPqiGRI5JAKzjtuRB5djUGpRztAVZe5e5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ActPy6Bt; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ActPy6Bt"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-79f190d8ebfso310338585a.3;
        Mon, 22 Jul 2024 11:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721671402; x=1722276202; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Ftgu8SNLkpVNUG84750DkvC5uADEAzoZ1JgtAWqSUA=;
        b=ActPy6BtcKEsyELh23wbQkeQKlIVOTtldn/X2bh7EyhltRzieYCn/qSi0G3eG65wLD
         s4S+WdA5gy9puRCGNNvxkVo+d0OqnUNXalLh59EzGBweTbhlvKCLDwRV+aXBtbKqUDDD
         xDfjqrSpJijvtGbycMYmI5psujlqPSSB1nNcyvK2pkrlYiH3B3N6ots4U8v3IBLnbg/U
         JG1nf1ENaNssBeL90DpY7OLf/BOOonc/0DPP/TOcswM4+xK8Y2wcWFyKq8V3EY7rxcub
         Vr2r6WxLqLLzPFOwGuFza5QjY0JDhMrBYU82QsZZlQe7xuSGyaH1lpnpfa7d6sexZC6+
         C0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721671402; x=1722276202;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Ftgu8SNLkpVNUG84750DkvC5uADEAzoZ1JgtAWqSUA=;
        b=stSnc8b5pxPaYrQqpV+nKxvm6lKNePHpwPdTegrYUTRLKGiTZSJJqyPUU/0WiWtSHV
         yWT7P8QWRg8N84ryA9W9WJnA3HvOD3U+NmfQKe2TelipPGgmczVSFwZPjJhbRLxZ7j6N
         9g4YQnSO1lViJ6EWV4b+aYvJR2ceCKAXJ0DSZMZO6ObKXKUe8lvOr95PNoRfpgU5xMVU
         pQ33m4jhEe6Es7h9+TMrbZZEJhP8OM93XgzqiyloJgdsSh80uFmb1Rauv6S9dbNNnd/0
         ezJcllEexnxdjcamsDS6/teGv+Dn9zkdkSs4qGVPDqYdjbJBdKaTEyqR6joe7SmG9J8g
         Ac4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXIjwUvTvnOe7F82JfQAyMD+L4DrPUvR1i3kSQDqqP+ee+UdrI/BWT45euTYXh5Tmo/Tf9p3BVFhYzdmGaoqx8le+Yo3sqAYNzCXJW+FYDJrgSrwwYv63y31TxgBg==
X-Gm-Message-State: AOJu0YzlQNz6MYCakcKIaGP4qIQ7njaKt1kPuhpP6mO24WNvDHh/VRTP
	Cvo+oX3BcOB1hukebPSyeHAfpjGbaJaFWjRUt2fyuRExTtXX9s3e
X-Google-Smtp-Source: AGHT+IEvR5vz3iMOJL6CHHVTEO59XBqteVoFFbdVHCISLz7Mv+5XsNQ72J/iis6vR4FrCJpuD3qCzQ==
X-Received: by 2002:ad4:5c6c:0:b0:6b5:7e0b:eafb with SMTP id 6a1803df08f44-6b958e86ddamr113580546d6.24.1721671402425;
        Mon, 22 Jul 2024 11:03:22 -0700 (PDT)
Received: from fauth2-smtp.messagingengine.com (fauth2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b7ac7d9a2dsm37850506d6.30.2024.07.22.11.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 11:03:21 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfauth.nyi.internal (Postfix) with ESMTP id 2E7D41200043;
	Mon, 22 Jul 2024 14:03:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 22 Jul 2024 14:03:20 -0400
X-ME-Sender: <xms:6J6eZpVnEzxC-SnN4jU0IBS_r3VBjikKLghTZxgqPCcRVv_HWe0CkA>
    <xme:6J6eZpkUpf79N-ZOLf3Y2moakHoKyYnUrenvodR1iYzIWPQu0UAQdlQcQ3ycs3fOF
    RNBMxBPZoajtmOL_Q>
X-ME-Received: <xmr:6J6eZlaTN181uxhmTKXggFyAf9FSvRU4WJdWcpxJ8Q3WH3NJNfhv1nXIqdeU2Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrheejgdduvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhu
    nhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrg
    htthgvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueeviedu
    ffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    gsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdei
    gedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfih
    igmhgvrdhnrghmvg
X-ME-Proxy: <xmx:6J6eZsVrNCUq33luk9DFzcNNAg5uTx57jUafs7II0Opikn28P1bg0w>
    <xmx:6J6eZjmlBFyQEzGOfjj9LF1mBEwmiEg3rrbealVSMIXzMGyhZV2_aw>
    <xmx:6J6eZpcr3plBNf5zW8fPDGfbu6rKJwbLXJa_WxToi96Kk2AoYtXm5g>
    <xmx:6J6eZtHKk7JaVAJL4H1K_2n0QNzBLDUXN6WPCCk8AdvK5P9BAsgJnQ>
    <xmx:6J6eZtntgRBOCJ4spxmiB-CLhCdNUgDuuJ5jKbueCxcnCnRtP4V5vfFJ>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Jul 2024 14:03:19 -0400 (EDT)
Date: Mon, 22 Jul 2024 11:03:00 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Tejun Heo <tj@kernel.org>
Cc: kernel test robot <oliver.sang@intel.com>,
	Suren Baghdasaryan <surenb@google.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Kees Cook <keescook@chromium.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Benno Lossin <benno.lossin@proton.me>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Christoph Lameter <cl@linux.com>, Dennis Zhou <dennis@kernel.org>,
	Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Wedson Almeida Filho <wedsonaf@gmail.com>, linux-mm@kvack.org,
	lkmm@lists.linux.dev
Subject: Re: [linus:master] [mm]  24e44cc22a:
 BUG:KCSAN:data-race_in_pcpu_alloc_noprof/pcpu_block_update_hint_alloc
Message-ID: <Zp6e1PWZbz4pkh9Z@boqun-archlinux>
References: <202407191651.f24e499d-oliver.sang@intel.com>
 <Zp6bMoDnUMxNrKos@boqun-archlinux>
 <Zp6cVgXJlzF4VOwl@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zp6cVgXJlzF4VOwl@slm.duckdns.org>

On Mon, Jul 22, 2024 at 07:52:22AM -1000, Tejun Heo wrote:
> On Mon, Jul 22, 2024 at 10:47:30AM -0700, Boqun Feng wrote:
> > This looks like a data race because we read pcpu_nr_empty_pop_pages out
> > of the lock for a best effort checking, @Tejun, maybe you could confirm
> > on this?
> 
> That does sound plausible.
> 
> > -       if (pcpu_nr_empty_pop_pages < PCPU_EMPTY_POP_PAGES_LOW)
> > +       /*
> > +        * Checks pcpu_nr_empty_pop_pages out of the pcpu_lock, data races may
> > +        * occur but this is just a best-effort checking, everything is synced
> > +        * in pcpu_balance_work.
> > +        */
> > +       if (data_race(pcpu_nr_empty_pop_pages) < PCPU_EMPTY_POP_PAGES_LOW)
> >                 pcpu_schedule_balance_work();
> 
> Would it be better to use READ/WRITE_ONCE() for the variable?
> 

For READ/WRITE_ONCE(), we will need to replace all write accesses and
all out-of-lock read accesses to pcpu_nr_empty_pop_pages, like below.
It's better in the sense that it doesn't rely on compiler behaviors on
data races, not sure about the performance impact though.

Regards,
Boqun

----->8
diff --git a/mm/percpu.c b/mm/percpu.c
index 20d91af8c033..729e8188238b 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -570,7 +570,8 @@ static void pcpu_isolate_chunk(struct pcpu_chunk *chunk)
 
 	if (!chunk->isolated) {
 		chunk->isolated = true;
-		pcpu_nr_empty_pop_pages -= chunk->nr_empty_pop_pages;
+		WRITE_ONCE(pcpu_nr_empty_pop_pages,
+			   pcpu_nr_empty_pop_pages - chunk->nr_empty_pop_pages);
 	}
 	list_move(&chunk->list, &pcpu_chunk_lists[pcpu_to_depopulate_slot]);
 }
@@ -581,7 +582,8 @@ static void pcpu_reintegrate_chunk(struct pcpu_chunk *chunk)
 
 	if (chunk->isolated) {
 		chunk->isolated = false;
-		pcpu_nr_empty_pop_pages += chunk->nr_empty_pop_pages;
+		WRITE_ONCE(pcpu_nr_empty_pop_pages,
+			   pcpu_nr_empty_pop_pages + chunk->nr_empty_pop_pages);
 		pcpu_chunk_relocate(chunk, -1);
 	}
 }
@@ -599,7 +601,8 @@ static inline void pcpu_update_empty_pages(struct pcpu_chunk *chunk, int nr)
 {
 	chunk->nr_empty_pop_pages += nr;
 	if (chunk != pcpu_reserved_chunk && !chunk->isolated)
-		pcpu_nr_empty_pop_pages += nr;
+		WRITE_ONCE(pcpu_nr_empty_pop_pages,
+			   pcpu_nr_empty_pop_pages + nr);
 }
 
 /*
@@ -1891,7 +1894,7 @@ void __percpu *pcpu_alloc_noprof(size_t size, size_t align, bool reserved,
 		mutex_unlock(&pcpu_alloc_mutex);
 	}
 
-	if (pcpu_nr_empty_pop_pages < PCPU_EMPTY_POP_PAGES_LOW)
+	if (READ_ONCE(pcpu_nr_empty_pop_pages) < PCPU_EMPTY_POP_PAGES_LOW)
 		pcpu_schedule_balance_work();
 
 	/* clear the areas and return address relative to base address */
@@ -2754,7 +2757,7 @@ void __init pcpu_setup_first_chunk(const struct pcpu_alloc_info *ai,
 	tmp_addr = (unsigned long)base_addr + static_size + ai->reserved_size;
 	pcpu_first_chunk = pcpu_alloc_first_chunk(tmp_addr, dyn_size);
 
-	pcpu_nr_empty_pop_pages = pcpu_first_chunk->nr_empty_pop_pages;
+	WRITE_ONCE(pcpu_nr_empty_pop_pages, pcpu_first_chunk->nr_empty_pop_pages);
 	pcpu_chunk_relocate(pcpu_first_chunk, -1);
 
 	/* include all regions of the first chunk */

