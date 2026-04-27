Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87964352C2C
	for <oe-lkp@lists.linux.dev>; Mon, 27 Apr 2026 16:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777306748; cv=none; b=sREqRh2gg6u+4qawZvxUf7+af5cVaBW6XUCLTnJ9JeYVrLiO7NmkgPvIKJYFf3nErc4+ItRzyBBTL+Xnuhi6yEZF3cYprt7/uH5W5cHkTEV/6CAFNPdzMt82ReZuT7jdDvUwDN1321eYJTwRT7EK2rbxIld1PJiw/duI1v/q7NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777306748; c=relaxed/simple;
	bh=HP2cJlbOMgZRTBNn9oIyt18Ka+GrMOllcsgrTtDC2JM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dq6jy/5JFYUm/9FrE6EC1PytNcMRiLKaTMyMKm0SOIjzPtAsMa6mjih6z+YV4Bo4QrnKqNQ1L6XGQt/w05IAOKs8V30eZRhr89AK6QVv+2CR/n5wg9JG4rRdJU6LjGqUyh2q979Hfx9JuzyF8tVd5OhUYNIIVKpCczc4KjRguFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iQ1VN8lb; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iQ1VN8lb"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a2b636b944so14687354e87.1
        for <oe-lkp@lists.linux.dev>; Mon, 27 Apr 2026 09:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777306743; x=1777911543; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QJNjSMzEVnhmJlAn1BmExHidoyff7BzpUCDWj8QBgqY=;
        b=iQ1VN8lbDBvj8DqW5lxSLtUngHreWTn3XE1+orqOwTqIDxvDP4v7GRNXz/nm9CO5wv
         QiUFUXqMN/EMwb05Zcd742W1sk5uyGFXlD9CKtipnxDgYz5lmETPgqCI9XpvT07NyMk4
         TtH/HdYdW5zBr47rtfJXINH+9X+6kV63QAzofJpQOM0iW71TVsym9dickp4Pa84/Sg1X
         kGO3Ii+xhIks46UxAeDJK93XhgzFhQoYXf8++7yFLbBW8q39VPqvEKXbW9py7dd7QVRA
         xqK8mYXfh7A1hRMkN5I7Tj49UcAySJNqshfatvXTiTU0lFoizj2qjBRgYxBl2PfCOKbc
         HI9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777306743; x=1777911543;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QJNjSMzEVnhmJlAn1BmExHidoyff7BzpUCDWj8QBgqY=;
        b=jdh9R4z/vakYcTJG+ocmKe/NOM6FDTLvQHLakRQhDSUoRsL4aR/ov+46qxxf4zPQd5
         QDdVVaE+WvsLi7Lwdr094cNBl+eO6YIw19wA6broqfNaqmsXwEIDjRhHnOfI4s47K0VA
         yzpKDfncY1c/lcchkAhNa3s+j8Y4JcpKIBYyavT3K+uRiK/0mUdBkwUOx2nCC0BGlUE/
         UDf6o++3F/8AG+JYMDn0JuoflHdU0y3GkU+v+O8KbcIXtMwvCsJhhwZ2DwwfHvE3K3e6
         ptqDMHU5oSwLQlWyGw3qtFOIdQ4xNHWP6rKW+ClsdJPbGAxg1mNkHU9RE5ssEFdh5LSQ
         D7FA==
X-Forwarded-Encrypted: i=1; AFNElJ8s5HVTzWsM1FmLKG9o7XUSa4QViJVq6/V0A4vSlFFnygnDZ+UPuKloORqdwrzQ5qlayqrblS4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxSqKTVP0szZqEUJZEIZf/6iuPo+/HFFXdc11jos7SkHIezYvWl
	PlRMvYkkkTxGGcU69HOMUnqfRCGTMJYHw08ULC8BIztEYSA29TQn0NEt
