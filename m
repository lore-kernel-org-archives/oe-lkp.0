Received: from mail-yx1-f68.google.com (mail-yx1-f68.google.com [74.125.224.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B215220687
	for <oe-lkp@lists.linux.dev>; Tue,  2 Dec 2025 17:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764695913; cv=none; b=D/Bk2TLnkWi+O5iX8q3WXJaCiZgzj4gdjQ4C3dUDy79qUNAPj6LK2emIgXTlbzkeKa4RisGpsKMDP47/DNvuD6XgjvRrcQMxOpGan+R26HDHuH0zZN1y6FdixD8S/0VaAxyrswMD732n7uCYNlf87cfe+2n7Jctwh3iRhD0ogmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764695913; c=relaxed/simple;
	bh=FNcV+fQ2FJ/6fR1xamE0UqXW+gIsszWN9DiUgsZWmgs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LEHe/pzmXVXdUPfeVSFOKYhX9H43fqcpJussEixnqvdAkiIEM3Mg3AMYqQZZNdl8zDQyh6xsqu8C52CvaEWIr02IPe0vi1cgx5hXba0W8LqYjVCEDFlEl+tzW8hcDyx+XvVp6tpj/x4CnnvgjkMK8s4yLfeDBvcncNFdfkhAQ04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NGjQbetu; arc=none smtp.client-ip=74.125.224.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NGjQbetu"
Received: by mail-yx1-f68.google.com with SMTP id 956f58d0204a3-640d4f2f13dso5544567d50.1
        for <oe-lkp@lists.linux.dev>; Tue, 02 Dec 2025 09:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764695910; x=1765300710; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tb1FFGYQqdLQ0662L1eRve12KQNukjBRWLfM48Fx3Gg=;
        b=NGjQbetuRMOeBbAiKtqM77AcVXaEiVschISKXC5JZ/3OLsbPE3ZbyEkXVYFyZ3s3Jb
         utXh8HjakytL99z7Rc+PSqJKm0+rd3+pntG2p0h3ptCMB27R7UBP47dt1/YqFQ8NITi+
         0hKG4QhPnWU/DWG+wSX7oCVGZZxMEclCpR+nQbuaXVP/pUesBEyOoANxGs/Ne/EotmfR
         DnpjPSkMOlj3T1+IZo1wqhiSVW1HiwdZn2Ksq5Im17rSPu1MZ6rhiF1Phve3pHGiPupc
         UmK2EsDN8mFK9Y3M7kk3ZPuQ5nzTDfoAhrytBEWNsQKZrDn83U1+pXcD+4P9YvP3M/WS
         dCpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764695910; x=1765300710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tb1FFGYQqdLQ0662L1eRve12KQNukjBRWLfM48Fx3Gg=;
        b=Qk910UoXURZRRp6qNt6P7SVnqtxTo9dxTt8EHNr3mYpopf/6o1+PbBQ2kpzOl41PV/
         vV+VloKA9E6BwoyMB1coySmvazpT36JwDAMbTPgz2xTL9GsGL5t6ImBp2kEgjV91vO6i
         nohYv/Q72PC2Amy6Gie2fC5M2x23qe+JD+qMnvJlqqHKl0bMr3p/8KBenmgW1/33YkBl
         cSD6QwIi4JxuUZfEGwBl/07qQpCdR6+BMBY+maZ671KrM/Kpne6OMi065YdQ7ia8EFo4
         LnGnQ4jJIWDHPdDSi9/e6WB5bTkmi8WPN1BkOnUHEjm7w9PPQntwgcV8S5f+8CFs/5IZ
         Q19Q==
X-Gm-Message-State: AOJu0Yz9893TXSSCaLMlnxSyOqu0wkPFdk5Bb4kl1WUmGn8D5s6sjAbb
	7TqXsAVAjSBCC18NdOvjdmKYrY7Bn2UvGf3oj7Y15Az8VApLnCjEpqjS
X-Gm-Gg: ASbGncsmUZPQUPlUjb5KbkK1vKvDiatPYbGvGhftTq8sPKcNaKjvAOvKSH1Jvwr6Mel
	k521EUT99SjbTO9QmToeo/0u3ly5pvGizooczWMXLjb+z5L43mtityQO3YJxjD9I0gWR/0RXce5
	RtuNet8+cVOHGSxlSSzFpdjZFeZK8reo/z1dtY7KL4aGq058b/cCcvD3caEtc2NkWYm7/zvbmu/
	0pOA3FYVfQtvzt181ukmUFnPk2B0fX2rmZT9+nZbzgObnux3MWgyhNS3bxCX81oqb97J5yLx8az
	H2I/vtdfS8buNOXw0CBc/e0GD+7lMphT6it2oGhKu50kboQ40E2kCHrPwxyk0JiQgZWtMac691A
	904IEAFhACHA/IG9tvdD5pj0sBteiJnQBwoN310S9zAml/eVZDRVdTvDStaFA8h4x+5HfgXiuTh
	o29tSSrH9ACWkLeOPreg==
X-Google-Smtp-Source: AGHT+IFHcVJzzaagDsHs40VrJpFOzNDss7CJSvNCmGQc5E9CPtHRyOOC64xPABVwREDrLH5tK2gC/g==
X-Received: by 2002:a05:690e:12c9:b0:63f:a856:5f90 with SMTP id 956f58d0204a3-64329212a6cmr21208837d50.4.1764695910441;
        Tue, 02 Dec 2025 09:18:30 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:74::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6433c484722sm6352297d50.23.2025.12.02.09.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 09:18:30 -0800 (PST)
From: Leo Martins <loemra.dev@gmail.com>
To: Oliver Sang <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev,
	lkp@intel.com,
	linux-kernel@vger.kernel.org,
	David Sterba <dsterba@suse.com>,
	linux-btrfs@vger.kernel.org
Subject: Re: [linus:master] [btrfs]  e8513c012d: addition_on#;use-after-free
Date: Tue,  2 Dec 2025 09:18:24 -0800
Message-ID: <20251202171828.805011-1-loemra.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <aS6l5hildWAimd2f@xsang-OptiPlex-9020>
References: 
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 2 Dec 2025 16:40:06 +0800 Oliver Sang <oliver.sang@intel.com> wrote:

> hi, Leo Martins,
> 
> On Mon, Dec 01, 2025 at 04:51:41PM -0800, Leo Martins wrote:
> 
> [...]
> 
> > 
> > Hello,
> > 
> > I believe I have identified the root cause of the warning.
> > However, I'm having some troubles running the reproducer as I
> > haven't setup lkp-tests yet. Could you test the patch below
> > against your reproducer to see if it fixes the issue?
> 
> we confirmed your patch fixed the issues we reported in origial report. thanks!
> 
> Tested-by: kernel test robot <oliver.sang@intel.com>

Thank you, for the help!

> 
> > 
> > ---8<---
> > 
> > [PATCH] btrfs: fix use-after-free in btrfs_get_or_create_delayed_node
> > 
> > Previously, btrfs_get_or_create_delayed_node sets the delayed_node's
> > refcount before acquiring the root->delayed_nodes lock.
> > Commit e8513c012de7 ("btrfs: implement ref_tracker for delayed_nodes")
> > moves refcount_set inside the critical section which means
> > there is no longer a memory barrier between setting the refcount and
> > setting btrfs_inode->delayed_node = node.
> > 
> > This allows btrfs_get_or_create_delayed_node to set
> > btrfs_inode->delayed_node before setting the refcount.
> > A different thread is then able to read and increase the refcount
> > of btrfs_inode->delayed_node leading to a refcounting bug and
> > a use-after-free warning.
> > 
> > The fix is to move refcount_set back to where it was to take
> > advantage of the implicit memory barrier provided by lock
> > acquisition.
> > 
> > Fixes: e8513c012de7 ("btrfs: implement ref_tracker for delayed_nodes")
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> > Closes: https://lore.kernel.org/oe-lkp/202511262228.6dda231e-lkp@intel.com
> > Signed-off-by: Leo Martins <loemra.dev@gmail.com>
> > ---
> >  fs/btrfs/delayed-inode.c | 34 ++++++++++++++++++----------------
> >  1 file changed, 18 insertions(+), 16 deletions(-)
> > 
> > diff --git a/fs/btrfs/delayed-inode.c b/fs/btrfs/delayed-inode.c
> > index 364814642a91..f61f10000e33 100644
> > --- a/fs/btrfs/delayed-inode.c
> > +++ b/fs/btrfs/delayed-inode.c
> > @@ -152,37 +152,39 @@ static struct btrfs_delayed_node *btrfs_get_or_create_delayed_node(
> >  		return ERR_PTR(-ENOMEM);
> >  	btrfs_init_delayed_node(node, root, ino);
> >  
> > +	/* Cached in the inode and can be accessed. */
> > +	refcount_set(&node->refs, 2);
> > +	btrfs_delayed_node_ref_tracker_alloc(node, tracker, GFP_ATOMIC);
> > +	btrfs_delayed_node_ref_tracker_alloc(node, &node->inode_cache_tracker, GFP_ATOMIC);
> > +
> >  	/* Allocate and reserve the slot, from now it can return a NULL from xa_load(). */
> >  	ret = xa_reserve(&root->delayed_nodes, ino, GFP_NOFS);
> > -	if (ret == -ENOMEM) {
> > -		btrfs_delayed_node_ref_tracker_dir_exit(node);
> > -		kmem_cache_free(delayed_node_cache, node);
> > -		return ERR_PTR(-ENOMEM);
> > -	}
> > +	if (ret == -ENOMEM)
> > +		goto cleanup;
> > +
> >  	xa_lock(&root->delayed_nodes);
> >  	ptr = xa_load(&root->delayed_nodes, ino);
> >  	if (ptr) {
> >  		/* Somebody inserted it, go back and read it. */
> >  		xa_unlock(&root->delayed_nodes);
> > -		btrfs_delayed_node_ref_tracker_dir_exit(node);
> > -		kmem_cache_free(delayed_node_cache, node);
> > -		node = NULL;
> > -		goto again;
> > +		goto cleanup;
> >  	}
> >  	ptr = __xa_store(&root->delayed_nodes, ino, node, GFP_ATOMIC);
> >  	ASSERT(xa_err(ptr) != -EINVAL);
> >  	ASSERT(xa_err(ptr) != -ENOMEM);
> >  	ASSERT(ptr == NULL);
> > -
> > -	/* Cached in the inode and can be accessed. */
> > -	refcount_set(&node->refs, 2);
> > -	btrfs_delayed_node_ref_tracker_alloc(node, tracker, GFP_ATOMIC);
> > -	btrfs_delayed_node_ref_tracker_alloc(node, &node->inode_cache_tracker, GFP_ATOMIC);
> > -
> > -	btrfs_inode->delayed_node = node;
> > +	WRITE_ONCE(btrfs_inode->delayed_node, node);
> >  	xa_unlock(&root->delayed_nodes);
> >  
> >  	return node;
> > +cleanup:
> > +	btrfs_delayed_node_ref_tracker_free(node, tracker);
> > +	btrfs_delayed_node_ref_tracker_free(node, &node->inode_cache_tracker);
> > +	btrfs_delayed_node_ref_tracker_dir_exit(node);
> > +	kmem_cache_free(delayed_node_cache, node);
> > +	if (ret)
> > +		return ERR_PTR(ret);
> > +	goto again;
> >  }
> >  
> >  /*
> > -- 
> > 2.47.3
