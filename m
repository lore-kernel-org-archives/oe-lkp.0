Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F9C192D8A
	for <oe-lkp@lists.linux.dev>; Mon, 27 Apr 2026 14:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777299483; cv=none; b=rTUJBIPho3x6vzW79l04wtWOsHmwWvRkeUSJHr6robTcX8/Keu3zcSp0tbN0GGJWOUMTW8L39RsvInEWTVag9Ng5lpXigc6LOyGHUtsIUgAC9VL0JgUkL/zOgf1rDFlIkX9yxgnYF7WQ+2OY0FeE134y0Za07Pnf5X3RD/Z7ymM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777299483; c=relaxed/simple;
	bh=pccIFs8gbnLaWcqx/J101/+WzDBcCOVQX4oHLQ5wp/M=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F8sio/gReuzzbCEIGv12vfuQ+PXB2hNhV/q/NDKrKTzcSJDatpWRq2MhLfp0COa5XJqv6jP6EbMH9BKpXjftX+psFMw1+XaMT91QtS/5HKjqfpF2grfn1jcjc5dFYHvArhzau11wjCVeEx+CPPfdBHSDqiL9kxL7kul5Kww2hwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jGww/HOm; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jGww/HOm"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a40b2d26a1so7798013e87.0
        for <oe-lkp@lists.linux.dev>; Mon, 27 Apr 2026 07:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777299480; x=1777904280; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0GsBaM19ELVt+4ypSoInGGnTn5j87p2XHaAospCoRwY=;
        b=jGww/HOmS6ZVR1E9gang0RgAehA2tCn/keMl5eam7BNpurBS7I4+gWuxn9gJOEnFLf
         XyQQTSZdpK8H+KF/TAUuMqQ0GmEFmGqEPUfxNJYVOz36GYxy4QPk6MbqOODn+PWy4iu0
         uJhYZGOZwDivJu4qYwxSZsx9VDf8fxzf5igzw6/ROFron2rw62OGWdU/cDuTAiDIGGEn
         edxlNQINiJJBHwQr0X8YJ1djt6UIHzTHJK/fcT5hPuqxjvxBRA9qELdPwpQDWoFtzOEy
         JNg3IS47Dbo79vPEpwuQ5s3bVoYbvF/C4uDFBh7XWd2pd6GueoZ9aTmhwfP/qE5VkzpX
         RO5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777299480; x=1777904280;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0GsBaM19ELVt+4ypSoInGGnTn5j87p2XHaAospCoRwY=;
        b=eypykRnKlgb1UI7+JUb57EG4cZv49tq89f8gBpV8RKURcOABXPerhzmXaBuEMOFxcU
         a16NznGKts72M/B0K0itcqH7d5jfoY2SSPlxa5Zs+ajCMzAKoo5Ota75yV3tAh5w66XT
         JcVfPvxWrTkxnktAhlovpjkjg+QrSsVG9vymDHD7sEWt2zjb9X/eARFg2mr2jp6d2ZRJ
         4dT3PVIwXMQYtn+gp+/pQRi8PobcjlqxhtabWlbAz7cZ60mK6HlvHI7BkOQoM7Y8PTPk
         SNYqrzqlILB87NyNzg2G7INqNHDlH1Oz62F44PTvba4JKqDoF4JjqH4HqMhktGxG26zW
         CUhg==
X-Forwarded-Encrypted: i=1; AFNElJ/GZ3QR/jC1b6gGFYvIKqdg1WPxkxGHY+K6awGLVmYZV1JzjyQ4z4G+8gD9U1NBDBJ8hY27TTQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywfz7UrzGQxT+dm/6vFVy0tOE6unJbTlgaJb2GB4SzM3jJxWdIw
	RMeQJMZGXrn++ybbu3dlRhgZZnaTeXmoDKnnvBuXKDSifH0q8XY95yrI
X-Gm-Gg: AeBDievICxFE25izq8Pt9HVH9N+6x5IEwB5aNbQz9nPX8EcXTiHuGZ1ifbNqGCdbr2x
	27n9CDc9jDRirU5x6veC+yuXEf+psYcbFLNOn8O3fuwI4MlF6dF3xjDsean+1zPRP/ZxE0N/hBr
	f5nqXQjHM5khGHLiTygNfMDqNPVeksQYRzd4jc7OidlAGjnu00IjA58m/xd67vBZsjcdTwJQ2Gv
	2qn2I3WlXuX+jzhS/0JN+2Le1Rxy4Qf+O7ID/YA3bWMF1IgxyF2CBVoOdI2w/DbK13WVTFAyXiF
	VmG4xqDfC2+gdSqQRsOZ1C9Q9ctdc5UQJcvPm3IadE1KCoHZxkzJQ+E7qNb18RooFJ1hMibHHMl
	Fz2Uhe8GcmUA1ovey8i/h/69aFGuAjggyn2ctEfTPIzvnLVCbuARboFPB0QK1njtMGPUqXYxAZK
	DTEQGnJ86xNg==
