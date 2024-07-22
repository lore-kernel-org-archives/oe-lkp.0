Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DB316D9DC;
	Mon, 22 Jul 2024 17:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721670746; cv=none; b=cEAgA+Kxw86wlcHb6qOjtyfa9hcuWmaa+rkefdH4lUh6V+gHKsaRcUZUBKV7KR4HjL7h2b7yS9g45uKFALQAInhzaYPjGbljwpFMMrU6tL81P6CyzyXC1xz1EgLX0gD8r8mny5LtebEYx6+xCySyL7r6xi/K37ewnjmVxiSNItU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721670746; c=relaxed/simple;
	bh=je3BOS5JKkQ+J6ZBvGqL0EaE2MrQXHfiO6bf0lLAQXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j/HBz1iO7g4V0Ms5OmxydmgvkqW2B3jdZBBqLz4DgB2tPWNSHu80ip8e+dAU97u+qIWWa3uUZPpqNYb57emEKalktR7SKVsdSJ3J2AZTkdkOLgaTNczi/oD4rmHB5AZ1fSjpMyYuSthCr3FJiY+piA5Eq5k7e3VPUPgJRQpo64U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aZndwXu7; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aZndwXu7"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1fc60c3ead4so29920995ad.0;
        Mon, 22 Jul 2024 10:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721670744; x=1722275544; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d8H1pDCmGySCGRl1gIUJ/4C+Z1BCsXQ3ICifUIskDw4=;
        b=aZndwXu7Y7Hpy5UaDWtJoyvgf7qeDnTvzslnTPQXXVUb8CjGfln/4ZvokWUh+IJQrq
         R65aNXVyeEI8MwyjS5GCirvENraJvM3+mSOlpfPNkPrnomkgTjsNIKjUY0Q+18yLDqcr
         dnObUUjCWEkQWY/dojugGUmEwOfjkFaas5BeOWiz61qRuwdb8b0jUgW5WiyhMTJgZDMi
         9PLrF3gUIf/qG/roh3UNvYXGK2x4c5+CQT4arMI/4Y0v9w7zaf0HRk614X1zIOft3n5i
         6ZV18b9jv6CpOAdIl45ZCB3wNRKVKNTEX+N6IDWUpy5jW+zKZxrHUbr05JIfKVNkND5X
         r2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721670744; x=1722275544;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d8H1pDCmGySCGRl1gIUJ/4C+Z1BCsXQ3ICifUIskDw4=;
        b=kLMas2tek49yDMPys6K9fRSp2kAR0CczAnKa7kXiZN3RdTEZ6lWlgASiw6NCH+NfEp
         Rfu0fc9AZNl3pNRikNbLhiPOC0rfjh8y6hejMLIQFncdUcjV55EGO08cchji2A75ByiW
         8cVyLA6WQ883o70Gmg5KMKUImFaFFktdjPQNqPhJp0PYcCEadwWQjhJwvpPsu2qh5iDb
         pCUhDKf6VfWhImTHAVbcm/5gTSp8ygOJXRfXxq1I9uKah7bAWxydthwZcO1hrfDIG0v9
         znU8NVhJ6GeiN95dnVNs0D8DjJtlpQQVq132rXxZzwKzRGmRW8c8XATIYEMs4j4exnB9
         wMpg==
X-Forwarded-Encrypted: i=1; AJvYcCW0eaz5U4GfhXTMiqdnPJfL9YXSekrDEX/8TwAJMPtWdGlA3B3iOqPxSPtylyNPFyJxtTg2ZCIOewf+dN9WYKixKp41VRoMu289b5IvpubDQd+jnrQCzR6GFzT4tQ==
X-Gm-Message-State: AOJu0YzSOcmY4mp9mG/QyvBEFXoTrerZtAryAwUZ7KdLhte3YF0Ah0M7
	Yzjj9HrqNM0FYCkyoOqH3XHoBDXXcjljZJPwFwjXTlF30bColPNr
X-Google-Smtp-Source: AGHT+IFvaw5S9BVXgTqGeEVg+R+dGHoF2WCukfAlPmBJGv5XsrOt33aHMZ4o5pvjoGjnzEfmXGKPhA==
X-Received: by 2002:a17:903:41cb:b0:1fd:95ac:506b with SMTP id d9443c01a7336-1fd95ac51f0mr26766915ad.64.1721670744351;
        Mon, 22 Jul 2024 10:52:24 -0700 (PDT)
Received: from localhost (dhcp-141-239-149-160.hawaiiantel.net. [141.239.149.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f316d0fsm57840575ad.165.2024.07.22.10.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 10:52:23 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Mon, 22 Jul 2024 07:52:22 -1000
From: Tejun Heo <tj@kernel.org>
To: Boqun Feng <boqun.feng@gmail.com>
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
Message-ID: <Zp6cVgXJlzF4VOwl@slm.duckdns.org>
References: <202407191651.f24e499d-oliver.sang@intel.com>
 <Zp6bMoDnUMxNrKos@boqun-archlinux>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zp6bMoDnUMxNrKos@boqun-archlinux>

On Mon, Jul 22, 2024 at 10:47:30AM -0700, Boqun Feng wrote:
> This looks like a data race because we read pcpu_nr_empty_pop_pages out
> of the lock for a best effort checking, @Tejun, maybe you could confirm
> on this?

That does sound plausible.

> -       if (pcpu_nr_empty_pop_pages < PCPU_EMPTY_POP_PAGES_LOW)
> +       /*
> +        * Checks pcpu_nr_empty_pop_pages out of the pcpu_lock, data races may
> +        * occur but this is just a best-effort checking, everything is synced
> +        * in pcpu_balance_work.
> +        */
> +       if (data_race(pcpu_nr_empty_pop_pages) < PCPU_EMPTY_POP_PAGES_LOW)
>                 pcpu_schedule_balance_work();

Would it be better to use READ/WRITE_ONCE() for the variable?

Thanks.

-- 
tejun
