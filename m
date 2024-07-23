Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1242E83F;
	Tue, 23 Jul 2024 06:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721715198; cv=none; b=qg1ktdaKIlPjgwkwXiGTB6A8WYUdAO0oBtH3/9ffq+uwZIdripikWmTBB9FO2e5XQWAvqYfYYU66uBuMhgoI9KjiKVFCFfjAwK42DK2JlauoFEVW/iuQSH74n7eEYlwSwdOhLkZTiiIhoq6DucPoKdjjzjSsBepQqBJ3XAHmzk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721715198; c=relaxed/simple;
	bh=VQJqynMJxzrsZAD1nG5keT3FGlcpHAyjrPHZQw64PEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jz3aHBaslJaxn275YuG3E71ul4rpuk6A0IR50maDWeYB7zN9B2B3rMgR1HO4rAoRfEZXuC9s58gBecu0vsc9sfTYCIMKOxHr5A7Dbg/xD2dUA9H4/GjkA0P6M7ktsz1lmJTfvAC4tvlpJgL92g25skihTui783J50utuBipWPpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1fc587361b6so38607895ad.2;
        Mon, 22 Jul 2024 23:13:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721715196; x=1722319996;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=veqI8JpWND9x/vrna5uBQjtmH0anUTbMAymlouU2IIA=;
        b=GHSucX631SBdFShIIEGzIeEszeecQDHi0jIHJU6b1ZwC2gr9VxFRMDUG+Z6QB5hgGp
         lCSvWRqz2HgdM06P3gsyuhPI8e2OJpBuylXeR/XPpP1hQmnroKJgVdX4jYBsaRTavnwh
         UYjYXHtDoy7Pf4p1mWWJa49AyELNjAvff0t/OJ+Mk/5ypu2+BKgRoVupFHrw5KwL5w7y
         tvyS2RDcreU2i+n/KoMZRQ20wMkZrfncvlcOiH/AB+8SgTmz+5bwtzeDN7lxLKyua+Q3
         YyF7aO+ZHE+YrRaiAKgxvTiFKpxUkfHeSXHJ23TLVNifIDU58VgxFOrJ79rDiIkc4qlz
         lSgg==
X-Forwarded-Encrypted: i=1; AJvYcCUt+VkiS6VjtfxDyfmmYZBHme8wy9WMjsI7+aaU1P9L4tDT3LN3heUt3x6veJ7y/9Bh2r7pOgrx3WhuKEhH5DSU9rkR4A9pwRTBFtWwc+B4hl8b9QyZineuGPCjDw==
X-Gm-Message-State: AOJu0YwhMux1MeyB5z7fJ0MsKNw+YxcrSWIOYGnTj6tNht5tXi9AoMYS
	FUZMz2hqdYF02l52sT5t8YFDD1mX2O85rva3khHoJEAQHQLpzC/V
X-Google-Smtp-Source: AGHT+IFokcuiNQpmIx+LeDifSxdr+eQv/RRynQlUmI+tAfEfDwliz2LL7xMK+H5ow8Cc9glZnTEo8w==
X-Received: by 2002:a17:903:190:b0:1fd:93d2:fba4 with SMTP id d9443c01a7336-1fd93d30202mr37575885ad.48.1721715196030;
        Mon, 22 Jul 2024 23:13:16 -0700 (PDT)