X-Received: by 2002:a05:6512:3ba6:b0:5a3:ff60:b72e with SMTP id 2adb3069b0e04-5a4172eac66mr13248322e87.39.1777299479648;
        Mon, 27 Apr 2026 07:17:59 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185c88adsm8464965e87.35.2026.04.27.07.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 07:17:59 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Mon, 27 Apr 2026 16:17:57 +0200
To: Vlastimil Babka <vbabka@suse.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Uladzislau Rezki <urezki@gmail.com>,
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
Message-ID: <ae9wFZp7dS8QF8br@milan>
References: <202604211323.fac1b29e-lkp@intel.com>
 <aedvSnhOGM_mauYP@milan>
 <aehdcxC14ycvY481@gondor.apana.org.au>
 <aeh2Ii9CxtgfsX_p@milan>
 <aeh_2WwIb8nAIcy2@gondor.apana.org.au>
 <aeiHkG7X_dieMdw5@milan>
 <aemTW8yiAe6y1tsQ@gondor.apana.org.au>
 <4e269fb1-cd6c-46ca-ac2a-168ce9fd06fe@suse.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e269fb1-cd6c-46ca-ac2a-168ce9fd06fe@suse.com>

On Mon, Apr 27, 2026 at 10:53:52AM +0200, Vlastimil Babka wrote:
> On 4/23/26 05:34, Herbert Xu wrote:
> > On Wed, Apr 22, 2026 at 10:32:16AM +0200, Uladzislau Rezki wrote:
> >>
> >> We have added non-sleeping flags for vmalloc() to extend kvmalloc()
> >> functionality as folk need those.
> >>  
> >> Another option, would be: always use vfree_atomic() from the kvfree()
> >> path.
> >>  
> >> Any thoughts?
> > 
> > Perhaps add a kvfree_atomic that just calls vfree_atomic?
> 
> kvfree()'s comment says
> 
> " * Context: Either preemptible task context or not-NMI interrupt."
> 
I am not sure the description clearly reflects the intended usage.
To me it sounds like all contexts but excluding NMI.

For example, calling this under spin_lock() will be invalid, as
the vfree() path may invoke cond_resched().

> so this is neither. It might be ok then to create kvfree_atomic(). Always
> using vfree_atomic() from kvfree() might be wasteful.
> 
> > For rhashtable it really makes no difference either way.  But it
> > would eliminate the unsightly call to is_vmalloc_addr in rhashtable.
> > 
Seems atomic version makes sense here:

<snip>
diff --git a/include/linux/slab.h b/include/linux/slab.h
index 15a60b501b95..2b5ab488e96b 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -1234,6 +1234,9 @@ void *kvrealloc_node_align_noprof(const void *p, size_t size, unsigned long alig
 extern void kvfree(const void *addr);
 DEFINE_FREE(kvfree, void *, if (!IS_ERR_OR_NULL(_T)) kvfree(_T))
 
+extern void kvfree_atomic(const void *addr);
+DEFINE_FREE(kvfree_atomic, void *, if (!IS_ERR_OR_NULL(_T)) kvfree_atomic(_T))
+
 extern void kvfree_sensitive(const void *addr, size_t len);
 
 unsigned int kmem_cache_size(struct kmem_cache *s);
diff --git a/mm/slub.c b/mm/slub.c
index 2b2d33cc735c..e25a0eab6ff7 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -6802,6 +6802,22 @@ void kvfree(const void *addr)
 }
 EXPORT_SYMBOL(kvfree);
 
+/**
+ * kvfree_atomic() - Free memory.
+ * @addr: Pointer to allocated memory.
+ *
+ * Same as kvfree(), but safe to use in atomic contexts.
+ * Must not be called from NMI context.
+ */
+void kvfree_atomic(const void *addr)
+{
+	if (is_vmalloc_addr(addr))
+		vfree_atomic(addr);
+	else
+		kfree(addr);
+}
+EXPORT_SYMBOL(kvfree_atomic);
+
 /**
  * kvfree_sensitive - Free a data object containing sensitive information.
  * @addr: address of the data object to be freed.
<snip>

I can post it if no objections.

--
Uladzislau Rezki
