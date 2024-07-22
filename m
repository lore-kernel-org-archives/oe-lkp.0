Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B23328DB;
	Mon, 22 Jul 2024 20:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721681657; cv=none; b=vCb7KgodGclEJz1Rp7XrmvpKcWcJ2H8qBtPJrPOpLi9F4Ci/z6nrHc9+RqGBqhHti0bDp/ayLDyaEj2nnadFbC2uS6AzfJnmuPi3rzbWwqy2IYOrkuk3Y3hHxdyUphRaop1ZHQjyFnPUkoGn7EeqHFDyeexBKL6O+X5QCo5iOs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721681657; c=relaxed/simple;
	bh=Nmg7tipjeMlBLpHRnUsaCDod3yA5set2b/Z/YjE2uUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d98T/XX7KccSUxWA1LSvvi29Q+mgsElvODMoKGJLkZ9rqZIMaeGVSLmj3u670dxzGHDnbaeX39OgODCed2pZq8a5ynXIZnYuJCzl6/NS6LlPTbe95CIZ9RpYzUv9ddSQjZoblGZbEqV4mREY8GHbOHhp4wz1006z9KpbDI5Bf+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FiWXbAFi; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FiWXbAFi"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7a05b4fa525so305701585a.1;
        Mon, 22 Jul 2024 13:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721681654; x=1722286454; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q6TvImu7lxiWaBHweYLVQLFGqyazvpOghutfGgukQ2U=;
        b=FiWXbAFiP1HDnDtmM9df07hUt27gEeG6h2PZdpXujgmAWOEoaNeIXGhpa/BDbBTvsu
         c3gQacjKS9IvcMrrcdRNDagfrS+q35Ea3btltmt9zGjJen3hntCGmdXRvipsfkpIqpCm
         UcpQq9C8Pynd8m4jjFrPDUl7Sizw1ClA9F43CeJhCST1KSxERVUGXjDW5hnKBigABM3r
         Qo6ikRp74TBlIkSKIbjBhxbJnIF0WeJtfe/npHSCW2bYFScz3GoDr4iekgpJufRJpgSf
         Oz9Z8ezUacJqY++tADp1/Bz5K9ia+chOhjWEBSA3m5BgDhWnxECjEXxtSsDJcLh7Mc8+
         484w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721681654; x=1722286454;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q6TvImu7lxiWaBHweYLVQLFGqyazvpOghutfGgukQ2U=;
        b=dXgX+jQtrAmGEjsJ9jqBTXBSJCCttV1wo+5/BHkQrJV0uJNjknfc8jziNRH/Cgoofy
         xbWjQYLt/kEsNHMcPW0ALap/5dJu38oeR+R5tKk9PVBu8s5zo1SyIlXG4SzvvtUQ25N7
         1ykj77P/XqvNal1lj49/6gFl8AlzU+P5hljLPWkcjEZwOkFCt6uFCb9omilOO/L7VRPY
         k6c6+1n/F8bMzHGwZMLj67c+QHRAbtOmRsGgeHqdIkOdpBSdHeI9bVGJYublkfGd29Ro
         Vxqjpc6NrwRrRCRBGyiQh8gw+yLUKD0+eN7zVTMZxD3Fp5n0239fDhug4jSzG6ZUZGCA
         fkaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVT0l5jrb0nhLQcE0DPFuMtx363A/64s8cfMt3Wwq3UqYifYzytVF6GSInwoAqD4HH7iSN4Tf3GAD/jEOClnnj2+JxROJsbZSpk/jlekr3njo9+/mypFBDe2N2hbA==
X-Gm-Message-State: AOJu0Yx2mCZONGuPpo/GRpKSodk+AKzG55MziimuUhiOdZbGqxDSVnNs
	8DA9N9lBs5sgBb6cYrs9Fh6XqnEqCutdDUcwIQ/zBEyttExLAHiJ
X-Google-Smtp-Source: AGHT+IG8mTdIdLQoFIkii7HnHE3YfignHoBS5qpYfDrVTqbFjX9tSgTcfCzDyWhCt6oeodE+3Og+6w==
X-Received: by 2002:a05:620a:290b:b0:79f:17f4:7154 with SMTP id af79cd13be357-7a1c2eb92cbmr16040785a.3.1721681654300;
        Mon, 22 Jul 2024 13:54:14 -0700 (PDT)