Received: from snowbird ([136.25.84.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f44c7b2sm65785955ad.218.2024.07.22.23.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 23:13:15 -0700 (PDT)
Date: Mon, 22 Jul 2024 23:13:10 -0700
From: Dennis Zhou <dennis@kernel.org>
To: Oliver Sang <oliver.sang@intel.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Tejun Heo <tj@kernel.org>,
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
Message-ID: <Zp9J9t-KP17P-OFR@snowbird>
References: <202407191651.f24e499d-oliver.sang@intel.com>
 <Zp6bMoDnUMxNrKos@boqun-archlinux>
 <Zp6cVgXJlzF4VOwl@slm.duckdns.org>
 <Zp6e1PWZbz4pkh9Z@boqun-archlinux>
 <Zp6kpCcQRPTGk1LK@V92F7Y9K0C.lan>
 <Zp7G4EfISRwlmmIT@boqun-archlinux>
 <Zp9EvUTqni5wMDlC@snowbird>
 <Zp9JIvoRVaa+w5OT@xsang-OptiPlex-9020>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zp9JIvoRVaa+w5OT@xsang-OptiPlex-9020>

Hi Oliver,

On Tue, Jul 23, 2024 at 02:09:38PM +0800, Oliver Sang wrote:
> hi, Dennis Zhou,
> 
> On Mon, Jul 22, 2024 at 10:50:53PM -0700, Dennis Zhou wrote:
> > On Mon, Jul 22, 2024 at 01:53:52PM -0700, Boqun Feng wrote:
> > > On Mon, Jul 22, 2024 at 11:27:48AM -0700, Dennis Zhou wrote:
> > > > Hello,
> > > > 
> > > > On Mon, Jul 22, 2024 at 11:03:00AM -0700, Boqun Feng wrote:
> > > > > On Mon, Jul 22, 2024 at 07:52:22AM -1000, Tejun Heo wrote:
> > > > > > On Mon, Jul 22, 2024 at 10:47:30AM -0700, Boqun Feng wrote:
> > > > > > > This looks like a data race because we read pcpu_nr_empty_pop_pages out
> > > > > > > of the lock for a best effort checking, @Tejun, maybe you could confirm
> > > > > > > on this?
> > > > > > 
> > > > > > That does sound plausible.
> > > > > > 
> > > > > > > -       if (pcpu_nr_empty_pop_pages < PCPU_EMPTY_POP_PAGES_LOW)
> > > > > > > +       /*
> > > > > > > +        * Checks pcpu_nr_empty_pop_pages out of the pcpu_lock, data races may
> > > > > > > +        * occur but this is just a best-effort checking, everything is synced
> > > > > > > +        * in pcpu_balance_work.
> > > > > > > +        */
> > > > > > > +       if (data_race(pcpu_nr_empty_pop_pages) < PCPU_EMPTY_POP_PAGES_LOW)
> > > > > > >                 pcpu_schedule_balance_work();
> > > > > > 
> > > > > > Would it be better to use READ/WRITE_ONCE() for the variable?
> > > > > > 
> > > > > 
> > > > > For READ/WRITE_ONCE(), we will need to replace all write accesses and
> > > > > all out-of-lock read accesses to pcpu_nr_empty_pop_pages, like below.
> > > > > It's better in the sense that it doesn't rely on compiler behaviors on
> > > > > data races, not sure about the performance impact though.
> > > > > 
> > > > 
> > > > I think a better alternative is we can move it up into the lock under
> > > > area_found. The value gets updated as part of pcpu_alloc_area() as the
> > > > code above populates percpu memory that is already allocated.
> > > > 
> > > 
> > > Not sure I followed what exactly you suggested here because I'm not
> > > familiar with the logic, but a simpler version would be:
> > > 
> > > 
> > 
> > I believe that's the only naked access of pcpu_nr_empty_pop_pages. So
> > I was thinking this'll fix this problem.
> > 
> > I also don't know how to rerun this CI tho..
> 
> we could test this patch. what's the base? could we apply it directly upon
> 24e44cc22a?
> 
> BTW, our bot is not so clever so far to auto test fix patches, so this is kind
> of manual effort. due to resource constraint, it will be hard for us to test
> each patch (we saw several patches in this thread already) or test very fast.
> 

Ah yeah that makes sense. If you don't mind testing the last one I sent,
the one below, that applies cleanly to 24e44cc22a.

Thanks,
Dennis

> > 
> > ---
> > diff --git a/mm/percpu.c b/mm/percpu.c
> > index 20d91af8c033..325fb8412e90 100644
> > --- a/mm/percpu.c
> > +++ b/mm/percpu.c
> > @@ -1864,6 +1864,10 @@ void __percpu *pcpu_alloc_noprof(size_t size, size_t align, bool reserved,
> >  
> >  area_found:
> >  	pcpu_stats_area_alloc(chunk, size);
> > +
> > +	if (pcpu_nr_empty_pop_pages < PCPU_EMPTY_POP_PAGES_LOW)
> > +		pcpu_schedule_balance_work();
> > +
> >  	spin_unlock_irqrestore(&pcpu_lock, flags);
> >  
> >  	/* populate if not all pages are already there */
> > @@ -1891,9 +1895,6 @@ void __percpu *pcpu_alloc_noprof(size_t size, size_t align, bool reserved,
> >  		mutex_unlock(&pcpu_alloc_mutex);
> >  	}
> >  
> > -	if (pcpu_nr_empty_pop_pages < PCPU_EMPTY_POP_PAGES_LOW)
> > -		pcpu_schedule_balance_work();
> > -
> >  	/* clear the areas and return address relative to base address */
> >  	for_each_possible_cpu(cpu)
> >  		memset((void *)pcpu_chunk_addr(chunk, cpu, 0) + off, 0, size);
