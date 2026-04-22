Received: from abb.hmeau.com (abb.hmeau.com [180.181.231.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD14191F94;
	Wed, 22 Apr 2026 05:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.181.231.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776835964; cv=none; b=t9YOyQWIhbfiZlvuDemgNU2L3LLOBgTT9sIgwfVNM4QJFwXRxRAWSnUKVorRADlm+k8KlJD+m54Q6P3dBiXQ/Vi4m9dLGZVElUsj/eXya40nGfgXXDn94RF2w+cmy3zGc62Oe/WCQ3MvYesrOz92QuycTZw6wHvUAbm2fs9FKDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776835964; c=relaxed/simple;
	bh=96Mt+1pxUf9JKkni9soPx4Kg/25de3pMwuu3k4RZl3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aSvqqwGGg/veSQZH2x07uuwq9ApZMWeCYADPbvLvxDwxhqWiCthD44zUuhf0h+oNstRM6ThLOZZkOw4OhjZCfDKAscY+a99Git9KvbxzKDdYUwt3VEemr+4FkLN+1EEy1/q13VYNE3AxseBQiULJY8tBpqgQI3FRRDGzgqCcLIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.b=rxyn6RRg; arc=none smtp.client-ip=180.181.231.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.b="rxyn6RRg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=oXiySTXnmX0EoYqqPO0CUXpbGPq7kKxCM2FYg6rgL2k=; 
	b=rxyn6RRgWSMPT8cbt6zpRcqyBuzEnxS/cyiGOeMie87KpSi1IcYD2HmX4NgYvFizq/O2Nadx4fF
	43urOEB1JJFHyVxq4Pwo1bNyYB50W+5GbZ57uJfSI/ZjdfvsGC43i/1A6MTxbUX0FuhncYJrXsFMX
	1FhE6Hck6V68uf40tRwmW+icihHrJFU60dfd8gO0kKJglIBTM2WO2MH7XEqJO/AVuPHnUzmlXszFC
	UbjatM55EsESOXQppEZV38XlZZL0vL7UmoEySz4HiHHsOedu1tG3H/mhZIRuGwVciP91dQu3tekFZ
	EyGF7Cs7RD5Lb8OZAU+6yJSaAKzxpLdZLuqQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1wFQCR-007szj-06;
	Wed, 22 Apr 2026 13:32:36 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 22 Apr 2026 13:32:35 +0800
Date: Wed, 22 Apr 2026 13:32:35 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Uladzislau Rezki <urezki@gmail.com>
Cc: Thomas Graf <tgraf@suug.ch>, oe-lkp@lists.linux.dev, lkp@intel.com,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Michal Hocko <mhocko@suse.com>, Baoquan He <bhe@redhat.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Marco Elver <elver@google.com>, Michal Hocko <mhocko@kernel.org>,
	linux-mm@kvack.org
Subject: Re: [linus:master] [mm]  c6307674ed:
 BUG:sleeping_function_called_from_invalid_context_at_mm/vmalloc.c
Message-ID: <aehdcxC14ycvY481@gondor.apana.org.au>
References: <202604211323.fac1b29e-lkp@intel.com>
 <aedvSnhOGM_mauYP@milan>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aedvSnhOGM_mauYP@milan>

On Tue, Apr 21, 2026 at 02:36:26PM +0200, Uladzislau Rezki wrote:
>
> <snip>
> diff --git a/lib/rhashtable.c b/lib/rhashtable.c
> index 6074ed5f66f3..a892766dcedd 100644
> --- a/lib/rhashtable.c
> +++ b/lib/rhashtable.c
> @@ -473,7 +473,7 @@ static int rhashtable_insert_rehash(struct rhashtable *ht,
>  
>  	err = rhashtable_rehash_attach(ht, tbl, new_tbl);
>  	if (err) {
> -		bucket_table_free(new_tbl);
> +		call_rcu(&new_tbl->rcu, bucket_table_free_rcu);
>  		if (err == -EEXIST)
>  			err = 0;
>  	} else
> <snip>
> 
> Could you please check? The problem here is
> 
> rcu_read_lock()
>     rhashtable_insert_rehash()
>         vfree();
> rcu_read_unlokc();
> 
> we can just defer freeing via call_rcu().

I think we should fix that warning instead.  The memory
that's being freed here was just allocated in exactly the
same context through kvmalloc with GFP_ATOMIC.  I can't
see why you're allowed to call kvmalloc but not kvfree.

That makes no sense.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
