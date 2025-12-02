Received: from mail-yx1-f66.google.com (mail-yx1-f66.google.com [74.125.224.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBFF287503
	for <oe-lkp@lists.linux.dev>; Tue,  2 Dec 2025 17:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764695871; cv=none; b=bqxp7cyxZxQwbe2sqv7xQ6H+FsFZ5XCXyz/oPUHTYrF3yIZXqmhXGx/Oe33UtWyd8sDpE5/DXho0XsBhEZeg6M+tg/2YxHvQ8zWC0RpgDCUOOEAPB3ncEBls4BP0U+MOS7CY36zYx3t86HhK1SFbxqHZ7S+9icm1nX/+jEJXZew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764695871; c=relaxed/simple;
	bh=e37SN+aToRVyC6n1zkZmulujPisP2nXDQSMcfkqxLY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cSefNd64ZHzFTc0OxRiu2vj2muGPfUStVWu/oYvPA160XMF+gAbenSA2aX+OfTccIK1eECYV/IhQOt855yjlPsEyBbf7rN6IFioGuK/vUdyX2hQiNygu+8UprG3mutWHq0V8RBi1Mg03NbcBGogGd8AwwS10KAaxFHZPAJbiD+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZmpKT2cB; arc=none smtp.client-ip=74.125.224.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZmpKT2cB"
Received: by mail-yx1-f66.google.com with SMTP id 956f58d0204a3-640e065991dso5049299d50.3
        for <oe-lkp@lists.linux.dev>; Tue, 02 Dec 2025 09:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764695868; x=1765300668; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q8QlVTXiL4fK7xIfQtCmFRQsL7zA4OuWCxdMWpV4kkE=;
        b=ZmpKT2cB5Dh+xJ7Y2o+SjYQ+/40vcWlqH+8vhXDkE4WE0rmZXAEyrzugs5l67AuREA
         4M0Kko5eO2/Dovg6WA5WvOlNMZkfQHOi66ATCED4k0OaoxJ4DQsUlGRdvSyQx+PcxV/9
         PXQdaeQPeo14eqFmvedw9BrYEknzCMw7ryY/oQqM3mamA/WRqsaif6/sSE67TLX44hhT
         ikJy/cAo6pHM15lkrFcIeYwyAMY0SWTVeJpFgUckq+Jv5kjKJJX4WkYNRK8aGcxChgXC
         kZ3V3K6RtPrbAsP4ygF5+TyBvse3XtsgLNoo2cvQMhifpuTrJ4Kq5AysHpyVmjVxfvAM
         lYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764695868; x=1765300668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q8QlVTXiL4fK7xIfQtCmFRQsL7zA4OuWCxdMWpV4kkE=;
        b=M0Oo1iEzuu1qXRy86+QDGVdG03olcuq+Mwkenoczx7iXT1av9ZM1FddIzgKNhf4C2K
         hkYbiubQ5AMV2Zsoixj7amegs7sraAmWXTF8cMPUIloieoAGUsFPIkgew8jKAziQ0Aik
         0qSKbWTWDuTmPfE543AVhcxKW+D05mTodaEQlFfB6QgDX/qiPeIa49vr85qw7Fyvi/NF
         rX2J9ifVo367NGUx46gQszQKTLWuN7DhrnILeUF1/aEvH9l5fHSox23bHiz72OzK6s6P
         BvUwasCU79pW7r2ArzATNY26OX2LxtiVlG6bPr6mNh/hWgWzCLqJ1FSeQLCCpvtS5vER
         K8QQ==
X-Forwarded-Encrypted: i=1; AJvYcCXF03rjEg3qDJwyh2/la5t+menfDByRg7MiYsJkbqQPUamAvjFI4zHq9kl33ju36mQUqtnK5Gs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyj3tc4fHCaGRc+TfhYdgj7IUg39hOZxyIvNBHa9lTotSQLfHaQ
	1jczwcXwjJs8q7HN9Q4vO7qKbQbZtQj6WcKZg84qsUulLBNuvUuwf2Ds
X-Gm-Gg: ASbGncvokOFs+cR7+1z3kspH0qJo4FWhPGsvlYQbO/218zT5VE1QW2692gmS6iKRTQU
	gmqU1CdlLmQBmxvHNZlRKKIsAFZGEOID0LLUgmBNvKWYLf++dWrRCL/elXPrX447FG5CNUViVOV
	dz95S2MWafLAF8U4q9x4DWqv7P8Kz70ByH8TAUhwCzf+MbEPsIHgegZZqXU5zT1zhsZk49cdI5i
	Z6Z6BDZ8KIgFjS3be/SsLk7X9XUm7I614vjT73FjQfdsCOLPlLG56WC6NX0FWzEvjmXT4HeKe4C
	ZIJ8hVMAHxLVwNJnryJIswx98JeM4xreJzjG9ZkrXnDb2PanKbU2ASFpoB63RSlymJrM1IxU5NL
	CKbOqRk0zr3F0SNi5Vq8lw6Ilscz5c3wuAXJtmSYfXBJl3/wnXwNb7L45+E40OegqXXA/FTxU2J
	bw50jbGWZlf58pHbsL
X-Google-Smtp-Source: AGHT+IHdKu4hpE/8f2eE+4lPs0EO9wbGhycCa+sCjZHw1sF1sCEgg+Iae1BCxPfWRTEdAx3ecTHilw==
X-Received: by 2002:a53:c052:0:20b0:640:d0d4:526d with SMTP id 956f58d0204a3-64302a2dc80mr25410432d50.9.1764695867800;
        Tue, 02 Dec 2025 09:17:47 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:1::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78ad0d82295sm64124477b3.25.2025.12.02.09.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 09:17:47 -0800 (PST)
From: Leo Martins <loemra.dev@gmail.com>
To: Filipe Manana <fdmanana@kernel.org>
Cc: Oliver Sang <oliver.sang@intel.com>,
	oe-lkp@lists.linux.dev,
	lkp@intel.com,
	linux-kernel@vger.kernel.org,
	David Sterba <dsterba@suse.com>,
	linux-btrfs@vger.kernel.org
Subject: Re: [linus:master] [btrfs] e8513c012d: addition_on#;use-after-free
Date: Tue,  2 Dec 2025 09:17:40 -0800
Message-ID: <20251202171745.798946-1-loemra.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CAL3q7H5L2Yc3aNCfffuimET6LLup9iB2T4_1caJkgV+c8avRMg@mail.gmail.com>
References: 
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 2 Dec 2025 15:04:51 +0000 Filipe Manana <fdmanana@kernel.org> wrote:

> On Tue, Dec 2, 2025 at 8:40 AM Oliver Sang <oliver.sang@intel.com> wrote:
> >
> > hi, Leo Martins,
> >
> > On Mon, Dec 01, 2025 at 04:51:41PM -0800, Leo Martins wrote:
> >
> > [...]
> >
> > >
> > > Hello,
> > >
> > > I believe I have identified the root cause of the warning.
> > > However, I'm having some troubles running the reproducer as I
> > > haven't setup lkp-tests yet. Could you test the patch below
> > > against your reproducer to see if it fixes the issue?
> >
> > we confirmed your patch fixed the issues we reported in origial report. thanks!
> >
> > Tested-by: kernel test robot <oliver.sang@intel.com>
> >
> > >
> > > ---8<---
> > >
> > > [PATCH] btrfs: fix use-after-free in btrfs_get_or_create_delayed_node
> > >
> > > Previously, btrfs_get_or_create_delayed_node sets the delayed_node's
> > > refcount before acquiring the root->delayed_nodes lock.
> > > Commit e8513c012de7 ("btrfs: implement ref_tracker for delayed_nodes")
> > > moves refcount_set inside the critical section which means
> > > there is no longer a memory barrier between setting the refcount and
> > > setting btrfs_inode->delayed_node = node.
> > >
> > > This allows btrfs_get_or_create_delayed_node to set
> > > btrfs_inode->delayed_node before setting the refcount.
> > > A different thread is then able to read and increase the refcount
> > > of btrfs_inode->delayed_node leading to a refcounting bug and
> > > a use-after-free warning.
> > >
> > > The fix is to move refcount_set back to where it was to take
> > > advantage of the implicit memory barrier provided by lock
> > > acquisition.
> > >
> > > Fixes: e8513c012de7 ("btrfs: implement ref_tracker for delayed_nodes")
> > > Reported-by: kernel test robot <oliver.sang@intel.com>
> > > Closes: https://lore.kernel.org/oe-lkp/202511262228.6dda231e-lkp@intel.com
> > > Signed-off-by: Leo Martins <loemra.dev@gmail.com>
> > > ---
> > >  fs/btrfs/delayed-inode.c | 34 ++++++++++++++++++----------------
> > >  1 file changed, 18 insertions(+), 16 deletions(-)
> > >
> > > diff --git a/fs/btrfs/delayed-inode.c b/fs/btrfs/delayed-inode.c
> > > index 364814642a91..f61f10000e33 100644
> > > --- a/fs/btrfs/delayed-inode.c
> > > +++ b/fs/btrfs/delayed-inode.c
> > > @@ -152,37 +152,39 @@ static struct btrfs_delayed_node *btrfs_get_or_create_delayed_node(
> > >               return ERR_PTR(-ENOMEM);
> > >       btrfs_init_delayed_node(node, root, ino);
> > >
> > > +     /* Cached in the inode and can be accessed. */
> > > +     refcount_set(&node->refs, 2);
> > > +     btrfs_delayed_node_ref_tracker_alloc(node, tracker, GFP_ATOMIC);
> > > +     btrfs_delayed_node_ref_tracker_alloc(node, &node->inode_cache_tracker, GFP_ATOMIC);
> > > +
> > >       /* Allocate and reserve the slot, from now it can return a NULL from xa_load(). */
> > >       ret = xa_reserve(&root->delayed_nodes, ino, GFP_NOFS);
> > > -     if (ret == -ENOMEM) {
> > > -             btrfs_delayed_node_ref_tracker_dir_exit(node);
> > > -             kmem_cache_free(delayed_node_cache, node);
> > > -             return ERR_PTR(-ENOMEM);
> > > -     }
> > > +     if (ret == -ENOMEM)
> > > +             goto cleanup;
> > > +
> > >       xa_lock(&root->delayed_nodes);
> > >       ptr = xa_load(&root->delayed_nodes, ino);
> > >       if (ptr) {
> > >               /* Somebody inserted it, go back and read it. */
> > >               xa_unlock(&root->delayed_nodes);
> > > -             btrfs_delayed_node_ref_tracker_dir_exit(node);
> > > -             kmem_cache_free(delayed_node_cache, node);
> > > -             node = NULL;
> > > -             goto again;
> > > +             goto cleanup;
> > >       }
> > >       ptr = __xa_store(&root->delayed_nodes, ino, node, GFP_ATOMIC);
> > >       ASSERT(xa_err(ptr) != -EINVAL);
> > >       ASSERT(xa_err(ptr) != -ENOMEM);
> > >       ASSERT(ptr == NULL);
> > > -
> > > -     /* Cached in the inode and can be accessed. */
> > > -     refcount_set(&node->refs, 2);
> > > -     btrfs_delayed_node_ref_tracker_alloc(node, tracker, GFP_ATOMIC);
> > > -     btrfs_delayed_node_ref_tracker_alloc(node, &node->inode_cache_tracker, GFP_ATOMIC);
> > > -
> > > -     btrfs_inode->delayed_node = node;
> > > +     WRITE_ONCE(btrfs_inode->delayed_node, node);
> 
> Why the WRITE_ONCE() change?

Since there are lockless readers of btrfs_inode->delayed_node all writers
should be marked with WRITE_ONCE to force the compiler to store atomically.

>
> Can you explain in the changelog why it's being introduced?
> This seems unrelated and it was not there before the commit mentioned
> in the Fixes tag.

I'll send out a v2 without the WRITE_ONCE since it is not directly related
to this bug and send out a separate patch updating writes to use WRITE_ONCE.

Thanks.

> 
> Thanks.
> 
> > >       xa_unlock(&root->delayed_nodes);
> > >
> > >       return node;
> > > +cleanup:
> > > +     btrfs_delayed_node_ref_tracker_free(node, tracker);
> > > +     btrfs_delayed_node_ref_tracker_free(node, &node->inode_cache_tracker);
> > > +     btrfs_delayed_node_ref_tracker_dir_exit(node);
> > > +     kmem_cache_free(delayed_node_cache, node);
> > > +     if (ret)
> > > +             return ERR_PTR(ret);
> > > +     goto again;
> > >  }
> > >
> > >  /*
> > > --
> > > 2.47.3
> >

