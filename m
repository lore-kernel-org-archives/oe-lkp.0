Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B464207E19
	for <oe-lkp@lists.linux.dev>; Thu, 12 Dec 2024 07:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733987412; cv=none; b=uEsDx7WG6SuLgMTxh5iWpYFiw7vhMx6g6z+xGasDuk/A0qcKtltc7KpF/+kFFNFrsMwgRkmo/Skh4GnT5OpxLIbBOEyOSNa4hNQTn3aej9f69K2jc79dVWjlG+3G89ghO7/Fl/4MGBeyu0e4s83fZpRjlpGq5hwNJ06hNvafmJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733987412; c=relaxed/simple;
	bh=ZEpkzoQHg7VjPKxwvVaVbbSYksenc7gg2QSxNhBVA2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rEZ65fLAN3GKNnI5GvEd66LqX0nmVqDdp+PtUZ8Zj21xZzM2XK1PUKt7Xf0FGOzkha4Zat2GZcyPXK3KEY59TPocL08VNQMc4pqu22YOcuE2r/WN8cnl8EYEuvVjSAzE2+17JQmZInpxJ+BN1yofDdtYtWt3xHffyC8VA12sJnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4dEa9bBD; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4dEa9bBD"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4679b5c66d0so58191cf.1
        for <oe-lkp@lists.linux.dev>; Wed, 11 Dec 2024 23:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733987410; x=1734592210; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MSwCXQ5wEcG34n6FNAmRCNPsG3IEf6YvAYA+YW6hhoo=;
        b=4dEa9bBD1L94GdsTouuzkcwyzGVLu9HgAzZ4TpHCNIDxIoagfEx0FpAGG7xPei0+S4
         YpvybA56hVlsHitN+P5ZV/uEDNXxtNtSvPP5fyatnd7wXczuztRXb2z0AGyppIc+pR3O
         dBmldYGm7udcA0cZ5nxmJnddZRQHCjagQQsMKrN0G2fXeZ36sBEJYSXaIkjoGZMFitvJ
         K6U9i++pCq9K1SLA8dRWsBz48uJ9G3KsfSbJ8BLacZzcEu1PF9SRUzixBmd7MZj06pBw
         9426koVk/JNXbclYai8zB1hZ+qW2pBMLVW0r0EIqJRvI7YOmY96dmgsYYp9MLw5sc6rI
         SoyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733987410; x=1734592210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MSwCXQ5wEcG34n6FNAmRCNPsG3IEf6YvAYA+YW6hhoo=;
        b=muczSBpLYczNj1Yqm/JF9BzQxBAuJymxzB4A7xm8bBglW/R4SC23R97BTwwNATWCqy
         1WPY/bf4KG6CeNgSojzkuS6sSRJioG0fYWXt3d30TyTudIU9v+g63C0wGpT7tmeNvbLQ
         IFFM/CbBZOSnF9Ax5+1wHixrwdATp0zqrqDy8/3F4ZKWpWaO21DMeF29mu59tsKBhuvu
         KIQjqjmaCslUZnZbhE80bvGP4RMowRd25g8HJoGtjYcThMhaLKO/xBbEGWzlibY1uEzF
         JTS10N7itdlEVAUCmRvXQ0OHPnEh9Bi/tfgiutY5iEG4KasflnJShKFQt1kbvdZpyJGs
         ViKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYMnTZg9dCtqLQPJS4F5IgOx/JjPDS1iMnO+UneEWGh5fXlNZ20oKMfY0DJoM1FpviJKKowlE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzefXdlqYrlUsgHsIaeS0HRkRGosqXEG5lOzUuuX3lSbdMKs0Xz
	EtsfgZSvd9G7JvKQkxNLn0VtGE6h2B2EC+/J3OvAb1E0tyv74Prpa9nNxbrIdM9DGpT27ZQ6apB
	+8fnIf9jR2X+o0tNXdfkRtmAiCAX57rYQy9rX
X-Gm-Gg: ASbGncuqwKdDYrqWiTre5kcl7WyVOvRQLDy2JezDWD2HZi65/oGaSlY8Tx3CbS3H+zo
	te8iY8OuDe6wui4MRCWbmHOFbMdqIVLkIZGyz7q1RkZEC5xUBr94bKmdnpYLOHW7cjnbJ