Received: from fauth1-smtp.messagingengine.com (fauth1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a198fba3cfsm402155285a.33.2024.07.22.13.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 13:54:13 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfauth.nyi.internal (Postfix) with ESMTP id A744E1200066;
	Mon, 22 Jul 2024 16:54:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 22 Jul 2024 16:54:11 -0400
X-ME-Sender: <xms:88aeZiqK74G7AS0aTwxDU1U26s44ojXELHpKQ7MIT2t2ROcsR6KF3Q>
    <xme:88aeZgqszZuyWb2T7CsK-CeL2ClLpbhvsmdkPI1LJwgXV6O2qcCM2-j778pBW1J5I
    hcQpXDm44A1SiW_SQ>
X-ME-Received: <xmr:88aeZnOUu1veQiasTqp_BpRXaKf6Lz4L7rLWLFwC4LokKeAR8GMVDVgLWqniEg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrheejgdduheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhu
    nhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrg
    htthgvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueeviedu
    ffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    gsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdei
    gedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfih
    igmhgvrdhnrghmvg
X-ME-Proxy: <xmx:88aeZh7zJG9cNFoh3X5T_Lkkq0zO0X9QVXWAlvWZMz9jCwHIlesEnw>
    <xmx:88aeZh48FOU_QvX3499nkaWwbHiOAaEaFzkWkFq_zLe0hzbDt-a6JQ>
    <xmx:88aeZhgpL6hqh6P_GESimjxVXkYQmLA3qDanh0dECrq3uvqesphZKQ>
    <xmx:88aeZr6gvR9rUP3J6wxFI82ZTNL4aKmtXGywkQXCRUa86kaj4zLRIw>
    <xmx:88aeZsLxAN5Tg2QYEvBzKs_Cg6U_jwiJP1n8Yre6cczV9tBy1Oe8HIIr>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Jul 2024 16:54:11 -0400 (EDT)
Date: Mon, 22 Jul 2024 13:53:52 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Dennis Zhou <dennis@kernel.org>
Cc: Tejun Heo <tj@kernel.org>, kernel test robot <oliver.sang@intel.com>,
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
	Christoph Lameter <cl@linux.com>, Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Wedson Almeida Filho <wedsonaf@gmail.com>, linux-mm@kvack.org,
	lkmm@lists.linux.dev
Subject: Re: [linus:master] [mm]  24e44cc22a:
 BUG:KCSAN:data-race_in_pcpu_alloc_noprof/pcpu_block_update_hint_alloc
Message-ID: <Zp7G4EfISRwlmmIT@boqun-archlinux>
References: <202407191651.f24e499d-oliver.sang@intel.com>
 <Zp6bMoDnUMxNrKos@boqun-archlinux>
 <Zp6cVgXJlzF4VOwl@slm.duckdns.org>
 <Zp6e1PWZbz4pkh9Z@boqun-archlinux>
 <Zp6kpCcQRPTGk1LK@V92F7Y9K0C.lan>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zp6kpCcQRPTGk1LK@V92F7Y9K0C.lan>

On Mon, Jul 22, 2024 at 11:27:48AM -0700, Dennis Zhou wrote:
> Hello,
> 
> On Mon, Jul 22, 2024 at 11:03:00AM -0700, Boqun Feng wrote:
> > On Mon, Jul 22, 2024 at 07:52:22AM -1000, Tejun Heo wrote:
> > > On Mon, Jul 22, 2024 at 10:47:30AM -0700, Boqun Feng wrote:
> > > > This looks like a data race because we read pcpu_nr_empty_pop_pages out
> > > > of the lock for a best effort checking, @Tejun, maybe you could confirm
> > > > on this?
> > > 
> > > That does sound plausible.
> > > 
> > > > -       if (pcpu_nr_empty_pop_pages < PCPU_EMPTY_POP_PAGES_LOW)
> > > > +       /*
> > > > +        * Checks pcpu_nr_empty_pop_pages out of the pcpu_lock, data races may
> > > > +        * occur but this is just a best-effort checking, everything is synced
> > > > +        * in pcpu_balance_work.
> > > > +        */
> > > > +       if (data_race(pcpu_nr_empty_pop_pages) < PCPU_EMPTY_POP_PAGES_LOW)
> > > >                 pcpu_schedule_balance_work();
> > > 
> > > Would it be better to use READ/WRITE_ONCE() for the variable?
> > > 
> > 
> > For READ/WRITE_ONCE(), we will need to replace all write accesses and
> > all out-of-lock read accesses to pcpu_nr_empty_pop_pages, like below.
> > It's better in the sense that it doesn't rely on compiler behaviors on
> > data races, not sure about the performance impact though.
> > 
> 
> I think a better alternative is we can move it up into the lock under
> area_found. The value gets updated as part of pcpu_alloc_area() as the
> code above populates percpu memory that is already allocated.
> 

Not sure I followed what exactly you suggested here because I'm not
familiar with the logic, but a simpler version would be:


diff --git a/mm/percpu.c b/mm/percpu.c
index 20d91af8c033..fc54d27e5786 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -1891,8 +1891,10 @@ void __percpu *pcpu_alloc_noprof(size_t size, size_t align, bool reserved,
 		mutex_unlock(&pcpu_alloc_mutex);
 	}
 
-	if (pcpu_nr_empty_pop_pages < PCPU_EMPTY_POP_PAGES_LOW)
-		pcpu_schedule_balance_work();
+	scoped_guard(spinlock_irqsave, &pcpu_lock) {
+		if (pcpu_nr_empty_pop_pages < PCPU_EMPTY_POP_PAGES_LOW)
+			pcpu_schedule_balance_work();
+	}
 
 	/* clear the areas and return address relative to base address */
 	for_each_possible_cpu(cpu)

I.e. just locking while checking.

Regards,
Boqun

> We should probably annotate pcpu_update_empty_pages() with:
>     lockdep_assert_held(&pcpu_lock);
> 
> Thanks,
> Dennis
> 
> > Regards,
> > Boqun
> > 
> > ----->8
> > diff --git a/mm/percpu.c b/mm/percpu.c
> > index 20d91af8c033..729e8188238b 100644
> > --- a/mm/percpu.c
> > +++ b/mm/percpu.c
> > @@ -570,7 +570,8 @@ static void pcpu_isolate_chunk(struct pcpu_chunk *chunk)
> >  
> >  	if (!chunk->isolated) {
> >  		chunk->isolated = true;
> > -		pcpu_nr_empty_pop_pages -= chunk->nr_empty_pop_pages;
> > +		WRITE_ONCE(pcpu_nr_empty_pop_pages,
> > +			   pcpu_nr_empty_pop_pages - chunk->nr_empty_pop_pages);
> >  	}
> >  	list_move(&chunk->list, &pcpu_chunk_lists[pcpu_to_depopulate_slot]);
> >  }
> > @@ -581,7 +582,8 @@ static void pcpu_reintegrate_chunk(struct pcpu_chunk *chunk)
> >  
> >  	if (chunk->isolated) {
> >  		chunk->isolated = false;
> > -		pcpu_nr_empty_pop_pages += chunk->nr_empty_pop_pages;
> > +		WRITE_ONCE(pcpu_nr_empty_pop_pages,
> > +			   pcpu_nr_empty_pop_pages + chunk->nr_empty_pop_pages);
> >  		pcpu_chunk_relocate(chunk, -1);
> >  	}
> >  }
> > @@ -599,7 +601,8 @@ static inline void pcpu_update_empty_pages(struct pcpu_chunk *chunk, int nr)
> >  {
> >  	chunk->nr_empty_pop_pages += nr;
> >  	if (chunk != pcpu_reserved_chunk && !chunk->isolated)
> > -		pcpu_nr_empty_pop_pages += nr;
> > +		WRITE_ONCE(pcpu_nr_empty_pop_pages,
> > +			   pcpu_nr_empty_pop_pages + nr);
> >  }
> >  
> >  /*
> > @@ -1891,7 +1894,7 @@ void __percpu *pcpu_alloc_noprof(size_t size, size_t align, bool reserved,
> >  		mutex_unlock(&pcpu_alloc_mutex);
> >  	}
> >  
> > -	if (pcpu_nr_empty_pop_pages < PCPU_EMPTY_POP_PAGES_LOW)
> > +	if (READ_ONCE(pcpu_nr_empty_pop_pages) < PCPU_EMPTY_POP_PAGES_LOW)
> >  		pcpu_schedule_balance_work();
> >  
> >  	/* clear the areas and return address relative to base address */
> > @@ -2754,7 +2757,7 @@ void __init pcpu_setup_first_chunk(const struct pcpu_alloc_info *ai,
> >  	tmp_addr = (unsigned long)base_addr + static_size + ai->reserved_size;
> >  	pcpu_first_chunk = pcpu_alloc_first_chunk(tmp_addr, dyn_size);
> >  
> > -	pcpu_nr_empty_pop_pages = pcpu_first_chunk->nr_empty_pop_pages;
> > +	WRITE_ONCE(pcpu_nr_empty_pop_pages, pcpu_first_chunk->nr_empty_pop_pages);
> >  	pcpu_chunk_relocate(pcpu_first_chunk, -1);
> >  
> >  	/* include all regions of the first chunk */
> > 
