Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DB636EA8D
	for <oe-lkp@lists.linux.dev>; Wed, 22 Apr 2026 07:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776842280; cv=none; b=jaVLkH+RHPwKwdBoOW5ylBgF4Z8H9yq2ASjQ1k2QtrmWqqdAmeHEP9Z7vI1UDFA15ukmM8qpD9hAlQ2MQ8SKi+BAoHgtWsqTFg29OvLVfRuSl6hmOMlpqqzxYu2WeSAS9B3q+SkNsIyZoXMNi1fcJwe38ucrN5mO8mD0DGpKIVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776842280; c=relaxed/simple;
	bh=ZG90j3XRb95Ay3b1mW4KNO+ayzL4kVs1S7yqpdo3nEk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BX+NkToVyGQhUt9T4+r20CRvh80aHGzrkTvWw7JsFy5f8NOM+AVNlCt0oeIzPr6ltp39Dhj1XNPK41uXbmTiFanLgzoXaS8mhluSNPj4jzIqT67qYAD0bHN4/AA6xv3lmWqak4FqtL9CkqfQZ1/jcv7IdbG2NrQAbw6k5EDkowo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YNUBCvHI; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YNUBCvHI"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a3cee3a271so5241811e87.3
        for <oe-lkp@lists.linux.dev>; Wed, 22 Apr 2026 00:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776842277; x=1777447077; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2XNH6lrFfSGfrUbW+37AE4lo9UaFSg4Ouhd4198aVww=;
        b=YNUBCvHIoGZY0bbNMzVI4V1W9KdKWa5GyreHjIG47ra4tQcaStFgsCXVLxcpcKIfwp
         u03kqRDLvtlUSg56ILWk9QGvJHRRBs9Q6ZhbUrGmj0SKbMxd/M/JNND5x/Hnvy8dW0M7
         VopoNxpQB8+rbJMlZ+koeM20LZ12jGS60B8GOg7hFaHWjsSYBbivuwuUvulgcWaAS0oW
         /fs9tIH22LCZWfVtRnGWPvMGX7RSNN6OCkQcUUqIN5xvCY+j1t69iadn9lM8aIYgAuAP
         EXYjZ8Oc+0b/iOIDxoZ+6pAMwR9OFaatHc4CvSEGydAOPjTtwjQ2I+DDj4NfIatyaPGz
         3fvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776842277; x=1777447077;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2XNH6lrFfSGfrUbW+37AE4lo9UaFSg4Ouhd4198aVww=;
        b=JhGHd0o33/ZcC1fNtkuYUJsvcK9zEtQxTHa+Vsd7ms6plEITjzqmNnRTXU+o90PgO3
         btf8/X9KmOlVF9H/wstQaDFVqycFzPya5OS7VIrZ18K8J6OF1KPSrNxmpFKghVV2hWrn
         FMwGp66pYuWERA1lerlirsTy/CbL4Mpw37t+tevqXScQvobjFVtqfGkQfFKPIzLrxhHa
         CvGJ98VsKD998UCTzt/iwnPhno+8ErWVdIJsyPMFqjgai202ytwBTU+pyEmP31B9vlnR
         N4wgTETWzhTTkKcrxyon9TYZBkHgjVvborYLCfjx7i6lOpBi1DOOlGW+qAS8ziXUfzSq
         M8zA==
X-Forwarded-Encrypted: i=1; AFNElJ9BNvQxQ+tnuYq+iTVwlFQQsulde15hi5QKchaKdduriRPcmPizSCgZ0EI8zjJ+aIbixMBAEzA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzN0P56XDkTcDN6sD437Rv+PXnZdSUjeqq53yIjtte9tvO5HdcT
	Gu0IjKX1HVzyzRDdlngBkGT3L4s3cUZDkXO4tZfCLBfFJdPFKjZu27/I
