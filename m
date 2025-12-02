Received: from mail-yx1-f68.google.com (mail-yx1-f68.google.com [74.125.224.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAF12882C5
	for <oe-lkp@lists.linux.dev>; Tue,  2 Dec 2025 21:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764709417; cv=none; b=R1THNQT6A0PbmafLpc1Up1o6t9YdTfd4nhhfi6LbPKKvB1Tv/Jxyy5RLQZHhyuy16WG4QtoJ5iqrNmfV6HJh1nQGgjnfoCwUVTRnngTZHdJmj7l9k+2vjH1j7Td4M9W/VAXvRLDp8p8CIfTq2EhvPJU7lD7VlZfVYb+57E6w40E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764709417; c=relaxed/simple;
	bh=nsE1dcVItFIrKkgY5iEvi5+Y+OLRs1VB0cezp8E3BWA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LPJaCOpFMFhOaPL8XRsNxw+XykaNHVBABrpmxO3R3BFsan+NrKtv66zX2MrWdilhzsXWPfIps7j1HhMyf73cRD1tzMVcvHCTbuw47atXP8ZcNYW2aACTPoggBNst1PArZpftZ3YiDOjjDf1fN5I3YiUmfAiykVqciTFVW4GRgiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HfXhBs9I; arc=none smtp.client-ip=74.125.224.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HfXhBs9I"
Received: by mail-yx1-f68.google.com with SMTP id 956f58d0204a3-640c9c85255so7777022d50.3
        for <oe-lkp@lists.linux.dev>; Tue, 02 Dec 2025 13:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764709414; x=1765314214; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qHqo10RPrXoBjpQijgSJaVgvodoRgdMooXQI8Kn+rbo=;
        b=HfXhBs9IZRZagHyjbWTb99kKVsc388nclpWMav1tw1Q2H64eVd74KOcEgaTjXLzCm5
         g/yNO3eJv/C3O2hcWNoUAaoW+rusEexQyX/HofpAOcdS/9gMwZqQ880ouziRmIBRbwZN
         5ohVEAZndOFlZ4nmXX0iu64q6ojhZbvUNVVuCga3Z+TE5o1/JUHDXHAwJt2zMkCsFU41
         UKLcVAA69aZzlN8imT/2VAQcoJqEAjjh1LcYoT9r66lxreiGh4qRZHgy9MyMw8Hoto21
         zjY+BNT9tnpChiMQcBO942o7wy8WSvvBFNPzF30/z0//w4ieNqppu9aDHQOdXqTsn4c+
         ogBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764709414; x=1765314214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qHqo10RPrXoBjpQijgSJaVgvodoRgdMooXQI8Kn+rbo=;
        b=hxldJK1reUhVdRsu/HAh91RBDT+6FR1VcOWAVaVIgichN4kNYTEL5GyT9TaUC3s7kS
         i4VnrB6TE842vGfxJw1jqXlklL6N5kZYA2AeOb2IN3qU/0lWQcHaj3rayiZEASiskLbo
         M7RkINj7nvfvHHkjHFegEswDMKmJeQ0f2jyUBr1kzVFCauF9MVquWdMlnQUcaaJPRLFo
         G/50P7c5oXjHFd7shqWt/qfRLO2SJMc0ureRIh4Q2ApjPMw6qQXMPSaztn7cw1RoAsa5
         Lgek5R28dQqLisj4kxCZ1TC5D/e4Urygk5pOaj1oCF8H8TwDwrcvYk2wuAS8nyg6kfNq
         Rjhg==
X-Forwarded-Encrypted: i=1; AJvYcCUzHEBUBcuuMUvC9UTPENa6CJsr6SJpRGkWQbwd/8Fb0J6UKWiU2a0Sr6MLmaSecn3x6iisEhU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzSFZ/B0UEElQ4l+6GYnFUhmNlZhNmkmZHBgly16q2OevpyIWmL
	mqZ/D0zAPz1hC7IXEDZ6NQHI/C7jHKRFK3EGhQJzG3y8ZcJ9H5LwPHLJ
X-Gm-Gg: ASbGncsO8pmkt5ReNA4b1kv2ftO2Xcn7vihoAS6JJskugb/dwr843+WAf76k8J0wyiT
	cTNYgOqH1jPowkwLIG5LOlD2cums3aucR9UrGFWWLuMTVRhqrwYOcYNMDyIF9rWIDt2adsy3Px0
	MDFyjQ5d12O2/416mUkgVzH3yvPokN8C5ZpbMNfgJKEXu2cad/orrmav9olr03mCbQb2j9LqFJS
	/xWARLupa4H6sck0ozAOVnryKXC9BHepD9RRipmZKBhsFBWTcLi+4ioEdNmCOzfz9Axsf1/0eze
	K/ccwo22egAiXxXFcYViP745/5cCyEhEvL9Ba1ZwjbulkVMpho7jggpsoob1vW8q+GvaWBJGaRu
	4EDA5tBIYGadydN/tNFw93mj9+y/qCkVdtv3ZMU6IBDPsW+XgoiD7ImBDbXtyjaQD9oE0W7Lu+P
	CdnKpmX/rdTqsSmwWiEA==
X-Google-Smtp-Source: AGHT+IEyRfhMsBmjvsOtgMQ3MW/jmJCsdUgV3EbIDt1I1mGrcnMfQfROj52ogueWWJwWVhxsmp5c7Q==
X-Received: by 2002:a05:690e:1909:b0:63f:860f:feda with SMTP id 956f58d0204a3-644370439d3mr114471d50.63.1764709414045;
        Tue, 02 Dec 2025 13:03:34 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:42::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78ad0d3f5f3sm66735887b3.8.2025.12.02.13.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 13:03:33 -0800 (PST)
From: Leo Martins <loemra.dev@gmail.com>
To: Filipe Manana <fdmanana@kernel.org>
Cc: Oliver Sang <oliver.sang@intel.com>,
	oe-lkp@lists.linux.dev,
	lkp@intel.com,
	linux-kernel@vger.kernel.org,
	David Sterba <dsterba@suse.com>,
	linux-btrfs@vger.kernel.org
Subject: Re: [linus:master] [btrfs] e8513c012d: addition_on#;use-after-free
Date: Tue,  2 Dec 2025 13:03:25 -0800
Message-ID: <20251202210330.2705156-1-loemra.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CAL3q7H6q-j8Xo_SHGyY0+pHj=BQHezTwxbP9VKQxgLruqxQdow@mail.gmail.com>
References: 
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 2 Dec 2025 19:19:05 +0000 Filipe Manana <fdmanana@kernel.org> wrote:

> On Tue, Dec 2, 2025 at 5:17 PM Leo Martins <loemra.dev@gmail.com> wrote:
> >
> > On Tue, 2 Dec 2025 15:04:51 +0000 Filipe Manana <fdmanana@kernel.org> wrote:
> >
> > > On Tue, Dec 2, 2025 at 8:40 AM Oliver Sang <oliver.sang@intel.com> wrote:
> > > >
> > > > hi, Leo Martins,
> > > >
> > > > On Mon, Dec 01, 2025 at 04:51:41PM -0800, Leo Martins wrote:
> > > >
> > > > [...]
> > > >
> > > > >
> > > > > Hello,
> > > > >
> > > > > I believe I have identified the root cause of the warning.
> > > > > However, I'm having some troubles running the reproducer as I
> > > > > haven't setup lkp-tests yet. Could you test the patch below
> > > > > against your reproducer to see if it fixes the issue?
> > > >
> > > > we confirmed your patch fixed the issues we reported in origial report. thanks!
> > > >
> > > > Tested-by: kernel test robot <oliver.sang@intel.com>
> > > >
> > > > >
> > > > > ---8<---
> > > > >
> > > > > [PATCH] btrfs: fix use-after-free in btrfs_get_or_create_delayed_node
> > > > >
> > > > > Previously, btrfs_get_or_create_delayed_node sets the delayed_node's
> > > > > refcount before acquiring the root->delayed_nodes lock.
> > > > > Commit e8513c012de7 ("btrfs: implement ref_tracker for delayed_nodes")
> > > > > moves refcount_set inside the critical section which means
> > > > > there is no longer a memory barrier between setting the refcount and
> > > > > setting btrfs_inode->delayed_node = node.
> > > > >
> > > > > This allows btrfs_get_or_create_delayed_node to set
> > > > > btrfs_inode->delayed_node before setting the refcount.
> > > > > A different thread is then able to read and increase the refcount
> > > > > of btrfs_inode->delayed_node leading to a refcounting bug and
> > > > > a use-after-free warning.
> > > > >
> > > > > The fix is to move refcount_set back to where it was to take
> > > > > advantage of the implicit memory barrier provided by lock
> > > > > acquisition.
> > > > >
> > > > > Fixes: e8513c012de7 ("btrfs: implement ref_tracker for delayed_nodes")
> > > > > Reported-by: kernel test robot <oliver.sang@intel.com>
> > > > > Closes: https://lore.kernel.org/oe-lkp/202511262228.6dda231e-lkp@intel.com
> > > > > Signed-off-by: Leo Martins <loemra.dev@gmail.com>
> > > > > ---
> > > > >  fs/btrfs/delayed-inode.c | 34 ++++++++++++++++++----------------
> > > > >  1 file changed, 18 insertions(+), 16 deletions(-)
> > > > >
> > > > > diff --git a/fs/btrfs/delayed-inode.c b/fs/btrfs/delayed-inode.c
> > > > > index 364814642a91..f61f10000e33 100644
> > > > > --- a/fs/btrfs/delayed-inode.c
> > > > > +++ b/fs/btrfs/delayed-inode.c
> > > > > @@ -152,37 +152,39 @@ static struct btrfs_delayed_node *btrfs_get_or_create_delayed_node(
> > > > >               return ERR_PTR(-ENOMEM);
> > > > >       btrfs_init_delayed_node(node, root, ino);
> > > > >
> > > > > +     /* Cached in the inode and can be accessed. */
> > > > > +     refcount_set(&node->refs, 2);
> > > > > +     btrfs_delayed_node_ref_tracker_alloc(node, tracker, GFP_ATOMIC);
> > > > > +     btrfs_delayed_node_ref_tracker_alloc(node, &node->inode_cache_tracker, GFP_ATOMIC);
> > > > > +
> > > > >       /* Allocate and reserve the slot, from now it can return a NULL from xa_load(). */
> > > > >       ret = xa_reserve(&root->delayed_nodes, ino, GFP_NOFS);
> > > > > -     if (ret == -ENOMEM) {
> > > > > -             btrfs_delayed_node_ref_tracker_dir_exit(node);
> > > > > -             kmem_cache_free(delayed_node_cache, node);
> > > > > -             return ERR_PTR(-ENOMEM);
> > > > > -     }
> > > > > +     if (ret == -ENOMEM)
> > > > > +             goto cleanup;
> > > > > +
> > > > >       xa_lock(&root->delayed_nodes);
> > > > >       ptr = xa_load(&root->delayed_nodes, ino);
> > > > >       if (ptr) {
> > > > >               /* Somebody inserted it, go back and read it. */
> > > > >               xa_unlock(&root->delayed_nodes);
> > > > > -             btrfs_delayed_node_ref_tracker_dir_exit(node);
> > > > > -             kmem_cache_free(delayed_node_cache, node);
> > > > > -             node = NULL;
> > > > > -             goto again;
> > > > > +             goto cleanup;
> > > > >       }
> > > > >       ptr = __xa_store(&root->delayed_nodes, ino, node, GFP_ATOMIC);
> > > > >       ASSERT(xa_err(ptr) != -EINVAL);
> > > > >       ASSERT(xa_err(ptr) != -ENOMEM);
> > > > >       ASSERT(ptr == NULL);
> > > > > -
> > > > > -     /* Cached in the inode and can be accessed. */
> > > > > -     refcount_set(&node->refs, 2);
> > > > > -     btrfs_delayed_node_ref_tracker_alloc(node, tracker, GFP_ATOMIC);
> > > > > -     btrfs_delayed_node_ref_tracker_alloc(node, &node->inode_cache_tracker, GFP_ATOMIC);
> > > > > -
> > > > > -     btrfs_inode->delayed_node = node;
> > > > > +     WRITE_ONCE(btrfs_inode->delayed_node, node);
> > >
> > > Why the WRITE_ONCE() change?
> >
> > Since there are lockless readers of btrfs_inode->delayed_node all writers
> > should be marked with WRITE_ONCE to force the compiler to store atomically.
> 
> If by atomically you mean to avoid store/load tearing, then using the
> _ONCE() macros won't do anything because we are dealing with pointers.
> This has been discussed in the past, see:
> 
> https://lore.kernel.org/linux-btrfs/cover.1715951291.git.fdmanana@suse.com/

That is what I meant. Missed that discussion, thanks for the link.
I do still see some value in using WRITE_ONCE which is for the human
reader to realize that there are lockless readers, but that's pretty
minor.
> 
> >
> > >
> > > Can you explain in the changelog why it's being introduced?
> > > This seems unrelated and it was not there before the commit mentioned
> > > in the Fixes tag.
> >
> > I'll send out a v2 without the WRITE_ONCE since it is not directly related
> > to this bug and send out a separate patch updating writes to use WRITE_ONCE.
> >
> > Thanks.
> >
> > >
> > > Thanks.
> > >
> > > > >       xa_unlock(&root->delayed_nodes);
> > > > >
> > > > >       return node;
> > > > > +cleanup:
> > > > > +     btrfs_delayed_node_ref_tracker_free(node, tracker);
> > > > > +     btrfs_delayed_node_ref_tracker_free(node, &node->inode_cache_tracker);
> > > > > +     btrfs_delayed_node_ref_tracker_dir_exit(node);
> > > > > +     kmem_cache_free(delayed_node_cache, node);
> > > > > +     if (ret)
> > > > > +             return ERR_PTR(ret);
> > > > > +     goto again;
> > > > >  }
> > > > >
> > > > >  /*
> > > > > --
> > > > > 2.47.3
> > > >
> >
