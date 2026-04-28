Received: from abb.hmeau.com (abb.hmeau.com [180.181.231.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2119C1F4631;
	Tue, 28 Apr 2026 01:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.181.231.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777339818; cv=none; b=Pr7OVYwhwI4A+8aAUG1Uqn6GkhoD4oVZnzMEX73Y03Q90ENZnlifa7pw5VVA6rgic7EbY9n19LhKMPzrgIir7xHyv4T0x3ASZOzZAwKz/m3nKjomhlp2wmwG92icXrimnN9CQYPSknlCqyf8KyL0QvjA51X/XJg6mCP4+dGXPTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777339818; c=relaxed/simple;
	bh=jb2/9mot5XOqUeJ+94daVPaTKSJLtus1oLH7Scv+bjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=shiqY+8bJW+rWQnFwaU/39WjPqOdHh957cWMKeYldnCSZauXYqFwa5wWbndjHHCb6pCr53nAAKas3+zNdj+Gw164Gvcaw51q5Ww+LWXzhmYmEDlAjE45FWlUDRj+qHFzlJ2aZufeyoH5ThimtNnZvjNgFMtXy0vtk+oZa6z6gXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.b=bLN2dIHy; arc=none smtp.client-ip=180.181.231.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.b="bLN2dIHy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=xPGXCR+/vRkMXnOHF77K390YQwg7XtFDEASdQ5ggF8k=; 
	b=bLN2dIHyFKBSnRnfmJuZbuRO4Ldw29XV2Vy5dJAkXCx6DlBFlFk+LzqoD8Vuh40851Djw4vl01C
	dmAHRaR+VSxERx9RosbUPvDBnFKl9XbarnKcU9yLEjTafE7Ch68PyPUdQRdpSOAkT23Csz8gwcq0r
	yWJdwSLXsyQeCEdWc5X2B6YdNubaMedUmBl0BChVV0rU+B3MxXQasGAF0uuhpej1Amsh5i4fjnMTd
	W57Z+wAoosfXqER3zpAXbeWT9TMwEO22u7MEtcFUX8I2xHODaD6uUqQS2By3649ZbsGg2enUROn8D
	ypW7JEfJBmxUUa8jWIyfxMsYQEMd6KUCAxcA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1wHXGx-009MBU-0l;
	Tue, 28 Apr 2026 09:30:00 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Tue, 28 Apr 2026 09:29:59 +0800
Date: Tue, 28 Apr 2026 09:29:59 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Uladzislau Rezki <urezki@gmail.com>
Cc: Vlastimil Babka <vbabka@suse.com>, Harry Yoo <harry.yoo@oracle.com>,
	Hao Li <hao.li@linux.dev>, Thomas Graf <tgraf@suug.ch>,
	oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Michal Hocko <mhocko@suse.com>, Baoquan He <bhe@redhat.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Marco Elver <elver@google.com>, Michal Hocko <mhocko@kernel.org>,
	linux-mm@kvack.org
Subject: Re: [linus:master] [mm] c6307674ed:
 BUG:sleeping_function_called_from_invalid_context_at_mm/vmalloc.c
Message-ID: <afANly2Br1kIBPOs@gondor.apana.org.au>
References: <aedvSnhOGM_mauYP@milan>
 <aehdcxC14ycvY481@gondor.apana.org.au>
 <aeh2Ii9CxtgfsX_p@milan>
 <aeh_2WwIb8nAIcy2@gondor.apana.org.au>
 <aeiHkG7X_dieMdw5@milan>
 <aemTW8yiAe6y1tsQ@gondor.apana.org.au>
 <4e269fb1-cd6c-46ca-ac2a-168ce9fd06fe@suse.com>
 <ae9wFZp7dS8QF8br@milan>
 <6cae0418-eabe-4864-b87f-b1f953de06b0@suse.com>
 <ae-MdIOcSkfphbHM@milan>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae-MdIOcSkfphbHM@milan>

On Mon, Apr 27, 2026 at 06:19:00PM +0200, Uladzislau Rezki wrote:
>
> Like below:
> 
> rhashtable_try_insert()
>   rhashtable_insert_rehash()
>     bucket_table_free_atomic(new_tbl);
> 
> the patch for rhashtable.c can look like:
> 
> <snip>

If you want to send that as a submission you can add my ack:

Acked-by: Herbert Xu <herbert@gondor.apana.org.au>

Alternatively, could you send both patches to linux-crypto and
I can push them through my tree.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