X-Gm-Gg: AeBDies/ZWRzfix2ceOC/lq2D4XpDyXOKcVlVHLMdvytexqwBD07WvgY64ytEa09/5V
	zXxDOMUzWV69CmbqDJtrWMKZ8HWyeNwggmshx0zZD5ZkHyJEzbCm7+R62pYhFzfTKezOo/c4x1Y
	NP19peZZXbyiL0k5cmm19ncYk+bAtulwCzwIbJ87EvI/s+Q41mpri3qMcxIO1wcuZ2agCvOsN86
	6dGkDkpadagAXyh3uURXLX9PdkTjGOxrZ1HMNblqeTbGYdRnbm0rI4BZrU7B3llLc/NSk9ccjwa
	SqHDjI896oE0FN3HNkwZvYHwta4vhwQKMxTlzqI13e1p3oLC4st971vLpVflMJERbfyddJ2khvp
	MbRo5IZgsOnUBCuFF+UTdGaCbMApo5ziwqpXM1K4x5Huz72DvnJKVvWjotlp/YBs6nCkqnbv9cQ
	o=
X-Received: by 2002:a05:6512:1256:b0:5a3:ff77:aa05 with SMTP id 2adb3069b0e04-5a4172c33demr15446017e87.11.1777306742548;
        Mon, 27 Apr 2026 09:19:02 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc361sm8293981e87.32.2026.04.27.09.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 09:19:02 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Mon, 27 Apr 2026 18:19:00 +0200
To: Vlastimil Babka <vbabka@suse.com>
Cc: Uladzislau Rezki <urezki@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Harry Yoo <harry.yoo@oracle.com>, Hao Li <hao.li@linux.dev>,
	Thomas Graf <tgraf@suug.ch>, oe-lkp@lists.linux.dev, lkp@intel.com,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Michal Hocko <mhocko@suse.com>, Baoquan He <bhe@redhat.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Marco Elver <elver@google.com>, Michal Hocko <mhocko@kernel.org>,
	linux-mm@kvack.org
Subject: Re: [linus:master] [mm] c6307674ed:
 BUG:sleeping_function_called_from_invalid_context_at_mm/vmalloc.c
Message-ID: <ae-MdIOcSkfphbHM@milan>
References: <202604211323.fac1b29e-lkp@intel.com>
 <aedvSnhOGM_mauYP@milan>
 <aehdcxC14ycvY481@gondor.apana.org.au>
 <aeh2Ii9CxtgfsX_p@milan>
 <aeh_2WwIb8nAIcy2@gondor.apana.org.au>
 <aeiHkG7X_dieMdw5@milan>
 <aemTW8yiAe6y1tsQ@gondor.apana.org.au>
 <4e269fb1-cd6c-46ca-ac2a-168ce9fd06fe@suse.com>
 <ae9wFZp7dS8QF8br@milan>
 <6cae0418-eabe-4864-b87f-b1f953de06b0@suse.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6cae0418-eabe-4864-b87f-b1f953de06b0@suse.com>

