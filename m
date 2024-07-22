Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9852516C849;
	Mon, 22 Jul 2024 18:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721672875; cv=none; b=KP6Fa6F2YjqHZ6iDfRPTd8jBWiX/kNi0E6FAEhCmzplDAC2TY3qZIr0bLcG1J9WqVCYdhWT1BtryaMsrZb+o7KtMKIc9rBGIEYC/GgnVlwaROojsnR3q6WbDInlVBIWflKQEwdWjt0WnlDwXZOMskU8EUX0Ox4NONpA2rfcVXso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721672875; c=relaxed/simple;
	bh=F6FMXHBav5ZFf53Zg/+oQQCMht4mrSPcADmH22KDITU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dPkIQFPV10/MF2KOPO5b2UylDA3O9C4l+/Dio6irG3CECEBO/tcZXJ4QXTAwvR3G+sYBVH40tqqUPVEWMkN7JnSPL6cOr7QfnPXM4ODsc4NIHDWwxSZ/Ew1n0td917EKGtaB+40MfNpaKcfbMQHR0vHRE9TYJXl6+Jd02CqIHdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-398039f8b7bso15157335ab.3;
        Mon, 22 Jul 2024 11:27:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721672872; x=1722277672;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EqG4DjXdh9BThfz/oPKE46CRC77k0JuZ2H1GZ7xS5y4=;
        b=sGVaEE2OZXtbugC5vS3Gaqz7uOmIe2c8ryKkTmQa2s5scTcMhySjZcTYnDuLCidhFh
         fAGuwb86DsUOfOG+grTZcVlGS+LUR5bcj6T35btV2p+vDXcOkNoU3F8/uS2azvxMlYZQ
         hnRtpP78kY03Mwu4q7AotIYo3YpV/AFoQbqLewhyrPxTS9PlMfXHCP3ibM7Ij39Rt7Us
         p74qqZ7eFTgQTwO1Obu5wu3h/BkOFMgX/zCd3xoAufOaLQ9RBDCukwXR+wzK1ZwakvnC
         LKVFaWy4VgV59MvuZRQN3//TfIieLsycwRPLhboZB8z+GkVDL1YEyhpl679C5OzSffQS
         21yw==
X-Forwarded-Encrypted: i=1; AJvYcCVySQGD35sUQHVcjmEMcMyl168cbna1WN5G12wzNdKiVaOQtzsQn7MmiWr3qltaLhzl0PBa084Vj5sHwvm/5gnsNLBj7xX1jJnIcQdxccX49xeWJan4WgIZ+VjVCA==
X-Gm-Message-State: AOJu0YyRLVwpjh4wxaXmAT42T0pUVf2Jm2ssPSVPBoLAqlPqImPQ4kW+
	cPgMxoXFrykffDjSw2Qd7IV1JZywzh13ZTYMplmotlpAcFvdWy5S
X-Google-Smtp-Source: AGHT+IHVX3cSSyhgB58GojLXdK13WAoJHQ6943ZM4PKxyi/C10H5ptjegn1X8lVAliJ9c1/qBW6W/g==
X-Received: by 2002:a05:6e02:18c9:b0:374:ac3a:e32c with SMTP id e9e14a558f8ab-3993ff9ca1fmr104337235ab.16.1721672872550;
        Mon, 22 Jul 2024 11:27:52 -0700 (PDT)