X-Google-Smtp-Source: AGHT+IEZrdSuhp9JcuQTIIQJZBkbpF0vMp40RBneVKA9c4WUVk9y6M0BTQ1rdOkrhr1FEK5rG9fO8zodIjUEBJLN8nw=
X-Received: by 2002:a05:622a:4c12:b0:466:a22a:6590 with SMTP id
 d75a77b69052e-467981bb57emr1778861cf.9.1733987409934; Wed, 11 Dec 2024
 23:10:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202412112227.df61ebb-lkp@intel.com> <20241212040104.507310-1-00107082@163.com>
In-Reply-To: <20241212040104.507310-1-00107082@163.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 11 Dec 2024 23:09:59 -0800
Message-ID: <CAJuCfpGJp-U3t_SHRhuSRTu7Hjkz23oqKSNbVL79O1OQhgJndw@mail.gmail.com>
Subject: Re: [PATCH] mm/codetag: clear tags before swap
To: David Wang <00107082@163.com>
Cc: kent.overstreet@linux.dev, yuzhao@google.com, oliver.sang@intel.com, 
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	lkp@intel.com, oe-lkp@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 11, 2024 at 8:03=E2=80=AFPM David Wang <00107082@163.com> wrote=
:
>
> When CONFIG_MEM_ALLOC_PROFILING_DEBUG is set, kernel WARN would be
> triggered when calling __alloc_tag_ref_set() during swap:
>
>         alloc_tag was not cleared (got tag for mm/filemap.c:1951)
>         WARNING: CPU: 0 PID: 816 at ./include/linux/alloc_tag.h...
>
> Clear code tags before swap can fix the warning. And this patch also fix
> a potential invalid address dereference in alloc_tag_add_check() when
> CONFIG_MEM_ALLOC_PROFILING_DEBUG is set and ref->ct is CODETAG_EMPTY,
> which is defined as ((void *)1).
^^^
Good catch!

>
> Signed-off-by: David Wang <00107082@163.com>
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Closes: https://lore.kernel.org/oe-lkp/202412112227.df61ebb-lkp@intel.com
> ---
>  include/linux/alloc_tag.h | 2 +-
>  lib/alloc_tag.c           | 4 ++++
>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/alloc_tag.h b/include/linux/alloc_tag.h
> index 7c0786bdf9af..cba024bf2db3 100644
> --- a/include/linux/alloc_tag.h
> +++ b/include/linux/alloc_tag.h
> @@ -135,7 +135,7 @@ static inline struct alloc_tag_counters alloc_tag_rea=
d(struct alloc_tag *tag)
>  #ifdef CONFIG_MEM_ALLOC_PROFILING_DEBUG
>  static inline void alloc_tag_add_check(union codetag_ref *ref, struct al=
loc_tag *tag)
>  {
> -       WARN_ONCE(ref && ref->ct,
> +       WARN_ONCE(ref && ref->ct && !is_codetag_empty(ref),
>                   "alloc_tag was not cleared (got tag for %s:%u)\n",
>                   ref->ct->filename, ref->ct->lineno);
>
> diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> index 35f7560a309a..cc5fda9901c2 100644
> --- a/lib/alloc_tag.c
> +++ b/lib/alloc_tag.c
> @@ -209,6 +209,10 @@ void pgalloc_tag_swap(struct folio *new, struct foli=
o *old)
>                 return;
>         }
>
> +       /* clear tags before swap */

The above comment states what we already know from the code but does
not explain why we do this. Better to describe the reason and not what
we do. Something like:

/*
 * Clear tag references to avoid debug warning when using
 *  __alloc_tag_ref_set() with non-empty reference.
 */

> +       set_codetag_empty(&ref_old);
> +       set_codetag_empty(&ref_new);
> +
>         /* swap tags */
>         __alloc_tag_ref_set(&ref_old, tag_new);
>         update_page_tag_ref(handle_old, &ref_old);
> --
> 2.39.2
>
>