On Mon, Apr 27, 2026 at 04:37:11PM +0200, Vlastimil Babka wrote:
> On 4/27/26 16:17, Uladzislau Rezki wrote:
> > On Mon, Apr 27, 2026 at 10:53:52AM +0200, Vlastimil Babka wrote:
> >> On 4/23/26 05:34, Herbert Xu wrote:
> >> > On Wed, Apr 22, 2026 at 10:32:16AM +0200, Uladzislau Rezki wrote:
> >> >>
> >> >> We have added non-sleeping flags for vmalloc() to extend kvmalloc()
> >> >> functionality as folk need those.
> >> >>  
> >> >> Another option, would be: always use vfree_atomic() from the kvfree()
> >> >> path.
> >> >>  
> >> >> Any thoughts?
> >> > 
> >> > Perhaps add a kvfree_atomic that just calls vfree_atomic?
> >> 
> >> kvfree()'s comment says
> >> 
> >> " * Context: Either preemptible task context or not-NMI interrupt."
> >> 
> > I am not sure the description clearly reflects the intended usage.
> > To me it sounds like all contexts but excluding NMI.
> 
> Agree it's not clear, my immediate reaction was the same and took me a bit
> to understand.
> 
> > For example, calling this under spin_lock() will be invalid, as
> > the vfree() path may invoke cond_resched().
> 
> Yeah, it's covered by the "preemptible" word, but not super clear.
> IIUC it all boils down to this in vfree():
> 
> 
>         if (unlikely(in_interrupt())) {
>                 vfree_atomic(addr);
>                 return;
>         }
> 
> Which can do the right thing in an interrupt, but obviously cannot
> automatically recognize the "under spin_lock()" situation.
> 
> So I don't think we can change it now with all the existing callers, but if
> a better wording exists, we could make the comment more clear.
> 
> >> so this is neither. It might be ok then to create kvfree_atomic(). Always
> >> using vfree_atomic() from kvfree() might be wasteful.
> >> 
> >> > For rhashtable it really makes no difference either way.  But it
> >> > would eliminate the unsightly call to is_vmalloc_addr in rhashtable.
> >> > 
> > Seems atomic version makes sense here:
> > 
> > <snip>
> > diff --git a/include/linux/slab.h b/include/linux/slab.h
> > index 15a60b501b95..2b5ab488e96b 100644
> > --- a/include/linux/slab.h
> > +++ b/include/linux/slab.h
> > @@ -1234,6 +1234,9 @@ void *kvrealloc_node_align_noprof(const void *p, size_t size, unsigned long alig
> >  extern void kvfree(const void *addr);
> >  DEFINE_FREE(kvfree, void *, if (!IS_ERR_OR_NULL(_T)) kvfree(_T))
> >  
> > +extern void kvfree_atomic(const void *addr);
> > +DEFINE_FREE(kvfree_atomic, void *, if (!IS_ERR_OR_NULL(_T)) kvfree_atomic(_T))
> > +
> >  extern void kvfree_sensitive(const void *addr, size_t len);
> >  
> >  unsigned int kmem_cache_size(struct kmem_cache *s);
> > diff --git a/mm/slub.c b/mm/slub.c
> > index 2b2d33cc735c..e25a0eab6ff7 100644
> > --- a/mm/slub.c
> > +++ b/mm/slub.c
> > @@ -6802,6 +6802,22 @@ void kvfree(const void *addr)
> >  }
> >  EXPORT_SYMBOL(kvfree);
> >  
> > +/**
> > + * kvfree_atomic() - Free memory.
> > + * @addr: Pointer to allocated memory.
> > + *
> > + * Same as kvfree(), but safe to use in atomic contexts.
> > + * Must not be called from NMI context.
> > + */
> > +void kvfree_atomic(const void *addr)
> > +{
> > +	if (is_vmalloc_addr(addr))
> > +		vfree_atomic(addr);
> > +	else
> > +		kfree(addr);
> > +}
> > +EXPORT_SYMBOL(kvfree_atomic);
> > +
> >  /**
> >   * kvfree_sensitive - Free a data object containing sensitive information.
> >   * @addr: address of the data object to be freed.
> > <snip>
> > 
> > I can post it if no objections.
> 
> LGTM but also should be now used in rhashtable_try_insert() I think?
> 

Like below:

rhashtable_try_insert()
  rhashtable_insert_rehash()
    bucket_table_free_atomic(new_tbl);

the patch for rhashtable.c can look like:

<snip>
diff --git a/lib/rhashtable.c b/lib/rhashtable.c
index 6074ed5f66f3..4111aab8cee4 100644
--- a/lib/rhashtable.c
+++ b/lib/rhashtable.c
@@ -114,6 +114,14 @@ static void bucket_table_free(const struct bucket_table *tbl)
 	kvfree(tbl);
 }
 
+static void bucket_table_free_atomic(const struct bucket_table *tbl)
+{
+	if (tbl->nest)
+		nested_bucket_table_free(tbl);
+
+	kvfree_atomic(tbl);
+}
+
 static void bucket_table_free_rcu(struct rcu_head *head)
 {
 	bucket_table_free(container_of(head, struct bucket_table, rcu));
@@ -473,7 +481,7 @@ static int rhashtable_insert_rehash(struct rhashtable *ht,
 
 	err = rhashtable_rehash_attach(ht, tbl, new_tbl);
 	if (err) {
-		bucket_table_free(new_tbl);
+		bucket_table_free_atomic(new_tbl);
 		if (err == -EEXIST)
 			err = 0;
 	} else
<snip>

--
Uladzislau Rezki