Received: from V92F7Y9K0C.lan ([136.25.84.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7a224a1fc70sm2036075a12.58.2024.07.22.11.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 11:27:52 -0700 (PDT)
Date: Mon, 22 Jul 2024 11:27:48 -0700
From: Dennis Zhou <dennis@kernel.org>
To: Boqun Feng <boqun.feng@gmail.com>, Tejun Heo <tj@kernel.org>
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
Message-ID: <Zp6kpCcQRPTGk1LK@V92F7Y9K0C.lan>
References: <202407191651.f24e499d-oliver.sang@intel.com>
 <Zp6bMoDnUMxNrKos@boqun-archlinux>
 <Zp6cVgXJlzF4VOwl@slm.duckdns.org>
 <Zp6e1PWZbz4pkh9Z@boqun-archlinux>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zp6e1PWZbz4pkh9Z@boqun-archlinux>

Hello,

On Mon, Jul 22, 2024 at 11:03:00AM -0700, Boqun Feng wrote:
> On Mon, Jul 22, 2024 at 07:52:22AM -1000, Tejun Heo wrote:
> > On Mon, Jul 22, 2024 at 10:47:30AM -0700, Boqun Feng wrote:
> > > This looks like a data race because we read pcpu_nr_empty_pop_pages out
> > > of the lock for a best effort checking, @Tejun, maybe you could confirm
> > > on this?
> > 
> > That does sound plausible.
> > 
> > > -       if (pcpu_nr_empty_pop_pages < PCPU_EMPTY_POP_PAGES_LOW)
> > > +       /*
> > > +        * Checks pcpu_nr_empty_pop_pages out of the pcpu_lock, data races may
> > > +        * occur but this is just a best-effort checking, everything is synced
> > > +        * in pcpu_balance_work.
> > > +        */
> > > +       if (data_race(pcpu_nr_empty_pop_pages) < PCPU_EMPTY_POP_PAGES_LOW)
> > >                 pcpu_schedule_balance_work();
> > 
> > Would it be better to use READ/WRITE_ONCE() for the variable?
> > 
> 
> For READ/WRITE_ONCE(), we will need to replace all write accesses and
> all out-of-lock read accesses to pcpu_nr_empty_pop_pages, like below.
> It's better in the sense that it doesn't rely on compiler behaviors on
> data races, not sure about the performance impact though.
> 

I think a better alternative is we can move it up into the lock under
area_found. The value gets updated as part of pcpu_alloc_area() as the
code above populates percpu memory that is already allocated.

We should probably annotate pcpu_update_empty_pages() with:
    lockdep_assert_held(&pcpu_lock);

Thanks,
Dennis

> Regards,
> Boqun
> 
> ----->8
> diff --git a/mm/percpu.c b/mm/percpu.c
> index 20d91af8c033..729e8188238b 100644
> --- a/mm/percpu.c
> +++ b/mm/percpu.c
> @@ -570,7 +570,8 @@ static void pcpu_isolate_chunk(struct pcpu_chunk *chunk)
>  
>  	if (!chunk->isolated) {
>  		chunk->isolated = true;
> -		pcpu_nr_empty_pop_pages -= chunk->nr_empty_pop_pages;
> +		WRITE_ONCE(pcpu_nr_empty_pop_pages,
> +			   pcpu_nr_empty_pop_pages - chunk->nr_empty_pop_pages);
>  	}
>  	list_move(&chunk->list, &pcpu_chunk_lists[pcpu_to_depopulate_slot]);
>  }
> @@ -581,7 +582,8 @@ static void pcpu_reintegrate_chunk(struct pcpu_chunk *chunk)
>  
>  	if (chunk->isolated) {
>  		chunk->isolated = false;
> -		pcpu_nr_empty_pop_pages += chunk->nr_empty_pop_pages;
> +		WRITE_ONCE(pcpu_nr_empty_pop_pages,
> +			   pcpu_nr_empty_pop_pages + chunk->nr_empty_pop_pages);
>  		pcpu_chunk_relocate(chunk, -1);
>  	}
>  }
> @@ -599,7 +601,8 @@ static inline void pcpu_update_empty_pages(struct pcpu_chunk *chunk, int nr)
>  {
>  	chunk->nr_empty_pop_pages += nr;
>  	if (chunk != pcpu_reserved_chunk && !chunk->isolated)
> -		pcpu_nr_empty_pop_pages += nr;
> +		WRITE_ONCE(pcpu_nr_empty_pop_pages,
> +			   pcpu_nr_empty_pop_pages + nr);
>  }
>  
>  /*
> @@ -1891,7 +1894,7 @@ void __percpu *pcpu_alloc_noprof(size_t size, size_t align, bool reserved,
>  		mutex_unlock(&pcpu_alloc_mutex);
>  	}
>  
> -	if (pcpu_nr_empty_pop_pages < PCPU_EMPTY_POP_PAGES_LOW)
> +	if (READ_ONCE(pcpu_nr_empty_pop_pages) < PCPU_EMPTY_POP_PAGES_LOW)
>  		pcpu_schedule_balance_work();
>  
>  	/* clear the areas and return address relative to base address */
> @@ -2754,7 +2757,7 @@ void __init pcpu_setup_first_chunk(const struct pcpu_alloc_info *ai,
>  	tmp_addr = (unsigned long)base_addr + static_size + ai->reserved_size;
>  	pcpu_first_chunk = pcpu_alloc_first_chunk(tmp_addr, dyn_size);
>  
> -	pcpu_nr_empty_pop_pages = pcpu_first_chunk->nr_empty_pop_pages;
> +	WRITE_ONCE(pcpu_nr_empty_pop_pages, pcpu_first_chunk->nr_empty_pop_pages);
>  	pcpu_chunk_relocate(pcpu_first_chunk, -1);
>  
>  	/* include all regions of the first chunk */
> 