X-Gm-Gg: AeBDieutKchne/XtO570lyeKYjkxkxOfbAr1BiHPWlu8QdbN0hP8mkFSRWQ2N6yWOY2
	1Yth442fLqFbgLV3mVuFOKii+Q0dH12TOTcy+H4wARuFm5UBSFSATU3Hy3SlUbDJ/TJPrmtNtiK
	fGODOu7Cr3Y6gS50BeI8z9SSZGVHCgXrclTtFJt0cfMUSMsGqVzAhuqDzIDPnOnpyBNujcoFK/U
	rembRGfLUKEO/zPOUeIgzafw1PZ1G5JTsAq7z5RCWanPGGElrYUK9Cn1YJXWoneD5E4w0TBipT2
	YdBXehZPCWvTNF1c2H1XkHH518nDlK2oDNTg81ZbT5iySI0gORXPNEid3F1SAaMaIgJzW62IhsI
	ysVkMZ8XE44lLIoXdu2yAOxx6UIZXJA2uk5FlIUkM/H6xdigNNymPSqd0UPMJD/tCJb31cv6uPF
	HgLwcDtoNYuA==
X-Received: by 2002:a05:6512:159f:b0:5a3:f0f7:7da1 with SMTP id 2adb3069b0e04-5a4172cd17amr8166452e87.17.1776842276850;
        Wed, 22 Apr 2026 00:17:56 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187ebf2asm4221846e87.80.2026.04.22.00.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 00:17:56 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Wed, 22 Apr 2026 09:17:54 +0200
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Uladzislau Rezki <urezki@gmail.com>, Thomas Graf <tgraf@suug.ch>,
	oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Michal Hocko <mhocko@suse.com>, Baoquan He <bhe@redhat.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Marco Elver <elver@google.com>, Michal Hocko <mhocko@kernel.org>,
	linux-mm@kvack.org
Subject: Re: [linus:master] [mm]  c6307674ed:
 BUG:sleeping_function_called_from_invalid_context_at_mm/vmalloc.c
Message-ID: <aeh2Ii9CxtgfsX_p@milan>
References: <202604211323.fac1b29e-lkp@intel.com>
 <aedvSnhOGM_mauYP@milan>
 <aehdcxC14ycvY481@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aehdcxC14ycvY481@gondor.apana.org.au>

On Wed, Apr 22, 2026 at 01:32:35PM +0800, Herbert Xu wrote:
> On Tue, Apr 21, 2026 at 02:36:26PM +0200, Uladzislau Rezki wrote:
> >
> > <snip>
> > diff --git a/lib/rhashtable.c b/lib/rhashtable.c
> > index 6074ed5f66f3..a892766dcedd 100644
> > --- a/lib/rhashtable.c
> > +++ b/lib/rhashtable.c
> > @@ -473,7 +473,7 @@ static int rhashtable_insert_rehash(struct rhashtable *ht,
> >  
> >  	err = rhashtable_rehash_attach(ht, tbl, new_tbl);
> >  	if (err) {
> > -		bucket_table_free(new_tbl);
> > +		call_rcu(&new_tbl->rcu, bucket_table_free_rcu);
> >  		if (err == -EEXIST)
> >  			err = 0;
> >  	} else
> > <snip>
> > 
> > Could you please check? The problem here is
> > 
> > rcu_read_lock()
> >     rhashtable_insert_rehash()
> >         vfree();
> > rcu_read_unlokc();
> > 
> > we can just defer freeing via call_rcu().
> 
> I think we should fix that warning instead.  The memory
> that's being freed here was just allocated in exactly the
> same context through kvmalloc with GFP_ATOMIC.  I can't
> see why you're allowed to call kvmalloc but not kvfree.
> 
> That makes no sense.
> 
There is vfree_atomic() implementation. Regular vfree(), historically
is not supposed to be called from non-sleeping contexts:

<snip>
 * Context:
 * May sleep if called *not* from interrupt context.
 * Must not be called in NMI context (strictly speaking, it could be
 * if we have CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG, but making the calling
 * conventions for vfree() arch-dependent would be a really bad idea).
 */
void vfree(const void *addr)
{
	struct vm_struct *vm;
	int i;

	if (unlikely(in_interrupt())) {
		vfree_atomic(addr);
		return;
	}

	BUG_ON(in_nmi());
	kmemleak_free(addr);
	might_sleep();
<snip>

since your GFP_ATOMIC context allocated chunk of memory using vmalloc()
sense kvfree() uses vfree(). The simplest fix to free via RCU.

--
Uladzislau Rezki
